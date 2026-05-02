package com.github.clans.fab;

import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.ContextThemeWrapper;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.view.animation.AnticipateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.OvershootInterpolator;
import android.widget.ImageView;

/* loaded from: com.github.clans.fab.1.5.0.jar:com/github/clans/fab/FloatingActionMenu.class */
public class FloatingActionMenu extends ViewGroup {
    private static final int ANIMATION_DURATION = 300;
    private static final float CLOSED_PLUS_ROTATION = 0.0f;
    private static final float OPENED_PLUS_ROTATION_LEFT = -135.0f;
    private static final float OPENED_PLUS_ROTATION_RIGHT = 135.0f;
    private static final int OPEN_UP = 0;
    private static final int OPEN_DOWN = 1;
    private static final int LABELS_POSITION_LEFT = 0;
    private static final int LABELS_POSITION_RIGHT = 1;
    private AnimatorSet mOpenAnimatorSet;
    private AnimatorSet mCloseAnimatorSet;
    private AnimatorSet mIconToggleSet;
    private int mButtonSpacing;
    private FloatingActionButton mMenuButton;
    private int mMaxButtonWidth;
    private int mLabelsMargin;
    private int mLabelsVerticalOffset;
    private int mButtonsCount;
    private boolean mMenuOpened;
    private Handler mUiHandler;
    private int mLabelsShowAnimation;
    private int mLabelsHideAnimation;
    private int mLabelsPaddingTop;
    private int mLabelsPaddingRight;
    private int mLabelsPaddingBottom;
    private int mLabelsPaddingLeft;
    private int mLabelsTextColor;
    private float mLabelsTextSize;
    private int mLabelsCornerRadius;
    private boolean mLabelsShowShadow;
    private int mLabelsColorNormal;
    private int mLabelsColorPressed;
    private int mLabelsColorRipple;
    private boolean mMenuShowShadow;
    private int mMenuShadowColor;
    private float mMenuShadowRadius;
    private float mMenuShadowXOffset;
    private float mMenuShadowYOffset;
    private int mMenuColorNormal;
    private int mMenuColorPressed;
    private int mMenuColorRipple;
    private Drawable mIcon;
    private int mAnimationDelayPerItem;
    private Interpolator mOpenInterpolator;
    private Interpolator mCloseInterpolator;
    private boolean mIsAnimated;
    private boolean mLabelsSingleLine;
    private int mLabelsEllipsize;
    private int mLabelsMaxLines;
    private int mMenuFabSize;
    private int mLabelsStyle;
    private boolean mIconAnimated;
    private ImageView mImageToggle;
    private Animation mMenuButtonShowAnimation;
    private Animation mMenuButtonHideAnimation;
    private boolean mIsMenuButtonAnimationRunning;
    private boolean mIsSetClosedOnTouchOutside;
    private int mOpenDirection;
    private OnMenuToggleListener mToggleListener;
    private ValueAnimator mShowBackgroundAnimator;
    private ValueAnimator mHideBackgroundAnimator;
    private int mBackgroundColor;
    private int mLabelsPosition;
    GestureDetector mGestureDetector;

    /* loaded from: com.github.clans.fab.1.5.0.jar:com/github/clans/fab/FloatingActionMenu$OnMenuToggleListener.class */
    public interface OnMenuToggleListener {
        void onMenuToggle(boolean z);
    }

    public FloatingActionMenu(Context context) {
        this(context, null);
    }

