package cz.msebera.android.httpclient.cookie;

import cz.msebera.android.httpclient.Header;
import java.util.List;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/cookie/CookieSpec.class */
public interface CookieSpec {
    int getVersion();

    List<Cookie> parse(Header header, CookieOrigin cookieOrigin) throws MalformedCookieException;

    void validate(Cookie cookie, CookieOrigin cookieOrigin) throws MalformedCookieException;

    boolean match(Cookie cookie, CookieOrigin cookieOrigin);

    List<Header> formatCookies(List<Cookie> list);

    Header getVersionHeader();
}
