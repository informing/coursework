package ca.ubc.cs.cs317.dnslookup;

import java.io.Console;
import java.net.DatagramSocket;
import java.net.DatagramPacket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.net.InetSocketAddress;
import java.util.*;
import java.nio.ByteBuffer;
import java.io.IOException;

public class DNSLookupService {

    private static final int DEFAULT_DNS_PORT = 53;
    private static final int MAX_INDIRECTION_LEVEL = 10;

    private final static char[] hexArray = "0123456789ABCDEF".toCharArray();

    private static InetAddress rootServer;
    private static boolean verboseTracing = false;
    private static DatagramSocket socket;

    private static DNSCache cache = DNSCache.getInstance();

    private static Random random = new Random();


    public static short getUnsignedByte(ByteBuffer bb) {
        return ((short) (bb.get() & 0xff));
    }

    public static void putUnsignedByte(ByteBuffer bb, int value) {
        bb.put((byte) (value & 0xff));
    }

    public static short getUnsignedByte(ByteBuffer bb, int position) {
        return ((short) (bb.get(position) & (short) 0xff));
    }

    public static void putUnsignedByte(ByteBuffer bb, int position, int value) {
        bb.put(position, (byte) (value & 0xff));
    }

    public static int getUnsignedShort(ByteBuffer bb) {
        return (bb.getShort() & 0xffff);
    }

    public static void putUnsignedShort(ByteBuffer bb, int value) {
        bb.putShort((short) (value & 0xffff));
    }

    public static int getUnsignedShort(ByteBuffer bb, int position) {
        return (bb.getShort(position) & 0xffff);
    }

    public static void putUnsignedShort(ByteBuffer bb, int position, int value) {
        bb.putShort(position, (short) (value & 0xffff));
    }

    public static long getUnsignedInt(ByteBuffer bb) {
        return ((long) bb.getInt() & 0xffffffffL);
    }

    public static long getUnsignedInt(ByteBuffer bb, int position) {
        return ((long) bb.getInt(position) & 0xffffffffL);
    }

