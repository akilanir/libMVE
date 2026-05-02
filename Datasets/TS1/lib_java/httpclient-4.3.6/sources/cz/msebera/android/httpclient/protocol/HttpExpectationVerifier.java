package cz.msebera.android.httpclient.protocol;

import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/protocol/HttpExpectationVerifier.class */
public interface HttpExpectationVerifier {
    void verify(HttpRequest httpRequest, HttpResponse httpResponse, HttpContext httpContext) throws HttpException;
}
