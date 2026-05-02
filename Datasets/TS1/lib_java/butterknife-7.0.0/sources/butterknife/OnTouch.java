package butterknife;

import butterknife.internal.ListenerClass;
import butterknife.internal.ListenerMethod;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.CLASS)
@ListenerClass(targetType = "android.view.View", setter = "setOnTouchListener", type = "android.view.View.OnTouchListener", method = {@ListenerMethod(name = "onTouch", parameters = {"android.view.View", "android.view.MotionEvent"}, returnType = "boolean", defaultReturn = "false")})
/* loaded from: butterknife-7.0.0.jar:butterknife/OnTouch.class */
public @interface OnTouch {
    int[] value() default {-1};
}
