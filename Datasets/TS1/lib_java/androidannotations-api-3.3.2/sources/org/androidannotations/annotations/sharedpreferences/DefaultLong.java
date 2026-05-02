package org.androidannotations.annotations.sharedpreferences;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.CLASS)
/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/annotations/sharedpreferences/DefaultLong.class */
public @interface DefaultLong {
    long value();

    int keyRes() default -1;
}
