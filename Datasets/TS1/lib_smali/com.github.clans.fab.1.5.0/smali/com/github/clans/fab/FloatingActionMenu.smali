.class public Lcom/github/clans/fab/FloatingActionMenu;
.super Landroid/view/ViewGroup;
.source "FloatingActionMenu.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/clans/fab/FloatingActionMenu$OnMenuToggleListener;
    }
.end annotation


# static fields
.field private static final ANIMATION_DURATION:I = 0x12c

.field private static final CLOSED_PLUS_ROTATION:F = 0.0f

.field private static final LABELS_POSITION_LEFT:I = 0x0

.field private static final LABELS_POSITION_RIGHT:I = 0x1

.field private static final OPENED_PLUS_ROTATION_LEFT:F = -135.0f

.field private static final OPENED_PLUS_ROTATION_RIGHT:F = 135.0f

.field private static final OPEN_DOWN:I = 0x1

.field private static final OPEN_UP:I


# instance fields
.field private mAnimationDelayPerItem:I

.field private mBackgroundColor:I

.field private mButtonSpacing:I

.field private mButtonsCount:I

.field private mCloseAnimatorSet:Landroid/animation/AnimatorSet;

.field private mCloseInterpolator:Landroid/view/animation/Interpolator;

.field mGestureDetector:Landroid/view/GestureDetector;

.field private mHideBackgroundAnimator:Landroid/animation/ValueAnimator;

.field private mIcon:Landroid/graphics/drawable/Drawable;

.field private mIconAnimated:Z

.field private mIconToggleSet:Landroid/animation/AnimatorSet;

.field private mImageToggle:Landroid/widget/ImageView;

.field private mIsAnimated:Z

.field private mIsMenuButtonAnimationRunning:Z

.field private mIsSetClosedOnTouchOutside:Z

.field private mLabelsColorNormal:I

.field private mLabelsColorPressed:I

.field private mLabelsColorRipple:I

.field private mLabelsCornerRadius:I

.field private mLabelsEllipsize:I

.field private mLabelsHideAnimation:I

.field private mLabelsMargin:I

.field private mLabelsMaxLines:I

.field private mLabelsPaddingBottom:I

.field private mLabelsPaddingLeft:I

.field private mLabelsPaddingRight:I

.field private mLabelsPaddingTop:I

.field private mLabelsPosition:I

.field private mLabelsShowAnimation:I

.field private mLabelsShowShadow:Z

.field private mLabelsSingleLine:Z

.field private mLabelsStyle:I

.field private mLabelsTextColor:I

.field private mLabelsTextSize:F

.field private mLabelsVerticalOffset:I

.field private mMaxButtonWidth:I

.field private mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

.field private mMenuButtonHideAnimation:Landroid/view/animation/Animation;

.field private mMenuButtonShowAnimation:Landroid/view/animation/Animation;

.field private mMenuColorNormal:I

.field private mMenuColorPressed:I

.field private mMenuColorRipple:I

.field private mMenuFabSize:I

.field private mMenuOpened:Z

.field private mMenuShadowColor:I

.field private mMenuShadowRadius:F

.field private mMenuShadowXOffset:F

.field private mMenuShadowYOffset:F

.field private mMenuShowShadow:Z

.field private mOpenAnimatorSet:Landroid/animation/AnimatorSet;

.field private mOpenDirection:I

.field private mOpenInterpolator:Landroid/view/animation/Interpolator;

.field private mShowBackgroundAnimator:Landroid/animation/ValueAnimator;

.field private mToggleListener:Lcom/github/clans/fab/FloatingActionMenu$OnMenuToggleListener;

