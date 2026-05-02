package butterknife;

import android.support.annotation.IdRes;
import butterknife.internal.ListenerClass;
import butterknife.internal.ListenerMethod;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.CLASS)
@ListenerClass(targetType = "android.view.View", setter = "setOnLongClickListener", type = "android.view.View.OnLongClickListener", method = {@ListenerMethod(name = "onLongClick", parameters = {"android.view.View"}, returnType = "boolean", defaultReturn = "false")})
/* loaded from: butterknife-annotations-8.0.1.jar:butterknife/OnLongClick.class */
public @interface OnLongClick {
    @IdRes
    int[] value() default {-1};
}
