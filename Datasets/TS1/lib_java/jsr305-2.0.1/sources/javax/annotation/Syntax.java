package javax.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import javax.annotation.meta.TypeQualifier;
import javax.annotation.meta.When;

@TypeQualifier(applicableTo = String.class)
@Documented
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: jsr305-2.0.1.jar:javax/annotation/Syntax.class */
public @interface Syntax {
    String value();

    When when() default When.ALWAYS;
}
