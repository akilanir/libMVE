package org.apache.commons.compress.archivers.sevenz;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/sevenz/CoderBase.class */
abstract class CoderBase {
    private final Class<?>[] acceptableOptions;
    private static final byte[] NONE = new byte[0];

    abstract InputStream decode(String str, InputStream inputStream, long j, Coder coder, byte[] bArr) throws IOException;

    protected CoderBase(Class<?>... acceptableOptions) {
        this.acceptableOptions = acceptableOptions;
    }

    boolean canAcceptOptions(Object opts) {
        Class<?>[] arr$ = this.acceptableOptions;
        for (Class<?> c : arr$) {
            if (c.isInstance(opts)) {
                return true;
            }
        }
        return false;
    }

    byte[] getOptionsAsProperties(Object options) {
        return NONE;
    }

    Object getOptionsFromCoder(Coder coder, InputStream in) {
        return null;
    }

    OutputStream encode(OutputStream out, Object options) throws IOException {
        throw new UnsupportedOperationException("method doesn't support writing");
    }

    protected static int numberOptionOrDefault(Object options, int defaultValue) {
        return options instanceof Number ? ((Number) options).intValue() : defaultValue;
    }
}
