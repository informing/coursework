import java.io.*;
import java.net.*;

public class CSftp {

	/* Prints out the input/output as required */
	public static void echo(String content, boolean sentByClient) {
		if (sentByClient) {
			System.out.println("--> " + content);
		} else {
			System.out.println("<-- " + content);
		}
	}

	/* Read from Control Socket until it reaches the end */
	public static String readFromControlSocket(BufferedReader in) throws IOException {
		String output = null;
		while ((output = in.readLine()) != null) {
			echo(output, false);
			if (output.startsWith("1")) {
				continue;
			} else if (output.charAt(3) == ' ' && output.charAt(0) != ' ') {
				return output;
			}
			/* if (output.startsWith("211 ")) {
				return 0;
			} else if (output.startsWith("50")) {
				return -1;
			} */
		}
		return output;
	}

	public static void writeToFile(Socket dataSocket, String filename) {
		FileOutputStream fout;
		try {
			fout = new FileOutputStream(filename);
		} catch (FileNotFoundException e) {
			System.err.printf("0x38E Access to local file %s denied.\n", filename);
			return;
		}
		try {
			DataInputStream is = new DataInputStream(dataSocket.getInputStream());
			byte[] b = new byte[2048];
			int length = is.read(b, 0, 2048);
			while (length != -1) {
				fout.write(b, 0, length);
				length = is.read(b, 0, 2048);
			}
			is.close();
			fout.close();
		} catch (IOException e) {
			System.err.println("0x3A7 Data transfer connection I/O error, closing data connection.");
			return;
		}
	}

	/* Match the number of expected arguments in the user input */
	public static boolean matchNoArgs(String input, int number) {
		if (input.split(" ").length != number) {
			System.err.println("0x002 Incorrect number of arguments.");
			return false;
		}
		return true;
	}

	/* Match the command in the user input */
	public static boolean matchCommand(String input, String command) {
		if (input.split(" ")[0].equals(command)) {
			return true;
		}
		System.err.println("0x001 Invalid command.");
		return false;
	}
	
	public static Socket connectToDataSocket(String output) {
		Socket dataSocket = null;
		String dataHostName = computeHostName(output);
		int dataPortNumber = computePortNumber(output);
		int timeout = 10000;
		InetSocketAddress dsAddr = new InetSocketAddress(dataHostName, dataPortNumber);
		try {
			dataSocket = new Socket();
			dataSocket.connect(dsAddr, timeout);
			// dataSocket.setSoTimeout(timeout);
		} catch (IOException e) {
			System.err.printf("0x3A2 Data transfer connection to %s on port %d failed to open.\n", dataHostName, dataPortNumber);
			// e.printStackTrace();
		}
		return dataSocket;
	}
	
	public static String matchNoArgsAndGetParam(String input) {
		if (input.split(" ").length == 2) {
			// System.err.println("name " + input.split(" ")[1]);
			return input.split(" ")[1];
		}
		if (input.charAt(input.length() - 1) == '"') {
			// System.err.println("name " + input.substring(input.indexOf(' ') + 1));
			return input.substring(input.indexOf(' ') + 1);
		} else {
			System.err.println("0x002 Incorrect number of arguments.");
			return null;
		}
	}
	
	public static String computeHostName(String output) {
		String[] items = output.substring(output.indexOf('(') + 1, output.indexOf(')')).split(",");
		return items[0] + "." + items[1] + "." + items[2] + "." + items[3];
	}
	
	public static int computePortNumber(String output) {
		String[] items = output.substring(output.indexOf('(') + 1, output.indexOf(')')).split(",");
		return 256 * Integer.parseInt(items[4]) + Integer.parseInt(items[5]);
	}

