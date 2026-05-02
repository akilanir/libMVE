package cz.msebera.android.httpclient.impl.cookie;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.cookie.MalformedCookieException;
import cz.msebera.android.httpclient.cookie.SM;
import cz.msebera.android.httpclient.cookie.SetCookie;
import cz.msebera.android.httpclient.util.Args;
import java.util.Date;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/cookie/BasicExpiresHandler.class */
public class BasicExpiresHandler extends AbstractCookieAttributeHandler {
    private final String[] datepatterns;

    public BasicExpiresHandler(String[] datepatterns) {
        Args.notNull(datepatterns, "Array of date patterns");
        this.datepatterns = datepatterns;
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieAttributeHandler
    public void parse(SetCookie cookie, String value) throws MalformedCookieException {
        Args.notNull(cookie, SM.COOKIE);
        if (value == null) {
            throw new MalformedCookieException("Missing value for expires attribute");
        }
        Date expiry = cz.msebera.android.httpclient.client.utils.DateUtils.parseDate(value, this.datepatterns);
        if (expiry == null) {
            throw new MalformedCookieException("Unable to parse expires attribute: " + value);
        }
        cookie.setExpiryDate(expiry);
    }
}