    /**
     * Main function, called when program is first invoked.
     *
     * @param args list of arguments specified in the command line.
     */
    public static void main(String[] args) {

        if (args.length != 1) {
            System.err.println("Invalid call. Usage:");
            System.err.println("\tjava -jar DNSLookupService.jar rootServer");
            System.err.println("where rootServer is the IP address (in dotted form) of the root DNS server to start the search at.");
            System.exit(1);
        }

        try {
            rootServer = InetAddress.getByName(args[0]);
            System.out.println("Root DNS server is: " + rootServer.getHostAddress());
        } catch (UnknownHostException e) {
            System.err.println("Invalid root server (" + e.getMessage() + ").");
            System.exit(1);
        }

        try {
            socket = new DatagramSocket();
            socket.setSoTimeout(5000);
        } catch (SocketException ex) {
            ex.printStackTrace();
            System.exit(1);
        }

        Scanner in = new Scanner(System.in);
        Console console = System.console();
        do {
            // Use console if one is available, or standard input if not.
            String commandLine;
            if (console != null) {
                System.out.print("DNSLOOKUP> ");
                commandLine = console.readLine();
            } else
                try {
                    commandLine = in.nextLine();
                } catch (NoSuchElementException ex) {
                    break;
                }
            // If reached end-of-file, leave
            if (commandLine == null) break;

            // Ignore leading/trailing spaces and anything beyond a comment character
            commandLine = commandLine.trim().split("#", 2)[0];

            // If no command shown, skip to next command
            if (commandLine.trim().isEmpty()) continue;

            String[] commandArgs = commandLine.split(" ");

            if (commandArgs[0].equalsIgnoreCase("quit") ||
                    commandArgs[0].equalsIgnoreCase("exit"))
                break;
            else if (commandArgs[0].equalsIgnoreCase("server")) {
                // SERVER: Change root nameserver
                if (commandArgs.length == 2) {
                    try {
                        rootServer = InetAddress.getByName(commandArgs[1]);
                        System.out.println("Root DNS server is now: " + rootServer.getHostAddress());
                    } catch (UnknownHostException e) {
                        System.out.println("Invalid root server (" + e.getMessage() + ").");
                        continue;
                    }
                } else {
                    System.out.println("Invalid call. Format:\n\tserver IP");
                    continue;
                }
            } else if (commandArgs[0].equalsIgnoreCase("trace")) {
                // TRACE: Turn trace setting on or off
                if (commandArgs.length == 2) {
                    if (commandArgs[1].equalsIgnoreCase("on"))
                        verboseTracing = true;
                    else if (commandArgs[1].equalsIgnoreCase("off"))
                        verboseTracing = false;
                    else {
                        System.err.println("Invalid call. Format:\n\ttrace on|off");
                        continue;
                    }
                    System.out.println("Verbose tracing is now: " + (verboseTracing ? "ON" : "OFF"));
                } else {
                    System.err.println("Invalid call. Format:\n\ttrace on|off");
                    continue;
                }
            } else if (commandArgs[0].equalsIgnoreCase("lookup") ||
                    commandArgs[0].equalsIgnoreCase("l")) {
                // LOOKUP: Find and print all results associated to a name.
                RecordType type;
                if (commandArgs.length == 2)
                    type = RecordType.A;
                else if (commandArgs.length == 3)
                    try {
                        type = RecordType.valueOf(commandArgs[2].toUpperCase());
                    } catch (IllegalArgumentException ex) {
                        System.err.println("Invalid query type. Must be one of:\n\tA, AAAA, NS, MX, CNAME");
                        continue;
                    }
                else {
                    System.err.println("Invalid call. Format:\n\tlookup hostName [type]");
                    continue;
                }
                findAndPrintResults(commandArgs[1], type);
            } else if (commandArgs[0].equalsIgnoreCase("dump")) {
                // DUMP: Print all results still cached
                cache.forEachNode(DNSLookupService::printResults);
            } else {
                System.err.println("Invalid command. Valid commands are:");
                System.err.println("\tlookup fqdn [type]");
                System.err.println("\ttrace on|off");
                System.err.println("\tserver IP");
                System.err.println("\tdump");
                System.err.println("\tquit");
                continue;
            }

        } while (true);

        socket.close();
        System.out.println("Goodbye!");
    }

    /**
     * Finds all results for a host name and type and prints them on the standard output.
     *
     * @param hostName Fully qualified domain name of the host being searched.
     * @param type     Record type for search.
     */
    private static void findAndPrintResults(String hostName, RecordType type) {

        DNSNode node = new DNSNode(hostName, type);
        printResults(node, getResults(node, 0));
    }

