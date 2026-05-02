package com.facebook.stetho.inspector.elements.android;

import android.view.View;
import javax.annotation.Nullable;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/android/HighlightableDescriptor.class */
interface HighlightableDescriptor {
    @Nullable
    View getViewForHighlighting(Object obj);
}
