package org.apache.http;

import java.util.Iterator;

/* loaded from: httpcore-4.2.1.jar:org/apache/http/HeaderIterator.class */
public interface HeaderIterator extends Iterator<Object> {
    @Override // java.util.Iterator
    boolean hasNext();

    Header nextHeader();
}
