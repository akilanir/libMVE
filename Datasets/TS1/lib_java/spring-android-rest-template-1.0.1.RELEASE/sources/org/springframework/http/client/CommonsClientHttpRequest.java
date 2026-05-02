package org.springframework.http.client;

import java.io.IOException;
import java.net.URI;
import java.util.List;
import java.util.Map;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethodBase;
import org.apache.commons.httpclient.URIException;
import org.apache.commons.httpclient.methods.ByteArrayRequestEntity;
import org.apache.commons.httpclient.methods.EntityEnclosingMethod;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;

@Deprecated
/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/CommonsClientHttpRequest.class */
final class CommonsClientHttpRequest extends AbstractBufferingClientHttpRequest {
    private final HttpClient httpClient;
    private final HttpMethodBase httpMethod;

    CommonsClientHttpRequest(HttpClient httpClient, HttpMethodBase httpMethod) {
        this.httpClient = httpClient;
        this.httpMethod = httpMethod;
    }

    @Override // org.springframework.http.HttpRequest
    public HttpMethod getMethod() {
        return HttpMethod.valueOf(this.httpMethod.getName());
    }

    @Override // org.springframework.http.HttpRequest
    public URI getURI() {
        try {
            return URI.create(this.httpMethod.getURI().getEscapedURI());
        } catch (URIException ex) {
            throw new IllegalStateException("Could not get HttpMethod URI: " + ex.getMessage(), ex);
        }
    }

    @Override // org.springframework.http.client.AbstractBufferingClientHttpRequest
    public ClientHttpResponse executeInternal(HttpHeaders headers, byte[] output) throws IOException {
        for (Map.Entry<String, List<String>> entry : headers.entrySet()) {
            String headerName = entry.getKey();
            for (String headerValue : entry.getValue()) {
                this.httpMethod.addRequestHeader(headerName, headerValue);
            }
        }
        if (this.httpMethod instanceof EntityEnclosingMethod) {
            EntityEnclosingMethod entityEnclosingMethod = this.httpMethod;
            entityEnclosingMethod.setRequestEntity(new ByteArrayRequestEntity(output));
        }
        this.httpClient.executeMethod(this.httpMethod);
        return new CommonsClientHttpResponse(this.httpMethod);
    }
}
