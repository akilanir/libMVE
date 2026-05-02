.class public Lcom/rey/material/drawable/OvalShadowDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "OvalShadowDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# static fields
.field private static final COLOR_SHADOW_END:I = 0x0

.field private static final COLOR_SHADOW_START:I = 0x4c000000


# instance fields
.field private mAnimDuration:I

.field private mAnimEnable:Z

.field private mAnimProgress:F

.field private mColorStateList:Landroid/content/res/ColorStateList;

.field private mCurColor:I

.field private mEnable:Z

.field private mGlowPaint:Landroid/graphics/Paint;

.field private mGlowPath:Landroid/graphics/Path;

.field private mInEditMode:Z

.field private mNeedBuildShadow:Z

.field private mPaint:Landroid/graphics/Paint;

.field private mPrevColor:I

.field private mRadius:I

.field private mRunning:Z

.field private mShadowOffset:F

.field private mShadowPaint:Landroid/graphics/Paint;

.field private mShadowPath:Landroid/graphics/Path;

.field private mShadowSize:F

.field private mStartTime:J

.field private mTempRect:Landroid/graphics/RectF;

.field private final mUpdater:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(ILandroid/content/res/ColorStateList;FFI)V
    .registers 8
    .param p1, "radius"    # I
    .param p2, "colorStateList"    # Landroid/content/res/ColorStateList;
    .param p3, "shadowSize"    # F
    .param p4, "shadowOffset"    # F
    .param p5, "animDuration"    # I

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 55
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 24
    iput-boolean v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRunning:Z

    .line 29
    iput-boolean v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mEnable:Z

    .line 30
    iput-boolean v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mInEditMode:Z

    .line 31
    iput-boolean v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mAnimEnable:Z

    .line 44
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mTempRect:Landroid/graphics/RectF;

    .line 50
    iput-boolean v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mNeedBuildShadow:Z

    .line 338
    new-instance v0, Lcom/rey/material/drawable/OvalShadowDrawable$1;

    invoke-direct {v0, p0}, Lcom/rey/material/drawable/OvalShadowDrawable$1;-><init>(Lcom/rey/material/drawable/OvalShadowDrawable;)V

    iput-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mUpdater:Ljava/lang/Runnable;

    .line 56
    iput p5, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mAnimDuration:I

    .line 58
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mPaint:Landroid/graphics/Paint;

    .line 59
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 61
    invoke-virtual {p0, p2}, Lcom/rey/material/drawable/OvalShadowDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    .line 62
    invoke-virtual {p0, p1}, Lcom/rey/material/drawable/OvalShadowDrawable;->setRadius(I)Z

    .line 63
    invoke-virtual {p0, p3, p4}, Lcom/rey/material/drawable/OvalShadowDrawable;->setShadow(FF)Z

    .line 64
    return-void
.end method

