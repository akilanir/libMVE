package cz.msebera.android.httpclient.cookie;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/cookie/CookieAttributeHandler.class */
public interface CookieAttributeHandler {
    void parse(SetCookie setCookie, String str) throws MalformedCookieException;

    void validate(Cookie cookie, CookieOrigin cookieOrigin) throws MalformedCookieException;

    boolean match(Cookie cookie, CookieOrigin cookieOrigin);
}
