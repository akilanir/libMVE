package cz.msebera.android.httpclient;

import java.util.Iterator;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/TokenIterator.class */
public interface TokenIterator extends Iterator<Object> {
    @Override // java.util.Iterator
    boolean hasNext();

    String nextToken();
}
