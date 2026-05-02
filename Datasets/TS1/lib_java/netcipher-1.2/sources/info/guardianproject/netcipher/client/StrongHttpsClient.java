package info.guardianproject.netcipher.client;

import android.content.Context;
import android.util.Log;
import ch.boye.httpclientandroidlib.HttpHost;
import ch.boye.httpclientandroidlib.conn.ClientConnectionOperator;
import ch.boye.httpclientandroidlib.conn.scheme.PlainSocketFactory;
import ch.boye.httpclientandroidlib.conn.scheme.Scheme;
import ch.boye.httpclientandroidlib.conn.scheme.SchemeRegistry;
import ch.boye.httpclientandroidlib.impl.client.DefaultHttpClient;
import ch.boye.httpclientandroidlib.impl.conn.tsccm.ThreadSafeClientConnManager;
import info.guardianproject.onionkit.R;
import java.io.IOException;
import java.io.InputStream;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import javax.net.ssl.TrustManagerFactory;

/* loaded from: netcipher-1.2.jar:info/guardianproject/netcipher/client/StrongHttpsClient.class */
public class StrongHttpsClient extends DefaultHttpClient {
    final Context context;
    private HttpHost proxyHost;
    private String proxyType;
    private StrongSSLSocketFactory sFactory;
    private SchemeRegistry mRegistry = new SchemeRegistry();
    private static final String TRUSTSTORE_TYPE = "BKS";
    private static final String TRUSTSTORE_PASSWORD = "changeit";
    public static final String TYPE_SOCKS = "socks";
    public static final String TYPE_HTTP = "http";

    public StrongHttpsClient(Context context) {
        this.context = context;
        this.mRegistry.register(new Scheme(TYPE_HTTP, 80, PlainSocketFactory.getSocketFactory()));
        try {
            KeyStore keyStore = loadKeyStore();
            TrustManagerFactory trustManagerFactory = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
            trustManagerFactory.init(keyStore);
            this.sFactory = new StrongSSLSocketFactory(context, trustManagerFactory.getTrustManagers(), keyStore, TRUSTSTORE_PASSWORD);
            this.mRegistry.register(new Scheme("https", 443, this.sFactory));
        } catch (Exception e) {
            throw new AssertionError(e);
        }
    }

    private KeyStore loadKeyStore() throws KeyStoreException, NoSuchAlgorithmException, CertificateException, IOException {
        KeyStore trustStore = KeyStore.getInstance(TRUSTSTORE_TYPE);
        InputStream in = this.context.getResources().openRawResource(R.raw.debiancacerts);
        trustStore.load(in, TRUSTSTORE_PASSWORD.toCharArray());
        return trustStore;
    }

    public StrongHttpsClient(Context context, KeyStore keystore) {
        this.context = context;
        this.mRegistry.register(new Scheme(TYPE_HTTP, 80, PlainSocketFactory.getSocketFactory()));
        try {
            TrustManagerFactory trustManagerFactory = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
            this.sFactory = new StrongSSLSocketFactory(context, trustManagerFactory.getTrustManagers(), keystore, TRUSTSTORE_PASSWORD);
            this.mRegistry.register(new Scheme("https", 443, this.sFactory));
        } catch (Exception e) {
            throw new AssertionError(e);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* renamed from: createClientConnectionManager, reason: merged with bridge method [inline-methods] */
    public ThreadSafeClientConnManager m2createClientConnectionManager() {
        if (this.proxyHost == null && this.proxyType == null) {
            Log.d("StrongHTTPS", "not proxying");
            return new MyThreadSafeClientConnManager(getParams(), this.mRegistry);
        }
        if (this.proxyHost != null && this.proxyType.equalsIgnoreCase(TYPE_SOCKS)) {
            Log.d("StrongHTTPS", "proxying using: " + this.proxyType);
            return new MyThreadSafeClientConnManager(getParams(), this.mRegistry) { // from class: info.guardianproject.netcipher.client.StrongHttpsClient.1
                @Override // info.guardianproject.netcipher.client.MyThreadSafeClientConnManager
                protected ClientConnectionOperator createConnectionOperator(SchemeRegistry schreg) {
                    return new SocksProxyClientConnOperator(schreg, StrongHttpsClient.this.proxyHost.getHostName(), StrongHttpsClient.this.proxyHost.getPort());
                }
            };
        }
        Log.d("StrongHTTPS", "proxying with: " + this.proxyType);
        return new MyThreadSafeClientConnManager(getParams(), this.mRegistry);
    }

    public void useProxy(boolean enableTor, String type, String host, int port) {
        if (enableTor) {
            this.proxyType = type;
            if (type.equalsIgnoreCase(TYPE_SOCKS)) {
                this.proxyHost = new HttpHost(host, port);
                return;
            } else {
                this.proxyHost = new HttpHost(host, port, type);
                getParams().setParameter("http.route.default-proxy", this.proxyHost);
                return;
            }
        }
        getParams().removeParameter("http.route.default-proxy");
        this.proxyHost = null;
    }

    public void disableProxy() {
        getParams().removeParameter("http.route.default-proxy");
        this.proxyHost = null;
    }
}
