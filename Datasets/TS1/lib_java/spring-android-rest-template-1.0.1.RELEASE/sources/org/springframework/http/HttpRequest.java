package org.springframework.http;

import java.net.URI;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/HttpRequest.class */
public interface HttpRequest extends HttpMessage {
    HttpMethod getMethod();

    URI getURI();
}
