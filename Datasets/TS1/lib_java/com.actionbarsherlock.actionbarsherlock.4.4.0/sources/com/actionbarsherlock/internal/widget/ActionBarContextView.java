package com.actionbarsherlock.internal.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.DecelerateInterpolator;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.actionbarsherlock.R;
import com.actionbarsherlock.internal.nineoldandroids.animation.Animator;
import com.actionbarsherlock.internal.nineoldandroids.animation.AnimatorSet;
import com.actionbarsherlock.internal.nineoldandroids.animation.ObjectAnimator;
import com.actionbarsherlock.internal.nineoldandroids.view.animation.AnimatorProxy;
import com.actionbarsherlock.internal.nineoldandroids.widget.NineLinearLayout;
import com.actionbarsherlock.internal.view.menu.ActionMenuPresenter;
import com.actionbarsherlock.internal.view.menu.ActionMenuView;
import com.actionbarsherlock.internal.view.menu.MenuBuilder;
import com.actionbarsherlock.view.ActionMode;
import com.actionbarsherlock.widget.ActivityChooserView;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/ActionBarContextView.class */
public class ActionBarContextView extends AbsActionBarView implements Animator.AnimatorListener {
    private CharSequence mTitle;
    private CharSequence mSubtitle;
    private NineLinearLayout mClose;
    private View mCustomView;
    private LinearLayout mTitleLayout;
    private TextView mTitleView;
    private TextView mSubtitleView;
    private int mTitleStyleRes;
    private int mSubtitleStyleRes;
    private Drawable mSplitBackground;
    private Animator mCurrentAnimation;
    private boolean mAnimateInOnLayout;
    private int mAnimationMode;
    private static final int ANIMATE_IDLE = 0;
    private static final int ANIMATE_IN = 1;
    private static final int ANIMATE_OUT = 2;

    public ActionBarContextView(Context context) {
        this(context, null);
    }

