.class public Lcom/rey/material/widget/FloatingActionButton;
.super Landroid/view/View;
.source "FloatingActionButton.java"

# interfaces
.implements Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/widget/FloatingActionButton$1;,
        Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;,
        Lcom/rey/material/widget/FloatingActionButton$SavedState;
    }
.end annotation


# instance fields
.field private mAnimDuration:I

.field private mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

.field protected mCurrentStyle:I

.field private mIcon:Landroid/graphics/drawable/Drawable;

.field private mIconSize:I

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mPrevIcon:Landroid/graphics/drawable/Drawable;

.field private mRippleManager:Lcom/rey/material/widget/RippleManager;

.field protected mStyleId:I

.field private mSwitchIconAnimator:Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    const/4 v0, -0x1

    .line 54
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 40
    iput v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mAnimDuration:I

    .line 43
    iput v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mIconSize:I

    .line 47
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mCurrentStyle:I

    .line 56
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v1, v1}, Lcom/rey/material/widget/FloatingActionButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 57
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x0

    const/4 v0, -0x1

    .line 60
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 40
    iput v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mAnimDuration:I

    .line 43
    iput v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mIconSize:I

    .line 47
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mCurrentStyle:I

    .line 62
    invoke-virtual {p0, p1, p2, v1, v1}, Lcom/rey/material/widget/FloatingActionButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 63
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v0, -0x1

    .line 66
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 40
    iput v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mAnimDuration:I

    .line 43
    iput v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mIconSize:I

    .line 47
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mCurrentStyle:I

    .line 68
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/rey/material/widget/FloatingActionButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 69
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    const/4 v0, -0x1

    .line 73
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 40
    iput v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mAnimDuration:I

    .line 43
    iput v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mIconSize:I

    .line 47
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mCurrentStyle:I

    .line 75
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/FloatingActionButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 76
    return-void
.end method

