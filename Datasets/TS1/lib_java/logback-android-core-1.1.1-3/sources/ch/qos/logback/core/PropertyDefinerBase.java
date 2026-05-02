package ch.qos.logback.core;

import ch.qos.logback.core.spi.ContextAwareBase;
import ch.qos.logback.core.spi.PropertyDefiner;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/PropertyDefinerBase.class */
public abstract class PropertyDefinerBase extends ContextAwareBase implements PropertyDefiner {
    protected static String booleanAsStr(boolean z) {
        return z ? Boolean.TRUE.toString() : Boolean.FALSE.toString();
    }
}
