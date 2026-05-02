package javax.annotation.concurrent;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE})
@Documented
@Retention(RetentionPolicy.CLASS)
/* loaded from: jsr305-2.0.1.jar:javax/annotation/concurrent/NotThreadSafe.class */
public @interface NotThreadSafe {
}
