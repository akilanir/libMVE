package org.springframework.http.client;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import org.springframework.http.HttpHeaders;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/AbstractBufferingClientHttpRequest.class */
abstract class AbstractBufferingClientHttpRequest extends AbstractClientHttpRequest {
    private ByteArrayOutputStream bufferedOutput = new ByteArrayOutputStream();

    protected abstract ClientHttpResponse executeInternal(HttpHeaders httpHeaders, byte[] bArr) throws IOException;

    AbstractBufferingClientHttpRequest() {
    }

    @Override // org.springframework.http.client.AbstractClientHttpRequest
    protected OutputStream getBodyInternal(HttpHeaders headers) throws IOException {
        return this.bufferedOutput;
    }

    @Override // org.springframework.http.client.AbstractClientHttpRequest
    protected ClientHttpResponse executeInternal(HttpHeaders headers) throws IOException {
        byte[] bytes = this.bufferedOutput.toByteArray();
        if (headers.getContentLength() == -1) {
            headers.setContentLength(bytes.length);
        }
        ClientHttpResponse result = executeInternal(headers, bytes);
        this.bufferedOutput = null;
        return result;
    }
}
