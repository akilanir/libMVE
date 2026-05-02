package cz.msebera.android.httpclient.client;

import cz.msebera.android.httpclient.HttpResponse;
import java.io.IOException;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/ResponseHandler.class */
public interface ResponseHandler<T> {
    T handleResponse(HttpResponse httpResponse) throws ClientProtocolException, IOException;
}
