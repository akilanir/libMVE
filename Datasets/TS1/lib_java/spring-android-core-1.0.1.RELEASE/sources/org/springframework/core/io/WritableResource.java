package org.springframework.core.io;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/core/io/WritableResource.class */
public interface WritableResource extends Resource {
    boolean isWritable();

    OutputStream getOutputStream() throws IOException;
}
