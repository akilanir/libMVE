package cz.msebera.android.httpclient.params;

import cz.msebera.android.httpclient.HttpVersion;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/params/HttpProtocolParamBean.class */
public class HttpProtocolParamBean extends HttpAbstractParamBean {
    public HttpProtocolParamBean(HttpParams params) {
        super(params);
    }

    public void setHttpElementCharset(String httpElementCharset) {
        HttpProtocolParams.setHttpElementCharset(this.params, httpElementCharset);
    }

    public void setContentCharset(String contentCharset) {
        HttpProtocolParams.setContentCharset(this.params, contentCharset);
    }

    public void setVersion(HttpVersion version) {
        HttpProtocolParams.setVersion(this.params, version);
    }

    public void setUserAgent(String userAgent) {
        HttpProtocolParams.setUserAgent(this.params, userAgent);
    }

    public void setUseExpectContinue(boolean useExpectContinue) {
        HttpProtocolParams.setUseExpectContinue(this.params, useExpectContinue);
    }
}
