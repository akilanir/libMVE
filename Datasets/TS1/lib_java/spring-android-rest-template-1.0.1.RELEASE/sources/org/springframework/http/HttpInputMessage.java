package org.springframework.http;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/HttpInputMessage.class */
public interface HttpInputMessage extends HttpMessage {
    InputStream getBody() throws IOException;
}
