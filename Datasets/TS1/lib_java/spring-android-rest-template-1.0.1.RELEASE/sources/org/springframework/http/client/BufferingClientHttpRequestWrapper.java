package org.springframework.http.client;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URI;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.util.Assert;
import org.springframework.util.FileCopyUtils;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/BufferingClientHttpRequestWrapper.class */
final class BufferingClientHttpRequestWrapper extends AbstractBufferingClientHttpRequest {
    private final ClientHttpRequest request;

    BufferingClientHttpRequestWrapper(ClientHttpRequest request) {
        Assert.notNull(request, "'request' must not be null");
        this.request = request;
    }

    @Override // org.springframework.http.HttpRequest
    public HttpMethod getMethod() {
        return this.request.getMethod();
    }

    @Override // org.springframework.http.HttpRequest
    public URI getURI() {
        return this.request.getURI();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // org.springframework.http.client.AbstractBufferingClientHttpRequest
    protected ClientHttpResponse executeInternal(HttpHeaders httpHeaders, byte[] bufferedOutput) throws IOException {
        OutputStream body = this.request.getBody();
        this.request.getHeaders().putAll(httpHeaders);
        FileCopyUtils.copy(bufferedOutput, body);
        ClientHttpResponse response = this.request.execute();
        return new BufferingClientHttpResponseWrapper(response);
    }
}
