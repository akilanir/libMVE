package android.support.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.ANNOTATION_TYPE, ElementType.METHOD, ElementType.CONSTRUCTOR, ElementType.FIELD})
@Retention(RetentionPolicy.CLASS)
/* loaded from: support-annotations-23.1.0.jar:android/support/annotation/RequiresPermission.class */
public @interface RequiresPermission {

    @Target({ElementType.FIELD})
    /* loaded from: support-annotations-23.1.0.jar:android/support/annotation/RequiresPermission$Read.class */
    public @interface Read {
        RequiresPermission value();
    }

    @Target({ElementType.FIELD})
    /* loaded from: support-annotations-23.1.0.jar:android/support/annotation/RequiresPermission$Write.class */
    public @interface Write {
        RequiresPermission value();
    }

    String value() default "";

    String[] allOf() default {};

    String[] anyOf() default {};

    boolean conditional() default false;
}
