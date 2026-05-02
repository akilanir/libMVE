package com.rey.material.app;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Handler;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.v4.view.ViewCompat;
import android.support.v7.widget.CardView;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.FrameLayout;
import com.rey.material.R;
import com.rey.material.app.DialogFragment;
import com.rey.material.drawable.BlankDrawable;
import com.rey.material.drawable.RippleDrawable;
import com.rey.material.util.ThemeUtil;
import com.rey.material.util.ViewUtil;
import com.rey.material.widget.Button;
import com.rey.material.widget.TextView;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/Dialog.class */
public class Dialog extends android.app.Dialog {
    private ContainerFrameLayout mContainer;
    private int mLayoutWidth;
    private int mLayoutHeight;
    private int mMaxWidth;
    private int mMaxHeight;
    protected TextView mTitle;
    protected Button mPositiveAction;
    protected Button mNegativeAction;
    protected Button mNeutralAction;
    private View mContent;
    private DialogCardView mCardView;
    protected int mContentPadding;
    protected int mActionHeight;
    protected int mActionOuterHeight;
    protected int mActionOuterPadding;
    protected int mActionMinWidth;
    protected int mActionPadding;
    protected int mDialogHorizontalPadding;
    protected int mDialogVerticalPadding;
    protected int mInAnimationId;
    protected int mOutAnimationId;
    private final Handler mHandler;
    private final Runnable mDismissAction;
    private boolean mLayoutActionVertical;
    private boolean mCancelable;
    private boolean mCanceledOnTouchOutside;
    public static final int TITLE = ViewUtil.generateViewId();
    public static final int ACTION_POSITIVE = ViewUtil.generateViewId();
    public static final int ACTION_NEGATIVE = ViewUtil.generateViewId();
    public static final int ACTION_NEUTRAL = ViewUtil.generateViewId();

    public Dialog(Context context) {
        this(context, R.style.Material_App_Dialog_Light);
    }

