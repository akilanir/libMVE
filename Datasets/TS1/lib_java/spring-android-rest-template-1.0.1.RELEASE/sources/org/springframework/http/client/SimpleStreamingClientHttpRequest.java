package org.springframework.http.client;

import android.os.Build;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Map;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/SimpleStreamingClientHttpRequest.class */
final class SimpleStreamingClientHttpRequest extends AbstractClientHttpRequest {
    private static final Boolean olderThanFroyo;
    private final HttpURLConnection connection;
    private final int chunkSize;
    private OutputStream body;

    static {
        olderThanFroyo = Boolean.valueOf(Build.VERSION.SDK_INT < 8);
    }

    SimpleStreamingClientHttpRequest(HttpURLConnection connection, int chunkSize) {
        this.connection = connection;
        this.chunkSize = chunkSize;
        if (olderThanFroyo.booleanValue()) {
            System.setProperty("http.keepAlive", "false");
        }
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

    @Override // org.springframework.http.client.AbstractClientHttpRequest
    protected OutputStream getBodyInternal(HttpHeaders headers) throws IOException {
        if (this.body == null) {
            int contentLength = (int) headers.getContentLength();
            if (contentLength >= 0 && !olderThanFroyo.booleanValue()) {
                this.connection.setFixedLengthStreamingMode(contentLength);
            } else {
                this.connection.setChunkedStreamingMode(this.chunkSize);
            }
            writeHeaders(headers);
            this.connection.connect();
            this.body = this.connection.getOutputStream();
        }
        return new NonClosingOutputStream(this.body);
    }

    @Override // org.springframework.http.client.AbstractClientHttpRequest
    protected ClientHttpResponse executeInternal(HttpHeaders headers) throws IOException {
        try {
            if (this.body != null) {
                this.body.close();
            } else {
                writeHeaders(headers);
                this.connection.connect();
            }
        } catch (IOException e) {
        }
        return new SimpleClientHttpResponse(this.connection);
    }

    private void writeHeaders(HttpHeaders headers) {
        for (Map.Entry<String, List<String>> entry : headers.entrySet()) {
            String headerName = entry.getKey();
            for (String headerValue : entry.getValue()) {
                if (shouldAllowConnectionReuse(headerName, headerValue)) {
                    this.connection.addRequestProperty(headerName, headerValue);
                }
            }
        }
    }

    private boolean shouldAllowConnectionReuse(String headerName, String headerValue) {
        if (olderThanFroyo.booleanValue() && headerName.equals("Connection") && headerValue.equals("Keep-Alive")) {
            return false;
        }
        return true;
    }

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/SimpleStreamingClientHttpRequest$NonClosingOutputStream.class */
    private static class NonClosingOutputStream extends FilterOutputStream {
        private NonClosingOutputStream(OutputStream out) {
            super(out);
        }

        @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
        }
    }
}
