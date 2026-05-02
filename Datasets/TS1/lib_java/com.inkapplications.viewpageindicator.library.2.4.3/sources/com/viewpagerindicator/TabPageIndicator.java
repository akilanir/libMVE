package com.viewpagerindicator;

import android.content.Context;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.TextView;

/* loaded from: com.inkapplications.viewpageindicator.library.2.4.3.jar:com/viewpagerindicator/TabPageIndicator.class */
public class TabPageIndicator extends HorizontalScrollView implements PageIndicator {
    private static final CharSequence EMPTY_TITLE = BuildConfig.FLAVOR;
    private Runnable mTabSelector;
    private final View.OnClickListener mTabClickListener;
    private final IcsLinearLayout mTabLayout;
    private ViewPager mViewPager;
    private ViewPager.OnPageChangeListener mListener;
    private int mMaxTabWidth;
    private int mSelectedTabIndex;
    private OnTabReselectedListener mTabReselectedListener;

    /* loaded from: com.inkapplications.viewpageindicator.library.2.4.3.jar:com/viewpagerindicator/TabPageIndicator$OnTabReselectedListener.class */
    public interface OnTabReselectedListener {
        void onTabReselected(int i);
    }

    public TabPageIndicator(Context context) {
        this(context, null);
    }

    public TabPageIndicator(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mTabClickListener = new View.OnClickListener() { // from class: com.viewpagerindicator.TabPageIndicator.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                TabView tabView = (TabView) view;
                int oldSelected = TabPageIndicator.this.mViewPager.getCurrentItem();
                int newSelected = tabView.getIndex();
                TabPageIndicator.this.mViewPager.setCurrentItem(newSelected);
                if (oldSelected == newSelected && TabPageIndicator.this.mTabReselectedListener != null) {
                    TabPageIndicator.this.mTabReselectedListener.onTabReselected(newSelected);
                }
            }
        };
        setHorizontalScrollBarEnabled(false);
        this.mTabLayout = new IcsLinearLayout(context, R.attr.vpiTabPageIndicatorStyle);
        addView(this.mTabLayout, new ViewGroup.LayoutParams(-2, -1));
    }

    public void setOnTabReselectedListener(OnTabReselectedListener listener) {
        this.mTabReselectedListener = listener;
    }

    @Override // android.widget.HorizontalScrollView, android.widget.FrameLayout, android.view.View
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
        boolean lockedExpanded = widthMode == 1073741824;
        setFillViewport(lockedExpanded);
        int childCount = this.mTabLayout.getChildCount();
        if (childCount > 1 && (widthMode == 1073741824 || widthMode == Integer.MIN_VALUE)) {
            if (childCount > 2) {
                this.mMaxTabWidth = (int) (View.MeasureSpec.getSize(widthMeasureSpec) * 0.4f);
            } else {
                this.mMaxTabWidth = View.MeasureSpec.getSize(widthMeasureSpec) / 2;
            }
        } else {
            this.mMaxTabWidth = -1;
        }
        int oldWidth = getMeasuredWidth();
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        int newWidth = getMeasuredWidth();
        if (lockedExpanded && oldWidth != newWidth) {
            setCurrentItem(this.mSelectedTabIndex);
        }
    }

    private void animateToTab(int position) {
        final View tabView = this.mTabLayout.getChildAt(position);
        if (this.mTabSelector != null) {
            removeCallbacks(this.mTabSelector);
        }
        this.mTabSelector = new Runnable() { // from class: com.viewpagerindicator.TabPageIndicator.2
            @Override // java.lang.Runnable
            public void run() {
                int scrollPos = tabView.getLeft() - ((TabPageIndicator.this.getWidth() - tabView.getWidth()) / 2);
                TabPageIndicator.this.smoothScrollTo(scrollPos, 0);
                TabPageIndicator.this.mTabSelector = null;
            }
        };
        post(this.mTabSelector);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.mTabSelector != null) {
            post(this.mTabSelector);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.mTabSelector != null) {
            removeCallbacks(this.mTabSelector);
        }
    }

    private void addTab(int index, CharSequence text, int iconResId) {
        TabView tabView = new TabView(getContext());
        tabView.mIndex = index;
        tabView.setFocusable(true);
        tabView.setOnClickListener(this.mTabClickListener);
        tabView.setText(text);
        if (iconResId != 0) {
            tabView.setCompoundDrawablesWithIntrinsicBounds(iconResId, 0, 0, 0);
        }
        this.mTabLayout.addView(tabView, new LinearLayout.LayoutParams(0, -1, 1.0f));
    }

    public void onPageScrollStateChanged(int arg0) {
        if (this.mListener != null) {
            this.mListener.onPageScrollStateChanged(arg0);
        }
    }

    public void onPageScrolled(int arg0, float arg1, int arg2) {
        if (this.mListener != null) {
            this.mListener.onPageScrolled(arg0, arg1, arg2);
        }
    }

    public void onPageSelected(int arg0) {
        setCurrentItem(arg0);
        if (this.mListener != null) {
            this.mListener.onPageSelected(arg0);
        }
    }

    @Override // com.viewpagerindicator.PageIndicator
    public void setViewPager(ViewPager view) {
        if (this.mViewPager == view) {
            return;
        }
        if (this.mViewPager != null) {
            this.mViewPager.setOnPageChangeListener((ViewPager.OnPageChangeListener) null);
        }
        PagerAdapter adapter = view.getAdapter();
        if (adapter == null) {
            throw new IllegalStateException("ViewPager does not have adapter instance.");
        }
        this.mViewPager = view;
        view.setOnPageChangeListener(this);
        notifyDataSetChanged();
    }

    @Override // com.viewpagerindicator.PageIndicator
    public void notifyDataSetChanged() {
        this.mTabLayout.removeAllViews();
        IconPagerAdapter adapter = this.mViewPager.getAdapter();
        IconPagerAdapter iconAdapter = null;
        if (adapter instanceof IconPagerAdapter) {
            iconAdapter = adapter;
        }
        int count = adapter.getCount();
        for (int i = 0; i < count; i++) {
            CharSequence title = adapter.getPageTitle(i);
            if (title == null) {
                title = EMPTY_TITLE;
            }
            int iconResId = 0;
            if (iconAdapter != null) {
                iconResId = iconAdapter.getIconResId(i);
            }
            addTab(i, title, iconResId);
        }
        if (this.mSelectedTabIndex > count) {
            this.mSelectedTabIndex = count - 1;
        }
        setCurrentItem(this.mSelectedTabIndex);
        requestLayout();
    }

    @Override // com.viewpagerindicator.PageIndicator
    public void setViewPager(ViewPager view, int initialPosition) {
        setViewPager(view);
        setCurrentItem(initialPosition);
    }

    @Override // com.viewpagerindicator.PageIndicator
    public void setCurrentItem(int item) {
        if (this.mViewPager == null) {
            throw new IllegalStateException("ViewPager has not been bound.");
        }
        this.mSelectedTabIndex = item;
        this.mViewPager.setCurrentItem(item);
        int tabCount = this.mTabLayout.getChildCount();
        int i = 0;
        while (i < tabCount) {
            View child = this.mTabLayout.getChildAt(i);
            boolean isSelected = i == item;
            child.setSelected(isSelected);
            if (isSelected) {
                animateToTab(item);
            }
            i++;
        }
    }

    @Override // com.viewpagerindicator.PageIndicator
    public void setOnPageChangeListener(ViewPager.OnPageChangeListener listener) {
        this.mListener = listener;
    }

    /* loaded from: com.inkapplications.viewpageindicator.library.2.4.3.jar:com/viewpagerindicator/TabPageIndicator$TabView.class */
    private class TabView extends TextView {
        private int mIndex;

        public TabView(Context context) {
            super(context, null, R.attr.vpiTabPageIndicatorStyle);
        }

        @Override // android.widget.TextView, android.view.View
        public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            super.onMeasure(widthMeasureSpec, heightMeasureSpec);
            if (TabPageIndicator.this.mMaxTabWidth > 0 && getMeasuredWidth() > TabPageIndicator.this.mMaxTabWidth) {
                super.onMeasure(View.MeasureSpec.makeMeasureSpec(TabPageIndicator.this.mMaxTabWidth, 1073741824), heightMeasureSpec);
            }
        }

        public int getIndex() {
            return this.mIndex;
        }
    }
}
