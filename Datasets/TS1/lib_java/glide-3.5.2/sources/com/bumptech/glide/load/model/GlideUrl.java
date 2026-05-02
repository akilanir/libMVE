package com.bumptech.glide.load.model;

import android.net.Uri;
import android.text.TextUtils;
import java.net.MalformedURLException;
import java.net.URL;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/model/GlideUrl.class */
public class GlideUrl {
    private static final String ALLOWED_URI_CHARS = "@#&=*+-_.,:!?()/~'%";
    private final URL url;
    private String stringUrl;
    private URL safeUrl;

    public GlideUrl(URL url) {
        if (url == null) {
            throw new IllegalArgumentException("URL must not be null!");
        }
        this.url = url;
        this.stringUrl = null;
    }

    public GlideUrl(String url) {
        if (TextUtils.isEmpty(url)) {
            throw new IllegalArgumentException("String url must not be empty or null: " + url);
        }
        this.stringUrl = url;
        this.url = null;
    }

    public URL toURL() throws MalformedURLException {
        return getSafeUrl();
    }

    private URL getSafeUrl() throws MalformedURLException {
        if (this.safeUrl != null) {
            return this.safeUrl;
        }
        String unsafe = toString();
        String safe = Uri.encode(unsafe, ALLOWED_URI_CHARS);
        this.safeUrl = new URL(safe);
        return this.safeUrl;
    }

    public String toString() {
        if (TextUtils.isEmpty(this.stringUrl)) {
            this.stringUrl = this.url.toString();
        }
        return this.stringUrl;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        return toString().equals(o.toString());
    }

    public int hashCode() {
        return toString().hashCode();
    }
}
