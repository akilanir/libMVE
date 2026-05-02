package com.facebook.stetho.inspector.elements;

import com.facebook.stetho.common.Accumulator;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/ObjectDescriptor.class */
public final class ObjectDescriptor extends Descriptor {
    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void hook(Object element) {
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void unhook(Object element) {
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public NodeType getNodeType(Object element) {
        return NodeType.ELEMENT_NODE;
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public String getNodeName(Object element) {
        return element.getClass().getName();
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public String getLocalName(Object element) {
        return getNodeName(element);
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public String getNodeValue(Object element) {
        return null;
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void getChildren(Object element, Accumulator<Object> children) {
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void getAttributes(Object element, AttributeAccumulator attributes) {
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void setAttributesAsText(Object element, String text) {
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void getStyles(Object element, StyleAccumulator accumulator) {
    }
}
