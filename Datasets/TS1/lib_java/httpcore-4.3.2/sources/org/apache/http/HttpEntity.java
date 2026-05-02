package org.apache.http;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: httpcore-4.3.2.jar:org/apache/http/HttpEntity.class */
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
