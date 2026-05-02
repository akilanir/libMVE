package org.springframework.http.converter;

import org.springframework.core.NestedRuntimeException;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/converter/HttpMessageConversionException.class */
public class HttpMessageConversionException extends NestedRuntimeException {
    private static final long serialVersionUID = 1;

    public HttpMessageConversionException(String msg) {
        super(msg);
    }

    public HttpMessageConversionException(String msg, Throwable cause) {
        super(msg, cause);
    }
}
