package butterknife;

import butterknife.internal.ListenerClass;
import butterknife.internal.ListenerMethod;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.CLASS)
@ListenerClass(targetType = "android.widget.AdapterView<?>", setter = "setOnItemClickListener", type = "android.widget.AdapterView.OnItemClickListener", method = {@ListenerMethod(name = "onItemClick", parameters = {"android.widget.AdapterView<?>", "android.view.View", "int", "long"})})
/* loaded from: butterknife-7.0.1.jar:butterknife/OnItemClick.class */
public @interface OnItemClick {
    int[] value() default {-1};
}
