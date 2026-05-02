package cz.msebera.android.httpclient.client.methods;

import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import java.net.URI;

@NotThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/methods/HttpPut.class */
public class HttpPut extends HttpEntityEnclosingRequestBase {
    public static final String METHOD_NAME = "PUT";

    public HttpPut() {
    }

    public HttpPut(URI uri) {
        setURI(uri);
    }

    public HttpPut(String uri) {
        setURI(URI.create(uri));
    }

    @Override // cz.msebera.android.httpclient.client.methods.HttpRequestBase, cz.msebera.android.httpclient.client.methods.HttpUriRequest
    public String getMethod() {
        return "PUT";
    }
}
