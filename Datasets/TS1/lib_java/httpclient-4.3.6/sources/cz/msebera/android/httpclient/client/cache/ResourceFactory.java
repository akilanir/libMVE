package cz.msebera.android.httpclient.client.cache;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/cache/ResourceFactory.class */
public interface ResourceFactory {
    Resource generate(String str, InputStream inputStream, InputLimit inputLimit) throws IOException;

    Resource copy(String str, Resource resource) throws IOException;
}
