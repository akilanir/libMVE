package butterknife;

import android.support.annotation.StringRes;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.CLASS)
/* loaded from: butterknife-annotations-8.0.1.jar:butterknife/BindString.class */
public @interface BindString {
    @StringRes
    int value();
}
