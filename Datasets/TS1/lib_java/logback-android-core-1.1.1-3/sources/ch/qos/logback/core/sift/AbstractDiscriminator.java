package ch.qos.logback.core.sift;

import ch.qos.logback.core.spi.ContextAwareBase;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/sift/AbstractDiscriminator.class */
public abstract class AbstractDiscriminator<E> extends ContextAwareBase implements Discriminator<E> {
    protected boolean started;

    @Override // ch.qos.logback.core.spi.LifeCycle
    public void start() {
        this.started = true;
    }

    @Override // ch.qos.logback.core.spi.LifeCycle
    public void stop() {
        this.started = false;
    }

    @Override // ch.qos.logback.core.spi.LifeCycle
    public boolean isStarted() {
        return this.started;
    }
}
