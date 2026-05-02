package butterknife;

import android.support.annotation.IdRes;
import butterknife.internal.ListenerClass;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.CLASS)
@ListenerClass(targetType = "android.widget.AdapterView<?>", setter = "setOnItemSelectedListener", type = "android.widget.AdapterView.OnItemSelectedListener", callbacks = Callback.class)
/* loaded from: butterknife-annotations-8.0.1.jar:butterknife/OnItemSelected.class */
public @interface OnItemSelected {

    /* loaded from: butterknife-annotations-8.0.1.jar:butterknife/OnItemSelected$Callback.class */
    public enum Callback {
        ITEM_SELECTED,
        NOTHING_SELECTED
    }

    @IdRes
    int[] value() default {-1};

    Callback callback() default Callback.ITEM_SELECTED;
}
