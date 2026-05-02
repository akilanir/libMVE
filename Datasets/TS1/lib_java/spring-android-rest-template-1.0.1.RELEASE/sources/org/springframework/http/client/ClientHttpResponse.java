package org.springframework.http.client;

import java.io.IOException;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpStatus;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/ClientHttpResponse.class */
public interface ClientHttpResponse extends HttpInputMessage {
    HttpStatus getStatusCode() throws IOException;

    int getRawStatusCode() throws IOException;

    String getStatusText() throws IOException;

    void close();
}
