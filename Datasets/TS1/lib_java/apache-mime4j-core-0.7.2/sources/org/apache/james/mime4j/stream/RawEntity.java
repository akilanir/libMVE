package org.apache.james.mime4j.stream;

import java.io.InputStream;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/stream/RawEntity.class */
public class RawEntity implements EntityStateMachine {
    private final InputStream stream;
    private EntityState state = EntityState.T_RAW_ENTITY;

    RawEntity(InputStream stream) {
        this.stream = stream;
    }

    @Override // org.apache.james.mime4j.stream.EntityStateMachine
    public EntityState getState() {
        return this.state;
    }

    @Override // org.apache.james.mime4j.stream.EntityStateMachine
    public void setRecursionMode(RecursionMode recursionMode) {
    }

    @Override // org.apache.james.mime4j.stream.EntityStateMachine
    public EntityStateMachine advance() {
        this.state = EntityState.T_END_OF_STREAM;
        return null;
    }

    @Override // org.apache.james.mime4j.stream.EntityStateMachine
    public InputStream getContentStream() {
        return this.stream;
    }

    @Override // org.apache.james.mime4j.stream.EntityStateMachine
    public BodyDescriptor getBodyDescriptor() {
        return null;
    }

    @Override // org.apache.james.mime4j.stream.EntityStateMachine
    public RawField getField() {
        return null;
    }

    public String getFieldName() {
        return null;
    }

    public String getFieldValue() {
        return null;
    }

    @Override // org.apache.james.mime4j.stream.EntityStateMachine
    public InputStream getDecodedContentStream() throws IllegalStateException {
        throw new IllegalStateException("Raw entity does not support stream decoding");
    }
}
