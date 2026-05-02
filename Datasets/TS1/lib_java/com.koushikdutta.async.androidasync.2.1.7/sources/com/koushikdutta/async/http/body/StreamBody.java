package com.koushikdutta.async.http.body;

import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.DataSink;
import com.koushikdutta.async.Util;
import com.koushikdutta.async.callback.CompletedCallback;
import com.koushikdutta.async.http.AsyncHttpRequest;
import java.io.InputStream;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/http/body/StreamBody.class */
public class StreamBody implements AsyncHttpRequestBody<InputStream> {
    InputStream stream;
    int length;
    String contentType = "application/binary";
    public static final String CONTENT_TYPE = "application/binary";

    public StreamBody(InputStream stream, int length) {
        this.stream = stream;
        this.length = length;
    }

    @Override // com.koushikdutta.async.http.body.AsyncHttpRequestBody
    public void write(AsyncHttpRequest request, DataSink sink, CompletedCallback completed) {
        Util.pump(this.stream, this.length < 0 ? 2147483647L : this.length, sink, completed);
    }

    @Override // com.koushikdutta.async.http.body.AsyncHttpRequestBody
    public void parse(DataEmitter emitter, CompletedCallback completed) {
        throw new AssertionError("not implemented");
    }

    @Override // com.koushikdutta.async.http.body.AsyncHttpRequestBody
    public String getContentType() {
        return this.contentType;
    }

    public StreamBody setContentType(String contentType) {
        this.contentType = contentType;
        return this;
    }

    @Override // com.koushikdutta.async.http.body.AsyncHttpRequestBody
    public boolean readFullyOnRequest() {
        throw new AssertionError("not implemented");
    }

    @Override // com.koushikdutta.async.http.body.AsyncHttpRequestBody
    public int length() {
        return this.length;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.koushikdutta.async.http.body.AsyncHttpRequestBody
    public InputStream get() {
        return this.stream;
    }
}
