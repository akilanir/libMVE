package org.androidannotations.annotations.res;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.CLASS)
/* loaded from: androidannotations-api-3.2.jar:org/androidannotations/annotations/res/AnimationRes.class */
public @interface AnimationRes {
    int value() default -1;

    String resName() default "";
}