    public FloatingActionMenu(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public FloatingActionMenu(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mOpenAnimatorSet = new AnimatorSet();
        this.mCloseAnimatorSet = new AnimatorSet();
        this.mButtonSpacing = Util.dpToPx(getContext(), CLOSED_PLUS_ROTATION);
        this.mLabelsMargin = Util.dpToPx(getContext(), CLOSED_PLUS_ROTATION);
        this.mLabelsVerticalOffset = Util.dpToPx(getContext(), CLOSED_PLUS_ROTATION);
        this.mUiHandler = new Handler();
        this.mLabelsPaddingTop = Util.dpToPx(getContext(), 4.0f);
        this.mLabelsPaddingRight = Util.dpToPx(getContext(), 8.0f);
        this.mLabelsPaddingBottom = Util.dpToPx(getContext(), 4.0f);
        this.mLabelsPaddingLeft = Util.dpToPx(getContext(), 8.0f);
        this.mLabelsCornerRadius = Util.dpToPx(getContext(), 3.0f);
        this.mMenuShadowRadius = 4.0f;
        this.mMenuShadowXOffset = 1.0f;
        this.mMenuShadowYOffset = 3.0f;
        this.mIsAnimated = true;
        this.mIconAnimated = true;
        this.mGestureDetector = new GestureDetector(getContext(), new GestureDetector.SimpleOnGestureListener() { // from class: com.github.clans.fab.FloatingActionMenu.4
            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onDown(MotionEvent e) {
                return FloatingActionMenu.this.mIsSetClosedOnTouchOutside && FloatingActionMenu.this.isOpened();
            }

            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onSingleTapUp(MotionEvent e) {
                FloatingActionMenu.this.close(FloatingActionMenu.this.mIsAnimated);
                return true;
            }
        });
        init(context, attrs);
    }

    private void init(Context context, AttributeSet attrs) {
        TypedArray attr = context.obtainStyledAttributes(attrs, R.styleable.FloatingActionMenu, 0, 0);
        this.mButtonSpacing = attr.getDimensionPixelSize(R.styleable.FloatingActionMenu_menu_buttonSpacing, this.mButtonSpacing);
        this.mLabelsMargin = attr.getDimensionPixelSize(R.styleable.FloatingActionMenu_menu_labels_margin, this.mLabelsMargin);
        this.mLabelsPosition = attr.getInt(R.styleable.FloatingActionMenu_menu_labels_position, 0);
        this.mLabelsShowAnimation = attr.getResourceId(R.styleable.FloatingActionMenu_menu_labels_showAnimation, this.mLabelsPosition == 0 ? R.anim.fab_slide_in_from_right : R.anim.fab_slide_in_from_left);
        this.mLabelsHideAnimation = attr.getResourceId(R.styleable.FloatingActionMenu_menu_labels_hideAnimation, this.mLabelsPosition == 0 ? R.anim.fab_slide_out_to_right : R.anim.fab_slide_out_to_left);
        this.mLabelsPaddingTop = attr.getDimensionPixelSize(R.styleable.FloatingActionMenu_menu_labels_paddingTop, this.mLabelsPaddingTop);
        this.mLabelsPaddingRight = attr.getDimensionPixelSize(R.styleable.FloatingActionMenu_menu_labels_paddingRight, this.mLabelsPaddingRight);
        this.mLabelsPaddingBottom = attr.getDimensionPixelSize(R.styleable.FloatingActionMenu_menu_labels_paddingBottom, this.mLabelsPaddingBottom);
        this.mLabelsPaddingLeft = attr.getDimensionPixelSize(R.styleable.FloatingActionMenu_menu_labels_paddingLeft, this.mLabelsPaddingLeft);
        this.mLabelsTextColor = attr.getColor(R.styleable.FloatingActionMenu_menu_labels_textColor, -1);
        this.mLabelsTextSize = attr.getDimension(R.styleable.FloatingActionMenu_menu_labels_textSize, getResources().getDimension(R.dimen.labels_text_size));
        this.mLabelsCornerRadius = attr.getDimensionPixelSize(R.styleable.FloatingActionMenu_menu_labels_cornerRadius, this.mLabelsCornerRadius);
        this.mLabelsShowShadow = attr.getBoolean(R.styleable.FloatingActionMenu_menu_labels_showShadow, true);
        this.mLabelsColorNormal = attr.getColor(R.styleable.FloatingActionMenu_menu_labels_colorNormal, -13421773);
        this.mLabelsColorPressed = attr.getColor(R.styleable.FloatingActionMenu_menu_labels_colorPressed, -12303292);
        this.mLabelsColorRipple = attr.getColor(R.styleable.FloatingActionMenu_menu_labels_colorRipple, 1728053247);
        this.mMenuShowShadow = attr.getBoolean(R.styleable.FloatingActionMenu_menu_showShadow, true);
        this.mMenuShadowColor = attr.getColor(R.styleable.FloatingActionMenu_menu_shadowColor, 1711276032);
        this.mMenuShadowRadius = attr.getDimension(R.styleable.FloatingActionMenu_menu_shadowRadius, this.mMenuShadowRadius);
        this.mMenuShadowXOffset = attr.getDimension(R.styleable.FloatingActionMenu_menu_shadowXOffset, this.mMenuShadowXOffset);
        this.mMenuShadowYOffset = attr.getDimension(R.styleable.FloatingActionMenu_menu_shadowYOffset, this.mMenuShadowYOffset);
        this.mMenuColorNormal = attr.getColor(R.styleable.FloatingActionMenu_menu_colorNormal, -2473162);
        this.mMenuColorPressed = attr.getColor(R.styleable.FloatingActionMenu_menu_colorPressed, -1617853);
        this.mMenuColorRipple = attr.getColor(R.styleable.FloatingActionMenu_menu_colorRipple, -1711276033);
        this.mAnimationDelayPerItem = attr.getInt(R.styleable.FloatingActionMenu_menu_animationDelayPerItem, 50);
        this.mIcon = attr.getDrawable(R.styleable.FloatingActionMenu_menu_icon);
        if (this.mIcon == null) {
            this.mIcon = getResources().getDrawable(R.drawable.fab_add);
        }
        this.mLabelsSingleLine = attr.getBoolean(R.styleable.FloatingActionMenu_menu_labels_singleLine, false);
        this.mLabelsEllipsize = attr.getInt(R.styleable.FloatingActionMenu_menu_labels_ellipsize, 0);
        this.mLabelsMaxLines = attr.getInt(R.styleable.FloatingActionMenu_menu_labels_maxLines, -1);
        this.mMenuFabSize = attr.getInt(R.styleable.FloatingActionMenu_menu_fab_size, 0);
        this.mLabelsStyle = attr.getResourceId(R.styleable.FloatingActionMenu_menu_labels_style, 0);
        this.mOpenDirection = attr.getInt(R.styleable.FloatingActionMenu_menu_openDirection, 0);
        this.mBackgroundColor = attr.getColor(R.styleable.FloatingActionMenu_menu_backgroundColor, 0);
        if (attr.hasValue(R.styleable.FloatingActionMenu_menu_labels_padding)) {
            int padding = attr.getDimensionPixelSize(R.styleable.FloatingActionMenu_menu_labels_padding, 0);
            initPadding(padding);
        }
        attr.recycle();
        this.mOpenInterpolator = new OvershootInterpolator();
        this.mCloseInterpolator = new AnticipateInterpolator();
        initMenuButtonAnimations();
        initBackgroundDimAnimation();
        createMenuButton();
    }

    private void initMenuButtonAnimations() {
        this.mMenuButtonShowAnimation = AnimationUtils.loadAnimation(getContext(), R.anim.fab_scale_up);
        this.mMenuButtonHideAnimation = AnimationUtils.loadAnimation(getContext(), R.anim.fab_scale_down);
    }

    private void initBackgroundDimAnimation() {
        int maxAlpha = Color.alpha(this.mBackgroundColor);
        final int red = Color.red(this.mBackgroundColor);
        final int green = Color.green(this.mBackgroundColor);
        final int blue = Color.blue(this.mBackgroundColor);
        this.mShowBackgroundAnimator = ValueAnimator.ofInt(0, maxAlpha);
        this.mShowBackgroundAnimator.setDuration(300L);
        this.mShowBackgroundAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.github.clans.fab.FloatingActionMenu.1
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator animation) {
                Integer alpha = (Integer) animation.getAnimatedValue();
                FloatingActionMenu.this.setBackgroundColor(Color.argb(alpha.intValue(), red, green, blue));
            }
        });
        this.mHideBackgroundAnimator = ValueAnimator.ofInt(maxAlpha, 0);
        this.mHideBackgroundAnimator.setDuration(300L);
        this.mHideBackgroundAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.github.clans.fab.FloatingActionMenu.2
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator animation) {
                Integer alpha = (Integer) animation.getAnimatedValue();
                FloatingActionMenu.this.setBackgroundColor(Color.argb(alpha.intValue(), red, green, blue));
            }
        });
    }

    private boolean isBackgroundEnabled() {
        return this.mBackgroundColor != 0;
    }

    private void initPadding(int padding) {
        this.mLabelsPaddingTop = padding;
        this.mLabelsPaddingRight = padding;
        this.mLabelsPaddingBottom = padding;
        this.mLabelsPaddingLeft = padding;
    }

    private void createMenuButton() {
        this.mMenuButton = new FloatingActionButton(getContext());
        this.mMenuButton.mShowShadow = this.mMenuShowShadow;
        if (this.mMenuShowShadow) {
            this.mMenuButton.mShadowRadius = Util.dpToPx(getContext(), this.mMenuShadowRadius);
            this.mMenuButton.mShadowXOffset = Util.dpToPx(getContext(), this.mMenuShadowXOffset);
            this.mMenuButton.mShadowYOffset = Util.dpToPx(getContext(), this.mMenuShadowYOffset);
        }
        this.mMenuButton.setColors(this.mMenuColorNormal, this.mMenuColorPressed, this.mMenuColorRipple);
        this.mMenuButton.mShadowColor = this.mMenuShadowColor;
        this.mMenuButton.mFabSize = this.mMenuFabSize;
        this.mMenuButton.updateBackground();
        this.mMenuButton.setOnClickListener(new View.OnClickListener() { // from class: com.github.clans.fab.FloatingActionMenu.3
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                FloatingActionMenu.this.toggle(FloatingActionMenu.this.mIsAnimated);
            }
        });
        this.mImageToggle = new ImageView(getContext());
        this.mImageToggle.setImageDrawable(this.mIcon);
        addView(this.mMenuButton, super.generateDefaultLayoutParams());
        addView(this.mImageToggle);
        createDefaultIconAnimation();
    }

    private void createDefaultIconAnimation() {
        ImageView imageView = this.mImageToggle;
        float[] fArr = new float[2];
        fArr[0] = this.mLabelsPosition == 0 ? OPENED_PLUS_ROTATION_LEFT : OPENED_PLUS_ROTATION_RIGHT;
        fArr[1] = 0.0f;
        ObjectAnimator collapseAnimator = ObjectAnimator.ofFloat(imageView, "rotation", fArr);
        ImageView imageView2 = this.mImageToggle;
        float[] fArr2 = new float[2];
        fArr2[0] = 0.0f;
        fArr2[1] = this.mLabelsPosition == 0 ? OPENED_PLUS_ROTATION_LEFT : OPENED_PLUS_ROTATION_RIGHT;
        ObjectAnimator expandAnimator = ObjectAnimator.ofFloat(imageView2, "rotation", fArr2);
        this.mOpenAnimatorSet.play(expandAnimator);
        this.mCloseAnimatorSet.play(collapseAnimator);
        this.mOpenAnimatorSet.setInterpolator(this.mOpenInterpolator);
        this.mCloseAnimatorSet.setInterpolator(this.mCloseInterpolator);
        this.mOpenAnimatorSet.setDuration(300L);
        this.mCloseAnimatorSet.setDuration(300L);
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int height = 0;
        this.mMaxButtonWidth = 0;
        int maxLabelWidth = 0;
        measureChildWithMargins(this.mImageToggle, widthMeasureSpec, 0, heightMeasureSpec, 0);
        for (int i = 0; i < this.mButtonsCount; i++) {
            View child = getChildAt(i);
            if (child.getVisibility() != 8 && child != this.mImageToggle) {
                measureChildWithMargins(child, widthMeasureSpec, 0, heightMeasureSpec, 0);
                this.mMaxButtonWidth = Math.max(this.mMaxButtonWidth, child.getMeasuredWidth());
            }
        }
        for (int i2 = 0; i2 < this.mButtonsCount; i2++) {
            View child2 = getChildAt(i2);
            if (child2.getVisibility() != 8 && child2 != this.mImageToggle) {
                int usedWidth = 0 + child2.getMeasuredWidth();
                height += child2.getMeasuredHeight();
                Label label = (Label) child2.getTag(R.id.fab_label);
                if (label != null) {
                    int labelOffset = (this.mMaxButtonWidth - child2.getMeasuredWidth()) / 2;
                    int labelUsedWidth = child2.getMeasuredWidth() + label.calculateShadowWidth() + this.mLabelsMargin + labelOffset;
                    measureChildWithMargins(label, widthMeasureSpec, labelUsedWidth, heightMeasureSpec, 0);
                    maxLabelWidth = Math.max(maxLabelWidth, usedWidth + label.getMeasuredWidth() + labelOffset);
                }
            }
        }
        int width = Math.max(this.mMaxButtonWidth, maxLabelWidth + this.mLabelsMargin) + getPaddingLeft() + getPaddingRight();
        int height2 = adjustForOvershoot(height + (this.mButtonSpacing * (getChildCount() - 1)) + getPaddingTop() + getPaddingBottom());
        if (getLayoutParams().width == -1) {
            width = getDefaultSize(getSuggestedMinimumWidth(), widthMeasureSpec);
        }
        if (getLayoutParams().height == -1) {
            height2 = getDefaultSize(getSuggestedMinimumHeight(), heightMeasureSpec);
        }
        setMeasuredDimension(width, height2);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        int paddingLeft;
        int paddingTop;
        FloatingActionButton fab;
        int measuredWidth;
        if (this.mLabelsPosition == 0) {
            paddingLeft = ((r - l) - (this.mMaxButtonWidth / 2)) - getPaddingRight();
        } else {
            paddingLeft = (this.mMaxButtonWidth / 2) + getPaddingLeft();
        }
        int buttonsHorizontalCenter = paddingLeft;
        boolean openUp = this.mOpenDirection == 0;
        if (openUp) {
            paddingTop = ((b - t) - this.mMenuButton.getMeasuredHeight()) - getPaddingBottom();
        } else {
            paddingTop = getPaddingTop();
        }
        int menuButtonTop = paddingTop;
        int menuButtonLeft = buttonsHorizontalCenter - (this.mMenuButton.getMeasuredWidth() / 2);
        this.mMenuButton.layout(menuButtonLeft, menuButtonTop, menuButtonLeft + this.mMenuButton.getMeasuredWidth(), menuButtonTop + this.mMenuButton.getMeasuredHeight());
        int imageLeft = buttonsHorizontalCenter - (this.mImageToggle.getMeasuredWidth() / 2);
        int imageTop = (menuButtonTop + (this.mMenuButton.getMeasuredHeight() / 2)) - (this.mImageToggle.getMeasuredHeight() / 2);
        this.mImageToggle.layout(imageLeft, imageTop, imageLeft + this.mImageToggle.getMeasuredWidth(), imageTop + this.mImageToggle.getMeasuredHeight());
        int nextY = openUp ? menuButtonTop - this.mButtonSpacing : menuButtonTop + this.mMenuButton.getMeasuredHeight() + this.mButtonSpacing;
        for (int i = this.mButtonsCount - 1; i >= 0; i--) {
            View child = getChildAt(i);
            if (child != this.mImageToggle && (fab = (FloatingActionButton) child) != this.mMenuButton && fab.getVisibility() != 8) {
                int childX = buttonsHorizontalCenter - (fab.getMeasuredWidth() / 2);
                int childY = openUp ? nextY - fab.getMeasuredHeight() : nextY;
                fab.layout(childX, childY, childX + fab.getMeasuredWidth(), childY + fab.getMeasuredHeight());
                if (!this.mMenuOpened) {
                    fab.hide(false);
                }
                View label = (View) fab.getTag(R.id.fab_label);
                if (label != null) {
                    int labelsOffset = (fab.getMeasuredWidth() / 2) + this.mLabelsMargin;
                    int labelXNearButton = this.mLabelsPosition == 0 ? buttonsHorizontalCenter - labelsOffset : buttonsHorizontalCenter + labelsOffset;
                    if (this.mLabelsPosition == 0) {
                        measuredWidth = labelXNearButton - label.getMeasuredWidth();
                    } else {
                        measuredWidth = labelXNearButton + label.getMeasuredWidth();
                    }
                    int labelXAwayFromButton = measuredWidth;
                    int labelLeft = this.mLabelsPosition == 0 ? labelXAwayFromButton : labelXNearButton;
                    int labelRight = this.mLabelsPosition == 0 ? labelXNearButton : labelXAwayFromButton;
                    int labelTop = (childY - this.mLabelsVerticalOffset) + ((fab.getMeasuredHeight() - label.getMeasuredHeight()) / 2);
                    label.layout(labelLeft, labelTop, labelRight, labelTop + label.getMeasuredHeight());
                    if (!this.mMenuOpened) {
                        label.setVisibility(4);
                    }
                }
                nextY = openUp ? childY - this.mButtonSpacing : childY + child.getMeasuredHeight() + this.mButtonSpacing;
            }
        }
    }

    private int adjustForOvershoot(int dimension) {
        return (dimension * 12) / 10;
    }

    @Override // android.view.View
    protected void onFinishInflate() {
        super.onFinishInflate();
        bringChildToFront(this.mMenuButton);
        bringChildToFront(this.mImageToggle);
        this.mButtonsCount = getChildCount();
        createLabels();
    }

    private void createLabels() {
        Context context = new ContextThemeWrapper(getContext(), this.mLabelsStyle);
        for (int i = 0; i < this.mButtonsCount; i++) {
            if (getChildAt(i) != this.mImageToggle) {
                FloatingActionButton floatingActionButton = (FloatingActionButton) getChildAt(i);
                String text = floatingActionButton.getLabelText();
                if (floatingActionButton != this.mMenuButton && !TextUtils.isEmpty(text) && floatingActionButton.getTag(R.id.fab_label) == null) {
                    Label label = new Label(context);
                    label.setFab(floatingActionButton);
                    label.setShowAnimation(AnimationUtils.loadAnimation(getContext(), this.mLabelsShowAnimation));
                    label.setHideAnimation(AnimationUtils.loadAnimation(getContext(), this.mLabelsHideAnimation));
                    if (this.mLabelsStyle > 0) {
                        label.setTextAppearance(getContext(), this.mLabelsStyle);
                        label.setShowShadow(false);
                        label.setUsingStyle(true);
                    } else {
                        label.setColors(this.mLabelsColorNormal, this.mLabelsColorPressed, this.mLabelsColorRipple);
                        label.setShowShadow(this.mLabelsShowShadow);
                        label.setCornerRadius(this.mLabelsCornerRadius);
                        if (this.mLabelsEllipsize > 0) {
                            setLabelEllipsize(label);
                        }
                        label.setMaxLines(this.mLabelsMaxLines);
                        label.updateBackground();
                        label.setTextSize(0, this.mLabelsTextSize);
                        label.setTextColor(this.mLabelsTextColor);
                        int left = this.mLabelsPaddingLeft;
                        int top = this.mLabelsPaddingTop;
                        if (this.mLabelsShowShadow) {
                            left += floatingActionButton.getShadowRadius() + Math.abs(floatingActionButton.getShadowXOffset());
                            top += floatingActionButton.getShadowRadius() + Math.abs(floatingActionButton.getShadowYOffset());
                        }
                        label.setPadding(left, top, this.mLabelsPaddingLeft, this.mLabelsPaddingTop);
                        if (this.mLabelsMaxLines < 0 || this.mLabelsSingleLine) {
                            label.setSingleLine(this.mLabelsSingleLine);
                        }
                    }
                    label.setText(text);
                    addView(label);
                    floatingActionButton.setTag(R.id.fab_label, label);
                }
            }
        }
    }

    private void setLabelEllipsize(Label label) {
        switch (this.mLabelsEllipsize) {
            case FloatingActionButton.SIZE_MINI /* 1 */:
                label.setEllipsize(TextUtils.TruncateAt.START);
                break;
            case 2:
                label.setEllipsize(TextUtils.TruncateAt.MIDDLE);
                break;
            case 3:
                label.setEllipsize(TextUtils.TruncateAt.END);
                break;
            case 4:
                label.setEllipsize(TextUtils.TruncateAt.MARQUEE);
                break;
        }
    }

    @Override // android.view.ViewGroup
    public ViewGroup.MarginLayoutParams generateLayoutParams(AttributeSet attrs) {
        return new ViewGroup.MarginLayoutParams(getContext(), attrs);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.view.ViewGroup
    public ViewGroup.MarginLayoutParams generateLayoutParams(ViewGroup.LayoutParams p) {
        return new ViewGroup.MarginLayoutParams(p);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.view.ViewGroup
    public ViewGroup.MarginLayoutParams generateDefaultLayoutParams() {
        return new ViewGroup.MarginLayoutParams(-2, -2);
    }

    @Override // android.view.ViewGroup
    protected boolean checkLayoutParams(ViewGroup.LayoutParams p) {
        return p instanceof ViewGroup.MarginLayoutParams;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void hideMenuButtonWithImage(boolean animate) {
        if (!isMenuButtonHidden()) {
            this.mMenuButton.hide(animate);
            if (animate) {
                this.mImageToggle.startAnimation(this.mMenuButtonHideAnimation);
            }
            this.mImageToggle.setVisibility(4);
            this.mIsMenuButtonAnimationRunning = false;
        }
    }

    private void showMenuButtonWithImage(boolean animate) {
        if (isMenuButtonHidden()) {
            this.mMenuButton.show(animate);
            if (animate) {
                this.mImageToggle.startAnimation(this.mMenuButtonShowAnimation);
            }
            this.mImageToggle.setVisibility(0);
        }
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        if (this.mIsSetClosedOnTouchOutside) {
            return this.mGestureDetector.onTouchEvent(event);
        }
        return super.onTouchEvent(event);
    }

    public boolean isOpened() {
        return this.mMenuOpened;
    }

    public void toggle(boolean animate) {
        if (isOpened()) {
            close(animate);
        } else {
            open(animate);
        }
    }

    public void open(final boolean animate) {
        if (!isOpened()) {
            if (isBackgroundEnabled()) {
                this.mShowBackgroundAnimator.start();
            }
            if (this.mIconAnimated) {
                if (this.mIconToggleSet != null) {
                    this.mIconToggleSet.start();
                } else {
                    this.mCloseAnimatorSet.cancel();
                    this.mOpenAnimatorSet.start();
                }
            }
            this.mMenuOpened = true;
            int delay = 0;
            for (int i = getChildCount() - 1; i >= 0; i--) {
                View child = getChildAt(i);
                if ((child instanceof FloatingActionButton) && child != this.mMenuButton && child.getVisibility() != 8) {
                    final FloatingActionButton fab = (FloatingActionButton) child;
                    this.mUiHandler.postDelayed(new Runnable() { // from class: com.github.clans.fab.FloatingActionMenu.5
                        @Override // java.lang.Runnable
                        public void run() {
                            fab.show(animate);
                            Label label = (Label) fab.getTag(R.id.fab_label);
                            if (label != null) {
                                label.show(animate);
                            }
                        }
                    }, delay);
                    delay += this.mAnimationDelayPerItem;
                }
            }
            if (this.mToggleListener != null) {
                this.mToggleListener.onMenuToggle(true);
            }
        }
    }

    public void close(final boolean animate) {
        if (isOpened()) {
            if (isBackgroundEnabled()) {
                this.mHideBackgroundAnimator.start();
            }
            if (this.mIconAnimated) {
                if (this.mIconToggleSet != null) {
                    this.mIconToggleSet.start();
                } else {
                    this.mCloseAnimatorSet.start();
                    this.mOpenAnimatorSet.cancel();
                }
            }
            this.mMenuOpened = false;
            int delay = 0;
            for (int i = 0; i < getChildCount(); i++) {
                View child = getChildAt(i);
                if ((child instanceof FloatingActionButton) && child != this.mMenuButton && child.getVisibility() != 8) {
                    final FloatingActionButton fab = (FloatingActionButton) child;
                    this.mUiHandler.postDelayed(new Runnable() { // from class: com.github.clans.fab.FloatingActionMenu.6
                        @Override // java.lang.Runnable
                        public void run() {
                            fab.hide(animate);
                            Label label = (Label) fab.getTag(R.id.fab_label);
                            if (label != null) {
                                label.hide(animate);
                            }
                        }
                    }, delay);
                    delay += this.mAnimationDelayPerItem;
                }
            }
            if (this.mToggleListener != null) {
                this.mToggleListener.onMenuToggle(false);
            }
        }
    }

    public void setIconAnimationInterpolator(Interpolator interpolator) {
        this.mOpenAnimatorSet.setInterpolator(interpolator);
        this.mCloseAnimatorSet.setInterpolator(interpolator);
    }

    public void setIconAnimationOpenInterpolator(Interpolator openInterpolator) {
        this.mOpenAnimatorSet.setInterpolator(openInterpolator);
    }

    public void setIconAnimationCloseInterpolator(Interpolator closeInterpolator) {
        this.mCloseAnimatorSet.setInterpolator(closeInterpolator);
    }

    public void setAnimated(boolean animated) {
        this.mIsAnimated = animated;
        this.mOpenAnimatorSet.setDuration(animated ? 300L : 0L);
        this.mCloseAnimatorSet.setDuration(animated ? 300L : 0L);
    }

    public boolean isAnimated() {
        return this.mIsAnimated;
    }

    public void setAnimationDelayPerItem(int animationDelayPerItem) {
        this.mAnimationDelayPerItem = animationDelayPerItem;
    }

    public int getAnimationDelayPerItem() {
        return this.mAnimationDelayPerItem;
    }

    public void setOnMenuToggleListener(OnMenuToggleListener listener) {
        this.mToggleListener = listener;
    }

    public void setIconAnimated(boolean animated) {
        this.mIconAnimated = animated;
    }

    public boolean isIconAnimated() {
        return this.mIconAnimated;
    }

    public ImageView getMenuIconView() {
        return this.mImageToggle;
    }

    public void setIconToggleAnimatorSet(AnimatorSet toggleAnimatorSet) {
        this.mIconToggleSet = toggleAnimatorSet;
    }

    public AnimatorSet getIconToggleAnimatorSet() {
        return this.mIconToggleSet;
    }

    public void setMenuButtonShowAnimation(Animation showAnimation) {
        this.mMenuButtonShowAnimation = showAnimation;
        this.mMenuButton.setShowAnimation(showAnimation);
    }

    public void setMenuButtonHideAnimation(Animation hideAnimation) {
        this.mMenuButtonHideAnimation = hideAnimation;
        this.mMenuButton.setHideAnimation(hideAnimation);
    }

    public boolean isMenuButtonHidden() {
        return this.mMenuButton.isHidden();
    }

    public void showMenuButton(boolean animate) {
        if (isMenuButtonHidden()) {
            showMenuButtonWithImage(animate);
        }
    }

    public void hideMenuButton(final boolean animate) {
        if (!isMenuButtonHidden() && !this.mIsMenuButtonAnimationRunning) {
            this.mIsMenuButtonAnimationRunning = true;
            if (isOpened()) {
                close(animate);
                this.mUiHandler.postDelayed(new Runnable() { // from class: com.github.clans.fab.FloatingActionMenu.7
                    @Override // java.lang.Runnable
                    public void run() {
                        FloatingActionMenu.this.hideMenuButtonWithImage(animate);
                    }
                }, this.mAnimationDelayPerItem * this.mButtonsCount);
            } else {
                hideMenuButtonWithImage(animate);
            }
        }
    }

    public void toggleMenuButton(boolean animate) {
        if (isMenuButtonHidden()) {
            showMenuButton(animate);
        } else {
            hideMenuButton(animate);
        }
    }

    public void setClosedOnTouchOutside(boolean close) {
        this.mIsSetClosedOnTouchOutside = close;
    }

    public void setMenuButtonColorNormal(int color) {
        this.mMenuColorNormal = color;
        this.mMenuButton.setColorNormal(color);
    }

    public void setMenuButtonColorNormalResId(int colorResId) {
        this.mMenuColorNormal = getResources().getColor(colorResId);
        this.mMenuButton.setColorNormalResId(colorResId);
    }

    public int getMenuButtonColorNormal() {
        return this.mMenuColorNormal;
    }

    public void setMenuButtonColorPressed(int color) {
        this.mMenuColorPressed = color;
        this.mMenuButton.setColorPressed(color);
    }

    public void setMenuButtonColorPressedResId(int colorResId) {
        this.mMenuColorPressed = getResources().getColor(colorResId);
        this.mMenuButton.setColorPressedResId(colorResId);
    }

    public int getMenuButtonColorPressed() {
        return this.mMenuColorPressed;
    }

    public void setMenuButtonColorRipple(int color) {
        this.mMenuColorRipple = color;
        this.mMenuButton.setColorRipple(color);
    }

    public void setMenuButtonColorRippleResId(int colorResId) {
        this.mMenuColorRipple = getResources().getColor(colorResId);
        this.mMenuButton.setColorRippleResId(colorResId);
    }

    public int getMenuButtonColorRipple() {
        return this.mMenuColorRipple;
    }

    public void addMenuButton(FloatingActionButton fab) {
        addView(fab, this.mButtonsCount - 1);
        this.mButtonsCount++;
        createLabels();
    }

    public void removeMenuButton(FloatingActionButton fab) {
        removeView(fab.getLabelView());
        removeView(fab);
        this.mButtonsCount--;
    }
}
