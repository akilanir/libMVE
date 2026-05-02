package com.facebook.stetho.common.android;

import android.app.Dialog;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/android/DialogFragmentAccessor.class */
public interface DialogFragmentAccessor<DIALOG_FRAGMENT, FRAGMENT, FRAGMENT_MANAGER> extends FragmentAccessor<FRAGMENT, FRAGMENT_MANAGER> {
    Dialog getDialog(DIALOG_FRAGMENT dialog_fragment);
}
