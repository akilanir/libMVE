package com.afollestad.materialdialogs.internal;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.os.Build;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.webkit.WebView;
import android.widget.AdapterView;
import android.widget.ScrollView;
import com.afollestad.materialdialogs.GravityEnum;
import com.afollestad.materialdialogs.MaterialDialog;
import com.afollestad.materialdialogs.R;
import com.afollestad.materialdialogs.util.DialogUtils;

/* loaded from: com.afollestad.material-dialogs.core.0.8.5.1.jar:com/afollestad/materialdialogs/internal/MDRootLayout.class */
public class MDRootLayout extends ViewGroup {
    private View mTitleBar;
    private View mContent;
    private static final int INDEX_NEUTRAL = 0;
    private static final int INDEX_NEGATIVE = 1;
    private static final int INDEX_POSITIVE = 2;
    private boolean mDrawTopDivider;
    private boolean mDrawBottomDivider;
    private final MDButton[] mButtons;
    private boolean mForceStack;
    private boolean mIsStacked;
    private boolean mUseFullPadding;
    private boolean mReducePaddingNoTitleNoButtons;
    private boolean mNoTitleNoPadding;
    private int mNoTitlePaddingFull;
    private int mButtonPaddingFull;
    private int mButtonBarHeight;
    private GravityEnum mButtonGravity;
    private int mButtonHorizontalEdgeMargin;
    private Paint mDividerPaint;
    private ViewTreeObserver.OnScrollChangedListener mTopOnScrollChangedListener;
    private ViewTreeObserver.OnScrollChangedListener mBottomOnScrollChangedListener;
    private int mDividerWidth;

    public MDRootLayout(Context context) {
        super(context);
        this.mDrawTopDivider = false;
        this.mDrawBottomDivider = false;
        this.mButtons = new MDButton[3];
        this.mForceStack = false;
        this.mIsStacked = false;
        this.mUseFullPadding = true;
        this.mButtonGravity = GravityEnum.START;
        init(context, null, 0);
    }

