package org.simpleframework.xml.core;

import java.util.List;
import org.simpleframework.xml.Order;
import org.simpleframework.xml.Version;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Scanner.class */
interface Scanner extends Policy {
    Signature getSignature();

    List<Signature> getSignatures();

    ParameterMap getParameters();

    Instantiator getInstantiator();

    Class getType();

    Decorator getDecorator();

    Caller getCaller(Context context);

    Section getSection();

    Version getRevision();

    Order getOrder();

    Label getVersion();

    Label getText();

    String getName();

    Function getCommit();

    Function getValidate();

    Function getPersist();

    Function getComplete();

    Function getReplace();

    Function getResolve();

    boolean isPrimitive();

    boolean isEmpty();

    @Override // org.simpleframework.xml.core.Policy
    boolean isStrict();
}
