package org.springframework.http.client;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.util.FileCopyUtils;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/BufferingClientHttpResponseWrapper.class */
final class BufferingClientHttpResponseWrapper implements ClientHttpResponse {
    private final ClientHttpResponse response;
    private byte[] body;

    BufferingClientHttpResponseWrapper(ClientHttpResponse response) {
        this.response = response;
    }

    @Override // org.springframework.http.client.ClientHttpResponse
    public HttpStatus getStatusCode() throws IOException {
        return this.response.getStatusCode();
    }

    @Override // org.springframework.http.client.ClientHttpResponse
    public int getRawStatusCode() throws IOException {
        return this.response.getRawStatusCode();
    }

    @Override // org.springframework.http.client.ClientHttpResponse
    public String getStatusText() throws IOException {
        return this.response.getStatusText();
    }

    @Override // org.springframework.http.HttpMessage
    public HttpHeaders getHeaders() {
        return this.response.getHeaders();
    }

    @Override // org.springframework.http.HttpInputMessage
    public InputStream getBody() throws IOException {
        if (this.body == null) {
            this.body = FileCopyUtils.copyToByteArray(this.response.getBody());
        }
        return new ByteArrayInputStream(this.body);
    }

    @Override // org.springframework.http.client.ClientHttpResponse
    public void close() {
        this.response.close();
    }
}
