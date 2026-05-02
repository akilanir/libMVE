package org.springframework.core.io;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/core/io/InputStreamSource.class */
public interface InputStreamSource {
    InputStream getInputStream() throws IOException;
}
