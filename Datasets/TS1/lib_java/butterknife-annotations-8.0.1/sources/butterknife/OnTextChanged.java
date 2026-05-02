package butterknife;

import android.support.annotation.IdRes;
import butterknife.internal.ListenerClass;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.CLASS)
@ListenerClass(targetType = "android.widget.TextView", setter = "addTextChangedListener", type = "android.text.TextWatcher", callbacks = Callback.class)
/* loaded from: butterknife-annotations-8.0.1.jar:butterknife/OnTextChanged.class */
public @interface OnTextChanged {

    /* loaded from: butterknife-annotations-8.0.1.jar:butterknife/OnTextChanged$Callback.class */
    public enum Callback {
        TEXT_CHANGED,
        BEFORE_TEXT_CHANGED,
        AFTER_TEXT_CHANGED
    }

    @IdRes
    int[] value() default {-1};

    Callback callback() default Callback.TEXT_CHANGED;
}
