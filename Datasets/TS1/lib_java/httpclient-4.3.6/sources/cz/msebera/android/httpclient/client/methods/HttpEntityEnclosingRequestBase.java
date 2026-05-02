package cz.msebera.android.httpclient.client.methods;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpEntityEnclosingRequest;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.client.utils.CloneUtils;
import cz.msebera.android.httpclient.protocol.HTTP;

@NotThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/methods/HttpEntityEnclosingRequestBase.class */
public abstract class HttpEntityEnclosingRequestBase extends HttpRequestBase implements HttpEntityEnclosingRequest {
    private HttpEntity entity;

    @Override // cz.msebera.android.httpclient.HttpEntityEnclosingRequest
    public HttpEntity getEntity() {
        return this.entity;
    }

    @Override // cz.msebera.android.httpclient.HttpEntityEnclosingRequest
    public void setEntity(HttpEntity entity) {
        this.entity = entity;
    }

    @Override // cz.msebera.android.httpclient.HttpEntityEnclosingRequest
    public boolean expectContinue() {
        Header expect = getFirstHeader("Expect");
        return expect != null && HTTP.EXPECT_CONTINUE.equalsIgnoreCase(expect.getValue());
    }

    @Override // cz.msebera.android.httpclient.client.methods.AbstractExecutionAwareRequest
    public Object clone() throws CloneNotSupportedException {
        HttpEntityEnclosingRequestBase clone = (HttpEntityEnclosingRequestBase) super.clone();
        if (this.entity != null) {
            clone.entity = (HttpEntity) CloneUtils.cloneObject(this.entity);
        }
        return clone;
    }
}
