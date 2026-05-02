package com.facebook.stetho.inspector.elements;

import com.facebook.stetho.common.Accumulator;
import com.facebook.stetho.common.ThreadBound;
import javax.annotation.Nullable;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/NodeDescriptor.class */
public interface NodeDescriptor extends ThreadBound {
    void hook(Object obj);

    void unhook(Object obj);

    NodeType getNodeType(Object obj);

    String getNodeName(Object obj);

    String getLocalName(Object obj);

    @Nullable
    String getNodeValue(Object obj);

    void getChildren(Object obj, Accumulator<Object> accumulator);

    void getAttributes(Object obj, AttributeAccumulator attributeAccumulator);

    void setAttributesAsText(Object obj, String str);

    void getStyles(Object obj, StyleAccumulator styleAccumulator);
}