    public ActionBarContextView(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.actionModeStyle);
    }

    public ActionBarContextView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.SherlockActionMode, defStyle, 0);
        setBackgroundDrawable(a.getDrawable(0));
        this.mTitleStyleRes = a.getResourceId(4, 0);
        this.mSubtitleStyleRes = a.getResourceId(3, 0);
        this.mContentHeight = a.getLayoutDimension(2, 0);
        this.mSplitBackground = a.getDrawable(1);
        a.recycle();
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.mActionMenuPresenter != null) {
            this.mActionMenuPresenter.hideOverflowMenu();
            this.mActionMenuPresenter.hideSubMenus();
        }
    }

    @Override // com.actionbarsherlock.internal.widget.AbsActionBarView
    public void setSplitActionBar(boolean split) {
        if (this.mSplitActionBar != split) {
            if (this.mActionMenuPresenter != null) {
                ViewGroup.LayoutParams layoutParams = new ViewGroup.LayoutParams(-2, -1);
                if (!split) {
                    this.mMenuView = (ActionMenuView) this.mActionMenuPresenter.getMenuView(this);
                    this.mMenuView.setBackgroundDrawable(null);
                    ViewGroup oldParent = (ViewGroup) this.mMenuView.getParent();
                    if (oldParent != null) {
                        oldParent.removeView(this.mMenuView);
                    }
                    addView(this.mMenuView, layoutParams);
                } else {
                    this.mActionMenuPresenter.setWidthLimit(getContext().getResources().getDisplayMetrics().widthPixels, true);
                    this.mActionMenuPresenter.setItemLimit(ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED);
                    layoutParams.width = -1;
                    layoutParams.height = this.mContentHeight;
                    this.mMenuView = (ActionMenuView) this.mActionMenuPresenter.getMenuView(this);
                    this.mMenuView.setBackgroundDrawable(this.mSplitBackground);
                    ViewGroup oldParent2 = (ViewGroup) this.mMenuView.getParent();
                    if (oldParent2 != null) {
                        oldParent2.removeView(this.mMenuView);
                    }
                    this.mSplitView.addView(this.mMenuView, layoutParams);
                }
            }
            super.setSplitActionBar(split);
        }
    }

    @Override // com.actionbarsherlock.internal.widget.AbsActionBarView
    public void setContentHeight(int height) {
        this.mContentHeight = height;
    }

    public void setCustomView(View view) {
        if (this.mCustomView != null) {
            removeView(this.mCustomView);
        }
        this.mCustomView = view;
        if (this.mTitleLayout != null) {
            removeView(this.mTitleLayout);
            this.mTitleLayout = null;
        }
        if (view != null) {
            addView(view);
        }
        requestLayout();
    }

    public void setTitle(CharSequence title) {
        this.mTitle = title;
        initTitle();
    }

    public void setSubtitle(CharSequence subtitle) {
        this.mSubtitle = subtitle;
        initTitle();
    }

    public CharSequence getTitle() {
        return this.mTitle;
    }

    public CharSequence getSubtitle() {
        return this.mSubtitle;
    }

    private void initTitle() {
        if (this.mTitleLayout == null) {
            LayoutInflater inflater = LayoutInflater.from(getContext());
            inflater.inflate(R.layout.abs__action_bar_title_item, this);
            this.mTitleLayout = (LinearLayout) getChildAt(getChildCount() - 1);
            this.mTitleView = (TextView) this.mTitleLayout.findViewById(R.id.abs__action_bar_title);
            this.mSubtitleView = (TextView) this.mTitleLayout.findViewById(R.id.abs__action_bar_subtitle);
            if (this.mTitleStyleRes != 0) {
                this.mTitleView.setTextAppearance(this.mContext, this.mTitleStyleRes);
            }
            if (this.mSubtitleStyleRes != 0) {
                this.mSubtitleView.setTextAppearance(this.mContext, this.mSubtitleStyleRes);
            }
        }
        this.mTitleView.setText(this.mTitle);
        this.mSubtitleView.setText(this.mSubtitle);
        boolean hasTitle = !TextUtils.isEmpty(this.mTitle);
        boolean hasSubtitle = !TextUtils.isEmpty(this.mSubtitle);
        this.mSubtitleView.setVisibility(hasSubtitle ? 0 : 8);
        this.mTitleLayout.setVisibility((hasTitle || hasSubtitle) ? 0 : 8);
        if (this.mTitleLayout.getParent() == null) {
            addView(this.mTitleLayout);
        }
    }

    public void initForMode(final ActionMode mode) {
        if (this.mClose == null) {
            LayoutInflater inflater = LayoutInflater.from(this.mContext);
            this.mClose = (NineLinearLayout) inflater.inflate(R.layout.abs__action_mode_close_item, (ViewGroup) this, false);
            addView(this.mClose);
        } else if (this.mClose.getParent() == null) {
            addView(this.mClose);
        }
        View closeButton = this.mClose.findViewById(R.id.abs__action_mode_close_button);
        closeButton.setOnClickListener(new View.OnClickListener() { // from class: com.actionbarsherlock.internal.widget.ActionBarContextView.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                mode.finish();
            }
        });
        MenuBuilder menu = (MenuBuilder) mode.getMenu();
        if (this.mActionMenuPresenter != null) {
            this.mActionMenuPresenter.dismissPopupMenus();
        }
        this.mActionMenuPresenter = new ActionMenuPresenter(this.mContext);
        this.mActionMenuPresenter.setReserveOverflow(true);
        ViewGroup.LayoutParams layoutParams = new ViewGroup.LayoutParams(-2, -1);
        if (!this.mSplitActionBar) {
            menu.addMenuPresenter(this.mActionMenuPresenter);
            this.mMenuView = (ActionMenuView) this.mActionMenuPresenter.getMenuView(this);
            this.mMenuView.setBackgroundDrawable(null);
            addView(this.mMenuView, layoutParams);
        } else {
            this.mActionMenuPresenter.setWidthLimit(getContext().getResources().getDisplayMetrics().widthPixels, true);
            this.mActionMenuPresenter.setItemLimit(ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED);
            layoutParams.width = -1;
            layoutParams.height = this.mContentHeight;
            menu.addMenuPresenter(this.mActionMenuPresenter);
            this.mMenuView = (ActionMenuView) this.mActionMenuPresenter.getMenuView(this);
            this.mMenuView.setBackgroundDrawable(this.mSplitBackground);
            this.mSplitView.addView(this.mMenuView, layoutParams);
        }
        this.mAnimateInOnLayout = true;
    }

    public void closeMode() {
        if (this.mAnimationMode == 2) {
            return;
        }
        if (this.mClose == null) {
            killMode();
            return;
        }
        finishAnimation();
        this.mAnimationMode = 2;
        this.mCurrentAnimation = makeOutAnimation();
        this.mCurrentAnimation.start();
    }

    private void finishAnimation() {
        Animator a = this.mCurrentAnimation;
        if (a != null) {
            this.mCurrentAnimation = null;
            a.end();
        }
    }

    public void killMode() {
        finishAnimation();
        removeAllViews();
        if (this.mSplitView != null) {
            this.mSplitView.removeView(this.mMenuView);
        }
        this.mCustomView = null;
        this.mMenuView = null;
        this.mAnimateInOnLayout = false;
    }

    @Override // com.actionbarsherlock.internal.widget.AbsActionBarView
    public boolean showOverflowMenu() {
        if (this.mActionMenuPresenter != null) {
            return this.mActionMenuPresenter.showOverflowMenu();
        }
        return false;
    }

    @Override // com.actionbarsherlock.internal.widget.AbsActionBarView
    public boolean hideOverflowMenu() {
        if (this.mActionMenuPresenter != null) {
            return this.mActionMenuPresenter.hideOverflowMenu();
        }
        return false;
    }

    @Override // com.actionbarsherlock.internal.widget.AbsActionBarView
    public boolean isOverflowMenuShowing() {
        if (this.mActionMenuPresenter != null) {
            return this.mActionMenuPresenter.isOverflowMenuShowing();
        }
        return false;
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new ViewGroup.MarginLayoutParams(-1, -2);
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateLayoutParams(AttributeSet attrs) {
        return new ViewGroup.MarginLayoutParams(getContext(), attrs);
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
        if (widthMode != 1073741824) {
            throw new IllegalStateException(getClass().getSimpleName() + " can only be used with android:layout_width=\"match_parent\" (or fill_parent)");
        }
        int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
        if (heightMode == 0) {
            throw new IllegalStateException(getClass().getSimpleName() + " can only be used with android:layout_height=\"wrap_content\"");
        }
        int contentWidth = View.MeasureSpec.getSize(widthMeasureSpec);
        int maxHeight = this.mContentHeight > 0 ? this.mContentHeight : View.MeasureSpec.getSize(heightMeasureSpec);
        int verticalPadding = getPaddingTop() + getPaddingBottom();
        int availableWidth = (contentWidth - getPaddingLeft()) - getPaddingRight();
        int height = maxHeight - verticalPadding;
        int childSpecHeight = View.MeasureSpec.makeMeasureSpec(height, Integer.MIN_VALUE);
        if (this.mClose != null) {
            int availableWidth2 = measureChildView(this.mClose, availableWidth, childSpecHeight, 0);
            ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) this.mClose.getLayoutParams();
            availableWidth = availableWidth2 - (lp.leftMargin + lp.rightMargin);
        }
        if (this.mMenuView != null && this.mMenuView.getParent() == this) {
            availableWidth = measureChildView(this.mMenuView, availableWidth, childSpecHeight, 0);
        }
        if (this.mTitleLayout != null && this.mCustomView == null) {
            availableWidth = measureChildView(this.mTitleLayout, availableWidth, childSpecHeight, 0);
        }
        if (this.mCustomView != null) {
            ViewGroup.LayoutParams lp2 = this.mCustomView.getLayoutParams();
            int customWidthMode = lp2.width != -2 ? 1073741824 : Integer.MIN_VALUE;
            int customWidth = lp2.width >= 0 ? Math.min(lp2.width, availableWidth) : availableWidth;
            int customHeightMode = lp2.height != -2 ? 1073741824 : Integer.MIN_VALUE;
            int customHeight = lp2.height >= 0 ? Math.min(lp2.height, height) : height;
            this.mCustomView.measure(View.MeasureSpec.makeMeasureSpec(customWidth, customWidthMode), View.MeasureSpec.makeMeasureSpec(customHeight, customHeightMode));
        }
        if (this.mContentHeight <= 0) {
            int measuredHeight = 0;
            int count = getChildCount();
            for (int i = 0; i < count; i++) {
                View v = getChildAt(i);
                int paddedViewHeight = v.getMeasuredHeight() + verticalPadding;
                if (paddedViewHeight > measuredHeight) {
                    measuredHeight = paddedViewHeight;
                }
            }
            setMeasuredDimension(contentWidth, measuredHeight);
            return;
        }
        setMeasuredDimension(contentWidth, maxHeight);
    }

    private Animator makeInAnimation() {
        int count;
        this.mClose.setTranslationX((-this.mClose.getWidth()) - ((ViewGroup.MarginLayoutParams) this.mClose.getLayoutParams()).leftMargin);
        ObjectAnimator buttonAnimator = ObjectAnimator.ofFloat(this.mClose, "translationX", 0.0f);
        buttonAnimator.setDuration(200L);
        buttonAnimator.addListener(this);
        buttonAnimator.setInterpolator(new DecelerateInterpolator());
        AnimatorSet set = new AnimatorSet();
        AnimatorSet.Builder b = set.play(buttonAnimator);
        if (this.mMenuView != null && (count = this.mMenuView.getChildCount()) > 0) {
            int i = count - 1;
            int j = 0;
            while (i >= 0) {
                AnimatorProxy child = AnimatorProxy.wrap(this.mMenuView.getChildAt(i));
                child.setScaleY(0.0f);
                ObjectAnimator a = ObjectAnimator.ofFloat(child, "scaleY", 0.0f, 1.0f);
                a.setDuration(100L);
                a.setStartDelay(j * 70);
                b.with(a);
                i--;
                j++;
            }
        }
        return set;
    }

    private Animator makeOutAnimation() {
        ObjectAnimator buttonAnimator = ObjectAnimator.ofFloat(this.mClose, "translationX", (-this.mClose.getWidth()) - ((ViewGroup.MarginLayoutParams) this.mClose.getLayoutParams()).leftMargin);
        buttonAnimator.setDuration(200L);
        buttonAnimator.addListener(this);
        buttonAnimator.setInterpolator(new DecelerateInterpolator());
        AnimatorSet set = new AnimatorSet();
        AnimatorSet.Builder b = set.play(buttonAnimator);
        if (this.mMenuView != null) {
            int count = this.mMenuView.getChildCount();
            if (count > 0) {
                for (int i = 0; i < 0; i++) {
                    AnimatorProxy child = AnimatorProxy.wrap(this.mMenuView.getChildAt(i));
                    child.setScaleY(0.0f);
                    ObjectAnimator a = ObjectAnimator.ofFloat(child, "scaleY", 0.0f);
                    a.setDuration(100L);
                    a.setStartDelay(i * 70);
                    b.with(a);
                }
            }
        }
        return set;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        int x = getPaddingLeft();
        int y = getPaddingTop();
        int contentHeight = ((b - t) - getPaddingTop()) - getPaddingBottom();
        if (this.mClose != null && this.mClose.getVisibility() != 8) {
            ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) this.mClose.getLayoutParams();
            int x2 = x + lp.leftMargin;
            x = x2 + positionChild(this.mClose, x2, y, contentHeight) + lp.rightMargin;
            if (this.mAnimateInOnLayout) {
                this.mAnimationMode = 1;
                this.mCurrentAnimation = makeInAnimation();
                this.mCurrentAnimation.start();
                this.mAnimateInOnLayout = false;
            }
        }
        if (this.mTitleLayout != null && this.mCustomView == null) {
            x += positionChild(this.mTitleLayout, x, y, contentHeight);
        }
        if (this.mCustomView != null) {
            int positionChild = x + positionChild(this.mCustomView, x, y, contentHeight);
        }
        int x3 = (r - l) - getPaddingRight();
        if (this.mMenuView != null) {
            int positionChildInverse = x3 - positionChildInverse(this.mMenuView, x3, y, contentHeight);
        }
    }

    @Override // com.actionbarsherlock.internal.nineoldandroids.animation.Animator.AnimatorListener
    public void onAnimationStart(Animator animation) {
    }

    @Override // com.actionbarsherlock.internal.nineoldandroids.animation.Animator.AnimatorListener
    public void onAnimationEnd(Animator animation) {
        if (this.mAnimationMode == 2) {
            killMode();
        }
        this.mAnimationMode = 0;
    }

    @Override // com.actionbarsherlock.internal.nineoldandroids.animation.Animator.AnimatorListener
    public void onAnimationCancel(Animator animation) {
    }

    @Override // com.actionbarsherlock.internal.nineoldandroids.animation.Animator.AnimatorListener
    public void onAnimationRepeat(Animator animation) {
    }

    @Override // android.view.ViewGroup
    public boolean shouldDelayChildPressedState() {
        return false;
    }

    @Override // android.view.View
    public void onInitializeAccessibilityEvent(AccessibilityEvent event) {
        if (event.getEventType() == 32) {
            event.setClassName(getClass().getName());
            event.setPackageName(getContext().getPackageName());
            event.setContentDescription(this.mTitle);
        }
    }
}
