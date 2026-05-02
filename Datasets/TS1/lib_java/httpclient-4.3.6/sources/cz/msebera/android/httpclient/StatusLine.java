package cz.msebera.android.httpclient;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/StatusLine.class */
public interface StatusLine {
    ProtocolVersion getProtocolVersion();

    int getStatusCode();

    String getReasonPhrase();
}
