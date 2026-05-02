package ch.qos.logback.core.spi;

import java.io.Serializable;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/spi/PreSerializationTransformer.class */
public interface PreSerializationTransformer<E> {
    Serializable transform(E e);
}
