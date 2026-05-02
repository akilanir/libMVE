package cz.msebera.android.httpclient.protocol;

import cz.msebera.android.httpclient.HttpRequestInterceptor;
import java.util.List;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/protocol/HttpRequestInterceptorList.class */
public interface HttpRequestInterceptorList {
    void addRequestInterceptor(HttpRequestInterceptor httpRequestInterceptor);

    void addRequestInterceptor(HttpRequestInterceptor httpRequestInterceptor, int i);

    int getRequestInterceptorCount();

    HttpRequestInterceptor getRequestInterceptor(int i);

    void clearRequestInterceptors();

    void removeRequestInterceptorByClass(Class<? extends HttpRequestInterceptor> cls);

    void setInterceptors(List<?> list);
}
