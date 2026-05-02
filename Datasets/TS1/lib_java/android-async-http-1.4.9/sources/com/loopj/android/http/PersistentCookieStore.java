package com.loopj.android.http;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;
import cz.msebera.android.httpclient.client.CookieStore;
import cz.msebera.android.httpclient.cookie.Cookie;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: android-async-http-1.4.9.jar:com/loopj/android/http/PersistentCookieStore.class */
public class PersistentCookieStore implements CookieStore {
    private static final String LOG_TAG = "PersistentCookieStore";
    private static final String COOKIE_PREFS = "CookiePrefsFile";
    private static final String COOKIE_NAME_STORE = "names";
    private static final String COOKIE_NAME_PREFIX = "cookie_";
    private final SharedPreferences cookiePrefs;
    private boolean omitNonPersistentCookies = false;
    private final ConcurrentHashMap<String, Cookie> cookies = new ConcurrentHashMap<>();

    public PersistentCookieStore(Context context) {
        Cookie decodedCookie;
        this.cookiePrefs = context.getSharedPreferences(COOKIE_PREFS, 0);
        String storedCookieNames = this.cookiePrefs.getString(COOKIE_NAME_STORE, null);
        if (storedCookieNames != null) {
            String[] cookieNames = TextUtils.split(storedCookieNames, ",");
            for (String name : cookieNames) {
                String encodedCookie = this.cookiePrefs.getString(COOKIE_NAME_PREFIX + name, null);
                if (encodedCookie != null && (decodedCookie = decodeCookie(encodedCookie)) != null) {
                    this.cookies.put(name, decodedCookie);
                }
            }
            clearExpired(new Date());
        }
    }

    public void addCookie(Cookie cookie) {
        if (this.omitNonPersistentCookies && !cookie.isPersistent()) {
            return;
        }
        String name = cookie.getName() + cookie.getDomain();
        if (!cookie.isExpired(new Date())) {
            this.cookies.put(name, cookie);
        } else {
            this.cookies.remove(name);
        }
        SharedPreferences.Editor prefsWriter = this.cookiePrefs.edit();
        prefsWriter.putString(COOKIE_NAME_STORE, TextUtils.join(",", this.cookies.keySet()));
        prefsWriter.putString(COOKIE_NAME_PREFIX + name, encodeCookie(new SerializableCookie(cookie)));
        prefsWriter.commit();
    }

    public void clear() {
        SharedPreferences.Editor prefsWriter = this.cookiePrefs.edit();
        for (String name : this.cookies.keySet()) {
            prefsWriter.remove(COOKIE_NAME_PREFIX + name);
        }
        prefsWriter.remove(COOKIE_NAME_STORE);
        prefsWriter.commit();
        this.cookies.clear();
    }

    public boolean clearExpired(Date date) {
        boolean clearedAny = false;
        SharedPreferences.Editor prefsWriter = this.cookiePrefs.edit();
        for (Map.Entry<String, Cookie> entry : this.cookies.entrySet()) {
            String name = entry.getKey();
            Cookie cookie = entry.getValue();
            if (cookie.isExpired(date)) {
                this.cookies.remove(name);
                prefsWriter.remove(COOKIE_NAME_PREFIX + name);
                clearedAny = true;
            }
        }
        if (clearedAny) {
            prefsWriter.putString(COOKIE_NAME_STORE, TextUtils.join(",", this.cookies.keySet()));
        }
        prefsWriter.commit();
        return clearedAny;
    }

    public List<Cookie> getCookies() {
        return new ArrayList(this.cookies.values());
    }

    public void setOmitNonPersistentCookies(boolean omitNonPersistentCookies) {
        this.omitNonPersistentCookies = omitNonPersistentCookies;
    }

    public void deleteCookie(Cookie cookie) {
        String name = cookie.getName() + cookie.getDomain();
        this.cookies.remove(name);
        SharedPreferences.Editor prefsWriter = this.cookiePrefs.edit();
        prefsWriter.remove(COOKIE_NAME_PREFIX + name);
        prefsWriter.commit();
    }

    protected String encodeCookie(SerializableCookie cookie) {
        if (cookie == null) {
            return null;
        }
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        try {
            ObjectOutputStream outputStream = new ObjectOutputStream(os);
            outputStream.writeObject(cookie);
            return byteArrayToHexString(os.toByteArray());
        } catch (IOException e) {
            AsyncHttpClient.log.d(LOG_TAG, "IOException in encodeCookie", e);
            return null;
        }
    }

    protected Cookie decodeCookie(String cookieString) {
        byte[] bytes = hexStringToByteArray(cookieString);
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
        Cookie cookie = null;
        try {
            ObjectInputStream objectInputStream = new ObjectInputStream(byteArrayInputStream);
            cookie = ((SerializableCookie) objectInputStream.readObject()).getCookie();
        } catch (IOException e) {
            AsyncHttpClient.log.d(LOG_TAG, "IOException in decodeCookie", e);
        } catch (ClassNotFoundException e2) {
            AsyncHttpClient.log.d(LOG_TAG, "ClassNotFoundException in decodeCookie", e2);
        }
        return cookie;
    }

    protected String byteArrayToHexString(byte[] bytes) {
        StringBuilder sb = new StringBuilder(bytes.length * 2);
        for (byte element : bytes) {
            int v = element & 255;
            if (v < 16) {
                sb.append('0');
            }
            sb.append(Integer.toHexString(v));
        }
        return sb.toString().toUpperCase(Locale.US);
    }

    protected byte[] hexStringToByteArray(String hexString) {
        int len = hexString.length();
        byte[] data = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            data[i / 2] = (byte) ((Character.digit(hexString.charAt(i), 16) << 4) + Character.digit(hexString.charAt(i + 1), 16));
        }
        return data;
    }
}
