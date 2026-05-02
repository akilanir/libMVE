package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.methods.HttpPost;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/LaxRedirectStrategy.class */
public class LaxRedirectStrategy extends DefaultRedirectStrategy {
    private static final String[] REDIRECT_METHODS = {"GET", HttpPost.METHOD_NAME, "HEAD"};

    @Override // cz.msebera.android.httpclient.impl.client.DefaultRedirectStrategy
    protected boolean isRedirectable(String method) {
        for (String m : REDIRECT_METHODS) {
            if (m.equalsIgnoreCase(method)) {
                return true;
            }
        }
        return false;
    }
}
