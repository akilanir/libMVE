package org.springframework.http.client;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.zip.GZIPOutputStream;
import org.springframework.http.ContentCodingType;
import org.springframework.http.HttpHeaders;
import org.springframework.util.Assert;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/AbstractClientHttpRequest.class */
public abstract class AbstractClientHttpRequest implements ClientHttpRequest {
    private final HttpHeaders headers = new HttpHeaders();
    private boolean executed = false;
    private OutputStream compressedBody;

    protected abstract OutputStream getBodyInternal(HttpHeaders httpHeaders) throws IOException;

    protected abstract ClientHttpResponse executeInternal(HttpHeaders httpHeaders) throws IOException;

    @Override // org.springframework.http.HttpMessage
    public final HttpHeaders getHeaders() {
        return this.executed ? HttpHeaders.readOnlyHttpHeaders(this.headers) : this.headers;
    }

    @Override // org.springframework.http.HttpOutputMessage
    public final OutputStream getBody() throws IOException {
        checkExecuted();
        OutputStream body = getBodyInternal(this.headers);
        if (shouldCompress()) {
            return getCompressedBody(body);
        }
        return body;
    }

    @Override // org.springframework.http.client.ClientHttpRequest
    public final ClientHttpResponse execute() throws IOException {
        checkExecuted();
        if (this.compressedBody != null) {
            this.compressedBody.close();
        }
        ClientHttpResponse result = executeInternal(this.headers);
        this.executed = true;
        return result;
    }

    private void checkExecuted() {
        Assert.state(!this.executed, "ClientHttpRequest already executed");
    }

    private boolean shouldCompress() {
        List<ContentCodingType> contentCodingTypes = this.headers.getContentEncoding();
        for (ContentCodingType contentCodingType : contentCodingTypes) {
            if (contentCodingType.equals(ContentCodingType.GZIP)) {
                return true;
            }
        }
        return false;
    }

    private OutputStream getCompressedBody(OutputStream body) throws IOException {
        if (this.compressedBody == null) {
            this.compressedBody = new GZIPOutputStream(body);
        }
        return this.compressedBody;
    }
}
