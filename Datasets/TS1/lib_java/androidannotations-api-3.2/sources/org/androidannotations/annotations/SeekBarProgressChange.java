package org.androidannotations.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.CLASS)
/* loaded from: androidannotations-api-3.2.jar:org/androidannotations/annotations/SeekBarProgressChange.class */
public @interface SeekBarProgressChange {
    int[] value() default {-1};

    String[] resName() default {""};
}
