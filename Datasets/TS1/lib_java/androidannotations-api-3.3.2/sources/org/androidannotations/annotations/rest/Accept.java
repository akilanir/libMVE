package org.androidannotations.annotations.rest;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.CLASS)
/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/annotations/rest/Accept.class */
public @interface Accept {
    String value();
}
