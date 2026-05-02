package org.androidannotations.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.CLASS)
/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/annotations/OrmLiteDao.class */
public @interface OrmLiteDao {
    Class<?> helper();

    @Deprecated
    Class<?> model() default Void.class;
}
