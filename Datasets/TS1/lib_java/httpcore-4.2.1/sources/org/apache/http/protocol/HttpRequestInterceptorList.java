package org.apache.http.protocol;

import java.util.List;
import org.apache.http.HttpRequestInterceptor;

/* loaded from: httpcore-4.2.1.jar:org/apache/http/protocol/HttpRequestInterceptorList.class */
public interface HttpRequestInterceptorList {
    void addRequestInterceptor(HttpRequestInterceptor httpRequestInterceptor);

    void addRequestInterceptor(HttpRequestInterceptor httpRequestInterceptor, int i);

    int getRequestInterceptorCount();

    HttpRequestInterceptor getRequestInterceptor(int i);

    void clearRequestInterceptors();

    void removeRequestInterceptorByClass(Class<? extends HttpRequestInterceptor> cls);

    void setInterceptors(List<?> list);
}
