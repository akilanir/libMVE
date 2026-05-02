package org.simpleframework.xml.convert;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/convert/Convert.class */
public @interface Convert {
    Class<? extends Converter> value();
}
