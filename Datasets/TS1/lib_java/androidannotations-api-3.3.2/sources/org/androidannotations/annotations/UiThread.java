package org.androidannotations.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.CLASS)
/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/annotations/UiThread.class */
public @interface UiThread {

    /* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/annotations/UiThread$Propagation.class */
    public enum Propagation {
        ENQUEUE,
        REUSE
    }

    long delay() default 0;

    Propagation propagation() default Propagation.ENQUEUE;
}
