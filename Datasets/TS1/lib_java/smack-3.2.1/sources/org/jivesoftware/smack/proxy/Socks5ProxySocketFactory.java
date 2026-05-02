package org.jivesoftware.smack.proxy;

import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import javax.net.SocketFactory;
import org.jivesoftware.smack.proxy.ProxyInfo;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/proxy/Socks5ProxySocketFactory.class */
public class Socks5ProxySocketFactory extends SocketFactory {
    private ProxyInfo proxy;

    public Socks5ProxySocketFactory(ProxyInfo proxy) {
        this.proxy = proxy;
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String host, int port) throws IOException, UnknownHostException {
        return socks5ProxifiedSocket(host, port);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String host, int port, InetAddress localHost, int localPort) throws IOException, UnknownHostException {
        return socks5ProxifiedSocket(host, port);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress host, int port) throws IOException {
        return socks5ProxifiedSocket(host.getHostAddress(), port);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress address, int port, InetAddress localAddress, int localPort) throws IOException {
        return socks5ProxifiedSocket(address.getHostAddress(), port);
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x02a3  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x02b2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.net.Socket socks5ProxifiedSocket(java.lang.String r8, int r9) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 700
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.jivesoftware.smack.proxy.Socks5ProxySocketFactory.socks5ProxifiedSocket(java.lang.String, int):java.net.Socket");
    }

    private void fill(InputStream in, byte[] buf, int len) throws IOException {
        int i = 0;
        while (true) {
            int s = i;
            if (s < len) {
                int i2 = in.read(buf, s, len - s);
                if (i2 <= 0) {
                    throw new ProxyException(ProxyInfo.ProxyType.SOCKS5, "stream is closed");
                }
                i = s + i2;
            } else {
                return;
            }
        }
    }
}
