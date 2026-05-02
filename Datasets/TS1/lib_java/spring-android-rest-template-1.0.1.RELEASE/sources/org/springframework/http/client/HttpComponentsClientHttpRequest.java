package org.springframework.http.client;

import java.io.IOException;
import java.net.URI;
import java.util.List;
import java.util.Map;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.protocol.HttpContext;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/HttpComponentsClientHttpRequest.class */
final class HttpComponentsClientHttpRequest extends AbstractBufferingClientHttpRequest {
    private final HttpClient httpClient;
    private final HttpUriRequest httpRequest;
    private final HttpContext httpContext;

    public HttpComponentsClientHttpRequest(HttpClient httpClient, HttpUriRequest httpRequest, HttpContext httpContext) {
        this.httpClient = httpClient;
        this.httpRequest = httpRequest;
        this.httpContext = httpContext;
    }

    @Override // org.springframework.http.HttpRequest
    public HttpMethod getMethod() {
        return HttpMethod.valueOf(this.httpRequest.getMethod());
    }

    @Override // org.springframework.http.HttpRequest
    public URI getURI() {
        return this.httpRequest.getURI();
    }

    @Override // org.springframework.http.client.AbstractBufferingClientHttpRequest
    public ClientHttpResponse executeInternal(HttpHeaders headers, byte[] bufferedOutput) throws IOException {
        for (Map.Entry<String, List<String>> entry : headers.entrySet()) {
            String headerName = entry.getKey();
            if (!headerName.equalsIgnoreCase("Content-Length") && !headerName.equalsIgnoreCase("Transfer-Encoding")) {
                for (String headerValue : entry.getValue()) {
                    this.httpRequest.addHeader(headerName, headerValue);
                }
            }
        }
        if (this.httpRequest instanceof HttpEntityEnclosingRequest) {
            HttpEntityEnclosingRequest entityEnclosingReq = (HttpEntityEnclosingRequest) this.httpRequest;
            HttpEntity requestEntity = new ByteArrayEntity(bufferedOutput);
            entityEnclosingReq.setEntity(requestEntity);
        }
        HttpResponse httpResponse = this.httpClient.execute(this.httpRequest, this.httpContext);
        return new HttpComponentsClientHttpResponse(httpResponse);
    }
}
