package org.dmfs.android.retentionmagic.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: android-retention-magic-1.2.2.jar:org/dmfs/android/retentionmagic/annotations/Retain.class */
public @interface Retain {
    String key() default "";

    boolean permanent() default false;

    String instanceNSField() default "";

    String classNS() default ".";
}
