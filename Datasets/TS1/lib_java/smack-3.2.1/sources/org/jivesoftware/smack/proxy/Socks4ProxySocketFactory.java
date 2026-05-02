package org.jivesoftware.smack.proxy;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import javax.net.SocketFactory;
import org.jivesoftware.smack.proxy.ProxyInfo;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/proxy/Socks4ProxySocketFactory.class */
public class Socks4ProxySocketFactory extends SocketFactory {
    private ProxyInfo proxy;

    public Socks4ProxySocketFactory(ProxyInfo proxy) {
        this.proxy = proxy;
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String host, int port) throws IOException, UnknownHostException {
        return socks4ProxifiedSocket(host, port);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String host, int port, InetAddress localHost, int localPort) throws IOException, UnknownHostException {
        return socks4ProxifiedSocket(host, port);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress host, int port) throws IOException {
        return socks4ProxifiedSocket(host.getHostAddress(), port);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress address, int port, InetAddress localAddress, int localPort) throws IOException {
        return socks4ProxifiedSocket(address.getHostAddress(), port);
    }

    private Socket socks4ProxifiedSocket(String host, int port) throws IOException {
        Socket socket = null;
        String proxy_host = this.proxy.getProxyAddress();
        int proxy_port = this.proxy.getProxyPort();
        String user = this.proxy.getProxyUsername();
        this.proxy.getProxyPassword();
        try {
            socket = new Socket(proxy_host, proxy_port);
            InputStream in = socket.getInputStream();
            OutputStream out = socket.getOutputStream();
            socket.setTcpNoDelay(true);
            byte[] buf = new byte[1024];
            int index = 0 + 1;
            buf[0] = 4;
            int index2 = index + 1;
            buf[index] = 1;
            int index3 = index2 + 1;
            buf[index2] = (byte) (port >>> 8);
            int index4 = index3 + 1;
            buf[index3] = (byte) (port & 255);
            try {
                InetAddress addr = InetAddress.getByName(host);
                byte[] byteAddress = addr.getAddress();
                for (byte b : byteAddress) {
                    int i = index4;
                    index4++;
                    buf[i] = b;
                }
                if (user != null) {
                    System.arraycopy(user.getBytes(), 0, buf, index4, user.length());
                    index4 += user.length();
                }
                buf[index4] = 0;
                out.write(buf, 0, index4 + 1);
                int s = 0;
                while (s < 6) {
                    int i2 = in.read(buf, s, 6 - s);
                    if (i2 <= 0) {
                        throw new ProxyException(ProxyInfo.ProxyType.SOCKS4, "stream is closed");
                    }
                    s += i2;
                }
                if (buf[0] != 0) {
                    throw new ProxyException(ProxyInfo.ProxyType.SOCKS4, "server returns VN " + ((int) buf[0]));
                }
                if (buf[1] != 90) {
                    try {
                        socket.close();
                    } catch (Exception e) {
                    }
                    String message = "ProxySOCKS4: server returns CD " + ((int) buf[1]);
                    throw new ProxyException(ProxyInfo.ProxyType.SOCKS4, message);
                }
                byte[] temp = new byte[2];
                in.read(temp, 0, 2);
                return socket;
            } catch (UnknownHostException uhe) {
                throw new ProxyException(ProxyInfo.ProxyType.SOCKS4, uhe.toString(), uhe);
            }
        } catch (RuntimeException e2) {
            throw e2;
        } catch (Exception e3) {
            if (socket != null) {
                try {
                    socket.close();
                } catch (Exception e4) {
                    throw new ProxyException(ProxyInfo.ProxyType.SOCKS4, e3.toString());
                }
            }
            throw new ProxyException(ProxyInfo.ProxyType.SOCKS4, e3.toString());
        }
    }
}
