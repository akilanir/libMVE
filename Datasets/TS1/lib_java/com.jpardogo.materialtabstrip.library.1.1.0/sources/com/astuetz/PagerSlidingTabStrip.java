package com.astuetz;

import android.R;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.v4.util.Pair;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.TextView;

/* loaded from: com.jpardogo.materialtabstrip.library.1.1.0.jar:com/astuetz/PagerSlidingTabStrip.class */
public class PagerSlidingTabStrip extends HorizontalScrollView {
    public static final int DEF_VALUE_TAB_TEXT_ALPHA = 150;
    private static final int[] ANDROID_ATTRS = {R.attr.textColorPrimary, R.attr.padding, R.attr.paddingLeft, R.attr.paddingRight};
    private static final int TEXT_COLOR_PRIMARY = 0;
    private static final int PADDING_INDEX = 1;
    private static final int PADDING_LEFT_INDEX = 2;
    private static final int PADDING_RIGHT_INDEX = 3;
    private LinearLayout mTabsContainer;
    private LinearLayout.LayoutParams mTabLayoutParams;
    private final PagerAdapterObserver mAdapterObserver;
    private final PageListener mPageListener;
    private OnTabReselectedListener mTabReselectedListener;
    public ViewPager.OnPageChangeListener mDelegatePageListener;
    private ViewPager mPager;
    private int mTabCount;
    private int mCurrentPosition;
    private float mCurrentPositionOffset;
    private Paint mRectPaint;
    private Paint mDividerPaint;
    private int mIndicatorColor;
    private int mIndicatorHeight;
    private int mUnderlineHeight;
    private int mUnderlineColor;
    private int mDividerWidth;
    private int mDividerPadding;
    private int mDividerColor;
    private int mTabPadding;
    private int mTabTextSize;
    private ColorStateList mTabTextColor;
    private int mPaddingLeft;
    private int mPaddingRight;
    private boolean isExpandTabs;
    private boolean isCustomTabs;
    private boolean isPaddingMiddle;
    private boolean isTabTextAllCaps;
    private Typeface mTabTextTypeface;
    private int mTabTextTypefaceStyle;
    private int mScrollOffset;
    private int mLastScrollX;
    private int mTabBackgroundResId;
    private ViewTreeObserver.OnGlobalLayoutListener firstTabGlobalLayoutListener;

    /* loaded from: com.jpardogo.materialtabstrip.library.1.1.0.jar:com/astuetz/PagerSlidingTabStrip$CustomTabProvider.class */
    public interface CustomTabProvider {
        View getCustomTabView(ViewGroup viewGroup, int i);

        void tabSelected(View view);

        void tabUnselected(View view);
    }

    /* loaded from: com.jpardogo.materialtabstrip.library.1.1.0.jar:com/astuetz/PagerSlidingTabStrip$OnTabReselectedListener.class */
    public interface OnTabReselectedListener {
        void onTabReselected(int i);
    }

    public PagerSlidingTabStrip(Context context) {
        this(context, null);
    }

