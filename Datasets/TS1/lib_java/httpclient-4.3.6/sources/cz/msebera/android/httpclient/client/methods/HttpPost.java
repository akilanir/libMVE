package cz.msebera.android.httpclient.client.methods;

import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import java.net.URI;

@NotThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/methods/HttpPost.class */
public class HttpPost extends HttpEntityEnclosingRequestBase {
    public static final String METHOD_NAME = "POST";

    public HttpPost() {
    }

    public HttpPost(URI uri) {
        setURI(uri);
    }

    public HttpPost(String uri) {
        setURI(URI.create(uri));
    }

    @Override // cz.msebera.android.httpclient.client.methods.HttpRequestBase, cz.msebera.android.httpclient.client.methods.HttpUriRequest
    public String getMethod() {
        return METHOD_NAME;
    }
}
