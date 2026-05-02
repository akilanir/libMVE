package org.springframework.http.client;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.zip.GZIPInputStream;
import org.springframework.http.ContentCodingType;
import org.springframework.http.HttpStatus;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/AbstractClientHttpResponse.class */
public abstract class AbstractClientHttpResponse implements ClientHttpResponse {
    private InputStream compressedBody;

    protected abstract InputStream getBodyInternal() throws IOException;

    protected abstract void closeInternal();

    @Override // org.springframework.http.client.ClientHttpResponse
    public HttpStatus getStatusCode() throws IOException {
        return HttpStatus.valueOf(getRawStatusCode());
    }

    @Override // org.springframework.http.HttpInputMessage
    public InputStream getBody() throws IOException {
        InputStream body = getBodyInternal();
        if (isCompressed()) {
            return getCompressedBody(body);
        }
        return body;
    }

    @Override // org.springframework.http.client.ClientHttpResponse
    public void close() {
        if (this.compressedBody != null) {
            try {
                this.compressedBody.close();
            } catch (IOException e) {
            }
        }
        closeInternal();
    }

    private boolean isCompressed() {
        List<ContentCodingType> contentCodingTypes = getHeaders().getContentEncoding();
        for (ContentCodingType contentCodingType : contentCodingTypes) {
            if (contentCodingType.equals(ContentCodingType.GZIP)) {
                return true;
            }
        }
        return false;
    }

    private InputStream getCompressedBody(InputStream body) throws IOException {
        if (this.compressedBody == null) {
            this.compressedBody = new GZIPInputStream(body);
        }
        return this.compressedBody;
    }
}
