package com.getbase.floatingactionbutton;

import android.graphics.Rect;
import android.support.annotation.NonNull;
import android.view.MotionEvent;
import android.view.TouchDelegate;
import android.view.View;
import java.util.ArrayList;

/* loaded from: com.getbase.floatingactionbutton.1.10.0.jar:com/getbase/floatingactionbutton/TouchDelegateGroup.class */
public class TouchDelegateGroup extends TouchDelegate {
    private static final Rect USELESS_HACKY_RECT = new Rect();
    private final ArrayList<TouchDelegate> mTouchDelegates;
    private TouchDelegate mCurrentTouchDelegate;
    private boolean mEnabled;

    public TouchDelegateGroup(View uselessHackyView) {
        super(USELESS_HACKY_RECT, uselessHackyView);
        this.mTouchDelegates = new ArrayList<>();
    }

    public void addTouchDelegate(@NonNull TouchDelegate touchDelegate) {
        this.mTouchDelegates.add(touchDelegate);
    }

    public void removeTouchDelegate(TouchDelegate touchDelegate) {
        this.mTouchDelegates.remove(touchDelegate);
        if (this.mCurrentTouchDelegate == touchDelegate) {
            this.mCurrentTouchDelegate = null;
        }
    }

    public void clearTouchDelegates() {
        this.mTouchDelegates.clear();
        this.mCurrentTouchDelegate = null;
    }

    @Override // android.view.TouchDelegate
    public boolean onTouchEvent(@NonNull MotionEvent event) {
        if (!this.mEnabled) {
            return false;
        }
        TouchDelegate delegate = null;
        switch (event.getAction()) {
            case 0:
                for (int i = 0; i < this.mTouchDelegates.size(); i++) {
                    TouchDelegate touchDelegate = this.mTouchDelegates.get(i);
                    if (touchDelegate.onTouchEvent(event)) {
                        this.mCurrentTouchDelegate = touchDelegate;
                        return true;
                    }
                }
                break;
            case 1:
            case FloatingActionsMenu.EXPAND_RIGHT /* 3 */:
                delegate = this.mCurrentTouchDelegate;
                this.mCurrentTouchDelegate = null;
                break;
            case FloatingActionsMenu.EXPAND_LEFT /* 2 */:
                delegate = this.mCurrentTouchDelegate;
                break;
        }
        return delegate != null && delegate.onTouchEvent(event);
    }

    public void setEnabled(boolean enabled) {
        this.mEnabled = enabled;
    }
}
