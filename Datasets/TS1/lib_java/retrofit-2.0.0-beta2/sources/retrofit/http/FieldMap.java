package retrofit.http;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.PARAMETER})
@Documented
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: retrofit-2.0.0-beta2.jar:retrofit/http/FieldMap.class */
public @interface FieldMap {
    boolean encoded() default false;
}
