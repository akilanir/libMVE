.class public Lcom/nispok/snackbar/Snackbar;
.super Lcom/nispok/snackbar/layouts/SnackbarLayout;
.source "Snackbar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nispok/snackbar/Snackbar$SnackbarPosition;,
        Lcom/nispok/snackbar/Snackbar$SnackbarDuration;
    }
.end annotation


# instance fields
.field private mActionClickListener:Lcom/nispok/snackbar/listeners/ActionClickListener;

.field private mActionClicked:Z

.field private mActionColor:I

.field private mActionLabel:Ljava/lang/CharSequence;

.field private mActionSwipeListener:Lcom/nispok/snackbar/listeners/ActionSwipeListener;

.field private mActionTypeface:Landroid/graphics/Typeface;

.field private mAnimated:Z

.field private mCanSwipeToDismiss:Z

.field private mColor:I

.field private mCustomDuration:J

.field private mDismissRunnable:Ljava/lang/Runnable;

.field private mDisplayFrame:Landroid/graphics/Rect;

.field private mDisplaySize:Landroid/graphics/Point;

.field private mDrawable:I

.field private mDuration:Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

.field private mEventListener:Lcom/nispok/snackbar/listeners/EventListener;

.field private mIsDismissing:Z

.field private mIsReplacePending:Z

.field private mIsShowing:Z

.field private mIsShowingByReplace:Z

.field private mMarginBottom:I

.field private mMarginLeft:I

.field private mMarginRight:I

.field private mMarginTop:I

.field private mMaxWidthPercentage:Ljava/lang/Float;

.field private mOffset:I

.field private mPosition:Lcom/nispok/snackbar/Snackbar$SnackbarPosition;

.field private mRealDisplaySize:Landroid/graphics/Point;

.field private mRefreshLayoutParamsMarginsRunnable:Ljava/lang/Runnable;

.field private mShouldAllowMultipleActionClicks:Z

.field private mShouldDismissOnActionClicked:Z

.field private mSnackbarFinish:J

.field private mSnackbarStart:J

.field private mTargetActivity:Landroid/app/Activity;

.field private mText:Ljava/lang/CharSequence;

.field private mTextColor:I

.field private mTextTypeface:Landroid/graphics/Typeface;

.field private mTimeRemaining:J

.field private mType:Lcom/nispok/snackbar/enums/SnackbarType;

.field private mUndefinedColor:I

.field private mUndefinedDrawable:I

.field private mUsePhoneLayout:Z

.field private mWindowInsets:Landroid/graphics/Rect;

.field private snackbarText:Landroid/widget/TextView;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const-wide/16 v3, -0x1

    const/16 v0, -0x2710

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 130
    invoke-direct {p0, p1}, Lcom/nispok/snackbar/layouts/SnackbarLayout;-><init>(Landroid/content/Context;)V

    .line 73
    iput v0, p0, Lcom/nispok/snackbar/Snackbar;->mUndefinedColor:I

    .line 74
    iput v0, p0, Lcom/nispok/snackbar/Snackbar;->mUndefinedDrawable:I

    .line 76
    sget-object v0, Lcom/nispok/snackbar/enums/SnackbarType;->SINGLE_LINE:Lcom/nispok/snackbar/enums/SnackbarType;

    iput-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mType:Lcom/nispok/snackbar/enums/SnackbarType;

    .line 77
    sget-object v0, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;->LENGTH_LONG:Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

    iput-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mDuration:Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

    .line 80
    iget v0, p0, Lcom/nispok/snackbar/Snackbar;->mUndefinedColor:I

    iput v0, p0, Lcom/nispok/snackbar/Snackbar;->mColor:I

    .line 81
    iget v0, p0, Lcom/nispok/snackbar/Snackbar;->mUndefinedColor:I

    iput v0, p0, Lcom/nispok/snackbar/Snackbar;->mTextColor:I

    .line 83
    sget-object v0, Lcom/nispok/snackbar/Snackbar$SnackbarPosition;->BOTTOM:Lcom/nispok/snackbar/Snackbar$SnackbarPosition;

    iput-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mPosition:Lcom/nispok/snackbar/Snackbar$SnackbarPosition;

    .line 84
    iget v0, p0, Lcom/nispok/snackbar/Snackbar;->mUndefinedDrawable:I

    iput v0, p0, Lcom/nispok/snackbar/Snackbar;->mDrawable:I

    .line 85
    iput v1, p0, Lcom/nispok/snackbar/Snackbar;->mMarginTop:I

    .line 86
    iput v1, p0, Lcom/nispok/snackbar/Snackbar;->mMarginBottom:I

    .line 87
    iput v1, p0, Lcom/nispok/snackbar/Snackbar;->mMarginLeft:I

    .line 88
    iput v1, p0, Lcom/nispok/snackbar/Snackbar;->mMarginRight:I

    .line 91
    iput-wide v3, p0, Lcom/nispok/snackbar/Snackbar;->mTimeRemaining:J

    .line 93
    iget v0, p0, Lcom/nispok/snackbar/Snackbar;->mUndefinedColor:I

    iput v0, p0, Lcom/nispok/snackbar/Snackbar;->mActionColor:I

    .line 94
    iput-boolean v2, p0, Lcom/nispok/snackbar/Snackbar;->mAnimated:Z

    .line 95
    iput-boolean v1, p0, Lcom/nispok/snackbar/Snackbar;->mIsReplacePending:Z

    .line 96
    iput-boolean v1, p0, Lcom/nispok/snackbar/Snackbar;->mIsShowingByReplace:Z

    .line 97
    iput-wide v3, p0, Lcom/nispok/snackbar/Snackbar;->mCustomDuration:J

    .line 102
    iput-boolean v2, p0, Lcom/nispok/snackbar/Snackbar;->mShouldDismissOnActionClicked:Z

    .line 106
    iput-boolean v1, p0, Lcom/nispok/snackbar/Snackbar;->mIsShowing:Z

    .line 107
    iput-boolean v2, p0, Lcom/nispok/snackbar/Snackbar;->mCanSwipeToDismiss:Z

    .line 108
    iput-boolean v1, p0, Lcom/nispok/snackbar/Snackbar;->mIsDismissing:Z

    .line 109
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mWindowInsets:Landroid/graphics/Rect;

    .line 110
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mDisplayFrame:Landroid/graphics/Rect;

    .line 111
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mDisplaySize:Landroid/graphics/Point;

    .line 112
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mRealDisplaySize:Landroid/graphics/Point;

    .line 114
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mMaxWidthPercentage:Ljava/lang/Float;

    .line 116
    new-instance v0, Lcom/nispok/snackbar/Snackbar$1;

    invoke-direct {v0, p0}, Lcom/nispok/snackbar/Snackbar$1;-><init>(Lcom/nispok/snackbar/Snackbar;)V

    iput-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mDismissRunnable:Ljava/lang/Runnable;

    .line 122
    new-instance v0, Lcom/nispok/snackbar/Snackbar$2;

    invoke-direct {v0, p0}, Lcom/nispok/snackbar/Snackbar$2;-><init>(Lcom/nispok/snackbar/Snackbar;)V

    iput-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mRefreshLayoutParamsMarginsRunnable:Ljava/lang/Runnable;

    .line 133
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_82

    .line 134
    new-instance v0, Lcom/nispok/snackbar/SnackbarHelperChildViewJB;

    invoke-virtual {p0}, Lcom/nispok/snackbar/Snackbar;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/nispok/snackbar/SnackbarHelperChildViewJB;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lcom/nispok/snackbar/Snackbar;->addView(Landroid/view/View;)V

    .line 136
    :cond_82
    return-void
.end method

.method static synthetic access$000(Lcom/nispok/snackbar/Snackbar;)Lcom/nispok/snackbar/listeners/ActionClickListener;
    .registers 2
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mActionClickListener:Lcom/nispok/snackbar/listeners/ActionClickListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/nispok/snackbar/Snackbar;)Z
    .registers 2
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 43
    iget-boolean v0, p0, Lcom/nispok/snackbar/Snackbar;->mIsDismissing:Z

    return v0
.end method

.method static synthetic access$1000(Lcom/nispok/snackbar/Snackbar;)J
    .registers 3
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 43
    iget-wide v0, p0, Lcom/nispok/snackbar/Snackbar;->mTimeRemaining:J

    return-wide v0
.end method

.method static synthetic access$1002(Lcom/nispok/snackbar/Snackbar;J)J
    .registers 3
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;
    .param p1, "x1"    # J

    .prologue
    .line 43
    iput-wide p1, p0, Lcom/nispok/snackbar/Snackbar;->mTimeRemaining:J

    return-wide p1
.end method

