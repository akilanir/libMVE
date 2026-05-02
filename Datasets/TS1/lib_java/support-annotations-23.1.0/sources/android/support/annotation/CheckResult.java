package android.support.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.CLASS)
/* loaded from: support-annotations-23.1.0.jar:android/support/annotation/CheckResult.class */
public @interface CheckResult {
    String suggest() default "";
}
