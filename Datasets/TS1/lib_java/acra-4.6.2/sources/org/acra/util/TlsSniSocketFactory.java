package org.acra.util;

import android.annotation.TargetApi;
import android.net.SSLCertificateSocketFactory;
import android.os.Build;
import android.text.TextUtils;
import java.io.IOException;
import java.lang.reflect.Method;
import java.net.InetAddress;
import java.net.Socket;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLPeerUnverifiedException;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import org.acra.ACRA;
import org.apache.http.conn.scheme.LayeredSocketFactory;
import org.apache.http.conn.ssl.BrowserCompatHostnameVerifier;
import org.apache.http.params.HttpParams;

/* loaded from: acra-4.6.2.jar:org/acra/util/TlsSniSocketFactory.class */
public class TlsSniSocketFactory implements LayeredSocketFactory {
    private static final int VERSION_CODES_JELLY_BEAN_MR1 = 17;
    private static final int VERSION_CODES_LOLLIPOP = 21;
    private final SSLCertificateSocketFactory sslSocketFactory = (SSLCertificateSocketFactory) SSLCertificateSocketFactory.getDefault(0);
    private static final String TAG = TlsSniSocketFactory.class.getSimpleName();
    private static final HostnameVerifier hostnameVerifier = new BrowserCompatHostnameVerifier();
    private static final List<String> ALLOWED_CIPHERS = Arrays.asList("TLS_RSA_WITH_AES_256_GCM_SHA384", "TLS_RSA_WITH_AES_128_GCM_SHA256", "TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256", "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256", "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256", "TLS_ECHDE_RSA_WITH_AES_128_GCM_SHA256", "TLS_RSA_WITH_3DES_EDE_CBC_SHA", "TLS_RSA_WITH_AES_128_CBC_SHA", "TLS_RSA_WITH_AES_256_CBC_SHA", "TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA", "TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA", "TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA", "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA");

    @Override // org.apache.http.conn.scheme.SocketFactory
    public Socket connectSocket(Socket s, String host, int port, InetAddress localAddress, int localPort, HttpParams params) throws IOException {
        return null;
    }

    @Override // org.apache.http.conn.scheme.SocketFactory
    public Socket createSocket() throws IOException {
        return null;
    }

    @Override // org.apache.http.conn.scheme.SocketFactory
    public boolean isSecure(Socket s) throws IllegalArgumentException {
        return (s instanceof SSLSocket) && s.isConnected();
    }

    @Override // org.apache.http.conn.scheme.LayeredSocketFactory
    public Socket createSocket(Socket plainSocket, String host, int port, boolean autoClose) throws IOException {
        if (autoClose) {
            plainSocket.close();
        }
        SSLSocket ssl = (SSLSocket) this.sslSocketFactory.createSocket(InetAddress.getByName(host), port);
        establishAndVerify(ssl, host);
        return ssl;
    }

    private void establishAndVerify(SSLSocket socket, String host) throws IOException {
        setTlsParameters(socket);
        setSniHostname(socket, host);
        socket.startHandshake();
        SSLSession session = socket.getSession();
        if (!hostnameVerifier.verify(host, session)) {
            throw new SSLPeerUnverifiedException(host);
        }
        ACRA.log.i(TAG, "Established " + session.getProtocol() + " connection with " + session.getPeerHost() + " using " + session.getCipherSuite());
    }

    private void setTlsParameters(SSLSocket socket) {
        List<String> protocols = new LinkedList<>();
        String[] arr$ = socket.getSupportedProtocols();
        for (String protocol : arr$) {
            if (!protocol.toUpperCase().contains("SSL")) {
                protocols.add(protocol);
            }
        }
        ACRA.log.v(TAG, "Setting allowed TLS protocols: " + TextUtils.join(", ", protocols));
        socket.setEnabledProtocols((String[]) protocols.toArray(new String[protocols.size()]));
        if (Build.VERSION.SDK_INT < VERSION_CODES_LOLLIPOP) {
            Collection<?> availableCiphers = Arrays.asList(socket.getSupportedCipherSuites());
            Set<String> preferredCiphers = new HashSet<>(ALLOWED_CIPHERS);
            preferredCiphers.retainAll(availableCiphers);
            preferredCiphers.addAll(Arrays.asList(socket.getEnabledCipherSuites()));
            ACRA.log.v(TAG, "Setting allowed TLS ciphers: " + TextUtils.join(", ", preferredCiphers));
            socket.setEnabledCipherSuites((String[]) preferredCiphers.toArray(new String[preferredCiphers.size()]));
        }
    }

    @TargetApi(VERSION_CODES_JELLY_BEAN_MR1)
    private void setSniHostname(SSLSocket socket, String hostName) {
        if (Build.VERSION.SDK_INT >= VERSION_CODES_JELLY_BEAN_MR1) {
            ACRA.log.d(TAG, "Using documented SNI with host name " + hostName);
            this.sslSocketFactory.setHostname(socket, hostName);
            return;
        }
        ACRA.log.d(TAG, "No documented SNI support on Android <4.2, trying reflection method with host name " + hostName);
        try {
            Method setHostnameMethod = socket.getClass().getMethod("setHostname", String.class);
            setHostnameMethod.invoke(socket, hostName);
        } catch (Exception e) {
            ACRA.log.w(TAG, "SNI not usable", e);
        }
    }
}
