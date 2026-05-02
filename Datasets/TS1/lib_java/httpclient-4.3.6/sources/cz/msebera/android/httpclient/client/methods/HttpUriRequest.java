package cz.msebera.android.httpclient.client.methods;

import cz.msebera.android.httpclient.HttpRequest;
import java.net.URI;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/methods/HttpUriRequest.class */
public interface HttpUriRequest extends HttpRequest {
    String getMethod();

    URI getURI();

    void abort() throws UnsupportedOperationException;

    boolean isAborted();
}
