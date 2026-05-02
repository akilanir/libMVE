package ch.qos.logback.core.joran.spi;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/spi/NoAutoStart.class */
public @interface NoAutoStart {
}
