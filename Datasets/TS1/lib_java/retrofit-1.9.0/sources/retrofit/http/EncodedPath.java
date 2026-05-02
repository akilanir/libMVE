package retrofit.http;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.PARAMETER})
@Deprecated
@Documented
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: retrofit-1.9.0.jar:retrofit/http/EncodedPath.class */
public @interface EncodedPath {
    String value();
}
