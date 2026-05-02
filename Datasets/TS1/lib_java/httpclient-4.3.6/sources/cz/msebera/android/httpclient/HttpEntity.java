package cz.msebera.android.httpclient;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/HttpEntity.class */
public interface HttpEntity {
    boolean isRepeatable();

    boolean isChunked();

    long getContentLength();

    Header getContentType();

    Header getContentEncoding();

    InputStream getContent() throws IOException, IllegalStateException;

    void writeTo(OutputStream outputStream) throws IOException;

    boolean isStreaming();

    @Deprecated
    void consumeContent() throws IOException;
}
