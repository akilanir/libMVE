package butterknife;

import butterknife.internal.ListenerClass;
import butterknife.internal.ListenerMethod;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.CLASS)
@ListenerClass(targetType = "android.widget.CompoundButton", setter = "setOnCheckedChangeListener", type = "android.widget.CompoundButton.OnCheckedChangeListener", method = {@ListenerMethod(name = "onCheckedChanged", parameters = {"android.widget.CompoundButton", "boolean"})})
/* loaded from: butterknife-7.0.1.jar:butterknife/OnCheckedChanged.class */
public @interface OnCheckedChanged {
    int[] value() default {-1};
}
