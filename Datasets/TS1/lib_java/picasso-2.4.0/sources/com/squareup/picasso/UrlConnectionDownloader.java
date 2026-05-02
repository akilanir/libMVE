package com.squareup.picasso;

import android.content.Context;
import android.net.Uri;
import android.net.http.HttpResponseCache;
import android.os.Build;
import com.squareup.picasso.Downloader;
import java.io.File;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

/* loaded from: picasso-2.4.0.jar:com/squareup/picasso/UrlConnectionDownloader.class */
public class UrlConnectionDownloader implements Downloader {
    static final String RESPONSE_SOURCE = "X-Android-Response-Source";
    private static final Object lock = new Object();
    static volatile Object cache;
    private final Context context;

    public UrlConnectionDownloader(Context context) {
        this.context = context.getApplicationContext();
    }

    protected HttpURLConnection openConnection(Uri path) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(path.toString()).openConnection();
        connection.setConnectTimeout(15000);
        connection.setReadTimeout(20000);
        return connection;
    }

    @Override // com.squareup.picasso.Downloader
    public Downloader.Response load(Uri uri, boolean localCacheOnly) throws IOException {
        if (Build.VERSION.SDK_INT >= 14) {
            installCacheIfNeeded(this.context);
        }
        HttpURLConnection connection = openConnection(uri);
        connection.setUseCaches(true);
        if (localCacheOnly) {
            connection.setRequestProperty("Cache-Control", "only-if-cached,max-age=2147483647");
        }
        int responseCode = connection.getResponseCode();
        if (responseCode >= 300) {
            connection.disconnect();
            throw new Downloader.ResponseException(responseCode + " " + connection.getResponseMessage());
        }
        long contentLength = connection.getHeaderFieldInt("Content-Length", -1);
        boolean fromCache = Utils.parseResponseSourceHeader(connection.getHeaderField(RESPONSE_SOURCE));
        return new Downloader.Response(connection.getInputStream(), fromCache, contentLength);
    }

    @Override // com.squareup.picasso.Downloader
    public void shutdown() {
        if (Build.VERSION.SDK_INT >= 14 && cache != null) {
            ResponseCacheIcs.close(cache);
        }
    }

    private static void installCacheIfNeeded(Context context) {
        if (cache == null) {
            try {
                synchronized (lock) {
                    if (cache == null) {
                        cache = ResponseCacheIcs.install(context);
                    }
                }
            } catch (IOException e) {
            }
        }
    }

    /* loaded from: picasso-2.4.0.jar:com/squareup/picasso/UrlConnectionDownloader$ResponseCacheIcs.class */
    private static class ResponseCacheIcs {
        private ResponseCacheIcs() {
        }

        static Object install(Context context) throws IOException {
            File cacheDir = Utils.createDefaultCacheDir(context);
            HttpResponseCache cache = HttpResponseCache.getInstalled();
            if (cache == null) {
                long maxSize = Utils.calculateDiskCacheSize(cacheDir);
                cache = HttpResponseCache.install(cacheDir, maxSize);
            }
            return cache;
        }

        static void close(Object cache) {
            try {
                ((HttpResponseCache) cache).close();
            } catch (IOException e) {
            }
        }
    }
}
