package ch.qos.logback.core.joran.spi;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/spi/DefaultClass.class */
public @interface DefaultClass {
    Class<?> value();
}
