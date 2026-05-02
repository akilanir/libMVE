package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.UserTokenHandler;
import cz.msebera.android.httpclient.protocol.HttpContext;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/NoopUserTokenHandler.class */
public class NoopUserTokenHandler implements UserTokenHandler {
    public static final NoopUserTokenHandler INSTANCE = new NoopUserTokenHandler();

    @Override // cz.msebera.android.httpclient.client.UserTokenHandler
    public Object getUserToken(HttpContext context) {
        return null;
    }
}