    public Dialog(Context context, int style) {
        super(context, style);
        this.mLayoutWidth = -2;
        this.mLayoutHeight = -2;
        this.mHandler = new Handler();
        this.mDismissAction = new Runnable() { // from class: com.rey.material.app.Dialog.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    Dialog.super.dismiss();
                } catch (IllegalArgumentException e) {
                }
            }
        };
        this.mLayoutActionVertical = false;
        this.mCancelable = true;
        this.mCanceledOnTouchOutside = true;
        requestWindowFeature(1);
        getWindow().setBackgroundDrawable(BlankDrawable.getInstance());
        WindowManager.LayoutParams layout = getWindow().getAttributes();
        layout.width = -1;
        layout.height = -1;
        layout.windowAnimations = R.style.DialogNoAnimation;
        getWindow().setAttributes(layout);
        init(context, style);
    }

    private void init(Context context, int style) {
        this.mContentPadding = ThemeUtil.dpToPx(context, 24);
        this.mActionMinWidth = ThemeUtil.dpToPx(context, 64);
        this.mActionHeight = ThemeUtil.dpToPx(context, 36);
        this.mActionOuterHeight = ThemeUtil.dpToPx(context, 48);
        this.mActionPadding = ThemeUtil.dpToPx(context, 8);
        this.mActionOuterPadding = ThemeUtil.dpToPx(context, 16);
        this.mDialogHorizontalPadding = ThemeUtil.dpToPx(context, 40);
        this.mDialogVerticalPadding = ThemeUtil.dpToPx(context, 24);
        this.mCardView = new DialogCardView(context);
        this.mContainer = new ContainerFrameLayout(context);
        this.mTitle = new TextView(context);
        this.mPositiveAction = new Button(context);
        this.mNegativeAction = new Button(context);
        this.mNeutralAction = new Button(context);
        this.mCardView.setPreventCornerOverlap(false);
        this.mCardView.setUseCompatPadding(true);
        this.mTitle.setId(TITLE);
        this.mTitle.setGravity(8388611);
        this.mTitle.setPadding(this.mContentPadding, this.mContentPadding, this.mContentPadding, this.mContentPadding - this.mActionPadding);
        this.mPositiveAction.setId(ACTION_POSITIVE);
        this.mPositiveAction.setPadding(this.mActionPadding, 0, this.mActionPadding, 0);
        this.mPositiveAction.setBackgroundResource(0);
        this.mNegativeAction.setId(ACTION_NEGATIVE);
        this.mNegativeAction.setPadding(this.mActionPadding, 0, this.mActionPadding, 0);
        this.mNegativeAction.setBackgroundResource(0);
        this.mNeutralAction.setId(ACTION_NEUTRAL);
        this.mNeutralAction.setPadding(this.mActionPadding, 0, this.mActionPadding, 0);
        this.mNeutralAction.setBackgroundResource(0);
        this.mContainer.addView(this.mCardView);
        this.mCardView.addView(this.mTitle);
        this.mCardView.addView(this.mPositiveAction);
        this.mCardView.addView(this.mNegativeAction);
        this.mCardView.addView(this.mNeutralAction);
        backgroundColor(ThemeUtil.windowBackground(context, -1));
        elevation(ThemeUtil.dpToPx(context, 4));
        cornerRadius(ThemeUtil.dpToPx(context, 2));
        dimAmount(0.5f);
        layoutDirection(3);
        titleTextAppearance(R.style.TextAppearance_AppCompat_Title);
        actionTextAppearance(R.style.TextAppearance_AppCompat_Button);
        dividerColor(503316480);
        dividerHeight(ThemeUtil.dpToPx(context, 1));
        cancelable(true);
        canceledOnTouchOutside(true);
        clearContent();
        onCreate();
        applyStyle(style);
        super.setContentView(this.mContainer);
    }

    protected void onCreate() {
    }

    public Dialog applyStyle(int resId) {
        Context context = getContext();
        TypedArray a = context.obtainStyledAttributes(resId, R.styleable.Dialog);
        int layout_width = this.mLayoutWidth;
        int layout_height = this.mLayoutHeight;
        boolean layoutParamsDefined = false;
        int titleTextAppearance = 0;
        int titleTextColor = 0;
        boolean titleTextColorDefined = false;
        int actionBackground = 0;
        int actionRipple = 0;
        int actionTextAppearance = 0;
        ColorStateList actionTextColors = null;
        int positiveActionBackground = 0;
        int positiveActionRipple = 0;
        int positiveActionTextAppearance = 0;
        ColorStateList positiveActionTextColors = null;
        int negativeActionBackground = 0;
        int negativeActionRipple = 0;
        int negativeActionTextAppearance = 0;
        ColorStateList negativeActionTextColors = null;
        int neutralActionBackground = 0;
        int neutralActionRipple = 0;
        int neutralActionTextAppearance = 0;
        ColorStateList neutralActionTextColors = null;
        int count = a.getIndexCount();
        for (int i = 0; i < count; i++) {
            int attr = a.getIndex(i);
            if (attr == R.styleable.Dialog_android_layout_width) {
                layout_width = a.getLayoutDimension(attr, -2);
                layoutParamsDefined = true;
            } else if (attr == R.styleable.Dialog_android_layout_height) {
                layout_height = a.getLayoutDimension(attr, -2);
                layoutParamsDefined = true;
            } else if (attr == R.styleable.Dialog_di_maxWidth) {
                maxWidth(a.getDimensionPixelOffset(attr, 0));
            } else if (attr == R.styleable.Dialog_di_maxHeight) {
                maxHeight(a.getDimensionPixelOffset(attr, 0));
            } else if (attr == R.styleable.Dialog_di_dimAmount) {
                dimAmount(a.getFloat(attr, 0.0f));
            } else if (attr == R.styleable.Dialog_di_backgroundColor) {
                backgroundColor(a.getColor(attr, 0));
            } else if (attr == R.styleable.Dialog_di_maxElevation) {
                maxElevation(a.getDimensionPixelOffset(attr, 0));
            } else if (attr == R.styleable.Dialog_di_elevation) {
                elevation(a.getDimensionPixelOffset(attr, 0));
            } else if (attr == R.styleable.Dialog_di_cornerRadius) {
                cornerRadius(a.getDimensionPixelOffset(attr, 0));
            } else if (attr == R.styleable.Dialog_di_layoutDirection) {
                layoutDirection(a.getInteger(attr, 0));
            } else if (attr == R.styleable.Dialog_di_titleTextAppearance) {
                titleTextAppearance = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.Dialog_di_titleTextColor) {
                titleTextColor = a.getColor(attr, 0);
                titleTextColorDefined = true;
            } else if (attr == R.styleable.Dialog_di_actionBackground) {
                actionBackground = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.Dialog_di_actionRipple) {
                actionRipple = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.Dialog_di_actionTextAppearance) {
                actionTextAppearance = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.Dialog_di_actionTextColor) {
                actionTextColors = a.getColorStateList(attr);
            } else if (attr == R.styleable.Dialog_di_positiveActionBackground) {
                positiveActionBackground = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.Dialog_di_positiveActionRipple) {
                positiveActionRipple = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.Dialog_di_positiveActionTextAppearance) {
                positiveActionTextAppearance = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.Dialog_di_positiveActionTextColor) {
                positiveActionTextColors = a.getColorStateList(attr);
            } else if (attr == R.styleable.Dialog_di_negativeActionBackground) {
                negativeActionBackground = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.Dialog_di_negativeActionRipple) {
                negativeActionRipple = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.Dialog_di_negativeActionTextAppearance) {
                negativeActionTextAppearance = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.Dialog_di_negativeActionTextColor) {
                negativeActionTextColors = a.getColorStateList(attr);
            } else if (attr == R.styleable.Dialog_di_neutralActionBackground) {
                neutralActionBackground = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.Dialog_di_neutralActionRipple) {
                neutralActionRipple = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.Dialog_di_neutralActionTextAppearance) {
                neutralActionTextAppearance = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.Dialog_di_neutralActionTextColor) {
                neutralActionTextColors = a.getColorStateList(attr);
            } else if (attr == R.styleable.Dialog_di_inAnimation) {
                inAnimation(a.getResourceId(attr, 0));
            } else if (attr == R.styleable.Dialog_di_outAnimation) {
                outAnimation(a.getResourceId(attr, 0));
            } else if (attr == R.styleable.Dialog_di_dividerColor) {
                dividerColor(a.getColor(attr, 0));
            } else if (attr == R.styleable.Dialog_di_dividerHeight) {
                dividerHeight(a.getDimensionPixelOffset(attr, 0));
            } else if (attr == R.styleable.Dialog_di_cancelable) {
                cancelable(a.getBoolean(attr, true));
            } else if (attr == R.styleable.Dialog_di_canceledOnTouchOutside) {
                canceledOnTouchOutside(a.getBoolean(attr, true));
            }
        }
        a.recycle();
        if (layoutParamsDefined) {
            layoutParams(layout_width, layout_height);
        }
        if (titleTextAppearance != 0) {
            titleTextAppearance(titleTextAppearance);
        }
        if (titleTextColorDefined) {
            titleColor(titleTextColor);
        }
        if (actionBackground != 0) {
            actionBackground(actionBackground);
        }
        if (actionRipple != 0) {
            actionRipple(actionRipple);
        }
        if (actionTextAppearance != 0) {
            actionTextAppearance(actionTextAppearance);
        }
        if (actionTextColors != null) {
            actionTextColor(actionTextColors);
        }
        if (positiveActionBackground != 0) {
            positiveActionBackground(positiveActionBackground);
        }
        if (positiveActionRipple != 0) {
            positiveActionRipple(positiveActionRipple);
        }
        if (positiveActionTextAppearance != 0) {
            positiveActionTextAppearance(positiveActionTextAppearance);
        }
        if (positiveActionTextColors != null) {
            positiveActionTextColor(positiveActionTextColors);
        }
        if (negativeActionBackground != 0) {
            negativeActionBackground(negativeActionBackground);
        }
        if (negativeActionRipple != 0) {
            negativeActionRipple(negativeActionRipple);
        }
        if (negativeActionTextAppearance != 0) {
            negativeActionTextAppearance(negativeActionTextAppearance);
        }
        if (negativeActionTextColors != null) {
            negativeActionTextColor(negativeActionTextColors);
        }
        if (neutralActionBackground != 0) {
            neutralActionBackground(neutralActionBackground);
        }
        if (neutralActionRipple != 0) {
            neutralActionRipple(neutralActionRipple);
        }
        if (neutralActionTextAppearance != 0) {
            neutralActionTextAppearance(neutralActionTextAppearance);
        }
        if (neutralActionTextColors != null) {
            neutralActionTextColor(neutralActionTextColors);
        }
        return this;
    }

    public Dialog clearContent() {
        title(0);
        positiveAction(0);
        positiveActionClickListener(null);
        negativeAction(0);
        negativeActionClickListener(null);
        neutralAction(0);
        neutralActionClickListener(null);
        contentView((View) null);
        return this;
    }

    public Dialog layoutParams(int width, int height) {
        this.mLayoutWidth = width;
        this.mLayoutHeight = height;
        return this;
    }

    public Dialog maxWidth(int width) {
        this.mMaxWidth = width;
        return this;
    }

    public Dialog maxHeight(int height) {
        this.mMaxHeight = height;
        return this;
    }

    public Dialog dimAmount(float amount) {
        Window window = getWindow();
        if (amount > 0.0f) {
            window.addFlags(2);
            WindowManager.LayoutParams lp = window.getAttributes();
            lp.dimAmount = amount;
            window.setAttributes(lp);
        } else {
            window.clearFlags(2);
        }
        return this;
    }

    public Dialog backgroundColor(int color) {
        this.mCardView.setCardBackgroundColor(color);
        return this;
    }

    public Dialog elevation(float elevation) {
        if (this.mCardView.getMaxCardElevation() < elevation) {
            this.mCardView.setMaxCardElevation(elevation);
        }
        this.mCardView.setCardElevation(elevation);
        return this;
    }

    public Dialog maxElevation(float elevation) {
        this.mCardView.setMaxCardElevation(elevation);
        return this;
    }

    public Dialog cornerRadius(float radius) {
        this.mCardView.setRadius(radius);
        return this;
    }

    public Dialog dividerColor(int color) {
        this.mCardView.setDividerColor(color);
        return this;
    }

    public Dialog dividerHeight(int height) {
        this.mCardView.setDividerHeight(height);
        return this;
    }

    public Dialog title(CharSequence title) {
        this.mTitle.setText(title);
        this.mTitle.setVisibility(TextUtils.isEmpty(title) ? 8 : 0);
        return this;
    }

    public Dialog title(int id) {
        return title(id == 0 ? null : getContext().getResources().getString(id));
    }

    @Override // android.app.Dialog
    public void setTitle(CharSequence title) {
        title(title);
    }

    @Override // android.app.Dialog
    public void setTitle(int titleId) {
        title(titleId);
    }

    public Dialog titleColor(int color) {
        this.mTitle.setTextColor(color);
        return this;
    }

    public Dialog titleTextAppearance(int resId) {
        this.mTitle.setTextAppearance(getContext(), resId);
        return this;
    }

    public Dialog actionBackground(int id) {
        positiveActionBackground(id);
        negativeActionBackground(id);
        neutralActionBackground(id);
        return this;
    }

    public Dialog actionBackground(Drawable drawable) {
        positiveActionBackground(drawable);
        negativeActionBackground(drawable);
        neutralActionBackground(drawable);
        return this;
    }

    public Dialog actionRipple(int resId) {
        positiveActionRipple(resId);
        negativeActionRipple(resId);
        neutralActionRipple(resId);
        return this;
    }

    public Dialog actionTextAppearance(int resId) {
        positiveActionTextAppearance(resId);
        negativeActionTextAppearance(resId);
        neutralActionTextAppearance(resId);
        return this;
    }

    public Dialog actionTextColor(ColorStateList color) {
        positiveActionTextColor(color);
        negativeActionTextColor(color);
        neutralActionTextColor(color);
        return this;
    }

    public Dialog actionTextColor(int color) {
        positiveActionTextColor(color);
        negativeActionTextColor(color);
        neutralActionTextColor(color);
        return this;
    }

    public Dialog positiveAction(CharSequence action) {
        this.mPositiveAction.setText(action);
        this.mPositiveAction.setVisibility(TextUtils.isEmpty(action) ? 8 : 0);
        return this;
    }

    public Dialog positiveAction(int id) {
        return positiveAction(id == 0 ? null : getContext().getResources().getString(id));
    }

    public Dialog positiveActionBackground(Drawable drawable) {
        ViewUtil.setBackground(this.mPositiveAction, drawable);
        return this;
    }

    public Dialog positiveActionBackground(int id) {
        return positiveActionBackground(id == 0 ? null : getContext().getResources().getDrawable(id));
    }

    public Dialog positiveActionRipple(int resId) {
        RippleDrawable drawable = new RippleDrawable.Builder(getContext(), resId).build();
        return positiveActionBackground(drawable);
    }

    public Dialog positiveActionTextAppearance(int resId) {
        this.mPositiveAction.setTextAppearance(getContext(), resId);
        return this;
    }

    public Dialog positiveActionTextColor(ColorStateList color) {
        this.mPositiveAction.setTextColor(color);
        return this;
    }

    public Dialog positiveActionTextColor(int color) {
        this.mPositiveAction.setTextColor(color);
        return this;
    }

    public Dialog positiveActionClickListener(View.OnClickListener listener) {
        this.mPositiveAction.setOnClickListener(listener);
        return this;
    }

    public Dialog negativeAction(CharSequence action) {
        this.mNegativeAction.setText(action);
        this.mNegativeAction.setVisibility(TextUtils.isEmpty(action) ? 8 : 0);
        return this;
    }

    public Dialog negativeAction(int id) {
        return negativeAction(id == 0 ? null : getContext().getResources().getString(id));
    }

    public Dialog negativeActionBackground(Drawable drawable) {
        ViewUtil.setBackground(this.mNegativeAction, drawable);
        return this;
    }

    public Dialog negativeActionBackground(int id) {
        return negativeActionBackground(id == 0 ? null : getContext().getResources().getDrawable(id));
    }

    public Dialog negativeActionRipple(int resId) {
        RippleDrawable drawable = new RippleDrawable.Builder(getContext(), resId).build();
        return negativeActionBackground(drawable);
    }

    public Dialog negativeActionTextAppearance(int resId) {
        this.mNegativeAction.setTextAppearance(getContext(), resId);
        return this;
    }

    public Dialog negativeActionTextColor(ColorStateList color) {
        this.mNegativeAction.setTextColor(color);
        return this;
    }

    public Dialog negativeActionTextColor(int color) {
        this.mNegativeAction.setTextColor(color);
        return this;
    }

    public Dialog negativeActionClickListener(View.OnClickListener listener) {
        this.mNegativeAction.setOnClickListener(listener);
        return this;
    }

    public Dialog neutralAction(CharSequence action) {
        this.mNeutralAction.setText(action);
        this.mNeutralAction.setVisibility(TextUtils.isEmpty(action) ? 8 : 0);
        return this;
    }

    public Dialog neutralAction(int id) {
        return neutralAction(id == 0 ? null : getContext().getResources().getString(id));
    }

    public Dialog neutralActionBackground(Drawable drawable) {
        ViewUtil.setBackground(this.mNeutralAction, drawable);
        return this;
    }

    public Dialog neutralActionBackground(int id) {
        return neutralActionBackground(id == 0 ? null : getContext().getResources().getDrawable(id));
    }

    public Dialog neutralActionRipple(int resId) {
        RippleDrawable drawable = new RippleDrawable.Builder(getContext(), resId).build();
        return neutralActionBackground(drawable);
    }

    public Dialog neutralActionTextAppearance(int resId) {
        this.mNeutralAction.setTextAppearance(getContext(), resId);
        return this;
    }

    public Dialog neutralActionTextColor(ColorStateList color) {
        this.mNeutralAction.setTextColor(color);
        return this;
    }

    public Dialog neutralActionTextColor(int color) {
        this.mNeutralAction.setTextColor(color);
        return this;
    }

    public Dialog neutralActionClickListener(View.OnClickListener listener) {
        this.mNeutralAction.setOnClickListener(listener);
        return this;
    }

    public Dialog layoutDirection(int direction) {
        ViewCompat.setLayoutDirection(this.mCardView, direction);
        return this;
    }

    public Dialog inAnimation(int resId) {
        this.mInAnimationId = resId;
        return this;
    }

    public Dialog outAnimation(int resId) {
        this.mOutAnimationId = resId;
        return this;
    }

    public Dialog showDivider(boolean show) {
        this.mCardView.setShowDivider(show);
        return this;
    }

    public Dialog contentView(View v) {
        if (this.mContent != v) {
            if (this.mContent != null) {
                this.mCardView.removeView(this.mContent);
            }
            this.mContent = v;
        }
        if (this.mContent != null) {
            this.mCardView.addView(this.mContent);
        }
        return this;
    }

    public Dialog contentView(int layoutId) {
        if (layoutId == 0) {
            return this;
        }
        View v = LayoutInflater.from(getContext()).inflate(layoutId, (ViewGroup) null);
        return contentView(v);
    }

    public Dialog cancelable(boolean cancelable) {
        super.setCancelable(cancelable);
        this.mCancelable = cancelable;
        return this;
    }

    public Dialog canceledOnTouchOutside(boolean cancel) {
        super.setCanceledOnTouchOutside(cancel);
        this.mCanceledOnTouchOutside = cancel;
        return this;
    }

    public Dialog contentMargin(int margin) {
        this.mCardView.setContentMargin(margin);
        return this;
    }

    public Dialog contentMargin(int left, int top, int right, int bottom) {
        this.mCardView.setContentMargin(left, top, right, bottom);
        return this;
    }

    @Override // android.app.Dialog
    public void setCancelable(boolean flag) {
        cancelable(flag);
    }

    @Override // android.app.Dialog
    public void setCanceledOnTouchOutside(boolean cancel) {
        canceledOnTouchOutside(cancel);
    }

    @Override // android.app.Dialog
    public void setContentView(View v) {
        contentView(v);
    }

    @Override // android.app.Dialog
    public void setContentView(int layoutId) {
        contentView(layoutId);
    }

    @Override // android.app.Dialog
    public void setContentView(View v, ViewGroup.LayoutParams params) {
        contentView(v);
    }

    @Override // android.app.Dialog
    public void addContentView(View view, ViewGroup.LayoutParams params) {
        contentView(view);
    }

    @Override // android.app.Dialog
    protected void onStart() {
        super.onStart();
        this.mCardView.setVisibility(0);
        if (this.mInAnimationId != 0) {
            this.mCardView.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.rey.material.app.Dialog.2
                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    Dialog.this.mCardView.getViewTreeObserver().removeOnPreDrawListener(this);
                    Animation anim = AnimationUtils.loadAnimation(Dialog.this.mCardView.getContext(), Dialog.this.mInAnimationId);
                    Dialog.this.mCardView.startAnimation(anim);
                    return false;
                }
            });
        }
    }

    public void dismissImmediately() {
        super.dismiss();
        if (this.mHandler != null) {
            this.mHandler.removeCallbacks(this.mDismissAction);
        }
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public void dismiss() {
        if (!isShowing()) {
            return;
        }
        if (this.mOutAnimationId != 0) {
            Animation anim = AnimationUtils.loadAnimation(this.mContainer.getContext(), this.mOutAnimationId);
            anim.setAnimationListener(new Animation.AnimationListener() { // from class: com.rey.material.app.Dialog.3
                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationStart(Animation animation) {
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationRepeat(Animation animation) {
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationEnd(Animation animation) {
                    Dialog.this.mCardView.setVisibility(8);
                    Dialog.this.mHandler.post(Dialog.this.mDismissAction);
                }
            });
            this.mCardView.startAnimation(anim);
            return;
        }
        this.mHandler.post(this.mDismissAction);
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/Dialog$ContainerFrameLayout.class */
    private class ContainerFrameLayout extends FrameLayout {
        private boolean mClickOutside;

        public ContainerFrameLayout(Context context) {
            super(context);
            this.mClickOutside = false;
        }

        @Override // android.widget.FrameLayout, android.view.View
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int widthSize = View.MeasureSpec.getSize(widthMeasureSpec);
            int heightSize = View.MeasureSpec.getSize(heightMeasureSpec);
            Dialog.this.mCardView.measure(widthMeasureSpec, heightMeasureSpec);
            setMeasuredDimension(widthSize, heightSize);
        }

        @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
        protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
            int childLeft = ((right - left) - Dialog.this.mCardView.getMeasuredWidth()) / 2;
            int childTop = ((bottom - top) - Dialog.this.mCardView.getMeasuredHeight()) / 2;
            int childRight = childLeft + Dialog.this.mCardView.getMeasuredWidth();
            int childBottom = childTop + Dialog.this.mCardView.getMeasuredHeight();
            Dialog.this.mCardView.layout(childLeft, childTop, childRight, childBottom);
        }

        private boolean isOutsideDialog(float x, float y) {
            return x < ((float) (Dialog.this.mCardView.getLeft() + Dialog.this.mCardView.getPaddingLeft())) || x > ((float) (Dialog.this.mCardView.getRight() - Dialog.this.mCardView.getPaddingRight())) || y < ((float) (Dialog.this.mCardView.getTop() + Dialog.this.mCardView.getPaddingTop())) || y > ((float) (Dialog.this.mCardView.getBottom() - Dialog.this.mCardView.getPaddingBottom()));
        }

        @Override // android.view.View
        public boolean onTouchEvent(MotionEvent event) {
            boolean handled = super.onTouchEvent(event);
            if (handled) {
                return true;
            }
            switch (event.getAction()) {
                case 0:
                    if (isOutsideDialog(event.getX(), event.getY())) {
                        this.mClickOutside = true;
                        break;
                    }
                    break;
                case 1:
                    if (this.mClickOutside && isOutsideDialog(event.getX(), event.getY())) {
                        this.mClickOutside = false;
                        if (Dialog.this.mCancelable && Dialog.this.mCanceledOnTouchOutside) {
                            Dialog.this.dismiss();
                            break;
                        }
                    }
                    break;
                case 3:
                    this.mClickOutside = false;
                    break;
            }
            return true;
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/Dialog$DialogCardView.class */
    private class DialogCardView extends CardView {
        private Paint mDividerPaint;
        private float mDividerPos;
        private boolean mShowDivider;
        private int mContentMarginLeft;
        private int mContentMarginTop;
        private int mContentMarginRight;
        private int mContentMarginBottom;
        private boolean mIsRtl;

        public DialogCardView(Context context) {
            super(context);
            this.mDividerPos = -1.0f;
            this.mShowDivider = false;
            this.mIsRtl = false;
            this.mDividerPaint = new Paint(1);
            this.mDividerPaint.setStyle(Paint.Style.STROKE);
            setWillNotDraw(false);
        }

        public void setContentMargin(int margin) {
            setContentMargin(margin, margin, margin, margin);
        }

        public void setContentMargin(int left, int top, int right, int bottom) {
            this.mContentMarginLeft = left;
            this.mContentMarginTop = top;
            this.mContentMarginRight = right;
            this.mContentMarginBottom = bottom;
        }

        public void setDividerColor(int color) {
            this.mDividerPaint.setColor(color);
            invalidate();
        }

        public void setDividerHeight(int height) {
            this.mDividerPaint.setStrokeWidth(height);
            invalidate();
        }

        public void setShowDivider(boolean show) {
            if (this.mShowDivider != show) {
                this.mShowDivider = show;
                invalidate();
            }
        }

        @TargetApi(17)
        public void onRtlPropertiesChanged(int layoutDirection) {
            boolean rtl = layoutDirection == 1;
            if (this.mIsRtl != rtl) {
                this.mIsRtl = rtl;
                if (Build.VERSION.SDK_INT >= 17) {
                    int direction = this.mIsRtl ? 4 : 3;
                    Dialog.this.mTitle.setTextDirection(direction);
                    Dialog.this.mPositiveAction.setTextDirection(direction);
                    Dialog.this.mNegativeAction.setTextDirection(direction);
                    Dialog.this.mNeutralAction.setTextDirection(direction);
                }
                requestLayout();
            }
        }

        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int nonContentHeight;
            int widthSize = View.MeasureSpec.getSize(widthMeasureSpec);
            int heightSize = View.MeasureSpec.getSize(heightMeasureSpec);
            int paddingLeft = Math.max(Dialog.this.mDialogHorizontalPadding, Dialog.this.mCardView.getPaddingLeft());
            int paddingRight = Math.max(Dialog.this.mDialogHorizontalPadding, Dialog.this.mCardView.getPaddingRight());
            int paddingTop = Math.max(Dialog.this.mDialogVerticalPadding, Dialog.this.mCardView.getPaddingTop());
            int paddingBottom = Math.max(Dialog.this.mDialogVerticalPadding, Dialog.this.mCardView.getPaddingBottom());
            int maxWidth = (widthSize - paddingLeft) - paddingRight;
            if (Dialog.this.mMaxWidth > 0) {
                maxWidth = Math.min(maxWidth, Dialog.this.mMaxWidth);
            }
            int maxHeight = (heightSize - paddingTop) - paddingBottom;
            if (Dialog.this.mMaxHeight > 0) {
                maxHeight = Math.min(maxHeight, Dialog.this.mMaxHeight);
            }
            int width = Dialog.this.mLayoutWidth == -1 ? maxWidth : Dialog.this.mLayoutWidth;
            int height = Dialog.this.mLayoutHeight == -1 ? maxHeight : Dialog.this.mLayoutHeight;
            int titleWidth = 0;
            int titleHeight = 0;
            if (Dialog.this.mTitle.getVisibility() == 0) {
                int widthMs = View.MeasureSpec.makeMeasureSpec(width == -2 ? maxWidth : width, ThemeManager.THEME_UNDEFINED);
                Dialog.this.mTitle.measure(widthMs, View.MeasureSpec.makeMeasureSpec(maxHeight, ThemeManager.THEME_UNDEFINED));
                titleWidth = Dialog.this.mTitle.getMeasuredWidth();
                titleHeight = Dialog.this.mTitle.getMeasuredHeight();
            }
            int contentWidth = 0;
            int contentHeight = 0;
            if (Dialog.this.mContent != null) {
                int widthMs2 = View.MeasureSpec.makeMeasureSpec(((width == -2 ? maxWidth : width) - this.mContentMarginLeft) - this.mContentMarginRight, ThemeManager.THEME_UNDEFINED);
                Dialog.this.mContent.measure(widthMs2, View.MeasureSpec.makeMeasureSpec((maxHeight - this.mContentMarginTop) - this.mContentMarginBottom, ThemeManager.THEME_UNDEFINED));
                contentWidth = Dialog.this.mContent.getMeasuredWidth();
                contentHeight = Dialog.this.mContent.getMeasuredHeight();
            }
            int visibleActions = 0;
            int positiveActionWidth = 0;
            if (Dialog.this.mPositiveAction.getVisibility() == 0) {
                int widthMs3 = View.MeasureSpec.makeMeasureSpec(0, 0);
                int heightMs = View.MeasureSpec.makeMeasureSpec(Dialog.this.mActionHeight, 1073741824);
                Dialog.this.mPositiveAction.measure(widthMs3, heightMs);
                positiveActionWidth = Dialog.this.mPositiveAction.getMeasuredWidth();
                if (positiveActionWidth < Dialog.this.mActionMinWidth) {
                    Dialog.this.mPositiveAction.measure(View.MeasureSpec.makeMeasureSpec(Dialog.this.mActionMinWidth, 1073741824), heightMs);
                    positiveActionWidth = Dialog.this.mActionMinWidth;
                }
                visibleActions = 0 + 1;
            }
            int negativeActionWidth = 0;
            if (Dialog.this.mNegativeAction.getVisibility() == 0) {
                int widthMs4 = View.MeasureSpec.makeMeasureSpec(0, 0);
                int heightMs2 = View.MeasureSpec.makeMeasureSpec(Dialog.this.mActionHeight, 1073741824);
                Dialog.this.mNegativeAction.measure(widthMs4, heightMs2);
                negativeActionWidth = Dialog.this.mNegativeAction.getMeasuredWidth();
                if (negativeActionWidth < Dialog.this.mActionMinWidth) {
                    Dialog.this.mNegativeAction.measure(View.MeasureSpec.makeMeasureSpec(Dialog.this.mActionMinWidth, 1073741824), heightMs2);
                    negativeActionWidth = Dialog.this.mActionMinWidth;
                }
                visibleActions++;
            }
            int neutralActionWidth = 0;
            if (Dialog.this.mNeutralAction.getVisibility() == 0) {
                int widthMs5 = View.MeasureSpec.makeMeasureSpec(0, 0);
                int heightMs3 = View.MeasureSpec.makeMeasureSpec(Dialog.this.mActionHeight, 1073741824);
                Dialog.this.mNeutralAction.measure(widthMs5, heightMs3);
                neutralActionWidth = Dialog.this.mNeutralAction.getMeasuredWidth();
                if (neutralActionWidth < Dialog.this.mActionMinWidth) {
                    Dialog.this.mNeutralAction.measure(View.MeasureSpec.makeMeasureSpec(Dialog.this.mActionMinWidth, 1073741824), heightMs3);
                    neutralActionWidth = Dialog.this.mActionMinWidth;
                }
                visibleActions++;
            }
            int actionBarWidth = positiveActionWidth + negativeActionWidth + neutralActionWidth + (Dialog.this.mActionOuterPadding * 2) + (Dialog.this.mActionPadding * Math.max(0, visibleActions - 1));
            if (width == -2) {
                width = Math.min(maxWidth, Math.max(titleWidth, Math.max(contentWidth + this.mContentMarginLeft + this.mContentMarginRight, actionBarWidth)));
            }
            Dialog.this.mLayoutActionVertical = actionBarWidth > width;
            int nonContentHeight2 = titleHeight + (visibleActions > 0 ? Dialog.this.mActionPadding : 0) + this.mContentMarginTop + this.mContentMarginBottom;
            if (Dialog.this.mLayoutActionVertical) {
                nonContentHeight = nonContentHeight2 + (Dialog.this.mActionOuterHeight * visibleActions);
            } else {
                nonContentHeight = nonContentHeight2 + (visibleActions > 0 ? Dialog.this.mActionOuterHeight : 0);
            }
            if (height == -2) {
                height = Math.min(maxHeight, contentHeight + nonContentHeight);
            }
            if (Dialog.this.mContent != null) {
                Dialog.this.mContent.measure(View.MeasureSpec.makeMeasureSpec((width - this.mContentMarginLeft) - this.mContentMarginRight, 1073741824), View.MeasureSpec.makeMeasureSpec(height - nonContentHeight, 1073741824));
            }
            setMeasuredDimension(width + getPaddingLeft() + getPaddingRight(), height + getPaddingTop() + getPaddingBottom());
        }

        protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
            int childLeft = 0 + getPaddingLeft();
            int childTop = 0 + getPaddingTop();
            int childRight = (right - left) - getPaddingRight();
            int childBottom = (bottom - top) - getPaddingBottom();
            if (Dialog.this.mTitle.getVisibility() == 0) {
                if (this.mIsRtl) {
                    Dialog.this.mTitle.layout(childRight - Dialog.this.mTitle.getMeasuredWidth(), childTop, childRight, childTop + Dialog.this.mTitle.getMeasuredHeight());
                } else {
                    Dialog.this.mTitle.layout(childLeft, childTop, childLeft + Dialog.this.mTitle.getMeasuredWidth(), childTop + Dialog.this.mTitle.getMeasuredHeight());
                }
                childTop += Dialog.this.mTitle.getMeasuredHeight();
            }
            boolean hasAction = Dialog.this.mNeutralAction.getVisibility() == 0 || Dialog.this.mNegativeAction.getVisibility() == 0 || Dialog.this.mPositiveAction.getVisibility() == 0;
            if (hasAction) {
                childBottom -= Dialog.this.mActionPadding;
            }
            int temp = (Dialog.this.mActionOuterHeight - Dialog.this.mActionHeight) / 2;
            if (hasAction) {
                if (Dialog.this.mLayoutActionVertical) {
                    if (Dialog.this.mNeutralAction.getVisibility() == 0) {
                        Dialog.this.mNeutralAction.layout((childRight - Dialog.this.mActionOuterPadding) - Dialog.this.mNeutralAction.getMeasuredWidth(), (childBottom - Dialog.this.mActionOuterHeight) + temp, childRight - Dialog.this.mActionOuterPadding, childBottom - temp);
                        childBottom -= Dialog.this.mActionOuterHeight;
                    }
                    if (Dialog.this.mNegativeAction.getVisibility() == 0) {
                        Dialog.this.mNegativeAction.layout((childRight - Dialog.this.mActionOuterPadding) - Dialog.this.mNegativeAction.getMeasuredWidth(), (childBottom - Dialog.this.mActionOuterHeight) + temp, childRight - Dialog.this.mActionOuterPadding, childBottom - temp);
                        childBottom -= Dialog.this.mActionOuterHeight;
                    }
                    if (Dialog.this.mPositiveAction.getVisibility() == 0) {
                        Dialog.this.mPositiveAction.layout((childRight - Dialog.this.mActionOuterPadding) - Dialog.this.mPositiveAction.getMeasuredWidth(), (childBottom - Dialog.this.mActionOuterHeight) + temp, childRight - Dialog.this.mActionOuterPadding, childBottom - temp);
                        childBottom -= Dialog.this.mActionOuterHeight;
                    }
                } else {
                    int actionLeft = childLeft + Dialog.this.mActionOuterPadding;
                    int actionRight = childRight - Dialog.this.mActionOuterPadding;
                    int actionTop = (childBottom - Dialog.this.mActionOuterHeight) + temp;
                    int actionBottom = childBottom - temp;
                    if (this.mIsRtl) {
                        if (Dialog.this.mPositiveAction.getVisibility() == 0) {
                            Dialog.this.mPositiveAction.layout(actionLeft, actionTop, actionLeft + Dialog.this.mPositiveAction.getMeasuredWidth(), actionBottom);
                            actionLeft += Dialog.this.mPositiveAction.getMeasuredWidth() + Dialog.this.mActionPadding;
                        }
                        if (Dialog.this.mNegativeAction.getVisibility() == 0) {
                            Dialog.this.mNegativeAction.layout(actionLeft, actionTop, actionLeft + Dialog.this.mNegativeAction.getMeasuredWidth(), actionBottom);
                        }
                        if (Dialog.this.mNeutralAction.getVisibility() == 0) {
                            Dialog.this.mNeutralAction.layout(actionRight - Dialog.this.mNeutralAction.getMeasuredWidth(), actionTop, actionRight, actionBottom);
                        }
                    } else {
                        if (Dialog.this.mPositiveAction.getVisibility() == 0) {
                            Dialog.this.mPositiveAction.layout(actionRight - Dialog.this.mPositiveAction.getMeasuredWidth(), actionTop, actionRight, actionBottom);
                            actionRight -= Dialog.this.mPositiveAction.getMeasuredWidth() + Dialog.this.mActionPadding;
                        }
                        if (Dialog.this.mNegativeAction.getVisibility() == 0) {
                            Dialog.this.mNegativeAction.layout(actionRight - Dialog.this.mNegativeAction.getMeasuredWidth(), actionTop, actionRight, actionBottom);
                        }
                        if (Dialog.this.mNeutralAction.getVisibility() == 0) {
                            Dialog.this.mNeutralAction.layout(actionLeft, actionTop, actionLeft + Dialog.this.mNeutralAction.getMeasuredWidth(), actionBottom);
                        }
                    }
                    childBottom -= Dialog.this.mActionOuterHeight;
                }
            }
            this.mDividerPos = childBottom - (this.mDividerPaint.getStrokeWidth() / 2.0f);
            if (Dialog.this.mContent != null) {
                Dialog.this.mContent.layout(childLeft + this.mContentMarginLeft, childTop + this.mContentMarginTop, childRight - this.mContentMarginRight, childBottom - this.mContentMarginBottom);
            }
        }

        public void draw(Canvas canvas) {
            super.draw(canvas);
            if (this.mShowDivider) {
                if (Dialog.this.mPositiveAction.getVisibility() == 0 || Dialog.this.mNegativeAction.getVisibility() == 0 || Dialog.this.mNeutralAction.getVisibility() == 0) {
                    canvas.drawLine(getPaddingLeft(), this.mDividerPos, getWidth() - getPaddingRight(), this.mDividerPos, this.mDividerPaint);
                }
            }
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/Dialog$Builder.class */
    public static class Builder implements DialogFragment.Builder, Parcelable {
        protected int mStyleId;
        protected int mContentViewId;
        protected CharSequence mTitle;
        protected CharSequence mPositive;
        protected CharSequence mNegative;
        protected CharSequence mNeutral;
        protected Dialog mDialog;
        public static final Parcelable.Creator<Builder> CREATOR = new Parcelable.Creator<Builder>() { // from class: com.rey.material.app.Dialog.Builder.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public Builder createFromParcel(Parcel in) {
                return new Builder(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public Builder[] newArray(int size) {
                return new Builder[size];
            }
        };

        public Builder() {
            this(R.style.Material_App_Dialog_Light);
        }

        public Builder(int styleId) {
            this.mStyleId = styleId;
        }

        public Builder style(int styleId) {
            this.mStyleId = styleId;
            return this;
        }

        public Builder contentView(int layoutId) {
            this.mContentViewId = layoutId;
            return this;
        }

        public Builder title(CharSequence title) {
            this.mTitle = title;
            return this;
        }

        public Builder positiveAction(CharSequence action) {
            this.mPositive = action;
            return this;
        }

        public Builder negativeAction(CharSequence action) {
            this.mNegative = action;
            return this;
        }

        public Builder neutralAction(CharSequence action) {
            this.mNeutral = action;
            return this;
        }

        public Dialog getDialog() {
            return this.mDialog;
        }

        @Override // com.rey.material.app.DialogFragment.Builder
        public void onPositiveActionClicked(DialogFragment fragment) {
            fragment.dismiss();
        }

        @Override // com.rey.material.app.DialogFragment.Builder
        public void onNegativeActionClicked(DialogFragment fragment) {
            fragment.dismiss();
        }

        @Override // com.rey.material.app.DialogFragment.Builder
        public void onNeutralActionClicked(DialogFragment fragment) {
            fragment.dismiss();
        }

        @Override // com.rey.material.app.DialogFragment.Builder
        public void onCancel(DialogInterface dialog) {
        }

        @Override // com.rey.material.app.DialogFragment.Builder
        public void onDismiss(DialogInterface dialog) {
        }

        @Override // com.rey.material.app.DialogFragment.Builder
        public Dialog build(Context context) {
            this.mDialog = onBuild(context, this.mStyleId);
            this.mDialog.title(this.mTitle).positiveAction(this.mPositive).negativeAction(this.mNegative).neutralAction(this.mNeutral);
            if (this.mContentViewId != 0) {
                this.mDialog.contentView(this.mContentViewId);
            }
            onBuildDone(this.mDialog);
            return this.mDialog;
        }

        protected Dialog onBuild(Context context, int styleId) {
            return new Dialog(context, styleId);
        }

        protected void onBuildDone(Dialog dialog) {
        }

        protected Builder(Parcel in) {
            this.mStyleId = in.readInt();
            this.mContentViewId = in.readInt();
            this.mTitle = (CharSequence) in.readParcelable(null);
            this.mPositive = (CharSequence) in.readParcelable(null);
            this.mNegative = (CharSequence) in.readParcelable(null);
            this.mNeutral = (CharSequence) in.readParcelable(null);
            onReadFromParcel(in);
        }

        protected void onReadFromParcel(Parcel in) {
        }

        protected void onWriteToParcel(Parcel dest, int flags) {
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            dest.writeInt(this.mStyleId);
            dest.writeInt(this.mContentViewId);
            dest.writeValue(this.mTitle);
            dest.writeValue(this.mPositive);
            dest.writeValue(this.mNegative);
            dest.writeValue(this.mNeutral);
            onWriteToParcel(dest, flags);
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }
    }
}
