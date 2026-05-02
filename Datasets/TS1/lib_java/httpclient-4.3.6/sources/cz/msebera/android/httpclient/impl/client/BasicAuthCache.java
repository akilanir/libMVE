package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.auth.AuthScheme;
import cz.msebera.android.httpclient.client.AuthCache;
import cz.msebera.android.httpclient.conn.SchemePortResolver;
import cz.msebera.android.httpclient.conn.UnsupportedSchemeException;
import cz.msebera.android.httpclient.impl.conn.DefaultSchemePortResolver;
import cz.msebera.android.httpclient.util.Args;
import java.util.HashMap;

@NotThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/BasicAuthCache.class */
public class BasicAuthCache implements AuthCache {
    private final HashMap<HttpHost, AuthScheme> map;
    private final SchemePortResolver schemePortResolver;

    public BasicAuthCache(SchemePortResolver schemePortResolver) {
        this.map = new HashMap<>();
        this.schemePortResolver = schemePortResolver != null ? schemePortResolver : DefaultSchemePortResolver.INSTANCE;
    }

    public BasicAuthCache() {
        this(null);
    }

    protected HttpHost getKey(HttpHost host) {
        if (host.getPort() <= 0) {
            try {
                int port = this.schemePortResolver.resolve(host);
                return new HttpHost(host.getHostName(), port, host.getSchemeName());
            } catch (UnsupportedSchemeException e) {
                return host;
            }
        }
        return host;
    }

    @Override // cz.msebera.android.httpclient.client.AuthCache
    public void put(HttpHost host, AuthScheme authScheme) {
        Args.notNull(host, "HTTP host");
        this.map.put(getKey(host), authScheme);
    }

    @Override // cz.msebera.android.httpclient.client.AuthCache
    public AuthScheme get(HttpHost host) {
        Args.notNull(host, "HTTP host");
        return this.map.get(getKey(host));
    }

    @Override // cz.msebera.android.httpclient.client.AuthCache
    public void remove(HttpHost host) {
        Args.notNull(host, "HTTP host");
        this.map.remove(getKey(host));
    }

    @Override // cz.msebera.android.httpclient.client.AuthCache
    public void clear() {
        this.map.clear();
    }

    public String toString() {
        return this.map.toString();
    }
}
