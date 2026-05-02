package info.guardianproject.netcipher.client;

import android.content.Context;
import ch.boye.httpclientandroidlib.conn.scheme.LayeredSchemeSocketFactory;
import ch.boye.httpclientandroidlib.conn.ssl.SSLSocketFactory;
import ch.boye.httpclientandroidlib.params.HttpParams;
import java.io.IOException;
import java.net.Proxy;
import java.net.Socket;
import java.net.UnknownHostException;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.net.ssl.KeyManager;
import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.TrustManager;

/* loaded from: netcipher-1.2.1.jar:info/guardianproject/netcipher/client/StrongSSLSocketFactory.class */
public class StrongSSLSocketFactory extends SSLSocketFactory implements LayeredSchemeSocketFactory {
    private javax.net.ssl.SSLSocketFactory mFactory;
    private Proxy mProxy;
    public static final String TLS = "TLS";
    public static final String SSL = "SSL";
    public static final String SSLV2 = "SSLv2";
    private boolean mEnableStongerDefaultSSLCipherSuite;
    private boolean mEnableStongerDefaultProtocalVersion;
    private String[] mProtocols;
    private String[] mCipherSuites;

    public StrongSSLSocketFactory(Context context, TrustManager[] trustManagers, KeyStore keyStore, String keyStorePassword) throws KeyManagementException, UnrecoverableKeyException, NoSuchAlgorithmException, KeyStoreException, CertificateException, IOException {
        super(keyStore);
        this.mFactory = null;
        this.mProxy = null;
        this.mEnableStongerDefaultSSLCipherSuite = true;
        this.mEnableStongerDefaultProtocalVersion = true;
        SSLContext sslContext = SSLContext.getInstance(TLS);
        KeyManager[] km = createKeyManagers(keyStore, keyStorePassword);
        sslContext.init(km, trustManagers, new SecureRandom());
        this.mFactory = sslContext.getSocketFactory();
    }

    private void readSSLParameters(SSLSocket sslSocket) {
        List<String> protocolsToEnable = new ArrayList<>();
        List<String> supportedProtocols = Arrays.asList(sslSocket.getSupportedProtocols());
        String[] arr$ = StrongConstants.ENABLED_PROTOCOLS;
        for (String enabledProtocol : arr$) {
            if (supportedProtocols.contains(enabledProtocol)) {
                protocolsToEnable.add(enabledProtocol);
            }
        }
        this.mProtocols = (String[]) protocolsToEnable.toArray(new String[protocolsToEnable.size()]);
        List<String> cipherSuitesToEnable = new ArrayList<>();
        List<String> supportedCipherSuites = Arrays.asList(sslSocket.getSupportedCipherSuites());
        String[] arr$2 = StrongConstants.ENABLED_CIPHERS;
        for (String enabledCipherSuite : arr$2) {
            if (supportedCipherSuites.contains(enabledCipherSuite)) {
                cipherSuitesToEnable.add(enabledCipherSuite);
            }
        }
        this.mCipherSuites = (String[]) cipherSuitesToEnable.toArray(new String[cipherSuitesToEnable.size()]);
    }

    private KeyManager[] createKeyManagers(KeyStore keystore, String password) throws KeyStoreException, NoSuchAlgorithmException, UnrecoverableKeyException {
        if (keystore == null) {
            throw new IllegalArgumentException("Keystore may not be null");
        }
        KeyManagerFactory kmfactory = KeyManagerFactory.getInstance(KeyManagerFactory.getDefaultAlgorithm());
        kmfactory.init(keystore, password != null ? password.toCharArray() : null);
        return kmfactory.getKeyManagers();
    }

    public Socket createSocket() throws IOException {
        Socket newSocket = this.mFactory.createSocket();
        enableStrongerDefaults(newSocket);
        return newSocket;
    }

    public Socket createSocket(Socket socket, String host, int port, boolean autoClose) throws IOException, UnknownHostException {
        Socket newSocket = this.mFactory.createSocket(socket, host, port, autoClose);
        enableStrongerDefaults(newSocket);
        return newSocket;
    }

    private void enableStrongerDefaults(Socket socket) {
        if (isSecure(socket)) {
            SSLSocket sslSocket = (SSLSocket) socket;
            readSSLParameters(sslSocket);
            if (this.mEnableStongerDefaultProtocalVersion && this.mProtocols != null) {
                sslSocket.setEnabledProtocols(this.mProtocols);
            }
            if (this.mEnableStongerDefaultSSLCipherSuite && this.mCipherSuites != null) {
                sslSocket.setEnabledCipherSuites(this.mCipherSuites);
            }
        }
    }

    public boolean isSecure(Socket sock) throws IllegalArgumentException {
        return sock instanceof SSLSocket;
    }

    public void setProxy(Proxy proxy) {
        this.mProxy = proxy;
    }

    public Proxy getProxy() {
        return this.mProxy;
    }

    public boolean isEnableStongerDefaultSSLCipherSuite() {
        return this.mEnableStongerDefaultSSLCipherSuite;
    }

    public void setEnableStongerDefaultSSLCipherSuite(boolean enable) {
        this.mEnableStongerDefaultSSLCipherSuite = enable;
    }

    public boolean isEnableStongerDefaultProtocalVersion() {
        return this.mEnableStongerDefaultProtocalVersion;
    }

    public void setEnableStongerDefaultProtocalVersion(boolean enable) {
        this.mEnableStongerDefaultProtocalVersion = enable;
    }

    public Socket createSocket(HttpParams httpParams) throws IOException {
        Socket newSocket = this.mFactory.createSocket();
        enableStrongerDefaults(newSocket);
        return newSocket;
    }

    public Socket createLayeredSocket(Socket arg0, String arg1, int arg2, boolean arg3) throws IOException, UnknownHostException {
        return this.mFactory.createLayeredSocket(arg0, arg1, arg2, arg3);
    }
}
