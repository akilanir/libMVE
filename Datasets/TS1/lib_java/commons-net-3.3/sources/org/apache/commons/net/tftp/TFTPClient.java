package org.apache.commons.net.tftp;

import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import org.apache.commons.net.io.FromNetASCIIOutputStream;
import org.apache.commons.net.io.ToNetASCIIInputStream;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/tftp/TFTPClient.class */
public class TFTPClient extends TFTP {
    public static final int DEFAULT_MAX_TIMEOUTS = 5;
    private int __maxTimeouts = 5;

    public void setMaxTimeouts(int numTimeouts) {
        if (numTimeouts < 1) {
            this.__maxTimeouts = 1;
        } else {
            this.__maxTimeouts = numTimeouts;
        }
    }

    public int getMaxTimeouts() {
        return this.__maxTimeouts;
    }

    public int receiveFile(String filename, int mode, OutputStream output, InetAddress host, int port) throws IOException {
        TFTPPacket received;
        TFTPAckPacket ack = new TFTPAckPacket(host, port, 0);
        beginBufferedOps();
        int bytesRead = 0;
        int hostPort = 0;
        int lastBlock = 0;
        int dataLength = 0;
        int block = 1;
        if (mode == 0) {
            output = new FromNetASCIIOutputStream(output);
        }
        TFTPPacket sent = new TFTPReadRequestPacket(host, port, filename, mode);
        do {
            bufferedSend(sent);
            while (true) {
                try {
                    received = bufferedReceive();
                    if (lastBlock == 0) {
                        hostPort = received.getPort();
                        ack.setPort(hostPort);
                        if (!host.equals(received.getAddress())) {
                            host = received.getAddress();
                            ack.setAddress(host);
                            sent.setAddress(host);
                        }
                    }
                    if (host.equals(received.getAddress()) && received.getPort() == hostPort) {
                        switch (received.getType()) {
                            case 3:
                                TFTPDataPacket data = (TFTPDataPacket) received;
                                dataLength = data.getDataLength();
                                lastBlock = data.getBlockNumber();
                                if (lastBlock == block) {
                                    try {
                                        output.write(data.getData(), data.getDataOffset(), dataLength);
                                        block++;
                                        if (block > 65535) {
                                            block = 0;
                                        }
                                        ack.setBlockNumber(lastBlock);
                                        sent = ack;
                                        bytesRead += dataLength;
                                        break;
                                    } catch (IOException e) {
                                        bufferedSend(new TFTPErrorPacket(host, hostPort, 3, "File write failed."));
                                        endBufferedOps();
                                        throw e;
                                    }
                                } else {
                                    discardPackets();
                                    if (lastBlock == (block == 0 ? 65535 : block - 1)) {
                                        break;
                                    }
                                }
                            case 5:
                                TFTPErrorPacket error = (TFTPErrorPacket) received;
                                endBufferedOps();
                                throw new IOException("Error code " + error.getError() + " received: " + error.getMessage());
                            default:
                                endBufferedOps();
                                throw new IOException("Received unexpected packet type.");
                        }
                    }
                } catch (InterruptedIOException e2) {
                    int timeouts = 0 + 1;
                    if (timeouts >= this.__maxTimeouts) {
                        endBufferedOps();
                        throw new IOException("Connection timed out.");
                    }
                } catch (SocketException e3) {
                    int timeouts2 = 0 + 1;
                    if (timeouts2 >= this.__maxTimeouts) {
                        endBufferedOps();
                        throw new IOException("Connection timed out.");
                    }
                } catch (TFTPPacketException e4) {
                    endBufferedOps();
                    throw new IOException("Bad packet: " + e4.getMessage());
                }
            }
            bufferedSend(new TFTPErrorPacket(received.getAddress(), received.getPort(), 5, "Unexpected host or port."));
        } while (dataLength == 512);
        bufferedSend(sent);
        endBufferedOps();
        return bytesRead;
    }

    public int receiveFile(String filename, int mode, OutputStream output, String hostname, int port) throws UnknownHostException, IOException {
        return receiveFile(filename, mode, output, InetAddress.getByName(hostname), port);
    }

