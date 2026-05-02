package com.facebook.stetho.json.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/json/annotation/JsonProperty.class */
public @interface JsonProperty {
    boolean required() default false;
}
