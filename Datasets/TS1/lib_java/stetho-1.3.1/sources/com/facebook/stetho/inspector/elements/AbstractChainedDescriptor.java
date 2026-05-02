package com.facebook.stetho.inspector.elements;

import com.facebook.stetho.common.Accumulator;
import com.facebook.stetho.common.Util;
import javax.annotation.Nullable;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/AbstractChainedDescriptor.class */
public abstract class AbstractChainedDescriptor<E> extends Descriptor implements ChainedDescriptor {
    private Descriptor mSuper;

    @Override // com.facebook.stetho.inspector.elements.ChainedDescriptor
    public void setSuper(Descriptor superDescriptor) {
        Util.throwIfNull(superDescriptor);
        if (superDescriptor != this.mSuper) {
            if (this.mSuper != null) {
                throw new IllegalStateException();
            }
            this.mSuper = superDescriptor;
        }
    }

    final Descriptor getSuper() {
        return this.mSuper;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final void hook(Object obj) {
        verifyThreadAccess();
        this.mSuper.hook(obj);
        onHook(obj);
    }

    protected void onHook(E element) {
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final void unhook(Object obj) {
        verifyThreadAccess();
        onUnhook(obj);
        this.mSuper.unhook(obj);
    }

    protected void onUnhook(E element) {
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final NodeType getNodeType(Object obj) {
        return onGetNodeType(obj);
    }

    protected NodeType onGetNodeType(E element) {
        return this.mSuper.getNodeType(element);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final String getNodeName(Object obj) {
        return onGetNodeName(obj);
    }

    protected String onGetNodeName(E element) {
        return this.mSuper.getNodeName(element);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final String getLocalName(Object obj) {
        return onGetLocalName(obj);
    }

    protected String onGetLocalName(E element) {
        return this.mSuper.getLocalName(element);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final String getNodeValue(Object obj) {
        return onGetNodeValue(obj);
    }

    @Nullable
    public String onGetNodeValue(E element) {
        return this.mSuper.getNodeValue(element);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final void getChildren(Object obj, Accumulator<Object> children) {
        this.mSuper.getChildren(obj, children);
        onGetChildren(obj, children);
    }

    protected void onGetChildren(E element, Accumulator<Object> children) {
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final void getAttributes(Object obj, AttributeAccumulator attributes) {
        this.mSuper.getAttributes(obj, attributes);
        onGetAttributes(obj, attributes);
    }

    protected void onGetAttributes(E element, AttributeAccumulator attributes) {
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final void setAttributesAsText(Object obj, String text) {
        onSetAttributesAsText(obj, text);
    }

    protected void onSetAttributesAsText(E element, String text) {
        this.mSuper.setAttributesAsText(element, text);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final void getStyles(Object obj, StyleAccumulator accumulator) {
        this.mSuper.getStyles(obj, accumulator);
        onGetStyles(obj, accumulator);
    }

    protected void onGetStyles(E element, StyleAccumulator accumulator) {
    }
}
