.class public Lcom/rey/material/drawable/RippleDrawable$Builder;
.super Ljava/lang/Object;
.source "RippleDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/drawable/RippleDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mBackgroundAnimDuration:I

.field private mBackgroundColor:I

.field private mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

.field private mDelayClickType:I

.field private mInInterpolator:Landroid/view/animation/Interpolator;

.field private mMaskBottom:I

.field private mMaskBottomLeftCornerRadius:I

.field private mMaskBottomRightCornerRadius:I

.field private mMaskLeft:I

.field private mMaskRight:I

.field private mMaskTop:I

.field private mMaskTopLeftCornerRadius:I

.field private mMaskTopRightCornerRadius:I

.field private mMaskType:I

.field private mMaxRippleRadius:I

.field private mOutInterpolator:Landroid/view/animation/Interpolator;

.field private mRippleAnimDuration:I

.field private mRippleColor:I

.field private mRippleType:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 519
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 497
    const/16 v0, 0xc8

    iput v0, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mBackgroundAnimDuration:I

    .line 502
    const/16 v0, 0x190

    iput v0, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mRippleAnimDuration:I

    .line 519
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "defStyleRes"    # I

    .prologue
    .line 522
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1, p2}, Lcom/rey/material/drawable/RippleDrawable$Builder;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 523
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const v6, 0x10e0001

    const/4 v5, 0x0

    .line 525
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 497
    const/16 v3, 0xc8

    iput v3, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mBackgroundAnimDuration:I

    .line 502
    const/16 v3, 0x190

    iput v3, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mRippleAnimDuration:I

    .line 526
    sget-object v3, Lcom/rey/material/R$styleable;->RippleDrawable:[I

    invoke-virtual {p1, p2, v3, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 529
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_backgroundColor:I

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;->backgroundColor(I)Lcom/rey/material/drawable/RippleDrawable$Builder;

    .line 530
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_backgroundAnimDuration:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;->backgroundAnimDuration(I)Lcom/rey/material/drawable/RippleDrawable$Builder;

    .line 531
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_rippleType:I

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;->rippleType(I)Lcom/rey/material/drawable/RippleDrawable$Builder;

    .line 532
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_delayClick:I

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;->delayClickType(I)Lcom/rey/material/drawable/RippleDrawable$Builder;

    .line 533
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_maxRippleRadius:I

    invoke-static {v0, v3}, Lcom/rey/material/util/ThemeUtil;->getType(Landroid/content/res/TypedArray;I)I

    move-result v2

    .line 534
    .local v2, "type":I
    const/16 v3, 0x10

    if-lt v2, v3, :cond_10c

    const/16 v3, 0x1f

    if-gt v2, v3, :cond_10c

    .line 535
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_maxRippleRadius:I

    const/4 v4, -0x1

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;->maxRippleRadius(I)Lcom/rey/material/drawable/RippleDrawable$Builder;

    .line 538
    :goto_59
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_rippleColor:I

    invoke-static {p1, v5}, Lcom/rey/material/util/ThemeUtil;->colorControlHighlight(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;->rippleColor(I)Lcom/rey/material/drawable/RippleDrawable$Builder;

    .line 539
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_rippleAnimDuration:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;->rippleAnimDuration(I)Lcom/rey/material/drawable/RippleDrawable$Builder;

    .line 540
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_inInterpolator:I

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .local v1, "resId":I
    if-eqz v1, :cond_86

    .line 541
    invoke-static {p1, v1}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;->inInterpolator(Landroid/view/animation/Interpolator;)Lcom/rey/material/drawable/RippleDrawable$Builder;

    .line 542
    :cond_86
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_outInterpolator:I

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    if-eqz v1, :cond_95

    .line 543
    invoke-static {p1, v1}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;->outInterpolator(Landroid/view/animation/Interpolator;)Lcom/rey/material/drawable/RippleDrawable$Builder;

    .line 544
    :cond_95
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_maskType:I

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;->maskType(I)Lcom/rey/material/drawable/RippleDrawable$Builder;

    .line 545
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_cornerRadius:I

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;->cornerRadius(I)Lcom/rey/material/drawable/RippleDrawable$Builder;

    .line 546
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_topLeftCornerRadius:I

    iget v4, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskTopLeftCornerRadius:I

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;->topLeftCornerRadius(I)Lcom/rey/material/drawable/RippleDrawable$Builder;

    .line 547
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_topRightCornerRadius:I

    iget v4, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskTopRightCornerRadius:I

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;->topRightCornerRadius(I)Lcom/rey/material/drawable/RippleDrawable$Builder;

    .line 548
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_bottomRightCornerRadius:I

    iget v4, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskBottomRightCornerRadius:I

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;->bottomRightCornerRadius(I)Lcom/rey/material/drawable/RippleDrawable$Builder;

    .line 549
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_bottomLeftCornerRadius:I

    iget v4, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskBottomLeftCornerRadius:I

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;->bottomLeftCornerRadius(I)Lcom/rey/material/drawable/RippleDrawable$Builder;

    .line 550
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_padding:I

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;->padding(I)Lcom/rey/material/drawable/RippleDrawable$Builder;

    .line 551
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_leftPadding:I

    iget v4, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskLeft:I

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;->left(I)Lcom/rey/material/drawable/RippleDrawable$Builder;

    .line 552
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_rightPadding:I

    iget v4, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskRight:I

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;->right(I)Lcom/rey/material/drawable/RippleDrawable$Builder;

    .line 553
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_topPadding:I

    iget v4, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskTop:I

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;->top(I)Lcom/rey/material/drawable/RippleDrawable$Builder;

    .line 554
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_bottomPadding:I

    iget v4, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskBottom:I

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;->bottom(I)Lcom/rey/material/drawable/RippleDrawable$Builder;

    .line 556
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 557
    return-void

    .line 537
    .end local v1    # "resId":I
    :cond_10c
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_maxRippleRadius:I

    const/16 v4, 0x30

    invoke-static {p1, v4}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;->maxRippleRadius(I)Lcom/rey/material/drawable/RippleDrawable$Builder;

    goto/16 :goto_59
.end method


# virtual methods
.method public backgroundAnimDuration(I)Lcom/rey/material/drawable/RippleDrawable$Builder;
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 575
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mBackgroundAnimDuration:I

    .line 576
    return-object p0
.end method

.method public backgroundColor(I)Lcom/rey/material/drawable/RippleDrawable$Builder;
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 580
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mBackgroundColor:I

    .line 581
    return-object p0
.end method

.method public backgroundDrawable(Landroid/graphics/drawable/Drawable;)Lcom/rey/material/drawable/RippleDrawable$Builder;
    .registers 2
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 570
    iput-object p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 571
    return-object p0
.end method

.method public bottom(I)Lcom/rey/material/drawable/RippleDrawable$Builder;
    .registers 2
    .param p1, "padding"    # I

    .prologue
    .line 676
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskBottom:I

    .line 677
    return-object p0
.end method

.method public bottomLeftCornerRadius(I)Lcom/rey/material/drawable/RippleDrawable$Builder;
    .registers 2
    .param p1, "radius"    # I

    .prologue
    .line 643
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskBottomLeftCornerRadius:I

    .line 644
    return-object p0
.end method

.method public bottomRightCornerRadius(I)Lcom/rey/material/drawable/RippleDrawable$Builder;
    .registers 2
    .param p1, "radius"    # I

    .prologue
    .line 648
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskBottomRightCornerRadius:I

    .line 649
    return-object p0
.end method

.method public build()Lcom/rey/material/drawable/RippleDrawable;
    .registers 23

    .prologue
    .line 560
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mInInterpolator:Landroid/view/animation/Interpolator;

    if-nez v1, :cond_f

    .line 561
    new-instance v1, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mInInterpolator:Landroid/view/animation/Interpolator;

    .line 563
    :cond_f
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mOutInterpolator:Landroid/view/animation/Interpolator;

    if-nez v1, :cond_1e

    .line 564
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mOutInterpolator:Landroid/view/animation/Interpolator;

    .line 566
    :cond_1e
    new-instance v1, Lcom/rey/material/drawable/RippleDrawable;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mBackgroundAnimDuration:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mBackgroundColor:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mRippleType:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mDelayClickType:I

    move-object/from16 v0, p0

    iget v7, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaxRippleRadius:I

    move-object/from16 v0, p0

    iget v8, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mRippleAnimDuration:I

    move-object/from16 v0, p0

    iget v9, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mRippleColor:I

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mInInterpolator:Landroid/view/animation/Interpolator;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mOutInterpolator:Landroid/view/animation/Interpolator;

    move-object/from16 v0, p0

    iget v12, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskType:I

    move-object/from16 v0, p0

    iget v13, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskTopLeftCornerRadius:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskTopRightCornerRadius:I

    move-object/from16 v0, p0

    iget v15, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskBottomRightCornerRadius:I

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskBottomLeftCornerRadius:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskLeft:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskTop:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskRight:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskBottom:I

    move/from16 v20, v0

    const/16 v21, 0x0

    invoke-direct/range {v1 .. v21}, Lcom/rey/material/drawable/RippleDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIIIIIILandroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;IIIIIIIIILcom/rey/material/drawable/RippleDrawable$1;)V

    return-object v1
.end method

.method public cornerRadius(I)Lcom/rey/material/drawable/RippleDrawable$Builder;
    .registers 2
    .param p1, "radius"    # I

    .prologue
    .line 625
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskTopLeftCornerRadius:I

    .line 626
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskTopRightCornerRadius:I

    .line 627
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskBottomLeftCornerRadius:I

    .line 628
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskBottomRightCornerRadius:I

    .line 629
    return-object p0
.end method

.method public delayClickType(I)Lcom/rey/material/drawable/RippleDrawable$Builder;
    .registers 2
    .param p1, "type"    # I

    .prologue
    .line 590
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mDelayClickType:I

    .line 591
    return-object p0
.end method

.method public inInterpolator(Landroid/view/animation/Interpolator;)Lcom/rey/material/drawable/RippleDrawable$Builder;
    .registers 2
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 610
    iput-object p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mInInterpolator:Landroid/view/animation/Interpolator;

    .line 611
    return-object p0
.end method

.method public left(I)Lcom/rey/material/drawable/RippleDrawable$Builder;
    .registers 2
    .param p1, "padding"    # I

    .prologue
    .line 661
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskLeft:I

    .line 662
    return-object p0
.end method

.method public maskType(I)Lcom/rey/material/drawable/RippleDrawable$Builder;
    .registers 2
    .param p1, "type"    # I

    .prologue
    .line 620
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskType:I

    .line 621
    return-object p0
.end method

.method public maxRippleRadius(I)Lcom/rey/material/drawable/RippleDrawable$Builder;
    .registers 2
    .param p1, "radius"    # I

    .prologue
    .line 595
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaxRippleRadius:I

    .line 596
    return-object p0
.end method

.method public outInterpolator(Landroid/view/animation/Interpolator;)Lcom/rey/material/drawable/RippleDrawable$Builder;
    .registers 2
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 615
    iput-object p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mOutInterpolator:Landroid/view/animation/Interpolator;

    .line 616
    return-object p0
.end method

.method public padding(I)Lcom/rey/material/drawable/RippleDrawable$Builder;
    .registers 2
    .param p1, "padding"    # I

    .prologue
    .line 653
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskLeft:I

    .line 654
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskTop:I

    .line 655
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskRight:I

    .line 656
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskBottom:I

    .line 657
    return-object p0
.end method

.method public right(I)Lcom/rey/material/drawable/RippleDrawable$Builder;
    .registers 2
    .param p1, "padding"    # I

    .prologue
    .line 671
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskRight:I

    .line 672
    return-object p0
.end method

.method public rippleAnimDuration(I)Lcom/rey/material/drawable/RippleDrawable$Builder;
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 600
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mRippleAnimDuration:I

    .line 601
    return-object p0
.end method

.method public rippleColor(I)Lcom/rey/material/drawable/RippleDrawable$Builder;
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 605
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mRippleColor:I

    .line 606
    return-object p0
.end method

.method public rippleType(I)Lcom/rey/material/drawable/RippleDrawable$Builder;
    .registers 2
    .param p1, "type"    # I

    .prologue
    .line 585
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mRippleType:I

    .line 586
    return-object p0
.end method

.method public top(I)Lcom/rey/material/drawable/RippleDrawable$Builder;
    .registers 2
    .param p1, "padding"    # I

    .prologue
    .line 666
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskTop:I

    .line 667
    return-object p0
.end method

.method public topLeftCornerRadius(I)Lcom/rey/material/drawable/RippleDrawable$Builder;
    .registers 2
    .param p1, "radius"    # I

    .prologue
    .line 633
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskTopLeftCornerRadius:I

    .line 634
    return-object p0
.end method

.method public topRightCornerRadius(I)Lcom/rey/material/drawable/RippleDrawable$Builder;
    .registers 2
    .param p1, "radius"    # I

    .prologue
    .line 638
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Builder;->mMaskTopRightCornerRadius:I

    .line 639
    return-object p0
.end method
