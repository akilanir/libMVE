package ch.qos.logback.core.net;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/SyslogOutputStream.class */
public class SyslogOutputStream extends OutputStream {
    private static final int MAX_LEN = 1024;
    private InetAddress address;
    private final int port;
    private ByteArrayOutputStream baos = new ByteArrayOutputStream();
    private DatagramSocket ds = new DatagramSocket();

    public SyslogOutputStream(String str, int i) throws UnknownHostException, SocketException {
        this.address = InetAddress.getByName(str);
        this.port = i;
    }

    @Override // java.io.OutputStream
    public void write(byte[] bArr, int i, int i2) throws IOException {
        this.baos.write(bArr, i, i2);
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        byte[] byteArray = this.baos.toByteArray();
        DatagramPacket datagramPacket = new DatagramPacket(byteArray, byteArray.length, this.address, this.port);
        if (this.baos.size() > MAX_LEN) {
            this.baos = new ByteArrayOutputStream();
        } else {
            this.baos.reset();
        }
        if (byteArray.length == 0 || this.ds == null) {
            return;
        }
        this.ds.send(datagramPacket);
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        this.address = null;
        this.ds = null;
    }

    public int getPort() {
        return this.port;
    }

    @Override // java.io.OutputStream
    public void write(int i) throws IOException {
        this.baos.write(i);
    }

    int getSendBufferSize() throws SocketException {
        return this.ds.getSendBufferSize();
    }
}
