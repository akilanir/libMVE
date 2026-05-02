package org.springframework.http.converter;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/converter/HttpMessageNotWritableException.class */
public class HttpMessageNotWritableException extends HttpMessageConversionException {
    private static final long serialVersionUID = 1;

    public HttpMessageNotWritableException(String msg) {
        super(msg);
    }

    public HttpMessageNotWritableException(String msg, Throwable cause) {
        super(msg, cause);
    }
}
