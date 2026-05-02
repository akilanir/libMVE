package cz.msebera.android.httpclient.conn.ssl;

import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.annotation.ThreadSafe;
import cz.msebera.android.httpclient.conn.socket.LayeredConnectionSocketFactory;
import cz.msebera.android.httpclient.protocol.HttpContext;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.TextUtils;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;
import javax.net.SocketFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocket;

@ThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory.class */
public class SSLConnectionSocketFactory implements LayeredConnectionSocketFactory {
    public static final String TLS = "TLS";
    public static final String SSL = "SSL";
    public static final String SSLV2 = "SSLv2";
    public static final X509HostnameVerifier ALLOW_ALL_HOSTNAME_VERIFIER = new AllowAllHostnameVerifier();
    public static final X509HostnameVerifier BROWSER_COMPATIBLE_HOSTNAME_VERIFIER = new BrowserCompatHostnameVerifier();
    public static final X509HostnameVerifier STRICT_HOSTNAME_VERIFIER = new StrictHostnameVerifier();
    private final javax.net.ssl.SSLSocketFactory socketfactory;
    private final X509HostnameVerifier hostnameVerifier;
    private final String[] supportedProtocols;
    private final String[] supportedCipherSuites;

    public static SSLConnectionSocketFactory getSocketFactory() throws SSLInitializationException {
        return new SSLConnectionSocketFactory(SSLContexts.createDefault(), BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
    }

    private static String[] split(String s) {
        if (TextUtils.isBlank(s)) {
            return null;
        }
        return s.split(" *, *");
    }

    public static SSLConnectionSocketFactory getSystemSocketFactory() throws SSLInitializationException {
        return new SSLConnectionSocketFactory((javax.net.ssl.SSLSocketFactory) javax.net.ssl.SSLSocketFactory.getDefault(), split(System.getProperty("https.protocols")), split(System.getProperty("https.cipherSuites")), BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
    }

    public SSLConnectionSocketFactory(SSLContext sslContext) {
        this(sslContext, BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
    }

    public SSLConnectionSocketFactory(SSLContext sslContext, X509HostnameVerifier hostnameVerifier) {
        this(((SSLContext) Args.notNull(sslContext, "SSL context")).getSocketFactory(), (String[]) null, (String[]) null, hostnameVerifier);
    }

    public SSLConnectionSocketFactory(SSLContext sslContext, String[] supportedProtocols, String[] supportedCipherSuites, X509HostnameVerifier hostnameVerifier) {
        this(((SSLContext) Args.notNull(sslContext, "SSL context")).getSocketFactory(), supportedProtocols, supportedCipherSuites, hostnameVerifier);
    }

    public SSLConnectionSocketFactory(javax.net.ssl.SSLSocketFactory socketfactory, X509HostnameVerifier hostnameVerifier) {
        this(socketfactory, (String[]) null, (String[]) null, hostnameVerifier);
    }

    public SSLConnectionSocketFactory(javax.net.ssl.SSLSocketFactory socketfactory, String[] supportedProtocols, String[] supportedCipherSuites, X509HostnameVerifier hostnameVerifier) {
        this.socketfactory = (javax.net.ssl.SSLSocketFactory) Args.notNull(socketfactory, "SSL socket factory");
        this.supportedProtocols = supportedProtocols;
        this.supportedCipherSuites = supportedCipherSuites;
        this.hostnameVerifier = hostnameVerifier != null ? hostnameVerifier : BROWSER_COMPATIBLE_HOSTNAME_VERIFIER;
    }

    protected void prepareSocket(SSLSocket socket) throws IOException {
    }

    @Override // cz.msebera.android.httpclient.conn.socket.ConnectionSocketFactory
    public Socket createSocket(HttpContext context) throws IOException {
        return SocketFactory.getDefault().createSocket();
    }

    @Override // cz.msebera.android.httpclient.conn.socket.ConnectionSocketFactory
    public Socket connectSocket(int connectTimeout, Socket socket, HttpHost host, InetSocketAddress remoteAddress, InetSocketAddress localAddress, HttpContext context) throws IOException {
        Args.notNull(host, "HTTP host");
        Args.notNull(remoteAddress, "Remote address");
        Socket sock = socket != null ? socket : createSocket(context);
        if (localAddress != null) {
            sock.bind(localAddress);
        }
        if (connectTimeout > 0) {
            try {
                if (sock.getSoTimeout() == 0) {
                    sock.setSoTimeout(connectTimeout);
                }
            } catch (IOException ex) {
                try {
                    sock.close();
                } catch (IOException e) {
                }
                throw ex;
            }
        }
        sock.connect(remoteAddress, connectTimeout);
        if (sock instanceof SSLSocket) {
            SSLSocket sslsock = (SSLSocket) sock;
            sslsock.startHandshake();
            verifyHostname(sslsock, host.getHostName());
            return sock;
        }
        return createLayeredSocket(sock, host.getHostName(), remoteAddress.getPort(), context);
    }

    @Override // cz.msebera.android.httpclient.conn.socket.LayeredConnectionSocketFactory
    public Socket createLayeredSocket(Socket socket, String target, int port, HttpContext context) throws IOException {
        SSLSocket sslsock = (SSLSocket) this.socketfactory.createSocket(socket, target, port, true);
        if (this.supportedProtocols != null) {
            sslsock.setEnabledProtocols(this.supportedProtocols);
        } else {
            String[] allProtocols = sslsock.getSupportedProtocols();
            List<String> enabledProtocols = new ArrayList<>(allProtocols.length);
            for (String protocol : allProtocols) {
                if (!protocol.startsWith("SSL")) {
                    enabledProtocols.add(protocol);
                }
            }
            sslsock.setEnabledProtocols((String[]) enabledProtocols.toArray(new String[enabledProtocols.size()]));
        }
        if (this.supportedCipherSuites != null) {
            sslsock.setEnabledCipherSuites(this.supportedCipherSuites);
        }
        prepareSocket(sslsock);
        sslsock.startHandshake();
        verifyHostname(sslsock, target);
        return sslsock;
    }

    X509HostnameVerifier getHostnameVerifier() {
        return this.hostnameVerifier;
    }

    private void verifyHostname(SSLSocket sslsock, String hostname) throws IOException {
        try {
            this.hostnameVerifier.verify(hostname, sslsock);
        } catch (IOException iox) {
            try {
                sslsock.close();
            } catch (Exception e) {
            }
            throw iox;
        }
    }
}
