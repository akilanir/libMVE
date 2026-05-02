package com.google.common.io;

import java.io.IOException;

/* loaded from: guava-15.0.jar:com/google/common/io/OutputSupplier.class */
public interface OutputSupplier<T> {
    T getOutput() throws IOException;
}
