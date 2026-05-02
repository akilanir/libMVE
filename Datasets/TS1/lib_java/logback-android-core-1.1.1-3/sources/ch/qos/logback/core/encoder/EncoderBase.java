package ch.qos.logback.core.encoder;

import ch.qos.logback.core.spi.ContextAwareBase;
import java.io.IOException;
import java.io.OutputStream;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/encoder/EncoderBase.class */
public abstract class EncoderBase<E> extends ContextAwareBase implements Encoder<E> {
    protected boolean started;
    protected OutputStream outputStream;

    public void init(OutputStream outputStream) throws IOException {
        this.outputStream = outputStream;
    }

    @Override // ch.qos.logback.core.spi.LifeCycle
    public boolean isStarted() {
        return this.started;
    }

    @Override // ch.qos.logback.core.spi.LifeCycle
    public void start() {
        this.started = true;
    }

    @Override // ch.qos.logback.core.spi.LifeCycle
    public void stop() {
        this.started = false;
    }
}
