package dagger;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: dagger-1.2.2.jar:dagger/Module.class */
public @interface Module {
    Class<?>[] injects() default {};

    Class<?>[] staticInjections() default {};

    boolean overrides() default false;

    Class<?>[] includes() default {};

    Class<?> addsTo() default Void.class;

    boolean complete() default true;

    boolean library() default false;
}
