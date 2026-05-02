package com.astuetz;

import android.R;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.v4.util.Pair;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.Locale;

/* loaded from: com.jpardogo.materialtabstrip.library.1.0.6.jar:com/astuetz/PagerSlidingTabStrip.class */
public class PagerSlidingTabStrip extends HorizontalScrollView {
    private static final float OPAQUE = 1.0f;
    private static final float HALF_TRANSP = 0.5f;
    private static final int[] ATTRS = {R.attr.textSize, R.attr.textColor, R.attr.paddingLeft, R.attr.paddingRight, R.attr.textColorPrimary};
    private final PagerAdapterObserver adapterObserver;
    private static final int TEXT_SIZE_INDEX = 0;
    private static final int TEXT_COLOR_INDEX = 1;
    private static final int PADDING_LEFT_INDEX = 2;
    private static final int PADDING_RIGHT_INDEX = 3;
    private static final int TEXT_COLOR_PRIMARY = 4;
    private LinearLayout.LayoutParams defaultTabLayoutParams;
    private LinearLayout.LayoutParams expandedTabLayoutParams;
    private final PageListener pageListener;
    public ViewPager.OnPageChangeListener delegatePageListener;
    private LinearLayout tabsContainer;
    private ViewPager pager;
    private int tabCount;
    private int currentPosition;
    private float currentPositionOffset;
    private Paint rectPaint;
    private Paint dividerPaint;
    private int indicatorColor;
    private int indicatorHeight;
    private int underlineHeight;
    private int underlineColor;
    private int dividerWidth;
    private int dividerPadding;
    private int dividerColor;
    private int tabPadding;
    private int tabTextSize;
    private ColorStateList tabTextColor;
    private float tabTextAlpha;
    private float tabTextSelectedAlpha;
    private int paddingLeft;
    private int paddingRight;
    private boolean shouldExpand;
    private boolean textAllCaps;
    private boolean isPaddingMiddle;
    private Typeface tabTypeface;
    private int tabTypefaceStyle;
    private int tabTypefaceSelectedStyle;
    private int scrollOffset;
    private int lastScrollX;
    private int tabBackgroundResId;
    private Locale locale;
    private ViewTreeObserver.OnGlobalLayoutListener firstTabGlobalLayoutListener;

    /* loaded from: com.jpardogo.materialtabstrip.library.1.0.6.jar:com/astuetz/PagerSlidingTabStrip$CustomTabProvider.class */
    public interface CustomTabProvider {
        View getCustomTabView(ViewGroup viewGroup, int i);
    }

    public PagerSlidingTabStrip(Context context) {
        this(context, null);
    }

