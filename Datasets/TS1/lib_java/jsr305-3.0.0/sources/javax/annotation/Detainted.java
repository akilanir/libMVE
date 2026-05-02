package javax.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import javax.annotation.meta.TypeQualifierNickname;
import javax.annotation.meta.When;

@TypeQualifierNickname
@Documented
@Untainted(when = When.ALWAYS)
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: jsr305-3.0.0.jar:javax/annotation/Detainted.class */
public @interface Detainted {
}