    public MDRootLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mDrawTopDivider = false;
        this.mDrawBottomDivider = false;
        this.mButtons = new MDButton[3];
        this.mForceStack = false;
        this.mIsStacked = false;
        this.mUseFullPadding = true;
        this.mButtonGravity = GravityEnum.START;
        init(context, attrs, 0);
    }

    @TargetApi(11)
    public MDRootLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mDrawTopDivider = false;
        this.mDrawBottomDivider = false;
        this.mButtons = new MDButton[3];
        this.mForceStack = false;
        this.mIsStacked = false;
        this.mUseFullPadding = true;
        this.mButtonGravity = GravityEnum.START;
        init(context, attrs, defStyleAttr);
    }

    @TargetApi(21)
    public MDRootLayout(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mDrawTopDivider = false;
        this.mDrawBottomDivider = false;
        this.mButtons = new MDButton[3];
        this.mForceStack = false;
        this.mIsStacked = false;
        this.mUseFullPadding = true;
        this.mButtonGravity = GravityEnum.START;
        init(context, attrs, defStyleAttr);
    }

    private void init(Context context, AttributeSet attrs, int defStyleAttr) {
        Resources r = context.getResources();
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.MDRootLayout, defStyleAttr, 0);
        this.mReducePaddingNoTitleNoButtons = a.getBoolean(R.styleable.MDRootLayout_md_reduce_padding_no_title_no_buttons, true);
        a.recycle();
        this.mNoTitlePaddingFull = r.getDimensionPixelSize(R.dimen.md_notitle_vertical_padding);
        this.mButtonPaddingFull = r.getDimensionPixelSize(R.dimen.md_button_frame_vertical_padding);
        this.mButtonHorizontalEdgeMargin = r.getDimensionPixelSize(R.dimen.md_button_padding_frame_side);
        this.mButtonBarHeight = r.getDimensionPixelSize(R.dimen.md_button_height);
        this.mDividerPaint = new Paint();
        this.mDividerWidth = r.getDimensionPixelSize(R.dimen.md_divider_height);
        this.mDividerPaint.setColor(DialogUtils.resolveColor(context, R.attr.md_divider_color));
        setWillNotDraw(false);
    }

    public void noTitleNoPadding() {
        this.mNoTitleNoPadding = true;
    }

    @Override // android.view.View
    public void onFinishInflate() {
        super.onFinishInflate();
        for (int i = 0; i < getChildCount(); i++) {
            View v = getChildAt(i);
            if (v.getId() == R.id.titleFrame) {
                this.mTitleBar = v;
            } else if (v.getId() == R.id.buttonDefaultNeutral) {
                this.mButtons[0] = (MDButton) v;
            } else if (v.getId() == R.id.buttonDefaultNegative) {
                this.mButtons[1] = (MDButton) v;
            } else if (v.getId() == R.id.buttonDefaultPositive) {
                this.mButtons[INDEX_POSITIVE] = (MDButton) v;
            } else {
                this.mContent = v;
            }
        }
    }

    @Override // android.view.View
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        boolean stacked;
        int fullPadding;
        int width = View.MeasureSpec.getSize(widthMeasureSpec);
        int height = View.MeasureSpec.getSize(heightMeasureSpec);
        this.mUseFullPadding = true;
        boolean hasButtons = false;
        if (!this.mForceStack) {
            int buttonsWidth = 0;
            MDButton[] arr$ = this.mButtons;
            for (MDButton button : arr$) {
                if (button != null && isVisible(button)) {
                    button.setStacked(false, false);
                    measureChild(button, widthMeasureSpec, heightMeasureSpec);
                    buttonsWidth += button.getMeasuredWidth();
                    hasButtons = true;
                }
            }
            int buttonBarPadding = getContext().getResources().getDimensionPixelSize(R.dimen.md_neutral_button_margin);
            int buttonFrameWidth = width - (INDEX_POSITIVE * buttonBarPadding);
            stacked = buttonsWidth > buttonFrameWidth;
        } else {
            stacked = true;
        }
        int stackedHeight = 0;
        this.mIsStacked = stacked;
        if (stacked) {
            MDButton[] arr$2 = this.mButtons;
            for (MDButton button2 : arr$2) {
                if (button2 != null && isVisible(button2)) {
                    button2.setStacked(true, false);
                    measureChild(button2, widthMeasureSpec, heightMeasureSpec);
                    stackedHeight += button2.getMeasuredHeight();
                    hasButtons = true;
                }
            }
        }
        int availableHeight = height;
        int minPadding = 0;
        if (hasButtons) {
            if (this.mIsStacked) {
                availableHeight -= stackedHeight;
                fullPadding = 0 + (INDEX_POSITIVE * this.mButtonPaddingFull);
                minPadding = 0 + (INDEX_POSITIVE * this.mButtonPaddingFull);
            } else {
                availableHeight -= this.mButtonBarHeight;
                fullPadding = 0 + (INDEX_POSITIVE * this.mButtonPaddingFull);
            }
        } else {
            fullPadding = 0 + (INDEX_POSITIVE * this.mButtonPaddingFull);
        }
        if (isVisible(this.mTitleBar)) {
            this.mTitleBar.measure(View.MeasureSpec.makeMeasureSpec(width, 1073741824), 0);
            availableHeight -= this.mTitleBar.getMeasuredHeight();
        } else if (!this.mNoTitleNoPadding) {
            fullPadding += this.mNoTitlePaddingFull;
        }
        if (isVisible(this.mContent)) {
            this.mContent.measure(View.MeasureSpec.makeMeasureSpec(width, 1073741824), View.MeasureSpec.makeMeasureSpec(availableHeight - minPadding, Integer.MIN_VALUE));
            if (this.mContent.getMeasuredHeight() <= availableHeight - fullPadding) {
                if (!this.mReducePaddingNoTitleNoButtons || isVisible(this.mTitleBar) || hasButtons) {
                    this.mUseFullPadding = true;
                    availableHeight -= this.mContent.getMeasuredHeight() + fullPadding;
                } else {
                    this.mUseFullPadding = false;
                    availableHeight -= this.mContent.getMeasuredHeight() + minPadding;
                }
            } else {
                this.mUseFullPadding = false;
                availableHeight = 0;
            }
        }
        setMeasuredDimension(width, height - availableHeight);
    }

    private static boolean isVisible(View v) {
        boolean visible = (v == null || v.getVisibility() == 8) ? false : true;
        if (visible && (v instanceof MDButton)) {
            visible = ((MDButton) v).getText().toString().trim().length() > 0;
        }
        return visible;
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.mContent != null) {
            if (this.mDrawTopDivider) {
                int y = this.mContent.getTop();
                canvas.drawRect(0.0f, y - this.mDividerWidth, getMeasuredWidth(), y, this.mDividerPaint);
            }
            if (this.mDrawBottomDivider) {
                int y2 = this.mContent.getBottom();
                canvas.drawRect(0.0f, y2, getMeasuredWidth(), y2 + this.mDividerWidth, this.mDividerPaint);
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        int bl;
        int br;
        int bl2;
        int br2;
        int br3;
        int bl3;
        if (isVisible(this.mTitleBar)) {
            int height = this.mTitleBar.getMeasuredHeight();
            this.mTitleBar.layout(l, t, r, t + height);
            t += height;
        } else if (!this.mNoTitleNoPadding && this.mUseFullPadding) {
            t += this.mNoTitlePaddingFull;
        }
        if (isVisible(this.mContent)) {
            this.mContent.layout(l, t, r, t + this.mContent.getMeasuredHeight());
        }
        if (this.mIsStacked) {
            int b2 = b - this.mButtonPaddingFull;
            MDButton[] arr$ = this.mButtons;
            for (MDButton mButton : arr$) {
                if (isVisible(mButton)) {
                    mButton.layout(l, b2 - mButton.getMeasuredHeight(), r, b2);
                    b2 -= mButton.getMeasuredHeight();
                }
            }
        } else {
            int barBottom = b;
            if (this.mUseFullPadding) {
                barBottom -= this.mButtonPaddingFull;
            }
            int barTop = barBottom - this.mButtonBarHeight;
            int offset = this.mButtonHorizontalEdgeMargin;
            int neutralLeft = -1;
            int neutralRight = -1;
            if (isVisible(this.mButtons[INDEX_POSITIVE])) {
                if (this.mButtonGravity == GravityEnum.END) {
                    bl3 = l + offset;
                    br3 = bl3 + this.mButtons[INDEX_POSITIVE].getMeasuredWidth();
                } else {
                    br3 = r - offset;
                    bl3 = br3 - this.mButtons[INDEX_POSITIVE].getMeasuredWidth();
                    neutralRight = bl3;
                }
                this.mButtons[INDEX_POSITIVE].layout(bl3, barTop, br3, barBottom);
                offset += this.mButtons[INDEX_POSITIVE].getMeasuredWidth();
            }
            if (isVisible(this.mButtons[1])) {
                if (this.mButtonGravity == GravityEnum.END) {
                    bl2 = l + offset;
                    br2 = bl2 + this.mButtons[1].getMeasuredWidth();
                } else if (this.mButtonGravity == GravityEnum.START) {
                    br2 = r - offset;
                    bl2 = br2 - this.mButtons[1].getMeasuredWidth();
                } else {
                    bl2 = l + this.mButtonHorizontalEdgeMargin;
                    br2 = bl2 + this.mButtons[1].getMeasuredWidth();
                    neutralLeft = br2;
                }
                this.mButtons[1].layout(bl2, barTop, br2, barBottom);
            }
            if (isVisible(this.mButtons[0])) {
                if (this.mButtonGravity == GravityEnum.END) {
                    br = r - this.mButtonHorizontalEdgeMargin;
                    bl = br - this.mButtons[0].getMeasuredWidth();
                } else if (this.mButtonGravity == GravityEnum.START) {
                    bl = l + this.mButtonHorizontalEdgeMargin;
                    br = bl + this.mButtons[0].getMeasuredWidth();
                } else {
                    if (neutralLeft == -1 && neutralRight != -1) {
                        neutralLeft = neutralRight - this.mButtons[0].getMeasuredWidth();
                    } else if (neutralRight == -1 && neutralLeft != -1) {
                        neutralRight = neutralLeft + this.mButtons[0].getMeasuredWidth();
                    } else if (neutralRight == -1) {
                        neutralLeft = ((r - l) / INDEX_POSITIVE) - (this.mButtons[0].getMeasuredWidth() / INDEX_POSITIVE);
                        neutralRight = neutralLeft + this.mButtons[0].getMeasuredWidth();
                    }
                    bl = neutralLeft;
                    br = neutralRight;
                }
                this.mButtons[0].layout(bl, barTop, br, barBottom);
            }
        }
        setUpDividersVisibility(this.mContent, true, true);
    }

    public void setForceStack(boolean forceStack) {
        this.mForceStack = forceStack;
        invalidate();
    }

    public void setDividerColor(int color) {
        this.mDividerPaint.setColor(color);
        invalidate();
    }

    public void setButtonGravity(GravityEnum gravity) {
        this.mButtonGravity = gravity;
        invertGravityIfNecessary();
    }

    private void invertGravityIfNecessary() {
        if (Build.VERSION.SDK_INT < 17) {
        }
        Configuration config = getResources().getConfiguration();
        if (config.getLayoutDirection() == 1) {
            switch (AnonymousClass3.$SwitchMap$com$afollestad$materialdialogs$GravityEnum[this.mButtonGravity.ordinal()]) {
                case 1:
                    this.mButtonGravity = GravityEnum.END;
                    break;
                case INDEX_POSITIVE /* 2 */:
                    this.mButtonGravity = GravityEnum.START;
                    break;
            }
        }
    }

    /* renamed from: com.afollestad.materialdialogs.internal.MDRootLayout$3, reason: invalid class name */
    /* loaded from: com.afollestad.material-dialogs.core.0.8.5.1.jar:com/afollestad/materialdialogs/internal/MDRootLayout$3.class */
    static /* synthetic */ class AnonymousClass3 {
        static final /* synthetic */ int[] $SwitchMap$com$afollestad$materialdialogs$GravityEnum = new int[GravityEnum.values().length];

        static {
            try {
                $SwitchMap$com$afollestad$materialdialogs$GravityEnum[GravityEnum.START.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$afollestad$materialdialogs$GravityEnum[GravityEnum.END.ordinal()] = MDRootLayout.INDEX_POSITIVE;
            } catch (NoSuchFieldError e2) {
            }
        }
    }

    public void setButtonStackedGravity(GravityEnum gravity) {
        MDButton[] arr$ = this.mButtons;
        for (MDButton mButton : arr$) {
            if (mButton != null) {
                mButton.setStackedGravity(gravity);
            }
        }
    }

    private void setUpDividersVisibility(final View view, final boolean setForTop, final boolean setForBottom) {
        if (view == null) {
            return;
        }
        if (view instanceof ScrollView) {
            ScrollView sv = (ScrollView) view;
            if (canScrollViewScroll(sv)) {
                addScrollListener(sv, setForTop, setForBottom);
                return;
            }
            if (setForTop) {
                this.mDrawTopDivider = false;
            }
            if (setForBottom) {
                this.mDrawBottomDivider = false;
                return;
            }
            return;
        }
        if (view instanceof AdapterView) {
            AdapterView sv2 = (AdapterView) view;
            if (canAdapterViewScroll(sv2)) {
                addScrollListener(sv2, setForTop, setForBottom);
                return;
            }
            if (setForTop) {
                this.mDrawTopDivider = false;
            }
            if (setForBottom) {
                this.mDrawBottomDivider = false;
                return;
            }
            return;
        }
        if (view instanceof WebView) {
            view.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.afollestad.materialdialogs.internal.MDRootLayout.1
                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    if (view.getMeasuredHeight() != 0) {
                        if (MDRootLayout.canWebViewScroll((WebView) view)) {
                            MDRootLayout.this.addScrollListener((ViewGroup) view, setForTop, setForBottom);
                        } else {
                            if (setForTop) {
                                MDRootLayout.this.mDrawTopDivider = false;
                            }
                            if (setForBottom) {
                                MDRootLayout.this.mDrawBottomDivider = false;
                            }
                        }
                        view.getViewTreeObserver().removeOnPreDrawListener(this);
                        return true;
                    }
                    return true;
                }
            });
            return;
        }
        if (view instanceof RecyclerView) {
            boolean canScroll = canRecyclerViewScroll((RecyclerView) view);
            if (setForTop) {
                this.mDrawTopDivider = canScroll;
            }
            if (setForBottom) {
                this.mDrawBottomDivider = canScroll;
                return;
            }
            return;
        }
        if (view instanceof ViewGroup) {
            View topView = getTopView((ViewGroup) view);
            setUpDividersVisibility(topView, setForTop, setForBottom);
            View bottomView = getBottomView((ViewGroup) view);
            if (bottomView != topView) {
                setUpDividersVisibility(bottomView, false, true);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addScrollListener(final ViewGroup vg, final boolean setForTop, final boolean setForBottom) {
        if ((!setForBottom && this.mTopOnScrollChangedListener == null) || (setForBottom && this.mBottomOnScrollChangedListener == null)) {
            ViewTreeObserver.OnScrollChangedListener onScrollChangedListener = new ViewTreeObserver.OnScrollChangedListener() { // from class: com.afollestad.materialdialogs.internal.MDRootLayout.2
                @Override // android.view.ViewTreeObserver.OnScrollChangedListener
                public void onScrollChanged() {
                    boolean hasButtons = false;
                    MDButton[] arr$ = MDRootLayout.this.mButtons;
                    int len$ = arr$.length;
                    int i$ = 0;
                    while (true) {
                        if (i$ < len$) {
                            MDButton button = arr$[i$];
                            if (button == null || button.getVisibility() == 8) {
                                i$++;
                            } else {
                                hasButtons = true;
                                break;
                            }
                        } else {
                            break;
                        }
                    }
                    if (vg instanceof WebView) {
                        MDRootLayout.this.invalidateDividersForWebView((WebView) vg, setForTop, setForBottom, hasButtons);
                    } else {
                        MDRootLayout.this.invalidateDividersForScrollingView(vg, setForTop, setForBottom, hasButtons);
                    }
                    MDRootLayout.this.invalidate();
                }
            };
            if (!setForBottom) {
                this.mTopOnScrollChangedListener = onScrollChangedListener;
                vg.getViewTreeObserver().addOnScrollChangedListener(this.mTopOnScrollChangedListener);
            } else {
                this.mBottomOnScrollChangedListener = onScrollChangedListener;
                vg.getViewTreeObserver().addOnScrollChangedListener(this.mBottomOnScrollChangedListener);
            }
            onScrollChangedListener.onScrollChanged();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void invalidateDividersForScrollingView(ViewGroup view, boolean setForTop, boolean setForBottom, boolean hasButtons) {
        if (setForTop && view.getChildCount() > 0) {
            this.mDrawTopDivider = (this.mTitleBar == null || this.mTitleBar.getVisibility() == 8 || view.getScrollY() + view.getPaddingTop() <= view.getChildAt(0).getTop()) ? false : true;
        }
        if (setForBottom && view.getChildCount() > 0) {
            this.mDrawBottomDivider = hasButtons && (view.getScrollY() + view.getHeight()) - view.getPaddingBottom() < view.getChildAt(view.getChildCount() - 1).getBottom();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void invalidateDividersForWebView(WebView view, boolean setForTop, boolean setForBottom, boolean hasButtons) {
        if (setForTop) {
            this.mDrawTopDivider = (this.mTitleBar == null || this.mTitleBar.getVisibility() == 8 || view.getScrollY() + view.getPaddingTop() <= 0) ? false : true;
        }
        if (setForBottom) {
            this.mDrawBottomDivider = hasButtons && ((float) ((view.getScrollY() + view.getMeasuredHeight()) - view.getPaddingBottom())) < ((float) view.getContentHeight()) * view.getScale();
        }
    }

    public static boolean canRecyclerViewScroll(RecyclerView view) {
        if (view == null || view.getAdapter() == null || view.getLayoutManager() == null) {
            return false;
        }
        LinearLayoutManager layoutManager = view.getLayoutManager();
        int count = view.getAdapter().getItemCount();
        if (layoutManager instanceof LinearLayoutManager) {
            LinearLayoutManager llm = layoutManager;
            int lastVisible = llm.findLastVisibleItemPosition();
            if (lastVisible == -1) {
                return false;
            }
            boolean lastItemVisible = lastVisible == count - 1;
            return !lastItemVisible || (view.getChildCount() > 0 && view.getChildAt(view.getChildCount() - 1).getBottom() > view.getHeight() - view.getPaddingBottom());
        }
        throw new MaterialDialog.NotImplementedException("Material Dialogs currently only supports LinearLayoutManager. Please report any new layout managers.");
    }

    private static boolean canScrollViewScroll(ScrollView sv) {
        if (sv.getChildCount() == 0) {
            return false;
        }
        int childHeight = sv.getChildAt(0).getMeasuredHeight();
        return (sv.getMeasuredHeight() - sv.getPaddingTop()) - sv.getPaddingBottom() < childHeight;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean canWebViewScroll(WebView view) {
        return ((float) view.getMeasuredHeight()) < ((float) view.getContentHeight()) * view.getScale();
    }

    private static boolean canAdapterViewScroll(AdapterView lv) {
        if (lv.getLastVisiblePosition() == -1) {
            return false;
        }
        boolean firstItemVisible = lv.getFirstVisiblePosition() == 0;
        boolean lastItemVisible = lv.getLastVisiblePosition() == lv.getCount() - 1;
        return !firstItemVisible || !lastItemVisible || lv.getChildCount() <= 0 || lv.getChildAt(0).getTop() < lv.getPaddingTop() || lv.getChildAt(lv.getChildCount() - 1).getBottom() > lv.getHeight() - lv.getPaddingBottom();
    }

    @Nullable
    private static View getBottomView(ViewGroup viewGroup) {
        if (viewGroup == null || viewGroup.getChildCount() == 0) {
            return null;
        }
        View bottomView = null;
        int i = viewGroup.getChildCount() - 1;
        while (true) {
            if (i < 0) {
                break;
            }
            View child = viewGroup.getChildAt(i);
            if (child.getVisibility() != 0 || child.getBottom() != viewGroup.getMeasuredHeight()) {
                i--;
            } else {
                bottomView = child;
                break;
            }
        }
        return bottomView;
    }

    @Nullable
    private static View getTopView(ViewGroup viewGroup) {
        if (viewGroup == null || viewGroup.getChildCount() == 0) {
            return null;
        }
        View topView = null;
        int i = viewGroup.getChildCount() - 1;
        while (true) {
            if (i < 0) {
                break;
            }
            View child = viewGroup.getChildAt(i);
            if (child.getVisibility() != 0 || child.getTop() != 0) {
                i--;
            } else {
                topView = child;
                break;
            }
        }
        return topView;
    }
}
