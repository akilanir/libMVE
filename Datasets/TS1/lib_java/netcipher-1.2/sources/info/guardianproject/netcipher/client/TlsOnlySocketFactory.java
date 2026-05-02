package info.guardianproject.netcipher.client;

import android.util.Log;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.SocketException;
import java.nio.channels.SocketChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;
import javax.net.ssl.HandshakeCompletedListener;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;

/* loaded from: netcipher-1.2.jar:info/guardianproject/netcipher/client/TlsOnlySocketFactory.class */
public class TlsOnlySocketFactory extends SSLSocketFactory {
    private static final String TAG = "TlsOnlySocketFactory";
    private final SSLSocketFactory delegate;
    private final boolean compatible;

    public TlsOnlySocketFactory() {
        this.delegate = HttpsURLConnection.getDefaultSSLSocketFactory();
        this.compatible = false;
    }

    public TlsOnlySocketFactory(SSLSocketFactory delegate) {
        this.delegate = delegate;
        this.compatible = false;
    }

    public TlsOnlySocketFactory(SSLSocketFactory delegate, boolean compatible) {
        this.delegate = delegate;
        this.compatible = compatible;
    }

    @Override // javax.net.ssl.SSLSocketFactory
    public String[] getDefaultCipherSuites() {
        return this.delegate.getDefaultCipherSuites();
    }

    @Override // javax.net.ssl.SSLSocketFactory
    public String[] getSupportedCipherSuites() {
        return this.delegate.getSupportedCipherSuites();
    }

    private Socket makeSocketSafe(Socket socket) {
        if (socket instanceof SSLSocket) {
            socket = new TlsOnlySSLSocket((SSLSocket) socket, this.compatible);
        }
        return socket;
    }

    @Override // javax.net.ssl.SSLSocketFactory
    public Socket createSocket(Socket s, String host, int port, boolean autoClose) throws IOException {
        return makeSocketSafe(this.delegate.createSocket(s, host, port, autoClose));
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String host, int port) throws IOException {
        return makeSocketSafe(this.delegate.createSocket(host, port));
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String host, int port, InetAddress localHost, int localPort) throws IOException {
        return makeSocketSafe(this.delegate.createSocket(host, port, localHost, localPort));
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress host, int port) throws IOException {
        return makeSocketSafe(this.delegate.createSocket(host, port));
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress address, int port, InetAddress localAddress, int localPort) throws IOException {
        return makeSocketSafe(this.delegate.createSocket(address, port, localAddress, localPort));
    }

    /* loaded from: netcipher-1.2.jar:info/guardianproject/netcipher/client/TlsOnlySocketFactory$TlsOnlySSLSocket.class */
    private class TlsOnlySSLSocket extends DelegateSSLSocket {
        final boolean compatible;

        private TlsOnlySSLSocket(SSLSocket delegate, boolean compatible) {
            super(delegate);
            this.compatible = compatible;
            if (compatible) {
                ArrayList<String> protocols = new ArrayList<>(Arrays.asList(delegate.getEnabledProtocols()));
                protocols.remove(StrongSSLSocketFactory.SSLV2);
                protocols.remove("SSLv3");
                super.setEnabledProtocols((String[]) protocols.toArray(new String[protocols.size()]));
                ArrayList<String> enabled = new ArrayList<>(10);
                Pattern exclude = Pattern.compile(".*(EXPORT|NULL).*");
                String[] arr$ = delegate.getEnabledCipherSuites();
                for (String cipher : arr$) {
                    if (!exclude.matcher(cipher).matches()) {
                        enabled.add(cipher);
                    }
                }
                super.setEnabledCipherSuites((String[]) enabled.toArray(new String[enabled.size()]));
                return;
            }
            ArrayList<String> protocols2 = new ArrayList<>(Arrays.asList(delegate.getSupportedProtocols()));
            protocols2.remove(StrongSSLSocketFactory.SSLV2);
            protocols2.remove("SSLv3");
            super.setEnabledProtocols((String[]) protocols2.toArray(new String[protocols2.size()]));
            ArrayList<String> enabledCiphers = new ArrayList<>(10);
            Pattern exclude2 = Pattern.compile(".*(_DES|DH_|DSS|EXPORT|MD5|NULL|RC4).*");
            String[] arr$2 = delegate.getSupportedCipherSuites();
            for (String cipher2 : arr$2) {
                if (!exclude2.matcher(cipher2).matches()) {
                    enabledCiphers.add(cipher2);
                }
            }
            super.setEnabledCipherSuites((String[]) enabledCiphers.toArray(new String[enabledCiphers.size()]));
        }

