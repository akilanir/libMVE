package org.apache.http;

import java.util.Iterator;

/* loaded from: httpcore-4.4.3.jar:org/apache/http/TokenIterator.class */
public interface TokenIterator extends Iterator<Object> {
    @Override // java.util.Iterator
    boolean hasNext();

    String nextToken();
}
