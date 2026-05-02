package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpEntityEnclosingRequest;
import cz.msebera.android.httpclient.ProtocolException;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.entity.HttpEntityWrapper;
import cz.msebera.android.httpclient.protocol.HTTP;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@NotThreadSafe
@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/EntityEnclosingRequestWrapper.class */
public class EntityEnclosingRequestWrapper extends RequestWrapper implements HttpEntityEnclosingRequest {
    private HttpEntity entity;
    private boolean consumed;

    public EntityEnclosingRequestWrapper(HttpEntityEnclosingRequest request) throws ProtocolException {
        super(request);
        setEntity(request.getEntity());
    }

    @Override // cz.msebera.android.httpclient.HttpEntityEnclosingRequest
    public HttpEntity getEntity() {
        return this.entity;
    }

    @Override // cz.msebera.android.httpclient.HttpEntityEnclosingRequest
    public void setEntity(HttpEntity entity) {
        this.entity = entity != null ? new EntityWrapper(entity) : null;
        this.consumed = false;
    }

    @Override // cz.msebera.android.httpclient.HttpEntityEnclosingRequest
    public boolean expectContinue() {
        Header expect = getFirstHeader("Expect");
        return expect != null && HTTP.EXPECT_CONTINUE.equalsIgnoreCase(expect.getValue());
    }

    @Override // cz.msebera.android.httpclient.impl.client.RequestWrapper
    public boolean isRepeatable() {
        return this.entity == null || this.entity.isRepeatable() || !this.consumed;
    }

    /* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/EntityEnclosingRequestWrapper$EntityWrapper.class */
    class EntityWrapper extends HttpEntityWrapper {
        EntityWrapper(HttpEntity entity) {
            super(entity);
        }

        @Override // cz.msebera.android.httpclient.entity.HttpEntityWrapper, cz.msebera.android.httpclient.HttpEntity
        public void consumeContent() throws IOException {
            EntityEnclosingRequestWrapper.this.consumed = true;
            super.consumeContent();
        }

        @Override // cz.msebera.android.httpclient.entity.HttpEntityWrapper, cz.msebera.android.httpclient.HttpEntity
        public InputStream getContent() throws IOException {
            EntityEnclosingRequestWrapper.this.consumed = true;
            return super.getContent();
        }

        @Override // cz.msebera.android.httpclient.entity.HttpEntityWrapper, cz.msebera.android.httpclient.HttpEntity
        public void writeTo(OutputStream outstream) throws IOException {
            EntityEnclosingRequestWrapper.this.consumed = true;
            super.writeTo(outstream);
        }
    }
}
