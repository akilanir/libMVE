package org.simpleframework.xml;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/Version.class */
public @interface Version {
    String name() default "";

    double revision() default 1.0d;

    boolean required() default false;
}
