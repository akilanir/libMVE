package com.facebook.stetho.inspector.elements;

import com.facebook.stetho.common.ThreadBound;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/DocumentProviderFactory.class */
public interface DocumentProviderFactory extends ThreadBound {
    DocumentProvider create();
}