.method static synthetic access$100(Lcom/rey/material/widget/FloatingActionButton;)Landroid/graphics/drawable/Drawable;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/FloatingActionButton;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$102(Lcom/rey/material/widget/FloatingActionButton;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/FloatingActionButton;
    .param p1, "x1"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    return-object p1
.end method

.method static synthetic access$200(Lcom/rey/material/widget/FloatingActionButton;)Landroid/graphics/drawable/Drawable;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/FloatingActionButton;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mPrevIcon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$202(Lcom/rey/material/widget/FloatingActionButton;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/FloatingActionButton;
    .param p1, "x1"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/rey/material/widget/FloatingActionButton;->mPrevIcon:Landroid/graphics/drawable/Drawable;

    return-object p1
.end method

.method static synthetic access$300(Lcom/rey/material/widget/FloatingActionButton;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/FloatingActionButton;

    .prologue
    .line 35
    iget v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mIconSize:I

    return v0
.end method

.method static synthetic access$400(Lcom/rey/material/widget/FloatingActionButton;)Lcom/rey/material/drawable/OvalShadowDrawable;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/FloatingActionButton;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    return-object v0
.end method

.method static synthetic access$500(Lcom/rey/material/widget/FloatingActionButton;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/FloatingActionButton;

    .prologue
    .line 35
    iget v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mAnimDuration:I

    return v0
.end method

.method static synthetic access$600(Lcom/rey/material/widget/FloatingActionButton;)Landroid/view/animation/Interpolator;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/FloatingActionButton;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method public static make(Landroid/content/Context;I)Lcom/rey/material/widget/FloatingActionButton;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "resId"    # I

    .prologue
    .line 50
    new-instance v0, Lcom/rey/material/widget/FloatingActionButton;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1, p1}, Lcom/rey/material/widget/FloatingActionButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-object v0
.end method

.method private setLeftMargin(Landroid/view/ViewGroup$LayoutParams;I)V
    .registers 6
    .param p1, "params"    # Landroid/view/ViewGroup$LayoutParams;
    .param p2, "value"    # I

    .prologue
    .line 416
    instance-of v0, p1, Landroid/widget/FrameLayout$LayoutParams;

    if-eqz v0, :cond_9

    .line 417
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .end local p1    # "params":Landroid/view/ViewGroup$LayoutParams;
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 422
    :goto_8
    return-void

    .line 418
    .restart local p1    # "params":Landroid/view/ViewGroup$LayoutParams;
    :cond_9
    instance-of v0, p1, Landroid/widget/RelativeLayout$LayoutParams;

    if-eqz v0, :cond_12

    .line 419
    check-cast p1, Landroid/widget/RelativeLayout$LayoutParams;

    .end local p1    # "params":Landroid/view/ViewGroup$LayoutParams;
    iput p2, p1, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    goto :goto_8

    .line 421
    .restart local p1    # "params":Landroid/view/ViewGroup$LayoutParams;
    :cond_12
    const-class v0, Lcom/rey/material/widget/FloatingActionButton;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cannot recognize LayoutParams: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_8
.end method

.method private setTopMargin(Landroid/view/ViewGroup$LayoutParams;I)V
    .registers 6
    .param p1, "params"    # Landroid/view/ViewGroup$LayoutParams;
    .param p2, "value"    # I

    .prologue
    .line 425
    instance-of v0, p1, Landroid/widget/FrameLayout$LayoutParams;

    if-eqz v0, :cond_9

    .line 426
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .end local p1    # "params":Landroid/view/ViewGroup$LayoutParams;
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 431
    :goto_8
    return-void

    .line 427
    .restart local p1    # "params":Landroid/view/ViewGroup$LayoutParams;
    :cond_9
    instance-of v0, p1, Landroid/widget/RelativeLayout$LayoutParams;

    if-eqz v0, :cond_12

    .line 428
    check-cast p1, Landroid/widget/RelativeLayout$LayoutParams;

    .end local p1    # "params":Landroid/view/ViewGroup$LayoutParams;
    iput p2, p1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    goto :goto_8

    .line 430
    .restart local p1    # "params":Landroid/view/ViewGroup$LayoutParams;
    :cond_12
    const-class v0, Lcom/rey/material/widget/FloatingActionButton;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cannot recognize LayoutParams: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_8
.end method

.method private updateParams(IIILandroid/view/ViewGroup$LayoutParams;)V
    .registers 9
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "gravity"    # I
    .param p4, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 378
    and-int/lit8 v0, p3, 0x7

    .line 380
    .local v0, "horizontalGravity":I
    packed-switch v0, :pswitch_data_88

    .line 391
    :pswitch_5
    int-to-float v2, p1

    iget-object v3, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v3}, Lcom/rey/material/drawable/OvalShadowDrawable;->getPaddingLeft()F

    move-result v3

    sub-float/2addr v2, v3

    float-to-int v2, v2

    invoke-direct {p0, p4, v2}, Lcom/rey/material/widget/FloatingActionButton;->setLeftMargin(Landroid/view/ViewGroup$LayoutParams;I)V

    .line 395
    :goto_11
    and-int/lit8 v1, p3, 0x70

    .line 397
    .local v1, "verticalGravity":I
    sparse-switch v1, :sswitch_data_96

    .line 408
    int-to-float v2, p2

    iget-object v3, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v3}, Lcom/rey/material/drawable/OvalShadowDrawable;->getPaddingTop()F

    move-result v3

    sub-float/2addr v2, v3

    float-to-int v2, v2

    invoke-direct {p0, p4, v2}, Lcom/rey/material/widget/FloatingActionButton;->setTopMargin(Landroid/view/ViewGroup$LayoutParams;I)V

    .line 412
    :goto_22
    invoke-virtual {p0, p4}, Lcom/rey/material/widget/FloatingActionButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 413
    return-void

    .line 382
    .end local v1    # "verticalGravity":I
    :pswitch_26
    int-to-float v2, p1

    iget-object v3, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v3}, Lcom/rey/material/drawable/OvalShadowDrawable;->getPaddingLeft()F

    move-result v3

    sub-float/2addr v2, v3

    float-to-int v2, v2

    invoke-direct {p0, p4, v2}, Lcom/rey/material/widget/FloatingActionButton;->setLeftMargin(Landroid/view/ViewGroup$LayoutParams;I)V

    goto :goto_11

    .line 385
    :pswitch_33
    int-to-float v2, p1

    iget-object v3, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v3}, Lcom/rey/material/drawable/OvalShadowDrawable;->getCenterX()F

    move-result v3

    sub-float/2addr v2, v3

    float-to-int v2, v2

    invoke-direct {p0, p4, v2}, Lcom/rey/material/widget/FloatingActionButton;->setLeftMargin(Landroid/view/ViewGroup$LayoutParams;I)V

    goto :goto_11

    .line 388
    :pswitch_40
    int-to-float v2, p1

    iget-object v3, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v3}, Lcom/rey/material/drawable/OvalShadowDrawable;->getPaddingLeft()F

    move-result v3

    sub-float/2addr v2, v3

    iget-object v3, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v3}, Lcom/rey/material/drawable/OvalShadowDrawable;->getRadius()I

    move-result v3

    mul-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    sub-float/2addr v2, v3

    float-to-int v2, v2

    invoke-direct {p0, p4, v2}, Lcom/rey/material/widget/FloatingActionButton;->setLeftMargin(Landroid/view/ViewGroup$LayoutParams;I)V

    goto :goto_11

    .line 399
    .restart local v1    # "verticalGravity":I
    :sswitch_57
    int-to-float v2, p2

    iget-object v3, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v3}, Lcom/rey/material/drawable/OvalShadowDrawable;->getPaddingTop()F

    move-result v3

    sub-float/2addr v2, v3

    float-to-int v2, v2

    invoke-direct {p0, p4, v2}, Lcom/rey/material/widget/FloatingActionButton;->setTopMargin(Landroid/view/ViewGroup$LayoutParams;I)V

    goto :goto_22

    .line 402
    :sswitch_64
    int-to-float v2, p2

    iget-object v3, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v3}, Lcom/rey/material/drawable/OvalShadowDrawable;->getCenterY()F

    move-result v3

    sub-float/2addr v2, v3

    float-to-int v2, v2

    invoke-direct {p0, p4, v2}, Lcom/rey/material/widget/FloatingActionButton;->setTopMargin(Landroid/view/ViewGroup$LayoutParams;I)V

    goto :goto_22

    .line 405
    :sswitch_71
    int-to-float v2, p2

    iget-object v3, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v3}, Lcom/rey/material/drawable/OvalShadowDrawable;->getPaddingTop()F

    move-result v3

    sub-float/2addr v2, v3

    iget-object v3, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v3}, Lcom/rey/material/drawable/OvalShadowDrawable;->getRadius()I

    move-result v3

    mul-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    sub-float/2addr v2, v3

    float-to-int v2, v2

    invoke-direct {p0, p4, v2}, Lcom/rey/material/widget/FloatingActionButton;->setTopMargin(Landroid/view/ViewGroup$LayoutParams;I)V

    goto :goto_22

    .line 380
    :pswitch_data_88
    .packed-switch 0x1
        :pswitch_33
        :pswitch_5
        :pswitch_26
        :pswitch_5
        :pswitch_40
    .end packed-switch

    .line 397
    :sswitch_data_96
    .sparse-switch
        0x10 -> :sswitch_64
        0x30 -> :sswitch_57
        0x50 -> :sswitch_71
    .end sparse-switch