    public int receiveFile(String filename, int mode, OutputStream output, InetAddress host) throws IOException {
        return receiveFile(filename, mode, output, host, 69);
    }

    public int receiveFile(String filename, int mode, OutputStream output, String hostname) throws UnknownHostException, IOException {
        return receiveFile(filename, mode, output, InetAddress.getByName(hostname), 69);
    }

    public void sendFile(String filename, int mode, InputStream input, InetAddress host, int port) throws IOException {
        TFTPPacket received;
        int bytesRead;
        TFTPDataPacket data = new TFTPDataPacket(host, port, 0, this._sendBuffer, 4, 0);
        boolean justStarted = true;
        beginBufferedOps();
        int totalThisPacket = 0;
        int hostPort = 0;
        int block = 0;
        boolean lastAckWait = false;
        if (mode == 0) {
            input = new ToNetASCIIInputStream(input);
        }
        TFTPPacket sent = new TFTPWriteRequestPacket(host, port, filename, mode);
        while (true) {
            bufferedSend(sent);
            while (true) {
                try {
                    received = bufferedReceive();
                    if (justStarted) {
                        justStarted = false;
                        hostPort = received.getPort();
                        data.setPort(hostPort);
                        if (!host.equals(received.getAddress())) {
                            host = received.getAddress();
                            data.setAddress(host);
                            sent.setAddress(host);
                        }
                    }
                    if (host.equals(received.getAddress()) && received.getPort() == hostPort) {
                        switch (received.getType()) {
                            case 4:
                                TFTPAckPacket ack = (TFTPAckPacket) received;
                                int lastBlock = ack.getBlockNumber();
                                if (lastBlock == block) {
                                    block++;
                                    if (block > 65535) {
                                        block = 0;
                                    }
                                    if (!lastAckWait) {
                                        int dataLength = 512;
                                        int offset = 4;
                                        int i = 0;
                                        while (true) {
                                            totalThisPacket = i;
                                            if (dataLength > 0 && (bytesRead = input.read(this._sendBuffer, offset, dataLength)) > 0) {
                                                offset += bytesRead;
                                                dataLength -= bytesRead;
                                                i = totalThisPacket + bytesRead;
                                            }
                                        }
                                        if (totalThisPacket < 512) {
                                            lastAckWait = true;
                                        }
                                        data.setBlockNumber(block);
                                        data.setData(this._sendBuffer, 4, totalThisPacket);
                                        sent = data;
                                        break;
                                    } else {
                                        break;
                                    }
                                } else {
                                    discardPackets();
                                }
                                break;
                            case 5:
                                TFTPErrorPacket error = (TFTPErrorPacket) received;
                                endBufferedOps();
                                throw new IOException("Error code " + error.getError() + " received: " + error.getMessage());
                            default:
                                endBufferedOps();
                                throw new IOException("Received unexpected packet type.");
                        }
                    }
                } catch (InterruptedIOException e) {
                    int timeouts = 0 + 1;
                    if (timeouts >= this.__maxTimeouts) {
                        endBufferedOps();
                        throw new IOException("Connection timed out.");
                    }
                } catch (SocketException e2) {
                    int timeouts2 = 0 + 1;
                    if (timeouts2 >= this.__maxTimeouts) {
                        endBufferedOps();
                        throw new IOException("Connection timed out.");
                    }
                } catch (TFTPPacketException e3) {
                    endBufferedOps();
                    throw new IOException("Bad packet: " + e3.getMessage());
                }
            }
            bufferedSend(new TFTPErrorPacket(received.getAddress(), received.getPort(), 5, "Unexpected host or port."));
            if (totalThisPacket > 0 || lastAckWait) {
            }
        }
        endBufferedOps();
    }

    public void sendFile(String filename, int mode, InputStream input, String hostname, int port) throws UnknownHostException, IOException {
        sendFile(filename, mode, input, InetAddress.getByName(hostname), port);
    }

    public void sendFile(String filename, int mode, InputStream input, InetAddress host) throws IOException {
        sendFile(filename, mode, input, host, 69);
    }

    public void sendFile(String filename, int mode, InputStream input, String hostname) throws UnknownHostException, IOException {
        sendFile(filename, mode, input, InetAddress.getByName(hostname), 69);
    }
}
