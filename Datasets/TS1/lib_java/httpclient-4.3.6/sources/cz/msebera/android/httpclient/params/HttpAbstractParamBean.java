package cz.msebera.android.httpclient.params;

import cz.msebera.android.httpclient.util.Args;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/params/HttpAbstractParamBean.class */
public abstract class HttpAbstractParamBean {
    protected final HttpParams params;

    public HttpAbstractParamBean(HttpParams params) {
        this.params = (HttpParams) Args.notNull(params, "HTTP parameters");
    }
}
