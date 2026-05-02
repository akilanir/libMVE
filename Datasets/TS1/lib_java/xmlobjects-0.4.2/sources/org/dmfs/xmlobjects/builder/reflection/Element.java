package org.dmfs.xmlobjects.builder.reflection;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/builder/reflection/Element.class */
public @interface Element {
    String namespace() default "";

    String name() default "";
}
