package com.googlecode.androidannotations.annotations.res;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.CLASS)
/* loaded from: androidannotations-api-2.7.jar:com/googlecode/androidannotations/annotations/res/TextArrayRes.class */
public @interface TextArrayRes {
    int value() default -1;

    String resName() default "";
}
