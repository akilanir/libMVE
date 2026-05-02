package butterknife;

import butterknife.internal.ListenerClass;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.CLASS)
@ListenerClass(targetType = "android.support.v4.view.ViewPager", setter = "setOnPageChangeListener", type = "android.support.v4.view.ViewPager.OnPageChangeListener", callbacks = Callback.class)
/* loaded from: butterknife-7.0.0.jar:butterknife/OnPageChange.class */
public @interface OnPageChange {

    /* loaded from: butterknife-7.0.0.jar:butterknife/OnPageChange$Callback.class */
    public enum Callback {
        PAGE_SELECTED,
        PAGE_SCROLLED,
        PAGE_SCROLL_STATE_CHANGED
    }

    int[] value() default {-1};

    Callback callback() default Callback.PAGE_SELECTED;
}