    public PagerSlidingTabStrip(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public PagerSlidingTabStrip(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.adapterObserver = new PagerAdapterObserver();
        this.pageListener = new PageListener();
        this.currentPosition = 0;
        this.currentPositionOffset = 0.0f;
        this.indicatorHeight = PADDING_LEFT_INDEX;
        this.underlineHeight = 0;
        this.dividerWidth = 0;
        this.dividerPadding = 0;
        this.tabPadding = 12;
        this.tabTextSize = 14;
        this.tabTextColor = null;
        this.tabTextAlpha = HALF_TRANSP;
        this.tabTextSelectedAlpha = OPAQUE;
        this.paddingLeft = 0;
        this.paddingRight = 0;
        this.shouldExpand = false;
        this.textAllCaps = true;
        this.isPaddingMiddle = false;
        this.tabTypeface = null;
        this.tabTypefaceStyle = TEXT_COLOR_INDEX;
        this.tabTypefaceSelectedStyle = TEXT_COLOR_INDEX;
        this.lastScrollX = 0;
        this.tabBackgroundResId = com.astuetz.pagerslidingtabstrip.R.drawable.background_tab;
        this.firstTabGlobalLayoutListener = new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.astuetz.PagerSlidingTabStrip.3
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            public void onGlobalLayout() {
                View view = PagerSlidingTabStrip.this.tabsContainer.getChildAt(0);
                if (Build.VERSION.SDK_INT < 16) {
                    PagerSlidingTabStrip.this.getViewTreeObserver().removeGlobalOnLayoutListener(this);
                } else {
                    PagerSlidingTabStrip.this.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                }
                if (PagerSlidingTabStrip.this.isPaddingMiddle) {
                    int mHalfWidthFirstTab = view.getWidth() / PagerSlidingTabStrip.PADDING_LEFT_INDEX;
                    PagerSlidingTabStrip.this.paddingLeft = PagerSlidingTabStrip.this.paddingRight = (PagerSlidingTabStrip.this.getWidth() / PagerSlidingTabStrip.PADDING_LEFT_INDEX) - mHalfWidthFirstTab;
                }
                PagerSlidingTabStrip.this.setPadding(PagerSlidingTabStrip.this.paddingLeft, PagerSlidingTabStrip.this.getPaddingTop(), PagerSlidingTabStrip.this.paddingRight, PagerSlidingTabStrip.this.getPaddingBottom());
                if (PagerSlidingTabStrip.this.scrollOffset == 0) {
                    PagerSlidingTabStrip.this.scrollOffset = (PagerSlidingTabStrip.this.getWidth() / PagerSlidingTabStrip.PADDING_LEFT_INDEX) - PagerSlidingTabStrip.this.paddingLeft;
                }
            }
        };
        setFillViewport(true);
        setWillNotDraw(false);
        this.tabsContainer = new LinearLayout(context);
        this.tabsContainer.setOrientation(0);
        this.tabsContainer.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        addView(this.tabsContainer);
        DisplayMetrics dm = getResources().getDisplayMetrics();
        this.scrollOffset = (int) TypedValue.applyDimension(TEXT_COLOR_INDEX, this.scrollOffset, dm);
        this.indicatorHeight = (int) TypedValue.applyDimension(TEXT_COLOR_INDEX, this.indicatorHeight, dm);
        this.underlineHeight = (int) TypedValue.applyDimension(TEXT_COLOR_INDEX, this.underlineHeight, dm);
        this.dividerPadding = (int) TypedValue.applyDimension(TEXT_COLOR_INDEX, this.dividerPadding, dm);
        this.tabPadding = (int) TypedValue.applyDimension(TEXT_COLOR_INDEX, this.tabPadding, dm);
        this.dividerWidth = (int) TypedValue.applyDimension(TEXT_COLOR_INDEX, this.dividerWidth, dm);
        this.tabTextSize = (int) TypedValue.applyDimension(PADDING_LEFT_INDEX, this.tabTextSize, dm);
        TypedArray a = context.obtainStyledAttributes(attrs, ATTRS);
        this.tabTextSize = a.getDimensionPixelSize(0, this.tabTextSize);
        ColorStateList colorStateList = a.getColorStateList(TEXT_COLOR_INDEX);
        int textPrimaryColor = a.getColor(TEXT_COLOR_PRIMARY, R.color.white);
        if (colorStateList != null) {
            this.tabTextColor = colorStateList;
        } else {
            this.tabTextColor = getColorStateList(textPrimaryColor);
        }
        this.underlineColor = textPrimaryColor;
        this.dividerColor = textPrimaryColor;
        this.indicatorColor = textPrimaryColor;
        this.paddingLeft = a.getDimensionPixelSize(PADDING_LEFT_INDEX, this.paddingLeft);
        this.paddingRight = a.getDimensionPixelSize(PADDING_RIGHT_INDEX, this.paddingRight);
        a.recycle();
        if (this.paddingRight < this.paddingLeft) {
            this.paddingRight = this.paddingLeft;
        }
        if (this.paddingLeft < this.paddingRight) {
            this.paddingLeft = this.paddingRight;
        }
        TypedArray a2 = context.obtainStyledAttributes(attrs, com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip);
        this.indicatorColor = a2.getColor(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsIndicatorColor, this.indicatorColor);
        this.underlineColor = a2.getColor(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsUnderlineColor, this.underlineColor);
        this.dividerColor = a2.getColor(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsDividerColor, this.dividerColor);
        this.dividerWidth = a2.getDimensionPixelSize(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsDividerWidth, this.dividerWidth);
        this.indicatorHeight = a2.getDimensionPixelSize(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsIndicatorHeight, this.indicatorHeight);
        this.underlineHeight = a2.getDimensionPixelSize(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsUnderlineHeight, this.underlineHeight);
        this.dividerPadding = a2.getDimensionPixelSize(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsDividerPadding, this.dividerPadding);
        this.tabPadding = a2.getDimensionPixelSize(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsTabPaddingLeftRight, this.tabPadding);
        this.tabBackgroundResId = a2.getResourceId(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsTabBackground, this.tabBackgroundResId);
        this.shouldExpand = a2.getBoolean(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsShouldExpand, this.shouldExpand);
        this.scrollOffset = a2.getDimensionPixelSize(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsScrollOffset, this.scrollOffset);
        this.textAllCaps = a2.getBoolean(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsTextAllCaps, this.textAllCaps);
        this.isPaddingMiddle = a2.getBoolean(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsPaddingMiddle, this.isPaddingMiddle);
        this.tabTypefaceStyle = a2.getInt(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsTextStyle, TEXT_COLOR_INDEX);
        this.tabTypefaceSelectedStyle = a2.getInt(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsTextSelectedStyle, TEXT_COLOR_INDEX);
        this.tabTextAlpha = a2.getFloat(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsTextAlpha, HALF_TRANSP);
        this.tabTextSelectedAlpha = a2.getFloat(com.astuetz.pagerslidingtabstrip.R.styleable.PagerSlidingTabStrip_pstsTextSelectedAlpha, OPAQUE);
        a2.recycle();
        this.rectPaint = new Paint();
        this.rectPaint.setAntiAlias(true);
        this.rectPaint.setStyle(Paint.Style.FILL);
        this.dividerPaint = new Paint();
        this.dividerPaint.setAntiAlias(true);
        this.dividerPaint.setStrokeWidth(this.dividerWidth);
        this.defaultTabLayoutParams = new LinearLayout.LayoutParams(-2, -1);
        this.expandedTabLayoutParams = new LinearLayout.LayoutParams(0, -1, OPAQUE);
        if (this.locale == null) {
            this.locale = getResources().getConfiguration().locale;
        }
    }