.method static synthetic access$1100(Lcom/nispok/snackbar/Snackbar;)J
    .registers 3
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 43
    iget-wide v0, p0, Lcom/nispok/snackbar/Snackbar;->mSnackbarStart:J

    return-wide v0
.end method

.method static synthetic access$1102(Lcom/nispok/snackbar/Snackbar;J)J
    .registers 3
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;
    .param p1, "x1"    # J

    .prologue
    .line 43
    iput-wide p1, p0, Lcom/nispok/snackbar/Snackbar;->mSnackbarStart:J

    return-wide p1
.end method

.method static synthetic access$1200(Lcom/nispok/snackbar/Snackbar;J)V
    .registers 3
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;
    .param p1, "x1"    # J

    .prologue
    .line 43
    invoke-direct {p0, p1, p2}, Lcom/nispok/snackbar/Snackbar;->startTimer(J)V

    return-void
.end method

.method static synthetic access$1300(Lcom/nispok/snackbar/Snackbar;)Lcom/nispok/snackbar/listeners/EventListener;
    .registers 2
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mEventListener:Lcom/nispok/snackbar/listeners/EventListener;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/nispok/snackbar/Snackbar;)Z
    .registers 2
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 43
    iget-boolean v0, p0, Lcom/nispok/snackbar/Snackbar;->mIsShowingByReplace:Z

    return v0
.end method

