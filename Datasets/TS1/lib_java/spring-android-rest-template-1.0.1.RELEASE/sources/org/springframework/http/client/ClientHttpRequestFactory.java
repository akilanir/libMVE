package org.springframework.http.client;

import java.io.IOException;
import java.net.URI;
import org.springframework.http.HttpMethod;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/ClientHttpRequestFactory.class */
public interface ClientHttpRequestFactory {
    ClientHttpRequest createRequest(URI uri, HttpMethod httpMethod) throws IOException;
}
