package org.ligi.axt.extensions;

import android.content.Intent;
import android.os.Build;
import android.util.Log;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.inputmethod.InputMethodManager;

/* loaded from: org.ligi.AXT.0.35.jar:org/ligi/axt/extensions/ViewAXT.class */
public class ViewAXT {
    private final View view;

    public ViewAXT(View view) {
        this.view = view;
    }

    public <T extends View> T findById(int i) {
        return (T) this.view.findViewById(i);
    }

    public void hideKeyBoard() {
        InputMethodManager imm = (InputMethodManager) this.view.getContext().getSystemService("input_method");
        if (imm != null) {
            imm.hideSoftInputFromWindow(this.view.getWindowToken(), 0);
        } else {
            Log.w("ViewAXT", "could not hide Keyboard as INPUT_METHOD_SERVICE is not available");
        }
    }

    public void showKeyboard() {
        InputMethodManager imm = (InputMethodManager) this.view.getContext().getSystemService("input_method");
        if (imm != null) {
            imm.showSoftInput(this.view, 0);
        } else {
            Log.w("ViewAXT", "could not show Keyboard as INPUT_METHOD_SERVICE is not available");
        }
    }

    public void setVisibility(boolean visible) {
        setVisibility(visible, 8);
    }

    public void setVisibility(boolean visible, int hiddenVisibility) {
        if (visible) {
            this.view.setVisibility(0);
        } else {
            this.view.setVisibility(hiddenVisibility);
        }
    }

    public void startIntentOnClick(final Intent intent) {
        this.view.setOnClickListener(new View.OnClickListener() { // from class: org.ligi.axt.extensions.ViewAXT.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                v.getContext().startActivity(intent);
            }
        });
    }

    public void onFirstGlobalLayout(final Runnable runnable) {
        this.view.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() { // from class: org.ligi.axt.extensions.ViewAXT.2
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            public void onGlobalLayout() {
                if (Build.VERSION.SDK_INT < 16) {
                    ViewAXT.this.view.getViewTreeObserver().removeGlobalOnLayoutListener(this);
                } else {
                    ViewAXT.this.view.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                }
                runnable.run();
            }
        });
    }
}
