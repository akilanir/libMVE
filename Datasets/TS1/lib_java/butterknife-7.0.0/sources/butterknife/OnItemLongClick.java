package butterknife;

import butterknife.internal.ListenerClass;
import butterknife.internal.ListenerMethod;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.CLASS)
@ListenerClass(targetType = "android.widget.AdapterView<?>", setter = "setOnItemLongClickListener", type = "android.widget.AdapterView.OnItemLongClickListener", method = {@ListenerMethod(name = "onItemLongClick", parameters = {"android.widget.AdapterView<?>", "android.view.View", "int", "long"}, returnType = "boolean", defaultReturn = "false")})
/* loaded from: butterknife-7.0.0.jar:butterknife/OnItemLongClick.class */
public @interface OnItemLongClick {
    int[] value() default {-1};
}
