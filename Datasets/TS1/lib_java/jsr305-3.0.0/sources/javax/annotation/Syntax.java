package javax.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import javax.annotation.meta.TypeQualifier;
import javax.annotation.meta.When;

@TypeQualifier(applicableTo = CharSequence.class)
@Documented
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: jsr305-3.0.0.jar:javax/annotation/Syntax.class */
public @interface Syntax {
    String value();

    When when() default When.ALWAYS;
}
