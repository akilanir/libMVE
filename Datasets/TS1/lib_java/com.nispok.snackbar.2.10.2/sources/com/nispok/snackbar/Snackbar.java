package com.nispok.snackbar;

import android.R;
import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.text.TextUtils;
import android.view.Display;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.AbsListView;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.nispok.snackbar.enums.SnackbarType;
import com.nispok.snackbar.layouts.SnackbarLayout;
import com.nispok.snackbar.listeners.ActionClickListener;
import com.nispok.snackbar.listeners.ActionSwipeListener;
import com.nispok.snackbar.listeners.EventListener;
import com.nispok.snackbar.listeners.SwipeDismissTouchListener;

/*  JADX ERROR: NullPointerException in pass: ClassModifier
    java.lang.NullPointerException: Cannot invoke "java.util.List.forEach(java.util.function.Consumer)" because "blocks" is null
    	at jadx.core.utils.BlockUtils.collectAllInsns(BlockUtils.java:1029)
    	at jadx.core.dex.visitors.ClassModifier.removeBridgeMethod(ClassModifier.java:245)
    	at jadx.core.dex.visitors.ClassModifier.removeSyntheticMethods(ClassModifier.java:160)
    	at java.base/java.util.ArrayList.forEach(ArrayList.java:1511)
    	at jadx.core.dex.visitors.ClassModifier.visit(ClassModifier.java:65)
    */
/* loaded from: com.nispok.snackbar.2.10.2.jar:com/nispok/snackbar/Snackbar.class */
public class Snackbar extends SnackbarLayout {
    private int mUndefinedColor;
    private int mUndefinedDrawable;
    private SnackbarType mType;
    private SnackbarDuration mDuration;
    private CharSequence mText;
    private TextView snackbarText;
    private int mColor;
    private int mTextColor;
    private int mOffset;
    private SnackbarPosition mPosition;
    private int mDrawable;
    private int mMarginTop;
    private int mMarginBottom;
    private int mMarginLeft;
    private int mMarginRight;
    private long mSnackbarStart;
    private long mSnackbarFinish;
    private long mTimeRemaining;
    private CharSequence mActionLabel;
    private int mActionColor;
    private boolean mAnimated;
    private boolean mIsReplacePending;
    private boolean mIsShowingByReplace;
    private long mCustomDuration;
    private ActionClickListener mActionClickListener;
    private ActionSwipeListener mActionSwipeListener;
    private boolean mShouldAllowMultipleActionClicks;
    private boolean mActionClicked;
    private boolean mShouldDismissOnActionClicked;
    private EventListener mEventListener;
    private Typeface mTextTypeface;
    private Typeface mActionTypeface;
    private boolean mIsShowing;
    private boolean mCanSwipeToDismiss;
    private boolean mIsDismissing;
    private Rect mWindowInsets;
    private Rect mDisplayFrame;
    private Point mDisplaySize;
    private Point mRealDisplaySize;
    private Activity mTargetActivity;
    private Float mMaxWidthPercentage;
    private boolean mUsePhoneLayout;
    private Runnable mDismissRunnable;
    private Runnable mRefreshLayoutParamsMarginsRunnable;

