package org.springframework.http.client;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Map;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.util.FileCopyUtils;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/SimpleBufferingClientHttpRequest.class */
final class SimpleBufferingClientHttpRequest extends AbstractBufferingClientHttpRequest {
    private final HttpURLConnection connection;

    SimpleBufferingClientHttpRequest(HttpURLConnection connection) {
        this.connection = connection;
    }

    @Override // org.springframework.http.HttpRequest
    public HttpMethod getMethod() {
        return HttpMethod.valueOf(this.connection.getRequestMethod());
    }

    @Override // org.springframework.http.HttpRequest
    public URI getURI() {
        try {
            return this.connection.getURL().toURI();
        } catch (URISyntaxException ex) {
            throw new IllegalStateException("Could not get HttpURLConnection URI: " + ex.getMessage(), ex);
        }
    }

    @Override // org.springframework.http.client.AbstractBufferingClientHttpRequest
    protected ClientHttpResponse executeInternal(HttpHeaders headers, byte[] bufferedOutput) throws IOException {
        for (Map.Entry<String, List<String>> entry : headers.entrySet()) {
            String headerName = entry.getKey();
            for (String headerValue : entry.getValue()) {
                this.connection.addRequestProperty(headerName, headerValue);
            }
        }
        if (this.connection.getDoOutput()) {
            this.connection.setFixedLengthStreamingMode(bufferedOutput.length);
        }
        this.connection.connect();
        if (this.connection.getDoOutput()) {
            FileCopyUtils.copy(bufferedOutput, this.connection.getOutputStream());
        }
        return new SimpleClientHttpResponse(this.connection);
    }
}