.end method


# virtual methods
.method public applyStyle(I)V
    .registers 5
    .param p1, "resId"    # I

    .prologue
    .line 88
    invoke-static {p0, p1}, Lcom/rey/material/util/ViewUtil;->applyStyle(Landroid/view/View;I)V

    .line 89
    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/rey/material/widget/FloatingActionButton;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 90
    return-void
.end method

.method protected applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 34
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 93
    sget-object v4, Lcom/rey/material/R$styleable;->FloatingActionButton:[I

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-virtual {v0, v1, v4, v2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v20

    .line 95
    .local v20, "a":Landroid/content/res/TypedArray;
    const/4 v5, -0x1

    .line 96
    .local v5, "radius":I
    const/16 v24, -0x1

    .line 97
    .local v24, "elevation":I
    const/4 v6, 0x0

    .line 98
    .local v6, "bgColor":Landroid/content/res/ColorStateList;
    const/4 v9, -0x1

    .line 99
    .local v9, "bgAnimDuration":I
    const/16 v27, 0x0

    .line 100
    .local v27, "iconSrc":I
    const/16 v26, 0x0

    .line 102
    .local v26, "iconLineMorphing":I
    const/16 v25, 0x0

    .local v25, "i":I
    invoke-virtual/range {v20 .. v20}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v23

    .local v23, "count":I
    :goto_1d
    move/from16 v0, v25

    move/from16 v1, v23

    if-ge v0, v1, :cond_cf

    .line 103
    move-object/from16 v0, v20

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v21

    .line 105
    .local v21, "attr":I
    sget v4, Lcom/rey/material/R$styleable;->FloatingActionButton_fab_radius:I

    move/from16 v0, v21

    if-ne v0, v4, :cond_3d

    .line 106
    const/4 v4, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    .line 102
    :cond_3a
    :goto_3a
    add-int/lit8 v25, v25, 0x1

    goto :goto_1d

    .line 107
    :cond_3d
    sget v4, Lcom/rey/material/R$styleable;->FloatingActionButton_fab_elevation:I

    move/from16 v0, v21

    if-ne v0, v4, :cond_4d

    .line 108
    const/4 v4, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v24

    goto :goto_3a

    .line 109
    :cond_4d
    sget v4, Lcom/rey/material/R$styleable;->FloatingActionButton_fab_backgroundColor:I

    move/from16 v0, v21

    if-ne v0, v4, :cond_58

    .line 110
    invoke-virtual/range {v20 .. v21}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v6

    goto :goto_3a

    .line 111
    :cond_58
    sget v4, Lcom/rey/material/R$styleable;->FloatingActionButton_fab_backgroundAnimDuration:I

    move/from16 v0, v21

    if-ne v0, v4, :cond_68

    .line 112
    const/4 v4, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v9

    goto :goto_3a

    .line 113
    :cond_68
    sget v4, Lcom/rey/material/R$styleable;->FloatingActionButton_fab_iconSrc:I

    move/from16 v0, v21

    if-ne v0, v4, :cond_78

    .line 114
    const/4 v4, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v27

    goto :goto_3a

    .line 115
    :cond_78
    sget v4, Lcom/rey/material/R$styleable;->FloatingActionButton_fab_iconLineMorphing:I

    move/from16 v0, v21

    if-ne v0, v4, :cond_88

    .line 116
    const/4 v4, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v26

    goto :goto_3a

    .line 117
    :cond_88
    sget v4, Lcom/rey/material/R$styleable;->FloatingActionButton_fab_iconSize:I

    move/from16 v0, v21

    if-ne v0, v4, :cond_9c

    .line 118
    const/4 v4, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mIconSize:I

    goto :goto_3a

    .line 119
    :cond_9c
    sget v4, Lcom/rey/material/R$styleable;->FloatingActionButton_fab_animDuration:I

    move/from16 v0, v21

    if-ne v0, v4, :cond_b0

    .line 120
    const/4 v4, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mAnimDuration:I

    goto :goto_3a

    .line 121
    :cond_b0
    sget v4, Lcom/rey/material/R$styleable;->FloatingActionButton_fab_interpolator:I

    move/from16 v0, v21

    if-ne v0, v4, :cond_3a

    .line 122
    sget v4, Lcom/rey/material/R$styleable;->FloatingActionButton_fab_interpolator:I

    const/4 v7, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v28

    .line 123
    .local v28, "resId":I
    if-eqz v28, :cond_3a

    .line 124
    move-object/from16 v0, p1

    move/from16 v1, v28

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mInterpolator:Landroid/view/animation/Interpolator;

    goto/16 :goto_3a

    .line 128
    .end local v21    # "attr":I
    .end local v28    # "resId":I
    :cond_cf
    invoke-virtual/range {v20 .. v20}, Landroid/content/res/TypedArray;->recycle()V

    .line 130
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mIconSize:I

    if-gez v4, :cond_e4

    .line 131
    const/16 v4, 0x18

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mIconSize:I

    .line 133
    :cond_e4
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mAnimDuration:I

    if-gez v4, :cond_f9

    .line 134
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v7, 0x10e0001

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mAnimDuration:I

    .line 136
    :cond_f9
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mInterpolator:Landroid/view/animation/Interpolator;

    if-nez v4, :cond_108

    .line 137
    new-instance v4, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v4}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 139
    :cond_108
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    if-nez v4, :cond_1d4

    .line 140
    if-gez v5, :cond_118

    .line 141
    const/16 v4, 0x1c

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v5

    .line 143
    :cond_118
    if-gez v24, :cond_121

    .line 144
    const/4 v4, 0x4

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v24

    .line 146
    :cond_121
    if-nez v6, :cond_12e

    .line 147
    const/4 v4, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/rey/material/util/ThemeUtil;->colorAccent(Landroid/content/Context;I)I

    move-result v4

    invoke-static {v4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v6

    .line 149
    :cond_12e
    if-gez v9, :cond_131

    .line 150
    const/4 v9, 0x0

    .line 152
    :cond_131
    new-instance v4, Lcom/rey/material/drawable/OvalShadowDrawable;

    move/from16 v0, v24

    int-to-float v7, v0

    move/from16 v0, v24

    int-to-float v8, v0

    invoke-direct/range {v4 .. v9}, Lcom/rey/material/drawable/OvalShadowDrawable;-><init>(ILandroid/content/res/ColorStateList;FFI)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    .line 153
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/FloatingActionButton;->isInEditMode()Z

    move-result v7

    invoke-virtual {v4, v7}, Lcom/rey/material/drawable/OvalShadowDrawable;->setInEditMode(Z)V

    .line 154
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/FloatingActionButton;->getWidth()I

    move-result v11

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/FloatingActionButton;->getHeight()I

    move-result v12

    invoke-virtual {v4, v7, v8, v11, v12}, Lcom/rey/material/drawable/OvalShadowDrawable;->setBounds(IIII)V

    .line 155
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    move-object/from16 v0, p0

    invoke-virtual {v4, v0}, Lcom/rey/material/drawable/OvalShadowDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 171
    :cond_165
    :goto_165
    if-eqz v26, :cond_200

    .line 172
    new-instance v4, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    move-object/from16 v0, p1

    move/from16 v1, v26

    invoke-direct {v4, v0, v1}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v4}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->build()Lcom/rey/material/drawable/LineMorphingDrawable;

    move-result-object v4

    const/4 v7, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v7}, Lcom/rey/material/widget/FloatingActionButton;->setIcon(Landroid/graphics/drawable/Drawable;Z)V

    .line 176
    :cond_17a
    :goto_17a
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/FloatingActionButton;->getRippleManager()Lcom/rey/material/widget/RippleManager;

    move-result-object v10

    move-object/from16 v11, p0

    move-object/from16 v12, p1

    move-object/from16 v13, p2

    move/from16 v14, p3

    move/from16 v15, p4

    invoke-virtual/range {v10 .. v15}, Lcom/rey/material/widget/RippleManager;->onCreate(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 177
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/FloatingActionButton;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v22

    .line 178
    .local v22, "background":Landroid/graphics/drawable/Drawable;
    if-eqz v22, :cond_1d3

    move-object/from16 v0, v22

    instance-of v4, v0, Lcom/rey/material/drawable/RippleDrawable;

    if-eqz v4, :cond_1d3

    move-object/from16 v10, v22

    .line 179
    check-cast v10, Lcom/rey/material/drawable/RippleDrawable;

    .line 180
    .local v10, "drawable":Lcom/rey/material/drawable/RippleDrawable;
    const/4 v4, 0x0

    invoke-virtual {v10, v4}, Lcom/rey/material/drawable/RippleDrawable;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 181
    const/4 v11, 0x1

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v4}, Lcom/rey/material/drawable/OvalShadowDrawable;->getPaddingLeft()F

    move-result v4

    float-to-int v0, v4

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v4}, Lcom/rey/material/drawable/OvalShadowDrawable;->getPaddingTop()F

    move-result v4

    float-to-int v0, v4

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v4}, Lcom/rey/material/drawable/OvalShadowDrawable;->getPaddingRight()F

    move-result v4

    float-to-int v0, v4

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v4}, Lcom/rey/material/drawable/OvalShadowDrawable;->getPaddingBottom()F

    move-result v4

    float-to-int v0, v4

    move/from16 v19, v0

    invoke-virtual/range {v10 .. v19}, Lcom/rey/material/drawable/RippleDrawable;->setMask(IIIIIIIII)V

    .line 183
    .end local v10    # "drawable":Lcom/rey/material/drawable/RippleDrawable;
    :cond_1d3
    return-void

    .line 158
    .end local v22    # "background":Landroid/graphics/drawable/Drawable;
    :cond_1d4
    if-ltz v5, :cond_1dd

    .line 159
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v4, v5}, Lcom/rey/material/drawable/OvalShadowDrawable;->setRadius(I)Z

    .line 161
    :cond_1dd
    if-eqz v6, :cond_1e6

    .line 162
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v4, v6}, Lcom/rey/material/drawable/OvalShadowDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    .line 164
    :cond_1e6
    if-ltz v24, :cond_1f5

    .line 165
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    move/from16 v0, v24

    int-to-float v7, v0

    move/from16 v0, v24

    int-to-float v8, v0

    invoke-virtual {v4, v7, v8}, Lcom/rey/material/drawable/OvalShadowDrawable;->setShadow(FF)Z

    .line 167
    :cond_1f5
    if-ltz v9, :cond_165

    .line 168
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v4, v9}, Lcom/rey/material/drawable/OvalShadowDrawable;->setAnimationDuration(I)Z

    goto/16 :goto_165

    .line 173
    :cond_200
    if-eqz v27, :cond_17a

    .line 174
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    move/from16 v0, v27

    invoke-virtual {v4, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    const/4 v7, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v7}, Lcom/rey/material/widget/FloatingActionButton;->setIcon(Landroid/graphics/drawable/Drawable;Z)V

    goto/16 :goto_17a
