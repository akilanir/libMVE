package com.googlecode.androidannotations.annotations;

import com.googlecode.androidannotations.api.Scope;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.CLASS)
/* loaded from: androidannotations-api-2.7.jar:com/googlecode/androidannotations/annotations/EBean.class */
public @interface EBean {
    Scope scope() default Scope.Default;
}
