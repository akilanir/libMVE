package com.facebook.stetho.inspector.elements;

import com.facebook.stetho.common.ThreadBound;
import javax.annotation.Nullable;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/DocumentProvider.class */
public interface DocumentProvider extends ThreadBound {
    void setListener(DocumentProviderListener documentProviderListener);

    void dispose();

    @Nullable
    Object getRootElement();

    @Nullable
    NodeDescriptor getNodeDescriptor(@Nullable Object obj);

    void highlightElement(Object obj, int i);

    void hideHighlight();

    void setInspectModeEnabled(boolean z);

    void setAttributesAsText(Object obj, String str);
}
