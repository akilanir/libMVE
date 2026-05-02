package ch.qos.logback.core.encoder;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/encoder/NonClosableInputStream.class */
public class NonClosableInputStream extends FilterInputStream {
    NonClosableInputStream(InputStream inputStream) {
        super(inputStream);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
    }

    public void realClose() throws IOException {
        super.close();
    }
}
