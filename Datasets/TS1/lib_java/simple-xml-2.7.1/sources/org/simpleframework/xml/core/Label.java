package org.simpleframework.xml.core;

import java.lang.annotation.Annotation;
import org.simpleframework.xml.strategy.Type;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Label.class */
interface Label {
    Decorator getDecorator() throws Exception;

    Type getType(Class cls) throws Exception;

    Label getLabel(Class cls) throws Exception;

    String[] getNames() throws Exception;

    String[] getPaths() throws Exception;

    Object getEmpty(Context context) throws Exception;

    Converter getConverter(Context context) throws Exception;

    String getName() throws Exception;

    String getPath() throws Exception;

    Expression getExpression() throws Exception;

    Type getDependent() throws Exception;

    String getEntry() throws Exception;

    Object getKey() throws Exception;

    Annotation getAnnotation();

    Contact getContact();

    Class getType();

    String getOverride();

    boolean isData();

    boolean isRequired();

    boolean isAttribute();

    boolean isCollection();

    boolean isInline();

    boolean isText();

    boolean isTextList();

    boolean isUnion();

    String toString();
}
