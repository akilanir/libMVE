package org.androidannotations.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.CLASS)
/* loaded from: androidannotations-api-3.2.jar:org/androidannotations/annotations/Receiver.class */
public @interface Receiver {

    @Target({ElementType.PARAMETER})
    @Retention(RetentionPolicy.CLASS)
    /* loaded from: androidannotations-api-3.2.jar:org/androidannotations/annotations/Receiver$Extra.class */
    public @interface Extra {
        String value() default "";
    }

    /* loaded from: androidannotations-api-3.2.jar:org/androidannotations/annotations/Receiver$RegisterAt.class */
    public enum RegisterAt {
        OnCreateOnDestroy,
        OnStartOnStop,
        OnResumeOnPause,
        OnAttachOnDetach
    }

    String[] actions();

    String[] dataSchemes() default {};

    RegisterAt registerAt() default RegisterAt.OnCreateOnDestroy;

    boolean local() default false;
}
