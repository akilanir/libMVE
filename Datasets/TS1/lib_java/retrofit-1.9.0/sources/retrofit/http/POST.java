package retrofit.http;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Documented
@Retention(RetentionPolicy.RUNTIME)
@RestMethod(value = "POST", hasBody = true)
/* loaded from: retrofit-1.9.0.jar:retrofit/http/POST.class */
public @interface POST {
    String value();
}
