package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.ConnectionReuseStrategy;
import cz.msebera.android.httpclient.annotation.ThreadSafe;
import cz.msebera.android.httpclient.conn.ClientConnectionManager;
import cz.msebera.android.httpclient.conn.routing.HttpRoutePlanner;
import cz.msebera.android.httpclient.impl.DefaultConnectionReuseStrategy;
import cz.msebera.android.httpclient.impl.NoConnectionReuseStrategy;
import cz.msebera.android.httpclient.impl.conn.PoolingClientConnectionManager;
import cz.msebera.android.httpclient.impl.conn.ProxySelectorRoutePlanner;
import cz.msebera.android.httpclient.impl.conn.SchemeRegistryFactory;
import cz.msebera.android.httpclient.params.HttpParams;
import java.net.ProxySelector;

@Deprecated
@ThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/SystemDefaultHttpClient.class */
public class SystemDefaultHttpClient extends DefaultHttpClient {
    public SystemDefaultHttpClient(HttpParams params) {
        super(null, params);
    }

    public SystemDefaultHttpClient() {
        super(null, null);
    }

    @Override // cz.msebera.android.httpclient.impl.client.AbstractHttpClient
    protected ClientConnectionManager createClientConnectionManager() {
        PoolingClientConnectionManager connmgr = new PoolingClientConnectionManager(SchemeRegistryFactory.createSystemDefault());
        String s = System.getProperty("http.keepAlive", "true");
        if ("true".equalsIgnoreCase(s)) {
            String s2 = System.getProperty("http.maxConnections", "5");
            int max = Integer.parseInt(s2);
            connmgr.setDefaultMaxPerRoute(max);
            connmgr.setMaxTotal(2 * max);
        }
        return connmgr;
    }

    @Override // cz.msebera.android.httpclient.impl.client.AbstractHttpClient
    protected HttpRoutePlanner createHttpRoutePlanner() {
        return new ProxySelectorRoutePlanner(getConnectionManager().getSchemeRegistry(), ProxySelector.getDefault());
    }

    @Override // cz.msebera.android.httpclient.impl.client.AbstractHttpClient
    protected ConnectionReuseStrategy createConnectionReuseStrategy() {
        String s = System.getProperty("http.keepAlive", "true");
        if ("true".equalsIgnoreCase(s)) {
            return new DefaultConnectionReuseStrategy();
        }
        return new NoConnectionReuseStrategy();
    }
}
