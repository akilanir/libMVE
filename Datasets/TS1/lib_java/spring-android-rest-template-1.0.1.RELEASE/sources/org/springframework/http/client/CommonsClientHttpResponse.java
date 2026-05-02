package org.springframework.http.client;

import java.io.IOException;
import java.io.InputStream;
import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpMethod;
import org.springframework.http.HttpHeaders;

@Deprecated
/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/CommonsClientHttpResponse.class */
final class CommonsClientHttpResponse extends AbstractClientHttpResponse {
    private final HttpMethod httpMethod;
    private HttpHeaders headers;

    CommonsClientHttpResponse(HttpMethod httpMethod) {
        this.httpMethod = httpMethod;
    }

    @Override // org.springframework.http.client.ClientHttpResponse
    public int getRawStatusCode() {
        return this.httpMethod.getStatusCode();
    }

    @Override // org.springframework.http.client.ClientHttpResponse
    public String getStatusText() {
        return this.httpMethod.getStatusText();
    }

    @Override // org.springframework.http.HttpMessage
    public HttpHeaders getHeaders() {
        if (this.headers == null) {
            this.headers = new HttpHeaders();
            Header[] arr$ = this.httpMethod.getResponseHeaders();
            for (Header header : arr$) {
                this.headers.add(header.getName(), header.getValue());
            }
        }
        return this.headers;
    }

    @Override // org.springframework.http.client.AbstractClientHttpResponse
    protected InputStream getBodyInternal() throws IOException {
        return this.httpMethod.getResponseBodyAsStream();
    }

    @Override // org.springframework.http.client.AbstractClientHttpResponse
    protected void closeInternal() {
        this.httpMethod.releaseConnection();
    }
}
