package javax.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE, ElementType.FIELD, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: jsr250-api-1.0.jar:javax/annotation/Resource.class */
public @interface Resource {

    /* loaded from: jsr250-api-1.0.jar:javax/annotation/Resource$AuthenticationType.class */
    public enum AuthenticationType {
        CONTAINER,
        APPLICATION
    }

    String name() default "";

    Class type() default Object.class;

    AuthenticationType authenticationType() default AuthenticationType.CONTAINER;

    boolean shareable() default true;

    String mappedName() default "";

    String description() default "";
}
