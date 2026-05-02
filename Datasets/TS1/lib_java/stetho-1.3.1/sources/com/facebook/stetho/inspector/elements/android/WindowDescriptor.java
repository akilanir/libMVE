package com.facebook.stetho.inspector.elements.android;

import android.view.View;
import android.view.Window;
import com.facebook.stetho.common.Accumulator;
import com.facebook.stetho.inspector.elements.AbstractChainedDescriptor;
import javax.annotation.Nullable;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/android/WindowDescriptor.class */
final class WindowDescriptor extends AbstractChainedDescriptor<Window> implements HighlightableDescriptor {
    WindowDescriptor() {
    }

    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    protected /* bridge */ /* synthetic */ void onGetChildren(Window window, Accumulator accumulator) {
        onGetChildren2(window, (Accumulator<Object>) accumulator);
    }

    /* renamed from: onGetChildren, reason: avoid collision after fix types in other method */
    protected void onGetChildren2(Window element, Accumulator<Object> children) {
        View decorView = element.peekDecorView();
        if (decorView != null) {
            children.store(decorView);
        }
    }

    @Override // com.facebook.stetho.inspector.elements.android.HighlightableDescriptor
    @Nullable
    public View getViewForHighlighting(Object element) {
        Window window = (Window) element;
        return window.peekDecorView();
    }
}
