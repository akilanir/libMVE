package com.shamanland.fab;

import android.content.Context;
import android.os.Build;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;

/* loaded from: com.shamanland.fab.0.0.5.jar:com/shamanland/fab/ScrollDetector.class */
public abstract class ScrollDetector extends GestureDetector.SimpleOnGestureListener implements View.OnTouchListener {
    private final GestureDetector mDetector;
    private final int mSlop;
    private float mDownY;
    private boolean mDirection;
    private boolean mIgnore;

    public abstract void onScrollDown();

    public abstract void onScrollUp();

    public void setIgnore(boolean ignore) {
        this.mIgnore = ignore;
    }

    public ScrollDetector(Context context) {
        this.mDetector = new GestureDetector(context, this);
        if (Build.VERSION.SDK_INT < 8) {
            this.mSlop = ViewConfiguration.getTouchSlop() * 2;
        } else {
            this.mSlop = ViewConfiguration.get(context).getScaledPagingTouchSlop();
        }
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View v, MotionEvent event) {
        this.mDetector.onTouchEvent(event);
        return false;
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public boolean onDown(MotionEvent e) {
        this.mDownY = e.getY();
        return false;
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public boolean onScroll(MotionEvent e1, MotionEvent e2, float distanceX, float distanceY) {
        if (this.mIgnore) {
            return false;
        }
        if (this.mDirection != (distanceY > 0.0f)) {
            this.mDirection = !this.mDirection;
            this.mDownY = e2.getY();
        }
        float distance = this.mDownY - e2.getY();
        if (distance < (-this.mSlop)) {
            onScrollDown();
            return false;
        }
        if (distance > this.mSlop) {
            onScrollUp();
            return false;
        }
        return false;
    }
}
