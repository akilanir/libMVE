.class public Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;
.super Ljava/lang/Object;
.source "ToolbarRippleDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/drawable/ToolbarRippleDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mBackgroundAnimDuration:I

.field private mBackgroundColor:I

.field private mDelayClickType:I

.field private mInInterpolator:Landroid/view/animation/Interpolator;

.field private mMaxRippleRadius:I

.field private mOutInterpolator:Landroid/view/animation/Interpolator;

.field private mRippleAnimDuration:I

.field private mRippleColor:I

.field private mRippleType:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 434
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 422
    const/16 v0, 0xc8

    iput v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mBackgroundAnimDuration:I

    .line 427
    const/16 v0, 0x190

    iput v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mRippleAnimDuration:I

    .line 434
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "defStyleRes"    # I

    .prologue
    .line 437
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1, p2}, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 438
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

    .line 440
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 422
    const/16 v3, 0xc8

    iput v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mBackgroundAnimDuration:I

    .line 427
    const/16 v3, 0x190

    iput v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mRippleAnimDuration:I

    .line 441
    sget-object v3, Lcom/rey/material/R$styleable;->RippleDrawable:[I

    invoke-virtual {p1, p2, v3, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 444
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_backgroundColor:I

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->backgroundColor(I)Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;

    .line 445
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_backgroundAnimDuration:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->backgroundAnimDuration(I)Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;

    .line 446
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_rippleType:I

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->rippleType(I)Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;

    .line 447
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_delayClick:I

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->delayClickType(I)Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;

    .line 448
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_maxRippleRadius:I

    invoke-static {v0, v3}, Lcom/rey/material/util/ThemeUtil;->getType(Landroid/content/res/TypedArray;I)I

    move-result v2

    .line 449
    .local v2, "type":I
    const/16 v3, 0x10

    if-lt v2, v3, :cond_99

    const/16 v3, 0x1f

    if-gt v2, v3, :cond_99

    .line 450
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_maxRippleRadius:I

    const/4 v4, -0x1

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->maxRippleRadius(I)Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;

    .line 453
    :goto_59
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_rippleColor:I

    invoke-static {p1, v5}, Lcom/rey/material/util/ThemeUtil;->colorControlHighlight(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->rippleColor(I)Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;

    .line 454
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_rippleAnimDuration:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->rippleAnimDuration(I)Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;

    .line 455
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_inInterpolator:I

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .local v1, "resId":I
    if-eqz v1, :cond_86

    .line 456
    invoke-static {p1, v1}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->inInterpolator(Landroid/view/animation/Interpolator;)Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;

    .line 457
    :cond_86
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_outInterpolator:I

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    if-eqz v1, :cond_95

    .line 458
    invoke-static {p1, v1}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->outInterpolator(Landroid/view/animation/Interpolator;)Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;

    .line 460
    :cond_95
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 461
    return-void

    .line 452
    .end local v1    # "resId":I
    :cond_99
    sget v3, Lcom/rey/material/R$styleable;->RippleDrawable_rd_maxRippleRadius:I

    const/16 v4, 0x30

    invoke-static {p1, v4}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->maxRippleRadius(I)Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;

    goto :goto_59
.end method


# virtual methods
.method public backgroundAnimDuration(I)Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 474
    iput p1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mBackgroundAnimDuration:I

    .line 475
    return-object p0
.end method

.method public backgroundColor(I)Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 479
    iput p1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mBackgroundColor:I

    .line 480
    return-object p0
.end method

.method public build()Lcom/rey/material/drawable/ToolbarRippleDrawable;
    .registers 12

    .prologue
    .line 464
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mInInterpolator:Landroid/view/animation/Interpolator;

    if-nez v0, :cond_b

    .line 465
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mInInterpolator:Landroid/view/animation/Interpolator;

    .line 467
    :cond_b
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mOutInterpolator:Landroid/view/animation/Interpolator;

    if-nez v0, :cond_16

    .line 468
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mOutInterpolator:Landroid/view/animation/Interpolator;

    .line 470
    :cond_16
    new-instance v0, Lcom/rey/material/drawable/ToolbarRippleDrawable;

    iget v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mBackgroundAnimDuration:I

    iget v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mBackgroundColor:I

    iget v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mRippleType:I

    iget v4, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mDelayClickType:I

    iget v5, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mMaxRippleRadius:I

    iget v6, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mRippleAnimDuration:I

    iget v7, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mRippleColor:I

    iget-object v8, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mInInterpolator:Landroid/view/animation/Interpolator;

    iget-object v9, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mOutInterpolator:Landroid/view/animation/Interpolator;

    const/4 v10, 0x0

    invoke-direct/range {v0 .. v10}, Lcom/rey/material/drawable/ToolbarRippleDrawable;-><init>(IIIIIIILandroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;Lcom/rey/material/drawable/ToolbarRippleDrawable$1;)V

    return-object v0
.end method

.method public delayClickType(I)Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;
    .registers 2
    .param p1, "type"    # I

    .prologue
    .line 489
    iput p1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mDelayClickType:I

    .line 490
    return-object p0
.end method

.method public inInterpolator(Landroid/view/animation/Interpolator;)Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;
    .registers 2
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 509
    iput-object p1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mInInterpolator:Landroid/view/animation/Interpolator;

    .line 510
    return-object p0
.end method

.method public maxRippleRadius(I)Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;
    .registers 2
    .param p1, "radius"    # I

    .prologue
    .line 494
    iput p1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mMaxRippleRadius:I

    .line 495
    return-object p0
.end method

.method public outInterpolator(Landroid/view/animation/Interpolator;)Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;
    .registers 2
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 514
    iput-object p1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mOutInterpolator:Landroid/view/animation/Interpolator;

    .line 515
    return-object p0
.end method

.method public rippleAnimDuration(I)Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 499
    iput p1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mRippleAnimDuration:I

    .line 500
    return-object p0
.end method

.method public rippleColor(I)Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 504
    iput p1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mRippleColor:I

    .line 505
    return-object p0
.end method

.method public rippleType(I)Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;
    .registers 2
    .param p1, "type"    # I

    .prologue
    .line 484
    iput p1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->mRippleType:I

    .line 485
    return-object p0
.end method
