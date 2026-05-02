package cz.msebera.android.httpclient.protocol;

import cz.msebera.android.httpclient.HttpResponseInterceptor;
import java.util.List;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/protocol/HttpResponseInterceptorList.class */
public interface HttpResponseInterceptorList {
    void addResponseInterceptor(HttpResponseInterceptor httpResponseInterceptor);

    void addResponseInterceptor(HttpResponseInterceptor httpResponseInterceptor, int i);

    int getResponseInterceptorCount();

    HttpResponseInterceptor getResponseInterceptor(int i);

    void clearResponseInterceptors();

    void removeResponseInterceptorByClass(Class<? extends HttpResponseInterceptor> cls);

    void setInterceptors(List<?> list);
}
