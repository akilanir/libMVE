package org.androidannotations.annotations.rest;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.CLASS)
/* loaded from: androidannotations-api-3.2.jar:org/androidannotations/annotations/rest/Rest.class */
public @interface Rest {
    String rootUrl() default "";

    Class<?>[] converters();

    Class<?>[] interceptors() default {};

    Class<?> requestFactory() default Void.class;
}
