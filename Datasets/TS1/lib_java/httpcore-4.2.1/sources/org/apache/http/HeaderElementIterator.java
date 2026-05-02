package org.apache.http;

import java.util.Iterator;

/* loaded from: httpcore-4.2.1.jar:org/apache/http/HeaderElementIterator.class */
public interface HeaderElementIterator extends Iterator<Object> {
    @Override // java.util.Iterator
    boolean hasNext();

    HeaderElement nextElement();
}
