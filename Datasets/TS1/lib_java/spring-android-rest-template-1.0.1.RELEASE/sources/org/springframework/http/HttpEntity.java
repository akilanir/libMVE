package org.springframework.http;

import org.springframework.util.MultiValueMap;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/HttpEntity.class */
public class HttpEntity<T> {
    public static final HttpEntity<Object> EMPTY = new HttpEntity<>();
    private final HttpHeaders headers;
    private final T body;

    protected HttpEntity() {
        this(null, null);
    }

    public HttpEntity(T body) {
        this(body, null);
    }

    public HttpEntity(MultiValueMap<String, String> headers) {
        this(null, headers);
    }

    public HttpEntity(T body, MultiValueMap<String, String> headers) {
        this.body = body;
        HttpHeaders tempHeaders = new HttpHeaders();
        if (headers != null) {
            tempHeaders.putAll(headers);
        }
        this.headers = HttpHeaders.readOnlyHttpHeaders(tempHeaders);
    }

    public HttpHeaders getHeaders() {
        return this.headers;
    }

    public T getBody() {
        return this.body;
    }

    public boolean hasBody() {
        return this.body != null;
    }

    public String toString() {
        StringBuilder builder = new StringBuilder("<");
        if (this.body != null) {
            builder.append(this.body);
            if (this.headers != null) {
                builder.append(',');
            }
        }
        if (this.headers != null) {
            builder.append(this.headers);
        }
        builder.append('>');
        return builder.toString();
    }
}
