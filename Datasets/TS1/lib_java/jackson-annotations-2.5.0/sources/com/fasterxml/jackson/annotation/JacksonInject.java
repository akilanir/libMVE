package com.fasterxml.jackson.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.ANNOTATION_TYPE, ElementType.METHOD, ElementType.FIELD, ElementType.PARAMETER})
@JacksonAnnotation
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: jackson-annotations-2.5.0.jar:com/fasterxml/jackson/annotation/JacksonInject.class */
public @interface JacksonInject {
    String value() default "";
}
