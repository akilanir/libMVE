package android.support.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.ANNOTATION_TYPE})
@Retention(RetentionPolicy.SOURCE)
/* loaded from: support-annotations-22.2.1.jar:android/support/annotation/StringDef.class */
public @interface StringDef {
    String[] value() default {};
}
