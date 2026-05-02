package com.bumptech.glide.integration.okhttp;

import com.bumptech.glide.Priority;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.model.GlideUrl;
import com.bumptech.glide.util.ContentLengthInputStream;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import com.squareup.okhttp.ResponseBody;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

/* loaded from: com.github.bumptech.glide.okhttp-integration.1.4.0.jar:com/bumptech/glide/integration/okhttp/OkHttpStreamFetcher.class */
public class OkHttpStreamFetcher implements DataFetcher<InputStream> {
    private final OkHttpClient client;
    private final GlideUrl url;
    private InputStream stream;
    private ResponseBody responseBody;

    public OkHttpStreamFetcher(OkHttpClient client, GlideUrl url) {
        this.client = client;
        this.url = url;
    }

    /* renamed from: loadData, reason: merged with bridge method [inline-methods] */
    public InputStream m0loadData(Priority priority) throws Exception {
        Request.Builder requestBuilder = new Request.Builder().url(this.url.toStringUrl());
        for (Map.Entry<String, String> headerEntry : this.url.getHeaders().entrySet()) {
            String key = headerEntry.getKey();
            requestBuilder.addHeader(key, headerEntry.getValue());
        }
        Request request = requestBuilder.build();
        Response response = this.client.newCall(request).execute();
        this.responseBody = response.body();
        if (!response.isSuccessful()) {
            throw new IOException("Request failed with code: " + response.code());
        }
        long contentLength = this.responseBody.contentLength();
        this.stream = ContentLengthInputStream.obtain(this.responseBody.byteStream(), contentLength);
        return this.stream;
    }

    public void cleanup() {
        if (this.stream != null) {
            try {
                this.stream.close();
            } catch (IOException e) {
            }
        }
        if (this.responseBody != null) {
            try {
                this.responseBody.close();
            } catch (IOException e2) {
            }
        }
    }

    public String getId() {
        return this.url.getCacheKey();
    }

    public void cancel() {
    }
}