.end method

.method public dismiss()V
    .registers 2

    .prologue
    .line 437
    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 438
    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 439
    :cond_f
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 479
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/OvalShadowDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 480
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 481
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mPrevIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_11

    .line 482
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mPrevIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 483
    :cond_11
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1a

    .line 484
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 485
    :cond_1a
    return-void
.end method

.method protected drawableStateChanged()V
    .registers 3

    .prologue
    .line 448
    invoke-super {p0}, Landroid/view/View;->drawableStateChanged()V

    .line 449
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    if-eqz v0, :cond_10

    .line 450
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/rey/material/drawable/OvalShadowDrawable;->setState([I)Z

    .line 451
    :cond_10
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1d

    .line 452
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 453
    :cond_1d
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mPrevIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_2a

    .line 454
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mPrevIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 455
    :cond_2a
    return-void
.end method

.method public getBackgroundColor()Landroid/content/res/ColorStateList;
    .registers 2

    .prologue
    .line 270
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v0}, Lcom/rey/material/drawable/OvalShadowDrawable;->getColor()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getElevation()F
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 231
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_b

    .line 232
    invoke-super {p0}, Landroid/view/View;->getElevation()F

    move-result v0

    .line 234
    :goto_a
    return v0

    :cond_b
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v0}, Lcom/rey/material/drawable/OvalShadowDrawable;->getShadowSize()F

    move-result v0

    goto :goto_a