	public static void main(String[] args) {
		String hostName = "";
		int portNumber = 21;
		int timeout = 20000;
		Socket ctrlSocket = new Socket();
		
		if (args.length > 2 || args.length == 0) {
			System.err.println("Usage: CSftp <host name> <port number>");
			System.exit(1);
		} else {
			hostName = args[0];
			portNumber = Integer.parseInt(args[1]);
		}

		try {
			InetSocketAddress addr = new InetSocketAddress(hostName, portNumber);
			ctrlSocket.connect(addr, timeout);
			// ctrlSocket.setSoTimeout(timeout);
			
			PrintWriter out = new PrintWriter(ctrlSocket.getOutputStream(), true);
			BufferedReader in = new BufferedReader(
				new InputStreamReader(ctrlSocket.getInputStream()));

			// Connection established message	
			String output = in.readLine();
			echo(output, false);

			BufferedReader stdIn = new BufferedReader(new InputStreamReader(System.in));
			String input = "";

			while (true) {
				System.out.print("csftp> ");
				
				try {
					input = stdIn.readLine();
				} catch (IOException e) {
					System.err.println("0xFFFE Input error while reading commands, terminating.");
					System.exit(-1);
				}

				if (input.charAt(0) == '#') {
					continue;
				} else if (input.startsWith("features")) {
					if (!matchCommand(input, "features")) continue;
					if (matchNoArgs(input, 1) == false) continue;
					
					echo("FEAT\r", true);
					out.println("FEAT\r");
					
					readFromControlSocket( in );
				} else if (input.startsWith("user")) {
					String username;
					if (!matchCommand(input, "user")) continue;
					if (matchNoArgs(input, 2) == false) continue;
					username = input.split(" ")[1];
					
					echo("USER " + username + "\r", true);
					out.println("USER " + username + "\r");
					
					output = in.readLine();
					echo(output, false);
				} else if (input.startsWith("get")) {
					String filename = matchNoArgsAndGetParam(input);
					if (!matchCommand(input, "get")) continue;
					if (filename == null) continue;
					
					Socket dataSocket = null;

					out.println("PASV\r");
					echo("PASV\r", true);
					
					// Get response from the remote server
					output = in.readLine();
					echo(output, false);
					
					if (output.startsWith("227")) {
						// PASV succeeds
						dataSocket = connectToDataSocket(output);
						
						out.println("RETR " + filename + "\r");
						echo("RETR " + filename + "\r", true);

						output = readFromControlSocket(in);
						
						// Only write to file if the remote file exists
						if (output.startsWith("2")) {
							writeToFile(dataSocket, filename);
						}

						dataSocket.close();

					} else {
						System.err.println("0xFFFF Processing error. PASV failed.");
					}
				} else if (input.startsWith("cd")) {
					String directory = matchNoArgsAndGetParam(input);
					if (!matchCommand(input, "cd")) continue;
					if (directory == null) continue;
					
					out.println("CWD " + directory + "\r");
					echo("CWD " + directory + "\r", true);
					readFromControlSocket( in );
				} else if (input.startsWith("pw")) {
					if (!matchCommand(input, "pw")) continue;
					if (matchNoArgs(input, 2) == false) continue;
					
					String password = input.split(" ")[1];
					out.println("PASS " + password + "\r");
					echo("PASS " + password + "\r", true);

					output = in.readLine();
					echo(output, false);
				} else if (input.startsWith("dir")) {
					if (matchNoArgs(input, 1) == false) continue;
					if (!matchCommand(input, "dir")) continue;

					Socket dataSocket = null;
					
					out.println("PASV\r");
					echo("PASV\r", true);
					
					output = in.readLine();
					echo(output, false);
					
					if (output.startsWith("227")) {
						dataSocket = connectToDataSocket(output);
						
						out.println("LIST\r");
						echo("LIST\r", true);
						
						output = in.readLine();
						echo(output, false);

						DataInputStream is = new DataInputStream(dataSocket.getInputStream());
						BufferedReader br = new BufferedReader(new InputStreamReader(is));
						while ((output = br.readLine()) != null) {
							echo(output, false);
						}

						output = in.readLine();
						echo(output, false);

						dataSocket.close();
						is.close();
					} else {
						System.err.println("0xFFFF Processing error. PASV failed.");
						// System.err.println(output);
					}
				} else if (input.startsWith("quit")) {
					if (matchNoArgs(input, 1) == false) continue;
					if (!matchCommand(input, "quit")) continue;
					
					out.println("QUIT\r");
					echo("QUIT\r", true);

					// Bye message
					output = in.readLine();
					echo(output, false);

					ctrlSocket.close();
					out.close(); 
					in.close();
					System.exit(0);
				} else {
					System.err.println("0x001 Invalid command.");
				}
			}
		} catch (UnknownHostException e) {
			System.err.printf("0xFFFC Control connection to %s on port %s failed to open.\n", args[0], portNumber);
			System.exit(-1);
		} catch (SocketTimeoutException e) {
			System.err.printf("0xFFFC Control connection to %s on port %s failed to open.\n", args[0], portNumber);
			System.exit(-1);
		} catch (IOException e) {
			// e.printStackTrace();
			System.err.println("0xFFFD Control connection I/O error, closing control connection.");
		}
	}
}
