package com.viewpagerindicator;

import android.support.v4.view.ViewPager;

/* loaded from: com.viewpagerindicator.library.2.4.1.jar:com/viewpagerindicator/PageIndicator.class */
public interface PageIndicator extends ViewPager.OnPageChangeListener {
    void setViewPager(ViewPager viewPager);

    void setViewPager(ViewPager viewPager, int i);

    void setCurrentItem(int i);

    void setOnPageChangeListener(ViewPager.OnPageChangeListener onPageChangeListener);

    void notifyDataSetChanged();
}