    public PagerSlidingTabStrip(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public PagerSlidingTabStrip(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mAdapterObserver = new PagerAdapterObserver();
        this.mPageListener = new PageListener();
        this.mTabReselectedListener = null;
        this.mCurrentPosition = 0;
        this.mCurrentPositionOffset = 0.0f;
        this.mIndicatorHeight = PADDING_LEFT_INDEX;
        this.mUnderlineHeight = 0;
        this.mDividerWidth = 0;
        this.mDividerPadding = 0;
        this.mTabPadding = 12;
        this.mTabTextSize = 14;
        this.mTabTextColor = null;
        this.mPaddingLeft = 0;
        this.mPaddingRight = 0;
        this.isExpandTabs = false;
        this.isPaddingMiddle = false;
        this.isTabTextAllCaps = true;
        this.mTabTextTypeface = null;
        this.mTabTextTypefaceStyle = PADDING_INDEX;
        this.mLastScrollX = 0;
        this.mTabBackgroundResId = com.astuetz.pagerslidingtabstrip.R.drawable.psts_background_tab;
        this.firstTabGlobalLayoutListener = new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.astuetz.PagerSlidingTabStrip.2
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            public void onGlobalLayout() {
                View view = PagerSlidingTabStrip.this.mTabsContainer.getChildAt(0);
                if (Build.VERSION.SDK_INT < 16) {
                    removeGlobalLayoutListenerPreJB();
                } else {
                    removeGlobalLayoutListenerJB();
                }
                if (PagerSlidingTabStrip.this.isPaddingMiddle) {
                    int mHalfWidthFirstTab = view.getWidth() / PagerSlidingTabStrip.PADDING_LEFT_INDEX;
                    PagerSlidingTabStrip.this.mPaddingLeft = PagerSlidingTabStrip.this.mPaddingRight = (PagerSlidingTabStrip.this.getWidth() / PagerSlidingTabStrip.PADDING_LEFT_INDEX) - mHalfWidthFirstTab;
                }
                PagerSlidingTabStrip.this.setPadding(PagerSlidingTabStrip.this.mPaddingLeft, PagerSlidingTabStrip.this.getPaddingTop(), PagerSlidingTabStrip.this.mPaddingRight, PagerSlidingTabStrip.this.getPaddingBottom());
                if (PagerSlidingTabStrip.this.mScrollOffset == 0) {
                    PagerSlidingTabStrip.this.mScrollOffset = (PagerSlidingTabStrip.this.getWidth() / PagerSlidingTabStrip.PADDING_LEFT_INDEX) - PagerSlidingTabStrip.this.mPaddingLeft;
                }
                PagerSlidingTabStrip.this.mCurrentPosition = PagerSlidingTabStrip.this.mPager.getCurrentItem();
                PagerSlidingTabStrip.this.mCurrentPositionOffset = 0.0f;
                PagerSlidingTabStrip.this.scrollToChild(PagerSlidingTabStrip.this.mCurrentPosition, 0);
                PagerSlidingTabStrip.this.updateSelection(PagerSlidingTabStrip.this.mCurrentPosition);
            }

            private void removeGlobalLayoutListenerPreJB() {
                PagerSlidingTabStrip.this.getViewTreeObserver().removeGlobalOnLayoutListener(this);
            }

            @TargetApi(16)
            private void removeGlobalLayoutListenerJB() {
                PagerSlidingTabStrip.this.getViewTreeObserver().removeOnGlobalLayoutListener(this);
            }
        };
        setFillViewport(true);
        setWillNotDraw(false);
        this.mTabsContainer = new LinearLayout(context);
        this.mTabsContainer.setOrientation(0);
        addView(this.mTabsContainer);
        this.mRectPaint = new Paint();
        this.mRectPaint.setAntiAlias(true);
        this.mRectPaint.setStyle(Paint.Style.FILL);
        DisplayMetrics dm = getResources().getDisplayMetrics();
        this.mScrollOffset = (int) TypedValue.applyDimension(PADDING_INDEX, this.mScrollOffset, dm);
        this.mIndicatorHeight = (int) TypedValue.applyDimension(PADDING_INDEX, this.mIndicatorHeight, dm);
        this.mUnderlineHeight = (int) TypedValue.applyDimension(PADDING_INDEX, this.mUnderlineHeight, dm);
        this.mDividerPadding = (int) TypedValue.applyDimension(PADDING_INDEX, this.mDividerPadding, dm);
        this.mTabPadding = (int) TypedValue.applyDimension(PADDING_INDEX, this.mTabPadding, dm);
        this.mDividerWidth = (int) TypedValue.applyDimension(PADDING_INDEX, this.mDividerWidth, dm);
        this.mTabTextSize = (int) TypedValue.applyDimension(PADDING_LEFT_INDEX, this.mTabTextSize, dm);
        this.mDividerPaint = new Paint();
        this.mDividerPaint.setAntiAlias(true);
        this.mDividerPaint.setStrokeWidth(this.mDividerWidth);
        TypedArray a = context.obtainStyledAttributes(attrs, ANDROID_ATTRS);
        int textPrimaryColor = a.getColor(0, getResources().getColor(R.color.black));
        this.mUnderlineColor = textPrimaryColor;
        this.mDividerColor = textPrimaryColor;
        this.mIndicatorColor = textPrimaryColor;
        int padding = a.getDimensionPixelSize(PADDING_INDEX, 0);
        this.mPaddingLeft = padding > 0 ? padding : a.getDimensionPixelSize(PADDING_LEFT_INDEX, 0);
        this.mPaddingRight = padding > 0 ? padding : a.getDimensionPixelSize(PADDING_RIGHT_INDEX, 0);
        a.recycle();
        String tabTextTypefaceName = "sans-serif";
        if (Build.VERSION.SDK_INT >= 21) {
            tabTextTypefaceName = "sans-serif-medium";
            this.mTabTextTypefaceStyle = 0;
        }
        TypedArray a2 = context.obtainStyledAttributes(attrs, com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip);
        this.mIndicatorColor = a2.getColor(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsIndicatorColor, this.mIndicatorColor);
        this.mIndicatorHeight = a2.getDimensionPixelSize(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsIndicatorHeight, this.mIndicatorHeight);
        this.mUnderlineColor = a2.getColor(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsUnderlineColor, this.mUnderlineColor);
        this.mUnderlineHeight = a2.getDimensionPixelSize(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsUnderlineHeight, this.mUnderlineHeight);
        this.mDividerColor = a2.getColor(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsDividerColor, this.mDividerColor);
        this.mDividerWidth = a2.getDimensionPixelSize(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsDividerWidth, this.mDividerWidth);
        this.mDividerPadding = a2.getDimensionPixelSize(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsDividerPadding, this.mDividerPadding);
        this.isExpandTabs = a2.getBoolean(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsShouldExpand, this.isExpandTabs);
        this.mScrollOffset = a2.getDimensionPixelSize(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsScrollOffset, this.mScrollOffset);
        this.isPaddingMiddle = a2.getBoolean(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsPaddingMiddle, this.isPaddingMiddle);
        this.mTabPadding = a2.getDimensionPixelSize(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsTabPaddingLeftRight, this.mTabPadding);
        this.mTabBackgroundResId = a2.getResourceId(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsTabBackground, this.mTabBackgroundResId);
        this.mTabTextSize = a2.getDimensionPixelSize(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsTabTextSize, this.mTabTextSize);
        this.mTabTextColor = a2.hasValue(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsTabTextColor) ? a2.getColorStateList(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsTabTextColor) : null;
        this.mTabTextTypefaceStyle = a2.getInt(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsTabTextStyle, this.mTabTextTypefaceStyle);
        this.isTabTextAllCaps = a2.getBoolean(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsTabTextAllCaps, this.isTabTextAllCaps);
        int tabTextAlpha = a2.getInt(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsTabTextAlpha, DEF_VALUE_TAB_TEXT_ALPHA);
        String fontFamily = a2.getString(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsTabTextFontFamily);
        a2.recycle();
        if (this.mTabTextColor == null) {
            this.mTabTextColor = createColorStateList(textPrimaryColor, textPrimaryColor, Color.argb(tabTextAlpha, Color.red(textPrimaryColor), Color.green(textPrimaryColor), Color.blue(textPrimaryColor)));
        }
        this.mTabTextTypeface = Typeface.create(fontFamily != null ? fontFamily : tabTextTypefaceName, this.mTabTextTypefaceStyle);
        setTabsContainerParentViewPaddings();
        this.mTabLayoutParams = this.isExpandTabs ? new LinearLayout.LayoutParams(0, -1, 1.0f) : new LinearLayout.LayoutParams(-2, -1);
    }

