package com.googlecode.androidannotations.annotations.sharedpreferences;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.CLASS)
/* loaded from: androidannotations-api-2.7.jar:com/googlecode/androidannotations/annotations/sharedpreferences/SharedPref.class */
public @interface SharedPref {

    /* loaded from: androidannotations-api-2.7.jar:com/googlecode/androidannotations/annotations/sharedpreferences/SharedPref$Scope.class */
    public enum Scope {
        APPLICATION_DEFAULT,
        ACTIVITY,
        ACTIVITY_DEFAULT,
        UNIQUE
    }

    Scope value() default Scope.ACTIVITY;

    int mode() default 0;
}