.end method

.method public getIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 277
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getLineMorphingState()I
    .registers 2

    .prologue
    .line 250
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    instance-of v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable;

    if-eqz v0, :cond_13

    .line 251
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    check-cast v0, Lcom/rey/material/drawable/LineMorphingDrawable;

    invoke-virtual {v0}, Lcom/rey/material/drawable/LineMorphingDrawable;->getLineState()I

    move-result v0

    .line 253
    :goto_12
    return v0

    :cond_13
    const/4 v0, -0x1

    goto :goto_12
.end method

.method public getRadius()I
    .registers 2

    .prologue
    .line 216
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v0}, Lcom/rey/material/drawable/OvalShadowDrawable;->getRadius()I

    move-result v0

    return v0
.end method

.method protected getRippleManager()Lcom/rey/material/widget/RippleManager;
    .registers 3

    .prologue
    .line 488
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    if-nez v0, :cond_13

    .line 489
    const-class v1, Lcom/rey/material/widget/RippleManager;

    monitor-enter v1

    .line 490
    :try_start_7
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    if-nez v0, :cond_12

    .line 491
    new-instance v0, Lcom/rey/material/widget/RippleManager;

    invoke-direct {v0}, Lcom/rey/material/widget/RippleManager;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    .line 492
    :cond_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_16

    .line 495
    :cond_13
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    return-object v0

    .line 492
    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 79
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/FloatingActionButton;->setClickable(Z)V

    .line 80
    new-instance v0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;-><init>(Lcom/rey/material/widget/FloatingActionButton;)V

    iput-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mSwitchIconAnimator:Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;

    .line 81
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/FloatingActionButton;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 83
    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_1a

    .line 84
    invoke-static {p1, p2, p3, p4}, Lcom/rey/material/app/ThemeManager;->getStyleId(Landroid/content/Context;Landroid/util/AttributeSet;II)I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mStyleId:I

    .line 85
    :cond_1a
    return-void
