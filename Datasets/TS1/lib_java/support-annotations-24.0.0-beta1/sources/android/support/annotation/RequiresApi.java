package android.support.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.ANNOTATION_TYPE, ElementType.METHOD, ElementType.CONSTRUCTOR, ElementType.FIELD, ElementType.PARAMETER})
@Retention(RetentionPolicy.CLASS)
/* loaded from: support-annotations-24.0.0-beta1.jar:android/support/annotation/RequiresApi.class */
public @interface RequiresApi {
    @IntRange(from = 1)
    int api();
}
