package com.google.common.io;

import java.io.IOException;

/* loaded from: guava-15.0.jar:com/google/common/io/InputSupplier.class */
public interface InputSupplier<T> {
    T getInput() throws IOException;
}
