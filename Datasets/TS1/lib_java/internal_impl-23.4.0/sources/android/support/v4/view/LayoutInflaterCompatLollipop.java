package android.support.v4.view;

import android.support.v4.view.LayoutInflaterCompatHC;
import android.view.LayoutInflater;

/* loaded from: internal_impl-23.4.0.jar:android/support/v4/view/LayoutInflaterCompatLollipop.class */
class LayoutInflaterCompatLollipop {
    LayoutInflaterCompatLollipop() {
    }

    static void setFactory(LayoutInflater inflater, LayoutInflaterFactory factory) {
        inflater.setFactory2(factory != null ? new LayoutInflaterCompatHC.FactoryWrapperHC(factory) : null);
    }
}
