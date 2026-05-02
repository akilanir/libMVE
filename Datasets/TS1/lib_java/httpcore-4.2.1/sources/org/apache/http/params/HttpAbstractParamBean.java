package org.apache.http.params;

/* loaded from: httpcore-4.2.1.jar:org/apache/http/params/HttpAbstractParamBean.class */
public abstract class HttpAbstractParamBean {
    protected final HttpParams params;

    public HttpAbstractParamBean(HttpParams params) {
        if (params == null) {
            throw new IllegalArgumentException("HTTP parameters may not be null");
        }
        this.params = params;
    }
}
