package cz.msebera.android.httpclient.client;

import cz.msebera.android.httpclient.cookie.Cookie;
import java.util.Date;
import java.util.List;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/CookieStore.class */
public interface CookieStore {
    void addCookie(Cookie cookie);

    List<Cookie> getCookies();

    boolean clearExpired(Date date);

    void clear();
}
