package org.springframework.http.client;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.util.StringUtils;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/SimpleClientHttpResponse.class */
final class SimpleClientHttpResponse extends AbstractClientHttpResponse {
    private static final String AUTH_ERROR = "Received authentication challenge is null";
    private static final String AUTH_ERROR_JELLY_BEAN = "No authentication challenges found";
    private static final String PROXY_AUTH_ERROR = "Received HTTP_PROXY_AUTH (407) code while not using proxy";
    private final HttpURLConnection connection;
    private HttpHeaders headers;

    SimpleClientHttpResponse(HttpURLConnection connection) {
        this.connection = connection;
    }

    @Override // org.springframework.http.client.ClientHttpResponse
    public int getRawStatusCode() throws IOException {
        try {
            return this.connection.getResponseCode();
        } catch (IOException ex) {
            return handleIOException(ex);
        }
    }

    private int handleIOException(IOException ex) throws IOException {
        if (AUTH_ERROR.equals(ex.getMessage()) || AUTH_ERROR_JELLY_BEAN.equals(ex.getMessage())) {
            return HttpStatus.UNAUTHORIZED.value();
        }
        if (PROXY_AUTH_ERROR.equals(ex.getMessage())) {
            return HttpStatus.PROXY_AUTHENTICATION_REQUIRED.value();
        }
        throw ex;
    }

    @Override // org.springframework.http.client.AbstractClientHttpResponse, org.springframework.http.client.ClientHttpResponse
    public HttpStatus getStatusCode() throws IOException {
        return HttpStatus.valueOf(getRawStatusCode());
    }

    @Override // org.springframework.http.client.ClientHttpResponse
    public String getStatusText() throws IOException {
        try {
            return this.connection.getResponseMessage();
        } catch (IOException ex) {
            return HttpStatus.valueOf(handleIOException(ex)).getReasonPhrase();
        }
    }

    @Override // org.springframework.http.HttpMessage
    public HttpHeaders getHeaders() {
        if (this.headers == null) {
            this.headers = new HttpHeaders();
            String name = this.connection.getHeaderFieldKey(0);
            if (StringUtils.hasLength(name)) {
                this.headers.add(name, this.connection.getHeaderField(0));
            }
            int i = 1;
            while (true) {
                String name2 = this.connection.getHeaderFieldKey(i);
                if (!StringUtils.hasLength(name2)) {
                    break;
                }
                this.headers.add(name2, this.connection.getHeaderField(i));
                i++;
            }
        }
        return this.headers;
    }

    @Override // org.springframework.http.client.AbstractClientHttpResponse
    protected InputStream getBodyInternal() throws IOException {
        InputStream errorStream = this.connection.getErrorStream();
        return errorStream != null ? errorStream : this.connection.getInputStream();
    }

    @Override // org.springframework.http.client.AbstractClientHttpResponse
    protected void closeInternal() {
        this.connection.disconnect();
    }
}
