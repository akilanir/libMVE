package org.springframework.http.client;

import java.io.IOException;
import org.springframework.http.HttpRequest;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/ClientHttpRequestInterceptor.class */
public interface ClientHttpRequestInterceptor {
    ClientHttpResponse intercept(HttpRequest httpRequest, byte[] bArr, ClientHttpRequestExecution clientHttpRequestExecution) throws IOException;
}
