package com.google.gson.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: gson-2.4.jar:com/google/gson/annotations/SerializedName.class */
public @interface SerializedName {
    String value();

    String[] alternate() default {};
}