    /**
     * Finds all the result for a specific node.
     *
     * @param node             Host and record type to be used for search.
     * @param indirectionLevel Control to limit the number of recursive calls due to CNAME redirection.
     *                         The initial call should be made with 0 (zero), while recursive calls for
     *                         regarding CNAME results should increment this value by 1. Once this value
     *                         reaches MAX_INDIRECTION_LEVEL, the function prints an error message and
     *                         returns an empty set.
     * @return A set of resource records corresponding to the specific query requested.
     */
    private static Set<ResourceRecord> getResults(DNSNode node, int indirectionLevel) {

        if (indirectionLevel > MAX_INDIRECTION_LEVEL) {
            System.err.println("Maximum number of indirection levels reached.");
            return Collections.emptySet();
        }

        Set<ResourceRecord> cached = cache.getCachedResults(node);
        if (cached != null && !cached.isEmpty()) {
            return cached;
        }

        retrieveResultsFromServer(node, rootServer);

        // If looking up the Nameservers doesn't solve the problem check the CNAME servers
        if (cache.getCachedResults(node).size() == 0) {
            for (ResourceRecord rr : cache.getCachedResults(new DNSNode(node.getHostName(), RecordType.CNAME))) {
                // System.out.println("checking cname...." + rr.getTextResult());
                String chostname = rr.getTextResult();
                if (chostname.charAt(chostname.length()-1) == '.')
                    chostname = chostname.substring(0, chostname.length()-1);
                Set<ResourceRecord> cnames = getResults(new DNSNode(chostname, node.getType()), indirectionLevel+1);
                for (ResourceRecord cname : cnames) {
                    ResourceRecord cr = new ResourceRecord("error", RecordType.OTHER, 1000, "cr might not have been initialized");
                    switch (cname.getType()) {
                        case A:
                            cr = new ResourceRecord(node.getHostName(), cname.getType(), cname.getTTL(), cname.getInetResult());
                            break;
                        case NS:
                            cr = new ResourceRecord(node.getHostName(), cname.getType(), cname.getTTL(), cname.getTextResult());
                            break;
                        case CNAME:
                            // System.out.println("Encountered cname when querying cname");
                            cr = new ResourceRecord(node.getHostName(), cname.getType(), cname.getTTL(), cname.getTextResult());
                            break;
                        case SOA:
                            cr = new ResourceRecord(node.getHostName(), cname.getType(), cname.getTTL(), cname.getTextResult());
                            // System.out.println("Encountered SOA");
                            break;
                        case MX:
                            cr = new ResourceRecord(node.getHostName(), cname.getType(), cname.getTTL(), cname.getTextResult());
                            break;
                        case AAAA:
                            cr = new ResourceRecord(node.getHostName(), cname.getType(), cname.getTTL(), cname.getInetResult());
                            break;
                        case OTHER:
                            break;
                    }
                    cache.addResult(cr);
                }
            }

        }

        return cache.getCachedResults(node);
    }

    private static byte set_byte(byte src, int pos, byte value) {
        if (value == 1)
            return (byte) (src | (1 << pos));
        return src;
    }

    private static byte set_byte_multiple(byte src, int pos, byte value, byte fullset) {
        int nextbit = fullset;
        while (nextbit != 0) {
            if ((value & fullset) == 1) {
                src = (byte) (src | (1 << pos));
            }
            nextbit = nextbit >> 1;
            pos += 1;
        }
        return src;
    }

    private static String dereference(byte[] start, int index) {
        String readable = "";
        int interval = start[index];
        while (interval != 0) {
            if ((interval & 0b11000000) != 0) {
                int nextIndex = interval & 0b111111;
                nextIndex = (nextIndex << 8) | start[index + 1];

                readable += dereference(start, nextIndex);
                break;
            }
            for (int j = 1; j <= interval; j += 1) {
                readable += ((char) start[index + j]);
            }
            index = index + interval + 1;
            interval = start[index];
            if (interval != 0) readable += ".";
        }
        return readable;
    }

    private static String loadFQDN(ByteBuffer domainName) {
        String readable = "";
        int interval = getUnsignedByte(domainName);
        while (interval != 0) {
            if ((interval & 0b11000000) != 0) {
                int index = interval & 0b111111;
                // System.out.println("interval" + interval);
                index = (index << 8) | getUnsignedByte(domainName);
                // System.out.println("index" + index);
                readable += dereference(domainName.array(), index);
                break;
            }
            for (int i = 0; i < interval; i += 1) {
                readable += ((char) domainName.get());
                // System.out.println(readable);
            }
            interval = getUnsignedByte(domainName);
            // System.out.println("new interval: " + interval);
            readable += ".";
        }
        return readable;
    }

    private static ByteBuffer dumpFQDN(String domainName) {
        int fromIndex = 0, index = domainName.indexOf('.', fromIndex);
        ByteBuffer b = ByteBuffer.allocate(domainName.length() + 2);
        while (index != -1) {
            putUnsignedByte(b, index - fromIndex);
            for (int i = fromIndex; i < index; i += 1) {
                //b.put((byte) domainName.charAt(i));
                putUnsignedByte(b, domainName.charAt(i));
            }
            fromIndex = index + 1;
            index = domainName.indexOf('.', fromIndex);
        }
        putUnsignedByte(b, domainName.length() - fromIndex);
        for (int i = fromIndex; i < domainName.length(); i += 1) {
            putUnsignedByte(b, domainName.charAt(i));
        }
        b.put((byte) 0);
        // System.out.println(bytesToHex(b.array()));
        return b;
    }

