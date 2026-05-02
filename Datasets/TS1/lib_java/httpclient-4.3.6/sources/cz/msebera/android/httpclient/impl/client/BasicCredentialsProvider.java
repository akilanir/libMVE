package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.annotation.ThreadSafe;
import cz.msebera.android.httpclient.auth.AuthScope;
import cz.msebera.android.httpclient.auth.Credentials;
import cz.msebera.android.httpclient.client.CredentialsProvider;
import cz.msebera.android.httpclient.util.Args;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@ThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/BasicCredentialsProvider.class */
public class BasicCredentialsProvider implements CredentialsProvider {
    private final ConcurrentHashMap<AuthScope, Credentials> credMap = new ConcurrentHashMap<>();

    @Override // cz.msebera.android.httpclient.client.CredentialsProvider
    public void setCredentials(AuthScope authscope, Credentials credentials) {
        Args.notNull(authscope, "Authentication scope");
        this.credMap.put(authscope, credentials);
    }

    private static Credentials matchCredentials(Map<AuthScope, Credentials> map, AuthScope authscope) {
        Credentials creds = map.get(authscope);
        if (creds == null) {
            int bestMatchFactor = -1;
            AuthScope bestMatch = null;
            for (AuthScope current : map.keySet()) {
                int factor = authscope.match(current);
                if (factor > bestMatchFactor) {
                    bestMatchFactor = factor;
                    bestMatch = current;
                }
            }
            if (bestMatch != null) {
                creds = map.get(bestMatch);
            }
        }
        return creds;
    }

    @Override // cz.msebera.android.httpclient.client.CredentialsProvider
    public Credentials getCredentials(AuthScope authscope) {
        Args.notNull(authscope, "Authentication scope");
        return matchCredentials(this.credMap, authscope);
    }

    @Override // cz.msebera.android.httpclient.client.CredentialsProvider
    public void clear() {
        this.credMap.clear();
    }

    public String toString() {
        return this.credMap.toString();
    }
}