    public void setViewPager(ViewPager pager) {
        this.pager = pager;
        if (pager.getAdapter() == null) {
            throw new IllegalStateException("ViewPager does not have adapter instance.");
        }
        pager.setOnPageChangeListener(this.pageListener);
        pager.getAdapter().registerDataSetObserver(this.adapterObserver);
        this.adapterObserver.setAttached(true);
        notifyDataSetChanged();
    }

    public void notifyDataSetChanged() {
        View inflate;
        this.tabsContainer.removeAllViews();
        this.tabCount = this.pager.getAdapter().getCount();
        for (int i = 0; i < this.tabCount; i += TEXT_COLOR_INDEX) {
            if (this.pager.getAdapter() instanceof CustomTabProvider) {
                inflate = this.pager.getAdapter().getCustomTabView(this, i);
            } else {
                inflate = LayoutInflater.from(getContext()).inflate(com.astuetz.pagerslidingtabstrip.R.layout.tab, (ViewGroup) this, false);
            }
            View tabView = inflate;
            CharSequence title = this.pager.getAdapter().getPageTitle(i);
            addTab(i, title, tabView);
        }
        updateTabStyles();
        getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.astuetz.PagerSlidingTabStrip.1
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            @SuppressLint({"NewApi"})
            public void onGlobalLayout() {
                if (Build.VERSION.SDK_INT < 16) {
                    PagerSlidingTabStrip.this.getViewTreeObserver().removeGlobalOnLayoutListener(this);
                } else {
                    PagerSlidingTabStrip.this.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                }
                PagerSlidingTabStrip.this.currentPosition = PagerSlidingTabStrip.this.pager.getCurrentItem();
                PagerSlidingTabStrip.this.currentPositionOffset = 0.0f;
                PagerSlidingTabStrip.this.scrollToChild(PagerSlidingTabStrip.this.currentPosition, 0);
                PagerSlidingTabStrip.this.updateSelection(PagerSlidingTabStrip.this.currentPosition);
            }
        });
    }

    private void addTab(final int position, CharSequence title, View tabView) {
        TextView textView = (TextView) tabView.findViewById(com.astuetz.pagerslidingtabstrip.R.id.tab_title);
        if (textView != null) {
            if (title != null) {
                textView.setText(title);
            }
            float alpha = this.pager.getCurrentItem() == position ? this.tabTextSelectedAlpha : this.tabTextAlpha;
            ViewCompat.setAlpha(textView, alpha);
        }
        tabView.setFocusable(true);
        tabView.setOnClickListener(new View.OnClickListener() { // from class: com.astuetz.PagerSlidingTabStrip.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (PagerSlidingTabStrip.this.pager.getCurrentItem() != position) {
                    View tab = PagerSlidingTabStrip.this.tabsContainer.getChildAt(PagerSlidingTabStrip.this.pager.getCurrentItem());
                    PagerSlidingTabStrip.this.notSelected(tab);
                    PagerSlidingTabStrip.this.pager.setCurrentItem(position);
                }
            }
        });
        tabView.setPadding(this.tabPadding, tabView.getPaddingTop(), this.tabPadding, tabView.getPaddingBottom());
        this.tabsContainer.addView(tabView, position, this.shouldExpand ? this.expandedTabLayoutParams : this.defaultTabLayoutParams);
    }

    private void updateTabStyles() {
        int i = 0;
        while (i < this.tabCount) {
            View v = this.tabsContainer.getChildAt(i);
            v.setBackgroundResource(this.tabBackgroundResId);
            TextView tab_title = (TextView) v.findViewById(com.astuetz.pagerslidingtabstrip.R.id.tab_title);
            if (tab_title != null) {
                tab_title.setTextSize(0, this.tabTextSize);
                tab_title.setTypeface(this.tabTypeface, this.pager.getCurrentItem() == i ? this.tabTypefaceSelectedStyle : this.tabTypefaceStyle);
                if (this.tabTextColor != null) {
                    tab_title.setTextColor(this.tabTextColor);
                }
                if (this.textAllCaps) {
                    if (Build.VERSION.SDK_INT >= 14) {
                        tab_title.setAllCaps(true);
                    } else {
                        tab_title.setText(tab_title.getText().toString().toUpperCase(this.locale));
                    }
                }
            }
            i += TEXT_COLOR_INDEX;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void scrollToChild(int position, int offset) {
        if (this.tabCount == 0) {
            return;
        }
        int newScrollX = this.tabsContainer.getChildAt(position).getLeft() + offset;
        if (position > 0 || offset > 0) {
            int newScrollX2 = newScrollX - this.scrollOffset;
            Pair<Float, Float> lines = getIndicatorCoordinates();
            newScrollX = (int) (newScrollX2 + ((((Float) lines.second).floatValue() - ((Float) lines.first).floatValue()) / 2.0f));
        }
        if (newScrollX != this.lastScrollX) {
            this.lastScrollX = newScrollX;
            scrollTo(newScrollX, 0);
        }
    }

    private Pair<Float, Float> getIndicatorCoordinates() {
        View currentTab = this.tabsContainer.getChildAt(this.currentPosition);
        float lineLeft = currentTab.getLeft();
        float lineRight = currentTab.getRight();
        if (this.currentPositionOffset > 0.0f && this.currentPosition < this.tabCount - TEXT_COLOR_INDEX) {
            View nextTab = this.tabsContainer.getChildAt(this.currentPosition + TEXT_COLOR_INDEX);
            float nextTabLeft = nextTab.getLeft();
            float nextTabRight = nextTab.getRight();
            lineLeft = (this.currentPositionOffset * nextTabLeft) + ((OPAQUE - this.currentPositionOffset) * lineLeft);
            lineRight = (this.currentPositionOffset * nextTabRight) + ((OPAQUE - this.currentPositionOffset) * lineRight);
        }
        return new Pair<>(Float.valueOf(lineLeft), Float.valueOf(lineRight));
    }

    @Override // android.widget.HorizontalScrollView, android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        this.tabsContainer.setMinimumWidth(getWidth());
        setClipToPadding(false);
        if (this.tabsContainer.getChildCount() > 0) {
            this.tabsContainer.getChildAt(0).getViewTreeObserver().addOnGlobalLayoutListener(this.firstTabGlobalLayoutListener);
        }
        super.onLayout(changed, l, t, r, b);
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (isInEditMode() || this.tabCount == 0) {
            return;
        }
        int height = getHeight();
        this.rectPaint.setColor(this.indicatorColor);
        Pair<Float, Float> lines = getIndicatorCoordinates();
        canvas.drawRect(((Float) lines.first).floatValue() + this.paddingLeft, height - this.indicatorHeight, ((Float) lines.second).floatValue() + this.paddingRight, height, this.rectPaint);
        this.rectPaint.setColor(this.underlineColor);
        canvas.drawRect(this.paddingLeft, height - this.underlineHeight, this.tabsContainer.getWidth() + this.paddingRight, height, this.rectPaint);
        if (this.dividerWidth != 0) {
            this.dividerPaint.setStrokeWidth(this.dividerWidth);
            this.dividerPaint.setColor(this.dividerColor);
            for (int i = 0; i < this.tabCount - TEXT_COLOR_INDEX; i += TEXT_COLOR_INDEX) {
                View tab = this.tabsContainer.getChildAt(i);
                canvas.drawLine(tab.getRight(), this.dividerPadding, tab.getRight(), height - this.dividerPadding, this.dividerPaint);
            }
        }
    }

    public void setOnPageChangeListener(ViewPager.OnPageChangeListener listener) {
        this.delegatePageListener = listener;
    }

    /* loaded from: com.jpardogo.materialtabstrip.library.1.0.6.jar:com/astuetz/PagerSlidingTabStrip$PageListener.class */
    private class PageListener implements ViewPager.OnPageChangeListener {
        private PageListener() {
        }

        public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            PagerSlidingTabStrip.this.currentPosition = position;
            PagerSlidingTabStrip.this.currentPositionOffset = positionOffset;
            int offset = PagerSlidingTabStrip.this.tabCount > 0 ? (int) (positionOffset * PagerSlidingTabStrip.this.tabsContainer.getChildAt(position).getWidth()) : 0;
            PagerSlidingTabStrip.this.scrollToChild(position, offset);
            PagerSlidingTabStrip.this.invalidate();
            if (PagerSlidingTabStrip.this.delegatePageListener != null) {
                PagerSlidingTabStrip.this.delegatePageListener.onPageScrolled(position, positionOffset, positionOffsetPixels);
            }
        }

        public void onPageScrollStateChanged(int state) {
            if (state == 0) {
                PagerSlidingTabStrip.this.scrollToChild(PagerSlidingTabStrip.this.pager.getCurrentItem(), 0);
            }
            View currentTab = PagerSlidingTabStrip.this.tabsContainer.getChildAt(PagerSlidingTabStrip.this.pager.getCurrentItem());
            PagerSlidingTabStrip.this.selected(currentTab);
            if (PagerSlidingTabStrip.this.pager.getCurrentItem() - PagerSlidingTabStrip.TEXT_COLOR_INDEX >= 0) {
                View prevTab = PagerSlidingTabStrip.this.tabsContainer.getChildAt(PagerSlidingTabStrip.this.pager.getCurrentItem() - PagerSlidingTabStrip.TEXT_COLOR_INDEX);
                PagerSlidingTabStrip.this.notSelected(prevTab);
            }
            if (PagerSlidingTabStrip.this.pager.getCurrentItem() + PagerSlidingTabStrip.TEXT_COLOR_INDEX <= PagerSlidingTabStrip.this.pager.getAdapter().getCount() - PagerSlidingTabStrip.TEXT_COLOR_INDEX) {
                View nextTab = PagerSlidingTabStrip.this.tabsContainer.getChildAt(PagerSlidingTabStrip.this.pager.getCurrentItem() + PagerSlidingTabStrip.TEXT_COLOR_INDEX);
                PagerSlidingTabStrip.this.notSelected(nextTab);
            }
            if (PagerSlidingTabStrip.this.delegatePageListener != null) {
                PagerSlidingTabStrip.this.delegatePageListener.onPageScrollStateChanged(state);
            }
        }

        public void onPageSelected(int position) {
            PagerSlidingTabStrip.this.updateSelection(position);
            if (PagerSlidingTabStrip.this.delegatePageListener != null) {
                PagerSlidingTabStrip.this.delegatePageListener.onPageSelected(position);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateSelection(int position) {
        int i = 0;
        while (i < this.tabCount) {
            View tv = this.tabsContainer.getChildAt(i);
            tv.setSelected(i == position);
            i += TEXT_COLOR_INDEX;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notSelected(View tab) {
        TextView title = (TextView) tab.findViewById(com.astuetz.pagerslidingtabstrip.R.id.tab_title);
        if (title != null) {
            title.setTypeface(this.tabTypeface, this.tabTypefaceStyle);
            ViewCompat.setAlpha(title, this.tabTextAlpha);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void selected(View tab) {
        TextView title = (TextView) tab.findViewById(com.astuetz.pagerslidingtabstrip.R.id.tab_title);
        if (title != null) {
            title.setTypeface(this.tabTypeface, this.tabTypefaceSelectedStyle);
            ViewCompat.setAlpha(title, this.tabTextSelectedAlpha);
        }
    }

    /* loaded from: com.jpardogo.materialtabstrip.library.1.0.6.jar:com/astuetz/PagerSlidingTabStrip$PagerAdapterObserver.class */
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
        if (this.pager != null && !this.adapterObserver.isAttached()) {
            this.pager.getAdapter().registerDataSetObserver(this.adapterObserver);
            this.adapterObserver.setAttached(true);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.pager != null && this.adapterObserver.isAttached()) {
            this.pager.getAdapter().unregisterDataSetObserver(this.adapterObserver);
            this.adapterObserver.setAttached(false);
        }
    }

    @Override // android.widget.HorizontalScrollView, android.view.View
    public void onRestoreInstanceState(Parcelable state) {
        SavedState savedState = (SavedState) state;
        super.onRestoreInstanceState(savedState.getSuperState());
        this.currentPosition = savedState.currentPosition;
        if (this.currentPosition != 0 && this.tabsContainer.getChildCount() > 0) {
            notSelected(this.tabsContainer.getChildAt(0));
            selected(this.tabsContainer.getChildAt(this.currentPosition));
        }
        requestLayout();
    }

    @Override // android.widget.HorizontalScrollView, android.view.View
    public Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        SavedState savedState = new SavedState(superState);
        savedState.currentPosition = this.currentPosition;
        return savedState;
    }

    /* loaded from: com.jpardogo.materialtabstrip.library.1.0.6.jar:com/astuetz/PagerSlidingTabStrip$SavedState.class */
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
        return this.indicatorColor;
    }

    public int getIndicatorHeight() {
        return this.indicatorHeight;
    }

    public int getUnderlineColor() {
        return this.underlineColor;
    }

    public int getDividerColor() {
        return this.dividerColor;
    }

    public int getDividerWidth() {
        return this.dividerWidth;
    }

    public int getUnderlineHeight() {
        return this.underlineHeight;
    }

    public int getDividerPadding() {
        return this.dividerPadding;
    }

    public int getScrollOffset() {
        return this.scrollOffset;
    }

    public boolean getShouldExpand() {
        return this.shouldExpand;
    }

    public int getTextSize() {
        return this.tabTextSize;
    }

    public boolean isTextAllCaps() {
        return this.textAllCaps;
    }

    public ColorStateList getTextColor() {
        return this.tabTextColor;
    }

    public int getTabBackground() {
        return this.tabBackgroundResId;
    }

    public int getTabPaddingLeftRight() {
        return this.tabPadding;
    }

    public void setIndicatorColor(int indicatorColor) {
        this.indicatorColor = indicatorColor;
        invalidate();
    }

    public void setIndicatorColorResource(int resId) {
        this.indicatorColor = getResources().getColor(resId);
        invalidate();
    }

    public void setIndicatorHeight(int indicatorLineHeightPx) {
        this.indicatorHeight = indicatorLineHeightPx;
        invalidate();
    }

    public void setUnderlineColor(int underlineColor) {
        this.underlineColor = underlineColor;
        invalidate();
    }

    public void setUnderlineColorResource(int resId) {
        this.underlineColor = getResources().getColor(resId);
        invalidate();
    }

    public void setDividerColor(int dividerColor) {
        this.dividerColor = dividerColor;
        invalidate();
    }

    public void setDividerColorResource(int resId) {
        this.dividerColor = getResources().getColor(resId);
        invalidate();
    }

    public void setDividerWidth(int dividerWidthPx) {
        this.dividerWidth = dividerWidthPx;
        invalidate();
    }

    public void setUnderlineHeight(int underlineHeightPx) {
        this.underlineHeight = underlineHeightPx;
        invalidate();
    }

    public void setDividerPadding(int dividerPaddingPx) {
        this.dividerPadding = dividerPaddingPx;
        invalidate();
    }

    public void setScrollOffset(int scrollOffsetPx) {
        this.scrollOffset = scrollOffsetPx;
        invalidate();
    }

    public void setShouldExpand(boolean shouldExpand) {
        this.shouldExpand = shouldExpand;
        if (this.pager != null) {
            requestLayout();
        }
    }

    public void setAllCaps(boolean textAllCaps) {
        this.textAllCaps = textAllCaps;
    }

    public void setTextSize(int textSizePx) {
        this.tabTextSize = textSizePx;
        updateTabStyles();
    }

    public void setTextColor(int textColor) {
        setTextColor(getColorStateList(textColor));
    }

    /* JADX WARN: Type inference failed for: r2v1, types: [int[], int[][]] */
    private ColorStateList getColorStateList(int textColor) {
        return new ColorStateList(new int[]{new int[0]}, new int[]{textColor});
    }

    public void setTextColor(ColorStateList colorStateList) {
        this.tabTextColor = colorStateList;
        updateTabStyles();
    }

    public void setTextColorResource(int resId) {
        setTextColor(getResources().getColor(resId));
    }

    public void setTextColorStateListResource(int resId) {
        setTextColor(getResources().getColorStateList(resId));
    }

    public void setTypeface(Typeface typeface, int style) {
        this.tabTypeface = typeface;
        this.tabTypefaceSelectedStyle = style;
        updateTabStyles();
    }

    public void setTabBackground(int resId) {
        this.tabBackgroundResId = resId;
    }

    public void setTabPaddingLeftRight(int paddingPx) {
        this.tabPadding = paddingPx;
        updateTabStyles();
    }
}
