package com.koushikdutta.ion.cookie;

import android.content.SharedPreferences;
import android.text.TextUtils;
import android.util.Log;
import com.koushikdutta.async.http.AsyncHttpClientMiddleware;
import com.koushikdutta.async.http.Headers;
import com.koushikdutta.async.http.SimpleMiddleware;
import com.koushikdutta.ion.Ion;
import java.net.CookieManager;
import java.net.CookieStore;
import java.net.HttpCookie;
import java.net.URI;
import java.util.List;
import java.util.Map;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/cookie/CookieMiddleware.class */
public class CookieMiddleware extends SimpleMiddleware {
    CookieManager manager;
    SharedPreferences preferences;
    Ion ion;

    public CookieStore getCookieStore() {
        return this.manager.getCookieStore();
    }

    public void clear() {
        maybeInit();
        getCookieStore().removeAll();
        this.preferences.edit().clear().apply();
    }

    public CookieManager getCookieManager() {
        maybeInit();
        return this.manager;
    }

    public CookieMiddleware(Ion ion) {
        this.ion = ion;
    }

    public void reinit() {
        this.manager = new CookieManager(null, null);
        this.preferences = this.ion.getContext().getSharedPreferences(this.ion.getName() + "-cookies", 0);
        Map<String, ?> allPrefs = this.preferences.getAll();
        for (String key : allPrefs.keySet()) {
            try {
                String value = this.preferences.getString(key, null);
                Headers headers = new Headers();
                String[] lines = value.split("\n");
                boolean first = true;
                for (String line : lines) {
                    if (first) {
                        first = false;
                    } else if (!TextUtils.isEmpty(line)) {
                        headers.addLine(line);
                    }
                }
                this.manager.put(URI.create(key), headers.getMultiMap());
            } catch (Exception e) {
                Log.e("Ion", "unable to load cookies", e);
            }
        }
    }

    public static void addCookies(Map<String, List<String>> allCookieHeaders, Headers headers) {
        for (Map.Entry<String, List<String>> entry : allCookieHeaders.entrySet()) {
            String key = entry.getKey();
            if ("Cookie".equalsIgnoreCase(key) || "Cookie2".equalsIgnoreCase(key)) {
                headers.addAll(key, entry.getValue());
            }
        }
    }

    private void maybeInit() {
        if (this.manager == null) {
            reinit();
        }
    }

    public void onRequest(AsyncHttpClientMiddleware.OnRequestData data) {
        maybeInit();
        try {
            Map<String, List<String>> cookies = this.manager.get(URI.create(data.request.getUri().toString()), data.request.getHeaders().getMultiMap());
            addCookies(cookies, data.request.getHeaders());
        } catch (Exception e) {
        }
    }

    public void onHeadersReceived(AsyncHttpClientMiddleware.OnHeadersReceivedDataOnRequestSentData data) {
        maybeInit();
        try {
            put(URI.create(data.request.getUri().toString()), data.response.headers());
        } catch (Exception e) {
        }
    }

    public void put(URI uri, Headers headers) {
        maybeInit();
        try {
            this.manager.put(uri, headers.getMultiMap());
            if (headers.get("Set-Cookie") == null) {
                return;
            }
            List<HttpCookie> cookies = this.manager.getCookieStore().get(uri);
            Headers dump = new Headers();
            for (HttpCookie cookie : cookies) {
                dump.add("Set-Cookie", cookie.getName() + "=" + cookie.getValue() + "; path=" + cookie.getPath());
            }
            String key = uri.getScheme() + "://" + uri.getAuthority();
            this.preferences.edit().putString(key, dump.toPrefixString("HTTP/1.1 200 OK")).commit();
        } catch (Exception e) {
        }
    }
}
