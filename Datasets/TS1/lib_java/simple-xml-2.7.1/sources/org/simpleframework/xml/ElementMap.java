package org.simpleframework.xml;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/ElementMap.class */
public @interface ElementMap {
    String name() default "";

    String entry() default "";

    String value() default "";

    String key() default "";

    Class keyType() default void.class;

    Class valueType() default void.class;

    boolean attribute() default false;

    boolean required() default true;

    boolean data() default false;

    boolean inline() default false;

    boolean empty() default true;
}
