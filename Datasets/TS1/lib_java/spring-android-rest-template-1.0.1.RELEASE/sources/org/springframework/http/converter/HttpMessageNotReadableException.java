package org.springframework.http.converter;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/converter/HttpMessageNotReadableException.class */
public class HttpMessageNotReadableException extends HttpMessageConversionException {
    private static final long serialVersionUID = 1;

    public HttpMessageNotReadableException(String msg) {
        super(msg);
    }

    public HttpMessageNotReadableException(String msg, Throwable cause) {
        super(msg, cause);
    }
}
