package cz.msebera.android.httpclient.impl.cookie;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.cookie.Cookie;
import cz.msebera.android.httpclient.cookie.CookieAttributeHandler;
import cz.msebera.android.httpclient.cookie.CookieOrigin;
import cz.msebera.android.httpclient.cookie.MalformedCookieException;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/cookie/AbstractCookieAttributeHandler.class */
public abstract class AbstractCookieAttributeHandler implements CookieAttributeHandler {
    @Override // cz.msebera.android.httpclient.cookie.CookieAttributeHandler
    public void validate(Cookie cookie, CookieOrigin origin) throws MalformedCookieException {
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieAttributeHandler
    public boolean match(Cookie cookie, CookieOrigin origin) {
        return true;
    }
}
