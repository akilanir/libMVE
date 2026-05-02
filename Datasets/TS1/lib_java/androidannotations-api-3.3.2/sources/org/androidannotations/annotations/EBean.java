package org.androidannotations.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.CLASS)
/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/annotations/EBean.class */
public @interface EBean {

    /* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/annotations/EBean$Scope.class */
    public enum Scope {
        Default,
        Singleton
    }

    Scope scope() default Scope.Default;
}
