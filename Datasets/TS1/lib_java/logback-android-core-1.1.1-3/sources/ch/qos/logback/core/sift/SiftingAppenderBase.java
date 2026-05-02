package ch.qos.logback.core.sift;

import ch.qos.logback.core.Appender;
import ch.qos.logback.core.AppenderBase;
import ch.qos.logback.core.spi.ComponentTracker;
import ch.qos.logback.core.util.Duration;
import java.util.Iterator;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/sift/SiftingAppenderBase.class */
public abstract class SiftingAppenderBase<E> extends AppenderBase<E> {
    protected AppenderTracker<E> appenderTracker;
    AppenderFactory<E> appenderFactory;
    Duration timeout = new Duration(1800000);
    int maxAppenderCount = ComponentTracker.DEFAULT_MAX_COMPONENTS;
    Discriminator<E> discriminator;

    public Duration getTimeout() {
        return this.timeout;
    }

    public void setTimeout(Duration duration) {
        this.timeout = duration;
    }

    public int getMaxAppenderCount() {
        return this.maxAppenderCount;
    }

    public void setMaxAppenderCount(int i) {
        this.maxAppenderCount = i;
    }

    public void setAppenderFactory(AppenderFactory<E> appenderFactory) {
        this.appenderFactory = appenderFactory;
    }

    @Override // ch.qos.logback.core.AppenderBase, ch.qos.logback.core.spi.LifeCycle
    public void start() {
        int i = 0;
        if (this.discriminator == null) {
            addError("Missing discriminator. Aborting");
            i = 0 + 1;
        }
        if (!this.discriminator.isStarted()) {
            addError("Discriminator has not started successfully. Aborting");
            i++;
        }
        if (this.appenderFactory == null) {
            addError("AppenderFactory has not been set. Aborting");
            i++;
        } else {
            this.appenderTracker = new AppenderTracker<>(this.context, this.appenderFactory);
            this.appenderTracker.setMaxComponents(this.maxAppenderCount);
            this.appenderTracker.setTimeout(this.timeout.getMilliseconds());
        }
        if (i == 0) {
            super.start();
        }
    }

    @Override // ch.qos.logback.core.AppenderBase, ch.qos.logback.core.spi.LifeCycle
    public void stop() {
        Iterator<Appender<E>> it = this.appenderTracker.allComponents().iterator();
        while (it.hasNext()) {
            it.next().stop();
        }
    }

    protected abstract long getTimestamp(E e);

    @Override // ch.qos.logback.core.AppenderBase
    protected void append(E e) {
        if (isStarted()) {
            String discriminatingValue = this.discriminator.getDiscriminatingValue(e);
            long timestamp = getTimestamp(e);
            Appender<E> orCreate = this.appenderTracker.getOrCreate(discriminatingValue, timestamp);
            if (eventMarksEndOfLife(e)) {
                this.appenderTracker.endOfLife(discriminatingValue);
            }
            this.appenderTracker.removeStaleComponents(timestamp);
            orCreate.doAppend(e);
        }
    }

    protected abstract boolean eventMarksEndOfLife(E e);

    public Discriminator<E> getDiscriminator() {
        return this.discriminator;
    }

    public void setDiscriminator(Discriminator<E> discriminator) {
        this.discriminator = discriminator;
    }

    public AppenderTracker<E> getAppenderTracker() {
        return this.appenderTracker;
    }

    public String getDiscriminatorKey() {
        if (this.discriminator != null) {
            return this.discriminator.getKey();
        }
        return null;
    }
}