.end method

.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 196
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 197
    iget v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mStyleId:I

    if-eqz v0, :cond_12

    .line 198
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->registerOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 199
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/FloatingActionButton;->onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V

    .line 201
    :cond_12
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 205
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 206
    invoke-static {p0}, Lcom/rey/material/widget/RippleManager;->cancelRipple(Landroid/view/View;)V

    .line 207
    iget v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mStyleId:I

    if-eqz v0, :cond_11

    .line 208
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->unregisterOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 209
    :cond_11
    return-void
.end method

.method protected onMeasure(II)V
    .registers 5
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 459
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v0}, Lcom/rey/material/drawable/OvalShadowDrawable;->getIntrinsicWidth()I

    move-result v0

    iget-object v1, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v1}, Lcom/rey/material/drawable/OvalShadowDrawable;->getIntrinsicHeight()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/rey/material/widget/FloatingActionButton;->setMeasuredDimension(II)V

    .line 460
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 532
    move-object v0, p1

    check-cast v0, Lcom/rey/material/widget/FloatingActionButton$SavedState;

    .line 534
    .local v0, "ss":Lcom/rey/material/widget/FloatingActionButton$SavedState;
    invoke-virtual {v0}, Lcom/rey/material/widget/FloatingActionButton$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 535
    iget v1, v0, Lcom/rey/material/widget/FloatingActionButton$SavedState;->state:I

    if-ltz v1, :cond_14

    .line 536
    iget v1, v0, Lcom/rey/material/widget/FloatingActionButton$SavedState;->state:I

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/rey/material/widget/FloatingActionButton;->setLineMorphingState(IZ)V

    .line 537
    :cond_14
    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton;->requestLayout()V

    .line 538
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 522
    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 524
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Lcom/rey/material/widget/FloatingActionButton$SavedState;

    invoke-direct {v0, v1}, Lcom/rey/material/widget/FloatingActionButton$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 526
    .local v0, "ss":Lcom/rey/material/widget/FloatingActionButton$SavedState;
    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton;->getLineMorphingState()I

    move-result v2

    iput v2, v0, Lcom/rey/material/widget/FloatingActionButton$SavedState;->state:I

    .line 527
    return-object v0
.end method

.method protected onSizeChanged(IIII)V
    .registers 12
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    const/4 v2, 0x0

    const/high16 v6, 0x40000000    # 2.0f

    .line 464
    iget-object v1, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v1, v2, v2, p1, p2}, Lcom/rey/material/drawable/OvalShadowDrawable;->setBounds(IIII)V

    .line 466
    iget-object v1, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_36

    .line 467
    iget v1, p0, Lcom/rey/material/widget/FloatingActionButton;->mIconSize:I

    int-to-float v1, v1

    div-float v0, v1, v6

    .line 468
    .local v0, "half":F
    iget-object v1, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v2}, Lcom/rey/material/drawable/OvalShadowDrawable;->getCenterX()F

    move-result v2

    sub-float/2addr v2, v0

    float-to-int v2, v2

    iget-object v3, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v3}, Lcom/rey/material/drawable/OvalShadowDrawable;->getCenterY()F

    move-result v3

    sub-float/2addr v3, v0

    float-to-int v3, v3

    iget-object v4, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v4}, Lcom/rey/material/drawable/OvalShadowDrawable;->getCenterX()F

    move-result v4

    add-float/2addr v4, v0

    float-to-int v4, v4

    iget-object v5, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v5}, Lcom/rey/material/drawable/OvalShadowDrawable;->getCenterY()F

    move-result v5

    add-float/2addr v5, v0

    float-to-int v5, v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 471
    .end local v0    # "half":F
    :cond_36
    iget-object v1, p0, Lcom/rey/material/widget/FloatingActionButton;->mPrevIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_64

    .line 472
    iget v1, p0, Lcom/rey/material/widget/FloatingActionButton;->mIconSize:I

    int-to-float v1, v1

    div-float v0, v1, v6

    .line 473
    .restart local v0    # "half":F
    iget-object v1, p0, Lcom/rey/material/widget/FloatingActionButton;->mPrevIcon:Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v2}, Lcom/rey/material/drawable/OvalShadowDrawable;->getCenterX()F

    move-result v2

    sub-float/2addr v2, v0

    float-to-int v2, v2

    iget-object v3, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v3}, Lcom/rey/material/drawable/OvalShadowDrawable;->getCenterY()F

    move-result v3

    sub-float/2addr v3, v0

    float-to-int v3, v3

    iget-object v4, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v4}, Lcom/rey/material/drawable/OvalShadowDrawable;->getCenterX()F

    move-result v4

    add-float/2addr v4, v0

    float-to-int v4, v4

    iget-object v5, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v5}, Lcom/rey/material/drawable/OvalShadowDrawable;->getCenterY()F

    move-result v5

    add-float/2addr v5, v0

    float-to-int v5, v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 475
    .end local v0    # "half":F
    :cond_64
    return-void
