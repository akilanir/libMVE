package butterknife.internal;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.ANNOTATION_TYPE})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: butterknife-annotations-8.0.1.jar:butterknife/internal/ListenerClass.class */
public @interface ListenerClass {

    /* loaded from: butterknife-annotations-8.0.1.jar:butterknife/internal/ListenerClass$NONE.class */
    public enum NONE {
    }

    String targetType();

    String setter();

    String type();

    Class<? extends Enum<?>> callbacks() default NONE.class;

    ListenerMethod[] method() default {};
}
