package cz.msebera.android.httpclient;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/RequestLine.class */
public interface RequestLine {
    String getMethod();

    ProtocolVersion getProtocolVersion();

    String getUri();
}
