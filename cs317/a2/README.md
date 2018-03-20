# A DNS client application using UDP and written in Java

A2 is a Scaled Down Domain Name System (DNS) Resolver Client. It interacts with various DNS servers to resolve domain names (e.g. www.cs.ubc.ca) into IP addresses. Depending upon the commands provided it cab resolve names to either IPV4 or IPV6 addresses.

# Features
It can:
  - Resolve multiple IP addresses for a single name
  - Extract useful information from A, CNAME, NS, MX, SOA and AAAA (IPV6 address) record types
  - Trace all the queries made by the client
  - Handle various error returns (NXDOMAIN etc.)
  - Use caching to reduce the number of lookups 

### Installation

A2 requires [Java SE Development Kit](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) to compile.

Use the below command to invoke the client. Replace the rootDNS with the IP address (in dotted notation) of the DNS server you want to start your search at. It may or may not be a root DNS server.

```sh
$ java -jar DNSLookupService.jar rootDNS
```

### Commands

The program accepts the following five commands:
- `quit`: Quits the program. The command exit also executes the same thing.
- `server servername`: Changes the DNS server to start future searches.
- `trace on|off`: Turns verbose tracing on or off. If tracing is on, the program must print a trace of all the queries made and responses received before printing any result.
- `lookup hostname [type]`: Looks up a specific host name (with an optional record type, default A) and prints the resulting IP address. The result may be obtained from a local cache, in which case no tracing is printed.
- `dump`: Prints all currently cached host names and records.

### Examples
| Domain Name | Explanation |
| ------------ | ---------- |
| www.cs.ubc.ca | just an ordinary request |
| blueberry.ubc.ca | no such host |
| prep.ai.mit.edu | an alias for ftp.gnu.org |
| finance.google.ca | lots of CNAMEs for both the host and name servers|

