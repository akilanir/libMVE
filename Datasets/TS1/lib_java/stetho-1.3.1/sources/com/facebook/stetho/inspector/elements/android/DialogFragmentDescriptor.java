package com.facebook.stetho.inspector.elements.android;

import android.app.Dialog;
import android.view.View;
import com.facebook.stetho.common.Accumulator;
import com.facebook.stetho.common.LogUtil;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.common.android.DialogFragmentAccessor;
import com.facebook.stetho.common.android.FragmentCompat;
import com.facebook.stetho.inspector.elements.AttributeAccumulator;
import com.facebook.stetho.inspector.elements.ChainedDescriptor;
import com.facebook.stetho.inspector.elements.Descriptor;
import com.facebook.stetho.inspector.elements.DescriptorMap;
import com.facebook.stetho.inspector.elements.NodeType;
import com.facebook.stetho.inspector.elements.StyleAccumulator;
import javax.annotation.Nullable;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor.class */
final class DialogFragmentDescriptor extends Descriptor implements ChainedDescriptor, HighlightableDescriptor {
    private final DialogFragmentAccessor mAccessor;
    private Descriptor mSuper;

    public static DescriptorMap register(DescriptorMap map) {
        maybeRegister(map, FragmentCompat.getSupportLibInstance());
        maybeRegister(map, FragmentCompat.getFrameworkInstance());
        return map;
    }

    private static void maybeRegister(DescriptorMap map, @Nullable FragmentCompat compat) {
        if (compat != null) {
            Class<?> dialogFragmentClass = compat.getDialogFragmentClass();
            LogUtil.d("Adding support for %s", dialogFragmentClass);
            map.register(dialogFragmentClass, new DialogFragmentDescriptor(compat));
        }
    }

    private DialogFragmentDescriptor(FragmentCompat compat) {
        this.mAccessor = compat.forDialogFragment2();
    }

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

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void hook(Object element) {
        this.mSuper.hook(element);
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void unhook(Object element) {
        this.mSuper.unhook(element);
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public NodeType getNodeType(Object element) {
        return this.mSuper.getNodeType(element);
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public String getNodeName(Object element) {
        return this.mSuper.getNodeName(element);
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public String getLocalName(Object element) {
        return this.mSuper.getLocalName(element);
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    @Nullable
    public String getNodeValue(Object element) {
        return this.mSuper.getNodeValue(element);
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void getChildren(Object element, Accumulator<Object> children) {
        children.store(this.mAccessor.getDialog(element));
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void getAttributes(Object element, AttributeAccumulator attributes) {
        this.mSuper.getAttributes(element, attributes);
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void setAttributesAsText(Object element, String text) {
        this.mSuper.setAttributesAsText(element, text);
    }

    @Override // com.facebook.stetho.inspector.elements.android.HighlightableDescriptor
    @Nullable
    public View getViewForHighlighting(Object element) {
        Descriptor.Host host = getHost();
        if (host instanceof AndroidDescriptorHost) {
            Dialog dialog = this.mAccessor.getDialog(element);
            return ((AndroidDescriptorHost) host).getHighlightingView(dialog);
        }
        return null;
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void getStyles(Object element, StyleAccumulator styles) {
    }
}
