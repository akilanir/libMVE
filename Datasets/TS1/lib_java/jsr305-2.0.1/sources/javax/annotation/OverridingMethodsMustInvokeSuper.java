package javax.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Documented
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: jsr305-2.0.1.jar:javax/annotation/OverridingMethodsMustInvokeSuper.class */
public @interface OverridingMethodsMustInvokeSuper {
}