.field private mUiHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 102
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/github/clans/fab/FloatingActionMenu;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 103
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 106
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/github/clans/fab/FloatingActionMenu;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 107
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v5, 0x1

    const/high16 v4, 0x41000000    # 8.0f

    const/high16 v3, 0x40400000    # 3.0f

    const/high16 v2, 0x40800000    # 4.0f

    const/4 v1, 0x0

    .line 110
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 39
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mOpenAnimatorSet:Landroid/animation/AnimatorSet;

    .line 40
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mCloseAnimatorSet:Landroid/animation/AnimatorSet;

    .line 43
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mButtonSpacing:I

    .line 46
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsMargin:I

    .line 47
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsVerticalOffset:I

    .line 50
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mUiHandler:Landroid/os/Handler;

    .line 53
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPaddingTop:I

    .line 54
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v4}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPaddingRight:I

    .line 55
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPaddingBottom:I

    .line 56
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v4}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPaddingLeft:I

    .line 59
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v3}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsCornerRadius:I

    .line 66
    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuShadowRadius:F

    .line 67
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuShadowXOffset:F

    .line 68
    iput v3, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuShadowYOffset:F

    .line 76
    iput-boolean v5, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIsAnimated:Z

    .line 82
    iput-boolean v5, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIconAnimated:Z

    .line 541
    new-instance v0, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/github/clans/fab/FloatingActionMenu$4;

    invoke-direct {v2, p0}, Lcom/github/clans/fab/FloatingActionMenu$4;-><init>(Lcom/github/clans/fab/FloatingActionMenu;)V

    invoke-direct {v0, v1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mGestureDetector:Landroid/view/GestureDetector;

    .line 111
    invoke-direct {p0, p1, p2}, Lcom/github/clans/fab/FloatingActionMenu;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 112
    return-void
.end method

.method static synthetic access$000(Lcom/github/clans/fab/FloatingActionMenu;)Z
    .registers 2
    .param p0, "x0"    # Lcom/github/clans/fab/FloatingActionMenu;

    .prologue
    .line 26
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIsAnimated:Z

    return v0
.end method

.method static synthetic access$100(Lcom/github/clans/fab/FloatingActionMenu;)Z
    .registers 2
    .param p0, "x0"    # Lcom/github/clans/fab/FloatingActionMenu;

    .prologue
    .line 26
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIsSetClosedOnTouchOutside:Z

    return v0
.end method

.method static synthetic access$200(Lcom/github/clans/fab/FloatingActionMenu;Z)V
    .registers 2
    .param p0, "x0"    # Lcom/github/clans/fab/FloatingActionMenu;
    .param p1, "x1"    # Z

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/github/clans/fab/FloatingActionMenu;->hideMenuButtonWithImage(Z)V

    return-void
.end method

.method private adjustForOvershoot(I)I
    .registers 3
    .param p1, "dimension"    # I

    .prologue
    .line 399
    mul-int/lit8 v0, p1, 0xc

    div-int/lit8 v0, v0, 0xa

    return v0
.end method

.method private createDefaultIconAnimation()V
    .registers 12

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    const/high16 v4, 0x43070000    # 135.0f

    const/4 v8, 0x0

    const/high16 v3, -0x3cf90000    # -135.0f

    .line 243
    iget-object v5, p0, Lcom/github/clans/fab/FloatingActionMenu;->mImageToggle:Landroid/widget/ImageView;

    const-string v6, "rotation"

    const/4 v2, 0x2

    new-array v7, v2, [F

    iget v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPosition:I

    if-nez v2, :cond_55

    move v2, v3

    :goto_13
    aput v2, v7, v9

    aput v8, v7, v10

    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 250
    .local v0, "collapseAnimator":Landroid/animation/ObjectAnimator;
    iget-object v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mImageToggle:Landroid/widget/ImageView;

    const-string v5, "rotation"

    const/4 v6, 0x2

    new-array v6, v6, [F

    aput v8, v6, v9

    iget v7, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPosition:I

    if-nez v7, :cond_57

    :goto_28
    aput v3, v6, v10

    invoke-static {v2, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 256
    .local v1, "expandAnimator":Landroid/animation/ObjectAnimator;
    iget-object v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mOpenAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v2, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 257
    iget-object v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mCloseAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 259
    iget-object v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mOpenAnimatorSet:Landroid/animation/AnimatorSet;

    iget-object v3, p0, Lcom/github/clans/fab/FloatingActionMenu;->mOpenInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 260
    iget-object v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mCloseAnimatorSet:Landroid/animation/AnimatorSet;

    iget-object v3, p0, Lcom/github/clans/fab/FloatingActionMenu;->mCloseInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 262
    iget-object v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mOpenAnimatorSet:Landroid/animation/AnimatorSet;

    const-wide/16 v3, 0x12c

    invoke-virtual {v2, v3, v4}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 263
    iget-object v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mCloseAnimatorSet:Landroid/animation/AnimatorSet;

    const-wide/16 v3, 0x12c

    invoke-virtual {v2, v3, v4}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 264
    return-void

    .end local v0    # "collapseAnimator":Landroid/animation/ObjectAnimator;
    .end local v1    # "expandAnimator":Landroid/animation/ObjectAnimator;
    :cond_55
    move v2, v4

    .line 243
    goto :goto_13

    .restart local v0    # "collapseAnimator":Landroid/animation/ObjectAnimator;
    :cond_57
    move v3, v4

    .line 250
    goto :goto_28
.end method

.method private createLabels()V
    .registers 12

    .prologue
    const/4 v10, 0x0

    .line 412
    new-instance v0, Landroid/view/ContextThemeWrapper;

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getContext()Landroid/content/Context;

    move-result-object v7

    iget v8, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsStyle:I

    invoke-direct {v0, v7, v8}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 414
    .local v0, "context":Landroid/content/Context;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_d
    iget v7, p0, Lcom/github/clans/fab/FloatingActionMenu;->mButtonsCount:I

    if-ge v2, v7, :cond_df

    .line 416
    invoke-virtual {p0, v2}, Lcom/github/clans/fab/FloatingActionMenu;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    iget-object v8, p0, Lcom/github/clans/fab/FloatingActionMenu;->mImageToggle:Landroid/widget/ImageView;

    if-ne v7, v8, :cond_1c

    .line 414
    :cond_19
    :goto_19
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 418
    :cond_1c
    invoke-virtual {p0, v2}, Lcom/github/clans/fab/FloatingActionMenu;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/github/clans/fab/FloatingActionButton;

    .line 419
    .local v1, "fab":Lcom/github/clans/fab/FloatingActionButton;
    invoke-virtual {v1}, Lcom/github/clans/fab/FloatingActionButton;->getLabelText()Ljava/lang/String;

    move-result-object v5

    .line 421
    .local v5, "text":Ljava/lang/String;
    iget-object v7, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    if-eq v1, v7, :cond_19

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_19

    sget v7, Lcom/github/clans/fab/R$id;->fab_label:I

    invoke-virtual {v1, v7}, Lcom/github/clans/fab/FloatingActionButton;->getTag(I)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_19

    .line 425
    new-instance v3, Lcom/github/clans/fab/Label;

    invoke-direct {v3, v0}, Lcom/github/clans/fab/Label;-><init>(Landroid/content/Context;)V

    .line 426
    .local v3, "label":Lcom/github/clans/fab/Label;
    invoke-virtual {v3, v1}, Lcom/github/clans/fab/Label;->setFab(Lcom/github/clans/fab/FloatingActionButton;)V

    .line 427
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getContext()Landroid/content/Context;

    move-result-object v7

    iget v8, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsShowAnimation:I

    invoke-static {v7, v8}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v7

    invoke-virtual {v3, v7}, Lcom/github/clans/fab/Label;->setShowAnimation(Landroid/view/animation/Animation;)V

    .line 428
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getContext()Landroid/content/Context;

    move-result-object v7

    iget v8, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsHideAnimation:I

    invoke-static {v7, v8}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v7

    invoke-virtual {v3, v7}, Lcom/github/clans/fab/Label;->setHideAnimation(Landroid/view/animation/Animation;)V

    .line 430
    iget v7, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsStyle:I

    if-lez v7, :cond_7a

    .line 431
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getContext()Landroid/content/Context;

    move-result-object v7

    iget v8, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsStyle:I

    invoke-virtual {v3, v7, v8}, Lcom/github/clans/fab/Label;->setTextAppearance(Landroid/content/Context;I)V

    .line 432
    invoke-virtual {v3, v10}, Lcom/github/clans/fab/Label;->setShowShadow(Z)V

    .line 433
    const/4 v7, 0x1

    invoke-virtual {v3, v7}, Lcom/github/clans/fab/Label;->setUsingStyle(Z)V

    .line 466
    :cond_6e
    :goto_6e
    invoke-virtual {v3, v5}, Lcom/github/clans/fab/Label;->setText(Ljava/lang/CharSequence;)V

    .line 468
    invoke-virtual {p0, v3}, Lcom/github/clans/fab/FloatingActionMenu;->addView(Landroid/view/View;)V

    .line 469
    sget v7, Lcom/github/clans/fab/R$id;->fab_label:I

    invoke-virtual {v1, v7, v3}, Lcom/github/clans/fab/FloatingActionButton;->setTag(ILjava/lang/Object;)V

    goto :goto_19

    .line 435
    :cond_7a
    iget v7, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsColorNormal:I

    iget v8, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsColorPressed:I

    iget v9, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsColorRipple:I

    invoke-virtual {v3, v7, v8, v9}, Lcom/github/clans/fab/Label;->setColors(III)V

    .line 436
    iget-boolean v7, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsShowShadow:Z

    invoke-virtual {v3, v7}, Lcom/github/clans/fab/Label;->setShowShadow(Z)V

    .line 437
    iget v7, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsCornerRadius:I

    invoke-virtual {v3, v7}, Lcom/github/clans/fab/Label;->setCornerRadius(I)V

    .line 438
    iget v7, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsEllipsize:I

    if-lez v7, :cond_94

    .line 439
    invoke-direct {p0, v3}, Lcom/github/clans/fab/FloatingActionMenu;->setLabelEllipsize(Lcom/github/clans/fab/Label;)V

    .line 441
    :cond_94
    iget v7, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsMaxLines:I

    invoke-virtual {v3, v7}, Lcom/github/clans/fab/Label;->setMaxLines(I)V

    .line 442
    invoke-virtual {v3}, Lcom/github/clans/fab/Label;->updateBackground()V

    .line 444
    iget v7, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsTextSize:F

    invoke-virtual {v3, v10, v7}, Lcom/github/clans/fab/Label;->setTextSize(IF)V

    .line 445
    iget v7, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsTextColor:I

    invoke-virtual {v3, v7}, Lcom/github/clans/fab/Label;->setTextColor(I)V

    .line 447
    iget v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPaddingLeft:I

    .line 448
    .local v4, "left":I
    iget v6, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPaddingTop:I

    .line 449
    .local v6, "top":I
    iget-boolean v7, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsShowShadow:Z

    if-eqz v7, :cond_ca

    .line 450
    invoke-virtual {v1}, Lcom/github/clans/fab/FloatingActionButton;->getShadowRadius()I

    move-result v7

    invoke-virtual {v1}, Lcom/github/clans/fab/FloatingActionButton;->getShadowXOffset()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    add-int/2addr v7, v8

    add-int/2addr v4, v7

    .line 451
    invoke-virtual {v1}, Lcom/github/clans/fab/FloatingActionButton;->getShadowRadius()I

    move-result v7

    invoke-virtual {v1}, Lcom/github/clans/fab/FloatingActionButton;->getShadowYOffset()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    add-int/2addr v7, v8

    add-int/2addr v6, v7

    .line 454
    :cond_ca
    iget v7, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPaddingLeft:I

    iget v8, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPaddingTop:I

    invoke-virtual {v3, v4, v6, v7, v8}, Lcom/github/clans/fab/Label;->setPadding(IIII)V

    .line 461
    iget v7, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsMaxLines:I

    if-ltz v7, :cond_d9

    iget-boolean v7, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsSingleLine:Z

    if-eqz v7, :cond_6e

    .line 462
    :cond_d9
    iget-boolean v7, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsSingleLine:Z

    invoke-virtual {v3, v7}, Lcom/github/clans/fab/Label;->setSingleLine(Z)V

    goto :goto_6e

    .line 471
    .end local v1    # "fab":Lcom/github/clans/fab/FloatingActionButton;
    .end local v3    # "label":Lcom/github/clans/fab/Label;
    .end local v4    # "left":I
    .end local v5    # "text":Ljava/lang/String;
    .end local v6    # "top":I
    :cond_df
    return-void
.end method

.method private createMenuButton()V
    .registers 5

    .prologue
    .line 213
    new-instance v0, Lcom/github/clans/fab/FloatingActionButton;

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/github/clans/fab/FloatingActionButton;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    .line 215
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    iget-boolean v1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuShowShadow:Z

    iput-boolean v1, v0, Lcom/github/clans/fab/FloatingActionButton;->mShowShadow:Z

    .line 216
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuShowShadow:Z

    if-eqz v0, :cond_3f

    .line 217
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuShadowRadius:F

    invoke-static {v1, v2}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v1

    iput v1, v0, Lcom/github/clans/fab/FloatingActionButton;->mShadowRadius:I

    .line 218
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuShadowXOffset:F

    invoke-static {v1, v2}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v1

    iput v1, v0, Lcom/github/clans/fab/FloatingActionButton;->mShadowXOffset:I

    .line 219
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuShadowYOffset:F

    invoke-static {v1, v2}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v1

    iput v1, v0, Lcom/github/clans/fab/FloatingActionButton;->mShadowYOffset:I

    .line 221
    :cond_3f
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    iget v1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuColorNormal:I

    iget v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuColorPressed:I

    iget v3, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuColorRipple:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/github/clans/fab/FloatingActionButton;->setColors(III)V

    .line 222
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    iget v1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuShadowColor:I

    iput v1, v0, Lcom/github/clans/fab/FloatingActionButton;->mShadowColor:I

    .line 223
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    iget v1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuFabSize:I

    iput v1, v0, Lcom/github/clans/fab/FloatingActionButton;->mFabSize:I

    .line 224
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    invoke-virtual {v0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V

    .line 226
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    new-instance v1, Lcom/github/clans/fab/FloatingActionMenu$3;

    invoke-direct {v1, p0}, Lcom/github/clans/fab/FloatingActionMenu$3;-><init>(Lcom/github/clans/fab/FloatingActionMenu;)V

    invoke-virtual {v0, v1}, Lcom/github/clans/fab/FloatingActionButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 233
    new-instance v0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mImageToggle:Landroid/widget/ImageView;

    .line 234
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mImageToggle:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 236
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    invoke-super {p0}, Landroid/view/ViewGroup;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/github/clans/fab/FloatingActionMenu;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 237
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mImageToggle:Landroid/widget/ImageView;

    invoke-virtual {p0, v0}, Lcom/github/clans/fab/FloatingActionMenu;->addView(Landroid/view/View;)V

    .line 239
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionMenu;->createDefaultIconAnimation()V

    .line 240
    return-void
.end method

.method private hideMenuButtonWithImage(Z)V
    .registers 4
    .param p1, "animate"    # Z

    .prologue
    .line 512
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->isMenuButtonHidden()Z

    move-result v0

    if-nez v0, :cond_1d

    .line 513
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    invoke-virtual {v0, p1}, Lcom/github/clans/fab/FloatingActionButton;->hide(Z)V

    .line 514
    if-eqz p1, :cond_14

    .line 515
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mImageToggle:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButtonHideAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 517
    :cond_14
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mImageToggle:Landroid/widget/ImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 518
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIsMenuButtonAnimationRunning:Z

    .line 520
    :cond_1d
    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v7, 0x1

    const/4 v6, -0x1

    const/4 v5, 0x0

    .line 115
    sget-object v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu:[I

    invoke-virtual {p1, p2, v2, v5, v5}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 116
    .local v0, "attr":Landroid/content/res/TypedArray;
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_buttonSpacing:I

    iget v3, p0, Lcom/github/clans/fab/FloatingActionMenu;->mButtonSpacing:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mButtonSpacing:I

    .line 117
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_labels_margin:I

    iget v3, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsMargin:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsMargin:I

    .line 118
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_labels_position:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPosition:I

    .line 119
    sget v3, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_labels_showAnimation:I

    iget v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPosition:I

    if-nez v2, :cond_18d

    sget v2, Lcom/github/clans/fab/R$anim;->fab_slide_in_from_right:I

    :goto_2d
    invoke-virtual {v0, v3, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsShowAnimation:I

    .line 121
    sget v3, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_labels_hideAnimation:I

    iget v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPosition:I

    if-nez v2, :cond_191

    sget v2, Lcom/github/clans/fab/R$anim;->fab_slide_out_to_right:I

    :goto_3b
    invoke-virtual {v0, v3, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsHideAnimation:I

    .line 123
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_labels_paddingTop:I

    iget v3, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPaddingTop:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPaddingTop:I

    .line 124
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_labels_paddingRight:I

    iget v3, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPaddingRight:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPaddingRight:I

    .line 125
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_labels_paddingBottom:I

    iget v3, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPaddingBottom:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPaddingBottom:I

    .line 126
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_labels_paddingLeft:I

    iget v3, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPaddingLeft:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPaddingLeft:I

    .line 127
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_labels_textColor:I

    invoke-virtual {v0, v2, v6}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsTextColor:I

    .line 128
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_labels_textSize:I

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/github/clans/fab/R$dimen;->labels_text_size:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsTextSize:F

    .line 129
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_labels_cornerRadius:I

    iget v3, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsCornerRadius:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsCornerRadius:I

    .line 130
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_labels_showShadow:I

    invoke-virtual {v0, v2, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsShowShadow:Z

    .line 131
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_labels_colorNormal:I

    const v3, -0xcccccd

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsColorNormal:I

    .line 132
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_labels_colorPressed:I

    const v3, -0xbbbbbc

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsColorPressed:I

    .line 133
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_labels_colorRipple:I

    const v3, 0x66ffffff

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsColorRipple:I

    .line 134
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_showShadow:I

    invoke-virtual {v0, v2, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuShowShadow:Z

    .line 135
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_shadowColor:I

    const/high16 v3, 0x66000000

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuShadowColor:I

    .line 136
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_shadowRadius:I

    iget v3, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuShadowRadius:F

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuShadowRadius:F

    .line 137
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_shadowXOffset:I

    iget v3, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuShadowXOffset:F

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuShadowXOffset:F

    .line 138
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_shadowYOffset:I

    iget v3, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuShadowYOffset:F

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuShadowYOffset:F

    .line 139
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_colorNormal:I

    const v3, -0x25bcca

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuColorNormal:I

    .line 140
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_colorPressed:I

    const v3, -0x18afbd

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuColorPressed:I

    .line 141
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_colorRipple:I

    const v3, -0x66000001

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuColorRipple:I

    .line 142
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_animationDelayPerItem:I

    const/16 v3, 0x32

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mAnimationDelayPerItem:I

    .line 143
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_icon:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIcon:Landroid/graphics/drawable/Drawable;

    .line 144
    iget-object v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIcon:Landroid/graphics/drawable/Drawable;

    if-nez v2, :cond_129

    .line 145
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/github/clans/fab/R$drawable;->fab_add:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIcon:Landroid/graphics/drawable/Drawable;

    .line 147
    :cond_129
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_labels_singleLine:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsSingleLine:Z

    .line 148
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_labels_ellipsize:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsEllipsize:I

    .line 149
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_labels_maxLines:I

    invoke-virtual {v0, v2, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsMaxLines:I

    .line 150
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_fab_size:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuFabSize:I

    .line 151
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_labels_style:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsStyle:I

    .line 152
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_openDirection:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mOpenDirection:I

    .line 153
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_backgroundColor:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mBackgroundColor:I

    .line 155
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_labels_padding:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_172

    .line 156
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionMenu_menu_labels_padding:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    .line 157
    .local v1, "padding":I
    invoke-direct {p0, v1}, Lcom/github/clans/fab/FloatingActionMenu;->initPadding(I)V

    .line 159
    .end local v1    # "padding":I
    :cond_172
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 161
    new-instance v2, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v2}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    iput-object v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mOpenInterpolator:Landroid/view/animation/Interpolator;

    .line 162
    new-instance v2, Landroid/view/animation/AnticipateInterpolator;

    invoke-direct {v2}, Landroid/view/animation/AnticipateInterpolator;-><init>()V

    iput-object v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mCloseInterpolator:Landroid/view/animation/Interpolator;

    .line 164
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionMenu;->initMenuButtonAnimations()V

    .line 165
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionMenu;->initBackgroundDimAnimation()V

    .line 166
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionMenu;->createMenuButton()V

    .line 167
    return-void

    .line 119
    :cond_18d
    sget v2, Lcom/github/clans/fab/R$anim;->fab_slide_in_from_left:I

    goto/16 :goto_2d

    .line 121
    :cond_191
    sget v2, Lcom/github/clans/fab/R$anim;->fab_slide_out_to_left:I

    goto/16 :goto_3b
.end method

.method private initBackgroundDimAnimation()V
    .registers 12

    .prologue
    const-wide/16 v9, 0x12c

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 175
    iget v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mBackgroundColor:I

    invoke-static {v4}, Landroid/graphics/Color;->alpha(I)I

    move-result v2

    .line 176
    .local v2, "maxAlpha":I
    iget v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mBackgroundColor:I

    invoke-static {v4}, Landroid/graphics/Color;->red(I)I

    move-result v3

    .line 177
    .local v3, "red":I
    iget v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mBackgroundColor:I

    invoke-static {v4}, Landroid/graphics/Color;->green(I)I

    move-result v1

    .line 178
    .local v1, "green":I
    iget v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mBackgroundColor:I

    invoke-static {v4}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    .line 180
    .local v0, "blue":I
    new-array v4, v8, [I

    aput v6, v4, v6

    aput v2, v4, v7

    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v4

    iput-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mShowBackgroundAnimator:Landroid/animation/ValueAnimator;

    .line 181
    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mShowBackgroundAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v4, v9, v10}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 182
    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mShowBackgroundAnimator:Landroid/animation/ValueAnimator;

    new-instance v5, Lcom/github/clans/fab/FloatingActionMenu$1;

    invoke-direct {v5, p0, v3, v1, v0}, Lcom/github/clans/fab/FloatingActionMenu$1;-><init>(Lcom/github/clans/fab/FloatingActionMenu;III)V

    invoke-virtual {v4, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 190
    new-array v4, v8, [I

    aput v2, v4, v6

    aput v6, v4, v7

    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v4

    iput-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mHideBackgroundAnimator:Landroid/animation/ValueAnimator;

    .line 191
    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mHideBackgroundAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v4, v9, v10}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 192
    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mHideBackgroundAnimator:Landroid/animation/ValueAnimator;

    new-instance v5, Lcom/github/clans/fab/FloatingActionMenu$2;

    invoke-direct {v5, p0, v3, v1, v0}, Lcom/github/clans/fab/FloatingActionMenu$2;-><init>(Lcom/github/clans/fab/FloatingActionMenu;III)V

    invoke-virtual {v4, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 199
    return-void
.end method

.method private initMenuButtonAnimations()V
    .registers 3

    .prologue
    .line 170
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/github/clans/fab/R$anim;->fab_scale_up:I

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButtonShowAnimation:Landroid/view/animation/Animation;

    .line 171
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/github/clans/fab/R$anim;->fab_scale_down:I

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButtonHideAnimation:Landroid/view/animation/Animation;

    .line 172
    return-void
.end method

.method private initPadding(I)V
    .registers 2
    .param p1, "padding"    # I

    .prologue
    .line 206
    iput p1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPaddingTop:I

    .line 207
    iput p1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPaddingRight:I

    .line 208
    iput p1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPaddingBottom:I

    .line 209
    iput p1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPaddingLeft:I

    .line 210
    return-void
.end method

.method private isBackgroundEnabled()Z
    .registers 2

    .prologue
    .line 202
    iget v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mBackgroundColor:I

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method private setLabelEllipsize(Lcom/github/clans/fab/Label;)V
    .registers 3
    .param p1, "label"    # Lcom/github/clans/fab/Label;

    .prologue
    .line 474
    iget v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsEllipsize:I

    packed-switch v0, :pswitch_data_1e

    .line 488
    :goto_5
    return-void

    .line 476
    :pswitch_6
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->START:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p1, v0}, Lcom/github/clans/fab/Label;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto :goto_5

    .line 479
    :pswitch_c
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->MIDDLE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p1, v0}, Lcom/github/clans/fab/Label;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto :goto_5

    .line 482
    :pswitch_12
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p1, v0}, Lcom/github/clans/fab/Label;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto :goto_5

    .line 485
    :pswitch_18
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p1, v0}, Lcom/github/clans/fab/Label;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto :goto_5

    .line 474
    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_6
        :pswitch_c
        :pswitch_12
        :pswitch_18
    .end packed-switch
.end method

.method private showMenuButtonWithImage(Z)V
    .registers 4
    .param p1, "animate"    # Z

    .prologue
    .line 523
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->isMenuButtonHidden()Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 524
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    invoke-virtual {v0, p1}, Lcom/github/clans/fab/FloatingActionButton;->show(Z)V

    .line 525
    if-eqz p1, :cond_14

    .line 526
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mImageToggle:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButtonShowAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 528
    :cond_14
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mImageToggle:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 530
    :cond_1a
    return-void
.end method


# virtual methods
.method public addMenuButton(Lcom/github/clans/fab/FloatingActionButton;)V
    .registers 3
    .param p1, "fab"    # Lcom/github/clans/fab/FloatingActionButton;

    .prologue
    .line 813
    iget v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mButtonsCount:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, p1, v0}, Lcom/github/clans/fab/FloatingActionMenu;->addView(Landroid/view/View;I)V

    .line 814
    iget v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mButtonsCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mButtonsCount:I

    .line 815
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionMenu;->createLabels()V

    .line 816
    return-void
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 508
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    return v0
.end method

.method public close(Z)V
    .registers 11
    .param p1, "animate"    # Z

    .prologue
    const/4 v8, 0x0

    .line 614
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->isOpened()Z

    move-result v4

    if-eqz v4, :cond_65

    .line 615
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionMenu;->isBackgroundEnabled()Z

    move-result v4

    if-eqz v4, :cond_12

    .line 616
    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mHideBackgroundAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->start()V

    .line 619
    :cond_12
    iget-boolean v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIconAnimated:Z

    if-eqz v4, :cond_1f

    .line 620
    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIconToggleSet:Landroid/animation/AnimatorSet;

    if-eqz v4, :cond_51

    .line 621
    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIconToggleSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->start()V

    .line 628
    :cond_1f
    :goto_1f
    iput-boolean v8, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuOpened:Z

    .line 629
    const/4 v1, 0x0

    .line 630
    .local v1, "delay":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_23
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getChildCount()I

    move-result v4

    if-ge v3, v4, :cond_5c

    .line 631
    invoke-virtual {p0, v3}, Lcom/github/clans/fab/FloatingActionMenu;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 632
    .local v0, "child":Landroid/view/View;
    instance-of v4, v0, Lcom/github/clans/fab/FloatingActionButton;

    if-eqz v4, :cond_4e

    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    if-eq v0, v4, :cond_4e

    .line 633
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_4e

    move-object v2, v0

    .line 635
    check-cast v2, Lcom/github/clans/fab/FloatingActionButton;

    .line 636
    .local v2, "fab":Lcom/github/clans/fab/FloatingActionButton;
    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mUiHandler:Landroid/os/Handler;

    new-instance v5, Lcom/github/clans/fab/FloatingActionMenu$6;

    invoke-direct {v5, p0, v2, p1}, Lcom/github/clans/fab/FloatingActionMenu$6;-><init>(Lcom/github/clans/fab/FloatingActionMenu;Lcom/github/clans/fab/FloatingActionButton;Z)V

    int-to-long v6, v1

    invoke-virtual {v4, v5, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 646
    iget v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mAnimationDelayPerItem:I

    add-int/2addr v1, v4

    .line 630
    .end local v2    # "fab":Lcom/github/clans/fab/FloatingActionButton;
    :cond_4e
    add-int/lit8 v3, v3, 0x1

    goto :goto_23

    .line 623
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "delay":I
    .end local v3    # "i":I
    :cond_51
    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mCloseAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->start()V

    .line 624
    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mOpenAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->cancel()V

    goto :goto_1f

    .line 650
    .restart local v1    # "delay":I
    .restart local v3    # "i":I
    :cond_5c
    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mToggleListener:Lcom/github/clans/fab/FloatingActionMenu$OnMenuToggleListener;

    if-eqz v4, :cond_65

    .line 651
    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mToggleListener:Lcom/github/clans/fab/FloatingActionMenu$OnMenuToggleListener;

    invoke-interface {v4, v8}, Lcom/github/clans/fab/FloatingActionMenu$OnMenuToggleListener;->onMenuToggle(Z)V

    .line 654
    .end local v1    # "delay":I
    .end local v3    # "i":I
    :cond_65
    return-void
.end method

.method protected bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .prologue
    .line 26
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->generateDefaultLayoutParams()Landroid/view/ViewGroup$MarginLayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$MarginLayoutParams;
    .registers 3

    .prologue
    const/4 v1, -0x2

    .line 502
    new-instance v0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    return-object v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3

    .prologue
    .line 26
    invoke-virtual {p0, p1}, Lcom/github/clans/fab/FloatingActionMenu;->generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$MarginLayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3

    .prologue
    .line 26
    invoke-virtual {p0, p1}, Lcom/github/clans/fab/FloatingActionMenu;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$MarginLayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$MarginLayoutParams;
    .registers 4
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 492
    new-instance v0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$MarginLayoutParams;
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 497
    new-instance v0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public getAnimationDelayPerItem()I
    .registers 2

    .prologue
    .line 694
    iget v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mAnimationDelayPerItem:I

    return v0
.end method

.method public getIconToggleAnimatorSet()Landroid/animation/AnimatorSet;
    .registers 2

    .prologue
    .line 718
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIconToggleSet:Landroid/animation/AnimatorSet;

    return-object v0
.end method

.method public getMenuButtonColorNormal()I
    .registers 2

    .prologue
    .line 781
    iget v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuColorNormal:I

    return v0
.end method

.method public getMenuButtonColorPressed()I
    .registers 2

    .prologue
    .line 795
    iget v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuColorPressed:I

    return v0
.end method

.method public getMenuButtonColorRipple()I
    .registers 2

    .prologue
    .line 809
    iget v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuColorRipple:I

    return v0
.end method

.method public getMenuIconView()Landroid/widget/ImageView;
    .registers 2

    .prologue
    .line 710
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mImageToggle:Landroid/widget/ImageView;

    return-object v0
.end method

.method public hideMenuButton(Z)V
    .registers 6
    .param p1, "animate"    # Z

    .prologue
    .line 742
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->isMenuButtonHidden()Z

    move-result v0

    if-nez v0, :cond_26

    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIsMenuButtonAnimationRunning:Z

    if-nez v0, :cond_26

    .line 743
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIsMenuButtonAnimationRunning:Z

    .line 744
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_27

    .line 745
    invoke-virtual {p0, p1}, Lcom/github/clans/fab/FloatingActionMenu;->close(Z)V

    .line 746
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mUiHandler:Landroid/os/Handler;

    new-instance v1, Lcom/github/clans/fab/FloatingActionMenu$7;

    invoke-direct {v1, p0, p1}, Lcom/github/clans/fab/FloatingActionMenu$7;-><init>(Lcom/github/clans/fab/FloatingActionMenu;Z)V

    iget v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mAnimationDelayPerItem:I

    iget v3, p0, Lcom/github/clans/fab/FloatingActionMenu;->mButtonsCount:I

    mul-int/2addr v2, v3

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 756
    :cond_26
    :goto_26
    return-void

    .line 753
    :cond_27
    invoke-direct {p0, p1}, Lcom/github/clans/fab/FloatingActionMenu;->hideMenuButtonWithImage(Z)V

    goto :goto_26
.end method

.method public isAnimated()Z
    .registers 2

    .prologue
    .line 686
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIsAnimated:Z

    return v0
.end method

.method public isIconAnimated()Z
    .registers 2

    .prologue
    .line 706
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIconAnimated:Z

    return v0
.end method

.method public isMenuButtonHidden()Z
    .registers 2

    .prologue
    .line 732
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    invoke-virtual {v0}, Lcom/github/clans/fab/FloatingActionButton;->isHidden()Z

    move-result v0

    return v0
.end method

.method public isOpened()Z
    .registers 2

    .prologue
    .line 559
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuOpened:Z

    return v0
.end method

.method protected onFinishInflate()V
    .registers 2

    .prologue
    .line 404
    invoke-super {p0}, Landroid/view/ViewGroup;->onFinishInflate()V

    .line 405
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    invoke-virtual {p0, v0}, Lcom/github/clans/fab/FloatingActionMenu;->bringChildToFront(Landroid/view/View;)V

    .line 406
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mImageToggle:Landroid/widget/ImageView;

    invoke-virtual {p0, v0}, Lcom/github/clans/fab/FloatingActionMenu;->bringChildToFront(Landroid/view/View;)V

    .line 407
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getChildCount()I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mButtonsCount:I

    .line 408
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionMenu;->createLabels()V

    .line 409
    return-void
.end method

.method protected onLayout(ZIIII)V
    .registers 33
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 322
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPosition:I

    move/from16 v24, v0

    if-nez v24, :cond_eb

    sub-int v24, p4, p2

    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mMaxButtonWidth:I

    move/from16 v25, v0

    div-int/lit8 v25, v25, 0x2

    sub-int v24, v24, v25

    .line 323
    invoke-virtual/range {p0 .. p0}, Lcom/github/clans/fab/FloatingActionMenu;->getPaddingRight()I

    move-result v25

    sub-int v5, v24, v25

    .line 325
    .local v5, "buttonsHorizontalCenter":I
    :goto_1a
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mOpenDirection:I

    move/from16 v24, v0

    if-nez v24, :cond_fb

    const/16 v23, 0x1

    .line 327
    .local v23, "openUp":Z
    :goto_24
    if-eqz v23, :cond_ff

    sub-int v24, p5, p3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    move-object/from16 v25, v0

    .line 328
    invoke-virtual/range {v25 .. v25}, Lcom/github/clans/fab/FloatingActionButton;->getMeasuredHeight()I

    move-result v25

    sub-int v24, v24, v25

    invoke-virtual/range {p0 .. p0}, Lcom/github/clans/fab/FloatingActionMenu;->getPaddingBottom()I

    move-result v25

    sub-int v21, v24, v25

    .line 330
    .local v21, "menuButtonTop":I
    :goto_3a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/github/clans/fab/FloatingActionButton;->getMeasuredWidth()I

    move-result v24

    div-int/lit8 v24, v24, 0x2

    sub-int v20, v5, v24

    .line 332
    .local v20, "menuButtonLeft":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lcom/github/clans/fab/FloatingActionButton;->getMeasuredWidth()I

    move-result v25

    add-int v25, v25, v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    move-object/from16 v26, v0

    .line 333
    invoke-virtual/range {v26 .. v26}, Lcom/github/clans/fab/FloatingActionButton;->getMeasuredHeight()I

    move-result v26

    add-int v26, v26, v21

    .line 332
    move-object/from16 v0, v24

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v25

    move/from16 v4, v26

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/github/clans/fab/FloatingActionButton;->layout(IIII)V

    .line 335
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mImageToggle:Landroid/widget/ImageView;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/widget/ImageView;->getMeasuredWidth()I

    move-result v24

    div-int/lit8 v24, v24, 0x2

    sub-int v11, v5, v24

    .line 336
    .local v11, "imageLeft":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/github/clans/fab/FloatingActionButton;->getMeasuredHeight()I

    move-result v24

    div-int/lit8 v24, v24, 0x2

    add-int v24, v24, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mImageToggle:Landroid/widget/ImageView;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/widget/ImageView;->getMeasuredHeight()I

    move-result v25

    div-int/lit8 v25, v25, 0x2

    sub-int v12, v24, v25

    .line 338
    .local v12, "imageTop":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mImageToggle:Landroid/widget/ImageView;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mImageToggle:Landroid/widget/ImageView;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Landroid/widget/ImageView;->getMeasuredWidth()I

    move-result v25

    add-int v25, v25, v11

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mImageToggle:Landroid/widget/ImageView;

    move-object/from16 v26, v0

    .line 339
    invoke-virtual/range {v26 .. v26}, Landroid/widget/ImageView;->getMeasuredHeight()I

    move-result v26

    add-int v26, v26, v12

    .line 338
    move-object/from16 v0, v24

    move/from16 v1, v25

    move/from16 v2, v26

    invoke-virtual {v0, v11, v12, v1, v2}, Landroid/widget/ImageView;->layout(IIII)V

    .line 341
    if-eqz v23, :cond_105

    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mButtonSpacing:I

    move/from16 v24, v0

    sub-int v22, v21, v24

    .line 345
    .local v22, "nextY":I
    :goto_ce
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mButtonsCount:I

    move/from16 v24, v0

    add-int/lit8 v10, v24, -0x1

    .local v10, "i":I
    :goto_d6
    if-ltz v10, :cond_20c

    .line 346
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/github/clans/fab/FloatingActionMenu;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 348
    .local v6, "child":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mImageToggle:Landroid/widget/ImageView;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    if-ne v6, v0, :cond_11a

    .line 345
    :cond_e8
    :goto_e8
    add-int/lit8 v10, v10, -0x1

    goto :goto_d6

    .line 323
    .end local v5    # "buttonsHorizontalCenter":I
    .end local v6    # "child":Landroid/view/View;
    .end local v10    # "i":I
    .end local v11    # "imageLeft":I
    .end local v12    # "imageTop":I
    .end local v20    # "menuButtonLeft":I
    .end local v21    # "menuButtonTop":I
    .end local v22    # "nextY":I
    .end local v23    # "openUp":Z
    :cond_eb
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mMaxButtonWidth:I

    move/from16 v24, v0

    div-int/lit8 v24, v24, 0x2

    .line 324
    invoke-virtual/range {p0 .. p0}, Lcom/github/clans/fab/FloatingActionMenu;->getPaddingLeft()I

    move-result v25

    add-int v5, v24, v25

    goto/16 :goto_1a

    .line 325
    .restart local v5    # "buttonsHorizontalCenter":I
    :cond_fb
    const/16 v23, 0x0

    goto/16 :goto_24

    .line 329
    .restart local v23    # "openUp":Z
    :cond_ff
    invoke-virtual/range {p0 .. p0}, Lcom/github/clans/fab/FloatingActionMenu;->getPaddingTop()I

    move-result v21

    goto/16 :goto_3a

    .line 341
    .restart local v11    # "imageLeft":I
    .restart local v12    # "imageTop":I
    .restart local v20    # "menuButtonLeft":I
    .restart local v21    # "menuButtonTop":I
    :cond_105
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    move-object/from16 v24, v0

    .line 343
    invoke-virtual/range {v24 .. v24}, Lcom/github/clans/fab/FloatingActionButton;->getMeasuredHeight()I

    move-result v24

    add-int v24, v24, v21

    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mButtonSpacing:I

    move/from16 v25, v0

    add-int v22, v24, v25

    goto :goto_ce

    .restart local v6    # "child":Landroid/view/View;
    .restart local v10    # "i":I
    .restart local v22    # "nextY":I
    :cond_11a
    move-object v9, v6

    .line 350
    check-cast v9, Lcom/github/clans/fab/FloatingActionButton;

    .line 352
    .local v9, "fab":Lcom/github/clans/fab/FloatingActionButton;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    if-eq v9, v0, :cond_e8

    invoke-virtual {v9}, Lcom/github/clans/fab/FloatingActionButton;->getVisibility()I

    move-result v24

    const/16 v25, 0x8

    move/from16 v0, v24

    move/from16 v1, v25

    if-eq v0, v1, :cond_e8

    .line 354
    invoke-virtual {v9}, Lcom/github/clans/fab/FloatingActionButton;->getMeasuredWidth()I

    move-result v24

    div-int/lit8 v24, v24, 0x2

    sub-int v7, v5, v24

    .line 355
    .local v7, "childX":I
    if-eqz v23, :cond_1e9

    invoke-virtual {v9}, Lcom/github/clans/fab/FloatingActionButton;->getMeasuredHeight()I

    move-result v24

    sub-int v8, v22, v24

    .line 356
    .local v8, "childY":I
    :goto_143
    invoke-virtual {v9}, Lcom/github/clans/fab/FloatingActionButton;->getMeasuredWidth()I

    move-result v24

    add-int v24, v24, v7

    .line 357
    invoke-virtual {v9}, Lcom/github/clans/fab/FloatingActionButton;->getMeasuredHeight()I

    move-result v25

    add-int v25, v25, v8

    .line 356
    move/from16 v0, v24

    move/from16 v1, v25

    invoke-virtual {v9, v7, v8, v0, v1}, Lcom/github/clans/fab/FloatingActionButton;->layout(IIII)V

    .line 359
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuOpened:Z

    move/from16 v24, v0

    if-nez v24, :cond_165

    .line 360
    const/16 v24, 0x0

    move/from16 v0, v24

    invoke-virtual {v9, v0}, Lcom/github/clans/fab/FloatingActionButton;->hide(Z)V

    .line 363
    :cond_165
    sget v24, Lcom/github/clans/fab/R$id;->fab_label:I

    move/from16 v0, v24

    invoke-virtual {v9, v0}, Lcom/github/clans/fab/FloatingActionButton;->getTag(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/view/View;

    .line 364
    .local v13, "label":Landroid/view/View;
    if-eqz v13, :cond_1dd

    .line 365
    invoke-virtual {v9}, Lcom/github/clans/fab/FloatingActionButton;->getMeasuredWidth()I

    move-result v24

    div-int/lit8 v24, v24, 0x2

    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsMargin:I

    move/from16 v25, v0

    add-int v19, v24, v25

    .line 366
    .local v19, "labelsOffset":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPosition:I

    move/from16 v24, v0

    if-nez v24, :cond_1ed

    sub-int v18, v5, v19

    .line 370
    .local v18, "labelXNearButton":I
    :goto_189
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPosition:I

    move/from16 v24, v0

    if-nez v24, :cond_1f0

    .line 371
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    move-result v24

    sub-int v17, v18, v24

    .line 374
    .local v17, "labelXAwayFromButton":I
    :goto_197
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPosition:I

    move/from16 v24, v0

    if-nez v24, :cond_1f7

    move/from16 v14, v17

    .line 378
    .local v14, "labelLeft":I
    :goto_1a1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsPosition:I

    move/from16 v24, v0

    if-nez v24, :cond_1fa

    move/from16 v15, v18

    .line 382
    .local v15, "labelRight":I
    :goto_1ab
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsVerticalOffset:I

    move/from16 v24, v0

    sub-int v24, v8, v24

    invoke-virtual {v9}, Lcom/github/clans/fab/FloatingActionButton;->getMeasuredHeight()I

    move-result v25

    .line 383
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredHeight()I

    move-result v26

    sub-int v25, v25, v26

    div-int/lit8 v25, v25, 0x2

    add-int v16, v24, v25

    .line 385
    .local v16, "labelTop":I
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredHeight()I

    move-result v24

    add-int v24, v24, v16

    move/from16 v0, v16

    move/from16 v1, v24

    invoke-virtual {v13, v14, v0, v15, v1}, Landroid/view/View;->layout(IIII)V

    .line 387
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuOpened:Z

    move/from16 v24, v0

    if-nez v24, :cond_1dd

    .line 388
    const/16 v24, 0x4

    move/from16 v0, v24

    invoke-virtual {v13, v0}, Landroid/view/View;->setVisibility(I)V

    .line 392
    .end local v14    # "labelLeft":I
    .end local v15    # "labelRight":I
    .end local v16    # "labelTop":I
    .end local v17    # "labelXAwayFromButton":I
    .end local v18    # "labelXNearButton":I
    .end local v19    # "labelsOffset":I
    :cond_1dd
    if-eqz v23, :cond_1fd

    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mButtonSpacing:I

    move/from16 v24, v0

    sub-int v22, v8, v24

    .line 394
    :goto_1e7
    goto/16 :goto_e8

    .end local v8    # "childY":I
    .end local v13    # "label":Landroid/view/View;
    :cond_1e9
    move/from16 v8, v22

    .line 355
    goto/16 :goto_143

    .line 366
    .restart local v8    # "childY":I
    .restart local v13    # "label":Landroid/view/View;
    .restart local v19    # "labelsOffset":I
    :cond_1ed
    add-int v18, v5, v19

    goto :goto_189

    .line 372
    .restart local v18    # "labelXNearButton":I
    :cond_1f0
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    move-result v24

    add-int v17, v18, v24

    goto :goto_197

    .restart local v17    # "labelXAwayFromButton":I
    :cond_1f7
    move/from16 v14, v18

    .line 374
    goto :goto_1a1

    .restart local v14    # "labelLeft":I
    :cond_1fa
    move/from16 v15, v17

    .line 378
    goto :goto_1ab

    .line 394
    .end local v14    # "labelLeft":I
    .end local v17    # "labelXAwayFromButton":I
    .end local v18    # "labelXNearButton":I
    .end local v19    # "labelsOffset":I
    :cond_1fd
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v24

    add-int v24, v24, v8

    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/clans/fab/FloatingActionMenu;->mButtonSpacing:I

    move/from16 v25, v0

    add-int v22, v24, v25

    goto :goto_1e7

    .line 396
    .end local v6    # "child":Landroid/view/View;
    .end local v7    # "childX":I
    .end local v8    # "childY":I
    .end local v9    # "fab":Lcom/github/clans/fab/FloatingActionButton;
    .end local v13    # "label":Landroid/view/View;
    :cond_20c
    return-void
.end method

.method protected onMeasure(II)V
    .registers 18
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 268
    const/4 v14, 0x0

    .line 269
    .local v14, "width":I
    const/4 v9, 0x0

    .line 270
    .local v9, "height":I
    const/4 v1, 0x0

    iput v1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMaxButtonWidth:I

    .line 271
    const/4 v12, 0x0

    .line 273
    .local v12, "maxLabelWidth":I
    iget-object v2, p0, Lcom/github/clans/fab/FloatingActionMenu;->mImageToggle:Landroid/widget/ImageView;

    const/4 v4, 0x0

    const/4 v6, 0x0

    move-object v1, p0

    move/from16 v3, p1

    move/from16 v5, p2

    invoke-virtual/range {v1 .. v6}, Lcom/github/clans/fab/FloatingActionMenu;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 275
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_13
    iget v1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mButtonsCount:I

    if-ge v10, v1, :cond_41

    .line 276
    invoke-virtual {p0, v10}, Lcom/github/clans/fab/FloatingActionMenu;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 278
    .local v2, "child":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/16 v3, 0x8

    if-eq v1, v3, :cond_27

    iget-object v1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mImageToggle:Landroid/widget/ImageView;

    if-ne v2, v1, :cond_2a

    .line 275
    :cond_27
    :goto_27
    add-int/lit8 v10, v10, 0x1

    goto :goto_13

    .line 280
    :cond_2a
    const/4 v4, 0x0

    const/4 v6, 0x0

    move-object v1, p0

    move/from16 v3, p1

    move/from16 v5, p2

    invoke-virtual/range {v1 .. v6}, Lcom/github/clans/fab/FloatingActionMenu;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 281
    iget v1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMaxButtonWidth:I

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMaxButtonWidth:I

    goto :goto_27

    .line 284
    .end local v2    # "child":Landroid/view/View;
    :cond_41
    const/4 v10, 0x0

    :goto_42
    iget v1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mButtonsCount:I

    if-ge v10, v1, :cond_9a

    .line 285
    const/4 v13, 0x0

    .line 286
    .local v13, "usedWidth":I
    invoke-virtual {p0, v10}, Lcom/github/clans/fab/FloatingActionMenu;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 288
    .restart local v2    # "child":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/16 v3, 0x8

    if-eq v1, v3, :cond_57

    iget-object v1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mImageToggle:Landroid/widget/ImageView;

    if-ne v2, v1, :cond_5a

    .line 284
    :cond_57
    :goto_57
    add-int/lit8 v10, v10, 0x1

    goto :goto_42

    .line 290
    :cond_5a
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    add-int/2addr v13, v1

    .line 291
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    add-int/2addr v9, v1

    .line 293
    sget v1, Lcom/github/clans/fab/R$id;->fab_label:I

    invoke-virtual {v2, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/github/clans/fab/Label;

    .line 294
    .local v4, "label":Lcom/github/clans/fab/Label;
    if-eqz v4, :cond_57

    .line 295
    iget v1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMaxButtonWidth:I

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    sub-int/2addr v1, v3

    div-int/lit8 v11, v1, 0x2

    .line 296
    .local v11, "labelOffset":I
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    invoke-virtual {v4}, Lcom/github/clans/fab/Label;->calculateShadowWidth()I

    move-result v3

    add-int/2addr v1, v3

    iget v3, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsMargin:I

    add-int/2addr v1, v3

    add-int v6, v1, v11

    .line 297
    .local v6, "labelUsedWidth":I
    const/4 v8, 0x0

    move-object v3, p0

    move/from16 v5, p1

    move/from16 v7, p2

    invoke-virtual/range {v3 .. v8}, Lcom/github/clans/fab/FloatingActionMenu;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 298
    invoke-virtual {v4}, Lcom/github/clans/fab/Label;->getMeasuredWidth()I

    move-result v1

    add-int/2addr v13, v1

    .line 299
    add-int v1, v13, v11

    invoke-static {v12, v1}, Ljava/lang/Math;->max(II)I

    move-result v12

    goto :goto_57

    .line 303
    .end local v2    # "child":Landroid/view/View;
    .end local v4    # "label":Lcom/github/clans/fab/Label;
    .end local v6    # "labelUsedWidth":I
    .end local v11    # "labelOffset":I
    .end local v13    # "usedWidth":I
    :cond_9a
    iget v1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMaxButtonWidth:I

    iget v3, p0, Lcom/github/clans/fab/FloatingActionMenu;->mLabelsMargin:I

    add-int/2addr v3, v12

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getPaddingLeft()I

    move-result v3

    add-int/2addr v1, v3

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getPaddingRight()I

    move-result v3

    add-int v14, v1, v3

    .line 305
    iget v1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mButtonSpacing:I

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getChildCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    mul-int/2addr v1, v3

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getPaddingTop()I

    move-result v3

    add-int/2addr v1, v3

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getPaddingBottom()I

    move-result v3

    add-int/2addr v1, v3

    add-int/2addr v9, v1

    .line 306
    invoke-direct {p0, v9}, Lcom/github/clans/fab/FloatingActionMenu;->adjustForOvershoot(I)I

    move-result v9

    .line 309
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v3, -0x1

    if-ne v1, v3, :cond_d9

    .line 310
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getSuggestedMinimumWidth()I

    move-result v1

    move/from16 v0, p1

    invoke-static {v1, v0}, Lcom/github/clans/fab/FloatingActionMenu;->getDefaultSize(II)I

    move-result v14

    .line 313
    :cond_d9
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/4 v3, -0x1

    if-ne v1, v3, :cond_ec

    .line 314
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getSuggestedMinimumHeight()I

    move-result v1

    move/from16 v0, p2

    invoke-static {v1, v0}, Lcom/github/clans/fab/FloatingActionMenu;->getDefaultSize(II)I

    move-result v9

    .line 317
    :cond_ec
    invoke-virtual {p0, v14, v9}, Lcom/github/clans/fab/FloatingActionMenu;->setMeasuredDimension(II)V

    .line 318
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 534
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIsSetClosedOnTouchOutside:Z

    if-eqz v0, :cond_b

    .line 535
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 537
    :goto_a
    return v0

    :cond_b
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_a
.end method

.method public open(Z)V
    .registers 11
    .param p1, "animate"    # Z

    .prologue
    const/4 v8, 0x1

    .line 571
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->isOpened()Z

    move-result v4

    if-nez v4, :cond_66

    .line 572
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionMenu;->isBackgroundEnabled()Z

    move-result v4

    if-eqz v4, :cond_12

    .line 573
    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mShowBackgroundAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->start()V

    .line 576
    :cond_12
    iget-boolean v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIconAnimated:Z

    if-eqz v4, :cond_1f

    .line 577
    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIconToggleSet:Landroid/animation/AnimatorSet;

    if-eqz v4, :cond_52

    .line 578
    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIconToggleSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->start()V

    .line 585
    :cond_1f
    :goto_1f
    iput-boolean v8, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuOpened:Z

    .line 586
    const/4 v1, 0x0

    .line 587
    .local v1, "delay":I
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getChildCount()I

    move-result v4

    add-int/lit8 v3, v4, -0x1

    .local v3, "i":I
    :goto_28
    if-ltz v3, :cond_5d

    .line 588
    invoke-virtual {p0, v3}, Lcom/github/clans/fab/FloatingActionMenu;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 589
    .local v0, "child":Landroid/view/View;
    instance-of v4, v0, Lcom/github/clans/fab/FloatingActionButton;

    if-eqz v4, :cond_4f

    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    if-eq v0, v4, :cond_4f

    .line 590
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_4f

    move-object v2, v0

    .line 592
    check-cast v2, Lcom/github/clans/fab/FloatingActionButton;

    .line 593
    .local v2, "fab":Lcom/github/clans/fab/FloatingActionButton;
    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mUiHandler:Landroid/os/Handler;

    new-instance v5, Lcom/github/clans/fab/FloatingActionMenu$5;

    invoke-direct {v5, p0, v2, p1}, Lcom/github/clans/fab/FloatingActionMenu$5;-><init>(Lcom/github/clans/fab/FloatingActionMenu;Lcom/github/clans/fab/FloatingActionButton;Z)V

    int-to-long v6, v1

    invoke-virtual {v4, v5, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 603
    iget v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mAnimationDelayPerItem:I

    add-int/2addr v1, v4

    .line 587
    .end local v2    # "fab":Lcom/github/clans/fab/FloatingActionButton;
    :cond_4f
    add-int/lit8 v3, v3, -0x1

    goto :goto_28

    .line 580
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "delay":I
    .end local v3    # "i":I
    :cond_52
    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mCloseAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->cancel()V

    .line 581
    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mOpenAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->start()V

    goto :goto_1f

    .line 607
    .restart local v1    # "delay":I
    .restart local v3    # "i":I
    :cond_5d
    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mToggleListener:Lcom/github/clans/fab/FloatingActionMenu$OnMenuToggleListener;

    if-eqz v4, :cond_66

    .line 608
    iget-object v4, p0, Lcom/github/clans/fab/FloatingActionMenu;->mToggleListener:Lcom/github/clans/fab/FloatingActionMenu$OnMenuToggleListener;

    invoke-interface {v4, v8}, Lcom/github/clans/fab/FloatingActionMenu$OnMenuToggleListener;->onMenuToggle(Z)V

    .line 611
    .end local v1    # "delay":I
    .end local v3    # "i":I
    :cond_66
    return-void
.end method

.method public removeMenuButton(Lcom/github/clans/fab/FloatingActionButton;)V
    .registers 3
    .param p1, "fab"    # Lcom/github/clans/fab/FloatingActionButton;

    .prologue
    .line 819
    invoke-virtual {p1}, Lcom/github/clans/fab/FloatingActionButton;->getLabelView()Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/github/clans/fab/FloatingActionMenu;->removeView(Landroid/view/View;)V

    .line 820
    invoke-virtual {p0, p1}, Lcom/github/clans/fab/FloatingActionMenu;->removeView(Landroid/view/View;)V

    .line 821
    iget v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mButtonsCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mButtonsCount:I

    .line 822
    return-void
.end method

.method public setAnimated(Z)V
    .registers 9
    .param p1, "animated"    # Z

    .prologue
    const-wide/16 v2, 0x12c

    const-wide/16 v4, 0x0

    .line 680
    iput-boolean p1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIsAnimated:Z

    .line 681
    iget-object v6, p0, Lcom/github/clans/fab/FloatingActionMenu;->mOpenAnimatorSet:Landroid/animation/AnimatorSet;

    if-eqz p1, :cond_16

    move-wide v0, v2

    :goto_b
    invoke-virtual {v6, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 682
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mCloseAnimatorSet:Landroid/animation/AnimatorSet;

    if-eqz p1, :cond_18

    :goto_12
    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 683
    return-void

    :cond_16
    move-wide v0, v4

    .line 681
    goto :goto_b

    :cond_18
    move-wide v2, v4

    .line 682
    goto :goto_12
.end method

.method public setAnimationDelayPerItem(I)V
    .registers 2
    .param p1, "animationDelayPerItem"    # I

    .prologue
    .line 690
    iput p1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mAnimationDelayPerItem:I

    .line 691
    return-void
.end method

.method public setClosedOnTouchOutside(Z)V
    .registers 2
    .param p1, "close"    # Z

    .prologue
    .line 767
    iput-boolean p1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIsSetClosedOnTouchOutside:Z

    .line 768
    return-void
.end method

.method public setIconAnimated(Z)V
    .registers 2
    .param p1, "animated"    # Z

    .prologue
    .line 702
    iput-boolean p1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIconAnimated:Z

    .line 703
    return-void
.end method

.method public setIconAnimationCloseInterpolator(Landroid/view/animation/Interpolator;)V
    .registers 3
    .param p1, "closeInterpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 671
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mCloseAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 672
    return-void
.end method

.method public setIconAnimationInterpolator(Landroid/view/animation/Interpolator;)V
    .registers 3
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 662
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mOpenAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 663
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mCloseAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 664
    return-void
.end method

.method public setIconAnimationOpenInterpolator(Landroid/view/animation/Interpolator;)V
    .registers 3
    .param p1, "openInterpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 667
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mOpenAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 668
    return-void
.end method

.method public setIconToggleAnimatorSet(Landroid/animation/AnimatorSet;)V
    .registers 2
    .param p1, "toggleAnimatorSet"    # Landroid/animation/AnimatorSet;

    .prologue
    .line 714
    iput-object p1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mIconToggleSet:Landroid/animation/AnimatorSet;

    .line 715
    return-void
.end method

.method public setMenuButtonColorNormal(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 771
    iput p1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuColorNormal:I

    .line 772
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    invoke-virtual {v0, p1}, Lcom/github/clans/fab/FloatingActionButton;->setColorNormal(I)V

    .line 773
    return-void
.end method

.method public setMenuButtonColorNormalResId(I)V
    .registers 3
    .param p1, "colorResId"    # I

    .prologue
    .line 776
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuColorNormal:I

    .line 777
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    invoke-virtual {v0, p1}, Lcom/github/clans/fab/FloatingActionButton;->setColorNormalResId(I)V

    .line 778
    return-void
.end method

.method public setMenuButtonColorPressed(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 785
    iput p1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuColorPressed:I

    .line 786
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    invoke-virtual {v0, p1}, Lcom/github/clans/fab/FloatingActionButton;->setColorPressed(I)V

    .line 787
    return-void
.end method

.method public setMenuButtonColorPressedResId(I)V
    .registers 3
    .param p1, "colorResId"    # I

    .prologue
    .line 790
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuColorPressed:I

    .line 791
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    invoke-virtual {v0, p1}, Lcom/github/clans/fab/FloatingActionButton;->setColorPressedResId(I)V

    .line 792
    return-void
.end method

.method public setMenuButtonColorRipple(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 799
    iput p1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuColorRipple:I

    .line 800
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    invoke-virtual {v0, p1}, Lcom/github/clans/fab/FloatingActionButton;->setColorRipple(I)V

    .line 801
    return-void
.end method

.method public setMenuButtonColorRippleResId(I)V
    .registers 3
    .param p1, "colorResId"    # I

    .prologue
    .line 804
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuColorRipple:I

    .line 805
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    invoke-virtual {v0, p1}, Lcom/github/clans/fab/FloatingActionButton;->setColorRippleResId(I)V

    .line 806
    return-void
.end method

.method public setMenuButtonHideAnimation(Landroid/view/animation/Animation;)V
    .registers 3
    .param p1, "hideAnimation"    # Landroid/view/animation/Animation;

    .prologue
    .line 727
    iput-object p1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButtonHideAnimation:Landroid/view/animation/Animation;

    .line 728
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    invoke-virtual {v0, p1}, Lcom/github/clans/fab/FloatingActionButton;->setHideAnimation(Landroid/view/animation/Animation;)V

    .line 729
    return-void
.end method

.method public setMenuButtonShowAnimation(Landroid/view/animation/Animation;)V
    .registers 3
    .param p1, "showAnimation"    # Landroid/view/animation/Animation;

    .prologue
    .line 722
    iput-object p1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButtonShowAnimation:Landroid/view/animation/Animation;

    .line 723
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu;->mMenuButton:Lcom/github/clans/fab/FloatingActionButton;

    invoke-virtual {v0, p1}, Lcom/github/clans/fab/FloatingActionButton;->setShowAnimation(Landroid/view/animation/Animation;)V

    .line 724
    return-void
.end method

.method public setOnMenuToggleListener(Lcom/github/clans/fab/FloatingActionMenu$OnMenuToggleListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/github/clans/fab/FloatingActionMenu$OnMenuToggleListener;

    .prologue
    .line 698
    iput-object p1, p0, Lcom/github/clans/fab/FloatingActionMenu;->mToggleListener:Lcom/github/clans/fab/FloatingActionMenu$OnMenuToggleListener;

    .line 699
    return-void
.end method

.method public showMenuButton(Z)V
    .registers 3
    .param p1, "animate"    # Z

    .prologue
    .line 736
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->isMenuButtonHidden()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 737
    invoke-direct {p0, p1}, Lcom/github/clans/fab/FloatingActionMenu;->showMenuButtonWithImage(Z)V

    .line 739
    :cond_9
    return-void
.end method

.method public toggle(Z)V
    .registers 3
    .param p1, "animate"    # Z

    .prologue
    .line 563
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 564
    invoke-virtual {p0, p1}, Lcom/github/clans/fab/FloatingActionMenu;->close(Z)V

    .line 568
    :goto_9
    return-void

    .line 566
    :cond_a
    invoke-virtual {p0, p1}, Lcom/github/clans/fab/FloatingActionMenu;->open(Z)V

    goto :goto_9
.end method

.method public toggleMenuButton(Z)V
    .registers 3
    .param p1, "animate"    # Z

    .prologue
    .line 759
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionMenu;->isMenuButtonHidden()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 760
    invoke-virtual {p0, p1}, Lcom/github/clans/fab/FloatingActionMenu;->showMenuButton(Z)V

    .line 764
    :goto_9
    return-void

    .line 762
    :cond_a
    invoke-virtual {p0, p1}, Lcom/github/clans/fab/FloatingActionMenu;->hideMenuButton(Z)V

    goto :goto_9
.end method
