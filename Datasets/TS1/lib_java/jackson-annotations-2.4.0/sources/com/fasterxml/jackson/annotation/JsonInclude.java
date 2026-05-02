package com.fasterxml.jackson.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.ANNOTATION_TYPE, ElementType.METHOD, ElementType.FIELD, ElementType.TYPE, ElementType.PARAMETER})
@JacksonAnnotation
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: jackson-annotations-2.4.0.jar:com/fasterxml/jackson/annotation/JsonInclude.class */
public @interface JsonInclude {

    /* loaded from: jackson-annotations-2.4.0.jar:com/fasterxml/jackson/annotation/JsonInclude$Include.class */
    public enum Include {
        ALWAYS,
        NON_NULL,
        NON_DEFAULT,
        NON_EMPTY
    }

    Include value() default Include.ALWAYS;
}
