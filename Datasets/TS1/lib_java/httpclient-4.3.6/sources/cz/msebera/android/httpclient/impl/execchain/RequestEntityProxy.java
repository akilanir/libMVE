package cz.msebera.android.httpclient.impl.execchain;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpEntityEnclosingRequest;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@NotThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/execchain/RequestEntityProxy.class */
class RequestEntityProxy implements HttpEntity {
    private final HttpEntity original;
    private boolean consumed = false;

    static void enhance(HttpEntityEnclosingRequest request) {
        HttpEntity entity = request.getEntity();
        if (entity != null && !entity.isRepeatable() && !isEnhanced(entity)) {
            request.setEntity(new RequestEntityProxy(entity));
        }
    }

    static boolean isEnhanced(HttpEntity entity) {
        return entity instanceof RequestEntityProxy;
    }

    static boolean isRepeatable(HttpRequest request) {
        HttpEntity entity;
        if ((request instanceof HttpEntityEnclosingRequest) && (entity = ((HttpEntityEnclosingRequest) request).getEntity()) != null) {
            if (isEnhanced(entity)) {
                RequestEntityProxy proxy = (RequestEntityProxy) entity;
                if (!proxy.isConsumed()) {
                    return true;
                }
            }
            return entity.isRepeatable();
        }
        return true;
    }

    RequestEntityProxy(HttpEntity original) {
        this.original = original;
    }

    public HttpEntity getOriginal() {
        return this.original;
    }

    public boolean isConsumed() {
        return this.consumed;
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public boolean isRepeatable() {
        return this.original.isRepeatable();
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public boolean isChunked() {
        return this.original.isChunked();
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public long getContentLength() {
        return this.original.getContentLength();
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public Header getContentType() {
        return this.original.getContentType();
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public Header getContentEncoding() {
        return this.original.getContentEncoding();
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public InputStream getContent() throws IOException, IllegalStateException {
        return this.original.getContent();
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public void writeTo(OutputStream outstream) throws IOException {
        this.consumed = true;
        this.original.writeTo(outstream);
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public boolean isStreaming() {
        return this.original.isStreaming();
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    @Deprecated
    public void consumeContent() throws IOException {
        this.consumed = true;
        this.original.consumeContent();
    }

    public String toString() {
        return "RequestEntityProxy{" + this.original + '}';
    }
}
