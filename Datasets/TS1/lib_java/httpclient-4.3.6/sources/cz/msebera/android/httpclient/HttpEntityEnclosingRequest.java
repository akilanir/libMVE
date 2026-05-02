package cz.msebera.android.httpclient;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/HttpEntityEnclosingRequest.class */
public interface HttpEntityEnclosingRequest extends HttpRequest {
    boolean expectContinue();

    void setEntity(HttpEntity httpEntity);

    HttpEntity getEntity();
}
