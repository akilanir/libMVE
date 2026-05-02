package cz.msebera.android.httpclient.impl.cookie;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.cookie.CookieSpec;
import cz.msebera.android.httpclient.cookie.CookieSpecFactory;
import cz.msebera.android.httpclient.cookie.CookieSpecProvider;
import cz.msebera.android.httpclient.params.HttpParams;
import cz.msebera.android.httpclient.protocol.HttpContext;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/cookie/IgnoreSpecFactory.class */
public class IgnoreSpecFactory implements CookieSpecFactory, CookieSpecProvider {
    @Override // cz.msebera.android.httpclient.cookie.CookieSpecFactory
    public CookieSpec newInstance(HttpParams params) {
        return new IgnoreSpec();
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieSpecProvider
    public CookieSpec create(HttpContext context) {
        return new IgnoreSpec();
    }
}
