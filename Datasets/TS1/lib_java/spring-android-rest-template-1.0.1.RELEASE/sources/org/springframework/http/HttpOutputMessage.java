package org.springframework.http;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/HttpOutputMessage.class */
public interface HttpOutputMessage extends HttpMessage {
    OutputStream getBody() throws IOException;
}