    private void setTabsContainerParentViewPaddings() {
        int bottomMargin = this.mIndicatorHeight >= this.mUnderlineHeight ? this.mIndicatorHeight : this.mUnderlineHeight;
        setPadding(getPaddingLeft(), getPaddingTop(), getPaddingRight(), bottomMargin);
    }

    public void setViewPager(ViewPager pager) {
        this.mPager = pager;
        if (pager.getAdapter() == null) {
            throw new IllegalStateException("ViewPager does not have adapter instance.");
        }
        this.isCustomTabs = pager.getAdapter() instanceof CustomTabProvider;
        pager.setOnPageChangeListener(this.mPageListener);
        pager.getAdapter().registerDataSetObserver(this.mAdapterObserver);
        this.mAdapterObserver.setAttached(true);
        notifyDataSetChanged();
    }

    public void notifyDataSetChanged() {
        View inflate;
        this.mTabsContainer.removeAllViews();
        this.mTabCount = this.mPager.getAdapter().getCount();
        for (int i = 0; i < this.mTabCount; i += PADDING_INDEX) {
            if (this.isCustomTabs) {
                inflate = this.mPager.getAdapter().getCustomTabView(this, i);
            } else {
                inflate = LayoutInflater.from(getContext()).inflate(com.astuetz.pagerslidingtabstrip.R.layout.psts_tab, (ViewGroup) this, false);
            }
            View tabView = inflate;
            CharSequence title = this.mPager.getAdapter().getPageTitle(i);
            addTab(i, title, tabView);
        }
        updateTabStyles();
    }

