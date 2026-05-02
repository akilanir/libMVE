package org.apache.james.mime4j.stream;

import java.io.IOException;
import java.io.InputStream;
import org.apache.james.mime4j.MimeException;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/stream/EntityStateMachine.class */
public interface EntityStateMachine {
    EntityState getState();

    void setRecursionMode(RecursionMode recursionMode);

    EntityStateMachine advance() throws IOException, MimeException;

    BodyDescriptor getBodyDescriptor() throws IllegalStateException;

    InputStream getContentStream() throws IllegalStateException;

    InputStream getDecodedContentStream() throws IllegalStateException;

    Field getField() throws IllegalStateException;
}
