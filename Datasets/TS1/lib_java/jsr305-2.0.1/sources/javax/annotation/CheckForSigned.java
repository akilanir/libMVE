package javax.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import javax.annotation.meta.TypeQualifierNickname;
import javax.annotation.meta.When;

@Nonnegative(when = When.MAYBE)
@TypeQualifierNickname
@Documented
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: jsr305-2.0.1.jar:javax/annotation/CheckForSigned.class */
public @interface CheckForSigned {
}