    private void addTab(final int position, CharSequence title, View tabView) {
        TextView textView = (TextView) tabView.findViewById(com.astuetz.pagerslidingtabstrip.R.id.psts_tab_title);
        if (textView != null && title != null) {
            textView.setText(title);
        }
        tabView.setFocusable(true);
        tabView.setOnClickListener(new View.OnClickListener() { // from class: com.astuetz.PagerSlidingTabStrip.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (PagerSlidingTabStrip.this.mPager.getCurrentItem() != position) {
                    View tab = PagerSlidingTabStrip.this.mTabsContainer.getChildAt(PagerSlidingTabStrip.this.mPager.getCurrentItem());
                    PagerSlidingTabStrip.this.unSelect(tab);
                    PagerSlidingTabStrip.this.mPager.setCurrentItem(position);
                } else if (PagerSlidingTabStrip.this.mTabReselectedListener != null) {
                    PagerSlidingTabStrip.this.mTabReselectedListener.onTabReselected(position);
                }
            }
        });
        this.mTabsContainer.addView(tabView, position, this.mTabLayoutParams);
    }

    private void updateTabStyles() {
        for (int i = 0; i < this.mTabCount; i += PADDING_INDEX) {
            View v = this.mTabsContainer.getChildAt(i);
            v.setBackgroundResource(this.mTabBackgroundResId);
            v.setPadding(this.mTabPadding, v.getPaddingTop(), this.mTabPadding, v.getPaddingBottom());
            TextView tab_title = (TextView) v.findViewById(com.astuetz.pagerslidingtabstrip.R.id.psts_tab_title);
            if (tab_title != null) {
                tab_title.setTextColor(this.mTabTextColor);
                tab_title.setTypeface(this.mTabTextTypeface, this.mTabTextTypefaceStyle);
                tab_title.setTextSize(0, this.mTabTextSize);
                if (this.isTabTextAllCaps) {
                    if (Build.VERSION.SDK_INT >= 14) {
                        tab_title.setAllCaps(true);
                    } else {
                        tab_title.setText(tab_title.getText().toString().toUpperCase(getResources().getConfiguration().locale));
                    }
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void scrollToChild(int position, int offset) {
        if (this.mTabCount == 0) {
            return;
        }
        int newScrollX = this.mTabsContainer.getChildAt(position).getLeft() + offset;
        if (position > 0 || offset > 0) {
            int newScrollX2 = newScrollX - this.mScrollOffset;
            Pair<Float, Float> lines = getIndicatorCoordinates();
            newScrollX = (int) (newScrollX2 + ((((Float) lines.second).floatValue() - ((Float) lines.first).floatValue()) / 2.0f));
        }
        if (newScrollX != this.mLastScrollX) {
            this.mLastScrollX = newScrollX;
            scrollTo(newScrollX, 0);
        }
    }

    private Pair<Float, Float> getIndicatorCoordinates() {
        View currentTab = this.mTabsContainer.getChildAt(this.mCurrentPosition);
        float lineLeft = currentTab.getLeft();
        float lineRight = currentTab.getRight();
        if (this.mCurrentPositionOffset > 0.0f && this.mCurrentPosition < this.mTabCount - PADDING_INDEX) {
            View nextTab = this.mTabsContainer.getChildAt(this.mCurrentPosition + PADDING_INDEX);
            float nextTabLeft = nextTab.getLeft();
            float nextTabRight = nextTab.getRight();
            lineLeft = (this.mCurrentPositionOffset * nextTabLeft) + ((1.0f - this.mCurrentPositionOffset) * lineLeft);
            lineRight = (this.mCurrentPositionOffset * nextTabRight) + ((1.0f - this.mCurrentPositionOffset) * lineRight);
        }
        return new Pair<>(Float.valueOf(lineLeft), Float.valueOf(lineRight));
    }

    @Override // android.widget.HorizontalScrollView, android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        int width;
        if (this.isPaddingMiddle || this.mPaddingLeft > 0 || this.mPaddingRight > 0) {
            if (this.isPaddingMiddle) {
                width = getWidth();
            } else {
                width = (getWidth() - this.mPaddingLeft) - this.mPaddingRight;
            }
            this.mTabsContainer.setMinimumWidth(width);
            setClipToPadding(false);
        }
        if (this.mTabsContainer.getChildCount() > 0) {
            this.mTabsContainer.getChildAt(0).getViewTreeObserver().addOnGlobalLayoutListener(this.firstTabGlobalLayoutListener);
        }
        super.onLayout(changed, l, t, r, b);
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (isInEditMode() || this.mTabCount == 0) {
            return;
        }
        int height = getHeight();
        if (this.mDividerWidth > 0) {
            this.mDividerPaint.setStrokeWidth(this.mDividerWidth);
            this.mDividerPaint.setColor(this.mDividerColor);
            for (int i = 0; i < this.mTabCount - PADDING_INDEX; i += PADDING_INDEX) {
                View tab = this.mTabsContainer.getChildAt(i);
                canvas.drawLine(tab.getRight(), this.mDividerPadding, tab.getRight(), height - this.mDividerPadding, this.mDividerPaint);
            }
        }
        if (this.mUnderlineHeight > 0) {
            this.mRectPaint.setColor(this.mUnderlineColor);
            canvas.drawRect(this.mPaddingLeft, height - this.mUnderlineHeight, this.mTabsContainer.getWidth() + this.mPaddingRight, height, this.mRectPaint);
        }
        if (this.mIndicatorHeight > 0) {
            this.mRectPaint.setColor(this.mIndicatorColor);
            Pair<Float, Float> lines = getIndicatorCoordinates();
            canvas.drawRect(((Float) lines.first).floatValue() + this.mPaddingLeft, height - this.mIndicatorHeight, ((Float) lines.second).floatValue() + this.mPaddingLeft, height, this.mRectPaint);
        }
    }

    public void setOnTabReselectedListener(OnTabReselectedListener tabReselectedListener) {
        this.mTabReselectedListener = tabReselectedListener;
    }

    public void setOnPageChangeListener(ViewPager.OnPageChangeListener listener) {
        this.mDelegatePageListener = listener;
    }

    /* loaded from: com.jpardogo.materialtabstrip.library.1.1.0.jar:com/astuetz/PagerSlidingTabStrip$PageListener.class */
    private class PageListener implements ViewPager.OnPageChangeListener {
        private PageListener() {
        }

        public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            PagerSlidingTabStrip.this.mCurrentPosition = position;
            PagerSlidingTabStrip.this.mCurrentPositionOffset = positionOffset;
            int offset = PagerSlidingTabStrip.this.mTabCount > 0 ? (int) (positionOffset * PagerSlidingTabStrip.this.mTabsContainer.getChildAt(position).getWidth()) : 0;
            PagerSlidingTabStrip.this.scrollToChild(position, offset);
            PagerSlidingTabStrip.this.invalidate();
            if (PagerSlidingTabStrip.this.mDelegatePageListener != null) {
                PagerSlidingTabStrip.this.mDelegatePageListener.onPageScrolled(position, positionOffset, positionOffsetPixels);
            }
        }

        public void onPageScrollStateChanged(int state) {
            if (state == 0) {
                PagerSlidingTabStrip.this.scrollToChild(PagerSlidingTabStrip.this.mPager.getCurrentItem(), 0);
            }
            View currentTab = PagerSlidingTabStrip.this.mTabsContainer.getChildAt(PagerSlidingTabStrip.this.mPager.getCurrentItem());
            PagerSlidingTabStrip.this.select(currentTab);
            if (PagerSlidingTabStrip.this.mPager.getCurrentItem() - PagerSlidingTabStrip.PADDING_INDEX >= 0) {
                View prevTab = PagerSlidingTabStrip.this.mTabsContainer.getChildAt(PagerSlidingTabStrip.this.mPager.getCurrentItem() - PagerSlidingTabStrip.PADDING_INDEX);
                PagerSlidingTabStrip.this.unSelect(prevTab);
            }
            if (PagerSlidingTabStrip.this.mPager.getCurrentItem() + PagerSlidingTabStrip.PADDING_INDEX <= PagerSlidingTabStrip.this.mPager.getAdapter().getCount() - PagerSlidingTabStrip.PADDING_INDEX) {
                View nextTab = PagerSlidingTabStrip.this.mTabsContainer.getChildAt(PagerSlidingTabStrip.this.mPager.getCurrentItem() + PagerSlidingTabStrip.PADDING_INDEX);
                PagerSlidingTabStrip.this.unSelect(nextTab);
            }
            if (PagerSlidingTabStrip.this.mDelegatePageListener != null) {
                PagerSlidingTabStrip.this.mDelegatePageListener.onPageScrollStateChanged(state);
            }
        }

        public void onPageSelected(int position) {
            PagerSlidingTabStrip.this.updateSelection(position);
            if (PagerSlidingTabStrip.this.mDelegatePageListener != null) {
                PagerSlidingTabStrip.this.mDelegatePageListener.onPageSelected(position);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateSelection(int position) {
        int i = 0;
        while (i < this.mTabCount) {
            View tv = this.mTabsContainer.getChildAt(i);
            boolean selected = i == position;
            if (selected) {
                select(tv);
            } else {
                unSelect(tv);
            }
            i += PADDING_INDEX;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void unSelect(View tab) {
        if (tab != null) {
            TextView tab_title = (TextView) tab.findViewById(com.astuetz.pagerslidingtabstrip.R.id.psts_tab_title);
            if (tab_title != null) {
                tab_title.setSelected(false);
            }
            if (this.isCustomTabs) {
                this.mPager.getAdapter().tabUnselected(tab);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void select(View tab) {
        if (tab != null) {
            TextView tab_title = (TextView) tab.findViewById(com.astuetz.pagerslidingtabstrip.R.id.psts_tab_title);
            if (tab_title != null) {
                tab_title.setSelected(true);
            }
            if (this.isCustomTabs) {
                this.mPager.getAdapter().tabSelected(tab);
            }
        }
    }

    /* loaded from: com.jpardogo.materialtabstrip.library.1.1.0.jar:com/astuetz/PagerSlidingTabStrip$PagerAdapterObserver.class */
    private class PagerAdapterObserver extends DataSetObserver {
        private boolean attached;

        private PagerAdapterObserver() {
            this.attached = false;
        }

        @Override // android.database.DataSetObserver
        public void onChanged() {
            PagerSlidingTabStrip.this.notifyDataSetChanged();
        }

        public void setAttached(boolean attached) {
            this.attached = attached;
        }

        public boolean isAttached() {
            return this.attached;
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.mPager != null && !this.mAdapterObserver.isAttached()) {
            this.mPager.getAdapter().registerDataSetObserver(this.mAdapterObserver);
            this.mAdapterObserver.setAttached(true);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.mPager != null && this.mAdapterObserver.isAttached()) {
            this.mPager.getAdapter().unregisterDataSetObserver(this.mAdapterObserver);
            this.mAdapterObserver.setAttached(false);
        }
    }

    @Override // android.widget.HorizontalScrollView, android.view.View
    public void onRestoreInstanceState(Parcelable state) {
        SavedState savedState = (SavedState) state;
        super.onRestoreInstanceState(savedState.getSuperState());
        this.mCurrentPosition = savedState.currentPosition;
        if (this.mCurrentPosition != 0 && this.mTabsContainer.getChildCount() > 0) {
            unSelect(this.mTabsContainer.getChildAt(0));
            select(this.mTabsContainer.getChildAt(this.mCurrentPosition));
        }
        requestLayout();
    }

    @Override // android.widget.HorizontalScrollView, android.view.View
    public Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        SavedState savedState = new SavedState(superState);
        savedState.currentPosition = this.mCurrentPosition;
        return savedState;
    }

    /* loaded from: com.jpardogo.materialtabstrip.library.1.1.0.jar:com/astuetz/PagerSlidingTabStrip$SavedState.class */
    static class SavedState extends View.BaseSavedState {
        int currentPosition;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.astuetz.PagerSlidingTabStrip.SavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState[] newArray(int size) {
                return new SavedState[size];
            }
        };

        public SavedState(Parcelable superState) {
            super(superState);
        }

        private SavedState(Parcel in) {
            super(in);
            this.currentPosition = in.readInt();
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            super.writeToParcel(dest, flags);
            dest.writeInt(this.currentPosition);
        }
    }

    public int getIndicatorColor() {
        return this.mIndicatorColor;
    }

    public int getIndicatorHeight() {
        return this.mIndicatorHeight;
    }

    public int getUnderlineColor() {
        return this.mUnderlineColor;
    }

    public int getDividerColor() {
        return this.mDividerColor;
    }

    public int getDividerWidth() {
        return this.mDividerWidth;
    }

    public int getUnderlineHeight() {
        return this.mUnderlineHeight;
    }

    public int getDividerPadding() {
        return this.mDividerPadding;
    }

    public int getScrollOffset() {
        return this.mScrollOffset;
    }

    public boolean getShouldExpand() {
        return this.isExpandTabs;
    }

    public int getTextSize() {
        return this.mTabTextSize;
    }

    public boolean isTextAllCaps() {
        return this.isTabTextAllCaps;
    }

    public ColorStateList getTextColor() {
        return this.mTabTextColor;
    }

    public int getTabBackground() {
        return this.mTabBackgroundResId;
    }

    public int getTabPaddingLeftRight() {
        return this.mTabPadding;
    }

    public void setIndicatorColor(int indicatorColor) {
        this.mIndicatorColor = indicatorColor;
        invalidate();
    }

    public void setIndicatorColorResource(int resId) {
        this.mIndicatorColor = getResources().getColor(resId);
        invalidate();
    }

    public void setIndicatorHeight(int indicatorLineHeightPx) {
        this.mIndicatorHeight = indicatorLineHeightPx;
        invalidate();
    }

    public void setUnderlineColor(int underlineColor) {
        this.mUnderlineColor = underlineColor;
        invalidate();
    }

    public void setUnderlineColorResource(int resId) {
        this.mUnderlineColor = getResources().getColor(resId);
        invalidate();
    }

    public void setDividerColor(int dividerColor) {
        this.mDividerColor = dividerColor;
        invalidate();
    }

    public void setDividerColorResource(int resId) {
        this.mDividerColor = getResources().getColor(resId);
        invalidate();
    }

    public void setDividerWidth(int dividerWidthPx) {
        this.mDividerWidth = dividerWidthPx;
        invalidate();
    }

    public void setUnderlineHeight(int underlineHeightPx) {
        this.mUnderlineHeight = underlineHeightPx;
        invalidate();
    }

    public void setDividerPadding(int dividerPaddingPx) {
        this.mDividerPadding = dividerPaddingPx;
        invalidate();
    }

    public void setScrollOffset(int scrollOffsetPx) {
        this.mScrollOffset = scrollOffsetPx;
        invalidate();
    }

    public void setShouldExpand(boolean shouldExpand) {
        this.isExpandTabs = shouldExpand;
        if (this.mPager != null) {
            requestLayout();
        }
    }

    public void setAllCaps(boolean textAllCaps) {
        this.isTabTextAllCaps = textAllCaps;
    }

    public void setTextSize(int textSizePx) {
        this.mTabTextSize = textSizePx;
        updateTabStyles();
    }

    public void setTextColorResource(int resId) {
        setTextColor(getResources().getColor(resId));
    }

    public void setTextColor(int textColor) {
        setTextColor(createColorStateList(textColor));
    }

    public void setTextColorStateListResource(int resId) {
        setTextColor(getResources().getColorStateList(resId));
    }

    public void setTextColor(ColorStateList colorStateList) {
        this.mTabTextColor = colorStateList;
        updateTabStyles();
    }

    /* JADX WARN: Type inference failed for: r2v1, types: [int[], int[][]] */
    private ColorStateList createColorStateList(int color_state_default) {
        return new ColorStateList(new int[]{new int[0]}, new int[]{color_state_default});
    }

    /* JADX WARN: Type inference failed for: r2v1, types: [int[], int[][]] */
    private ColorStateList createColorStateList(int color_state_pressed, int color_state_selected, int color_state_default) {
        return new ColorStateList(new int[]{new int[]{R.attr.state_pressed}, new int[]{R.attr.state_selected}, new int[0]}, new int[]{color_state_pressed, color_state_selected, color_state_default});
    }

    public void setTypeface(Typeface typeface, int style) {
        this.mTabTextTypeface = typeface;
        this.mTabTextTypefaceStyle = style;
        updateTabStyles();
    }

    public void setTabBackground(int resId) {
        this.mTabBackgroundResId = resId;
    }

    public void setTabPaddingLeftRight(int paddingPx) {
        this.mTabPadding = paddingPx;
        updateTabStyles();
    }
}
