package butterknife;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.CLASS)
/* loaded from: butterknife-6.0.0.jar:butterknife/InjectViews.class */
public @interface InjectViews {
    int[] value();
}
