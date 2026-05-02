package com.facebook.stetho.inspector.elements.android;

import android.app.Dialog;
import android.view.View;
import android.view.Window;
import com.facebook.stetho.common.Accumulator;
import com.facebook.stetho.inspector.elements.AbstractChainedDescriptor;
import com.facebook.stetho.inspector.elements.Descriptor;
import javax.annotation.Nullable;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/android/DialogDescriptor.class */
final class DialogDescriptor extends AbstractChainedDescriptor<Dialog> implements HighlightableDescriptor {
    DialogDescriptor() {
    }

    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    protected /* bridge */ /* synthetic */ void onGetChildren(Dialog dialog, Accumulator accumulator) {
        onGetChildren2(dialog, (Accumulator<Object>) accumulator);
    }

    /* renamed from: onGetChildren, reason: avoid collision after fix types in other method */
    protected void onGetChildren2(Dialog element, Accumulator<Object> children) {
        Window window = element.getWindow();
        if (window != null) {
            children.store(window);
        }
    }

    @Override // com.facebook.stetho.inspector.elements.android.HighlightableDescriptor
    @Nullable
    public View getViewForHighlighting(Object element) {
        Descriptor.Host host = getHost();
        if (host instanceof AndroidDescriptorHost) {
            Dialog dialog = (Dialog) element;
            return ((AndroidDescriptorHost) host).getHighlightingView(dialog.getWindow());
        }
        return null;
    }
}
