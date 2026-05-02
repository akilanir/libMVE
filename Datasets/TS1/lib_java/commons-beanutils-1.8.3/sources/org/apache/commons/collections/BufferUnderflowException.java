package org.apache.commons.collections;

import java.util.NoSuchElementException;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/collections/BufferUnderflowException.class */
public class BufferUnderflowException extends NoSuchElementException {
    private final Throwable throwable;

    public BufferUnderflowException() {
        this.throwable = null;
    }

    public BufferUnderflowException(String message) {
        this(message, null);
    }

    public BufferUnderflowException(String message, Throwable exception) {
        super(message);
        this.throwable = exception;
    }

    @Override // java.lang.Throwable
    public final Throwable getCause() {
        return this.throwable;
    }
}
