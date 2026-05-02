package com.googlecode.androidannotations.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.CLASS)
/* loaded from: androidannotations-api-2.7.jar:com/googlecode/androidannotations/annotations/Touch.class */
public @interface Touch {
    int[] value() default {-1};

    String[] resName() default {""};
}
