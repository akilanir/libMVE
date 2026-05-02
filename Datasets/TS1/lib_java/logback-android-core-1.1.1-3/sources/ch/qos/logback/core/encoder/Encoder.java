package ch.qos.logback.core.encoder;

import ch.qos.logback.core.spi.ContextAware;
import ch.qos.logback.core.spi.LifeCycle;
import java.io.IOException;
import java.io.OutputStream;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/encoder/Encoder.class */
public interface Encoder<E> extends ContextAware, LifeCycle {
    void init(OutputStream outputStream) throws IOException;

    void doEncode(E e) throws IOException;

    void close() throws IOException;
}
