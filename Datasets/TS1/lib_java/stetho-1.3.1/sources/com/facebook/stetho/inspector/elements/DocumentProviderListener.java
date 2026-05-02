package com.facebook.stetho.inspector.elements;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/DocumentProviderListener.class */
public interface DocumentProviderListener {
    void onPossiblyChanged();

    void onAttributeModified(Object obj, String str, String str2);

    void onAttributeRemoved(Object obj, String str);

    void onInspectRequested(Object obj);
}
