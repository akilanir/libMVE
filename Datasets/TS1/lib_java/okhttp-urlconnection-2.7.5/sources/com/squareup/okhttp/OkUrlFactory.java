package com.squareup.okhttp;

import com.squareup.okhttp.internal.huc.HttpURLConnectionImpl;
import com.squareup.okhttp.internal.huc.HttpsURLConnectionImpl;
import java.net.HttpURLConnection;
import java.net.Proxy;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLStreamHandler;
import java.net.URLStreamHandlerFactory;

/* loaded from: okhttp-urlconnection-2.7.5.jar:com/squareup/okhttp/OkUrlFactory.class */
public final class OkUrlFactory implements URLStreamHandlerFactory, Cloneable {
    private final OkHttpClient client;

    public OkUrlFactory(OkHttpClient client) {
        this.client = client;
    }

    public OkHttpClient client() {
        return this.client;
    }

    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public OkUrlFactory m0clone() {
        return new OkUrlFactory(this.client.clone());
    }

    public HttpURLConnection open(URL url) {
        return open(url, this.client.getProxy());
    }

    HttpURLConnection open(URL url, Proxy proxy) {
        String protocol = url.getProtocol();
        OkHttpClient copy = this.client.copyWithDefaults();
        copy.setProxy(proxy);
        if (protocol.equals("http")) {
            return new HttpURLConnectionImpl(url, copy);
        }
        if (protocol.equals("https")) {
            return new HttpsURLConnectionImpl(url, copy);
        }
        throw new IllegalArgumentException("Unexpected protocol: " + protocol);
    }

    @Override // java.net.URLStreamHandlerFactory
    public URLStreamHandler createURLStreamHandler(final String protocol) {
        if (protocol.equals("http") || protocol.equals("https")) {
            return new URLStreamHandler() { // from class: com.squareup.okhttp.OkUrlFactory.1
                @Override // java.net.URLStreamHandler
                protected URLConnection openConnection(URL url) {
                    return OkUrlFactory.this.open(url);
                }

                @Override // java.net.URLStreamHandler
                protected URLConnection openConnection(URL url, Proxy proxy) {
                    return OkUrlFactory.this.open(url, proxy);
                }

                @Override // java.net.URLStreamHandler
                protected int getDefaultPort() {
                    if (protocol.equals("http")) {
                        return 80;
                    }
                    if (protocol.equals("https")) {
                        return 443;
                    }
                    throw new AssertionError();
                }
            };
        }
        return null;
    }
}
