.class public Lcom/rey/material/drawable/ToolbarRippleDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "ToolbarRippleDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;
    }
.end annotation


# static fields
.field private static final GRADIENT_RADIUS:F = 16.0f

.field private static final GRADIENT_STOPS:[F

.field private static final STATE_HOVER:I = 0x2

.field private static final STATE_OUT:I = 0x0

.field private static final STATE_PRESS:I = 0x1

.field private static final STATE_RELEASE:I = 0x4

.field private static final STATE_RELEASE_ON_HOLD:I = 0x3

.field private static final TYPE_TOUCH:I = 0x0

.field private static final TYPE_TOUCH_MATCH_VIEW:I = -0x1

.field private static final TYPE_WAVE:I = 0x1


# instance fields
.field private mAlpha:I

.field private mBackground:Landroid/graphics/Path;

.field private mBackgroundAlphaPercent:F

.field private mBackgroundAnimDuration:I

.field private mBackgroundBounds:Landroid/graphics/RectF;

.field private mBackgroundColor:I

.field private mDelayClickType:I

.field private mFillPaint:Landroid/graphics/Paint;

.field private mInInterpolator:Landroid/view/animation/Interpolator;

.field private mInShader:Landroid/graphics/RadialGradient;

.field private mMatrix:Landroid/graphics/Matrix;

.field private mMaxRippleRadius:I

.field private mOutInterpolator:Landroid/view/animation/Interpolator;

.field private mOutShader:Landroid/graphics/RadialGradient;

.field private mPressed:Z

.field private mRippleAlphaPercent:F

.field private mRippleAnimDuration:I

.field private mRippleColor:I

.field private mRipplePoint:Landroid/graphics/PointF;

.field private mRippleRadius:F

.field private mRippleType:I

.field private mRunning:Z

.field private mShaderPaint:Landroid/graphics/Paint;

.field private mStartTime:J

.field private mState:I

.field private final mUpdater:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 78
    const/4 v0, 0x3

    new-array v0, v0, [F

    fill-array-data v0, :array_a

    sput-object v0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->GRADIENT_STOPS:[F

    return-void

    nop

    :array_a
    .array-data 4
        0x0
        0x3f7d70a4    # 0.99f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private constructor <init>(IIIIIIILandroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;)V
    .registers 19
    .param p1, "backgroundAnimDuration"    # I
    .param p2, "backgroundColor"    # I
    .param p3, "rippleType"    # I
    .param p4, "delayClickType"    # I
    .param p5, "maxTouchRadius"    # I
    .param p6, "touchAnimDuration"    # I
    .param p7, "touchColor"    # I
    .param p8, "inInterpolator"    # Landroid/view/animation/Interpolator;
    .param p9, "outInterpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 81
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 35
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRunning:Z

    .line 42
    const/16 v1, 0xff

    iput v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mAlpha:I

    .line 64
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mPressed:Z

    .line 66
    const/4 v1, 0x0

    iput v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mState:I

    .line 339
    new-instance v1, Lcom/rey/material/drawable/ToolbarRippleDrawable$1;

    invoke-direct {v1, p0}, Lcom/rey/material/drawable/ToolbarRippleDrawable$1;-><init>(Lcom/rey/material/drawable/ToolbarRippleDrawable;)V

    iput-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mUpdater:Ljava/lang/Runnable;

    .line 82
    iput p1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundAnimDuration:I

    .line 83
    iput p2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundColor:I

    .line 85
    iput p3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleType:I

    .line 86
    iput p5, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mMaxRippleRadius:I

    .line 87
    iput p6, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleAnimDuration:I

    .line 88
    move/from16 v0, p7

    iput v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleColor:I

    .line 89
    iput p4, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mDelayClickType:I

    .line 91
    iget v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleType:I

    if-nez v1, :cond_32

    iget v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mMaxRippleRadius:I

    if-gtz v1, :cond_32

    .line 92
    const/4 v1, -0x1

    iput v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleType:I

    .line 94
    :cond_32
    move-object/from16 v0, p8

    iput-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mInInterpolator:Landroid/view/animation/Interpolator;

    .line 95
    move-object/from16 v0, p9

    iput-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mOutInterpolator:Landroid/view/animation/Interpolator;

    .line 97
    new-instance v1, Landroid/graphics/Paint;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mFillPaint:Landroid/graphics/Paint;

    .line 98
    iget-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mFillPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 100
    new-instance v1, Landroid/graphics/Paint;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mShaderPaint:Landroid/graphics/Paint;

    .line 101
    iget-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mShaderPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 103
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackground:Landroid/graphics/Path;

    .line 104
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundBounds:Landroid/graphics/RectF;

    .line 106
    new-instance v1, Landroid/graphics/PointF;

    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    iput-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRipplePoint:Landroid/graphics/PointF;

    .line 108
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mMatrix:Landroid/graphics/Matrix;

    .line 110
    new-instance v1, Landroid/graphics/RadialGradient;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/high16 v4, 0x41800000    # 16.0f

    const/4 v5, 0x3

    new-array v5, v5, [I

    const/4 v6, 0x0

    iget v7, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleColor:I

    aput v7, v5, v6

    const/4 v6, 0x1

    iget v7, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleColor:I

    aput v7, v5, v6

    const/4 v6, 0x2

    const/4 v7, 0x0

    aput v7, v5, v6

    sget-object v6, Lcom/rey/material/drawable/ToolbarRippleDrawable;->GRADIENT_STOPS:[F

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v1 .. v7}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    iput-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mInShader:Landroid/graphics/RadialGradient;

    .line 111
    iget v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleType:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_be

    .line 112
    new-instance v1, Landroid/graphics/RadialGradient;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/high16 v4, 0x41800000    # 16.0f

    const/4 v5, 0x3

    new-array v5, v5, [I

    const/4 v6, 0x0

    const/4 v7, 0x0

    aput v7, v5, v6

    const/4 v6, 0x1

    iget v7, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleColor:I

    const/4 v8, 0x0

    invoke-static {v7, v8}, Lcom/rey/material/util/ColorUtil;->getColor(IF)I

    move-result v7

    aput v7, v5, v6

    const/4 v6, 0x2

    iget v7, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleColor:I

    aput v7, v5, v6

    sget-object v6, Lcom/rey/material/drawable/ToolbarRippleDrawable;->GRADIENT_STOPS:[F

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v1 .. v7}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    iput-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mOutShader:Landroid/graphics/RadialGradient;

    .line 113
    :cond_be
    return-void
.end method

.method synthetic constructor <init>(IIIIIIILandroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;Lcom/rey/material/drawable/ToolbarRippleDrawable$1;)V
    .registers 11
    .param p1, "x0"    # I
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # I
    .param p5, "x4"    # I
    .param p6, "x5"    # I
    .param p7, "x6"    # I
    .param p8, "x7"    # Landroid/view/animation/Interpolator;
    .param p9, "x8"    # Landroid/view/animation/Interpolator;
    .param p10, "x9"    # Lcom/rey/material/drawable/ToolbarRippleDrawable$1;

    .prologue
    .line 33
    invoke-direct/range {p0 .. p9}, Lcom/rey/material/drawable/ToolbarRippleDrawable;-><init>(IIIIIIILandroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;)V

    return-void
.end method

.method static synthetic access$000(Lcom/rey/material/drawable/ToolbarRippleDrawable;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/drawable/ToolbarRippleDrawable;

    .prologue
    .line 33
    iget v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleType:I

    return v0
.end method

.method static synthetic access$100(Lcom/rey/material/drawable/ToolbarRippleDrawable;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/drawable/ToolbarRippleDrawable;

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->updateTouch()V

    return-void
.end method

.method static synthetic access$200(Lcom/rey/material/drawable/ToolbarRippleDrawable;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/drawable/ToolbarRippleDrawable;

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->updateWave()V

    return-void
.end method

.method private drawTouch(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v3, 0x0

    .line 256
    iget v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mState:I

    if-eqz v0, :cond_51

    .line 257
    iget v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundAlphaPercent:F

    cmpl-float v0, v0, v3

    if-lez v0, :cond_28

    .line 258
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mFillPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 259
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mFillPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mAlpha:I

    int-to-float v1, v1

    iget v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundAlphaPercent:F

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 260
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackground:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 263
    :cond_28
    iget v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleRadius:F

    cmpl-float v0, v0, v3

    if-lez v0, :cond_51

    iget v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleAlphaPercent:F

    cmpl-float v0, v0, v3

    if-lez v0, :cond_51

    .line 264
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mShaderPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mAlpha:I

    int-to-float v1, v1

    iget v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleAlphaPercent:F

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 265
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mShaderPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mInShader:Landroid/graphics/RadialGradient;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 266
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackground:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mShaderPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 269
    :cond_51
    return-void
.end method

.method private drawWave(Landroid/graphics/Canvas;)V
    .registers 5
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v2, 0x0

    .line 272
    iget v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mState:I

    if-eqz v0, :cond_1e

    .line 273
    iget v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mState:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_2e

    .line 274
    iget v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleRadius:F

    cmpl-float v0, v0, v2

    if-nez v0, :cond_1f

    .line 275
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mFillPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 276
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackground:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 288
    :cond_1e
    :goto_1e
    return-void

    .line 279
    :cond_1f
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mShaderPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mOutShader:Landroid/graphics/RadialGradient;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 280
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackground:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mShaderPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto :goto_1e

    .line 283
    :cond_2e
    iget v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleRadius:F

    cmpl-float v0, v0, v2

    if-lez v0, :cond_1e

    .line 284
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mShaderPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mInShader:Landroid/graphics/RadialGradient;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 285
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackground:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mShaderPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto :goto_1e
.end method

.method private getMaxRippleRadius(FF)I
    .registers 11
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    .line 291
    iget-object v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundBounds:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v2

    cmpg-float v2, p1, v2

    if-gez v2, :cond_37

    iget-object v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundBounds:Landroid/graphics/RectF;

    iget v0, v2, Landroid/graphics/RectF;->right:F

    .line 292
    .local v0, "x1":F
    :goto_10
    iget-object v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundBounds:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    cmpg-float v2, p2, v2

    if-gez v2, :cond_3c

    iget-object v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundBounds:Landroid/graphics/RectF;

    iget v1, v2, Landroid/graphics/RectF;->bottom:F

    .line 294
    .local v1, "y1":F
    :goto_1e
    sub-float v2, v0, p1

    float-to-double v2, v2

    invoke-static {v2, v3, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    sub-float v4, v1, p2

    float-to-double v4, v4

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    add-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide v2

    long-to-int v2, v2

    return v2

    .line 291
    .end local v0    # "x1":F
    .end local v1    # "y1":F
    :cond_37
    iget-object v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundBounds:Landroid/graphics/RectF;

    iget v0, v2, Landroid/graphics/RectF;->left:F

    goto :goto_10

    .line 292
    .restart local v0    # "x1":F
    :cond_3c
    iget-object v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundBounds:Landroid/graphics/RectF;

    iget v1, v2, Landroid/graphics/RectF;->top:F

    goto :goto_1e
.end method

.method private resetAnimation()V
    .registers 3

    .prologue
    .line 304
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mStartTime:J

    .line 305
    return-void
.end method

.method private setRippleEffect(FFF)Z
    .registers 6
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "radius"    # F

    .prologue
    .line 174
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRipplePoint:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    cmpl-float v0, v0, p1

    if-nez v0, :cond_16

    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRipplePoint:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->y:F

    cmpl-float v0, v0, p2

    if-nez v0, :cond_16

    iget v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleRadius:F

    cmpl-float v0, v0, p3

    if-eqz v0, :cond_46

    .line 175
    :cond_16
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRipplePoint:Landroid/graphics/PointF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    .line 176
    iput p3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleRadius:F

    .line 177
    iget v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleRadius:F

    const/high16 v1, 0x41800000    # 16.0f

    div-float p3, v0, v1

    .line 178
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 179
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 180
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p3, p3, p1, p2}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 181
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mInShader:Landroid/graphics/RadialGradient;

    iget-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/RadialGradient;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 182
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mOutShader:Landroid/graphics/RadialGradient;

    if-eqz v0, :cond_44

    .line 183
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mOutShader:Landroid/graphics/RadialGradient;

    iget-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/RadialGradient;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 185
    :cond_44
    const/4 v0, 0x1

    .line 188
    :goto_45
    return v0

    :cond_46
    const/4 v0, 0x0

    goto :goto_45
.end method

.method private setRippleState(I)V
    .registers 4
    .param p1, "state"    # I

    .prologue
    .line 159
    iget v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mState:I

    if-eq v0, p1, :cond_12

    .line 160
    iput p1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mState:I

    .line 162
    iget v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mState:I

    if-eqz v0, :cond_17

    .line 163
    iget v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mState:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_13

    .line 164
    invoke-virtual {p0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->start()V

    .line 171
    :cond_12
    :goto_12
    return-void

    .line 166
    :cond_13
    invoke-virtual {p0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->stop()V

    goto :goto_12

    .line 169
    :cond_17
    invoke-virtual {p0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->stop()V

    goto :goto_12
.end method

.method private updateTouch()V
    .registers 10

    .prologue
    const/4 v2, 0x4

    const/high16 v8, 0x437f0000    # 255.0f

    const/high16 v7, 0x3f800000    # 1.0f

    .line 358
    iget v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mState:I

    if-eq v3, v2, :cond_84

    .line 359
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mStartTime:J

    sub-long/2addr v3, v5

    long-to-float v3, v3

    iget v4, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundAnimDuration:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-static {v7, v3}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 360
    .local v0, "backgroundProgress":F
    iget-object v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mInInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v3, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v3

    iget v4, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundColor:I

    invoke-static {v4}, Landroid/graphics/Color;->alpha(I)I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v3, v4

    div-float/2addr v3, v8

    iput v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundAlphaPercent:F

    .line 362
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mStartTime:J

    sub-long/2addr v3, v5

    long-to-float v3, v3

    iget v4, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleAnimDuration:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-static {v7, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 363
    .local v1, "touchProgress":F
    iget-object v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mInInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v3, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v3

    iput v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleAlphaPercent:F

    .line 365
    iget-object v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRipplePoint:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->x:F

    iget-object v4, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRipplePoint:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->y:F

    iget v5, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mMaxRippleRadius:I

    int-to-float v5, v5

    iget-object v6, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mInInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v6, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v6

    mul-float/2addr v5, v6

    invoke-direct {p0, v3, v4, v5}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setRippleEffect(FFF)Z

    .line 367
    cmpl-float v3, v0, v7

    if-nez v3, :cond_6e

    cmpl-float v3, v1, v7

    if-nez v3, :cond_6e

    .line 368
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mStartTime:J

    .line 369
    iget v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mState:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_6b

    const/4 v2, 0x2

    :cond_6b
    invoke-direct {p0, v2}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setRippleState(I)V

    .line 386
    :cond_6e
    :goto_6e
    invoke-virtual {p0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_80

    .line 387
    iget-object v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x10

    add-long/2addr v3, v5

    invoke-virtual {p0, v2, v3, v4}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 389
    :cond_80
    invoke-virtual {p0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->invalidateSelf()V

    .line 390
    return-void

    .line 374
    .end local v0    # "backgroundProgress":F
    .end local v1    # "touchProgress":F
    :cond_84
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mStartTime:J

    sub-long/2addr v2, v4

    long-to-float v2, v2

    iget v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundAnimDuration:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-static {v7, v2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 375
    .restart local v0    # "backgroundProgress":F
    iget-object v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mOutInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v2, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v2

    sub-float v2, v7, v2

    iget v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundColor:I

    invoke-static {v3}, Landroid/graphics/Color;->alpha(I)I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v2, v3

    div-float/2addr v2, v8

    iput v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundAlphaPercent:F

    .line 377
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mStartTime:J

    sub-long/2addr v2, v4

    long-to-float v2, v2

    iget v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleAnimDuration:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-static {v7, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 378
    .restart local v1    # "touchProgress":F
    iget-object v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mOutInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v2, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v2

    sub-float v2, v7, v2

    iput v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleAlphaPercent:F

    .line 380
    iget-object v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRipplePoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    iget-object v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRipplePoint:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    iget v4, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mMaxRippleRadius:I

    int-to-float v4, v4

    const/high16 v5, 0x3f000000    # 0.5f

    iget-object v6, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mOutInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v6, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v6

    mul-float/2addr v5, v6

    add-float/2addr v5, v7

    mul-float/2addr v4, v5

    invoke-direct {p0, v2, v3, v4}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setRippleEffect(FFF)Z

    .line 382
    cmpl-float v2, v0, v7

    if-nez v2, :cond_6e

    cmpl-float v2, v1, v7

    if-nez v2, :cond_6e

    .line 383
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setRippleState(I)V

    goto :goto_6e
.end method

.method private updateWave()V
    .registers 8

    .prologue
    const/4 v6, 0x4

    const/high16 v5, 0x3f800000    # 1.0f

    .line 393
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mStartTime:J

    sub-long/2addr v1, v3

    long-to-float v1, v1

    iget v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleAnimDuration:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-static {v5, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 395
    .local v0, "progress":F
    iget v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mState:I

    if-eq v1, v6, :cond_65

    .line 396
    iget-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRipplePoint:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    iget-object v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRipplePoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    iget v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mMaxRippleRadius:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mInInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v4, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v4

    mul-float/2addr v3, v4

    invoke-direct {p0, v1, v2, v3}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setRippleEffect(FFF)Z

    .line 398
    cmpl-float v1, v0, v5

    if-nez v1, :cond_3f

    .line 399
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mStartTime:J

    .line 400
    iget v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mState:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_55

    .line 401
    const/4 v1, 0x2

    invoke-direct {p0, v1}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setRippleState(I)V

    .line 415
    :cond_3f
    :goto_3f
    invoke-virtual {p0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_51

    .line 416
    iget-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x10

    add-long/2addr v2, v4

    invoke-virtual {p0, v1, v2, v3}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 418
    :cond_51
    invoke-virtual {p0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->invalidateSelf()V

    .line 419
    return-void

    .line 403
    :cond_55
    iget-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRipplePoint:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    iget-object v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRipplePoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    const/4 v3, 0x0

    invoke-direct {p0, v1, v2, v3}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setRippleEffect(FFF)Z

    .line 404
    invoke-direct {p0, v6}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setRippleState(I)V

    goto :goto_3f

    .line 409
    :cond_65
    iget-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRipplePoint:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    iget-object v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRipplePoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    iget v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mMaxRippleRadius:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mOutInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v4, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v4

    mul-float/2addr v3, v4

    invoke-direct {p0, v1, v2, v3}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setRippleEffect(FFF)Z

    .line 411
    cmpl-float v1, v0, v5

    if-nez v1, :cond_3f

    .line 412
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setRippleState(I)V

    goto :goto_3f
.end method


# virtual methods
.method public cancel()V
    .registers 2

    .prologue
    .line 300
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setRippleState(I)V

    .line 301
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 244
    iget v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleType:I

    packed-switch v0, :pswitch_data_e

    .line 253
    :goto_5
    return-void

    .line 247
    :pswitch_6
    invoke-direct {p0, p1}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->drawTouch(Landroid/graphics/Canvas;)V

    goto :goto_5

    .line 250
    :pswitch_a
    invoke-direct {p0, p1}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->drawWave(Landroid/graphics/Canvas;)V

    goto :goto_5

    .line 244
    :pswitch_data_e
    .packed-switch -0x1
        :pswitch_6
        :pswitch_6
        :pswitch_a
    .end packed-switch
.end method

.method public getClickDelayTime()J
    .registers 7

    .prologue
    const-wide/16 v0, -0x1

    const/4 v3, 0x3

    .line 140
    iget v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mDelayClickType:I

    packed-switch v2, :pswitch_data_4e

    .line 155
    :cond_8
    :goto_8
    :pswitch_8
    return-wide v0

    .line 144
    :pswitch_9
    iget v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mState:I

    if-ne v2, v3, :cond_8

    .line 145
    iget v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundAnimDuration:I

    iget v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleAnimDuration:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-long v0, v0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mStartTime:J

    sub-long/2addr v2, v4

    sub-long/2addr v0, v2

    goto :goto_8

    .line 148
    :pswitch_1f
    iget v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mState:I

    if-ne v2, v3, :cond_37

    .line 149
    iget v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundAnimDuration:I

    iget v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleAnimDuration:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    int-to-long v0, v0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mStartTime:J

    sub-long/2addr v2, v4

    sub-long/2addr v0, v2

    goto :goto_8

    .line 150
    :cond_37
    iget v2, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mState:I

    const/4 v3, 0x4

    if-ne v2, v3, :cond_8

    .line 151
    iget v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundAnimDuration:I

    iget v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleAnimDuration:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-long v0, v0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mStartTime:J

    sub-long/2addr v2, v4

    sub-long/2addr v0, v2

    goto :goto_8

    .line 140
    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_8
        :pswitch_9
        :pswitch_1f
    .end packed-switch
.end method

.method public getDelayClickType()I
    .registers 2

    .prologue
    .line 116
    iget v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mDelayClickType:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 136
    const/4 v0, -0x3

    return v0
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 330
    iget-boolean v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRunning:Z

    return v0
.end method

.method public isStateful()Z
    .registers 2

    .prologue
    .line 200
    const/4 v0, 0x1

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .registers 7
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 193
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundBounds:Landroid/graphics/RectF;

    iget v1, p1, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    iget v2, p1, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    iget v3, p1, Landroid/graphics/Rect;->right:I

    int-to-float v3, v3

    iget v4, p1, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 194
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackground:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 195
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackground:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mBackgroundBounds:Landroid/graphics/RectF;

    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->addRect(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 196
    return-void
.end method

.method protected onStateChange([I)Z
    .registers 10
    .param p1, "state"    # [I

    .prologue
    const/4 v7, 0x4

    const/4 v6, -0x1

    const/4 v5, 0x0

    const/4 v2, 0x1

    .line 205
    const v3, 0x10100a7

    invoke-static {p1, v3}, Lcom/rey/material/util/ViewUtil;->hasState([II)Z

    move-result v1

    .line 207
    .local v1, "pressed":Z
    iget-boolean v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mPressed:Z

    if-eq v3, v1, :cond_7d

    .line 208
    iput-boolean v1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mPressed:Z

    .line 210
    iget-boolean v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mPressed:Z

    if-eqz v3, :cond_58

    .line 211
    invoke-virtual {p0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 213
    .local v0, "bounds":Landroid/graphics/Rect;
    iget v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mState:I

    if-eqz v3, :cond_21

    iget v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mState:I

    if-ne v3, v7, :cond_46

    .line 214
    :cond_21
    iget v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleType:I

    if-eq v3, v2, :cond_29

    iget v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleType:I

    if-ne v3, v6, :cond_37

    .line 215
    :cond_29
    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v4

    invoke-direct {p0, v3, v4}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->getMaxRippleRadius(FF)I

    move-result v3

    iput v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mMaxRippleRadius:I

    .line 217
    :cond_37
    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v4

    invoke-direct {p0, v3, v4, v5}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setRippleEffect(FFF)Z

    .line 218
    invoke-direct {p0, v2}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setRippleState(I)V

    .line 239
    .end local v0    # "bounds":Landroid/graphics/Rect;
    :cond_45
    :goto_45
    return v2

    .line 220
    .restart local v0    # "bounds":Landroid/graphics/Rect;
    :cond_46
    iget v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleType:I

    if-nez v3, :cond_45

    .line 221
    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v4

    iget v5, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleRadius:F

    invoke-direct {p0, v3, v4, v5}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setRippleEffect(FFF)Z

    goto :goto_45

    .line 224
    .end local v0    # "bounds":Landroid/graphics/Rect;
    :cond_58
    iget v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mState:I

    if-eqz v3, :cond_45

    .line 225
    iget v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mState:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_78

    .line 226
    iget v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleType:I

    if-eq v3, v2, :cond_69

    iget v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleType:I

    if-ne v3, v6, :cond_74

    .line 227
    :cond_69
    iget-object v3, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRipplePoint:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->x:F

    iget-object v4, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRipplePoint:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->y:F

    invoke-direct {p0, v3, v4, v5}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setRippleEffect(FFF)Z

    .line 229
    :cond_74
    invoke-direct {p0, v7}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setRippleState(I)V

    goto :goto_45

    .line 232
    :cond_78
    const/4 v3, 0x3

    invoke-direct {p0, v3}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setRippleState(I)V

    goto :goto_45

    .line 239
    :cond_7d
    const/4 v2, 0x0

    goto :goto_45
.end method

.method public scheduleSelf(Ljava/lang/Runnable;J)V
    .registers 5
    .param p1, "what"    # Ljava/lang/Runnable;
    .param p2, "when"    # J

    .prologue
    .line 335
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRunning:Z

    .line 336
    invoke-super {p0, p1, p2, p3}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 337
    return-void
.end method

.method public setAlpha(I)V
    .registers 2
    .param p1, "alpha"    # I

    .prologue
    .line 125
    iput p1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mAlpha:I

    .line 126
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "filter"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 131
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mShaderPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 132
    return-void
.end method

.method public setDelayClickType(I)V
    .registers 2
    .param p1, "type"    # I

    .prologue
    .line 120
    iput p1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mDelayClickType:I

    .line 121
    return-void
.end method

.method public start()V
    .registers 6

    .prologue
    .line 309
    invoke-virtual {p0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 316
    :goto_6
    return-void

    .line 312
    :cond_7
    invoke-direct {p0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->resetAnimation()V

    .line 314
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x10

    add-long/2addr v1, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 315
    invoke-virtual {p0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->invalidateSelf()V

    goto :goto_6
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 320
    invoke-virtual {p0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->isRunning()Z

    move-result v0

    if-nez v0, :cond_7

    .line 326
    :goto_6
    return-void

    .line 323
    :cond_7
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRunning:Z

    .line 324
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 325
    invoke-virtual {p0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->invalidateSelf()V

    goto :goto_6
.end method