        @Override // info.guardianproject.netcipher.client.TlsOnlySocketFactory.DelegateSSLSocket, javax.net.ssl.SSLSocket
        public void setEnabledProtocols(String[] protocols) {
            List<String> systemProtocols;
            if (protocols != null && protocols.length == 1 && "SSLv3".equals(protocols[0])) {
                if (this.compatible) {
                    systemProtocols = Arrays.asList(this.delegate.getEnabledProtocols());
                } else {
                    systemProtocols = Arrays.asList(this.delegate.getSupportedProtocols());
                }
                List<String> enabledProtocols = new ArrayList<>(systemProtocols);
                if (enabledProtocols.size() > 1) {
                    enabledProtocols.remove(StrongSSLSocketFactory.SSLV2);
                    enabledProtocols.remove("SSLv3");
                } else {
                    Log.w(TlsOnlySocketFactory.TAG, "SSL stuck with protocol available for " + String.valueOf(enabledProtocols));
                }
                protocols = (String[]) enabledProtocols.toArray(new String[enabledProtocols.size()]);
            }
            super.setEnabledProtocols(protocols);
        }
    }

    /* loaded from: netcipher-1.2.jar:info/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket.class */
    public class DelegateSSLSocket extends SSLSocket {
        protected final SSLSocket delegate;

        DelegateSSLSocket(SSLSocket delegate) {
            this.delegate = delegate;
        }

        @Override // javax.net.ssl.SSLSocket
        public String[] getSupportedCipherSuites() {
            return this.delegate.getSupportedCipherSuites();
        }

        @Override // javax.net.ssl.SSLSocket
        public String[] getEnabledCipherSuites() {
            return this.delegate.getEnabledCipherSuites();
        }

        @Override // javax.net.ssl.SSLSocket
        public void setEnabledCipherSuites(String[] suites) {
            this.delegate.setEnabledCipherSuites(suites);
        }

        @Override // javax.net.ssl.SSLSocket
        public String[] getSupportedProtocols() {
            return this.delegate.getSupportedProtocols();
        }

        @Override // javax.net.ssl.SSLSocket
        public String[] getEnabledProtocols() {
            return this.delegate.getEnabledProtocols();
        }

        @Override // javax.net.ssl.SSLSocket
        public void setEnabledProtocols(String[] protocols) {
            this.delegate.setEnabledProtocols(protocols);
        }

        @Override // javax.net.ssl.SSLSocket
        public SSLSession getSession() {
            return this.delegate.getSession();
        }

        @Override // javax.net.ssl.SSLSocket
        public void addHandshakeCompletedListener(HandshakeCompletedListener listener) {
            this.delegate.addHandshakeCompletedListener(listener);
        }

        @Override // javax.net.ssl.SSLSocket
        public void removeHandshakeCompletedListener(HandshakeCompletedListener listener) {
            this.delegate.removeHandshakeCompletedListener(listener);
        }

        @Override // javax.net.ssl.SSLSocket
        public void startHandshake() throws IOException {
            this.delegate.startHandshake();
        }

        @Override // javax.net.ssl.SSLSocket
        public void setUseClientMode(boolean mode) {
            this.delegate.setUseClientMode(mode);
        }

        @Override // javax.net.ssl.SSLSocket
        public boolean getUseClientMode() {
            return this.delegate.getUseClientMode();
        }

        @Override // javax.net.ssl.SSLSocket
        public void setNeedClientAuth(boolean need) {
            this.delegate.setNeedClientAuth(need);
        }

        @Override // javax.net.ssl.SSLSocket
        public void setWantClientAuth(boolean want) {
            this.delegate.setWantClientAuth(want);
        }

        @Override // javax.net.ssl.SSLSocket
        public boolean getNeedClientAuth() {
            return this.delegate.getNeedClientAuth();
        }

        @Override // javax.net.ssl.SSLSocket
        public boolean getWantClientAuth() {
            return this.delegate.getWantClientAuth();
        }

        @Override // javax.net.ssl.SSLSocket
        public void setEnableSessionCreation(boolean flag) {
            this.delegate.setEnableSessionCreation(flag);
        }

        @Override // javax.net.ssl.SSLSocket
        public boolean getEnableSessionCreation() {
            return this.delegate.getEnableSessionCreation();
        }

        @Override // java.net.Socket
        public void bind(SocketAddress localAddr) throws IOException {
            this.delegate.bind(localAddr);
        }

        @Override // java.net.Socket, java.io.Closeable, java.lang.AutoCloseable
        public synchronized void close() throws IOException {
            this.delegate.close();
        }

        @Override // java.net.Socket
        public void connect(SocketAddress remoteAddr) throws IOException {
            this.delegate.connect(remoteAddr);
        }

        @Override // java.net.Socket
        public void connect(SocketAddress remoteAddr, int timeout) throws IOException {
            this.delegate.connect(remoteAddr, timeout);
        }

        @Override // java.net.Socket
        public SocketChannel getChannel() {
            return this.delegate.getChannel();
        }

        @Override // java.net.Socket
        public InetAddress getInetAddress() {
            return this.delegate.getInetAddress();
        }

