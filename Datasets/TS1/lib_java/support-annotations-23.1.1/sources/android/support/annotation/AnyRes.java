package android.support.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD, ElementType.PARAMETER, ElementType.FIELD, ElementType.LOCAL_VARIABLE})
@Documented
@Retention(RetentionPolicy.CLASS)
/* loaded from: support-annotations-23.1.1.jar:android/support/annotation/AnyRes.class */
public @interface AnyRes {
}
