package org.simpleframework.xml.core;

import java.lang.annotation.Annotation;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Extractor.class */
interface Extractor<T extends Annotation> {
    T[] getAnnotations() throws Exception;

    Class getType(T t) throws Exception;

    Label getLabel(T t) throws Exception;
}