    /*  JADX ERROR: Failed to decode insn: 0x0002: MOVE_MULTI
        java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[6]
        	at java.base/java.lang.System.arraycopy(Native Method)
        	at jadx.plugins.input.java.data.code.StackState.insert(StackState.java:52)
        	at jadx.plugins.input.java.data.code.CodeDecodeState.insert(CodeDecodeState.java:137)
        	at jadx.plugins.input.java.data.code.JavaInsnsRegister.dup2x1(JavaInsnsRegister.java:313)
        	at jadx.plugins.input.java.data.code.JavaInsnData.decode(JavaInsnData.java:46)
        	at jadx.core.dex.instructions.InsnDecoder.lambda$process$0(InsnDecoder.java:50)
        	at jadx.plugins.input.java.data.code.JavaCodeReader.visitInstructions(JavaCodeReader.java:85)
        	at jadx.core.dex.instructions.InsnDecoder.process(InsnDecoder.java:46)
        	at jadx.core.dex.nodes.MethodNode.load(MethodNode.java:157)
        	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:458)
        	at jadx.core.ProcessClass.process(ProcessClass.java:69)
        	at jadx.core.ProcessClass.generateCode(ProcessClass.java:109)
        	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
        	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
        	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
        */
    static /* synthetic */ long access$902(com.nispok.snackbar.Snackbar r6, long r7) {
        /*
            r0 = r6
            r1 = r7
            // decode failed: arraycopy: source index -1 out of bounds for object array[6]
            r0.mSnackbarFinish = r1
            return r-1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.nispok.snackbar.Snackbar.access$902(com.nispok.snackbar.Snackbar, long):long");
    }

    /*  JADX ERROR: Failed to decode insn: 0x0002: MOVE_MULTI
        java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[6]
        	at java.base/java.lang.System.arraycopy(Native Method)
        	at jadx.plugins.input.java.data.code.StackState.insert(StackState.java:52)
        	at jadx.plugins.input.java.data.code.CodeDecodeState.insert(CodeDecodeState.java:137)
        	at jadx.plugins.input.java.data.code.JavaInsnsRegister.dup2x1(JavaInsnsRegister.java:313)
        	at jadx.plugins.input.java.data.code.JavaInsnData.decode(JavaInsnData.java:46)
        	at jadx.core.dex.instructions.InsnDecoder.lambda$process$0(InsnDecoder.java:50)
        	at jadx.plugins.input.java.data.code.JavaCodeReader.visitInstructions(JavaCodeReader.java:85)
        	at jadx.core.dex.instructions.InsnDecoder.process(InsnDecoder.java:46)
        	at jadx.core.dex.nodes.MethodNode.load(MethodNode.java:157)
        	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:458)
        	at jadx.core.ProcessClass.process(ProcessClass.java:69)
        	at jadx.core.ProcessClass.generateCode(ProcessClass.java:109)
        	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
        	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
        	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
        */
    static /* synthetic */ long access$1002(com.nispok.snackbar.Snackbar r6, long r7) {
        /*
            r0 = r6
            r1 = r7
            // decode failed: arraycopy: source index -1 out of bounds for object array[6]
            r0.mTimeRemaining = r1
            return r-1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.nispok.snackbar.Snackbar.access$1002(com.nispok.snackbar.Snackbar, long):long");
    }

    /*  JADX ERROR: Failed to decode insn: 0x0002: MOVE_MULTI
        java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[6]
        	at java.base/java.lang.System.arraycopy(Native Method)
        	at jadx.plugins.input.java.data.code.StackState.insert(StackState.java:52)
        	at jadx.plugins.input.java.data.code.CodeDecodeState.insert(CodeDecodeState.java:137)
        	at jadx.plugins.input.java.data.code.JavaInsnsRegister.dup2x1(JavaInsnsRegister.java:313)
        	at jadx.plugins.input.java.data.code.JavaInsnData.decode(JavaInsnData.java:46)
        	at jadx.core.dex.instructions.InsnDecoder.lambda$process$0(InsnDecoder.java:50)
        	at jadx.plugins.input.java.data.code.JavaCodeReader.visitInstructions(JavaCodeReader.java:85)
        	at jadx.core.dex.instructions.InsnDecoder.process(InsnDecoder.java:46)
        	at jadx.core.dex.nodes.MethodNode.load(MethodNode.java:157)
        	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:458)
        	at jadx.core.ProcessClass.process(ProcessClass.java:69)
        	at jadx.core.ProcessClass.generateCode(ProcessClass.java:109)
        	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
        	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
        	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
        */
    static /* synthetic */ long access$1102(com.nispok.snackbar.Snackbar r6, long r7) {
        /*
            r0 = r6
            r1 = r7
            // decode failed: arraycopy: source index -1 out of bounds for object array[6]
            r0.mSnackbarStart = r1
            return r-1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.nispok.snackbar.Snackbar.access$1102(com.nispok.snackbar.Snackbar, long):long");
    }

    /* loaded from: com.nispok.snackbar.2.10.2.jar:com/nispok/snackbar/Snackbar$SnackbarDuration.class */
    public enum SnackbarDuration {
        LENGTH_SHORT(2000),
        LENGTH_LONG(3500),
        LENGTH_INDEFINITE(-1);

        private long duration;

        SnackbarDuration(long duration) {
            this.duration = duration;
        }

        public long getDuration() {
            return this.duration;
        }
    }

    /* loaded from: com.nispok.snackbar.2.10.2.jar:com/nispok/snackbar/Snackbar$SnackbarPosition.class */
    public enum SnackbarPosition {
        TOP(48),
        BOTTOM(80);

        private int layoutGravity;

        SnackbarPosition(int layoutGravity) {
            this.layoutGravity = layoutGravity;
        }

        public int getLayoutGravity() {
            return this.layoutGravity;
        }
    }

    private Snackbar(Context context) {
        super(context);
        this.mUndefinedColor = -10000;
        this.mUndefinedDrawable = -10000;
        this.mType = SnackbarType.SINGLE_LINE;
        this.mDuration = SnackbarDuration.LENGTH_LONG;
        this.mColor = this.mUndefinedColor;
        this.mTextColor = this.mUndefinedColor;
        this.mPosition = SnackbarPosition.BOTTOM;
        this.mDrawable = this.mUndefinedDrawable;
        this.mMarginTop = 0;
        this.mMarginBottom = 0;
        this.mMarginLeft = 0;
        this.mMarginRight = 0;
        this.mTimeRemaining = -1L;
        this.mActionColor = this.mUndefinedColor;
        this.mAnimated = true;
        this.mIsReplacePending = false;
        this.mIsShowingByReplace = false;
        this.mCustomDuration = -1L;
        this.mShouldDismissOnActionClicked = true;
        this.mIsShowing = false;
        this.mCanSwipeToDismiss = true;
        this.mIsDismissing = false;
        this.mWindowInsets = new Rect();
        this.mDisplayFrame = new Rect();
        this.mDisplaySize = new Point();
        this.mRealDisplaySize = new Point();
        this.mMaxWidthPercentage = null;
        this.mDismissRunnable = new Runnable() { // from class: com.nispok.snackbar.Snackbar.1
            @Override // java.lang.Runnable
            public void run() {
                Snackbar.this.dismiss();
            }
        };
        this.mRefreshLayoutParamsMarginsRunnable = new Runnable() { // from class: com.nispok.snackbar.Snackbar.2
            @Override // java.lang.Runnable
            public void run() {
                Snackbar.this.refreshLayoutParamsMargins();
            }
        };
        if (Build.VERSION.SDK_INT >= 16) {
            addView(new SnackbarHelperChildViewJB(getContext()));
        }
    }

    public static Snackbar with(Context context) {
        return new Snackbar(context);
    }

    public Snackbar type(SnackbarType type) {
        this.mType = type;
        return this;
    }

    public Snackbar text(CharSequence text) {
        this.mText = text;
        if (this.snackbarText != null) {
            this.snackbarText.setText(this.mText);
        }
        return this;
    }

    public Snackbar text(int resId) {
        return text(getContext().getText(resId));
    }

    public Snackbar color(int color) {
        this.mColor = color;
        return this;
    }

    public Snackbar colorResource(int resId) {
        return color(getResources().getColor(resId));
    }

    public Snackbar backgroundDrawable(int resId) {
        this.mDrawable = resId;
        return this;
    }

    public Snackbar textColor(int textColor) {
        this.mTextColor = textColor;
        return this;
    }

    public Snackbar textColorResource(int resId) {
        return textColor(getResources().getColor(resId));
    }

    public Snackbar actionLabel(CharSequence actionButtonLabel) {
        this.mActionLabel = actionButtonLabel;
        return this;
    }

    public Snackbar actionLabel(int resId) {
        return actionLabel(getContext().getString(resId));
    }

    public Snackbar position(SnackbarPosition position) {
        this.mPosition = position;
        return this;
    }

    public Snackbar margin(int margin) {
        return margin(margin, margin, margin, margin);
    }

    public Snackbar margin(int marginLR, int marginTB) {
        return margin(marginLR, marginTB, marginLR, marginTB);
    }

    public Snackbar margin(int marginLeft, int marginTop, int marginRight, int marginBottom) {
        this.mMarginLeft = marginLeft;
        this.mMarginTop = marginTop;
        this.mMarginBottom = marginBottom;
        this.mMarginRight = marginRight;
        return this;
    }

    public Snackbar actionColor(int actionColor) {
        this.mActionColor = actionColor;
        return this;
    }

    public Snackbar actionColorResource(int resId) {
        return actionColor(getResources().getColor(resId));
    }

    public Snackbar dismissOnActionClicked(boolean shouldDismiss) {
        this.mShouldDismissOnActionClicked = shouldDismiss;
        return this;
    }

    public Snackbar actionListener(ActionClickListener listener) {
        this.mActionClickListener = listener;
        return this;
    }

    public Snackbar swipeListener(ActionSwipeListener listener) {
        this.mActionSwipeListener = listener;
        return this;
    }

    public Snackbar allowMultipleActionClicks(boolean shouldAllow) {
        this.mShouldAllowMultipleActionClicks = shouldAllow;
        return this;
    }

    public Snackbar eventListener(EventListener listener) {
        this.mEventListener = listener;
        return this;
    }

    public Snackbar animation(boolean withAnimation) {
        this.mAnimated = withAnimation;
        return this;
    }

    public Snackbar swipeToDismiss(boolean canSwipeToDismiss) {
        this.mCanSwipeToDismiss = canSwipeToDismiss;
        return this;
    }

    public Snackbar duration(SnackbarDuration duration) {
        this.mDuration = duration;
        return this;
    }

    public Snackbar duration(long duration) {
        this.mCustomDuration = duration > 0 ? duration : this.mCustomDuration;
        return this;
    }

    public Snackbar attachToAbsListView(AbsListView absListView) {
        absListView.setOnScrollListener(new AbsListView.OnScrollListener() { // from class: com.nispok.snackbar.Snackbar.3
            @Override // android.widget.AbsListView.OnScrollListener
            public void onScrollStateChanged(AbsListView view, int scrollState) {
                Snackbar.this.dismiss();
            }

            @Override // android.widget.AbsListView.OnScrollListener
            public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
            }
        });
        return this;
    }

    public Snackbar attachToRecyclerView(View recyclerView) {
        try {
            Class.forName("android.support.v7.widget.RecyclerView");
            RecyclerUtil.setScrollListener(this, recyclerView);
            return this;
        } catch (ClassNotFoundException e) {
            throw new IllegalArgumentException("RecyclerView not found. Did you add it to your dependencies?");
        }
    }

    public Snackbar textTypeface(Typeface typeface) {
        this.mTextTypeface = typeface;
        return this;
    }

    public Snackbar actionLabelTypeface(Typeface typeface) {
        this.mActionTypeface = typeface;
        return this;
    }

    private static ViewGroup.MarginLayoutParams createMarginLayoutParams(ViewGroup viewGroup, int width, int height, SnackbarPosition position) {
        if (viewGroup instanceof FrameLayout) {
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(width, height);
            params.gravity = position.getLayoutGravity();
            return params;
        }
        if (viewGroup instanceof RelativeLayout) {
            RelativeLayout.LayoutParams params2 = new RelativeLayout.LayoutParams(width, height);
            if (position == SnackbarPosition.TOP) {
                params2.addRule(10, -1);
            } else {
                params2.addRule(12, -1);
            }
            return params2;
        }
        if (viewGroup instanceof LinearLayout) {
            LinearLayout.LayoutParams params3 = new LinearLayout.LayoutParams(width, height);
            params3.gravity = position.getLayoutGravity();
            return params3;
        }
        throw new IllegalStateException("Requires FrameLayout or RelativeLayout for the parent of Snackbar");
    }

    static boolean shouldUsePhoneLayout(Context context) {
        if (context == null) {
            return true;
        }
        return context.getResources().getBoolean(R.bool.sb__is_phone);
    }

    private ViewGroup.MarginLayoutParams init(Context context, Activity targetActivity, ViewGroup parent, boolean usePhoneLayout) {
        int widthFromPercentage;
        ViewGroup.MarginLayoutParams params;
        SnackbarLayout layout = (SnackbarLayout) LayoutInflater.from(context).inflate(R.layout.sb__template, (ViewGroup) this, true);
        Resources res = getResources();
        this.mColor = this.mColor != this.mUndefinedColor ? this.mColor : res.getColor(R.color.sb__background);
        this.mOffset = res.getDimensionPixelOffset(R.dimen.sb__offset);
        this.mUsePhoneLayout = usePhoneLayout;
        float scale = res.getDisplayMetrics().density;
        if (this.mUsePhoneLayout) {
            layout.setMinimumHeight(dpToPx(this.mType.getMinHeight(), scale));
            layout.setMaxHeight(dpToPx(this.mType.getMaxHeight(), scale));
            layout.setBackgroundColor(this.mColor);
            params = createMarginLayoutParams(parent, -1, -2, this.mPosition);
        } else {
            this.mType = SnackbarType.SINGLE_LINE;
            layout.setMinimumWidth(res.getDimensionPixelSize(R.dimen.sb__min_width));
            if (this.mMaxWidthPercentage == null) {
                widthFromPercentage = res.getDimensionPixelSize(R.dimen.sb__max_width);
            } else {
                widthFromPercentage = DisplayCompat.getWidthFromPercentage(targetActivity, this.mMaxWidthPercentage);
            }
            layout.setMaxWidth(widthFromPercentage);
            layout.setBackgroundResource(R.drawable.sb__bg);
            GradientDrawable bg = (GradientDrawable) layout.getBackground();
            bg.setColor(this.mColor);
            params = createMarginLayoutParams(parent, -2, dpToPx(this.mType.getMaxHeight(), scale), this.mPosition);
        }
        if (this.mDrawable != this.mUndefinedDrawable) {
            setBackgroundDrawable(layout, res.getDrawable(this.mDrawable));
        }
        this.snackbarText = (TextView) layout.findViewById(R.id.sb__text);
        this.snackbarText.setText(this.mText);
        this.snackbarText.setTypeface(this.mTextTypeface);
        if (this.mTextColor != this.mUndefinedColor) {
            this.snackbarText.setTextColor(this.mTextColor);
        }
        this.snackbarText.setMaxLines(this.mType.getMaxLines());
        TextView snackbarAction = (TextView) layout.findViewById(R.id.sb__action);
        if (!TextUtils.isEmpty(this.mActionLabel)) {
            requestLayout();
            snackbarAction.setText(this.mActionLabel);
            snackbarAction.setTypeface(this.mActionTypeface);
            if (this.mActionColor != this.mUndefinedColor) {
                snackbarAction.setTextColor(this.mActionColor);
            }
            snackbarAction.setOnClickListener(new View.OnClickListener() { // from class: com.nispok.snackbar.Snackbar.4
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    if (Snackbar.this.mActionClickListener != null && !Snackbar.this.mIsDismissing && (!Snackbar.this.mActionClicked || Snackbar.this.mShouldAllowMultipleActionClicks)) {
                        Snackbar.this.mActionClickListener.onActionClicked(Snackbar.this);
                        Snackbar.this.mActionClicked = true;
                    }
                    if (Snackbar.this.mShouldDismissOnActionClicked) {
                        Snackbar.this.dismiss();
                    }
                }
            });
            snackbarAction.setMaxLines(this.mType.getMaxLines());
        } else {
            snackbarAction.setVisibility(8);
        }
        setClickable(true);
        if (this.mCanSwipeToDismiss && res.getBoolean(R.bool.sb__is_swipeable)) {
            setOnTouchListener(new SwipeDismissTouchListener(this, null, new SwipeDismissTouchListener.DismissCallbacks() { // from class: com.nispok.snackbar.Snackbar.5
                @Override // com.nispok.snackbar.listeners.SwipeDismissTouchListener.DismissCallbacks
                public boolean canDismiss(Object token) {
                    return true;
                }

                @Override // com.nispok.snackbar.listeners.SwipeDismissTouchListener.DismissCallbacks
                public void onDismiss(View view, Object token) {
                    if (view != null) {
                        if (Snackbar.this.mActionSwipeListener != null) {
                            Snackbar.this.mActionSwipeListener.onSwipeToDismiss();
                        }
                        Snackbar.this.dismiss(false);
                    }
                }

                /* JADX WARN: Failed to check method for inline after forced processcom.nispok.snackbar.Snackbar.access$1002(com.nispok.snackbar.Snackbar, long):long */
                /* JADX WARN: Failed to check method for inline after forced processcom.nispok.snackbar.Snackbar.access$902(com.nispok.snackbar.Snackbar, long):long */
                @Override // com.nispok.snackbar.listeners.SwipeDismissTouchListener.DismissCallbacks
                public void pauseTimer(boolean shouldPause) {
                    if (Snackbar.this.isIndefiniteDuration()) {
                        return;
                    }
                    if (shouldPause) {
                        Snackbar.this.removeCallbacks(Snackbar.this.mDismissRunnable);
                        Snackbar.access$902(Snackbar.this, System.currentTimeMillis());
                    } else {
                        Snackbar.access$1002(Snackbar.this, Snackbar.this.mTimeRemaining - (Snackbar.this.mSnackbarFinish - Snackbar.this.mSnackbarStart));
                        Snackbar.this.startTimer(Snackbar.this.mTimeRemaining);
                    }
                }
            }));
        }
        return params;
    }

    private void updateWindowInsets(Activity targetActivity, Rect outInsets) {
        outInsets.bottom = 0;
        outInsets.right = 0;
        outInsets.top = 0;
        outInsets.left = 0;
        if (targetActivity == null) {
            return;
        }
        ViewGroup decorView = (ViewGroup) targetActivity.getWindow().getDecorView();
        Display display = targetActivity.getWindowManager().getDefaultDisplay();
        boolean isTranslucent = isNavigationBarTranslucent(targetActivity);
        boolean isHidden = isNavigationBarHidden(decorView);
        Rect dispFrame = this.mDisplayFrame;
        Point realDispSize = this.mRealDisplaySize;
        Point dispSize = this.mDisplaySize;
        decorView.getWindowVisibleDisplayFrame(dispFrame);
        DisplayCompat.getRealSize(display, realDispSize);
        DisplayCompat.getSize(display, dispSize);
        if (dispSize.x < realDispSize.x) {
            if (isTranslucent || isHidden) {
                int navBarWidth = realDispSize.x - dispSize.x;
                int overlapWidth = realDispSize.x - dispFrame.right;
                outInsets.right = Math.max(Math.min(navBarWidth, overlapWidth), 0);
                return;
            }
            return;
        }
        if (dispSize.y < realDispSize.y) {
            if (isTranslucent || isHidden) {
                int navBarHeight = realDispSize.y - dispSize.y;
                int overlapHeight = realDispSize.y - dispFrame.bottom;
                outInsets.bottom = Math.max(Math.min(navBarHeight, overlapHeight), 0);
            }
        }
    }

    private static int dpToPx(int dp, float scale) {
        return (int) ((dp * scale) + 0.5f);
    }

    public void showByReplace(Activity targetActivity) {
        this.mIsShowingByReplace = true;
        show(targetActivity);
    }

    public void showByReplace(ViewGroup parent) {
        this.mIsShowingByReplace = true;
        show(parent, shouldUsePhoneLayout(parent.getContext()));
    }

    public void showByReplace(ViewGroup parent, boolean usePhoneLayout) {
        this.mIsShowingByReplace = true;
        show(parent, usePhoneLayout);
    }

    public void show(Activity targetActivity) {
        ViewGroup root = (ViewGroup) targetActivity.findViewById(R.id.content);
        boolean usePhoneLayout = shouldUsePhoneLayout(targetActivity);
        ViewGroup.MarginLayoutParams params = init(targetActivity, targetActivity, root, usePhoneLayout);
        updateLayoutParamsMargins(targetActivity, params);
        showInternal(targetActivity, params, root);
    }

    public void show(ViewGroup parent) {
        show(parent, shouldUsePhoneLayout(parent.getContext()));
    }

    public void show(ViewGroup parent, boolean usePhoneLayout) {
        ViewGroup.MarginLayoutParams params = init(parent.getContext(), null, parent, usePhoneLayout);
        updateLayoutParamsMargins(null, params);
        showInternal(null, params, parent);
    }

    public Snackbar maxWidthPercentage(float maxWidthPercentage) {
        this.mMaxWidthPercentage = Float.valueOf(maxWidthPercentage);
        return this;
    }

    private void showInternal(Activity targetActivity, ViewGroup.MarginLayoutParams params, ViewGroup parent) {
        parent.removeView(this);
        parent.addView(this, params);
        bringToFront();
        if (Build.VERSION.SDK_INT < 19) {
            parent.requestLayout();
            parent.invalidate();
        }
        this.mIsShowing = true;
        this.mTargetActivity = targetActivity;
        getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.nispok.snackbar.Snackbar.6
            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                Snackbar.this.getViewTreeObserver().removeOnPreDrawListener(this);
                if (Snackbar.this.mEventListener != null) {
                    if (Snackbar.this.mIsShowingByReplace) {
                        Snackbar.this.mEventListener.onShowByReplace(Snackbar.this);
                    } else {
                        Snackbar.this.mEventListener.onShow(Snackbar.this);
                    }
                    if (!Snackbar.this.mAnimated) {
                        Snackbar.this.mEventListener.onShown(Snackbar.this);
                        Snackbar.this.mIsShowingByReplace = false;
                        return true;
                    }
                    return true;
                }
                return true;
            }
        });
        if (!this.mAnimated) {
            if (shouldStartTimer()) {
                startTimer();
            }
        } else {
            Animation slideIn = AnimationUtils.loadAnimation(getContext(), getInAnimationResource(this.mPosition));
            slideIn.setAnimationListener(new Animation.AnimationListener() { // from class: com.nispok.snackbar.Snackbar.7
                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationStart(Animation animation) {
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationEnd(Animation animation) {
                    if (Snackbar.this.mEventListener != null) {
                        Snackbar.this.mEventListener.onShown(Snackbar.this);
                        Snackbar.this.mIsShowingByReplace = false;
                    }
                    Snackbar.this.post(new Runnable() { // from class: com.nispok.snackbar.Snackbar.7.1
                        /* JADX WARN: Failed to check method for inline after forced processcom.nispok.snackbar.Snackbar.access$1002(com.nispok.snackbar.Snackbar, long):long */
                        /* JADX WARN: Failed to check method for inline after forced processcom.nispok.snackbar.Snackbar.access$1102(com.nispok.snackbar.Snackbar, long):long */
                        @Override // java.lang.Runnable
                        public void run() {
                            Snackbar.access$1102(Snackbar.this, System.currentTimeMillis());
                            if (Snackbar.this.mTimeRemaining == -1) {
                                Snackbar.access$1002(Snackbar.this, Snackbar.this.getDuration());
                            }
                            if (Snackbar.this.shouldStartTimer()) {
                                Snackbar.this.startTimer();
                            }
                        }
                    });
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationRepeat(Animation animation) {
                }
            });
            startAnimation(slideIn);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean shouldStartTimer() {
        return !isIndefiniteDuration();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isIndefiniteDuration() {
        return getDuration() == SnackbarDuration.LENGTH_INDEFINITE.getDuration();
    }

    @TargetApi(16)
    private boolean isNavigationBarHidden(ViewGroup root) {
        if (Build.VERSION.SDK_INT < 16) {
            return false;
        }
        int viewFlags = root.getWindowSystemUiVisibility();
        return (viewFlags & 512) == 512;
    }

    private boolean isNavigationBarTranslucent(Activity targetActivity) {
        if (Build.VERSION.SDK_INT < 19) {
            return false;
        }
        int flags = targetActivity.getWindow().getAttributes().flags;
        return (flags & 134217728) != 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startTimer() {
        postDelayed(this.mDismissRunnable, getDuration());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startTimer(long duration) {
        postDelayed(this.mDismissRunnable, duration);
    }

    public void dismissByReplace() {
        this.mIsReplacePending = true;
        dismiss();
    }

    public void dismiss() {
        dismiss(this.mAnimated);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dismiss(boolean animate) {
        if (this.mIsDismissing) {
            return;
        }
        this.mIsDismissing = true;
        if (this.mEventListener != null && this.mIsShowing) {
            if (this.mIsReplacePending) {
                this.mEventListener.onDismissByReplace(this);
            } else {
                this.mEventListener.onDismiss(this);
            }
        }
        if (!animate) {
            finish();
            return;
        }
        Animation slideOut = AnimationUtils.loadAnimation(getContext(), getOutAnimationResource(this.mPosition));
        slideOut.setAnimationListener(new Animation.AnimationListener() { // from class: com.nispok.snackbar.Snackbar.8
            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationStart(Animation animation) {
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationEnd(Animation animation) {
                Snackbar.this.post(new Runnable() { // from class: com.nispok.snackbar.Snackbar.8.1
                    @Override // java.lang.Runnable
                    public void run() {
                        Snackbar.this.finish();
                    }
                });
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationRepeat(Animation animation) {
            }
        });
        startAnimation(slideOut);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void finish() {
        clearAnimation();
        ViewGroup parent = (ViewGroup) getParent();
        if (parent != null) {
            parent.removeView(this);
        }
        if (this.mEventListener != null && this.mIsShowing) {
            this.mEventListener.onDismissed(this);
        }
        this.mIsShowing = false;
        this.mIsReplacePending = false;
        this.mTargetActivity = null;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.mDismissRunnable != null) {
            removeCallbacks(this.mDismissRunnable);
        }
        if (this.mRefreshLayoutParamsMarginsRunnable != null) {
            removeCallbacks(this.mRefreshLayoutParamsMarginsRunnable);
        }
    }

    void dispatchOnWindowSystemUiVisibilityChangedCompat(int visible) {
        onWindowSystemUiVisibilityChangedCompat(visible);
    }

    protected void onWindowSystemUiVisibilityChangedCompat(int visible) {
        if (this.mRefreshLayoutParamsMarginsRunnable != null) {
            post(this.mRefreshLayoutParamsMarginsRunnable);
        }
    }

    protected void refreshLayoutParamsMargins() {
        if (this.mIsDismissing) {
            return;
        }
        ViewGroup parent = (ViewGroup) getParent();
        if (parent == null) {
            return;
        }
        ViewGroup.MarginLayoutParams params = (ViewGroup.MarginLayoutParams) getLayoutParams();
        updateLayoutParamsMargins(this.mTargetActivity, params);
        setLayoutParams(params);
    }

    protected void updateLayoutParamsMargins(Activity targetActivity, ViewGroup.MarginLayoutParams params) {
        if (this.mUsePhoneLayout) {
            params.topMargin = this.mMarginTop;
            params.rightMargin = this.mMarginRight;
            params.leftMargin = this.mMarginLeft;
            params.bottomMargin = this.mMarginBottom;
        } else {
            params.topMargin = this.mMarginTop;
            params.rightMargin = this.mMarginRight;
            params.leftMargin = this.mMarginLeft + this.mOffset;
            params.bottomMargin = this.mMarginBottom + this.mOffset;
        }
        updateWindowInsets(targetActivity, this.mWindowInsets);
        params.rightMargin += this.mWindowInsets.right;
        params.bottomMargin += this.mWindowInsets.bottom;
    }

    public int getActionColor() {
        return this.mActionColor;
    }

    public CharSequence getActionLabel() {
        return this.mActionLabel;
    }

    public int getTextColor() {
        return this.mTextColor;
    }

    public int getColor() {
        return this.mColor;
    }

    public CharSequence getText() {
        return this.mText;
    }

    public long getDuration() {
        return this.mCustomDuration == -1 ? this.mDuration.getDuration() : this.mCustomDuration;
    }

    public SnackbarType getType() {
        return this.mType;
    }

    public boolean isActionClicked() {
        return this.mActionClicked;
    }

    public int getOffset() {
        return this.mOffset;
    }

    public boolean isAnimated() {
        return this.mAnimated;
    }

    public boolean shouldDismissOnActionClicked() {
        return this.mShouldDismissOnActionClicked;
    }

    public boolean isShowing() {
        return this.mIsShowing;
    }

    public boolean isDimissing() {
        return this.mIsDismissing;
    }

    public boolean isDismissed() {
        return !this.mIsShowing;
    }

    public static int getInAnimationResource(SnackbarPosition snackbarPosition) {
        return snackbarPosition == SnackbarPosition.TOP ? R.anim.sb__top_in : R.anim.sb__bottom_in;
    }

    public static int getOutAnimationResource(SnackbarPosition snackbarPosition) {
        return snackbarPosition == SnackbarPosition.TOP ? R.anim.sb__top_out : R.anim.sb__bottom_out;
    }

    public static void setBackgroundDrawable(View view, Drawable drawable) {
        if (Build.VERSION.SDK_INT < 16) {
            view.setBackgroundDrawable(drawable);
        } else {
            view.setBackground(drawable);
        }
    }
}
