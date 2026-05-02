package cz.msebera.android.httpclient.protocol;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/protocol/HttpContext.class */
public interface HttpContext {
    public static final String RESERVED_PREFIX = "http.";

    Object getAttribute(String str);

    void setAttribute(String str, Object obj);

    Object removeAttribute(String str);
}
