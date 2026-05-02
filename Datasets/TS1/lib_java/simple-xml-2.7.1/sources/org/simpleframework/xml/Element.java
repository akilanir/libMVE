package org.simpleframework.xml;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/Element.class */
public @interface Element {
    String name() default "";

    boolean data() default false;

    boolean required() default true;

    Class type() default void.class;
}
