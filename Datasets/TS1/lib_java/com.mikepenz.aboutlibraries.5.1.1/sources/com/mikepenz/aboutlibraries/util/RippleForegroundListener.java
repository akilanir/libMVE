package com.mikepenz.aboutlibraries.util;

import android.annotation.SuppressLint;
import android.os.Build;
import android.view.MotionEvent;
import android.view.View;
import com.mikepenz.aboutlibraries.BuildConfig;

/* loaded from: com.mikepenz.aboutlibraries.5.1.1.jar:com/mikepenz/aboutlibraries/util/RippleForegroundListener.class */
public class RippleForegroundListener implements View.OnTouchListener {
    private int rippleViewId;

    public RippleForegroundListener(int rippleViewId) {
        this.rippleViewId = -1;
        this.rippleViewId = rippleViewId;
    }

    @Override // android.view.View.OnTouchListener
    @SuppressLint({"ClickableViewAccessibility"})
    public boolean onTouch(View v, MotionEvent event) {
        float x = event.getX() + v.getLeft();
        float y = event.getY() + v.getTop();
        View rippleView = findRippleView(v);
        if (rippleView == null) {
            return false;
        }
        if (Build.VERSION.SDK_INT >= 21) {
            rippleView.drawableHotspotChanged(x, y);
        }
        switch (event.getActionMasked()) {
            case BuildConfig.DEBUG /* 0 */:
                rippleView.setPressed(true);
                break;
            case 1:
            case 3:
                rippleView.setPressed(false);
                break;
        }
        return false;
    }

    public View findRippleView(View view) {
        if (view.getId() == this.rippleViewId) {
            return view;
        }
        if (view.getParent() instanceof View) {
            return findRippleView((View) view.getParent());
        }
        return null;
    }
}
