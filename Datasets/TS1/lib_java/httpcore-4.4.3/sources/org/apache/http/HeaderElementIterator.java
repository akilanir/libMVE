package org.apache.http;

import java.util.Iterator;

/* loaded from: httpcore-4.4.3.jar:org/apache/http/HeaderElementIterator.class */
public interface HeaderElementIterator extends Iterator<Object> {
    @Override // java.util.Iterator
    boolean hasNext();

    HeaderElement nextElement();
}
