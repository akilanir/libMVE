package ch.qos.logback.core.sift;

import ch.qos.logback.core.spi.LifeCycle;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/sift/Discriminator.class */
public interface Discriminator<E> extends LifeCycle {
    String getDiscriminatingValue(E e);

    String getKey();
}
