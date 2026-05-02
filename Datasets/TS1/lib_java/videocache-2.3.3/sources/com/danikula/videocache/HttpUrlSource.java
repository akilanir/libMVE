package com.danikula.videocache;

import android.text.TextUtils;
import android.util.Log;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.net.HttpURLConnection;
import java.net.URL;

/* loaded from: videocache-2.3.3.jar:com/danikula/videocache/HttpUrlSource.class */
public class HttpUrlSource implements Source {
    private static final int MAX_REDIRECTS = 5;
    public final String url;
    private HttpURLConnection connection;
    private InputStream inputStream;
    private volatile int length;
    private volatile String mime;

    public HttpUrlSource(String url) {
        this(url, ProxyCacheUtils.getSupposablyMime(url));
    }

    public HttpUrlSource(String url, String mime) {
        this.length = Integer.MIN_VALUE;
        this.url = (String) Preconditions.checkNotNull(url);
        this.mime = mime;
    }

    public HttpUrlSource(HttpUrlSource source) {
        this.length = Integer.MIN_VALUE;
        this.url = source.url;
        this.mime = source.mime;
        this.length = source.length;
    }

    @Override // com.danikula.videocache.Source
    public synchronized int length() throws ProxyCacheException {
        if (this.length == Integer.MIN_VALUE) {
            fetchContentInfo();
        }
        return this.length;
    }

    @Override // com.danikula.videocache.Source
    public void open(int offset) throws ProxyCacheException {
        try {
            this.connection = openConnection(offset, -1);
            this.mime = this.connection.getContentType();
            this.inputStream = new BufferedInputStream(this.connection.getInputStream(), 8192);
            this.length = readSourceAvailableBytes(this.connection, offset, this.connection.getResponseCode());
        } catch (IOException e) {
            throw new ProxyCacheException("Error opening connection for " + this.url + " with offset " + offset, e);
        }
    }

    private int readSourceAvailableBytes(HttpURLConnection connection, int offset, int responseCode) throws IOException {
        int contentLength = connection.getContentLength();
        return responseCode == 200 ? contentLength : responseCode == 206 ? contentLength + offset : this.length;
    }

    @Override // com.danikula.videocache.Source
    public void close() throws ProxyCacheException {
        if (this.connection != null) {
            this.connection.disconnect();
        }
    }

    @Override // com.danikula.videocache.Source
    public int read(byte[] buffer) throws ProxyCacheException {
        if (this.inputStream == null) {
            throw new ProxyCacheException("Error reading data from " + this.url + ": connection is absent!");
        }
        try {
            return this.inputStream.read(buffer, 0, buffer.length);
        } catch (InterruptedIOException e) {
            throw new InterruptedProxyCacheException("Reading source " + this.url + " is interrupted", e);
        } catch (IOException e2) {
            throw new ProxyCacheException("Error reading data from " + this.url, e2);
        }
    }

    private void fetchContentInfo() throws ProxyCacheException {
        Log.d("ProxyCache", "Read content info from " + this.url);
        HttpURLConnection urlConnection = null;
        InputStream inputStream = null;
        try {
            try {
                urlConnection = openConnection(0, 10000);
                this.length = urlConnection.getContentLength();
                this.mime = urlConnection.getContentType();
                inputStream = urlConnection.getInputStream();
                Log.i("ProxyCache", "Content info for `" + this.url + "`: mime: " + this.mime + ", content-length: " + this.length);
                ProxyCacheUtils.close(inputStream);
                if (urlConnection != null) {
                    urlConnection.disconnect();
                }
            } catch (IOException e) {
                Log.e("ProxyCache", "Error fetching info from " + this.url, e);
                ProxyCacheUtils.close(inputStream);
                if (urlConnection != null) {
                    urlConnection.disconnect();
                }
            }
        } catch (Throwable th) {
            ProxyCacheUtils.close(inputStream);
            if (urlConnection != null) {
                urlConnection.disconnect();
            }
            throw th;
        }
    }

    private HttpURLConnection openConnection(int offset, int timeout) throws IOException, ProxyCacheException {
        HttpURLConnection connection;
        boolean redirected;
        int redirectCount = 0;
        String url = this.url;
        do {
            Log.d("ProxyCache", "Open connection " + (offset > 0 ? " with offset " + offset : "") + " to " + url);
            connection = (HttpURLConnection) new URL(url).openConnection();
            if (offset > 0) {
                connection.setRequestProperty("Range", "bytes=" + offset + "-");
            }
            if (timeout > 0) {
                connection.setConnectTimeout(timeout);
                connection.setReadTimeout(timeout);
            }
            int code = connection.getResponseCode();
            redirected = code == 301 || code == 302 || code == 303;
            if (redirected) {
                url = connection.getHeaderField("Location");
                redirectCount++;
                connection.disconnect();
            }
            if (redirectCount > MAX_REDIRECTS) {
                throw new ProxyCacheException("Too many redirects: " + redirectCount);
            }
        } while (redirected);
        return connection;
    }

    public synchronized String getMime() throws ProxyCacheException {
        if (TextUtils.isEmpty(this.mime)) {
            fetchContentInfo();
        }
        return this.mime;
    }

    public String getUrl() {
        return this.url;
    }

    public String toString() {
        return "HttpUrlSource{url='" + this.url + "}";
    }
}
