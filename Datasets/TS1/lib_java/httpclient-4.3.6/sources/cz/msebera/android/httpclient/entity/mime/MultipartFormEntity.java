package cz.msebera.android.httpclient.entity.mime;

import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.message.BasicHeader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/entity/mime/MultipartFormEntity.class */
class MultipartFormEntity implements HttpEntity {
    private final AbstractMultipartForm multipart;
    private final cz.msebera.android.httpclient.Header contentType;
    private final long contentLength;

    MultipartFormEntity(AbstractMultipartForm multipart, String contentType, long contentLength) {
        this.multipart = multipart;
        this.contentType = new BasicHeader("Content-Type", contentType);
        this.contentLength = contentLength;
    }

    AbstractMultipartForm getMultipart() {
        return this.multipart;
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public boolean isRepeatable() {
        return this.contentLength != -1;
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public boolean isChunked() {
        return !isRepeatable();
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public boolean isStreaming() {
        return !isRepeatable();
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public long getContentLength() {
        return this.contentLength;
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public cz.msebera.android.httpclient.Header getContentType() {
        return this.contentType;
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public cz.msebera.android.httpclient.Header getContentEncoding() {
        return null;
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public void consumeContent() throws IOException, UnsupportedOperationException {
        if (isStreaming()) {
            throw new UnsupportedOperationException("Streaming entity does not implement #consumeContent()");
        }
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public InputStream getContent() throws IOException {
        throw new UnsupportedOperationException("Multipart form entity does not implement #getContent()");
    }

    @Override // cz.msebera.android.httpclient.HttpEntity
    public void writeTo(OutputStream outstream) throws IOException {
        this.multipart.writeTo(outstream);
    }
}
