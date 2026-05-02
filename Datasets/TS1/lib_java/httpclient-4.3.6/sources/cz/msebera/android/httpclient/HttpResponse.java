package cz.msebera.android.httpclient;

import java.util.Locale;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/HttpResponse.class */
public interface HttpResponse extends HttpMessage {
    StatusLine getStatusLine();

    void setStatusLine(StatusLine statusLine);

    void setStatusLine(ProtocolVersion protocolVersion, int i);

    void setStatusLine(ProtocolVersion protocolVersion, int i, String str);

    void setStatusCode(int i) throws IllegalStateException;

    void setReasonPhrase(String str) throws IllegalStateException;

    HttpEntity getEntity();

    void setEntity(HttpEntity httpEntity);

    Locale getLocale();

    void setLocale(Locale locale);
}
