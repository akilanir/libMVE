package cz.msebera.android.httpclient.client.cache;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/cache/HttpCacheEntrySerializer.class */
public interface HttpCacheEntrySerializer {
    void writeTo(HttpCacheEntry httpCacheEntry, OutputStream outputStream) throws IOException;

    HttpCacheEntry readFrom(InputStream inputStream) throws IOException;
}
