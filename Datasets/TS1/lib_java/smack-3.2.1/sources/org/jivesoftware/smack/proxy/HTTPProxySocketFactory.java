package org.jivesoftware.smack.proxy;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.net.SocketFactory;
import org.jivesoftware.smack.proxy.ProxyInfo;
import org.jivesoftware.smack.util.Base64;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/proxy/HTTPProxySocketFactory.class */
class HTTPProxySocketFactory extends SocketFactory {
    private ProxyInfo proxy;
    private static final Pattern RESPONSE_PATTERN = Pattern.compile("HTTP/\\S+\\s(\\d+)\\s(.*)\\s*");

    public HTTPProxySocketFactory(ProxyInfo proxy) {
        this.proxy = proxy;
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String host, int port) throws IOException, UnknownHostException {
        return httpProxifiedSocket(host, port);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String host, int port, InetAddress localHost, int localPort) throws IOException, UnknownHostException {
        return httpProxifiedSocket(host, port);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress host, int port) throws IOException {
        return httpProxifiedSocket(host.getHostAddress(), port);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress address, int port, InetAddress localAddress, int localPort) throws IOException {
        return httpProxifiedSocket(address.getHostAddress(), port);
    }

    private Socket httpProxifiedSocket(String host, int port) throws IOException {
        String proxyLine;
        String proxyhost = this.proxy.getProxyAddress();
        int proxyPort = this.proxy.getProxyPort();
        Socket socket = new Socket(proxyhost, proxyPort);
        String hostport = "CONNECT " + host + ":" + port;
        String username = this.proxy.getProxyUsername();
        if (username == null) {
            proxyLine = XmlPullParser.NO_NAMESPACE;
        } else {
            String password = this.proxy.getProxyPassword();
            proxyLine = "\r\nProxy-Authorization: Basic " + new String(Base64.encodeBytes((username + ":" + password).getBytes("UTF-8")));
        }
        socket.getOutputStream().write((hostport + " HTTP/1.1\r\nHost: " + hostport + proxyLine + "\r\n\r\n").getBytes("UTF-8"));
        InputStream in = socket.getInputStream();
        StringBuilder got = new StringBuilder(100);
        int nlchars = 0;
        do {
            char c = (char) in.read();
            got.append(c);
            if (got.length() > 1024) {
                throw new ProxyException(ProxyInfo.ProxyType.HTTP, "Recieved header of >1024 characters from " + proxyhost + ", cancelling connection");
            }
            if (c == 65535) {
                throw new ProxyException(ProxyInfo.ProxyType.HTTP);
            }
            if ((nlchars == 0 || nlchars == 2) && c == '\r') {
                nlchars++;
            } else if ((nlchars == 1 || nlchars == 3) && c == '\n') {
                nlchars++;
            } else {
                nlchars = 0;
            }
        } while (nlchars != 4);
        if (nlchars != 4) {
            throw new ProxyException(ProxyInfo.ProxyType.HTTP, "Never received blank line from " + proxyhost + ", cancelling connection");
        }
        String gotstr = got.toString();
        BufferedReader br = new BufferedReader(new StringReader(gotstr));
        String response = br.readLine();
        if (response == null) {
            throw new ProxyException(ProxyInfo.ProxyType.HTTP, "Empty proxy response from " + proxyhost + ", cancelling");
        }
        Matcher m = RESPONSE_PATTERN.matcher(response);
        if (!m.matches()) {
            throw new ProxyException(ProxyInfo.ProxyType.HTTP, "Unexpected proxy response from " + proxyhost + ": " + response);
        }
        int code = Integer.parseInt(m.group(1));
        if (code != 200) {
            throw new ProxyException(ProxyInfo.ProxyType.HTTP);
        }
        return socket;
    }
}
