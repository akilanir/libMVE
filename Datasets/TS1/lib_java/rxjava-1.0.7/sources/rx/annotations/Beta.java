package rx.annotations;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.ANNOTATION_TYPE, ElementType.CONSTRUCTOR, ElementType.FIELD, ElementType.METHOD, ElementType.TYPE})
@Beta
@Retention(RetentionPolicy.CLASS)
@Documented
/* loaded from: rxjava-1.0.7.jar:rx/annotations/Beta.class */
public @interface Beta {
}
