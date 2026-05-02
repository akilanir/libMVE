package org.apache.http.io;

import org.apache.http.HttpMessage;

/* loaded from: httpcore-4.3.2.jar:org/apache/http/io/HttpMessageWriterFactory.class */
public interface HttpMessageWriterFactory<T extends HttpMessage> {
    HttpMessageWriter<T> create(SessionOutputBuffer sessionOutputBuffer);
}
