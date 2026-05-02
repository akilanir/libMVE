package okhttp3;

import java.util.Collections;
import java.util.List;

/* loaded from: okhttp-3.1.2.jar:okhttp3/CookieJar.class */
public interface CookieJar {
    public static final CookieJar NO_COOKIES = new CookieJar() { // from class: okhttp3.CookieJar.1
        @Override // okhttp3.CookieJar
        public void saveFromResponse(HttpUrl url, List<Cookie> cookies) {
        }

        @Override // okhttp3.CookieJar
        public List<Cookie> loadForRequest(HttpUrl url) {
            return Collections.emptyList();
        }
    };

    void saveFromResponse(HttpUrl httpUrl, List<Cookie> list);

    List<Cookie> loadForRequest(HttpUrl httpUrl);
}
