package org.simpleframework.xml;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/ElementArray.class */
public @interface ElementArray {
    String name() default "";

    String entry() default "";

    boolean data() default false;

    boolean required() default true;

    boolean empty() default true;
}
