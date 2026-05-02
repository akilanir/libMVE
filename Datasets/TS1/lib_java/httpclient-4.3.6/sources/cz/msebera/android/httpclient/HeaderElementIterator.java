package cz.msebera.android.httpclient;

import java.util.Iterator;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/HeaderElementIterator.class */
public interface HeaderElementIterator extends Iterator<Object> {
    @Override // java.util.Iterator
    boolean hasNext();

    HeaderElement nextElement();
}
