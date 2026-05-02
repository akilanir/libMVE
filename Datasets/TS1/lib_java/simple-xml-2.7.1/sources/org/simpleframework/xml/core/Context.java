package org.simpleframework.xml.core;

import org.simpleframework.xml.Version;
import org.simpleframework.xml.strategy.Type;
import org.simpleframework.xml.strategy.Value;
import org.simpleframework.xml.stream.InputNode;
import org.simpleframework.xml.stream.OutputNode;
import org.simpleframework.xml.stream.Style;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Context.class */
interface Context {
    boolean isStrict();

    Style getStyle();

    Session getSession();

    Support getSupport();

    boolean isFloat(Class cls) throws Exception;

    boolean isFloat(Type type) throws Exception;

    boolean isPrimitive(Class cls) throws Exception;

    boolean isPrimitive(Type type) throws Exception;

    Instance getInstance(Value value);

    Instance getInstance(Class cls);

    String getName(Class cls) throws Exception;

    Caller getCaller(Class cls) throws Exception;

    Version getVersion(Class cls) throws Exception;

    Decorator getDecorator(Class cls) throws Exception;

    Schema getSchema(Class cls) throws Exception;

    Value getOverride(Type type, InputNode inputNode) throws Exception;

    boolean setOverride(Type type, Object obj, OutputNode outputNode) throws Exception;

    Class getType(Type type, Object obj);

    Object getAttribute(Object obj);

    String getProperty(String str);
}
