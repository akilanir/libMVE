package org.apache.http.entity;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: httpcore-4.4.3.jar:org/apache/http/entity/ContentProducer.class */
public interface ContentProducer {
    void writeTo(OutputStream outputStream) throws IOException;
}
