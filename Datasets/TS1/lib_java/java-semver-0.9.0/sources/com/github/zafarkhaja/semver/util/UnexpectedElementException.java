package com.github.zafarkhaja.semver.util;

import com.github.zafarkhaja.semver.util.Stream;
import java.util.Arrays;

/* loaded from: java-semver-0.9.0.jar:com/github/zafarkhaja/semver/util/UnexpectedElementException.class */
public class UnexpectedElementException extends RuntimeException {
    private final Object unexpected;
    private final int position;
    private final Stream.ElementType<?>[] expected;

    UnexpectedElementException(Object element, int position, Stream.ElementType<?>... expected) {
        this.unexpected = element;
        this.position = position;
        this.expected = expected;
    }

    public Object getUnexpectedElement() {
        return this.unexpected;
    }

    public int getPosition() {
        return this.position;
    }

    public Stream.ElementType<?>[] getExpectedElementTypes() {
        return this.expected;
    }

    @Override // java.lang.Throwable
    public String toString() {
        String message = String.format("Unexpected element '%s' at position '%d'", this.unexpected, Integer.valueOf(this.position));
        if (this.expected.length > 0) {
            message = message + String.format(", expecting '%s'", Arrays.toString(this.expected));
        }
        return message;
    }
}
