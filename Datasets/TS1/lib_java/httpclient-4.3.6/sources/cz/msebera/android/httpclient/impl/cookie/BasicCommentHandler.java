package cz.msebera.android.httpclient.impl.cookie;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.cookie.MalformedCookieException;
import cz.msebera.android.httpclient.cookie.SM;
import cz.msebera.android.httpclient.cookie.SetCookie;
import cz.msebera.android.httpclient.util.Args;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/cookie/BasicCommentHandler.class */
public class BasicCommentHandler extends AbstractCookieAttributeHandler {
    @Override // cz.msebera.android.httpclient.cookie.CookieAttributeHandler
    public void parse(SetCookie cookie, String value) throws MalformedCookieException {
        Args.notNull(cookie, SM.COOKIE);
        cookie.setComment(value);
    }
}
