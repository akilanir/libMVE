package butterknife;

import butterknife.internal.ListenerClass;
import butterknife.internal.ListenerMethod;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.CLASS)
@ListenerClass(targetType = "android.view.View", setter = "setOnFocusChangeListener", type = "android.view.View.OnFocusChangeListener", method = {@ListenerMethod(name = "onFocusChange", parameters = {"android.view.View", "boolean"})})
/* loaded from: butterknife-7.0.1.jar:butterknife/OnFocusChange.class */
public @interface OnFocusChange {
    int[] value() default {-1};
}