        @Override // java.net.Socket
        public InputStream getInputStream() throws IOException {
            return this.delegate.getInputStream();
        }

        @Override // java.net.Socket
        public boolean getKeepAlive() throws SocketException {
            return this.delegate.getKeepAlive();
        }

        @Override // java.net.Socket
        public InetAddress getLocalAddress() {
            return this.delegate.getLocalAddress();
        }

        @Override // java.net.Socket
        public int getLocalPort() {
            return this.delegate.getLocalPort();
        }

        @Override // java.net.Socket
        public SocketAddress getLocalSocketAddress() {
            return this.delegate.getLocalSocketAddress();
        }

        @Override // java.net.Socket
        public boolean getOOBInline() throws SocketException {
            return this.delegate.getOOBInline();
        }

        @Override // java.net.Socket
        public OutputStream getOutputStream() throws IOException {
            return this.delegate.getOutputStream();
        }

        @Override // java.net.Socket
        public int getPort() {
            return this.delegate.getPort();
        }

        @Override // java.net.Socket
        public synchronized int getReceiveBufferSize() throws SocketException {
            return this.delegate.getReceiveBufferSize();
        }

        @Override // java.net.Socket
        public SocketAddress getRemoteSocketAddress() {
            return this.delegate.getRemoteSocketAddress();
        }

        @Override // java.net.Socket
        public boolean getReuseAddress() throws SocketException {
            return this.delegate.getReuseAddress();
        }

        @Override // java.net.Socket
        public synchronized int getSendBufferSize() throws SocketException {
            return this.delegate.getSendBufferSize();
        }

        @Override // java.net.Socket
        public int getSoLinger() throws SocketException {
            return this.delegate.getSoLinger();
        }

        @Override // java.net.Socket
        public synchronized int getSoTimeout() throws SocketException {
            return this.delegate.getSoTimeout();
        }

        @Override // java.net.Socket
        public boolean getTcpNoDelay() throws SocketException {
            return this.delegate.getTcpNoDelay();
        }

        @Override // java.net.Socket
        public int getTrafficClass() throws SocketException {
            return this.delegate.getTrafficClass();
        }

        @Override // java.net.Socket
        public boolean isBound() {
            return this.delegate.isBound();
        }

        @Override // java.net.Socket
        public boolean isClosed() {
            return this.delegate.isClosed();
        }

        @Override // java.net.Socket
        public boolean isConnected() {
            return this.delegate.isConnected();
        }

        @Override // java.net.Socket
        public boolean isInputShutdown() {
            return this.delegate.isInputShutdown();
        }

        @Override // java.net.Socket
        public boolean isOutputShutdown() {
            return this.delegate.isOutputShutdown();
        }

        @Override // java.net.Socket
        public void sendUrgentData(int value) throws IOException {
            this.delegate.sendUrgentData(value);
        }

        @Override // java.net.Socket
        public void setKeepAlive(boolean keepAlive) throws SocketException {
            this.delegate.setKeepAlive(keepAlive);
        }

        @Override // java.net.Socket
        public void setOOBInline(boolean oobinline) throws SocketException {
            this.delegate.setOOBInline(oobinline);
        }

        @Override // java.net.Socket
        public void setPerformancePreferences(int connectionTime, int latency, int bandwidth) {
            this.delegate.setPerformancePreferences(connectionTime, latency, bandwidth);
        }

        @Override // java.net.Socket
        public synchronized void setReceiveBufferSize(int size) throws SocketException {
            this.delegate.setReceiveBufferSize(size);
        }

        @Override // java.net.Socket
        public void setReuseAddress(boolean reuse) throws SocketException {
            this.delegate.setReuseAddress(reuse);
        }

        @Override // java.net.Socket
        public synchronized void setSendBufferSize(int size) throws SocketException {
            this.delegate.setSendBufferSize(size);
        }

        @Override // java.net.Socket
        public void setSoLinger(boolean on, int timeout) throws SocketException {
            this.delegate.setSoLinger(on, timeout);
        }

        @Override // java.net.Socket
        public synchronized void setSoTimeout(int timeout) throws SocketException {
            this.delegate.setSoTimeout(timeout);
        }

        @Override // java.net.Socket
        public void setTcpNoDelay(boolean on) throws SocketException {
            this.delegate.setTcpNoDelay(on);
        }

        @Override // java.net.Socket
        public void setTrafficClass(int value) throws SocketException {
            this.delegate.setTrafficClass(value);
        }

        @Override // java.net.Socket
        public void shutdownInput() throws IOException {
            this.delegate.shutdownInput();
        }

        @Override // java.net.Socket
        public void shutdownOutput() throws IOException {
            this.delegate.shutdownOutput();
        }

        @Override // javax.net.ssl.SSLSocket, java.net.Socket
        public String toString() {
            return this.delegate.toString();
        }

        public boolean equals(Object o) {
            return this.delegate.equals(o);
        }
    }
}
