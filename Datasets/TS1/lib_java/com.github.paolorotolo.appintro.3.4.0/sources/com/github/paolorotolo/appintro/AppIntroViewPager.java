package com.github.paolorotolo.appintro;

import android.content.Context;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.animation.Interpolator;
import java.lang.reflect.Field;

/* loaded from: com.github.paolorotolo.appintro.3.4.0.jar:com/github/paolorotolo/appintro/AppIntroViewPager.class */
public class AppIntroViewPager extends ViewPager {
    private boolean pagingEnabled;
    private boolean nextPagingEnabled;
    private float initialXValue;
    private int lockPage;
    protected ViewPager.OnPageChangeListener listener;
    private ScrollerCustomDuration mScroller;

    public AppIntroViewPager(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mScroller = null;
        this.pagingEnabled = true;
        this.nextPagingEnabled = true;
        this.lockPage = 0;
        initViewPagerScroller();
    }

    public void addOnPageChangeListener(ViewPager.OnPageChangeListener listener) {
        super.addOnPageChangeListener(listener);
        this.listener = listener;
    }

    public void setCurrentItem(int item) {
        boolean invokeMeLater = false;
        if (super.getCurrentItem() == 0 && item == 0) {
            invokeMeLater = true;
        }
        super.setCurrentItem(item);
        if (invokeMeLater && this.listener != null) {
            this.listener.onPageSelected(0);
        }
    }

    public boolean onInterceptTouchEvent(MotionEvent event) {
        if (checkPagingState(event)) {
            return false;
        }
        return super.onInterceptTouchEvent(event);
    }

    public boolean onTouchEvent(MotionEvent event) {
        if (checkPagingState(event)) {
            return false;
        }
        return super.onTouchEvent(event);
    }

    private boolean checkPagingState(MotionEvent event) {
        if (!this.pagingEnabled) {
            return true;
        }
        if (!this.nextPagingEnabled) {
            if (event.getAction() == 0) {
                this.initialXValue = event.getX();
            }
            if (event.getAction() == 2 && detectSwipeToRight(event)) {
                return true;
            }
            return false;
        }
        return false;
    }

    public void setNextPagingEnabled(boolean nextPagingEnabled) {
        this.nextPagingEnabled = nextPagingEnabled;
        if (!nextPagingEnabled) {
            this.lockPage = getCurrentItem();
        }
    }

    private void initViewPagerScroller() {
        try {
            Field scroller = ViewPager.class.getDeclaredField("mScroller");
            scroller.setAccessible(true);
            Field interpolator = ViewPager.class.getDeclaredField("sInterpolator");
            interpolator.setAccessible(true);
            this.mScroller = new ScrollerCustomDuration(getContext(), (Interpolator) interpolator.get(null));
            scroller.set(this, this.mScroller);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void setScrollDurationFactor(double scrollFactor) {
        this.mScroller.setScrollDurationFactor(scrollFactor);
    }

    public boolean isNextPagingEnabled() {
        return this.nextPagingEnabled;
    }

    public boolean isPagingEnabled() {
        return this.pagingEnabled;
    }

    public void setPagingEnabled(boolean pagingEnabled) {
        this.pagingEnabled = pagingEnabled;
    }

    public int getLockPage() {
        return this.lockPage;
    }

    public void setLockPage(int lockPage) {
        this.lockPage = lockPage;
    }

    private boolean detectSwipeToRight(MotionEvent event) {
        boolean result = false;
        try {
            float diffX = event.getX() - this.initialXValue;
            if (Math.abs(diffX) > 0.0f && diffX < 0.0f) {
                result = true;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return result;
    }
}
