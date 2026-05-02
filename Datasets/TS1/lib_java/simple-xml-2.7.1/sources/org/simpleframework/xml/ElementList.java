package org.simpleframework.xml;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/ElementList.class */
public @interface ElementList {
    String name() default "";

    String entry() default "";

    Class type() default void.class;

    boolean data() default false;

    boolean required() default true;

    boolean inline() default false;

    boolean empty() default true;
}
