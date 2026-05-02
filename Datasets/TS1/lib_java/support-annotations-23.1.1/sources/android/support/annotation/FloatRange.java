package android.support.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD, ElementType.PARAMETER, ElementType.FIELD, ElementType.LOCAL_VARIABLE})
@Retention(RetentionPolicy.CLASS)
/* loaded from: support-annotations-23.1.1.jar:android/support/annotation/FloatRange.class */
public @interface FloatRange {
    double from() default Double.NEGATIVE_INFINITY;

    double to() default Double.POSITIVE_INFINITY;

    boolean fromInclusive() default true;

    boolean toInclusive() default true;
}
