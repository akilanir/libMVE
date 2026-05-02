package com.afollestad.materialdialogs;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.view.View;
import android.view.ViewGroup;
import com.afollestad.materialdialogs.internal.MDRootLayout;

/* loaded from: com.github.afollestad.material-dialogs.core.0.8.5.4.jar:com/afollestad/materialdialogs/DialogBase.class */
class DialogBase extends Dialog implements DialogInterface.OnShowListener {
    protected MDRootLayout view;
    private DialogInterface.OnShowListener mShowListener;

    protected DialogBase(Context context, int theme) {
        super(context, theme);
    }

    @Override // android.app.Dialog
    public View findViewById(int id) {
        return this.view.findViewById(id);
    }

    @Override // android.app.Dialog
    public final void setOnShowListener(DialogInterface.OnShowListener listener) {
        this.mShowListener = listener;
    }

    protected final void setOnShowListenerInternal() {
        super.setOnShowListener(this);
    }

    protected final void setViewInternal(View view) {
        super.setContentView(view);
    }

    @Override // android.content.DialogInterface.OnShowListener
    public void onShow(DialogInterface dialog) {
        if (this.mShowListener != null) {
            this.mShowListener.onShow(dialog);
        }
    }

    @Override // android.app.Dialog
    @Deprecated
    public void setContentView(int layoutResID) throws IllegalAccessError {
        throw new IllegalAccessError("setContentView() is not supported in MaterialDialog. Specify a custom view in the Builder instead.");
    }

    @Override // android.app.Dialog
    @Deprecated
    public void setContentView(View view) throws IllegalAccessError {
        throw new IllegalAccessError("setContentView() is not supported in MaterialDialog. Specify a custom view in the Builder instead.");
    }

    @Override // android.app.Dialog
    @Deprecated
    public void setContentView(View view, ViewGroup.LayoutParams params) throws IllegalAccessError {
        throw new IllegalAccessError("setContentView() is not supported in MaterialDialog. Specify a custom view in the Builder instead.");
    }
}
