package com.bumptech.glide.load.data;

import android.text.TextUtils;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.model.GlideUrl;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URISyntaxException;
import java.net.URL;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/data/HttpUrlFetcher.class */
public class HttpUrlFetcher implements DataFetcher<InputStream> {
    private static final int MAXIMUM_REDIRECTS = 5;
    private static final HttpUrlConnectionFactory DEFAULT_CONNECTION_FACTORY = new DefaultHttpUrlConnectionFactory();
    private final GlideUrl glideUrl;
    private final HttpUrlConnectionFactory connectionFactory;
    private HttpURLConnection urlConnection;
    private InputStream stream;
    private volatile boolean isCancelled;

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/data/HttpUrlFetcher$HttpUrlConnectionFactory.class */
    interface HttpUrlConnectionFactory {
        HttpURLConnection build(URL url) throws IOException;
    }

    public HttpUrlFetcher(GlideUrl glideUrl) {
        this(glideUrl, DEFAULT_CONNECTION_FACTORY);
    }

    HttpUrlFetcher(GlideUrl glideUrl, HttpUrlConnectionFactory connectionFactory) {
        this.glideUrl = glideUrl;
        this.connectionFactory = connectionFactory;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.bumptech.glide.load.data.DataFetcher
    public InputStream loadData(Priority priority) throws Exception {
        return loadDataWithRedirects(this.glideUrl.toURL(), 0, null);
    }

    private InputStream loadDataWithRedirects(URL url, int redirects, URL lastUrl) throws IOException {
        if (redirects >= MAXIMUM_REDIRECTS) {
            throw new IOException("Too many (> 5) redirects!");
        }
        if (lastUrl != null) {
            try {
                if (url.toURI().equals(lastUrl.toURI())) {
                    throw new IOException("In re-direct loop");
                }
            } catch (URISyntaxException e) {
            }
        }
        this.urlConnection = this.connectionFactory.build(url);
        this.urlConnection.setConnectTimeout(2500);
        this.urlConnection.setReadTimeout(2500);
        this.urlConnection.setUseCaches(false);
        this.urlConnection.setDoInput(true);
        this.urlConnection.connect();
        if (this.isCancelled) {
            return null;
        }
        int statusCode = this.urlConnection.getResponseCode();
        if (statusCode / 100 == 2) {
            this.stream = this.urlConnection.getInputStream();
            return this.stream;
        }
        if (statusCode / 100 == 3) {
            String redirectUrlString = this.urlConnection.getHeaderField("Location");
            if (TextUtils.isEmpty(redirectUrlString)) {
                throw new IOException("Received empty or null redirect url");
            }
            URL redirectUrl = new URL(url, redirectUrlString);
            return loadDataWithRedirects(redirectUrl, redirects + 1, url);
        }
        if (statusCode == -1) {
            throw new IOException("Unable to retrieve response code from HttpUrlConnection.");
        }
        throw new IOException("Request failed " + statusCode + ": " + this.urlConnection.getResponseMessage());
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public void cleanup() {
        if (this.stream != null) {
            try {
                this.stream.close();
            } catch (IOException e) {
            }
        }
        if (this.urlConnection != null) {
            this.urlConnection.disconnect();
        }
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public String getId() {
        return this.glideUrl.toString();
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public void cancel() {
        this.isCancelled = true;
    }

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/data/HttpUrlFetcher$DefaultHttpUrlConnectionFactory.class */
    private static class DefaultHttpUrlConnectionFactory implements HttpUrlConnectionFactory {
        private DefaultHttpUrlConnectionFactory() {
        }

        @Override // com.bumptech.glide.load.data.HttpUrlFetcher.HttpUrlConnectionFactory
        public HttpURLConnection build(URL url) throws IOException {
            return (HttpURLConnection) url.openConnection();
        }
    }
}
