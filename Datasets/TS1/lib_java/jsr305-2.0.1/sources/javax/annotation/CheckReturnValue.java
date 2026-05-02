package javax.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import javax.annotation.meta.When;

@Target({ElementType.METHOD, ElementType.CONSTRUCTOR, ElementType.TYPE, ElementType.PACKAGE})
@Documented
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: jsr305-2.0.1.jar:javax/annotation/CheckReturnValue.class */
public @interface CheckReturnValue {
    When when() default When.ALWAYS;
}
