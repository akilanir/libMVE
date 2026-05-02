package org.simpleframework.xml.core;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/TemplateParameter.class */
abstract class TemplateParameter implements Parameter {
    protected TemplateParameter() {
    }

    @Override // org.simpleframework.xml.core.Parameter
    public boolean isAttribute() {
        return false;
    }

    @Override // org.simpleframework.xml.core.Parameter
    public boolean isText() {
        return false;
    }
}
