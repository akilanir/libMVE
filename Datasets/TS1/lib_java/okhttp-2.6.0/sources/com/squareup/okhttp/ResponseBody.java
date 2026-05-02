package com.squareup.okhttp;

import com.squareup.okhttp.internal.Util;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.charset.Charset;
import okio.Buffer;
import okio.BufferedSource;

/* loaded from: okhttp-2.6.0.jar:com/squareup/okhttp/ResponseBody.class */
public abstract class ResponseBody implements Closeable {
    private Reader reader;

    public abstract MediaType contentType();

    public abstract long contentLength() throws IOException;

    public abstract BufferedSource source() throws IOException;

    public final InputStream byteStream() throws IOException {
        return source().inputStream();
    }

    public final byte[] bytes() throws IOException {
        long contentLength = contentLength();
        if (contentLength > 2147483647L) {
            throw new IOException("Cannot buffer entire body for content length: " + contentLength);
        }
        BufferedSource source = source();
        try {
            byte[] bytes = source.readByteArray();
            Util.closeQuietly((Closeable) source);
            if (contentLength != -1 && contentLength != bytes.length) {
                throw new IOException("Content-Length and stream length disagree");
            }
            return bytes;
        } catch (Throwable th) {
            Util.closeQuietly((Closeable) source);
            throw th;
        }
    }

    public final Reader charStream() throws IOException {
        Reader r = this.reader;
        if (r != null) {
            return r;
        }
        InputStreamReader inputStreamReader = new InputStreamReader(byteStream(), charset());
        this.reader = inputStreamReader;
        return inputStreamReader;
    }

    public final String string() throws IOException {
        return new String(bytes(), charset().name());
    }

    private Charset charset() {
        MediaType contentType = contentType();
        return contentType != null ? contentType.charset(Util.UTF_8) : Util.UTF_8;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        source().close();
    }

    public static ResponseBody create(MediaType contentType, String content) {
        Charset charset = Util.UTF_8;
        if (contentType != null) {
            charset = contentType.charset();
            if (charset == null) {
                charset = Util.UTF_8;
                contentType = MediaType.parse(contentType + "; charset=utf-8");
            }
        }
        Buffer buffer = new Buffer().writeString(content, charset);
        return create(contentType, buffer.size(), buffer);
    }

    public static ResponseBody create(MediaType contentType, byte[] content) {
        Buffer buffer = new Buffer().write(content);
        return create(contentType, content.length, buffer);
    }

    public static ResponseBody create(final MediaType contentType, final long contentLength, final BufferedSource content) {
        if (content == null) {
            throw new NullPointerException("source == null");
        }
        return new ResponseBody() { // from class: com.squareup.okhttp.ResponseBody.1
            @Override // com.squareup.okhttp.ResponseBody
            public MediaType contentType() {
                return contentType;
            }

            @Override // com.squareup.okhttp.ResponseBody
            public long contentLength() {
                return contentLength;
            }

            @Override // com.squareup.okhttp.ResponseBody
            public BufferedSource source() {
                return content;
            }
        };
    }
}
