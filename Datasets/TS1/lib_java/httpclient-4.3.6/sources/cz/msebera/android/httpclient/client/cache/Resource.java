package cz.msebera.android.httpclient.client.cache;

import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/cache/Resource.class */
public interface Resource extends Serializable {
    InputStream getInputStream() throws IOException;

    long length();

    void dispose();
}
