.class public Lcom/rey/material/widget/Switch;
.super Landroid/view/View;
.source "Switch.java"

# interfaces
.implements Landroid/widget/Checkable;
.implements Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/widget/Switch$SavedState;,
        Lcom/rey/material/widget/Switch$OnCheckedChangeListener;
    }
.end annotation


# static fields
.field private static final COLOR_SHADOW_END:I = 0x0

.field private static final COLOR_SHADOW_START:I = 0x4c000000


# instance fields
.field private mAnimDuration:I

.field private mChecked:Z

.field protected mCurrentStyle:I

.field private mDrawRect:Landroid/graphics/RectF;

.field private mFlingVelocity:F

.field private mGravity:I

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mIsRtl:Z

.field private mMaxAnimDuration:I

.field private mMemoX:F

.field private mOnCheckedChangeListener:Lcom/rey/material/widget/Switch$OnCheckedChangeListener;

.field private mPaint:Landroid/graphics/Paint;

.field private mRippleManager:Lcom/rey/material/widget/RippleManager;

.field private mRunning:Z

.field private mShadowOffset:I

.field private mShadowPaint:Landroid/graphics/Paint;

.field private mShadowPath:Landroid/graphics/Path;

.field private mShadowSize:I

.field private mStartPosition:F

.field private mStartTime:J

.field private mStartX:F

.field protected mStyleId:I

.field private mTempRect:Landroid/graphics/RectF;