.end method

.method public onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V
    .registers 5
    .param p1, "event"    # Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;

    .prologue
    .line 187
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/widget/FloatingActionButton;->mStyleId:I

    invoke-virtual {v1, v2}, Lcom/rey/material/app/ThemeManager;->getCurrentStyle(I)I

    move-result v0

    .line 188
    .local v0, "style":I
    iget v1, p0, Lcom/rey/material/widget/FloatingActionButton;->mCurrentStyle:I

    if-eq v1, v0, :cond_15

    .line 189
    iput v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mCurrentStyle:I

    .line 190
    iget v1, p0, Lcom/rey/material/widget/FloatingActionButton;->mCurrentStyle:I

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/FloatingActionButton;->applyStyle(I)V

    .line 192
    :cond_15
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 8
    .param p1, "event"    # Landroid/view/MotionEvent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x0

    .line 511
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 513
    .local v0, "action":I
    if-nez v0, :cond_18

    iget-object v3, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    invoke-virtual {v3, v4, v5}, Lcom/rey/material/drawable/OvalShadowDrawable;->isPointerOver(FF)Z

    move-result v3

    if-nez v3, :cond_18

    .line 517
    :cond_17
    :goto_17
    return v2

    .line 516
    :cond_18
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    .line 517
    .local v1, "result":Z
    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton;->getRippleManager()Lcom/rey/material/widget/RippleManager;

    move-result-object v3

    invoke-virtual {v3, p0, p1}, Lcom/rey/material/widget/RippleManager;->onTouchEvent(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v3

    if-nez v3, :cond_28

    if-eqz v1, :cond_17

    :cond_28
    const/4 v2, 0x1

    goto :goto_17
.end method

.method public setBackgroundColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 314
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/OvalShadowDrawable;->setColor(I)V

    .line 315
    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton;->invalidate()V

    .line 316
    return-void
.end method

.method public setBackgroundColor(Landroid/content/res/ColorStateList;)V
    .registers 3
    .param p1, "color"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 308
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/OvalShadowDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    .line 309
    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton;->invalidate()V

    .line 310
    return-void
.end method

.method public setElevation(F)V
    .registers 4
    .param p1, "elevation"    # F
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 240
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_a

    .line 241
    invoke-super {p0, p1}, Landroid/view/View;->setElevation(F)V

    .line 244
    :cond_9
    :goto_9
    return-void

    .line 242
    :cond_a
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v0, p1, p1}, Lcom/rey/material/drawable/OvalShadowDrawable;->setShadow(FF)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 243
    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton;->requestLayout()V

    goto :goto_9
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;Z)V
    .registers 9
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;
    .param p2, "animation"    # Z

    .prologue
    .line 286
    if-nez p1, :cond_3

    .line 305
    :goto_2
    return-void

    .line 289
    :cond_3
    if-eqz p2, :cond_e

    .line 290
    iget-object v1, p0, Lcom/rey/material/widget/FloatingActionButton;->mSwitchIconAnimator:Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;

    invoke-virtual {v1, p1}, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->startAnimation(Landroid/graphics/drawable/Drawable;)Z

    .line 291
    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton;->invalidate()V

    goto :goto_2

    .line 294
    :cond_e
    iget-object v1, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_1d

    .line 295
    iget-object v1, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 296
    iget-object v1, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/FloatingActionButton;->unscheduleDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 299
    :cond_1d
    iput-object p1, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    .line 300
    iget v1, p0, Lcom/rey/material/widget/FloatingActionButton;->mIconSize:I

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float v0, v1, v2

    .line 301
    .local v0, "half":F
    iget-object v1, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v2}, Lcom/rey/material/drawable/OvalShadowDrawable;->getCenterX()F

    move-result v2

    sub-float/2addr v2, v0

    float-to-int v2, v2

    iget-object v3, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v3}, Lcom/rey/material/drawable/OvalShadowDrawable;->getCenterY()F

    move-result v3

    sub-float/2addr v3, v0

    float-to-int v3, v3

    iget-object v4, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v4}, Lcom/rey/material/drawable/OvalShadowDrawable;->getCenterX()F

    move-result v4

    add-float/2addr v4, v0

    float-to-int v4, v4

    iget-object v5, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v5}, Lcom/rey/material/drawable/OvalShadowDrawable;->getCenterY()F

    move-result v5

    add-float/2addr v5, v0

    float-to-int v5, v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 302
    iget-object v1, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 303
    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton;->invalidate()V

    goto :goto_2