    public static String bytesToHex(byte[] bytes) {
        char[] hexChars = new char[bytes.length * 2];
        for (int j = 0; j < bytes.length; j++) {
            int v = bytes[j] & 0xFF;
            hexChars[j * 2] = hexArray[v >>> 4];
            hexChars[j * 2 + 1] = hexArray[v & 0x0F];
        }
        return new String(hexChars);
    }

    /**
     * Retrieves DNS results from a specified DNS server. Queries are sent in iterative mode,
     * and the query is repeated with a new server if the provided one is non-authoritative.
     * Results are stored in the cache.
     *
     * @param node   Host name and record type to be used for the query.
     * @param server Address of the server to be used for the query.
     */
    private static void retrieveResultsFromServer(DNSNode node, InetAddress server) {
        final byte QR = 0, OPCODE = 1, AA = 2, TC = 3, RD = 4;
        final byte RA = 0, Z = 1, RCODE = 4;
        final byte IS_QUERY = 0, IS_RESPONSE = 1;
        final byte QUERY = 0, IQUERY = 1, STATUS = 2;

        // TODO To be completed by the student

        // Header
        int id = random.nextInt(65535);
        ByteBuffer header = ByteBuffer.allocate(12);
        putUnsignedShort(header, id);
        byte code_field_a = 0, code_field_b = 0;
        set_byte(code_field_a, QR, IS_QUERY);
        set_byte_multiple(code_field_a, OPCODE, QUERY, (byte) (1 << 4));
        // Authoritative Answer - valid in responses
        set_byte(code_field_a, AA, (byte) 0);
        // TrunCation - valid in responses
        set_byte(code_field_a, TC, (byte) 0);
        set_byte(code_field_a, RD, (byte) 0);
        header.put(code_field_a);

        // Z (reserved for future use) and Response code
        // - first three bits must be zero
        // - last four bits are not to be filled here
        set_byte(code_field_b, RA, (byte) 0);
        header.put(code_field_b);

        // QDCOUNT
        header.putShort((short) 1);
        // ANCOUNT, NSCOUNT & ARCOUNT
        header.putShort((short) 0);
        header.putShort((short) 0);
        header.putShort((short) 0);
        // End of header

        ByteBuffer label = dumpFQDN(node.getHostName());
        ByteBuffer question = ByteBuffer.allocate(header.array().length + label.array().length + 4);
        question.put(header.array());

        // QLABEL
        question.put(label.array());
        // QTYPE
        putUnsignedShort(question, node.getType().getCode());
        // QCLASS = IN (1)
        putUnsignedShort(question, 1);

        try {
            socket.connect(new InetSocketAddress(server, 53));
            DatagramPacket sent = new DatagramPacket(question.array(), question.array().length,
                    new InetSocketAddress(server, 53));
            DatagramPacket recv = new DatagramPacket(new byte[1024], 1024);
            if (verboseTracing) {
                System.out.println("\n");
                if (node == null) System.out.println("node null");
                if (server == null) System.out.println("server null");
                System.out.printf("Query ID     %d %s  %s ---> %s\n", id, node.getHostName(),
                        node.getType(), server.getHostAddress());
            }
            socket.send(sent);
            socket.receive(recv);

            byte[] raw = recv.getData();
            ByteBuffer resp = ByteBuffer.wrap(raw);

            int transaction_id = getUnsignedShort(resp);
            while (id != transaction_id) {
                // Read the transaction ID in the response and compare it with the ID sent in the query
                // If different, ignore it and repeat the receive call to wait for another response
                socket.receive(recv);
                raw = recv.getData();
                resp = ByteBuffer.wrap(raw);
                transaction_id = getUnsignedShort(resp);
            }

            code_field_a = resp.get();
            code_field_b = resp.get();
            boolean qr = ((code_field_a & 0b10000000) != 0);
            byte opcode = (byte) ((code_field_a >> 3) & 0b1111);
            boolean aa = ((code_field_a & 0b100) != 0);
            boolean tc = ((code_field_a & 0b10) != 0);
            boolean rd = ((code_field_a & 0b1) != 0);

            boolean ra = ((code_field_b >> 7) != 0);
            byte z = (byte) ((code_field_b >> 4) & 0b111);
            short rcode = (short) (code_field_b & 0b1111);

            if (rcode == 3) {
                // Error return: the name server reports a value of 3 in the RCODE
                // System.err.println("error rcode=3");
                return;
            } else if (rcode == 5) {
                // Error return: getting a 5 back in the RCODE
                return;
            }

            int[] counts = new int[4];
            for (int i = 0; i < counts.length; i += 1) {
                counts[i] = getUnsignedShort(resp);
            }

            if (rcode == 0 && counts[1] == 0) {
                // Error return: authoritative response but no answer in the answer field
                // typically occurs when the name exists but there is no corresponding matching IP address
                return;
            }

            if (verboseTracing) {
                System.out.printf("Response ID: %d Authoritative = ", transaction_id);
                if (aa == true) {
                    System.out.println("true\n");
                } else {
                    System.out.println("false\n");
                }
            }

            for (int j = 0; j < counts[0]; j += 1) {
                String qname = loadFQDN(resp);
                int qtype = getUnsignedShort(resp);
                int qclass = getUnsignedShort(resp);
            }
            // end of question section

            for (int i = 1; i < counts.length; i += 1) {
                if (verboseTracing) {
                    if (i == 1) System.out.printf("  Answers (%d)\n", counts[i]);
                    else if (i == 2) System.out.printf("  Nameservers (%d)\n", counts[i]);
                    else if (i == 3) System.out.printf("  Additional Information (%d)\n", counts[i]);
                }
                for (int j = 0; j < counts[i]; j += 1) {
                    String rrname = loadFQDN(resp);
                    // System.out.println("rrname " + rrname);
                    int rrtype = getUnsignedShort(resp);
                    int rrclass = getUnsignedShort(resp);
                    long rrttl = getUnsignedInt(resp);
                    int rdlength = getUnsignedShort(resp);

                    RecordType type = RecordType.getByCode(rrtype);
                    ResourceRecord record;
                    String textResult;
                    InetAddress inetResult;
                    switch (type) {
                        case A:
                            byte[] v4address = new byte[4];
                            resp.get(v4address);
                            try {
                                inetResult = InetAddress.getByAddress(v4address);
                                record = new ResourceRecord(rrname, type, rrttl, inetResult);
                                if (verboseTracing) {
                                    verbosePrintResourceRecord(record, rrtype);
                                }
                                cache.addResult(record);
                            } catch (UnknownHostException e) {
                                // error
                            }
                            break;
                        case NS:
                            textResult = loadFQDN(resp);
                            record = new ResourceRecord(rrname, type, rrttl, textResult);
                            if (verboseTracing) {
                                verbosePrintResourceRecord(record, rrtype);
                            }
                            cache.addResult(record);
                            break;
                        case CNAME:
                            textResult = loadFQDN(resp);
                            record = new ResourceRecord(rrname, type, rrttl, textResult);
                            if (verboseTracing) {
                                verbosePrintResourceRecord(record, rrtype);
                            }
                            cache.addResult(record);
                            break;
                        case SOA:
                            String mname = loadFQDN(resp);
                            String rname = loadFQDN(resp);
                            long serial = getUnsignedInt(resp);
                            long refresh = getUnsignedInt(resp);
                            long retry = getUnsignedInt(resp);
                            long expire = getUnsignedInt(resp);
                            record = new ResourceRecord(rrname, type, rrttl, mname);
                            if (verboseTracing) {
                                verbosePrintResourceRecord(record, rrtype);
                            }
                            cache.addResult(record);
                            break;
                        case MX:
                            short preference = resp.getShort();
                            textResult = loadFQDN(resp);
                            record = new ResourceRecord(rrname, type, rrttl, textResult);
                            cache.addResult(record);
                            if (verboseTracing) {
                                verbosePrintResourceRecord(record, rrtype);
                            }
                            break;
                        case AAAA:
                            byte[] v6address = new byte[16];
                            resp.get(v6address);
                            try {
                                inetResult = InetAddress.getByAddress(v6address);
                                record = new ResourceRecord(rrname, type, rrttl, inetResult);
                                cache.addResult(record);
                                if (verboseTracing) {
                                    verbosePrintResourceRecord(record, rrtype);
                                }
                            } catch (UnknownHostException e) {
                                System.out.println("UnknownHostException");
                                e.printStackTrace();
                                // error
                            }
                            break;
                        case OTHER:
                            break;
                    }
                }
            }

            if (aa == false) {
                // not authoritative
                String nsname = node.getHostName();
                Set<ResourceRecord> nameservers = cache.getCachedResults(new DNSNode(nsname, RecordType.NS));
                while (nsname.indexOf('.') != -1) {
                    nsname = nsname.substring(nsname.indexOf('.') + 1);
                    if (!nameservers.isEmpty()) break;
                    nameservers = cache.getCachedResults(new DNSNode(nsname, RecordType.NS));
                    // System.out.println("query "+nsname);
                }
                if (!nameservers.isEmpty()) {
                    ResourceRecord first = (ResourceRecord) nameservers.toArray()[0];
                    // Assume we are using A rather than AAAA
                    // is the address in the cache?
                    String nextLookup = first.getTextResult();
                    if (nextLookup.charAt(nextLookup.length() - 1) == '.') {
                        nextLookup = nextLookup.substring(0, nextLookup.length()-1);
                    }
                    // System.out.println("selected first nameserver " + first.getTextResult());
                    Set<ResourceRecord> nsaddrs = cache.getCachedResults(new DNSNode(first.getTextResult(), RecordType.A));
                    if (nsaddrs.isEmpty()) {
                        // then its address should be in the additional information
                        retrieveResultsFromServer(new DNSNode(nextLookup, RecordType.A), rootServer);
                        nsaddrs = cache.getCachedResults(new DNSNode(nextLookup, RecordType.A));
                    }
                    if (!nsaddrs.isEmpty()) {
                        // use the result as a nameserver to repeat the original query (recursively)
                        ResourceRecord partner = (ResourceRecord) nsaddrs.toArray()[0];
                        // System.out.println(".. with ip addr" + partner.getInetResult());
                        retrieveResultsFromServer(node, partner.getInetResult());
                    } else {
                        // return an error
                        // System.err.println("error: addrs' empty");
                    }
                }
                return;
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SocketTimeoutException ste) {
            // Error return: the lookup times out
            // ste.printStackTrace();
            return;
        }
    }

    private static void verbosePrintResourceRecord(ResourceRecord record, int rtype) {
        if (verboseTracing)
            System.out.format("       %-30s %-10d %-4s %s\n", record.getHostName(),
                    record.getTTL(),
                    record.getType() == RecordType.OTHER ? rtype : record.getType(),
                    record.getTextResult());
    }

    /**
     * Prints the result of a DNS query.
     *
     * @param node    Host name and record type used for the query.
     * @param results Set of results to be printed for the node.
     */
    private static void printResults(DNSNode node, Set<ResourceRecord> results) {
        if (results.isEmpty())
            System.out.printf("%-30s %-5s %-8d %s\n", node.getHostName(),
                    node.getType(), -1, "0.0.0.0");
        for (ResourceRecord record : results) {
            System.out.printf("%-30s %-5s %-8d %s\n", node.getHostName(),
                    node.getType(), record.getTTL(), record.getTextResult());
        }
    }
}
