package org.simpleframework.xml;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/Default.class */
public @interface Default {
    DefaultType value() default DefaultType.FIELD;

    boolean required() default true;
}