.end method

.method public setLineMorphingState(IZ)V
    .registers 4
    .param p1, "state"    # I
    .param p2, "animation"    # Z

    .prologue
    .line 262
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    instance-of v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable;

    if-eqz v0, :cond_11

    .line 263
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    check-cast v0, Lcom/rey/material/drawable/LineMorphingDrawable;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/drawable/LineMorphingDrawable;->switchLineState(IZ)V

    .line 264
    :cond_11
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 3
    .param p1, "l"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 500
    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton;->getRippleManager()Lcom/rey/material/widget/RippleManager;

    move-result-object v0

    .line 501
    .local v0, "rippleManager":Lcom/rey/material/widget/RippleManager;
    if-ne p1, v0, :cond_a

    .line 502
    invoke-super {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 507
    :goto_9
    return-void

    .line 504
    :cond_a
    invoke-virtual {v0, p1}, Lcom/rey/material/widget/RippleManager;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 505
    invoke-virtual {p0, v0}, Lcom/rey/material/widget/FloatingActionButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_9
.end method

.method public setRadius(I)V
    .registers 3
    .param p1, "radius"    # I

    .prologue
    .line 224
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/OvalShadowDrawable;->setRadius(I)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 225
    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton;->requestLayout()V

    .line 226
    :cond_b
    return-void
.end method

.method public show(Landroid/app/Activity;III)V
    .registers 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "gravity"    # I

    .prologue
    .line 329
    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-nez v1, :cond_22

    .line 330
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    iget-object v1, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v1}, Lcom/rey/material/drawable/OvalShadowDrawable;->getIntrinsicWidth()I

    move-result v1

    iget-object v2, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v2}, Lcom/rey/material/drawable/OvalShadowDrawable;->getIntrinsicHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 331
    .local v0, "params":Landroid/widget/FrameLayout$LayoutParams;
    invoke-direct {p0, p2, p3, p4, v0}, Lcom/rey/material/widget/FloatingActionButton;->updateParams(IIILandroid/view/ViewGroup$LayoutParams;)V

    .line 333
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, p0, v0}, Landroid/view/Window;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 337
    .end local v0    # "params":Landroid/widget/FrameLayout$LayoutParams;
    :goto_21
    return-void

    .line 336
    :cond_22
    invoke-virtual {p0, p2, p3, p4}, Lcom/rey/material/widget/FloatingActionButton;->updateLocation(III)V

    goto :goto_21
.end method

.method public show(Landroid/view/ViewGroup;III)V
    .registers 7
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "gravity"    # I

    .prologue
    .line 350
    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-nez v1, :cond_22

    .line 351
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 352
    .local v0, "params":Landroid/view/ViewGroup$LayoutParams;
    iget-object v1, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v1}, Lcom/rey/material/drawable/OvalShadowDrawable;->getIntrinsicWidth()I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 353
    iget-object v1, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-virtual {v1}, Lcom/rey/material/drawable/OvalShadowDrawable;->getIntrinsicHeight()I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 354
    invoke-direct {p0, p2, p3, p4, v0}, Lcom/rey/material/widget/FloatingActionButton;->updateParams(IIILandroid/view/ViewGroup$LayoutParams;)V

    .line 356
    invoke-virtual {p1, p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 360
    .end local v0    # "params":Landroid/view/ViewGroup$LayoutParams;
    :goto_21
    return-void

    .line 359
    :cond_22
    invoke-virtual {p0, p2, p3, p4}, Lcom/rey/material/widget/FloatingActionButton;->updateLocation(III)V

    goto :goto_21
.end method

.method public updateLocation(III)V
    .registers 6
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "gravity"    # I

    .prologue
    .line 371
    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_e

    .line 372
    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/rey/material/widget/FloatingActionButton;->updateParams(IIILandroid/view/ViewGroup$LayoutParams;)V

    .line 375
    :goto_d
    return-void

    .line 374
    :cond_e
    const-class v0, Lcom/rey/material/widget/FloatingActionButton;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "updateLocation() is called without parent"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_d
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .registers 3
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 443
    invoke-super {p0, p1}, Landroid/view/View;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_12

    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;

    if-eq v0, p1, :cond_12

    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_12

    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton;->mPrevIcon:Landroid/graphics/drawable/Drawable;

    if-ne v0, p1, :cond_14

    :cond_12
    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method
