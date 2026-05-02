package com.sun.mail.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.SocketException;
import java.nio.channels.SocketChannel;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/WriteTimeoutSocket.class */
public class WriteTimeoutSocket extends Socket {
    private final Socket socket;
    private final ScheduledExecutorService ses;
    private final int timeout;

    public WriteTimeoutSocket(Socket socket, int timeout) throws IOException {
        this.socket = socket;
        this.ses = Executors.newScheduledThreadPool(1);
        this.timeout = timeout;
    }

    public WriteTimeoutSocket(int timeout) throws IOException {
        this(new Socket(), timeout);
    }

    public WriteTimeoutSocket(InetAddress address, int port, int timeout) throws IOException {
        this(timeout);
        this.socket.connect(new InetSocketAddress(address, port));
    }

    public WriteTimeoutSocket(InetAddress address, int port, InetAddress localAddress, int localPort, int timeout) throws IOException {
        this(timeout);
        this.socket.bind(new InetSocketAddress(localAddress, localPort));
        this.socket.connect(new InetSocketAddress(address, port));
    }

    public WriteTimeoutSocket(String host, int port, int timeout) throws IOException {
        this(timeout);
        this.socket.connect(new InetSocketAddress(host, port));
    }

    public WriteTimeoutSocket(String host, int port, InetAddress localAddress, int localPort, int timeout) throws IOException {
        this(timeout);
        this.socket.bind(new InetSocketAddress(localAddress, localPort));
        this.socket.connect(new InetSocketAddress(host, port));
    }

    @Override // java.net.Socket
    public void connect(SocketAddress remote) throws IOException {
        this.socket.connect(remote, 0);
    }

    @Override // java.net.Socket
    public void connect(SocketAddress remote, int timeout) throws IOException {
        this.socket.connect(remote, timeout);
    }

    @Override // java.net.Socket
    public void bind(SocketAddress local) throws IOException {
        this.socket.bind(local);
    }

    @Override // java.net.Socket
    public SocketChannel getChannel() {
        return this.socket.getChannel();
    }

    @Override // java.net.Socket
    public InetAddress getInetAddress() {
        return this.socket.getInetAddress();
    }

    @Override // java.net.Socket
    public InetAddress getLocalAddress() {
        return this.socket.getLocalAddress();
    }

    @Override // java.net.Socket
    public int getPort() {
        return this.socket.getPort();
    }

    @Override // java.net.Socket
    public int getLocalPort() {
        return this.socket.getLocalPort();
    }

    @Override // java.net.Socket
    public InputStream getInputStream() throws IOException {
        return this.socket.getInputStream();
    }

    @Override // java.net.Socket
    public synchronized OutputStream getOutputStream() throws IOException {
        return new TimeoutOutputStream(this.socket.getOutputStream(), this.ses, this.timeout);
    }

    @Override // java.net.Socket
    public void setTcpNoDelay(boolean on) throws SocketException {
        this.socket.setTcpNoDelay(on);
    }

    @Override // java.net.Socket
    public boolean getTcpNoDelay() throws SocketException {
        return this.socket.getTcpNoDelay();
    }

    @Override // java.net.Socket
    public void setSoLinger(boolean on, int linger) throws SocketException {
        this.socket.setSoLinger(on, linger);
    }

    @Override // java.net.Socket
    public int getSoLinger() throws SocketException {
        return this.socket.getSoLinger();
    }

    @Override // java.net.Socket
    public void sendUrgentData(int data) throws IOException {
        this.socket.sendUrgentData(data);
    }

    @Override // java.net.Socket
    public void setOOBInline(boolean on) throws SocketException {
        this.socket.setOOBInline(on);
    }

    @Override // java.net.Socket
    public boolean getOOBInline() throws SocketException {
        return this.socket.getOOBInline();
    }

    @Override // java.net.Socket
    public void setSoTimeout(int timeout) throws SocketException {
        this.socket.setSoTimeout(timeout);
    }

    @Override // java.net.Socket
    public int getSoTimeout() throws SocketException {
        return this.socket.getSoTimeout();
    }

    @Override // java.net.Socket
    public void setSendBufferSize(int size) throws SocketException {
        this.socket.setSendBufferSize(size);
    }

    @Override // java.net.Socket
    public int getSendBufferSize() throws SocketException {
        return this.socket.getSendBufferSize();
    }

    @Override // java.net.Socket
    public void setReceiveBufferSize(int size) throws SocketException {
        this.socket.setReceiveBufferSize(size);
    }

    @Override // java.net.Socket
    public int getReceiveBufferSize() throws SocketException {
        return this.socket.getReceiveBufferSize();
    }

    @Override // java.net.Socket
    public void setKeepAlive(boolean on) throws SocketException {
        this.socket.setKeepAlive(on);
    }

    @Override // java.net.Socket
    public boolean getKeepAlive() throws SocketException {
        return this.socket.getKeepAlive();
    }

    @Override // java.net.Socket
    public void setTrafficClass(int tc) throws SocketException {
        this.socket.setTrafficClass(tc);
    }

    @Override // java.net.Socket
    public int getTrafficClass() throws SocketException {
        return this.socket.getTrafficClass();
    }

    @Override // java.net.Socket
    public void setReuseAddress(boolean on) throws SocketException {
        this.socket.setReuseAddress(on);
    }

    @Override // java.net.Socket
    public boolean getReuseAddress() throws SocketException {
        return this.socket.getReuseAddress();
    }

    @Override // java.net.Socket, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        try {
            this.socket.close();
        } finally {
            this.ses.shutdownNow();
        }
    }

    @Override // java.net.Socket
    public void shutdownInput() throws IOException {
        this.socket.shutdownInput();
    }

    @Override // java.net.Socket
    public void shutdownOutput() throws IOException {
        this.socket.shutdownOutput();
    }

    @Override // java.net.Socket
    public String toString() {
        return this.socket.toString();
    }

    @Override // java.net.Socket
    public boolean isConnected() {
        return this.socket.isConnected();
    }

    @Override // java.net.Socket
    public boolean isBound() {
        return this.socket.isBound();
    }

    @Override // java.net.Socket
    public boolean isClosed() {
        return this.socket.isClosed();
    }

    @Override // java.net.Socket
    public boolean isInputShutdown() {
        return this.socket.isInputShutdown();
    }

    @Override // java.net.Socket
    public boolean isOutputShutdown() {
        return this.socket.isOutputShutdown();
    }
}
