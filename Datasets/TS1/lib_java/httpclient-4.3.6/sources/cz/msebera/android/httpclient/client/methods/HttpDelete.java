package cz.msebera.android.httpclient.client.methods;

import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import java.net.URI;

@NotThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/methods/HttpDelete.class */
public class HttpDelete extends HttpRequestBase {
    public static final String METHOD_NAME = "DELETE";

    public HttpDelete() {
    }

    public HttpDelete(URI uri) {
        setURI(uri);
    }

    public HttpDelete(String uri) {
        setURI(URI.create(uri));
    }

    @Override // cz.msebera.android.httpclient.client.methods.HttpRequestBase, cz.msebera.android.httpclient.client.methods.HttpUriRequest
    public String getMethod() {
        return "DELETE";
    }
}
