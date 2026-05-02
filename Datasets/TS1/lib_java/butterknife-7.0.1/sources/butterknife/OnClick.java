package butterknife;

import butterknife.internal.ListenerClass;
import butterknife.internal.ListenerMethod;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.CLASS)
@ListenerClass(targetType = "android.view.View", setter = "setOnClickListener", type = "butterknife.internal.DebouncingOnClickListener", method = {@ListenerMethod(name = "doClick", parameters = {"android.view.View"})})
/* loaded from: butterknife-7.0.1.jar:butterknife/OnClick.class */
public @interface OnClick {
    int[] value() default {-1};
}
