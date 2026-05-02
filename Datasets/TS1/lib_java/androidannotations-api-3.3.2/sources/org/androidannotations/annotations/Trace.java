package org.androidannotations.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.CLASS)
/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/annotations/Trace.class */
public @interface Trace {
    public static final String DEFAULT_TAG = "NO_TAG";

    String tag() default "NO_TAG";

    int level() default 4;
}
