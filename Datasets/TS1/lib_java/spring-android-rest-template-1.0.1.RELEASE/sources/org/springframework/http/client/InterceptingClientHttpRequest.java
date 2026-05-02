package org.springframework.http.client;

import java.io.IOException;
import java.net.URI;
import java.util.Iterator;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpRequest;
import org.springframework.util.FileCopyUtils;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/InterceptingClientHttpRequest.class */
class InterceptingClientHttpRequest extends AbstractBufferingClientHttpRequest {
    private final ClientHttpRequestFactory requestFactory;
    private final List<ClientHttpRequestInterceptor> interceptors;
    private HttpMethod method;
    private URI uri;

    protected InterceptingClientHttpRequest(ClientHttpRequestFactory requestFactory, List<ClientHttpRequestInterceptor> interceptors, URI uri, HttpMethod method) {
        this.requestFactory = requestFactory;
        this.interceptors = interceptors;
        this.method = method;
        this.uri = uri;
    }

    @Override // org.springframework.http.HttpRequest
    public HttpMethod getMethod() {
        return this.method;
    }

    @Override // org.springframework.http.HttpRequest
    public URI getURI() {
        return this.uri;
    }

    @Override // org.springframework.http.client.AbstractBufferingClientHttpRequest
    protected final ClientHttpResponse executeInternal(HttpHeaders headers, byte[] bufferedOutput) throws IOException {
        RequestExecution requestExecution = new RequestExecution();
        return requestExecution.execute(this, bufferedOutput);
    }

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/InterceptingClientHttpRequest$RequestExecution.class */
    private class RequestExecution implements ClientHttpRequestExecution {
        private final Iterator<ClientHttpRequestInterceptor> iterator;

        private RequestExecution() {
            this.iterator = InterceptingClientHttpRequest.this.interceptors.iterator();
        }

        @Override // org.springframework.http.client.ClientHttpRequestExecution
        public ClientHttpResponse execute(HttpRequest request, byte[] body) throws IOException {
            if (!this.iterator.hasNext()) {
                ClientHttpRequest delegate = InterceptingClientHttpRequest.this.requestFactory.createRequest(request.getURI(), request.getMethod());
                delegate.getHeaders().putAll(request.getHeaders());
                if (body.length > 0) {
                    FileCopyUtils.copy(body, delegate.getBody());
                }
                return delegate.execute();
            }
            ClientHttpRequestInterceptor nextInterceptor = this.iterator.next();
            return nextInterceptor.intercept(request, body, this);
        }
    }
}
