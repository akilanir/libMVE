package com.squareup.okhttp;

import com.squareup.okhttp.internal.Util;
import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import okio.BufferedSink;
import okio.ByteString;
import okio.Okio;
import okio.Source;

/* loaded from: okhttp-2.6.0.jar:com/squareup/okhttp/RequestBody.class */
public abstract class RequestBody {
    public abstract MediaType contentType();

    public abstract void writeTo(BufferedSink bufferedSink) throws IOException;

    public long contentLength() throws IOException {
        return -1L;
    }

    public static RequestBody create(MediaType contentType, String content) {
        Charset charset = Util.UTF_8;
        if (contentType != null) {
            charset = contentType.charset();
            if (charset == null) {
                charset = Util.UTF_8;
                contentType = MediaType.parse(contentType + "; charset=utf-8");
            }
        }
        byte[] bytes = content.getBytes(charset);
        return create(contentType, bytes);
    }

    public static RequestBody create(final MediaType contentType, final ByteString content) {
        return new RequestBody() { // from class: com.squareup.okhttp.RequestBody.1
            @Override // com.squareup.okhttp.RequestBody
            public MediaType contentType() {
                return contentType;
            }

            @Override // com.squareup.okhttp.RequestBody
            public long contentLength() throws IOException {
                return content.size();
            }

            @Override // com.squareup.okhttp.RequestBody
            public void writeTo(BufferedSink sink) throws IOException {
                sink.write(content);
            }
        };
    }

    public static RequestBody create(MediaType contentType, byte[] content) {
        return create(contentType, content, 0, content.length);
    }

    public static RequestBody create(final MediaType contentType, final byte[] content, final int offset, final int byteCount) {
        if (content == null) {
            throw new NullPointerException("content == null");
        }
        Util.checkOffsetAndCount(content.length, offset, byteCount);
        return new RequestBody() { // from class: com.squareup.okhttp.RequestBody.2
            @Override // com.squareup.okhttp.RequestBody
            public MediaType contentType() {
                return contentType;
            }

            @Override // com.squareup.okhttp.RequestBody
            public long contentLength() {
                return byteCount;
            }

            @Override // com.squareup.okhttp.RequestBody
            public void writeTo(BufferedSink sink) throws IOException {
                sink.write(content, offset, byteCount);
            }
        };
    }

    public static RequestBody create(final MediaType contentType, final File file) {
        if (file == null) {
            throw new NullPointerException("content == null");
        }
        return new RequestBody() { // from class: com.squareup.okhttp.RequestBody.3
            @Override // com.squareup.okhttp.RequestBody
            public MediaType contentType() {
                return contentType;
            }

            @Override // com.squareup.okhttp.RequestBody
            public long contentLength() {
                return file.length();
            }

            @Override // com.squareup.okhttp.RequestBody
            public void writeTo(BufferedSink sink) throws IOException {
                Source source = null;
                try {
                    source = Okio.source(file);
                    sink.writeAll(source);
                    Util.closeQuietly((Closeable) source);
                } catch (Throwable th) {
                    Util.closeQuietly((Closeable) source);
                    throw th;
                }
            }
        };
    }
}
