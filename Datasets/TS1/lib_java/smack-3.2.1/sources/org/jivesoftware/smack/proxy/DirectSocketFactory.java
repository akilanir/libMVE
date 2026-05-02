package org.jivesoftware.smack.proxy;

import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.Socket;
import java.net.UnknownHostException;
import javax.net.SocketFactory;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/proxy/DirectSocketFactory.class */
class DirectSocketFactory extends SocketFactory {
    @Override // javax.net.SocketFactory
    public Socket createSocket(String host, int port) throws IOException, UnknownHostException {
        Socket newSocket = new Socket(Proxy.NO_PROXY);
        newSocket.connect(new InetSocketAddress(host, port));
        return newSocket;
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String host, int port, InetAddress localHost, int localPort) throws IOException, UnknownHostException {
        return new Socket(host, port, localHost, localPort);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress host, int port) throws IOException {
        Socket newSocket = new Socket(Proxy.NO_PROXY);
        newSocket.connect(new InetSocketAddress(host, port));
        return newSocket;
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress address, int port, InetAddress localAddress, int localPort) throws IOException {
        return new Socket(address, port, localAddress, localPort);
    }
}
