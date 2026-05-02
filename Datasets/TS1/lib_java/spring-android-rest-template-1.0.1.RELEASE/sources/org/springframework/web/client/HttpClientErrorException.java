package org.springframework.web.client;

import java.nio.charset.Charset;
import org.springframework.http.HttpStatus;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/client/HttpClientErrorException.class */
public class HttpClientErrorException extends HttpStatusCodeException {
    private static final long serialVersionUID = 1;

    public HttpClientErrorException(HttpStatus statusCode) {
        super(statusCode);
    }

    public HttpClientErrorException(HttpStatus statusCode, String statusText) {
        super(statusCode, statusText);
    }

    public HttpClientErrorException(HttpStatus statusCode, String statusText, byte[] responseBody, Charset responseCharset) {
        super(statusCode, statusText, responseBody, responseCharset);
    }
}
