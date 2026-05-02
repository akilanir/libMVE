package cz.msebera.android.httpclient.conn.params;

import cz.msebera.android.httpclient.params.HttpAbstractParamBean;
import cz.msebera.android.httpclient.params.HttpParams;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/params/ConnConnectionParamBean.class */
public class ConnConnectionParamBean extends HttpAbstractParamBean {
    public ConnConnectionParamBean(HttpParams params) {
        super(params);
    }

    @Deprecated
    public void setMaxStatusLineGarbage(int maxStatusLineGarbage) {
        this.params.setIntParameter(ConnConnectionPNames.MAX_STATUS_LINE_GARBAGE, maxStatusLineGarbage);
    }
}
