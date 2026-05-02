package info.guardianproject.netcipher.client;

import ch.boye.httpclientandroidlib.HttpHost;
import ch.boye.httpclientandroidlib.conn.OperatedClientConnection;
import ch.boye.httpclientandroidlib.conn.scheme.Scheme;
import ch.boye.httpclientandroidlib.conn.scheme.SchemeRegistry;
import ch.boye.httpclientandroidlib.conn.ssl.SSLSocketFactory;
import ch.boye.httpclientandroidlib.impl.conn.DefaultClientConnectionOperator;
import ch.boye.httpclientandroidlib.params.HttpParams;
import ch.boye.httpclientandroidlib.protocol.HttpContext;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.UnknownHostException;

/* loaded from: netcipher-1.2.1.jar:info/guardianproject/netcipher/client/SocksProxyClientConnOperator.class */
public class SocksProxyClientConnOperator extends DefaultClientConnectionOperator {
    private static final int CONNECT_TIMEOUT_MILLISECONDS = 60000;
    private static final int READ_TIMEOUT_MILLISECONDS = 60000;
    private String mProxyHost;
    private int mProxyPort;

    public SocksProxyClientConnOperator(SchemeRegistry registry, String proxyHost, int proxyPort) {
        super(registry);
        this.mProxyHost = proxyHost;
        this.mProxyPort = proxyPort;
    }

    public void openConnection(OperatedClientConnection conn, HttpHost target, InetAddress local, HttpContext context, HttpParams params) throws IOException {
        Socket socket = null;
        Socket sslSocket = null;
        try {
            if (conn == null || target == null || params == null) {
                throw new IllegalArgumentException("Required argument may not be null");
            }
            if (conn.isOpen()) {
                throw new IllegalStateException("Connection must not be open");
            }
            Scheme scheme = this.schemeRegistry.getScheme(target.getSchemeName());
            SSLSocketFactory schemeSocketFactory = scheme.getSchemeSocketFactory();
            int port = scheme.resolvePort(target.getPort());
            String host = target.getHostName();
            Socket socket2 = new Socket();
            conn.opening(socket2, target);
            socket2.setSoTimeout(60000);
            socket2.connect(new InetSocketAddress(this.mProxyHost, this.mProxyPort), 60000);
            DataOutputStream outputStream = new DataOutputStream(socket2.getOutputStream());
            outputStream.write(4);
            outputStream.write(1);
            outputStream.writeShort((short) port);
            outputStream.writeInt(1);
            outputStream.write(0);
            outputStream.write(host.getBytes());
            outputStream.write(0);
            DataInputStream inputStream = new DataInputStream(socket2.getInputStream());
            if (inputStream.readByte() != 0 || inputStream.readByte() != 90) {
                throw new IOException("SOCKS4a connect failed");
            }
            inputStream.readShort();
            inputStream.readInt();
            if (schemeSocketFactory instanceof SSLSocketFactory) {
                Socket sslSocket2 = schemeSocketFactory.createLayeredSocket(socket2, host, port, params);
                conn.opening(sslSocket2, target);
                sslSocket2.setSoTimeout(60000);
                prepareSocket(sslSocket2, context, params);
                conn.openCompleted(schemeSocketFactory.isSecure(sslSocket2), params);
            } else {
                conn.opening(socket2, target);
                socket2.setSoTimeout(60000);
                prepareSocket(socket2, context, params);
                conn.openCompleted(schemeSocketFactory.isSecure(socket2), params);
            }
        } catch (IOException e) {
            if (0 != 0) {
                try {
                    sslSocket.close();
                } catch (IOException e2) {
                    throw e;
                }
            }
            if (0 != 0) {
                socket.close();
            }
            throw e;
        }
    }

    public void updateSecureConnection(OperatedClientConnection conn, HttpHost target, HttpContext context, HttpParams params) throws IOException {
        throw new RuntimeException("operation not supported");
    }

    protected InetAddress[] resolveHostname(String host) throws UnknownHostException {
        throw new RuntimeException("operation not supported");
    }
}
