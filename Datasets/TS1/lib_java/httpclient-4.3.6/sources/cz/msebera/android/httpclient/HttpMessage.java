package cz.msebera.android.httpclient;

import cz.msebera.android.httpclient.params.HttpParams;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/HttpMessage.class */
public interface HttpMessage {
    ProtocolVersion getProtocolVersion();

    boolean containsHeader(String str);

    Header[] getHeaders(String str);

    Header getFirstHeader(String str);

    Header getLastHeader(String str);

    Header[] getAllHeaders();

    void addHeader(Header header);

    void addHeader(String str, String str2);

    void setHeader(Header header);

    void setHeader(String str, String str2);

    void setHeaders(Header[] headerArr);

    void removeHeader(Header header);

    void removeHeaders(String str);

    HeaderIterator headerIterator();

    HeaderIterator headerIterator(String str);

    @Deprecated
    HttpParams getParams();

    @Deprecated
    void setParams(HttpParams httpParams);
}
