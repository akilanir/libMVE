package com.google.android.exoplayer.upstream;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.MulticastSocket;
import java.net.SocketException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/upstream/UdpDataSource.class */
public final class UdpDataSource implements UriDataSource {
    public static final int DEFAULT_MAX_PACKET_SIZE = 2000;
    public static final int DEAFULT_SOCKET_TIMEOUT_MILLIS = 8000;
    private final TransferListener listener;
    private final DatagramPacket packet;
    private final int socketTimeoutMillis;
    private DataSpec dataSpec;
    private DatagramSocket socket;
    private MulticastSocket multicastSocket;
    private InetAddress address;
    private InetSocketAddress socketAddress;
    private boolean opened;
    private byte[] packetBuffer;
    private int packetRemaining;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/upstream/UdpDataSource$UdpDataSourceException.class */
    public static final class UdpDataSourceException extends IOException {
        public UdpDataSourceException(String message) {
            super(message);
        }

        public UdpDataSourceException(IOException cause) {
            super(cause);
        }
    }

    public UdpDataSource(TransferListener listener) {
        this(listener, 2000);
    }

    public UdpDataSource(TransferListener listener, int maxPacketSize) {
        this(listener, maxPacketSize, 8000);
    }

    public UdpDataSource(TransferListener listener, int maxPacketSize, int socketTimeoutMillis) {
        this.listener = listener;
        this.socketTimeoutMillis = socketTimeoutMillis;
        this.packetBuffer = new byte[maxPacketSize];
        this.packet = new DatagramPacket(this.packetBuffer, 0, maxPacketSize);
    }

    @Override // com.google.android.exoplayer.upstream.DataSource
    public long open(DataSpec dataSpec) throws UdpDataSourceException {
        this.dataSpec = dataSpec;
        String host = dataSpec.uri.getHost();
        int port = dataSpec.uri.getPort();
        try {
            this.address = InetAddress.getByName(host);
            this.socketAddress = new InetSocketAddress(this.address, port);
            if (this.address.isMulticastAddress()) {
                this.multicastSocket = new MulticastSocket(this.socketAddress);
                this.multicastSocket.joinGroup(this.address);
                this.socket = this.multicastSocket;
            } else {
                this.socket = new DatagramSocket(this.socketAddress);
            }
            try {
                this.socket.setSoTimeout(this.socketTimeoutMillis);
                this.opened = true;
                if (this.listener != null) {
                    this.listener.onTransferStart();
                    return -1L;
                }
                return -1L;
            } catch (SocketException e) {
                throw new UdpDataSourceException(e);
            }
        } catch (IOException e2) {
            throw new UdpDataSourceException(e2);
        }
    }

    @Override // com.google.android.exoplayer.upstream.DataSource
    public int read(byte[] buffer, int offset, int readLength) throws UdpDataSourceException {
        if (this.packetRemaining == 0) {
            try {
                this.socket.receive(this.packet);
                this.packetRemaining = this.packet.getLength();
                if (this.listener != null) {
                    this.listener.onBytesTransferred(this.packetRemaining);
                }
            } catch (IOException e) {
                throw new UdpDataSourceException(e);
            }
        }
        int packetOffset = this.packet.getLength() - this.packetRemaining;
        int bytesToRead = Math.min(this.packetRemaining, readLength);
        System.arraycopy(this.packetBuffer, packetOffset, buffer, offset, bytesToRead);
        this.packetRemaining -= bytesToRead;
        return bytesToRead;
    }

    @Override // com.google.android.exoplayer.upstream.DataSource
    public void close() {
        if (this.multicastSocket != null) {
            try {
                this.multicastSocket.leaveGroup(this.address);
            } catch (IOException e) {
            }
            this.multicastSocket = null;
        }
        if (this.socket != null) {
            this.socket.close();
            this.socket = null;
        }
        this.address = null;
        this.socketAddress = null;
        this.packetRemaining = 0;
        if (this.opened) {
            this.opened = false;
            if (this.listener != null) {
                this.listener.onTransferEnd();
            }
        }
    }

    @Override // com.google.android.exoplayer.upstream.UriDataSource
    public String getUri() {
        if (this.dataSpec == null) {
            return null;
        }
        return this.dataSpec.uri.toString();
    }
}
