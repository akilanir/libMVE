package retrofit.http;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.ANNOTATION_TYPE})
@Documented
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: retrofit-1.9.0.jar:retrofit/http/RestMethod.class */
public @interface RestMethod {
    String value();

    boolean hasBody() default false;
}
