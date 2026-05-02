package org.apache.http.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE})
@Documented
@Retention(RetentionPolicy.CLASS)
/* loaded from: httpcore-4.2.1.jar:org/apache/http/annotation/Immutable.class */
public @interface Immutable {
}
