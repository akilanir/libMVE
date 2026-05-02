package com.facebook.stetho.inspector.elements.android;

import android.view.View;
import com.facebook.stetho.inspector.elements.Descriptor;
import javax.annotation.Nullable;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/android/AndroidDescriptorHost.class */
interface AndroidDescriptorHost extends Descriptor.Host {
    @Nullable
    View getHighlightingView(@Nullable Object obj);
}
