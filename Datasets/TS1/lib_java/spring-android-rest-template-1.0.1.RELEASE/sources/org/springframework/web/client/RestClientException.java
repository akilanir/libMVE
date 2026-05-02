package org.springframework.web.client;

import org.springframework.core.NestedRuntimeException;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/client/RestClientException.class */
public class RestClientException extends NestedRuntimeException {
    private static final long serialVersionUID = 1;

    public RestClientException(String msg) {
        super(msg);
    }

    public RestClientException(String msg, Throwable ex) {
        super(msg, ex);
    }
}
