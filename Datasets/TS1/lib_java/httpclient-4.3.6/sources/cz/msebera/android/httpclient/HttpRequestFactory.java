package cz.msebera.android.httpclient;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/HttpRequestFactory.class */
public interface HttpRequestFactory {
    HttpRequest newHttpRequest(RequestLine requestLine) throws MethodNotSupportedException;

    HttpRequest newHttpRequest(String str, String str2) throws MethodNotSupportedException;
}
