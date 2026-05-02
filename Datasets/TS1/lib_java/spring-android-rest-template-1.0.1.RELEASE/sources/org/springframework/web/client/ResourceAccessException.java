package org.springframework.web.client;

import java.io.IOException;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/client/ResourceAccessException.class */
public class ResourceAccessException extends RestClientException {
    private static final long serialVersionUID = 1;

    public ResourceAccessException(String msg) {
        super(msg);
    }

    public ResourceAccessException(String msg, IOException ex) {
        super(msg, ex);
    }
}