.field private mTempStates:[I

.field private mThumbColors:Landroid/content/res/ColorStateList;

.field private mThumbPosition:F

.field private mThumbRadius:I

.field private mTrackCap:Landroid/graphics/Paint$Cap;

.field private mTrackColors:Landroid/content/res/ColorStateList;

.field private mTrackPath:Landroid/graphics/Path;

.field private mTrackSize:I

.field private final mUpdater:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 96
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 40
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/Switch;->mCurrentStyle:I

    .line 42
    iput-boolean v2, p0, Lcom/rey/material/widget/Switch;->mRunning:Z

    .line 49
    iput v1, p0, Lcom/rey/material/widget/Switch;->mTrackSize:I

    .line 51
    sget-object v0, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    iput-object v0, p0, Lcom/rey/material/widget/Switch;->mTrackCap:Landroid/graphics/Paint$Cap;

    .line 52
    iput v1, p0, Lcom/rey/material/widget/Switch;->mThumbRadius:I

    .line 55
    iput v1, p0, Lcom/rey/material/widget/Switch;->mMaxAnimDuration:I

    .line 57
    const/16 v0, 0x10

    iput v0, p0, Lcom/rey/material/widget/Switch;->mGravity:I

    .line 59
    iput-boolean v2, p0, Lcom/rey/material/widget/Switch;->mChecked:Z

    .line 69
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/rey/material/widget/Switch;->mTempStates:[I

    .line 71
    iput v1, p0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    .line 72
    iput v1, p0, Lcom/rey/material/widget/Switch;->mShadowOffset:I

    .line 79
    iput-boolean v2, p0, Lcom/rey/material/widget/Switch;->mIsRtl:Z

    .line 599
    new-instance v0, Lcom/rey/material/widget/Switch$1;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/Switch$1;-><init>(Lcom/rey/material/widget/Switch;)V

    iput-object v0, p0, Lcom/rey/material/widget/Switch;->mUpdater:Ljava/lang/Runnable;

    .line 98
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v2, v2}, Lcom/rey/material/widget/Switch;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 99
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 102
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 40
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/Switch;->mCurrentStyle:I

    .line 42
    iput-boolean v2, p0, Lcom/rey/material/widget/Switch;->mRunning:Z

    .line 49
    iput v1, p0, Lcom/rey/material/widget/Switch;->mTrackSize:I

    .line 51
    sget-object v0, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    iput-object v0, p0, Lcom/rey/material/widget/Switch;->mTrackCap:Landroid/graphics/Paint$Cap;

    .line 52
    iput v1, p0, Lcom/rey/material/widget/Switch;->mThumbRadius:I

    .line 55
    iput v1, p0, Lcom/rey/material/widget/Switch;->mMaxAnimDuration:I

    .line 57
    const/16 v0, 0x10

    iput v0, p0, Lcom/rey/material/widget/Switch;->mGravity:I

    .line 59
    iput-boolean v2, p0, Lcom/rey/material/widget/Switch;->mChecked:Z

    .line 69
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/rey/material/widget/Switch;->mTempStates:[I

    .line 71
    iput v1, p0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    .line 72
    iput v1, p0, Lcom/rey/material/widget/Switch;->mShadowOffset:I

    .line 79
    iput-boolean v2, p0, Lcom/rey/material/widget/Switch;->mIsRtl:Z

    .line 599
    new-instance v0, Lcom/rey/material/widget/Switch$1;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/Switch$1;-><init>(Lcom/rey/material/widget/Switch;)V

    iput-object v0, p0, Lcom/rey/material/widget/Switch;->mUpdater:Ljava/lang/Runnable;

    .line 104
    invoke-virtual {p0, p1, p2, v2, v2}, Lcom/rey/material/widget/Switch;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 105
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 108
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 40
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/Switch;->mCurrentStyle:I

    .line 42
    iput-boolean v2, p0, Lcom/rey/material/widget/Switch;->mRunning:Z

    .line 49
    iput v1, p0, Lcom/rey/material/widget/Switch;->mTrackSize:I

    .line 51
    sget-object v0, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    iput-object v0, p0, Lcom/rey/material/widget/Switch;->mTrackCap:Landroid/graphics/Paint$Cap;

    .line 52
    iput v1, p0, Lcom/rey/material/widget/Switch;->mThumbRadius:I

    .line 55
    iput v1, p0, Lcom/rey/material/widget/Switch;->mMaxAnimDuration:I

    .line 57
    const/16 v0, 0x10

    iput v0, p0, Lcom/rey/material/widget/Switch;->mGravity:I

    .line 59
    iput-boolean v2, p0, Lcom/rey/material/widget/Switch;->mChecked:Z

    .line 69
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/rey/material/widget/Switch;->mTempStates:[I

    .line 71
    iput v1, p0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    .line 72
    iput v1, p0, Lcom/rey/material/widget/Switch;->mShadowOffset:I

    .line 79
    iput-boolean v2, p0, Lcom/rey/material/widget/Switch;->mIsRtl:Z

    .line 599
    new-instance v0, Lcom/rey/material/widget/Switch$1;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/Switch$1;-><init>(Lcom/rey/material/widget/Switch;)V

    iput-object v0, p0, Lcom/rey/material/widget/Switch;->mUpdater:Ljava/lang/Runnable;

    .line 110
    invoke-virtual {p0, p1, p2, p3, v2}, Lcom/rey/material/widget/Switch;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 111
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 115
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 40
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/Switch;->mCurrentStyle:I

    .line 42
    iput-boolean v2, p0, Lcom/rey/material/widget/Switch;->mRunning:Z

    .line 49
    iput v1, p0, Lcom/rey/material/widget/Switch;->mTrackSize:I

    .line 51
    sget-object v0, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    iput-object v0, p0, Lcom/rey/material/widget/Switch;->mTrackCap:Landroid/graphics/Paint$Cap;

    .line 52
    iput v1, p0, Lcom/rey/material/widget/Switch;->mThumbRadius:I

    .line 55
    iput v1, p0, Lcom/rey/material/widget/Switch;->mMaxAnimDuration:I

    .line 57
    const/16 v0, 0x10

    iput v0, p0, Lcom/rey/material/widget/Switch;->mGravity:I

    .line 59
    iput-boolean v2, p0, Lcom/rey/material/widget/Switch;->mChecked:Z

    .line 69
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/rey/material/widget/Switch;->mTempStates:[I

    .line 71
    iput v1, p0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    .line 72
    iput v1, p0, Lcom/rey/material/widget/Switch;->mShadowOffset:I

    .line 79
    iput-boolean v2, p0, Lcom/rey/material/widget/Switch;->mIsRtl:Z

    .line 599
    new-instance v0, Lcom/rey/material/widget/Switch$1;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/Switch$1;-><init>(Lcom/rey/material/widget/Switch;)V

    iput-object v0, p0, Lcom/rey/material/widget/Switch;->mUpdater:Ljava/lang/Runnable;

    .line 117
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/Switch;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 118
    return-void
.end method

.method static synthetic access$000(Lcom/rey/material/widget/Switch;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/widget/Switch;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/rey/material/widget/Switch;->update()V

    return-void
.end method

.method private buildShadow()V
    .registers 11

    .prologue
    const/4 v5, 0x3

    const/4 v6, 0x1

    const/4 v1, 0x0

    .line 468
    iget v0, p0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    if-gtz v0, :cond_8

    .line 494
    :goto_7
    return-void

    .line 471
    :cond_8
    iget-object v0, p0, Lcom/rey/material/widget/Switch;->mShadowPaint:Landroid/graphics/Paint;

    if-nez v0, :cond_20

    .line 472
    new-instance v0, Landroid/graphics/Paint;

    const/4 v2, 0x5

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/rey/material/widget/Switch;->mShadowPaint:Landroid/graphics/Paint;

    .line 473
    iget-object v0, p0, Lcom/rey/material/widget/Switch;->mShadowPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 474
    iget-object v0, p0, Lcom/rey/material/widget/Switch;->mShadowPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v6}, Landroid/graphics/Paint;->setDither(Z)V

    .line 476
    :cond_20
    iget v0, p0, Lcom/rey/material/widget/Switch;->mThumbRadius:I

    int-to-float v0, v0

    iget v2, p0, Lcom/rey/material/widget/Switch;->mThumbRadius:I

    iget v3, p0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    add-int/2addr v2, v3

    iget v3, p0, Lcom/rey/material/widget/Switch;->mShadowOffset:I

    add-int/2addr v2, v3

    int-to-float v2, v2

    div-float v8, v0, v2

    .line 477
    .local v8, "startRatio":F
    iget-object v9, p0, Lcom/rey/material/widget/Switch;->mShadowPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/RadialGradient;

    iget v2, p0, Lcom/rey/material/widget/Switch;->mThumbRadius:I

    iget v3, p0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    add-int/2addr v2, v3

    int-to-float v3, v2

    new-array v4, v5, [I

    fill-array-data v4, :array_a0

    new-array v5, v5, [F

    const/4 v2, 0x0

    aput v1, v5, v2

    aput v8, v5, v6

    const/4 v2, 0x2

    const/high16 v6, 0x3f800000    # 1.0f

    aput v6, v5, v2

    sget-object v6, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move v2, v1

    invoke-direct/range {v0 .. v6}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v9, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 482
    iget-object v0, p0, Lcom/rey/material/widget/Switch;->mShadowPath:Landroid/graphics/Path;

    if-nez v0, :cond_9a

    .line 483
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/Switch;->mShadowPath:Landroid/graphics/Path;

    .line 484
    iget-object v0, p0, Lcom/rey/material/widget/Switch;->mShadowPath:Landroid/graphics/Path;

    sget-object v1, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    invoke-virtual {v0, v1}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 488
    :goto_64
    iget v0, p0, Lcom/rey/material/widget/Switch;->mThumbRadius:I

    iget v1, p0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    add-int/2addr v0, v1

    int-to-float v7, v0

    .line 489
    .local v7, "radius":F
    iget-object v0, p0, Lcom/rey/material/widget/Switch;->mTempRect:Landroid/graphics/RectF;

    neg-float v1, v7

    neg-float v2, v7

    invoke-virtual {v0, v1, v2, v7, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 490
    iget-object v0, p0, Lcom/rey/material/widget/Switch;->mShadowPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/rey/material/widget/Switch;->mTempRect:Landroid/graphics/RectF;

    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->addOval(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 491
    iget v0, p0, Lcom/rey/material/widget/Switch;->mThumbRadius:I

    add-int/lit8 v0, v0, -0x1

    int-to-float v7, v0

    .line 492
    iget-object v0, p0, Lcom/rey/material/widget/Switch;->mTempRect:Landroid/graphics/RectF;

    neg-float v1, v7

    neg-float v2, v7

    iget v3, p0, Lcom/rey/material/widget/Switch;->mShadowOffset:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    iget v3, p0, Lcom/rey/material/widget/Switch;->mShadowOffset:I

    int-to-float v3, v3

    sub-float v3, v7, v3

    invoke-virtual {v0, v1, v2, v7, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 493
    iget-object v0, p0, Lcom/rey/material/widget/Switch;->mShadowPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/rey/material/widget/Switch;->mTempRect:Landroid/graphics/RectF;

    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->addOval(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    goto/16 :goto_7

    .line 487
    .end local v7    # "radius":F
    :cond_9a
    iget-object v0, p0, Lcom/rey/material/widget/Switch;->mShadowPath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    goto :goto_64

    .line 477
    :array_a0
    .array-data 4
        0x4c000000    # 3.3554432E7f
        0x4c000000    # 3.3554432E7f
        0x0
    .end array-data
.end method

.method private getThumbColor(Z)I
    .registers 6
    .param p1, "checked"    # Z

    .prologue
    const/4 v3, 0x0

    .line 461
    iget-object v1, p0, Lcom/rey/material/widget/Switch;->mTempStates:[I

    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_21

    const v0, 0x101009e

    :goto_c
    aput v0, v1, v3

    .line 462
    iget-object v1, p0, Lcom/rey/material/widget/Switch;->mTempStates:[I

    const/4 v2, 0x1

    if-eqz p1, :cond_25

    const v0, 0x10100a0

    :goto_16
    aput v0, v1, v2

    .line 464
    iget-object v0, p0, Lcom/rey/material/widget/Switch;->mThumbColors:Landroid/content/res/ColorStateList;

    iget-object v1, p0, Lcom/rey/material/widget/Switch;->mTempStates:[I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    return v0

    .line 461
    :cond_21
    const v0, -0x101009e

    goto :goto_c

    .line 462
    :cond_25
    const v0, -0x10100a0

    goto :goto_16
.end method

.method private getTrackColor(Z)I
    .registers 6
    .param p1, "checked"    # Z

    .prologue
    const/4 v3, 0x0

    .line 454
    iget-object v1, p0, Lcom/rey/material/widget/Switch;->mTempStates:[I

    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_21

    const v0, 0x101009e

    :goto_c
    aput v0, v1, v3

    .line 455
    iget-object v1, p0, Lcom/rey/material/widget/Switch;->mTempStates:[I

    const/4 v2, 0x1

    if-eqz p1, :cond_25

    const v0, 0x10100a0

    :goto_16
    aput v0, v1, v2

    .line 457
    iget-object v0, p0, Lcom/rey/material/widget/Switch;->mTrackColors:Landroid/content/res/ColorStateList;

    iget-object v1, p0, Lcom/rey/material/widget/Switch;->mTempStates:[I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    return v0

    .line 454
    :cond_21
    const v0, -0x101009e

    goto :goto_c

    .line 455
    :cond_25
    const v0, -0x10100a0

    goto :goto_16
.end method

.method private getTrackPath(FFF)V
    .registers 15
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "radius"    # F

    .prologue
    .line 497
    iget v3, p0, Lcom/rey/material/widget/Switch;->mTrackSize:I

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float v2, v3, v4

    .line 499
    .local v2, "halfStroke":F
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTrackPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    .line 501
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTrackCap:Landroid/graphics/Paint$Cap;

    sget-object v4, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    if-eq v3, v4, :cond_a7

    .line 502
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTempRect:Landroid/graphics/RectF;

    sub-float v4, p1, p3

    const/high16 v5, 0x3f800000    # 1.0f

    add-float/2addr v4, v5

    sub-float v5, p2, p3

    const/high16 v6, 0x3f800000    # 1.0f

    add-float/2addr v5, v6

    add-float v6, p1, p3

    const/high16 v7, 0x3f800000    # 1.0f

    sub-float/2addr v6, v7

    add-float v7, p2, p3

    const/high16 v8, 0x3f800000    # 1.0f

    sub-float/2addr v7, v8

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 503
    const/high16 v3, 0x3f800000    # 1.0f

    sub-float v3, p3, v3

    div-float v3, v2, v3

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->asin(D)D

    move-result-wide v3

    const-wide v5, 0x400921fb54442d18L    # Math.PI

    div-double/2addr v3, v5

    const-wide v5, 0x4066800000000000L    # 180.0

    mul-double/2addr v3, v5

    double-to-float v0, v3

    .line 505
    .local v0, "angle":F
    sub-float v3, p1, p3

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_76

    .line 506
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    sub-float v5, p2, v2

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 507
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mTempRect:Landroid/graphics/RectF;

    const/high16 v5, 0x43340000    # 180.0f

    add-float/2addr v5, v0

    neg-float v6, v0

    const/high16 v7, 0x40000000    # 2.0f

    mul-float/2addr v6, v7

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 508
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    add-float v5, p2, v2

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 509
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTrackPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    .line 512
    :cond_76
    add-float v3, p1, p3

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_a6

    .line 513
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    sub-float v5, p2, v2

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 514
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mTempRect:Landroid/graphics/RectF;

    neg-float v5, v0

    const/high16 v6, 0x40000000    # 2.0f

    mul-float/2addr v6, v0

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 515
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    add-float v5, p2, v2

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 516
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTrackPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    .line 546
    :cond_a6
    :goto_a6
    return-void

    .line 520
    .end local v0    # "angle":F
    :cond_a7
    const/high16 v3, 0x3f800000    # 1.0f

    sub-float v3, p3, v3

    div-float v3, v2, v3

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->asin(D)D

    move-result-wide v3

    const-wide v5, 0x400921fb54442d18L    # Math.PI

    div-double/2addr v3, v5

    const-wide v5, 0x4066800000000000L    # 180.0

    mul-double/2addr v3, v5

    double-to-float v0, v3

    .line 522
    .restart local v0    # "angle":F
    sub-float v3, p1, p3

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_136

    .line 523
    const/4 v3, 0x0

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    add-float/2addr v4, v2

    sub-float/2addr v4, p1

    add-float/2addr v4, p3

    div-float/2addr v4, v2

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->acos(D)D

    move-result-wide v3

    const-wide v5, 0x400921fb54442d18L    # Math.PI

    div-double/2addr v3, v5

    const-wide v5, 0x4066800000000000L    # 180.0

    mul-double/2addr v3, v5

    double-to-float v1, v3

    .line 525
    .local v1, "angle2":F
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTempRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    sub-float v5, p2, v2

    iget-object v6, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    iget v7, p0, Lcom/rey/material/widget/Switch;->mTrackSize:I

    int-to-float v7, v7

    add-float/2addr v6, v7

    add-float v7, p2, v2

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 526
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mTempRect:Landroid/graphics/RectF;

    const/high16 v5, 0x43340000    # 180.0f

    sub-float/2addr v5, v1

    const/high16 v6, 0x40000000    # 2.0f

    mul-float/2addr v6, v1

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 528
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTempRect:Landroid/graphics/RectF;

    sub-float v4, p1, p3

    const/high16 v5, 0x3f800000    # 1.0f

    add-float/2addr v4, v5

    sub-float v5, p2, p3

    const/high16 v6, 0x3f800000    # 1.0f

    add-float/2addr v5, v6

    add-float v6, p1, p3

    const/high16 v7, 0x3f800000    # 1.0f

    sub-float/2addr v6, v7

    add-float v7, p2, p3

    const/high16 v8, 0x3f800000    # 1.0f

    sub-float/2addr v7, v8

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 529
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mTempRect:Landroid/graphics/RectF;

    const/high16 v5, 0x43340000    # 180.0f

    add-float/2addr v5, v0

    neg-float v6, v0

    const/high16 v7, 0x40000000    # 2.0f

    mul-float/2addr v6, v7

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 530
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTrackPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    .line 533
    .end local v1    # "angle2":F
    :cond_136
    add-float v3, p1, p3

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_a6

    .line 534
    const/4 v3, 0x0

    add-float v4, p1, p3

    iget-object v5, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    sub-float/2addr v4, v5

    add-float/2addr v4, v2

    div-float/2addr v4, v2

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->acos(D)D

    move-result-wide v3

    double-to-float v1, v3

    .line 535
    .restart local v1    # "angle2":F
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    sub-float/2addr v4, v2

    float-to-double v4, v4

    float-to-double v6, v1

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    float-to-double v8, v2

    mul-double/2addr v6, v8

    add-double/2addr v4, v6

    double-to-float v4, v4

    float-to-double v5, p2

    float-to-double v7, v1

    invoke-static {v7, v8}, Ljava/lang/Math;->sin(D)D

    move-result-wide v7

    float-to-double v9, v2

    mul-double/2addr v7, v9

    add-double/2addr v5, v7

    double-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 537
    float-to-double v3, v1

    const-wide v5, 0x400921fb54442d18L    # Math.PI

    div-double/2addr v3, v5

    const-wide v5, 0x4066800000000000L    # 180.0

    mul-double/2addr v3, v5

    double-to-float v1, v3

    .line 538
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTempRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    iget v5, p0, Lcom/rey/material/widget/Switch;->mTrackSize:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    sub-float v5, p2, v2

    iget-object v6, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->right:F

    add-float v7, p2, v2

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 539
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mTempRect:Landroid/graphics/RectF;

    neg-float v5, v1

    const/high16 v6, 0x40000000    # 2.0f

    mul-float/2addr v5, v6

    invoke-virtual {v3, v4, v1, v5}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 541
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTempRect:Landroid/graphics/RectF;

    sub-float v4, p1, p3

    const/high16 v5, 0x3f800000    # 1.0f

    add-float/2addr v4, v5

    sub-float v5, p2, p3

    const/high16 v6, 0x3f800000    # 1.0f

    add-float/2addr v5, v6

    add-float v6, p1, p3

    const/high16 v7, 0x3f800000    # 1.0f

    sub-float/2addr v6, v7

    add-float v7, p2, p3

    const/high16 v8, 0x3f800000    # 1.0f

    sub-float/2addr v7, v8

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 542
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mTempRect:Landroid/graphics/RectF;

    neg-float v5, v0

    const/high16 v6, 0x40000000    # 2.0f

    mul-float/2addr v6, v0

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 543
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTrackPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    goto/16 :goto_a6
.end method

.method private resetAnimation()V
    .registers 4

    .prologue
    .line 575
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/rey/material/widget/Switch;->mStartTime:J

    .line 576
    iget v0, p0, Lcom/rey/material/widget/Switch;->mThumbPosition:F

    iput v0, p0, Lcom/rey/material/widget/Switch;->mStartPosition:F

    .line 577
    iget v0, p0, Lcom/rey/material/widget/Switch;->mMaxAnimDuration:I

    int-to-float v1, v0

    iget-boolean v0, p0, Lcom/rey/material/widget/Switch;->mChecked:Z

    if-eqz v0, :cond_1b

    const/high16 v0, 0x3f800000    # 1.0f

    iget v2, p0, Lcom/rey/material/widget/Switch;->mStartPosition:F

    sub-float/2addr v0, v2

    :goto_16
    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/rey/material/widget/Switch;->mAnimDuration:I

    .line 578
    return-void

    .line 577
    :cond_1b
    iget v0, p0, Lcom/rey/material/widget/Switch;->mStartPosition:F

    goto :goto_16
.end method

.method private startAnimation()V
    .registers 7

    .prologue
    .line 581
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getHandler()Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_20

    .line 582
    invoke-direct {p0}, Lcom/rey/material/widget/Switch;->resetAnimation()V

    .line 583
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/widget/Switch;->mRunning:Z

    .line 584
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getHandler()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/rey/material/widget/Switch;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x10

    add-long/2addr v2, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    .line 588
    :goto_1c
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->invalidate()V

    .line 589
    return-void

    .line 587
    :cond_20
    iget-boolean v0, p0, Lcom/rey/material/widget/Switch;->mChecked:Z

    if-eqz v0, :cond_29

    const/high16 v0, 0x3f800000    # 1.0f

    :goto_26
    iput v0, p0, Lcom/rey/material/widget/Switch;->mThumbPosition:F

    goto :goto_1c

    :cond_29
    const/4 v0, 0x0

    goto :goto_26
.end method

.method private stopAnimation()V
    .registers 3

    .prologue
    .line 592
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/widget/Switch;->mRunning:Z

    .line 593
    iget-boolean v0, p0, Lcom/rey/material/widget/Switch;->mChecked:Z

    if-eqz v0, :cond_1e

    const/high16 v0, 0x3f800000    # 1.0f

    :goto_9
    iput v0, p0, Lcom/rey/material/widget/Switch;->mThumbPosition:F

    .line 594
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getHandler()Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_1a

    .line 595
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getHandler()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/rey/material/widget/Switch;->mUpdater:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 596
    :cond_1a
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->invalidate()V

    .line 597
    return-void

    .line 593
    :cond_1e
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private update()V
    .registers 11

    .prologue
    const/high16 v6, 0x3f800000    # 1.0f

    .line 609
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 610
    .local v0, "curTime":J
    iget-wide v4, p0, Lcom/rey/material/widget/Switch;->mStartTime:J

    sub-long v4, v0, v4

    long-to-float v4, v4

    iget v5, p0, Lcom/rey/material/widget/Switch;->mAnimDuration:I

    int-to-float v5, v5

    div-float/2addr v4, v5

    invoke-static {v6, v4}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 611
    .local v2, "progress":F
    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v4, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v3

    .line 613
    .local v3, "value":F
    iget-boolean v4, p0, Lcom/rey/material/widget/Switch;->mChecked:Z

    if-eqz v4, :cond_4a

    iget v4, p0, Lcom/rey/material/widget/Switch;->mStartPosition:F

    sub-float v5, v6, v3

    mul-float/2addr v4, v5

    add-float/2addr v4, v3

    :goto_23
    iput v4, p0, Lcom/rey/material/widget/Switch;->mThumbPosition:F

    .line 615
    cmpl-float v4, v2, v6

    if-nez v4, :cond_2c

    .line 616
    invoke-direct {p0}, Lcom/rey/material/widget/Switch;->stopAnimation()V

    .line 618
    :cond_2c
    iget-boolean v4, p0, Lcom/rey/material/widget/Switch;->mRunning:Z

    if-eqz v4, :cond_46

    .line 619
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getHandler()Landroid/os/Handler;

    move-result-object v4

    if-eqz v4, :cond_50

    .line 620
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getHandler()Landroid/os/Handler;

    move-result-object v4

    iget-object v5, p0, Lcom/rey/material/widget/Switch;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    const-wide/16 v8, 0x10

    add-long/2addr v6, v8

    invoke-virtual {v4, v5, v6, v7}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    .line 625
    :cond_46
    :goto_46
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->invalidate()V

    .line 626
    return-void

    .line 613
    :cond_4a
    iget v4, p0, Lcom/rey/material/widget/Switch;->mStartPosition:F

    sub-float v5, v6, v3

    mul-float/2addr v4, v5

    goto :goto_23

    .line 622
    :cond_50
    invoke-direct {p0}, Lcom/rey/material/widget/Switch;->stopAnimation()V

    goto :goto_46
.end method


# virtual methods
.method public applyStyle(I)V
    .registers 5
    .param p1, "resId"    # I

    .prologue
    .line 136
    invoke-static {p0, p1}, Lcom/rey/material/util/ViewUtil;->applyStyle(Landroid/view/View;I)V

    .line 137
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/rey/material/widget/Switch;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 138
    return-void
.end method

.method protected applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 23
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 141
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Switch;->getRippleManager()Lcom/rey/material/widget/RippleManager;

    move-result-object v4

    move-object/from16 v5, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    move/from16 v8, p3

    move/from16 v9, p4

    invoke-virtual/range {v4 .. v9}, Lcom/rey/material/widget/RippleManager;->onCreate(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 143
    sget-object v4, Lcom/rey/material/R$styleable;->Switch:[I

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-virtual {v0, v1, v4, v2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v10

    .line 145
    .local v10, "a":Landroid/content/res/TypedArray;
    const/4 v15, 0x0

    .local v15, "i":I
    invoke-virtual {v10}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v14

    .local v14, "count":I
    :goto_24
    if-ge v15, v14, :cond_e8

    .line 146
    invoke-virtual {v10, v15}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v11

    .line 147
    .local v11, "attr":I
    sget v4, Lcom/rey/material/R$styleable;->Switch_sw_trackSize:I

    if-ne v11, v4, :cond_3a

    .line 148
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Switch;->mTrackSize:I

    .line 145
    :cond_37
    :goto_37
    add-int/lit8 v15, v15, 0x1

    goto :goto_24

    .line 149
    :cond_3a
    sget v4, Lcom/rey/material/R$styleable;->Switch_sw_trackColor:I

    if-ne v11, v4, :cond_47

    .line 150
    invoke-virtual {v10, v11}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/Switch;->mTrackColors:Landroid/content/res/ColorStateList;

    goto :goto_37

    .line 151
    :cond_47
    sget v4, Lcom/rey/material/R$styleable;->Switch_sw_trackCap:I

    if-ne v11, v4, :cond_6a

    .line 152
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v12

    .line 153
    .local v12, "cap":I
    if-nez v12, :cond_59

    .line 154
    sget-object v4, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/Switch;->mTrackCap:Landroid/graphics/Paint$Cap;

    goto :goto_37

    .line 155
    :cond_59
    const/4 v4, 0x1

    if-ne v12, v4, :cond_63

    .line 156
    sget-object v4, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/Switch;->mTrackCap:Landroid/graphics/Paint$Cap;

    goto :goto_37

    .line 158
    :cond_63
    sget-object v4, Landroid/graphics/Paint$Cap;->SQUARE:Landroid/graphics/Paint$Cap;

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/Switch;->mTrackCap:Landroid/graphics/Paint$Cap;

    goto :goto_37

    .line 160
    .end local v12    # "cap":I
    :cond_6a
    sget v4, Lcom/rey/material/R$styleable;->Switch_sw_thumbColor:I

    if-ne v11, v4, :cond_77

    .line 161
    invoke-virtual {v10, v11}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/Switch;->mThumbColors:Landroid/content/res/ColorStateList;

    goto :goto_37

    .line 162
    :cond_77
    sget v4, Lcom/rey/material/R$styleable;->Switch_sw_thumbRadius:I

    if-ne v11, v4, :cond_85

    .line 163
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Switch;->mThumbRadius:I

    goto :goto_37

    .line 164
    :cond_85
    sget v4, Lcom/rey/material/R$styleable;->Switch_sw_thumbElevation:I

    if-ne v11, v4, :cond_9d

    .line 165
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    .line 166
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    div-int/lit8 v4, v4, 0x2

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Switch;->mShadowOffset:I

    goto :goto_37

    .line 168
    :cond_9d
    sget v4, Lcom/rey/material/R$styleable;->Switch_sw_animDuration:I

    if-ne v11, v4, :cond_ab

    .line 169
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Switch;->mMaxAnimDuration:I

    goto :goto_37

    .line 170
    :cond_ab
    sget v4, Lcom/rey/material/R$styleable;->Switch_android_gravity:I

    if-ne v11, v4, :cond_ba

    .line 171
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Switch;->mGravity:I

    goto/16 :goto_37

    .line 172
    :cond_ba
    sget v4, Lcom/rey/material/R$styleable;->Switch_android_checked:I

    if-ne v11, v4, :cond_cd

    .line 173
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/rey/material/widget/Switch;->mChecked:Z

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/rey/material/widget/Switch;->setCheckedImmediately(Z)V

    goto/16 :goto_37

    .line 174
    :cond_cd
    sget v4, Lcom/rey/material/R$styleable;->Switch_sw_interpolator:I

    if-ne v11, v4, :cond_37

    .line 175
    sget v4, Lcom/rey/material/R$styleable;->Switch_sw_interpolator:I

    const/4 v5, 0x0

    invoke-virtual {v10, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v16

    .line 176
    .local v16, "resId":I
    if-eqz v16, :cond_37

    .line 177
    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/Switch;->mInterpolator:Landroid/view/animation/Interpolator;

    goto/16 :goto_37

    .line 181
    .end local v11    # "attr":I
    .end local v16    # "resId":I
    :cond_e8
    invoke-virtual {v10}, Landroid/content/res/TypedArray;->recycle()V

    .line 183
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/Switch;->mTrackSize:I

    if-gez v4, :cond_fc

    .line 184
    const/4 v4, 0x2

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Switch;->mTrackSize:I

    .line 186
    :cond_fc
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/Switch;->mThumbRadius:I

    if-gez v4, :cond_10e

    .line 187
    const/16 v4, 0x8

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Switch;->mThumbRadius:I

    .line 189
    :cond_10e
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    if-gez v4, :cond_129

    .line 190
    const/4 v4, 0x2

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    .line 191
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    div-int/lit8 v4, v4, 0x2

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Switch;->mShadowOffset:I

    .line 194
    :cond_129
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/Switch;->mMaxAnimDuration:I

    if-gez v4, :cond_13e

    .line 195
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x10e0001

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Switch;->mMaxAnimDuration:I

    .line 197
    :cond_13e
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Switch;->mInterpolator:Landroid/view/animation/Interpolator;

    if-nez v4, :cond_14d

    .line 198
    new-instance v4, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v4}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/Switch;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 200
    :cond_14d
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Switch;->mTrackColors:Landroid/content/res/ColorStateList;

    if-nez v4, :cond_1a0

    .line 201
    const/4 v4, 0x2

    new-array v0, v4, [[I

    move-object/from16 v17, v0

    const/4 v4, 0x0

    const/4 v5, 0x1

    new-array v5, v5, [I

    const/4 v6, 0x0

    const v7, -0x10100a0

    aput v7, v5, v6

    aput-object v5, v17, v4

    const/4 v4, 0x1

    const/4 v5, 0x1

    new-array v5, v5, [I

    const/4 v6, 0x0

    const v7, 0x10100a0

    aput v7, v5, v6

    aput-object v5, v17, v4

    .line 205
    .local v17, "states":[[I
    const/4 v4, 0x2

    new-array v13, v4, [I

    const/4 v4, 0x0

    const/high16 v5, -0x1000000

    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/rey/material/util/ThemeUtil;->colorControlNormal(Landroid/content/Context;I)I

    move-result v5

    const/high16 v6, 0x3f000000    # 0.5f

    invoke-static {v5, v6}, Lcom/rey/material/util/ColorUtil;->getColor(IF)I

    move-result v5

    aput v5, v13, v4

    const/4 v4, 0x1

    const/high16 v5, -0x1000000

    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/rey/material/util/ThemeUtil;->colorControlActivated(Landroid/content/Context;I)I

    move-result v5

    const/high16 v6, 0x3f000000    # 0.5f

    invoke-static {v5, v6}, Lcom/rey/material/util/ColorUtil;->getColor(IF)I

    move-result v5

    aput v5, v13, v4

    .line 210
    .local v13, "colors":[I
    new-instance v4, Landroid/content/res/ColorStateList;

    move-object/from16 v0, v17

    invoke-direct {v4, v0, v13}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/Switch;->mTrackColors:Landroid/content/res/ColorStateList;

    .line 213
    .end local v13    # "colors":[I
    .end local v17    # "states":[[I
    :cond_1a0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Switch;->mThumbColors:Landroid/content/res/ColorStateList;

    if-nez v4, :cond_1e2

    .line 214
    const/4 v4, 0x2

    new-array v0, v4, [[I

    move-object/from16 v17, v0

    const/4 v4, 0x0

    const/4 v5, 0x1

    new-array v5, v5, [I

    const/4 v6, 0x0

    const v7, -0x10100a0

    aput v7, v5, v6

    aput-object v5, v17, v4

    const/4 v4, 0x1

    const/4 v5, 0x1

    new-array v5, v5, [I

    const/4 v6, 0x0

    const v7, 0x10100a0

    aput v7, v5, v6

    aput-object v5, v17, v4

    .line 218
    .restart local v17    # "states":[[I
    const/4 v4, 0x2

    new-array v13, v4, [I

    const/4 v4, 0x0

    const v5, 0xfafafa

    aput v5, v13, v4

    const/4 v4, 0x1

    const/high16 v5, -0x1000000

    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/rey/material/util/ThemeUtil;->colorControlActivated(Landroid/content/Context;I)I

    move-result v5

    aput v5, v13, v4

    .line 223
    .restart local v13    # "colors":[I
    new-instance v4, Landroid/content/res/ColorStateList;

    move-object/from16 v0, v17

    invoke-direct {v4, v0, v13}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/Switch;->mThumbColors:Landroid/content/res/ColorStateList;

    .line 226
    .end local v13    # "colors":[I
    .end local v17    # "states":[[I
    :cond_1e2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Switch;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/rey/material/widget/Switch;->mTrackCap:Landroid/graphics/Paint$Cap;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 227
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/Switch;->buildShadow()V

    .line 228
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Switch;->invalidate()V

    .line 229
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 550
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 552
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget v4, p0, Lcom/rey/material/widget/Switch;->mThumbRadius:I

    mul-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    sub-float/2addr v3, v4

    iget v4, p0, Lcom/rey/material/widget/Switch;->mThumbPosition:F

    mul-float/2addr v3, v4

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    add-float/2addr v3, v4

    iget v4, p0, Lcom/rey/material/widget/Switch;->mThumbRadius:I

    int-to-float v4, v4

    add-float v1, v3, v4

    .line 553
    .local v1, "x":F
    iget-boolean v3, p0, Lcom/rey/material/widget/Switch;->mIsRtl:Z

    if-eqz v3, :cond_2d

    .line 554
    const/high16 v3, 0x40000000    # 2.0f

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    mul-float/2addr v3, v4

    sub-float v1, v3, v1

    .line 555
    :cond_2d
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    .line 557
    .local v2, "y":F
    iget v3, p0, Lcom/rey/material/widget/Switch;->mThumbRadius:I

    int-to-float v3, v3

    invoke-direct {p0, v1, v2, v3}, Lcom/rey/material/widget/Switch;->getTrackPath(FFF)V

    .line 558
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mPaint:Landroid/graphics/Paint;

    invoke-direct {p0, v7}, Lcom/rey/material/widget/Switch;->getTrackColor(Z)I

    move-result v4

    invoke-direct {p0, v8}, Lcom/rey/material/widget/Switch;->getTrackColor(Z)I

    move-result v5

    iget v6, p0, Lcom/rey/material/widget/Switch;->mThumbPosition:F

    invoke-static {v4, v5, v6}, Lcom/rey/material/util/ColorUtil;->getMiddleColor(IIF)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 559
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 560
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 562
    iget v3, p0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    if-lez v3, :cond_73

    .line 563
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 564
    .local v0, "saveCount":I
    iget v3, p0, Lcom/rey/material/widget/Switch;->mShadowOffset:I

    int-to-float v3, v3

    add-float/2addr v3, v2

    invoke-virtual {p1, v1, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 565
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mShadowPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mShadowPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 566
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 569
    .end local v0    # "saveCount":I
    :cond_73
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mPaint:Landroid/graphics/Paint;

    invoke-direct {p0, v7}, Lcom/rey/material/widget/Switch;->getThumbColor(Z)I

    move-result v4

    invoke-direct {p0, v8}, Lcom/rey/material/widget/Switch;->getThumbColor(Z)I

    move-result v5

    iget v6, p0, Lcom/rey/material/widget/Switch;->mThumbPosition:F

    invoke-static {v4, v5, v6}, Lcom/rey/material/util/ColorUtil;->getMiddleColor(IIF)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 570
    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 571
    iget v3, p0, Lcom/rey/material/widget/Switch;->mThumbRadius:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/rey/material/widget/Switch;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 572
    return-void
.end method

.method protected getRippleManager()Lcom/rey/material/widget/RippleManager;
    .registers 3

    .prologue
    .line 267
    iget-object v0, p0, Lcom/rey/material/widget/Switch;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    if-nez v0, :cond_13

    .line 268
    const-class v1, Lcom/rey/material/widget/RippleManager;

    monitor-enter v1

    .line 269
    :try_start_7
    iget-object v0, p0, Lcom/rey/material/widget/Switch;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    if-nez v0, :cond_12

    .line 270
    new-instance v0, Lcom/rey/material/widget/RippleManager;

    invoke-direct {v0}, Lcom/rey/material/widget/RippleManager;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/Switch;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    .line 271
    :cond_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_16

    .line 274
    :cond_13
    iget-object v0, p0, Lcom/rey/material/widget/Switch;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    return-object v0

    .line 271
    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v0
.end method

.method public getSuggestedMinimumHeight()I
    .registers 4

    .prologue
    .line 426
    iget v0, p0, Lcom/rey/material/widget/Switch;->mThumbRadius:I

    mul-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    iget v2, p0, Lcom/rey/material/widget/Switch;->mShadowOffset:I

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getPaddingTop()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    iget v2, p0, Lcom/rey/material/widget/Switch;->mShadowOffset:I

    add-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getPaddingBottom()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getSuggestedMinimumWidth()I
    .registers 4

    .prologue
    .line 421
    iget v0, p0, Lcom/rey/material/widget/Switch;->mThumbRadius:I

    mul-int/lit8 v0, v0, 0x4

    iget v1, p0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getPaddingLeft()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getPaddingRight()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 121
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/rey/material/widget/Switch;->mPaint:Landroid/graphics/Paint;

    .line 123
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    .line 124
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/Switch;->mTempRect:Landroid/graphics/RectF;

    .line 125
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/Switch;->mTrackPath:Landroid/graphics/Path;

    .line 127
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/rey/material/widget/Switch;->mFlingVelocity:F

    .line 129
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/Switch;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 131
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_37

    .line 132
    invoke-static {p1, p2, p3, p4}, Lcom/rey/material/app/ThemeManager;->getStyleId(Landroid/content/Context;Landroid/util/AttributeSet;II)I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/Switch;->mStyleId:I

    .line 133
    :cond_37
    return-void
.end method

.method public isChecked()Z
    .registers 2

    .prologue
    .line 326
    iget-boolean v0, p0, Lcom/rey/material/widget/Switch;->mChecked:Z

    return v0
.end method

.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 242
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 243
    iget v0, p0, Lcom/rey/material/widget/Switch;->mStyleId:I

    if-eqz v0, :cond_12

    .line 244
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->registerOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 245
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/Switch;->onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V

    .line 247
    :cond_12
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 251
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 252
    invoke-static {p0}, Lcom/rey/material/widget/RippleManager;->cancelRipple(Landroid/view/View;)V

    .line 253
    iget v0, p0, Lcom/rey/material/widget/Switch;->mStyleId:I

    if-eqz v0, :cond_11

    .line 254
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->unregisterOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 255
    :cond_11
    return-void
.end method

.method protected onMeasure(II)V
    .registers 8
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 392
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    .line 393
    .local v3, "widthSize":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    .line 395
    .local v2, "widthMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 396
    .local v1, "heightSize":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 398
    .local v0, "heightMode":I
    sparse-switch v2, :sswitch_data_36

    .line 407
    :goto_13
    sparse-switch v0, :sswitch_data_40

    .line 416
    :goto_16
    invoke-virtual {p0, v3, v1}, Lcom/rey/material/widget/Switch;->setMeasuredDimension(II)V

    .line 417
    return-void

    .line 400
    :sswitch_1a
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getSuggestedMinimumWidth()I

    move-result v3

    .line 401
    goto :goto_13

    .line 403
    :sswitch_1f
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getSuggestedMinimumWidth()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    goto :goto_13

    .line 409
    :sswitch_28
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getSuggestedMinimumHeight()I

    move-result v1

    .line 410
    goto :goto_16

    .line 412
    :sswitch_2d
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getSuggestedMinimumHeight()I

    move-result v4

    invoke-static {v1, v4}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_16

    .line 398
    :sswitch_data_36
    .sparse-switch
        -0x80000000 -> :sswitch_1f
        0x0 -> :sswitch_1a
    .end sparse-switch

    .line 407
    :sswitch_data_40
    .sparse-switch
        -0x80000000 -> :sswitch_2d
        0x0 -> :sswitch_28
    .end sparse-switch
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 4
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 640
    move-object v0, p1

    check-cast v0, Lcom/rey/material/widget/Switch$SavedState;

    .line 642
    .local v0, "ss":Lcom/rey/material/widget/Switch$SavedState;
    invoke-virtual {v0}, Lcom/rey/material/widget/Switch$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 643
    iget-boolean v1, v0, Lcom/rey/material/widget/Switch$SavedState;->checked:Z

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/Switch;->setChecked(Z)V

    .line 644
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->requestLayout()V

    .line 645
    return-void
.end method

.method public onRtlPropertiesChanged(I)V
    .registers 4
    .param p1, "layoutDirection"    # I

    .prologue
    const/4 v0, 0x1

    .line 337
    if-ne p1, v0, :cond_d

    .line 338
    .local v0, "rtl":Z
    :goto_3
    iget-boolean v1, p0, Lcom/rey/material/widget/Switch;->mIsRtl:Z

    if-eq v1, v0, :cond_c

    .line 339
    iput-boolean v0, p0, Lcom/rey/material/widget/Switch;->mIsRtl:Z

    .line 340
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->invalidate()V

    .line 342
    :cond_c
    return-void

    .line 337
    .end local v0    # "rtl":Z
    :cond_d
    const/4 v0, 0x0

    goto :goto_3
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 630
    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 632
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Lcom/rey/material/widget/Switch$SavedState;

    invoke-direct {v0, v1}, Lcom/rey/material/widget/Switch$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 634
    .local v0, "ss":Lcom/rey/material/widget/Switch$SavedState;
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->isChecked()Z

    move-result v2

    iput-boolean v2, v0, Lcom/rey/material/widget/Switch$SavedState;->checked:Z

    .line 635
    return-object v0
.end method

.method protected onSizeChanged(IIII)V
    .registers 10
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 431
    iget-object v2, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v3, p0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getPaddingLeft()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    int-to-float v3, v3

    iput v3, v2, Landroid/graphics/RectF;->left:F

    .line 432
    iget-object v2, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v3, p0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getPaddingRight()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    sub-int v3, p1, v3

    int-to-float v3, v3

    iput v3, v2, Landroid/graphics/RectF;->right:F

    .line 434
    iget v2, p0, Lcom/rey/material/widget/Switch;->mThumbRadius:I

    mul-int/lit8 v1, v2, 0x2

    .line 435
    .local v1, "height":I
    iget v2, p0, Lcom/rey/material/widget/Switch;->mGravity:I

    and-int/lit8 v0, v2, 0x70

    .line 437
    .local v0, "align":I
    sparse-switch v0, :sswitch_data_7c

    .line 447
    iget-object v2, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    sub-int v3, p2, v1

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    iput v3, v2, Landroid/graphics/RectF;->top:F

    .line 448
    iget-object v2, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    int-to-float v4, v1

    add-float/2addr v3, v4

    iput v3, v2, Landroid/graphics/RectF;->bottom:F

    .line 451
    :goto_3f
    return-void

    .line 439
    :sswitch_40
    iget-object v2, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v3, p0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    iget v4, p0, Lcom/rey/material/widget/Switch;->mShadowOffset:I

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getPaddingTop()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    int-to-float v3, v3

    iput v3, v2, Landroid/graphics/RectF;->top:F

    .line 440
    iget-object v2, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    int-to-float v4, v1

    add-float/2addr v3, v4

    iput v3, v2, Landroid/graphics/RectF;->bottom:F

    goto :goto_3f

    .line 443
    :sswitch_5d
    iget-object v2, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v3, p0, Lcom/rey/material/widget/Switch;->mShadowSize:I

    iget v4, p0, Lcom/rey/material/widget/Switch;->mShadowOffset:I

    add-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getPaddingBottom()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    sub-int v3, p2, v3

    int-to-float v3, v3

    iput v3, v2, Landroid/graphics/RectF;->bottom:F

    .line 444
    iget-object v2, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    int-to-float v4, v1

    sub-float/2addr v3, v4

    iput v3, v2, Landroid/graphics/RectF;->top:F

    goto :goto_3f

    .line 437
    :sswitch_data_7c
    .sparse-switch
        0x30 -> :sswitch_40
        0x50 -> :sswitch_5d
    .end sparse-switch
.end method

.method public onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V
    .registers 5
    .param p1, "event"    # Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;

    .prologue
    .line 233
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/widget/Switch;->mStyleId:I

    invoke-virtual {v1, v2}, Lcom/rey/material/app/ThemeManager;->getCurrentStyle(I)I

    move-result v0

    .line 234
    .local v0, "style":I
    iget v1, p0, Lcom/rey/material/widget/Switch;->mCurrentStyle:I

    if-eq v1, v0, :cond_15

    .line 235
    iput v0, p0, Lcom/rey/material/widget/Switch;->mCurrentStyle:I

    .line 236
    iget v1, p0, Lcom/rey/material/widget/Switch;->mCurrentStyle:I

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/Switch;->applyStyle(I)V

    .line 238
    :cond_15
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 14
    .param p1, "event"    # Landroid/view/MotionEvent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/high16 v11, 0x3f000000    # 0.5f

    const/4 v10, 0x0

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 346
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 347
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getRippleManager()Lcom/rey/material/widget/RippleManager;

    move-result-object v5

    invoke-virtual {v5, p0, p1}, Lcom/rey/material/widget/RippleManager;->onTouchEvent(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 349
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    .line 350
    .local v2, "x":F
    iget-boolean v5, p0, Lcom/rey/material/widget/Switch;->mIsRtl:Z

    if-eqz v5, :cond_22

    .line 351
    const/high16 v5, 0x40000000    # 2.0f

    iget-object v6, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->centerX()F

    move-result v6

    mul-float/2addr v5, v6

    sub-float v2, v5, v2

    .line 353
    :cond_22
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    packed-switch v5, :pswitch_data_e0

    .line 387
    :goto_29
    return v4

    .line 355
    :pswitch_2a
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    if-eqz v3, :cond_37

    .line 356
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    invoke-interface {v3, v4}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 357
    :cond_37
    iput v2, p0, Lcom/rey/material/widget/Switch;->mMemoX:F

    .line 358
    iget v3, p0, Lcom/rey/material/widget/Switch;->mMemoX:F

    iput v3, p0, Lcom/rey/material/widget/Switch;->mStartX:F

    .line 359
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    iput-wide v5, p0, Lcom/rey/material/widget/Switch;->mStartTime:J

    goto :goto_29

    .line 362
    :pswitch_44
    iget v3, p0, Lcom/rey/material/widget/Switch;->mMemoX:F

    sub-float v3, v2, v3

    iget-object v5, p0, Lcom/rey/material/widget/Switch;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    move-result v5

    iget v6, p0, Lcom/rey/material/widget/Switch;->mThumbRadius:I

    mul-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    sub-float/2addr v5, v6

    div-float v0, v3, v5

    .line 363
    .local v0, "offset":F
    const/high16 v3, 0x3f800000    # 1.0f

    iget v5, p0, Lcom/rey/material/widget/Switch;->mThumbPosition:F

    add-float/2addr v5, v0

    invoke-static {v10, v5}, Ljava/lang/Math;->max(FF)F

    move-result v5

    invoke-static {v3, v5}, Ljava/lang/Math;->min(FF)F

    move-result v3

    iput v3, p0, Lcom/rey/material/widget/Switch;->mThumbPosition:F

    .line 364
    iput v2, p0, Lcom/rey/material/widget/Switch;->mMemoX:F

    .line 365
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->invalidate()V

    goto :goto_29

    .line 368
    .end local v0    # "offset":F
    :pswitch_6b
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    if-eqz v5, :cond_78

    .line 369
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    invoke-interface {v5, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 371
    :cond_78
    iget v5, p0, Lcom/rey/material/widget/Switch;->mStartX:F

    sub-float v5, v2, v5

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/rey/material/widget/Switch;->mStartTime:J

    sub-long/2addr v6, v8

    long-to-float v6, v6

    div-float/2addr v5, v6

    const/high16 v6, 0x447a0000    # 1000.0f

    mul-float v1, v5, v6

    .line 372
    .local v1, "velocity":F
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iget v6, p0, Lcom/rey/material/widget/Switch;->mFlingVelocity:F

    cmpl-float v5, v5, v6

    if-ltz v5, :cond_9c

    .line 373
    cmpl-float v5, v1, v10

    if-lez v5, :cond_98

    move v3, v4

    :cond_98
    invoke-virtual {p0, v3}, Lcom/rey/material/widget/Switch;->setChecked(Z)V

    goto :goto_29

    .line 374
    :cond_9c
    iget-boolean v5, p0, Lcom/rey/material/widget/Switch;->mChecked:Z

    if-nez v5, :cond_a9

    iget v5, p0, Lcom/rey/material/widget/Switch;->mThumbPosition:F

    const v6, 0x3dcccccd    # 0.1f

    cmpg-float v5, v5, v6

    if-ltz v5, :cond_b6

    :cond_a9
    iget-boolean v5, p0, Lcom/rey/material/widget/Switch;->mChecked:Z

    if-eqz v5, :cond_bb

    iget v5, p0, Lcom/rey/material/widget/Switch;->mThumbPosition:F

    const v6, 0x3f666666    # 0.9f

    cmpl-float v5, v5, v6

    if-lez v5, :cond_bb

    .line 375
    :cond_b6
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->toggle()V

    goto/16 :goto_29

    .line 377
    :cond_bb
    iget v5, p0, Lcom/rey/material/widget/Switch;->mThumbPosition:F

    cmpl-float v5, v5, v11

    if-lez v5, :cond_c2

    move v3, v4

    :cond_c2
    invoke-virtual {p0, v3}, Lcom/rey/material/widget/Switch;->setChecked(Z)V

    goto/16 :goto_29

    .line 380
    .end local v1    # "velocity":F
    :pswitch_c7
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    if-eqz v5, :cond_d4

    .line 381
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    invoke-interface {v5, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 383
    :cond_d4
    iget v5, p0, Lcom/rey/material/widget/Switch;->mThumbPosition:F

    cmpl-float v5, v5, v11

    if-lez v5, :cond_db

    move v3, v4

    :cond_db
    invoke-virtual {p0, v3}, Lcom/rey/material/widget/Switch;->setChecked(Z)V

    goto/16 :goto_29

    .line 353
    :pswitch_data_e0
    .packed-switch 0x0
        :pswitch_2a
        :pswitch_6b
        :pswitch_44
        :pswitch_c7
    .end packed-switch
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 259
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 260
    .local v0, "background":Landroid/graphics/drawable/Drawable;
    instance-of v1, v0, Lcom/rey/material/drawable/RippleDrawable;

    if-eqz v1, :cond_12

    instance-of v1, p1, Lcom/rey/material/drawable/RippleDrawable;

    if-nez v1, :cond_12

    .line 261
    check-cast v0, Lcom/rey/material/drawable/RippleDrawable;

    .end local v0    # "background":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/RippleDrawable;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 264
    :goto_11
    return-void

    .line 263
    .restart local v0    # "background":Landroid/graphics/drawable/Drawable;
    :cond_12
    invoke-super {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_11
.end method

.method public setChecked(Z)V
    .registers 5
    .param p1, "checked"    # Z

    .prologue
    .line 298
    iget-boolean v1, p0, Lcom/rey/material/widget/Switch;->mChecked:Z

    if-eq v1, p1, :cond_11

    .line 299
    iput-boolean p1, p0, Lcom/rey/material/widget/Switch;->mChecked:Z

    .line 300
    iget-object v1, p0, Lcom/rey/material/widget/Switch;->mOnCheckedChangeListener:Lcom/rey/material/widget/Switch$OnCheckedChangeListener;

    if-eqz v1, :cond_11

    .line 301
    iget-object v1, p0, Lcom/rey/material/widget/Switch;->mOnCheckedChangeListener:Lcom/rey/material/widget/Switch$OnCheckedChangeListener;

    iget-boolean v2, p0, Lcom/rey/material/widget/Switch;->mChecked:Z

    invoke-interface {v1, p0, v2}, Lcom/rey/material/widget/Switch$OnCheckedChangeListener;->onCheckedChanged(Lcom/rey/material/widget/Switch;Z)V

    .line 304
    :cond_11
    iget-boolean v1, p0, Lcom/rey/material/widget/Switch;->mChecked:Z

    if-eqz v1, :cond_21

    const/high16 v0, 0x3f800000    # 1.0f

    .line 306
    .local v0, "desPos":F
    :goto_17
    iget v1, p0, Lcom/rey/material/widget/Switch;->mThumbPosition:F

    cmpl-float v1, v1, v0

    if-eqz v1, :cond_20

    .line 307
    invoke-direct {p0}, Lcom/rey/material/widget/Switch;->startAnimation()V

    .line 308
    :cond_20
    return-void

    .line 304
    .end local v0    # "desPos":F
    :cond_21
    const/4 v0, 0x0

    goto :goto_17
.end method

.method public setCheckedImmediately(Z)V
    .registers 4
    .param p1, "checked"    # Z

    .prologue
    .line 315
    iget-boolean v0, p0, Lcom/rey/material/widget/Switch;->mChecked:Z

    if-eq v0, p1, :cond_11

    .line 316
    iput-boolean p1, p0, Lcom/rey/material/widget/Switch;->mChecked:Z

    .line 317
    iget-object v0, p0, Lcom/rey/material/widget/Switch;->mOnCheckedChangeListener:Lcom/rey/material/widget/Switch$OnCheckedChangeListener;

    if-eqz v0, :cond_11

    .line 318
    iget-object v0, p0, Lcom/rey/material/widget/Switch;->mOnCheckedChangeListener:Lcom/rey/material/widget/Switch$OnCheckedChangeListener;

    iget-boolean v1, p0, Lcom/rey/material/widget/Switch;->mChecked:Z

    invoke-interface {v0, p0, v1}, Lcom/rey/material/widget/Switch$OnCheckedChangeListener;->onCheckedChanged(Lcom/rey/material/widget/Switch;Z)V

    .line 320
    :cond_11
    iget-boolean v0, p0, Lcom/rey/material/widget/Switch;->mChecked:Z

    if-eqz v0, :cond_1d

    const/high16 v0, 0x3f800000    # 1.0f

    :goto_17
    iput v0, p0, Lcom/rey/material/widget/Switch;->mThumbPosition:F

    .line 321
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->invalidate()V

    .line 322
    return-void

    .line 320
    :cond_1d
    const/4 v0, 0x0

    goto :goto_17
.end method

.method public setOnCheckedChangeListener(Lcom/rey/material/widget/Switch$OnCheckedChangeListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/rey/material/widget/Switch$OnCheckedChangeListener;

    .prologue
    .line 293
    iput-object p1, p0, Lcom/rey/material/widget/Switch;->mOnCheckedChangeListener:Lcom/rey/material/widget/Switch$OnCheckedChangeListener;

    .line 294
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 3
    .param p1, "l"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 279
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->getRippleManager()Lcom/rey/material/widget/RippleManager;

    move-result-object v0

    .line 280
    .local v0, "rippleManager":Lcom/rey/material/widget/RippleManager;
    if-ne p1, v0, :cond_a

    .line 281
    invoke-super {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 286
    :goto_9
    return-void

    .line 283
    :cond_a
    invoke-virtual {v0, p1}, Lcom/rey/material/widget/RippleManager;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 284
    invoke-virtual {p0, v0}, Lcom/rey/material/widget/Switch;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_9
.end method

.method public toggle()V
    .registers 2

    .prologue
    .line 331
    invoke-virtual {p0}, Lcom/rey/material/widget/Switch;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 332
    iget-boolean v0, p0, Lcom/rey/material/widget/Switch;->mChecked:Z

    if-nez v0, :cond_f

    const/4 v0, 0x1

    :goto_b
    invoke-virtual {p0, v0}, Lcom/rey/material/widget/Switch;->setChecked(Z)V

    .line 333
    :cond_e
    return-void

    .line 332
    :cond_f
    const/4 v0, 0x0

    goto :goto_b
.end method
