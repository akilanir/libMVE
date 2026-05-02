package com.loopj.android.http;

import cz.msebera.android.httpclient.HttpVersion;
import cz.msebera.android.httpclient.conn.scheme.PlainSocketFactory;
import cz.msebera.android.httpclient.conn.scheme.Scheme;
import cz.msebera.android.httpclient.conn.scheme.SchemeRegistry;
import cz.msebera.android.httpclient.conn.ssl.SSLSocketFactory;
import cz.msebera.android.httpclient.impl.client.DefaultHttpClient;
import cz.msebera.android.httpclient.impl.conn.tsccm.ThreadSafeClientConnManager;
import cz.msebera.android.httpclient.params.BasicHttpParams;
import cz.msebera.android.httpclient.params.HttpProtocolParams;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.Socket;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

/* loaded from: android-async-http-1.4.9.jar:com/loopj/android/http/MySSLSocketFactory.class */
public class MySSLSocketFactory extends SSLSocketFactory {
    final SSLContext sslContext;

    public MySSLSocketFactory(KeyStore truststore) throws NoSuchAlgorithmException, KeyManagementException, KeyStoreException, UnrecoverableKeyException {
        super(truststore);
        this.sslContext = SSLContext.getInstance("TLS");
        X509TrustManager tm = new X509TrustManager() { // from class: com.loopj.android.http.MySSLSocketFactory.1
            @Override // javax.net.ssl.X509TrustManager
            public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
            }

            @Override // javax.net.ssl.X509TrustManager
            public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
            }

            @Override // javax.net.ssl.X509TrustManager
            public X509Certificate[] getAcceptedIssuers() {
                return null;
            }
        };
        this.sslContext.init(null, new TrustManager[]{tm}, null);
    }

    public static KeyStore getKeystoreOfCA(InputStream cert) {
        InputStream caInput = null;
        Certificate ca = null;
        try {
            try {
                CertificateFactory cf = CertificateFactory.getInstance("X.509");
                caInput = new BufferedInputStream(cert);
                ca = cf.generateCertificate(caInput);
                if (caInput != null) {
                    try {
                        caInput.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            } catch (Throwable th) {
                if (caInput != null) {
                    try {
                        caInput.close();
                    } catch (IOException e2) {
                        e2.printStackTrace();
                        throw th;
                    }
                }
                throw th;
            }
        } catch (CertificateException e1) {
            e1.printStackTrace();
            if (caInput != null) {
                try {
                    caInput.close();
                } catch (IOException e3) {
                    e3.printStackTrace();
                }
            }
        }
        String keyStoreType = KeyStore.getDefaultType();
        KeyStore keyStore = null;
        try {
            keyStore = KeyStore.getInstance(keyStoreType);
            keyStore.load(null, null);
            keyStore.setCertificateEntry("ca", ca);
        } catch (Exception e4) {
            e4.printStackTrace();
        }
        return keyStore;
    }

    public static KeyStore getKeystore() {
        KeyStore trustStore = null;
        try {
            trustStore = KeyStore.getInstance(KeyStore.getDefaultType());
            trustStore.load(null, null);
        } catch (Throwable t) {
            t.printStackTrace();
        }
        return trustStore;
    }

    public static SSLSocketFactory getFixedSocketFactory() {
        SSLSocketFactory socketFactory;
        try {
            socketFactory = new MySSLSocketFactory(getKeystore());
            socketFactory.setHostnameVerifier(SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
        } catch (Throwable t) {
            t.printStackTrace();
            socketFactory = SSLSocketFactory.getSocketFactory();
        }
        return socketFactory;
    }

    public static DefaultHttpClient getNewHttpClient(KeyStore keyStore) {
        try {
            SSLSocketFactory sf = new MySSLSocketFactory(keyStore);
            SchemeRegistry registry = new SchemeRegistry();
            registry.register(new Scheme("http", PlainSocketFactory.getSocketFactory(), 80));
            registry.register(new Scheme("https", sf, 443));
            BasicHttpParams basicHttpParams = new BasicHttpParams();
            HttpProtocolParams.setVersion(basicHttpParams, HttpVersion.HTTP_1_1);
            HttpProtocolParams.setContentCharset(basicHttpParams, AsyncHttpResponseHandler.DEFAULT_CHARSET);
            return new DefaultHttpClient(new ThreadSafeClientConnManager(basicHttpParams, registry), basicHttpParams);
        } catch (Exception e) {
            return new DefaultHttpClient();
        }
    }

    public Socket createSocket(Socket socket, String host, int port, boolean autoClose) throws IOException {
        return this.sslContext.getSocketFactory().createSocket(socket, host, port, autoClose);
    }

    public Socket createSocket() throws IOException {
        return this.sslContext.getSocketFactory().createSocket();
    }

    public void fixHttpsURLConnection() {
        HttpsURLConnection.setDefaultSSLSocketFactory(this.sslContext.getSocketFactory());
    }
}