.method static synthetic access$1402(Lcom/nispok/snackbar/Snackbar;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;
    .param p1, "x1"    # Z

    .prologue
    .line 43
    iput-boolean p1, p0, Lcom/nispok/snackbar/Snackbar;->mIsShowingByReplace:Z

    return p1
.end method

.method static synthetic access$1500(Lcom/nispok/snackbar/Snackbar;)Z
    .registers 2
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 43
    iget-boolean v0, p0, Lcom/nispok/snackbar/Snackbar;->mAnimated:Z

    return v0
.end method

.method static synthetic access$1600(Lcom/nispok/snackbar/Snackbar;)Z
    .registers 2
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/nispok/snackbar/Snackbar;->shouldStartTimer()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1700(Lcom/nispok/snackbar/Snackbar;)V
    .registers 1
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/nispok/snackbar/Snackbar;->startTimer()V

    return-void
.end method

.method static synthetic access$1800(Lcom/nispok/snackbar/Snackbar;)V
    .registers 1
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/nispok/snackbar/Snackbar;->finish()V

    return-void
.end method

.method static synthetic access$200(Lcom/nispok/snackbar/Snackbar;)Z
    .registers 2
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 43
    iget-boolean v0, p0, Lcom/nispok/snackbar/Snackbar;->mActionClicked:Z

    return v0
.end method

.method static synthetic access$202(Lcom/nispok/snackbar/Snackbar;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;
    .param p1, "x1"    # Z

    .prologue
    .line 43
    iput-boolean p1, p0, Lcom/nispok/snackbar/Snackbar;->mActionClicked:Z

    return p1
.end method

.method static synthetic access$300(Lcom/nispok/snackbar/Snackbar;)Z
    .registers 2
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 43
    iget-boolean v0, p0, Lcom/nispok/snackbar/Snackbar;->mShouldAllowMultipleActionClicks:Z

    return v0
.end method

.method static synthetic access$400(Lcom/nispok/snackbar/Snackbar;)Z
    .registers 2
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 43
    iget-boolean v0, p0, Lcom/nispok/snackbar/Snackbar;->mShouldDismissOnActionClicked:Z

    return v0
.end method

.method static synthetic access$500(Lcom/nispok/snackbar/Snackbar;)Lcom/nispok/snackbar/listeners/ActionSwipeListener;
    .registers 2
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mActionSwipeListener:Lcom/nispok/snackbar/listeners/ActionSwipeListener;

    return-object v0
.end method

.method static synthetic access$600(Lcom/nispok/snackbar/Snackbar;Z)V
    .registers 2
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;
    .param p1, "x1"    # Z

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lcom/nispok/snackbar/Snackbar;->dismiss(Z)V

    return-void
.end method

.method static synthetic access$700(Lcom/nispok/snackbar/Snackbar;)Z
    .registers 2
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/nispok/snackbar/Snackbar;->isIndefiniteDuration()Z

    move-result v0

    return v0
.end method

.method static synthetic access$800(Lcom/nispok/snackbar/Snackbar;)Ljava/lang/Runnable;
    .registers 2
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mDismissRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$900(Lcom/nispok/snackbar/Snackbar;)J
    .registers 3
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 43
    iget-wide v0, p0, Lcom/nispok/snackbar/Snackbar;->mSnackbarFinish:J

    return-wide v0
.end method

.method static synthetic access$902(Lcom/nispok/snackbar/Snackbar;J)J
    .registers 3
    .param p0, "x0"    # Lcom/nispok/snackbar/Snackbar;
    .param p1, "x1"    # J

    .prologue
    .line 43
    iput-wide p1, p0, Lcom/nispok/snackbar/Snackbar;->mSnackbarFinish:J

    return-wide p1
.end method

.method private static createMarginLayoutParams(Landroid/view/ViewGroup;IILcom/nispok/snackbar/Snackbar$SnackbarPosition;)Landroid/view/ViewGroup$MarginLayoutParams;
    .registers 7
    .param p0, "viewGroup"    # Landroid/view/ViewGroup;
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "position"    # Lcom/nispok/snackbar/Snackbar$SnackbarPosition;

    .prologue
    const/4 v2, -0x1

    .line 498
    instance-of v1, p0, Landroid/widget/FrameLayout;

    if-eqz v1, :cond_11

    .line 499
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, p1, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 500
    .local v0, "params":Landroid/widget/FrameLayout$LayoutParams;
    invoke-virtual {p3}, Lcom/nispok/snackbar/Snackbar$SnackbarPosition;->getLayoutGravity()I

    move-result v1

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 514
    .end local v0    # "params":Landroid/widget/FrameLayout$LayoutParams;
    :goto_10
    return-object v0

    .line 502
    :cond_11
    instance-of v1, p0, Landroid/widget/RelativeLayout;

    if-eqz v1, :cond_2a

    .line 503
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, p1, p2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 505
    .local v0, "params":Landroid/widget/RelativeLayout$LayoutParams;
    sget-object v1, Lcom/nispok/snackbar/Snackbar$SnackbarPosition;->TOP:Lcom/nispok/snackbar/Snackbar$SnackbarPosition;

    if-ne p3, v1, :cond_24

    .line 506
    const/16 v1, 0xa

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    goto :goto_10

    .line 508
    :cond_24
    const/16 v1, 0xc

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    goto :goto_10

    .line 511
    .end local v0    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_2a
    instance-of v1, p0, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_3a

    .line 512
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, p1, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 513
    .local v0, "params":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {p3}, Lcom/nispok/snackbar/Snackbar$SnackbarPosition;->getLayoutGravity()I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    goto :goto_10

    .line 516
    .end local v0    # "params":Landroid/widget/LinearLayout$LayoutParams;
    :cond_3a
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Requires FrameLayout or RelativeLayout for the parent of Snackbar"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private dismiss(Z)V
    .registers 5
    .param p1, "animate"    # Z

    .prologue
    .line 877
    iget-boolean v1, p0, Lcom/nispok/snackbar/Snackbar;->mIsDismissing:Z

    if-eqz v1, :cond_5

    .line 917
    :goto_4
    return-void

    .line 881
    :cond_5
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/nispok/snackbar/Snackbar;->mIsDismissing:Z

    .line 883
    iget-object v1, p0, Lcom/nispok/snackbar/Snackbar;->mEventListener:Lcom/nispok/snackbar/listeners/EventListener;

    if-eqz v1, :cond_19

    iget-boolean v1, p0, Lcom/nispok/snackbar/Snackbar;->mIsShowing:Z

    if-eqz v1, :cond_19

    .line 884
    iget-boolean v1, p0, Lcom/nispok/snackbar/Snackbar;->mIsReplacePending:Z

    if-eqz v1, :cond_1f

    .line 885
    iget-object v1, p0, Lcom/nispok/snackbar/Snackbar;->mEventListener:Lcom/nispok/snackbar/listeners/EventListener;

    invoke-interface {v1, p0}, Lcom/nispok/snackbar/listeners/EventListener;->onDismissByReplace(Lcom/nispok/snackbar/Snackbar;)V

    .line 891
    :cond_19
    :goto_19
    if-nez p1, :cond_25

    .line 892
    invoke-direct {p0}, Lcom/nispok/snackbar/Snackbar;->finish()V

    goto :goto_4

    .line 887
    :cond_1f
    iget-object v1, p0, Lcom/nispok/snackbar/Snackbar;->mEventListener:Lcom/nispok/snackbar/listeners/EventListener;

    invoke-interface {v1, p0}, Lcom/nispok/snackbar/listeners/EventListener;->onDismiss(Lcom/nispok/snackbar/Snackbar;)V

    goto :goto_19

    .line 896
    :cond_25
    invoke-virtual {p0}, Lcom/nispok/snackbar/Snackbar;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/nispok/snackbar/Snackbar;->mPosition:Lcom/nispok/snackbar/Snackbar$SnackbarPosition;

    invoke-static {v2}, Lcom/nispok/snackbar/Snackbar;->getOutAnimationResource(Lcom/nispok/snackbar/Snackbar$SnackbarPosition;)I

    move-result v2

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 897
    .local v0, "slideOut":Landroid/view/animation/Animation;
    new-instance v1, Lcom/nispok/snackbar/Snackbar$8;

    invoke-direct {v1, p0}, Lcom/nispok/snackbar/Snackbar$8;-><init>(Lcom/nispok/snackbar/Snackbar;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 916
    invoke-virtual {p0, v0}, Lcom/nispok/snackbar/Snackbar;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_4
.end method

.method private static dpToPx(IF)I
    .registers 4
    .param p0, "dp"    # I
    .param p1, "scale"    # F

    .prologue
    .line 692
    int-to-float v0, p0

    mul-float/2addr v0, p1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method private finish()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 920
    invoke-virtual {p0}, Lcom/nispok/snackbar/Snackbar;->clearAnimation()V

    .line 921
    invoke-virtual {p0}, Lcom/nispok/snackbar/Snackbar;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 922
    .local v0, "parent":Landroid/view/ViewGroup;
    if-eqz v0, :cond_f

    .line 923
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 925
    :cond_f
    iget-object v1, p0, Lcom/nispok/snackbar/Snackbar;->mEventListener:Lcom/nispok/snackbar/listeners/EventListener;

    if-eqz v1, :cond_1c

    iget-boolean v1, p0, Lcom/nispok/snackbar/Snackbar;->mIsShowing:Z

    if-eqz v1, :cond_1c

    .line 926
    iget-object v1, p0, Lcom/nispok/snackbar/Snackbar;->mEventListener:Lcom/nispok/snackbar/listeners/EventListener;

    invoke-interface {v1, p0}, Lcom/nispok/snackbar/listeners/EventListener;->onDismissed(Lcom/nispok/snackbar/Snackbar;)V

    .line 928
    :cond_1c
    iput-boolean v2, p0, Lcom/nispok/snackbar/Snackbar;->mIsShowing:Z

    .line 929
    iput-boolean v2, p0, Lcom/nispok/snackbar/Snackbar;->mIsReplacePending:Z

    .line 930
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/nispok/snackbar/Snackbar;->mTargetActivity:Landroid/app/Activity;

    .line 931
    return-void
.end method

.method public static getInAnimationResource(Lcom/nispok/snackbar/Snackbar$SnackbarPosition;)I
    .registers 2
    .param p0, "snackbarPosition"    # Lcom/nispok/snackbar/Snackbar$SnackbarPosition;

    .prologue
    .line 1077
    sget-object v0, Lcom/nispok/snackbar/Snackbar$SnackbarPosition;->TOP:Lcom/nispok/snackbar/Snackbar$SnackbarPosition;

    if-ne p0, v0, :cond_7

    sget v0, Lcom/nispok/snackbar/R$anim;->sb__top_in:I

    :goto_6
    return v0

    :cond_7
    sget v0, Lcom/nispok/snackbar/R$anim;->sb__bottom_in:I

    goto :goto_6
.end method

.method public static getOutAnimationResource(Lcom/nispok/snackbar/Snackbar$SnackbarPosition;)I
    .registers 2
    .param p0, "snackbarPosition"    # Lcom/nispok/snackbar/Snackbar$SnackbarPosition;

    .prologue
    .line 1087
    sget-object v0, Lcom/nispok/snackbar/Snackbar$SnackbarPosition;->TOP:Lcom/nispok/snackbar/Snackbar$SnackbarPosition;

    if-ne p0, v0, :cond_7

    sget v0, Lcom/nispok/snackbar/R$anim;->sb__top_out:I

    :goto_6
    return v0

    :cond_7
    sget v0, Lcom/nispok/snackbar/R$anim;->sb__bottom_out:I

    goto :goto_6
.end method

.method private init(Landroid/content/Context;Landroid/app/Activity;Landroid/view/ViewGroup;Z)Landroid/view/ViewGroup$MarginLayoutParams;
    .registers 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "targetActivity"    # Landroid/app/Activity;
    .param p3, "parent"    # Landroid/view/ViewGroup;
    .param p4, "usePhoneLayout"    # Z

    .prologue
    const/4 v9, 0x1

    const/4 v8, -0x2

    .line 529
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v6

    sget v7, Lcom/nispok/snackbar/R$layout;->sb__template:I

    .line 530
    invoke-virtual {v6, v7, p0, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/nispok/snackbar/layouts/SnackbarLayout;

    .line 532
    .local v1, "layout":Lcom/nispok/snackbar/layouts/SnackbarLayout;
    invoke-virtual {p0}, Lcom/nispok/snackbar/Snackbar;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 533
    .local v3, "res":Landroid/content/res/Resources;
    iget v6, p0, Lcom/nispok/snackbar/Snackbar;->mColor:I

    iget v7, p0, Lcom/nispok/snackbar/Snackbar;->mUndefinedColor:I

    if-eq v6, v7, :cond_ec

    iget v6, p0, Lcom/nispok/snackbar/Snackbar;->mColor:I

    :goto_1a
    iput v6, p0, Lcom/nispok/snackbar/Snackbar;->mColor:I

    .line 534
    sget v6, Lcom/nispok/snackbar/R$dimen;->sb__offset:I

    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v6

    iput v6, p0, Lcom/nispok/snackbar/Snackbar;->mOffset:I

    .line 535
    iput-boolean p4, p0, Lcom/nispok/snackbar/Snackbar;->mUsePhoneLayout:Z

    .line 536
    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v4, v6, Landroid/util/DisplayMetrics;->density:F

    .line 539
    .local v4, "scale":F
    iget-boolean v6, p0, Lcom/nispok/snackbar/Snackbar;->mUsePhoneLayout:Z

    if-eqz v6, :cond_f4

    .line 541
    iget-object v6, p0, Lcom/nispok/snackbar/Snackbar;->mType:Lcom/nispok/snackbar/enums/SnackbarType;

    invoke-virtual {v6}, Lcom/nispok/snackbar/enums/SnackbarType;->getMinHeight()I

    move-result v6

    invoke-static {v6, v4}, Lcom/nispok/snackbar/Snackbar;->dpToPx(IF)I

    move-result v6

    invoke-virtual {v1, v6}, Lcom/nispok/snackbar/layouts/SnackbarLayout;->setMinimumHeight(I)V

    .line 542
    iget-object v6, p0, Lcom/nispok/snackbar/Snackbar;->mType:Lcom/nispok/snackbar/enums/SnackbarType;

    invoke-virtual {v6}, Lcom/nispok/snackbar/enums/SnackbarType;->getMaxHeight()I

    move-result v6

    invoke-static {v6, v4}, Lcom/nispok/snackbar/Snackbar;->dpToPx(IF)I

    move-result v6

    invoke-virtual {v1, v6}, Lcom/nispok/snackbar/layouts/SnackbarLayout;->setMaxHeight(I)V

    .line 543
    iget v6, p0, Lcom/nispok/snackbar/Snackbar;->mColor:I

    invoke-virtual {v1, v6}, Lcom/nispok/snackbar/layouts/SnackbarLayout;->setBackgroundColor(I)V

    .line 544
    const/4 v6, -0x1

    iget-object v7, p0, Lcom/nispok/snackbar/Snackbar;->mPosition:Lcom/nispok/snackbar/Snackbar$SnackbarPosition;

    invoke-static {p3, v6, v8, v7}, Lcom/nispok/snackbar/Snackbar;->createMarginLayoutParams(Landroid/view/ViewGroup;IILcom/nispok/snackbar/Snackbar$SnackbarPosition;)Landroid/view/ViewGroup$MarginLayoutParams;

    move-result-object v2

    .line 562
    .local v2, "params":Landroid/view/ViewGroup$MarginLayoutParams;
    :goto_56
    iget v6, p0, Lcom/nispok/snackbar/Snackbar;->mDrawable:I

    iget v7, p0, Lcom/nispok/snackbar/Snackbar;->mUndefinedDrawable:I

    if-eq v6, v7, :cond_65

    .line 563
    iget v6, p0, Lcom/nispok/snackbar/Snackbar;->mDrawable:I

    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-static {v1, v6}, Lcom/nispok/snackbar/Snackbar;->setBackgroundDrawable(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 565
    :cond_65
    sget v6, Lcom/nispok/snackbar/R$id;->sb__text:I

    invoke-virtual {v1, v6}, Lcom/nispok/snackbar/layouts/SnackbarLayout;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, p0, Lcom/nispok/snackbar/Snackbar;->snackbarText:Landroid/widget/TextView;

    .line 566
    iget-object v6, p0, Lcom/nispok/snackbar/Snackbar;->snackbarText:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/nispok/snackbar/Snackbar;->mText:Ljava/lang/CharSequence;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 567
    iget-object v6, p0, Lcom/nispok/snackbar/Snackbar;->snackbarText:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/nispok/snackbar/Snackbar;->mTextTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 569
    iget v6, p0, Lcom/nispok/snackbar/Snackbar;->mTextColor:I

    iget v7, p0, Lcom/nispok/snackbar/Snackbar;->mUndefinedColor:I

    if-eq v6, v7, :cond_8a

    .line 570
    iget-object v6, p0, Lcom/nispok/snackbar/Snackbar;->snackbarText:Landroid/widget/TextView;

    iget v7, p0, Lcom/nispok/snackbar/Snackbar;->mTextColor:I

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 573
    :cond_8a
    iget-object v6, p0, Lcom/nispok/snackbar/Snackbar;->snackbarText:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/nispok/snackbar/Snackbar;->mType:Lcom/nispok/snackbar/enums/SnackbarType;

    invoke-virtual {v7}, Lcom/nispok/snackbar/enums/SnackbarType;->getMaxLines()I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 575
    sget v6, Lcom/nispok/snackbar/R$id;->sb__action:I

    invoke-virtual {v1, v6}, Lcom/nispok/snackbar/layouts/SnackbarLayout;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 576
    .local v5, "snackbarAction":Landroid/widget/TextView;
    iget-object v6, p0, Lcom/nispok/snackbar/Snackbar;->mActionLabel:Ljava/lang/CharSequence;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_137

    .line 577
    invoke-virtual {p0}, Lcom/nispok/snackbar/Snackbar;->requestLayout()V

    .line 578
    iget-object v6, p0, Lcom/nispok/snackbar/Snackbar;->mActionLabel:Ljava/lang/CharSequence;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 579
    iget-object v6, p0, Lcom/nispok/snackbar/Snackbar;->mActionTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 581
    iget v6, p0, Lcom/nispok/snackbar/Snackbar;->mActionColor:I

    iget v7, p0, Lcom/nispok/snackbar/Snackbar;->mUndefinedColor:I

    if-eq v6, v7, :cond_bd

    .line 582
    iget v6, p0, Lcom/nispok/snackbar/Snackbar;->mActionColor:I

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 585
    :cond_bd
    new-instance v6, Lcom/nispok/snackbar/Snackbar$4;

    invoke-direct {v6, p0}, Lcom/nispok/snackbar/Snackbar$4;-><init>(Lcom/nispok/snackbar/Snackbar;)V

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 604
    iget-object v6, p0, Lcom/nispok/snackbar/Snackbar;->mType:Lcom/nispok/snackbar/enums/SnackbarType;

    invoke-virtual {v6}, Lcom/nispok/snackbar/enums/SnackbarType;->getMaxLines()I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 609
    :goto_ce
    invoke-virtual {p0, v9}, Lcom/nispok/snackbar/Snackbar;->setClickable(Z)V

    .line 611
    iget-boolean v6, p0, Lcom/nispok/snackbar/Snackbar;->mCanSwipeToDismiss:Z

    if-eqz v6, :cond_eb

    sget v6, Lcom/nispok/snackbar/R$bool;->sb__is_swipeable:I

    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v6

    if-eqz v6, :cond_eb

    .line 612
    new-instance v6, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;

    const/4 v7, 0x0

    new-instance v8, Lcom/nispok/snackbar/Snackbar$5;

    invoke-direct {v8, p0}, Lcom/nispok/snackbar/Snackbar$5;-><init>(Lcom/nispok/snackbar/Snackbar;)V

    invoke-direct {v6, p0, v7, v8}, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;-><init>(Landroid/view/View;Ljava/lang/Object;Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener$DismissCallbacks;)V

    invoke-virtual {p0, v6}, Lcom/nispok/snackbar/Snackbar;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 647
    :cond_eb
    return-object v2

    .line 533
    .end local v2    # "params":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v4    # "scale":F
    .end local v5    # "snackbarAction":Landroid/widget/TextView;
    :cond_ec
    sget v6, Lcom/nispok/snackbar/R$color;->sb__background:I

    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    goto/16 :goto_1a

    .line 548
    .restart local v4    # "scale":F
    :cond_f4
    sget-object v6, Lcom/nispok/snackbar/enums/SnackbarType;->SINGLE_LINE:Lcom/nispok/snackbar/enums/SnackbarType;

    iput-object v6, p0, Lcom/nispok/snackbar/Snackbar;->mType:Lcom/nispok/snackbar/enums/SnackbarType;

    .line 549
    sget v6, Lcom/nispok/snackbar/R$dimen;->sb__min_width:I

    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    invoke-virtual {v1, v6}, Lcom/nispok/snackbar/layouts/SnackbarLayout;->setMinimumWidth(I)V

    .line 550
    iget-object v6, p0, Lcom/nispok/snackbar/Snackbar;->mMaxWidthPercentage:Ljava/lang/Float;

    if-nez v6, :cond_130

    sget v6, Lcom/nispok/snackbar/R$dimen;->sb__max_width:I

    .line 552
    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    .line 550
    :goto_10b
    invoke-virtual {v1, v6}, Lcom/nispok/snackbar/layouts/SnackbarLayout;->setMaxWidth(I)V

    .line 554
    sget v6, Lcom/nispok/snackbar/R$drawable;->sb__bg:I

    invoke-virtual {v1, v6}, Lcom/nispok/snackbar/layouts/SnackbarLayout;->setBackgroundResource(I)V

    .line 555
    invoke-virtual {v1}, Lcom/nispok/snackbar/layouts/SnackbarLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 556
    .local v0, "bg":Landroid/graphics/drawable/GradientDrawable;
    iget v6, p0, Lcom/nispok/snackbar/Snackbar;->mColor:I

    invoke-virtual {v0, v6}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 558
    iget-object v6, p0, Lcom/nispok/snackbar/Snackbar;->mType:Lcom/nispok/snackbar/enums/SnackbarType;

    .line 559
    invoke-virtual {v6}, Lcom/nispok/snackbar/enums/SnackbarType;->getMaxHeight()I

    move-result v6

    invoke-static {v6, v4}, Lcom/nispok/snackbar/Snackbar;->dpToPx(IF)I

    move-result v6

    iget-object v7, p0, Lcom/nispok/snackbar/Snackbar;->mPosition:Lcom/nispok/snackbar/Snackbar$SnackbarPosition;

    .line 558
    invoke-static {p3, v8, v6, v7}, Lcom/nispok/snackbar/Snackbar;->createMarginLayoutParams(Landroid/view/ViewGroup;IILcom/nispok/snackbar/Snackbar$SnackbarPosition;)Landroid/view/ViewGroup$MarginLayoutParams;

    move-result-object v2

    .restart local v2    # "params":Landroid/view/ViewGroup$MarginLayoutParams;
    goto/16 :goto_56

    .line 552
    .end local v0    # "bg":Landroid/graphics/drawable/GradientDrawable;
    .end local v2    # "params":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_130
    iget-object v6, p0, Lcom/nispok/snackbar/Snackbar;->mMaxWidthPercentage:Ljava/lang/Float;

    .line 553
    invoke-static {p2, v6}, Lcom/nispok/snackbar/DisplayCompat;->getWidthFromPercentage(Landroid/app/Activity;Ljava/lang/Float;)I

    move-result v6

    goto :goto_10b

    .line 606
    .restart local v2    # "params":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v5    # "snackbarAction":Landroid/widget/TextView;
    :cond_137
    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_ce
.end method

.method private isIndefiniteDuration()Z
    .registers 5

    .prologue
    .line 834
    invoke-virtual {p0}, Lcom/nispok/snackbar/Snackbar;->getDuration()J

    move-result-wide v0

    sget-object v2, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;->LENGTH_INDEFINITE:Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

    invoke-virtual {v2}, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;->getDuration()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method private isNavigationBarHidden(Landroid/view/ViewGroup;)Z
    .registers 6
    .param p1, "root"    # Landroid/view/ViewGroup;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 840
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-ge v2, v3, :cond_8

    .line 845
    :cond_7
    :goto_7
    return v1

    .line 844
    :cond_8
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getWindowSystemUiVisibility()I

    move-result v0

    .line 845
    .local v0, "viewFlags":I
    and-int/lit16 v2, v0, 0x200

    const/16 v3, 0x200

    if-ne v2, v3, :cond_7

    const/4 v1, 0x1

    goto :goto_7
.end method

.method private isNavigationBarTranslucent(Landroid/app/Activity;)Z
    .registers 6
    .param p1, "targetActivity"    # Landroid/app/Activity;

    .prologue
    const/4 v1, 0x0

    .line 851
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-ge v2, v3, :cond_8

    .line 856
    :cond_7
    :goto_7
    return v1

    .line 855
    :cond_8
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    iget v0, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 856
    .local v0, "flags":I
    const/high16 v2, 0x8000000

    and-int/2addr v2, v0

    if-eqz v2, :cond_7

    const/4 v1, 0x1

    goto :goto_7
.end method

.method public static setBackgroundDrawable(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p0, "view"    # Landroid/view/View;
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 1097
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_a

    .line 1098
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1102
    :goto_9
    return-void

    .line 1100
    :cond_a
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_9
.end method

.method private shouldStartTimer()Z
    .registers 2

    .prologue
    .line 830
    invoke-direct {p0}, Lcom/nispok/snackbar/Snackbar;->isIndefiniteDuration()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method static shouldUsePhoneLayout(Landroid/content/Context;)Z
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 521
    if-nez p0, :cond_4

    .line 522
    const/4 v0, 0x1

    .line 524
    :goto_3
    return v0

    :cond_4
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/nispok/snackbar/R$bool;->sb__is_phone:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    goto :goto_3
.end method

.method private showInternal(Landroid/app/Activity;Landroid/view/ViewGroup$MarginLayoutParams;Landroid/view/ViewGroup;)V
    .registers 7
    .param p1, "targetActivity"    # Landroid/app/Activity;
    .param p2, "params"    # Landroid/view/ViewGroup$MarginLayoutParams;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 753
    invoke-virtual {p3, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 755
    invoke-virtual {p3, p0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 757
    invoke-virtual {p0}, Lcom/nispok/snackbar/Snackbar;->bringToFront()V

    .line 760
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-ge v1, v2, :cond_15

    .line 761
    invoke-virtual {p3}, Landroid/view/ViewGroup;->requestLayout()V

    .line 762
    invoke-virtual {p3}, Landroid/view/ViewGroup;->invalidate()V

    .line 765
    :cond_15
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/nispok/snackbar/Snackbar;->mIsShowing:Z

    .line 766
    iput-object p1, p0, Lcom/nispok/snackbar/Snackbar;->mTargetActivity:Landroid/app/Activity;

    .line 768
    invoke-virtual {p0}, Lcom/nispok/snackbar/Snackbar;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    new-instance v2, Lcom/nispok/snackbar/Snackbar$6;

    invoke-direct {v2, p0}, Lcom/nispok/snackbar/Snackbar$6;-><init>(Lcom/nispok/snackbar/Snackbar;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 787
    iget-boolean v1, p0, Lcom/nispok/snackbar/Snackbar;->mAnimated:Z

    if-nez v1, :cond_34

    .line 788
    invoke-direct {p0}, Lcom/nispok/snackbar/Snackbar;->shouldStartTimer()Z

    move-result v1

    if-eqz v1, :cond_33

    .line 789
    invoke-direct {p0}, Lcom/nispok/snackbar/Snackbar;->startTimer()V

    .line 827
    :cond_33
    :goto_33
    return-void

    .line 794
    :cond_34
    invoke-virtual {p0}, Lcom/nispok/snackbar/Snackbar;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/nispok/snackbar/Snackbar;->mPosition:Lcom/nispok/snackbar/Snackbar$SnackbarPosition;

    invoke-static {v2}, Lcom/nispok/snackbar/Snackbar;->getInAnimationResource(Lcom/nispok/snackbar/Snackbar$SnackbarPosition;)I

    move-result v2

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 795
    .local v0, "slideIn":Landroid/view/animation/Animation;
    new-instance v1, Lcom/nispok/snackbar/Snackbar$7;

    invoke-direct {v1, p0}, Lcom/nispok/snackbar/Snackbar$7;-><init>(Lcom/nispok/snackbar/Snackbar;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 826
    invoke-virtual {p0, v0}, Lcom/nispok/snackbar/Snackbar;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_33
.end method

.method private startTimer()V
    .registers 4

    .prologue
    .line 860
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mDismissRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0}, Lcom/nispok/snackbar/Snackbar;->getDuration()J

    move-result-wide v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/nispok/snackbar/Snackbar;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 861
    return-void
.end method

.method private startTimer(J)V
    .registers 4
    .param p1, "duration"    # J

    .prologue
    .line 864
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mDismissRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0, p1, p2}, Lcom/nispok/snackbar/Snackbar;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 865
    return-void
.end method

.method private updateWindowInsets(Landroid/app/Activity;Landroid/graphics/Rect;)V
    .registers 16
    .param p1, "targetActivity"    # Landroid/app/Activity;
    .param p2, "outInsets"    # Landroid/graphics/Rect;

    .prologue
    .line 652
    const/4 v11, 0x0

    iput v11, p2, Landroid/graphics/Rect;->bottom:I

    iput v11, p2, Landroid/graphics/Rect;->right:I

    iput v11, p2, Landroid/graphics/Rect;->top:I

    iput v11, p2, Landroid/graphics/Rect;->left:I

    .line 654
    if-nez p1, :cond_c

    .line 689
    :cond_b
    :goto_b
    return-void

    .line 658
    :cond_c
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 659
    .local v0, "decorView":Landroid/view/ViewGroup;
    invoke-virtual {p1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v11

    invoke-interface {v11}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    .line 661
    .local v3, "display":Landroid/view/Display;
    invoke-direct {p0, p1}, Lcom/nispok/snackbar/Snackbar;->isNavigationBarTranslucent(Landroid/app/Activity;)Z

    move-result v5

    .line 662
    .local v5, "isTranslucent":Z
    invoke-direct {p0, v0}, Lcom/nispok/snackbar/Snackbar;->isNavigationBarHidden(Landroid/view/ViewGroup;)Z

    move-result v4

    .line 664
    .local v4, "isHidden":Z
    iget-object v1, p0, Lcom/nispok/snackbar/Snackbar;->mDisplayFrame:Landroid/graphics/Rect;

    .line 665
    .local v1, "dispFrame":Landroid/graphics/Rect;
    iget-object v10, p0, Lcom/nispok/snackbar/Snackbar;->mRealDisplaySize:Landroid/graphics/Point;

    .line 666
    .local v10, "realDispSize":Landroid/graphics/Point;
    iget-object v2, p0, Lcom/nispok/snackbar/Snackbar;->mDisplaySize:Landroid/graphics/Point;

    .line 668
    .local v2, "dispSize":Landroid/graphics/Point;
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 670
    invoke-static {v3, v10}, Lcom/nispok/snackbar/DisplayCompat;->getRealSize(Landroid/view/Display;Landroid/graphics/Point;)V

    .line 671
    invoke-static {v3, v2}, Lcom/nispok/snackbar/DisplayCompat;->getSize(Landroid/view/Display;Landroid/graphics/Point;)V

    .line 673
    iget v11, v2, Landroid/graphics/Point;->x:I

    iget v12, v10, Landroid/graphics/Point;->x:I

    if-ge v11, v12, :cond_57

    .line 675
    if-nez v5, :cond_3f

    if-eqz v4, :cond_b

    .line 676
    :cond_3f
    iget v11, v10, Landroid/graphics/Point;->x:I

    iget v12, v2, Landroid/graphics/Point;->x:I

    sub-int v7, v11, v12

    .line 677
    .local v7, "navBarWidth":I
    iget v11, v10, Landroid/graphics/Point;->x:I

    iget v12, v1, Landroid/graphics/Rect;->right:I

    sub-int v9, v11, v12

    .line 678
    .local v9, "overlapWidth":I
    invoke-static {v7, v9}, Ljava/lang/Math;->min(II)I

    move-result v11

    const/4 v12, 0x0

    invoke-static {v11, v12}, Ljava/lang/Math;->max(II)I

    move-result v11

    iput v11, p2, Landroid/graphics/Rect;->right:I

    goto :goto_b

    .line 680
    .end local v7    # "navBarWidth":I
    .end local v9    # "overlapWidth":I
    :cond_57
    iget v11, v2, Landroid/graphics/Point;->y:I

    iget v12, v10, Landroid/graphics/Point;->y:I

    if-ge v11, v12, :cond_b

    .line 683
    if-nez v5, :cond_61

    if-eqz v4, :cond_b

    .line 684
    :cond_61
    iget v11, v10, Landroid/graphics/Point;->y:I

    iget v12, v2, Landroid/graphics/Point;->y:I

    sub-int v6, v11, v12

    .line 685
    .local v6, "navBarHeight":I
    iget v11, v10, Landroid/graphics/Point;->y:I

    iget v12, v1, Landroid/graphics/Rect;->bottom:I

    sub-int v8, v11, v12

    .line 686
    .local v8, "overlapHeight":I
    invoke-static {v6, v8}, Ljava/lang/Math;->min(II)I

    move-result v11

    const/4 v12, 0x0

    invoke-static {v11, v12}, Ljava/lang/Math;->max(II)I

    move-result v11

    iput v11, p2, Landroid/graphics/Rect;->bottom:I

    goto :goto_b
.end method

.method public static with(Landroid/content/Context;)Lcom/nispok/snackbar/Snackbar;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 139
    new-instance v0, Lcom/nispok/snackbar/Snackbar;

    invoke-direct {v0, p0}, Lcom/nispok/snackbar/Snackbar;-><init>(Landroid/content/Context;)V

    return-object v0
.end method


# virtual methods
.method public actionColor(I)Lcom/nispok/snackbar/Snackbar;
    .registers 2
    .param p1, "actionColor"    # I

    .prologue
    .line 312
    iput p1, p0, Lcom/nispok/snackbar/Snackbar;->mActionColor:I

    .line 313
    return-object p0
.end method

.method public actionColorResource(I)Lcom/nispok/snackbar/Snackbar;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 324
    invoke-virtual {p0}, Lcom/nispok/snackbar/Snackbar;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/nispok/snackbar/Snackbar;->actionColor(I)Lcom/nispok/snackbar/Snackbar;

    move-result-object v0

    return-object v0
.end method

.method public actionLabel(I)Lcom/nispok/snackbar/Snackbar;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 250
    invoke-virtual {p0}, Lcom/nispok/snackbar/Snackbar;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/nispok/snackbar/Snackbar;->actionLabel(Ljava/lang/CharSequence;)Lcom/nispok/snackbar/Snackbar;

    move-result-object v0

    return-object v0
.end method

.method public actionLabel(Ljava/lang/CharSequence;)Lcom/nispok/snackbar/Snackbar;
    .registers 2
    .param p1, "actionButtonLabel"    # Ljava/lang/CharSequence;

    .prologue
    .line 238
    iput-object p1, p0, Lcom/nispok/snackbar/Snackbar;->mActionLabel:Ljava/lang/CharSequence;

    .line 239
    return-object p0
.end method

.method public actionLabelTypeface(Landroid/graphics/Typeface;)Lcom/nispok/snackbar/Snackbar;
    .registers 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 493
    iput-object p1, p0, Lcom/nispok/snackbar/Snackbar;->mActionTypeface:Landroid/graphics/Typeface;

    .line 494
    return-object p0
.end method

.method public actionListener(Lcom/nispok/snackbar/listeners/ActionClickListener;)Lcom/nispok/snackbar/Snackbar;
    .registers 2
    .param p1, "listener"    # Lcom/nispok/snackbar/listeners/ActionClickListener;

    .prologue
    .line 347
    iput-object p1, p0, Lcom/nispok/snackbar/Snackbar;->mActionClickListener:Lcom/nispok/snackbar/listeners/ActionClickListener;

    .line 348
    return-object p0
.end method

.method public allowMultipleActionClicks(Z)Lcom/nispok/snackbar/Snackbar;
    .registers 2
    .param p1, "shouldAllow"    # Z

    .prologue
    .line 372
    iput-boolean p1, p0, Lcom/nispok/snackbar/Snackbar;->mShouldAllowMultipleActionClicks:Z

    .line 373
    return-object p0
.end method

.method public animation(Z)Lcom/nispok/snackbar/Snackbar;
    .registers 2
    .param p1, "withAnimation"    # Z

    .prologue
    .line 394
    iput-boolean p1, p0, Lcom/nispok/snackbar/Snackbar;->mAnimated:Z

    .line 395
    return-object p0
.end method

.method public attachToAbsListView(Landroid/widget/AbsListView;)Lcom/nispok/snackbar/Snackbar;
    .registers 3
    .param p1, "absListView"    # Landroid/widget/AbsListView;

    .prologue
    .line 440
    new-instance v0, Lcom/nispok/snackbar/Snackbar$3;

    invoke-direct {v0, p0}, Lcom/nispok/snackbar/Snackbar$3;-><init>(Lcom/nispok/snackbar/Snackbar;)V

    invoke-virtual {p1, v0}, Landroid/widget/AbsListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 452
    return-object p0
.end method

.method public attachToRecyclerView(Landroid/view/View;)Lcom/nispok/snackbar/Snackbar;
    .registers 5
    .param p1, "recyclerView"    # Landroid/view/View;

    .prologue
    .line 464
    :try_start_0
    const-string v1, "android.support.v7.widget.RecyclerView"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 467
    invoke-static {p0, p1}, Lcom/nispok/snackbar/RecyclerUtil;->setScrollListener(Lcom/nispok/snackbar/Snackbar;Landroid/view/View;)V
    :try_end_8
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_8} :catch_9

    .line 472
    return-object p0

    .line 468
    :catch_9
    move-exception v0

    .line 469
    .local v0, "ignored":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "RecyclerView not found. Did you add it to your dependencies?"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public backgroundDrawable(I)Lcom/nispok/snackbar/Snackbar;
    .registers 2
    .param p1, "resId"    # I

    .prologue
    .line 205
    iput p1, p0, Lcom/nispok/snackbar/Snackbar;->mDrawable:I

    .line 206
    return-object p0
.end method

.method public color(I)Lcom/nispok/snackbar/Snackbar;
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 184
    iput p1, p0, Lcom/nispok/snackbar/Snackbar;->mColor:I

    .line 185
    return-object p0
.end method

.method public colorResource(I)Lcom/nispok/snackbar/Snackbar;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 195
    invoke-virtual {p0}, Lcom/nispok/snackbar/Snackbar;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/nispok/snackbar/Snackbar;->color(I)Lcom/nispok/snackbar/Snackbar;

    move-result-object v0

    return-object v0
.end method

.method public dismiss()V
    .registers 2

    .prologue
    .line 873
    iget-boolean v0, p0, Lcom/nispok/snackbar/Snackbar;->mAnimated:Z

    invoke-direct {p0, v0}, Lcom/nispok/snackbar/Snackbar;->dismiss(Z)V

    .line 874
    return-void
.end method

.method public dismissByReplace()V
    .registers 2

    .prologue
    .line 868
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nispok/snackbar/Snackbar;->mIsReplacePending:Z

    .line 869
    invoke-virtual {p0}, Lcom/nispok/snackbar/Snackbar;->dismiss()V

    .line 870
    return-void
.end method

.method public dismissOnActionClicked(Z)Lcom/nispok/snackbar/Snackbar;
    .registers 2
    .param p1, "shouldDismiss"    # Z

    .prologue
    .line 334
    iput-boolean p1, p0, Lcom/nispok/snackbar/Snackbar;->mShouldDismissOnActionClicked:Z

    .line 335
    return-object p0
.end method

.method dispatchOnWindowSystemUiVisibilityChangedCompat(I)V
    .registers 2
    .param p1, "visible"    # I

    .prologue
    .line 945
    invoke-virtual {p0, p1}, Lcom/nispok/snackbar/Snackbar;->onWindowSystemUiVisibilityChangedCompat(I)V

    .line 946
    return-void
.end method

.method public duration(J)Lcom/nispok/snackbar/Snackbar;
    .registers 5
    .param p1, "duration"    # J

    .prologue
    .line 428
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_9

    .end local p1    # "duration":J
    :goto_6
    iput-wide p1, p0, Lcom/nispok/snackbar/Snackbar;->mCustomDuration:J

    .line 429
    return-object p0

    .line 428
    .restart local p1    # "duration":J
    :cond_9
    iget-wide p1, p0, Lcom/nispok/snackbar/Snackbar;->mCustomDuration:J

    goto :goto_6
.end method

.method public duration(Lcom/nispok/snackbar/Snackbar$SnackbarDuration;)Lcom/nispok/snackbar/Snackbar;
    .registers 2
    .param p1, "duration"    # Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

    .prologue
    .line 417
    iput-object p1, p0, Lcom/nispok/snackbar/Snackbar;->mDuration:Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

    .line 418
    return-object p0
.end method

.method public eventListener(Lcom/nispok/snackbar/listeners/EventListener;)Lcom/nispok/snackbar/Snackbar;
    .registers 2
    .param p1, "listener"    # Lcom/nispok/snackbar/listeners/EventListener;

    .prologue
    .line 383
    iput-object p1, p0, Lcom/nispok/snackbar/Snackbar;->mEventListener:Lcom/nispok/snackbar/listeners/EventListener;

    .line 384
    return-object p0
.end method

.method public getActionColor()I
    .registers 2

    .prologue
    .line 995
    iget v0, p0, Lcom/nispok/snackbar/Snackbar;->mActionColor:I

    return v0
.end method

.method public getActionLabel()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 999
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mActionLabel:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getColor()I
    .registers 2

    .prologue
    .line 1007
    iget v0, p0, Lcom/nispok/snackbar/Snackbar;->mColor:I

    return v0
.end method

.method public getDuration()J
    .registers 5

    .prologue
    .line 1015
    iget-wide v0, p0, Lcom/nispok/snackbar/Snackbar;->mCustomDuration:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_f

    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mDuration:Lcom/nispok/snackbar/Snackbar$SnackbarDuration;

    invoke-virtual {v0}, Lcom/nispok/snackbar/Snackbar$SnackbarDuration;->getDuration()J

    move-result-wide v0

    :goto_e
    return-wide v0

    :cond_f
    iget-wide v0, p0, Lcom/nispok/snackbar/Snackbar;->mCustomDuration:J

    goto :goto_e
.end method

.method public getOffset()I
    .registers 2

    .prologue
    .line 1038
    iget v0, p0, Lcom/nispok/snackbar/Snackbar;->mOffset:I

    return v0
.end method

.method public getText()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 1011
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getTextColor()I
    .registers 2

    .prologue
    .line 1003
    iget v0, p0, Lcom/nispok/snackbar/Snackbar;->mTextColor:I

    return v0
.end method

.method public getType()Lcom/nispok/snackbar/enums/SnackbarType;
    .registers 2

    .prologue
    .line 1019
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mType:Lcom/nispok/snackbar/enums/SnackbarType;

    return-object v0
.end method

.method public isActionClicked()Z
    .registers 2

    .prologue
    .line 1030
    iget-boolean v0, p0, Lcom/nispok/snackbar/Snackbar;->mActionClicked:Z

    return v0
.end method

.method public isAnimated()Z
    .registers 2

    .prologue
    .line 1042
    iget-boolean v0, p0, Lcom/nispok/snackbar/Snackbar;->mAnimated:Z

    return v0
.end method

.method public isDimissing()Z
    .registers 2

    .prologue
    .line 1060
    iget-boolean v0, p0, Lcom/nispok/snackbar/Snackbar;->mIsDismissing:Z

    return v0
.end method

.method public isDismissed()Z
    .registers 2

    .prologue
    .line 1067
    iget-boolean v0, p0, Lcom/nispok/snackbar/Snackbar;->mIsShowing:Z

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isShowing()Z
    .registers 2

    .prologue
    .line 1053
    iget-boolean v0, p0, Lcom/nispok/snackbar/Snackbar;->mIsShowing:Z

    return v0
.end method

.method public margin(I)Lcom/nispok/snackbar/Snackbar;
    .registers 3
    .param p1, "margin"    # I

    .prologue
    .line 272
    invoke-virtual {p0, p1, p1, p1, p1}, Lcom/nispok/snackbar/Snackbar;->margin(IIII)Lcom/nispok/snackbar/Snackbar;

    move-result-object v0

    return-object v0
.end method

.method public margin(II)Lcom/nispok/snackbar/Snackbar;
    .registers 4
    .param p1, "marginLR"    # I
    .param p2, "marginTB"    # I

    .prologue
    .line 283
    invoke-virtual {p0, p1, p2, p1, p2}, Lcom/nispok/snackbar/Snackbar;->margin(IIII)Lcom/nispok/snackbar/Snackbar;

    move-result-object v0

    return-object v0
.end method

.method public margin(IIII)Lcom/nispok/snackbar/Snackbar;
    .registers 5
    .param p1, "marginLeft"    # I
    .param p2, "marginTop"    # I
    .param p3, "marginRight"    # I
    .param p4, "marginBottom"    # I

    .prologue
    .line 296
    iput p1, p0, Lcom/nispok/snackbar/Snackbar;->mMarginLeft:I

    .line 297
    iput p2, p0, Lcom/nispok/snackbar/Snackbar;->mMarginTop:I

    .line 298
    iput p4, p0, Lcom/nispok/snackbar/Snackbar;->mMarginBottom:I

    .line 299
    iput p3, p0, Lcom/nispok/snackbar/Snackbar;->mMarginRight:I

    .line 301
    return-object p0
.end method

.method public maxWidthPercentage(F)Lcom/nispok/snackbar/Snackbar;
    .registers 3
    .param p1, "maxWidthPercentage"    # F

    .prologue
    .line 748
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mMaxWidthPercentage:Ljava/lang/Float;

    .line 749
    return-object p0
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 935
    invoke-super {p0}, Lcom/nispok/snackbar/layouts/SnackbarLayout;->onDetachedFromWindow()V

    .line 936
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mDismissRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_c

    .line 937
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mDismissRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/nispok/snackbar/Snackbar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 939
    :cond_c
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mRefreshLayoutParamsMarginsRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_15

    .line 940
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mRefreshLayoutParamsMarginsRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/nispok/snackbar/Snackbar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 942
    :cond_15
    return-void
.end method

.method protected onWindowSystemUiVisibilityChangedCompat(I)V
    .registers 3
    .param p1, "visible"    # I

    .prologue
    .line 949
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mRefreshLayoutParamsMarginsRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_9

    .line 950
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mRefreshLayoutParamsMarginsRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/nispok/snackbar/Snackbar;->post(Ljava/lang/Runnable;)Z

    .line 952
    :cond_9
    return-void
.end method

.method public position(Lcom/nispok/snackbar/Snackbar$SnackbarPosition;)Lcom/nispok/snackbar/Snackbar;
    .registers 2
    .param p1, "position"    # Lcom/nispok/snackbar/Snackbar$SnackbarPosition;

    .prologue
    .line 261
    iput-object p1, p0, Lcom/nispok/snackbar/Snackbar;->mPosition:Lcom/nispok/snackbar/Snackbar$SnackbarPosition;

    .line 262
    return-object p0
.end method

.method protected refreshLayoutParamsMargins()V
    .registers 4

    .prologue
    .line 955
    iget-boolean v2, p0, Lcom/nispok/snackbar/Snackbar;->mIsDismissing:Z

    if-eqz v2, :cond_5

    .line 969
    :cond_4
    :goto_4
    return-void

    .line 959
    :cond_5
    invoke-virtual {p0}, Lcom/nispok/snackbar/Snackbar;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 960
    .local v1, "parent":Landroid/view/ViewGroup;
    if-eqz v1, :cond_4

    .line 964
    invoke-virtual {p0}, Lcom/nispok/snackbar/Snackbar;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 966
    .local v0, "params":Landroid/view/ViewGroup$MarginLayoutParams;
    iget-object v2, p0, Lcom/nispok/snackbar/Snackbar;->mTargetActivity:Landroid/app/Activity;

    invoke-virtual {p0, v2, v0}, Lcom/nispok/snackbar/Snackbar;->updateLayoutParamsMargins(Landroid/app/Activity;Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 968
    invoke-virtual {p0, v0}, Lcom/nispok/snackbar/Snackbar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_4
.end method

.method public shouldDismissOnActionClicked()Z
    .registers 2

    .prologue
    .line 1046
    iget-boolean v0, p0, Lcom/nispok/snackbar/Snackbar;->mShouldDismissOnActionClicked:Z

    return v0
.end method

.method public show(Landroid/app/Activity;)V
    .registers 6
    .param p1, "targetActivity"    # Landroid/app/Activity;

    .prologue
    .line 717
    const v3, 0x1020002

    invoke-virtual {p1, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 718
    .local v1, "root":Landroid/view/ViewGroup;
    invoke-static {p1}, Lcom/nispok/snackbar/Snackbar;->shouldUsePhoneLayout(Landroid/content/Context;)Z

    move-result v2

    .line 719
    .local v2, "usePhoneLayout":Z
    invoke-direct {p0, p1, p1, v1, v2}, Lcom/nispok/snackbar/Snackbar;->init(Landroid/content/Context;Landroid/app/Activity;Landroid/view/ViewGroup;Z)Landroid/view/ViewGroup$MarginLayoutParams;

    move-result-object v0

    .line 720
    .local v0, "params":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-virtual {p0, p1, v0}, Lcom/nispok/snackbar/Snackbar;->updateLayoutParamsMargins(Landroid/app/Activity;Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 721
    invoke-direct {p0, p1, v0, v1}, Lcom/nispok/snackbar/Snackbar;->showInternal(Landroid/app/Activity;Landroid/view/ViewGroup$MarginLayoutParams;Landroid/view/ViewGroup;)V

    .line 722
    return-void
.end method

.method public show(Landroid/view/ViewGroup;)V
    .registers 3
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 731
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/nispok/snackbar/Snackbar;->shouldUsePhoneLayout(Landroid/content/Context;)Z

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/nispok/snackbar/Snackbar;->show(Landroid/view/ViewGroup;Z)V

    .line 732
    return-void
.end method

.method public show(Landroid/view/ViewGroup;Z)V
    .registers 6
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "usePhoneLayout"    # Z

    .prologue
    const/4 v2, 0x0

    .line 742
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p0, v1, v2, p1, p2}, Lcom/nispok/snackbar/Snackbar;->init(Landroid/content/Context;Landroid/app/Activity;Landroid/view/ViewGroup;Z)Landroid/view/ViewGroup$MarginLayoutParams;

    move-result-object v0

    .line 743
    .local v0, "params":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-virtual {p0, v2, v0}, Lcom/nispok/snackbar/Snackbar;->updateLayoutParamsMargins(Landroid/app/Activity;Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 744
    invoke-direct {p0, v2, v0, p1}, Lcom/nispok/snackbar/Snackbar;->showInternal(Landroid/app/Activity;Landroid/view/ViewGroup$MarginLayoutParams;Landroid/view/ViewGroup;)V

    .line 745
    return-void
.end method

.method public showByReplace(Landroid/app/Activity;)V
    .registers 3
    .param p1, "targetActivity"    # Landroid/app/Activity;

    .prologue
    .line 696
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nispok/snackbar/Snackbar;->mIsShowingByReplace:Z

    .line 697
    invoke-virtual {p0, p1}, Lcom/nispok/snackbar/Snackbar;->show(Landroid/app/Activity;)V

    .line 698
    return-void
.end method

.method public showByReplace(Landroid/view/ViewGroup;)V
    .registers 3
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 701
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nispok/snackbar/Snackbar;->mIsShowingByReplace:Z

    .line 702
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/nispok/snackbar/Snackbar;->shouldUsePhoneLayout(Landroid/content/Context;)Z

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/nispok/snackbar/Snackbar;->show(Landroid/view/ViewGroup;Z)V

    .line 703
    return-void
.end method

.method public showByReplace(Landroid/view/ViewGroup;Z)V
    .registers 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "usePhoneLayout"    # Z

    .prologue
    .line 706
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nispok/snackbar/Snackbar;->mIsShowingByReplace:Z

    .line 707
    invoke-virtual {p0, p1, p2}, Lcom/nispok/snackbar/Snackbar;->show(Landroid/view/ViewGroup;Z)V

    .line 708
    return-void
.end method

.method public swipeListener(Lcom/nispok/snackbar/listeners/ActionSwipeListener;)Lcom/nispok/snackbar/Snackbar;
    .registers 2
    .param p1, "listener"    # Lcom/nispok/snackbar/listeners/ActionSwipeListener;

    .prologue
    .line 359
    iput-object p1, p0, Lcom/nispok/snackbar/Snackbar;->mActionSwipeListener:Lcom/nispok/snackbar/listeners/ActionSwipeListener;

    .line 360
    return-object p0
.end method

.method public swipeToDismiss(Z)Lcom/nispok/snackbar/Snackbar;
    .registers 2
    .param p1, "canSwipeToDismiss"    # Z

    .prologue
    .line 405
    iput-boolean p1, p0, Lcom/nispok/snackbar/Snackbar;->mCanSwipeToDismiss:Z

    .line 406
    return-object p0
.end method

.method public text(I)Lcom/nispok/snackbar/Snackbar;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 174
    invoke-virtual {p0}, Lcom/nispok/snackbar/Snackbar;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/nispok/snackbar/Snackbar;->text(Ljava/lang/CharSequence;)Lcom/nispok/snackbar/Snackbar;

    move-result-object v0

    return-object v0
.end method

.method public text(Ljava/lang/CharSequence;)Lcom/nispok/snackbar/Snackbar;
    .registers 4
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 160
    iput-object p1, p0, Lcom/nispok/snackbar/Snackbar;->mText:Ljava/lang/CharSequence;

    .line 161
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar;->snackbarText:Landroid/widget/TextView;

    if-eqz v0, :cond_d

    .line 162
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar;->snackbarText:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/nispok/snackbar/Snackbar;->mText:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 164
    :cond_d
    return-object p0
.end method

.method public textColor(I)Lcom/nispok/snackbar/Snackbar;
    .registers 2
    .param p1, "textColor"    # I

    .prologue
    .line 216
    iput p1, p0, Lcom/nispok/snackbar/Snackbar;->mTextColor:I

    .line 217
    return-object p0
.end method

.method public textColorResource(I)Lcom/nispok/snackbar/Snackbar;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 227
    invoke-virtual {p0}, Lcom/nispok/snackbar/Snackbar;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/nispok/snackbar/Snackbar;->textColor(I)Lcom/nispok/snackbar/Snackbar;

    move-result-object v0

    return-object v0
.end method

.method public textTypeface(Landroid/graphics/Typeface;)Lcom/nispok/snackbar/Snackbar;
    .registers 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 482
    iput-object p1, p0, Lcom/nispok/snackbar/Snackbar;->mTextTypeface:Landroid/graphics/Typeface;

    .line 483
    return-object p0
.end method

.method public type(Lcom/nispok/snackbar/enums/SnackbarType;)Lcom/nispok/snackbar/Snackbar;
    .registers 2
    .param p1, "type"    # Lcom/nispok/snackbar/enums/SnackbarType;

    .prologue
    .line 149
    iput-object p1, p0, Lcom/nispok/snackbar/Snackbar;->mType:Lcom/nispok/snackbar/enums/SnackbarType;

    .line 150
    return-object p0
.end method

.method protected updateLayoutParamsMargins(Landroid/app/Activity;Landroid/view/ViewGroup$MarginLayoutParams;)V
    .registers 5
    .param p1, "targetActivity"    # Landroid/app/Activity;
    .param p2, "params"    # Landroid/view/ViewGroup$MarginLayoutParams;

    .prologue
    .line 972
    iget-boolean v0, p0, Lcom/nispok/snackbar/Snackbar;->mUsePhoneLayout:Z

    if-eqz v0, :cond_2c

    .line 974
    iget v0, p0, Lcom/nispok/snackbar/Snackbar;->mMarginTop:I

    iput v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 975
    iget v0, p0, Lcom/nispok/snackbar/Snackbar;->mMarginRight:I

    iput v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 976
    iget v0, p0, Lcom/nispok/snackbar/Snackbar;->mMarginLeft:I

    iput v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 977
    iget v0, p0, Lcom/nispok/snackbar/Snackbar;->mMarginBottom:I

    iput v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 987
    :goto_14
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar;->mWindowInsets:Landroid/graphics/Rect;

    invoke-direct {p0, p1, v0}, Lcom/nispok/snackbar/Snackbar;->updateWindowInsets(Landroid/app/Activity;Landroid/graphics/Rect;)V

    .line 989
    iget v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iget-object v1, p0, Lcom/nispok/snackbar/Snackbar;->mWindowInsets:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->right:I

    add-int/2addr v0, v1

    iput v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 990
    iget v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iget-object v1, p0, Lcom/nispok/snackbar/Snackbar;->mWindowInsets:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v0, v1

    iput v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 991
    return-void

    .line 980
    :cond_2c
    iget v0, p0, Lcom/nispok/snackbar/Snackbar;->mMarginTop:I

    iput v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 981
    iget v0, p0, Lcom/nispok/snackbar/Snackbar;->mMarginRight:I

    iput v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 982
    iget v0, p0, Lcom/nispok/snackbar/Snackbar;->mMarginLeft:I

    iget v1, p0, Lcom/nispok/snackbar/Snackbar;->mOffset:I

    add-int/2addr v0, v1

    iput v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 983
    iget v0, p0, Lcom/nispok/snackbar/Snackbar;->mMarginBottom:I

    iget v1, p0, Lcom/nispok/snackbar/Snackbar;->mOffset:I

    add-int/2addr v0, v1

    iput v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    goto :goto_14
.end method
