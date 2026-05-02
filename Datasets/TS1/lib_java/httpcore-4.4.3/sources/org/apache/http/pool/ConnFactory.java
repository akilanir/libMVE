package org.apache.http.pool;

import java.io.IOException;

/* loaded from: httpcore-4.4.3.jar:org/apache/http/pool/ConnFactory.class */
public interface ConnFactory<T, C> {
    C create(T t) throws IOException;
}