.method static synthetic access$000(Lcom/rey/material/drawable/OvalShadowDrawable;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/drawable/OvalShadowDrawable;

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/rey/material/drawable/OvalShadowDrawable;->update()V

    return-void
.end method

.method private buildShadow()V
    .registers 15

    .prologue
    const/high16 v13, 0x3f800000    # 1.0f

    const/4 v12, 0x3

    const/4 v11, 0x1

    const/high16 v10, 0x40000000    # 2.0f

    const/4 v1, 0x0

    .line 175
    iget v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_e

    .line 226
    :goto_d
    return-void

    .line 178
    :cond_e
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowPaint:Landroid/graphics/Paint;

    if-nez v0, :cond_26

    .line 179
    new-instance v0, Landroid/graphics/Paint;

    const/4 v2, 0x5

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowPaint:Landroid/graphics/Paint;

    .line 180
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 181
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v11}, Landroid/graphics/Paint;->setDither(Z)V

    .line 183
    :cond_26
    iget v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    int-to-float v0, v0

    iget v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    int-to-float v2, v2

    iget v3, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    add-float/2addr v2, v3

    iget v3, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowOffset:F

    add-float/2addr v2, v3

    div-float v8, v0, v2

    .line 184
    .local v8, "startRatio":F
    iget-object v9, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/RadialGradient;

    iget v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    int-to-float v2, v2

    iget v3, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    add-float/2addr v3, v2

    new-array v4, v12, [I

    fill-array-data v4, :array_134

    new-array v5, v12, [F

    const/4 v2, 0x0

    aput v1, v5, v2

    aput v8, v5, v11

    const/4 v2, 0x2

    aput v13, v5, v2

    sget-object v6, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move v2, v1

    invoke-direct/range {v0 .. v6}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v9, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 189
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowPath:Landroid/graphics/Path;

    if-nez v0, :cond_127

    .line 190
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowPath:Landroid/graphics/Path;

    .line 191
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowPath:Landroid/graphics/Path;

    sget-object v2, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    invoke-virtual {v0, v2}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 195
    :goto_68
    iget v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    int-to-float v0, v0

    iget v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    add-float v7, v0, v2

    .line 196
    .local v7, "radius":F
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mTempRect:Landroid/graphics/RectF;

    neg-float v2, v7

    neg-float v3, v7

    invoke-virtual {v0, v2, v3, v7, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 197
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mTempRect:Landroid/graphics/RectF;

    sget-object v3, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->addOval(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 198
    iget v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    add-int/lit8 v0, v0, -0x1

    int-to-float v7, v0

    .line 199
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mTempRect:Landroid/graphics/RectF;

    neg-float v2, v7

    neg-float v3, v7

    iget v4, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowOffset:F

    sub-float/2addr v3, v4

    iget v4, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowOffset:F

    sub-float v4, v7, v4

    invoke-virtual {v0, v2, v3, v7, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 200
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mTempRect:Landroid/graphics/RectF;

    sget-object v3, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->addOval(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 202
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mGlowPaint:Landroid/graphics/Paint;

    if-nez v0, :cond_b3

    .line 203
    new-instance v0, Landroid/graphics/Paint;

    const/4 v2, 0x5

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mGlowPaint:Landroid/graphics/Paint;

    .line 204
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mGlowPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 205
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mGlowPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v11}, Landroid/graphics/Paint;->setDither(Z)V

    .line 207
    :cond_b3
    iget v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    int-to-float v0, v0

    iget v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    div-float/2addr v2, v10

    sub-float/2addr v0, v2

    iget v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    int-to-float v2, v2

    iget v3, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    div-float/2addr v3, v10

    add-float/2addr v2, v3

    div-float v8, v0, v2

    .line 208
    iget-object v9, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mGlowPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/RadialGradient;

    iget v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    int-to-float v2, v2

    iget v3, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    div-float/2addr v3, v10

    add-float/2addr v3, v2

    new-array v4, v12, [I

    fill-array-data v4, :array_13e

    new-array v5, v12, [F

    const/4 v2, 0x0

    aput v1, v5, v2

    aput v8, v5, v11

    const/4 v2, 0x2

    aput v13, v5, v2

    sget-object v6, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move v2, v1

    invoke-direct/range {v0 .. v6}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v9, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 213
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mGlowPath:Landroid/graphics/Path;

    if-nez v0, :cond_12e

    .line 214
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mGlowPath:Landroid/graphics/Path;

    .line 215
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mGlowPath:Landroid/graphics/Path;

    sget-object v1, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    invoke-virtual {v0, v1}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 220
    :goto_f8
    iget v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    int-to-float v0, v0

    iget v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    div-float/2addr v1, v10

    add-float v7, v0, v1

    .line 221
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mTempRect:Landroid/graphics/RectF;

    neg-float v1, v7

    neg-float v2, v7

    invoke-virtual {v0, v1, v2, v7, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 222
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mGlowPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mTempRect:Landroid/graphics/RectF;

    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->addOval(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 223
    iget v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    add-int/lit8 v0, v0, -0x1

    int-to-float v7, v0

    .line 224
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mTempRect:Landroid/graphics/RectF;

    neg-float v1, v7

    neg-float v2, v7

    invoke-virtual {v0, v1, v2, v7, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 225
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mGlowPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mTempRect:Landroid/graphics/RectF;

    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->addOval(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    goto/16 :goto_d

    .line 194
    .end local v7    # "radius":F
    :cond_127
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowPath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    goto/16 :goto_68

    .line 218
    .restart local v7    # "radius":F
    :cond_12e
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mGlowPath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    goto :goto_f8

    .line 184
    :array_134
    .array-data 4
        0x4c000000    # 3.3554432E7f
        0x4c000000    # 3.3554432E7f
        0x0
    .end array-data

    .line 208
    :array_13e
    .array-data 4
        0x4c000000    # 3.3554432E7f
        0x4c000000    # 3.3554432E7f
        0x0
    .end array-data
.end method

.method private resetAnimation()V
    .registers 3

    .prologue
    .line 309
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mStartTime:J

    .line 310
    const/4 v0, 0x0

    iput v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mAnimProgress:F

    .line 311
    return-void
.end method

.method private update()V
    .registers 8

    .prologue
    const/high16 v4, 0x3f800000    # 1.0f

    .line 348
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 349
    .local v0, "curTime":J
    iget-wide v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mStartTime:J

    sub-long v2, v0, v2

    long-to-float v2, v2

    iget v3, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mAnimDuration:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-static {v4, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mAnimProgress:F

    .line 351
    iget v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mAnimProgress:F

    cmpl-float v2, v2, v4

    if-nez v2, :cond_1e

    .line 352
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRunning:Z

    .line 354
    :cond_1e
    invoke-virtual {p0}, Lcom/rey/material/drawable/OvalShadowDrawable;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_30

    .line 355
    iget-object v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x10

    add-long/2addr v3, v5

    invoke-virtual {p0, v2, v3, v4}, Lcom/rey/material/drawable/OvalShadowDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 357
    :cond_30
    invoke-virtual {p0}, Lcom/rey/material/drawable/OvalShadowDrawable;->invalidateSelf()V

    .line 358
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v4, 0x0

    .line 230
    iget-boolean v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mNeedBuildShadow:Z

    if-eqz v1, :cond_b

    .line 231
    invoke-direct {p0}, Lcom/rey/material/drawable/OvalShadowDrawable;->buildShadow()V

    .line 232
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mNeedBuildShadow:Z

    .line 236
    :cond_b
    iget v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    cmpl-float v1, v1, v4

    if-lez v1, :cond_31

    .line 237
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 238
    .local v0, "saveCount":I
    iget v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    iget v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    int-to-float v2, v2

    add-float/2addr v1, v2

    iget v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    iget v3, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    int-to-float v3, v3

    add-float/2addr v2, v3

    iget v3, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowOffset:F

    add-float/2addr v2, v3

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 239
    iget-object v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 240
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 243
    .end local v0    # "saveCount":I
    :cond_31
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 244
    .restart local v0    # "saveCount":I
    iget v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    iget v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    int-to-float v2, v2

    add-float/2addr v1, v2

    iget v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    iget v3, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    int-to-float v3, v3

    add-float/2addr v2, v3

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 245
    iget v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    cmpl-float v1, v1, v4

    if-lez v1, :cond_51

    .line 246
    iget-object v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mGlowPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mGlowPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 247
    :cond_51
    iget-object v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mTempRect:Landroid/graphics/RectF;

    iget v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    neg-int v2, v2

    int-to-float v2, v2

    iget v3, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    neg-int v3, v3

    int-to-float v3, v3

    iget v4, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    int-to-float v4, v4

    iget v5, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    int-to-float v5, v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 248
    invoke-virtual {p0}, Lcom/rey/material/drawable/OvalShadowDrawable;->isRunning()Z

    move-result v1

    if-nez v1, :cond_7c

    .line 249
    iget-object v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mCurColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 252
    :goto_71
    iget-object v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mTempRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 253
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 254
    return-void

    .line 251
    :cond_7c
    iget-object v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mPrevColor:I

    iget v3, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mCurColor:I

    iget v4, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mAnimProgress:F

    invoke-static {v2, v3, v4}, Lcom/rey/material/util/ColorUtil;->getMiddleColor(IIF)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_71
.end method

.method public getCenterX()F
    .registers 3

    .prologue
    .line 151
    iget v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    int-to-float v0, v0

    iget v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    add-float/2addr v0, v1

    return v0
.end method

.method public getCenterY()F
    .registers 3

    .prologue
    .line 155
    iget v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    int-to-float v0, v0

    iget v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    add-float/2addr v0, v1

    return v0
.end method

.method public getColor()Landroid/content/res/ColorStateList;
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mColorStateList:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getIntrinsicHeight()I
    .registers 3

    .prologue
    .line 171
    iget v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    int-to-float v0, v0

    iget v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    add-float/2addr v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowOffset:F

    add-float/2addr v0, v1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 3

    .prologue
    .line 166
    iget v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    int-to-float v0, v0

    iget v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    add-float/2addr v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    mul-float/2addr v0, v1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 270
    const/4 v0, -0x3

    return v0
.end method

.method public getPaddingBottom()F
    .registers 3

    .prologue
    .line 147
    iget v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    iget v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowOffset:F

    add-float/2addr v0, v1

    return v0
.end method

.method public getPaddingLeft()F
    .registers 2

    .prologue
    .line 135
    iget v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    return v0
.end method

.method public getPaddingRight()F
    .registers 2

    .prologue
    .line 143
    iget v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    return v0
.end method

.method public getPaddingTop()F
    .registers 2

    .prologue
    .line 139
    iget v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    return v0
.end method

.method public getRadius()I
    .registers 2

    .prologue
    .line 123
    iget v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    return v0
.end method

.method public getShadowOffset()F
    .registers 2

    .prologue
    .line 131
    iget v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowOffset:F

    return v0
.end method

.method public getShadowSize()F
    .registers 2

    .prologue
    .line 127
    iget v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    return v0
.end method

.method public isPointerOver(FF)Z
    .registers 10
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    .line 159
    invoke-virtual {p0}, Lcom/rey/material/drawable/OvalShadowDrawable;->getCenterX()F

    move-result v1

    sub-float v1, p1, v1

    float-to-double v1, v1

    invoke-static {v1, v2, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    invoke-virtual {p0}, Lcom/rey/material/drawable/OvalShadowDrawable;->getCenterY()F

    move-result v3

    sub-float v3, p2, v3

    float-to-double v3, v3

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    add-double/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    double-to-float v0, v1

    .line 161
    .local v0, "distance":F
    iget v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    int-to-float v1, v1

    cmpg-float v1, v0, v1

    if-gez v1, :cond_27

    const/4 v1, 0x1

    :goto_26
    return v1

    :cond_27
    const/4 v1, 0x0

    goto :goto_26
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 329
    iget-boolean v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRunning:Z

    return v0
.end method

.method public isStateful()Z
    .registers 2

    .prologue
    .line 275
    const/4 v0, 0x1

    return v0
.end method

.method public jumpToCurrentState()V
    .registers 1

    .prologue
    .line 304
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->jumpToCurrentState()V

    .line 305
    invoke-virtual {p0}, Lcom/rey/material/drawable/OvalShadowDrawable;->stop()V

    .line 306
    return-void
.end method

.method protected onStateChange([I)Z
    .registers 5
    .param p1, "state"    # [I

    .prologue
    .line 280
    const v1, 0x101009e

    invoke-static {p1, v1}, Lcom/rey/material/util/ViewUtil;->hasState([II)Z

    move-result v1

    iput-boolean v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mEnable:Z

    .line 281
    iget-object v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mColorStateList:Landroid/content/res/ColorStateList;

    iget v2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mCurColor:I

    invoke-virtual {v1, p1, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    .line 283
    .local v0, "color":I
    iget v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mCurColor:I

    if-eq v1, v0, :cond_41

    .line 284
    iget-boolean v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mInEditMode:Z

    if-nez v1, :cond_39

    iget-boolean v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mAnimEnable:Z

    if-eqz v1, :cond_39

    iget-boolean v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mEnable:Z

    if-eqz v1, :cond_39

    iget v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mAnimDuration:I

    if-lez v1, :cond_39

    .line 285
    invoke-virtual {p0}, Lcom/rey/material/drawable/OvalShadowDrawable;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_36

    iget v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mPrevColor:I

    :goto_2d
    iput v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mPrevColor:I

    .line 286
    iput v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mCurColor:I

    .line 287
    invoke-virtual {p0}, Lcom/rey/material/drawable/OvalShadowDrawable;->start()V

    .line 294
    :goto_34
    const/4 v1, 0x1

    .line 299
    :goto_35
    return v1

    .line 285
    :cond_36
    iget v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mCurColor:I

    goto :goto_2d

    .line 290
    :cond_39
    iput v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mPrevColor:I

    .line 291
    iput v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mCurColor:I

    .line 292
    invoke-virtual {p0}, Lcom/rey/material/drawable/OvalShadowDrawable;->invalidateSelf()V

    goto :goto_34

    .line 296
    :cond_41
    invoke-virtual {p0}, Lcom/rey/material/drawable/OvalShadowDrawable;->isRunning()Z

    move-result v1

    if-nez v1, :cond_49

    .line 297
    iput v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mPrevColor:I

    .line 299
    :cond_49
    const/4 v1, 0x0

    goto :goto_35
.end method

.method public scheduleSelf(Ljava/lang/Runnable;J)V
    .registers 5
    .param p1, "what"    # Ljava/lang/Runnable;
    .param p2, "when"    # J

    .prologue
    .line 334
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRunning:Z

    .line 335
    invoke-super {p0, p1, p2, p3}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 336
    return-void
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 258
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 259
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 260
    return-void
.end method

.method public setAnimEnable(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 119
    iput-boolean p1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mAnimEnable:Z

    .line 120
    return-void
.end method

.method public setAnimationDuration(I)Z
    .registers 3
    .param p1, "duration"    # I

    .prologue
    .line 92
    iget v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mAnimDuration:I

    if-eq v0, p1, :cond_8

    .line 93
    iput p1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mAnimDuration:I

    .line 94
    const/4 v0, 0x1

    .line 97
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public setColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 106
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mColorStateList:Landroid/content/res/ColorStateList;

    .line 107
    invoke-virtual {p0}, Lcom/rey/material/drawable/OvalShadowDrawable;->getState()[I

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/rey/material/drawable/OvalShadowDrawable;->onStateChange([I)Z

    .line 108
    return-void
.end method

.method public setColor(Landroid/content/res/ColorStateList;)V
    .registers 3
    .param p1, "colorStateList"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 101
    iput-object p1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mColorStateList:Landroid/content/res/ColorStateList;

    .line 102
    invoke-virtual {p0}, Lcom/rey/material/drawable/OvalShadowDrawable;->getState()[I

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/rey/material/drawable/OvalShadowDrawable;->onStateChange([I)Z

    .line 103
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 264
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 265
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 266
    return-void
.end method

.method public setInEditMode(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 115
    iput-boolean p1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mInEditMode:Z

    .line 116
    return-void
.end method

.method public setRadius(I)Z
    .registers 4
    .param p1, "radius"    # I

    .prologue
    const/4 v0, 0x1

    .line 67
    iget v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    if-eq v1, p1, :cond_d

    .line 68
    iput p1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRadius:I

    .line 69
    iput-boolean v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mNeedBuildShadow:Z

    .line 70
    invoke-virtual {p0}, Lcom/rey/material/drawable/OvalShadowDrawable;->invalidateSelf()V

    .line 75
    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public setShadow(FF)Z
    .registers 5
    .param p1, "size"    # F
    .param p2, "offset"    # F

    .prologue
    const/4 v0, 0x1

    .line 79
    iget v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    cmpl-float v1, v1, p1

    if-nez v1, :cond_d

    iget v1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowOffset:F

    cmpl-float v1, v1, p2

    if-eqz v1, :cond_17

    .line 80
    :cond_d
    iput p1, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowSize:F

    .line 81
    iput p2, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mShadowOffset:F

    .line 82
    iput-boolean v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mNeedBuildShadow:Z

    .line 83
    invoke-virtual {p0}, Lcom/rey/material/drawable/OvalShadowDrawable;->invalidateSelf()V

    .line 88
    :goto_16
    return v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method

.method public start()V
    .registers 6

    .prologue
    .line 315
    invoke-direct {p0}, Lcom/rey/material/drawable/OvalShadowDrawable;->resetAnimation()V

    .line 316
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x10

    add-long/2addr v1, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/rey/material/drawable/OvalShadowDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 317
    invoke-virtual {p0}, Lcom/rey/material/drawable/OvalShadowDrawable;->invalidateSelf()V

    .line 318
    return-void
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 322
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mRunning:Z

    .line 323
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/rey/material/drawable/OvalShadowDrawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 324
    invoke-virtual {p0}, Lcom/rey/material/drawable/OvalShadowDrawable;->invalidateSelf()V

    .line 325
    return-void
.end method
