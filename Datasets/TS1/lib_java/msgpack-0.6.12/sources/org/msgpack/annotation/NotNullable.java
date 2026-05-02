package org.msgpack.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE, ElementType.FIELD, ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: msgpack-0.6.12.jar:org/msgpack/annotation/NotNullable.class */
public @interface NotNullable {
}
