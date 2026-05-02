package butterknife.internal;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: butterknife-6.0.0.jar:butterknife/internal/ListenerMethod.class */
public @interface ListenerMethod {
    String name();

    String[] parameters() default {};

    String returnType() default "void";

    String defaultReturn() default "null";
}
