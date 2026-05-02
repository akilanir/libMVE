package pub.devrel.easypermissions;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: pub.devrel.easypermissions.0.1.5.jar:pub/devrel/easypermissions/AfterPermissionGranted.class */
public @interface AfterPermissionGranted {
    int value();
}
