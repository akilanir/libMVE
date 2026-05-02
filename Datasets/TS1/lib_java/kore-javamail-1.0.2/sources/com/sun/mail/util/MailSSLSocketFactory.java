package com.sun.mail.util;

import java.io.IOException;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import java.security.GeneralSecurityException;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Arrays;
import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.TrustManagerFactory;
import javax.net.ssl.X509TrustManager;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/MailSSLSocketFactory.class */
public class MailSSLSocketFactory extends SSLSocketFactory {
    private boolean trustAllHosts;
    private String[] trustedHosts;
    private SSLContext sslcontext;
    private KeyManager[] keyManagers;
    private TrustManager[] trustManagers;
    private SecureRandom secureRandom;
    private SSLSocketFactory adapteeFactory;

    public MailSSLSocketFactory() throws GeneralSecurityException {
        this("TLS");
    }

    public MailSSLSocketFactory(String protocol) throws GeneralSecurityException {
        this.trustedHosts = null;
        this.adapteeFactory = null;
        this.trustAllHosts = false;
        this.sslcontext = SSLContext.getInstance(protocol);
        this.keyManagers = null;
        this.trustManagers = new TrustManager[]{new MailTrustManager()};
        this.secureRandom = null;
        newAdapteeFactory();
    }

    private synchronized void newAdapteeFactory() throws KeyManagementException {
        this.sslcontext.init(this.keyManagers, this.trustManagers, this.secureRandom);
        this.adapteeFactory = this.sslcontext.getSocketFactory();
    }

    public synchronized KeyManager[] getKeyManagers() {
        return (KeyManager[]) this.keyManagers.clone();
    }

    public synchronized void setKeyManagers(KeyManager[] keyManagers) throws GeneralSecurityException {
        this.keyManagers = (KeyManager[]) keyManagers.clone();
        newAdapteeFactory();
    }

    public synchronized SecureRandom getSecureRandom() {
        return this.secureRandom;
    }

    public synchronized void setSecureRandom(SecureRandom secureRandom) throws GeneralSecurityException {
        this.secureRandom = secureRandom;
        newAdapteeFactory();
    }

    public synchronized TrustManager[] getTrustManagers() {
        return this.trustManagers;
    }

    public synchronized void setTrustManagers(TrustManager[] trustManagers) throws GeneralSecurityException {
        this.trustManagers = trustManagers;
        newAdapteeFactory();
    }

    public synchronized boolean isTrustAllHosts() {
        return this.trustAllHosts;
    }

    public synchronized void setTrustAllHosts(boolean trustAllHosts) {
        this.trustAllHosts = trustAllHosts;
    }

    public synchronized String[] getTrustedHosts() {
        return (String[]) this.trustedHosts.clone();
    }

    public synchronized void setTrustedHosts(String[] trustedHosts) {
        this.trustedHosts = (String[]) trustedHosts.clone();
    }

    public synchronized boolean isServerTrusted(String server, SSLSocket sslSocket) {
        if (!this.trustAllHosts && this.trustedHosts != null) {
            return Arrays.asList(this.trustedHosts).contains(server);
        }
        return true;
    }

    @Override // javax.net.ssl.SSLSocketFactory
    public synchronized Socket createSocket(Socket socket, String s, int i, boolean flag) throws IOException {
        return this.adapteeFactory.createSocket(socket, s, i, flag);
    }

    @Override // javax.net.ssl.SSLSocketFactory
    public synchronized String[] getDefaultCipherSuites() {
        return this.adapteeFactory.getDefaultCipherSuites();
    }

    @Override // javax.net.ssl.SSLSocketFactory
    public synchronized String[] getSupportedCipherSuites() {
        return this.adapteeFactory.getSupportedCipherSuites();
    }

    @Override // javax.net.SocketFactory
    public synchronized Socket createSocket() throws IOException {
        return this.adapteeFactory.createSocket();
    }

    @Override // javax.net.SocketFactory
    public synchronized Socket createSocket(InetAddress inetaddress, int i, InetAddress inetaddress1, int j) throws IOException {
        return this.adapteeFactory.createSocket(inetaddress, i, inetaddress1, j);
    }

    @Override // javax.net.SocketFactory
    public synchronized Socket createSocket(InetAddress inetaddress, int i) throws IOException {
        return this.adapteeFactory.createSocket(inetaddress, i);
    }

    @Override // javax.net.SocketFactory
    public synchronized Socket createSocket(String s, int i, InetAddress inetaddress, int j) throws IOException, UnknownHostException {
        return this.adapteeFactory.createSocket(s, i, inetaddress, j);
    }

    @Override // javax.net.SocketFactory
    public synchronized Socket createSocket(String s, int i) throws IOException, UnknownHostException {
        return this.adapteeFactory.createSocket(s, i);
    }

    /* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/MailSSLSocketFactory$MailTrustManager.class */
    private class MailTrustManager implements X509TrustManager {
        private X509TrustManager adapteeTrustManager;

        private MailTrustManager() throws GeneralSecurityException {
            this.adapteeTrustManager = null;
            TrustManagerFactory tmf = TrustManagerFactory.getInstance("X509");
            tmf.init((KeyStore) null);
            this.adapteeTrustManager = (X509TrustManager) tmf.getTrustManagers()[0];
        }

        @Override // javax.net.ssl.X509TrustManager
        public void checkClientTrusted(X509Certificate[] certs, String authType) throws CertificateException {
            if (!MailSSLSocketFactory.this.isTrustAllHosts() && MailSSLSocketFactory.this.getTrustedHosts() == null) {
                this.adapteeTrustManager.checkClientTrusted(certs, authType);
            }
        }

        @Override // javax.net.ssl.X509TrustManager
        public void checkServerTrusted(X509Certificate[] certs, String authType) throws CertificateException {
            if (!MailSSLSocketFactory.this.isTrustAllHosts() && MailSSLSocketFactory.this.getTrustedHosts() == null) {
                this.adapteeTrustManager.checkServerTrusted(certs, authType);
            }
        }

        @Override // javax.net.ssl.X509TrustManager
        public X509Certificate[] getAcceptedIssuers() {
            return this.adapteeTrustManager.getAcceptedIssuers();
        }
    }
}
