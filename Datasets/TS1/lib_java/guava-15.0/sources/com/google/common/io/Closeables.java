package com.google.common.io;

import com.google.common.annotations.Beta;
import com.google.common.annotations.VisibleForTesting;
import java.io.Closeable;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Nullable;

@Beta
/* loaded from: guava-15.0.jar:com/google/common/io/Closeables.class */
public final class Closeables {

    @VisibleForTesting
    static final Logger logger = Logger.getLogger(Closeables.class.getName());

    private Closeables() {
    }

    public static void close(@Nullable Closeable closeable, boolean swallowIOException) throws IOException {
        if (closeable == null) {
            return;
        }
        try {
            closeable.close();
        } catch (IOException e) {
            if (swallowIOException) {
                logger.log(Level.WARNING, "IOException thrown while closing Closeable.", (Throwable) e);
                return;
            }
            throw e;
        }
    }

    @Deprecated
    public static void closeQuietly(@Nullable Closeable closeable) {
        try {
            close(closeable, true);
        } catch (IOException e) {
            logger.log(Level.SEVERE, "IOException should not have been thrown.", (Throwable) e);
        }
    }
}
