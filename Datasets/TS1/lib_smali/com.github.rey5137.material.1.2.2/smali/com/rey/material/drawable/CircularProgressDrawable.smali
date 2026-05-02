.class public Lcom/rey/material/drawable/CircularProgressDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "CircularProgressDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
    }
.end annotation


# static fields
.field private static final PROGRESS_STATE_HIDE:I = -0x1

.field private static final PROGRESS_STATE_KEEP_SHRINK:I = 0x3

.field private static final PROGRESS_STATE_KEEP_STRETCH:I = 0x1

.field private static final PROGRESS_STATE_SHRINK:I = 0x2

.field private static final PROGRESS_STATE_STRETCH:I = 0x0

.field private static final RUN_STATE_RUNNING:I = 0x3

.field private static final RUN_STATE_STARTED:I = 0x2

.field private static final RUN_STATE_STARTING:I = 0x1

.field private static final RUN_STATE_STOPPED:I = 0x0

.field private static final RUN_STATE_STOPPING:I = 0x4


# instance fields
.field private mInAnimationDuration:I

.field private mInColors:[I

.field private mInStepPercent:F

.field private mInitialAngle:F

.field private mKeepDuration:I

.field private mLastProgressStateTime:J

.field private mLastRunStateTime:J

.field private mLastUpdateTime:J

.field private mMaxSweepAngle:F

.field private mMinSweepAngle:F

.field private mOutAnimationDuration:I

.field private mPadding:I

.field private mPaint:Landroid/graphics/Paint;

.field private mProgressMode:I

.field private mProgressPercent:F

.field private mProgressState:I

.field private mRect:Landroid/graphics/RectF;

.field private mReverse:Z

.field private mRotateDuration:I

.field private mRunState:I

.field private mSecondaryProgressPercent:F

.field private mStartAngle:F

.field private mStrokeColorIndex:I

.field private mStrokeColors:[I

.field private mStrokeSecondaryColor:I

.field private mStrokeSize:I

.field private mSweepAngle:F

.field private mTransformDuration:I

.field private mTransformInterpolator:Landroid/view/animation/Interpolator;

.field private final mUpdater:Ljava/lang/Runnable;


# direct methods
.method private constructor <init>(IFFFFFI[IIZIIILandroid/view/animation/Interpolator;IIF[II)V
    .registers 23
    .param p1, "padding"    # I
    .param p2, "initialAngle"    # F
    .param p3, "progressPercent"    # F
    .param p4, "secondaryProgressPercent"    # F
    .param p5, "maxSweepAngle"    # F
    .param p6, "minSweepAngle"    # F
    .param p7, "strokeSize"    # I
    .param p8, "strokeColors"    # [I
    .param p9, "strokeSecondaryColor"    # I
    .param p10, "reverse"    # Z
    .param p11, "rotateDuration"    # I
    .param p12, "transformDuration"    # I
    .param p13, "keepDuration"    # I
    .param p14, "transformInterpolator"    # Landroid/view/animation/Interpolator;
    .param p15, "progressMode"    # I
    .param p16, "inAnimDuration"    # I
    .param p17, "inStepPercent"    # F
    .param p18, "inStepColors"    # [I
    .param p19, "outAnimDuration"    # I

    .prologue
    .line 73
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 39
    const/4 v1, 0x0

    iput v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRunState:I

    .line 461
    new-instance v1, Lcom/rey/material/drawable/CircularProgressDrawable$1;

    invoke-direct {v1, p0}, Lcom/rey/material/drawable/CircularProgressDrawable$1;-><init>(Lcom/rey/material/drawable/CircularProgressDrawable;)V

    iput-object v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mUpdater:Ljava/lang/Runnable;

    .line 74
    iput p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPadding:I

    .line 75
    iput p2, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInitialAngle:F

    .line 76
    invoke-virtual {p0, p3}, Lcom/rey/material/drawable/CircularProgressDrawable;->setProgress(F)V

    .line 77
    invoke-virtual {p0, p4}, Lcom/rey/material/drawable/CircularProgressDrawable;->setSecondaryProgress(F)V

    .line 78
    iput p5, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mMaxSweepAngle:F

    .line 79
    iput p6, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mMinSweepAngle:F

    .line 80
    iput p7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeSize:I

    .line 81
    iput-object p8, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColors:[I

    .line 82
    iput p9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeSecondaryColor:I

    .line 83
    iput-boolean p10, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mReverse:Z

    .line 84
    iput p11, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRotateDuration:I

    .line 85
    iput p12, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mTransformDuration:I

    .line 86
    move/from16 v0, p13

    iput v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mKeepDuration:I

    .line 87
    move-object/from16 v0, p14

    iput-object v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mTransformInterpolator:Landroid/view/animation/Interpolator;

    .line 88
    move/from16 v0, p15

    iput v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressMode:I

    .line 89
    move/from16 v0, p16

    iput v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInAnimationDuration:I

    .line 90
    move/from16 v0, p17

    iput v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInStepPercent:F

    .line 91
    move-object/from16 v0, p18

    iput-object v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInColors:[I

    .line 92
    move/from16 v0, p19

    iput v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mOutAnimationDuration:I

    .line 94
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    .line 95
    iget-object v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 96
    iget-object v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 97
    iget-object v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 99
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRect:Landroid/graphics/RectF;

    .line 100
    return-void
.end method

.method synthetic constructor <init>(IFFFFFI[IIZIIILandroid/view/animation/Interpolator;IIF[IILcom/rey/material/drawable/CircularProgressDrawable$1;)V
    .registers 21
    .param p1, "x0"    # I
    .param p2, "x1"    # F
    .param p3, "x2"    # F
    .param p4, "x3"    # F
    .param p5, "x4"    # F
    .param p6, "x5"    # F
    .param p7, "x6"    # I
    .param p8, "x7"    # [I
    .param p9, "x8"    # I
    .param p10, "x9"    # Z
    .param p11, "x10"    # I
    .param p12, "x11"    # I
    .param p13, "x12"    # I
    .param p14, "x13"    # Landroid/view/animation/Interpolator;
    .param p15, "x14"    # I
    .param p16, "x15"    # I
    .param p17, "x16"    # F
    .param p18, "x17"    # [I
    .param p19, "x18"    # I
    .param p20, "x19"    # Lcom/rey/material/drawable/CircularProgressDrawable$1;

    .prologue
    .line 25
    invoke-direct/range {p0 .. p19}, Lcom/rey/material/drawable/CircularProgressDrawable;-><init>(IFFFFFI[IIZIIILandroid/view/animation/Interpolator;IIF[II)V

    return-void
.end method

.method static synthetic access$000(Lcom/rey/material/drawable/CircularProgressDrawable;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/drawable/CircularProgressDrawable;

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->update()V

    return-void
.end method

.method private drawDeterminate(Landroid/graphics/Canvas;)V
    .registers 16
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 192
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v6

    .line 193
    .local v6, "bounds":Landroid/graphics/Rect;
    const/4 v7, 0x0

    .line 194
    .local v7, "radius":F
    const/4 v8, 0x0

    .line 196
    .local v8, "size":F
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRunState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_81

    .line 197
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeSize:I

    int-to-float v0, v0

    iget v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInAnimationDuration:I

    int-to-long v1, v1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    iget-wide v12, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastRunStateTime:J

    sub-long/2addr v3, v12

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-float v1, v1

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInAnimationDuration:I

    int-to-float v1, v1

    div-float v8, v0, v1

    .line 198
    const/4 v0, 0x0

    cmpl-float v0, v8, v0

    if-lez v0, :cond_44

    .line 199
    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPadding:I

    mul-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeSize:I

    mul-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    int-to-float v0, v0

    add-float/2addr v0, v8

    const/high16 v1, 0x40000000    # 2.0f

    div-float v7, v0, v1

    .line 211
    :cond_44
    :goto_44
    const/4 v0, 0x0

    cmpl-float v0, v7, v0

    if-lez v0, :cond_80

    .line 212
    iget v0, v6, Landroid/graphics/Rect;->left:I

    iget v1, v6, Landroid/graphics/Rect;->right:I

    add-int/2addr v0, v1

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float v10, v0, v1

    .line 213
    .local v10, "x":F
    iget v0, v6, Landroid/graphics/Rect;->top:I

    iget v1, v6, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v0, v1

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float v11, v0, v1

    .line 215
    .local v11, "y":F
    iget-object v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v8}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 216
    iget-object v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 218
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressPercent:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_e5

    .line 219
    iget-object v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColors:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 220
    iget-object v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v10, v11, v7, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 237
    .end local v10    # "x":F
    .end local v11    # "y":F
    :cond_80
    :goto_80
    return-void

    .line 201
    :cond_81
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRunState:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_c3

    .line 202
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeSize:I

    int-to-float v0, v0

    const-wide/16 v1, 0x0

    iget v3, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mOutAnimationDuration:I

    int-to-long v3, v3

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v12

    sub-long/2addr v3, v12

    iget-wide v12, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastRunStateTime:J

    add-long/2addr v3, v12

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    long-to-float v1, v1

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mOutAnimationDuration:I

    int-to-float v1, v1

    div-float v8, v0, v1

    .line 203
    const/4 v0, 0x0

    cmpl-float v0, v8, v0

    if-lez v0, :cond_44

    .line 204
    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPadding:I

    mul-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeSize:I

    mul-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    int-to-float v0, v0

    add-float/2addr v0, v8

    const/high16 v1, 0x40000000    # 2.0f

    div-float v7, v0, v1

    goto :goto_44

    .line 206
    :cond_c3
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRunState:I

    if-eqz v0, :cond_44

    .line 207
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeSize:I

    int-to-float v8, v0

    .line 208
    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPadding:I

    mul-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeSize:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float v7, v0, v1

    goto/16 :goto_44

    .line 222
    .restart local v10    # "x":F
    .restart local v11    # "y":F
    :cond_e5
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressPercent:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_f9

    .line 223
    iget-object v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeSecondaryColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 224
    iget-object v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v10, v11, v7, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_80

    .line 227
    :cond_f9
    iget-boolean v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mReverse:Z

    if-eqz v0, :cond_146

    const/16 v0, -0x168

    :goto_ff
    int-to-float v0, v0

    iget v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressPercent:F

    mul-float v9, v0, v1

    .line 229
    .local v9, "sweepAngle":F
    iget-object v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRect:Landroid/graphics/RectF;

    sub-float v1, v10, v7

    sub-float v2, v11, v7

    add-float v3, v10, v7

    add-float v4, v11, v7

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 230
    iget-object v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeSecondaryColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 231
    iget-object v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRect:Landroid/graphics/RectF;

    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStartAngle:F

    add-float v2, v0, v9

    iget-boolean v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mReverse:Z

    if-eqz v0, :cond_149

    const/16 v0, -0x168

    :goto_124
    int-to-float v0, v0

    sub-float v3, v0, v9

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 233
    iget-object v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColors:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 234
    iget-object v1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRect:Landroid/graphics/RectF;

    iget v2, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStartAngle:F

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v3, v9

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    goto/16 :goto_80

    .line 227
    .end local v9    # "sweepAngle":F
    :cond_146
    const/16 v0, 0x168

    goto :goto_ff

    .line 231
    .restart local v9    # "sweepAngle":F
    :cond_149
    const/16 v0, 0x168

    goto :goto_124
.end method

.method private drawIndeterminate(Landroid/graphics/Canvas;)V
    .registers 25
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 250
    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRunState:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_165

    .line 251
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v9

    .line 252
    .local v9, "bounds":Landroid/graphics/Rect;
    iget v3, v9, Landroid/graphics/Rect;->left:I

    iget v4, v9, Landroid/graphics/Rect;->right:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float v19, v3, v4

    .line 253
    .local v19, "x":F
    iget v3, v9, Landroid/graphics/Rect;->top:I

    iget v4, v9, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float v20, v3, v4

    .line 254
    .local v20, "y":F
    invoke-virtual {v9}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPadding:I

    mul-int/lit8 v4, v4, 0x2

    sub-int/2addr v3, v4

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float v12, v3, v4

    .line 256
    .local v12, "maxRadius":F
    const/high16 v3, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInStepPercent:F

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInColors:[I

    array-length v5, v5

    add-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    mul-float/2addr v4, v5

    const/high16 v5, 0x3f800000    # 1.0f

    add-float/2addr v4, v5

    div-float v16, v3, v4

    .line 257
    .local v16, "stepTime":F
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastRunStateTime:J

    sub-long/2addr v3, v5

    long-to-float v3, v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInAnimationDuration:I

    int-to-float v4, v4

    div-float v18, v3, v4

    .line 258
    .local v18, "time":F
    div-float v17, v18, v16

    .line 260
    .local v17, "steps":F
    const/4 v13, 0x0

    .line 261
    .local v13, "outerRadius":F
    const/4 v11, 0x0

    .line 263
    .local v11, "innerRadius":F
    move/from16 v0, v17

    float-to-double v3, v0

    invoke-static {v3, v4}, Ljava/lang/Math;->floor(D)D

    move-result-wide v3

    double-to-int v10, v3

    .local v10, "i":I
    :goto_68
    if-ltz v10, :cond_f4

    .line 264
    move v11, v13

    .line 265
    const/high16 v3, 0x3f800000    # 1.0f

    int-to-float v4, v10

    sub-float v4, v17, v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInStepPercent:F

    mul-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    mul-float v13, v3, v12

    .line 267
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInColors:[I

    array-length v3, v3

    if-lt v10, v3, :cond_85

    .line 263
    :goto_82
    add-int/lit8 v10, v10, -0x1

    goto :goto_68

    .line 270
    :cond_85
    const/4 v3, 0x0

    cmpl-float v3, v11, v3

    if-nez v3, :cond_ae

    .line 271
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInColors:[I

    aget v4, v4, v10

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 272
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 273
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2, v13, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_82

    .line 275
    :cond_ae
    cmpl-float v3, v13, v11

    if-lez v3, :cond_f4

    .line 276
    add-float v3, v11, v13

    const/high16 v4, 0x40000000    # 2.0f

    div-float v14, v3, v4

    .line 277
    .local v14, "radius":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRect:Landroid/graphics/RectF;

    sub-float v4, v19, v14

    sub-float v5, v20, v14

    add-float v6, v19, v14

    add-float v7, v20, v14

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 279
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    sub-float v4, v13, v11

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 280
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 281
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInColors:[I

    aget v4, v4, v10

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 283
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2, v14, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_82

    .line 289
    .end local v14    # "radius":F
    :cond_f4
    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressState:I

    const/4 v4, -0x1

    if-ne v3, v4, :cond_115

    .line 290
    const/high16 v3, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInStepPercent:F

    div-float/2addr v3, v4

    cmpl-float v3, v17, v3

    if-gez v3, :cond_10c

    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v3, v18, v3

    if-ltz v3, :cond_114

    .line 291
    :cond_10c
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->resetAnimation()V

    .line 292
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressState:I

    .line 336
    .end local v9    # "bounds":Landroid/graphics/Rect;
    .end local v10    # "i":I
    .end local v11    # "innerRadius":F
    .end local v12    # "maxRadius":F
    .end local v13    # "outerRadius":F
    .end local v16    # "stepTime":F
    .end local v17    # "steps":F
    .end local v18    # "time":F
    .end local v19    # "x":F
    .end local v20    # "y":F
    :cond_114
    :goto_114
    return-void

    .line 296
    .restart local v9    # "bounds":Landroid/graphics/Rect;
    .restart local v10    # "i":I
    .restart local v11    # "innerRadius":F
    .restart local v12    # "maxRadius":F
    .restart local v13    # "outerRadius":F
    .restart local v16    # "stepTime":F
    .restart local v17    # "steps":F
    .restart local v18    # "time":F
    .restart local v19    # "x":F
    .restart local v20    # "y":F
    :cond_115
    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeSize:I

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    sub-float v14, v12, v3

    .line 298
    .restart local v14    # "radius":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRect:Landroid/graphics/RectF;

    sub-float v4, v19, v14

    sub-float v5, v20, v14

    add-float v6, v19, v14

    add-float v7, v20, v14

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 299
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeSize:I

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 300
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 301
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-direct/range {p0 .. p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->getIndeterminateStrokeColor()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 303
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStartAngle:F

    move-object/from16 v0, p0

    iget v6, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mSweepAngle:F

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v3, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    goto :goto_114

    .line 306
    .end local v9    # "bounds":Landroid/graphics/Rect;
    .end local v10    # "i":I
    .end local v11    # "innerRadius":F
    .end local v12    # "maxRadius":F
    .end local v13    # "outerRadius":F
    .end local v14    # "radius":F
    .end local v16    # "stepTime":F
    .end local v17    # "steps":F
    .end local v18    # "time":F
    .end local v19    # "x":F
    .end local v20    # "y":F
    :cond_165
    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRunState:I

    const/4 v4, 0x4

    if-ne v3, v4, :cond_212

    .line 307
    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeSize:I

    int-to-float v3, v3

    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iget v6, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mOutAnimationDuration:I

    int-to-long v6, v6

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v21

    sub-long v6, v6, v21

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastRunStateTime:J

    move-wide/from16 v21, v0

    add-long v6, v6, v21

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    long-to-float v4, v4

    mul-float/2addr v3, v4

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mOutAnimationDuration:I

    int-to-float v4, v4

    div-float v15, v3, v4

    .line 309
    .local v15, "size":F
    const/4 v3, 0x0

    cmpl-float v3, v15, v3

    if-lez v3, :cond_114

    .line 310
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v9

    .line 311
    .restart local v9    # "bounds":Landroid/graphics/Rect;
    invoke-virtual {v9}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPadding:I

    mul-int/lit8 v4, v4, 0x2

    sub-int/2addr v3, v4

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeSize:I

    mul-int/lit8 v4, v4, 0x2

    sub-int/2addr v3, v4

    int-to-float v3, v3

    add-float/2addr v3, v15

    const/high16 v4, 0x40000000    # 2.0f

    div-float v14, v3, v4

    .line 312
    .restart local v14    # "radius":F
    iget v3, v9, Landroid/graphics/Rect;->left:I

    iget v4, v9, Landroid/graphics/Rect;->right:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float v19, v3, v4

    .line 313
    .restart local v19    # "x":F
    iget v3, v9, Landroid/graphics/Rect;->top:I

    iget v4, v9, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float v20, v3, v4

    .line 315
    .restart local v20    # "y":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRect:Landroid/graphics/RectF;

    sub-float v4, v19, v14

    sub-float v5, v20, v14

    add-float v6, v19, v14

    add-float v7, v20, v14

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 316
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v15}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 317
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 318
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-direct/range {p0 .. p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->getIndeterminateStrokeColor()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 320
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStartAngle:F

    move-object/from16 v0, p0

    iget v6, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mSweepAngle:F

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v3, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    goto/16 :goto_114

    .line 323
    .end local v9    # "bounds":Landroid/graphics/Rect;
    .end local v14    # "radius":F
    .end local v15    # "size":F
    .end local v19    # "x":F
    .end local v20    # "y":F
    :cond_212
    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRunState:I

    if-eqz v3, :cond_114

    .line 324
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v9

    .line 325
    .restart local v9    # "bounds":Landroid/graphics/Rect;
    invoke-virtual {v9}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPadding:I

    mul-int/lit8 v4, v4, 0x2

    sub-int/2addr v3, v4

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeSize:I

    sub-int/2addr v3, v4

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float v14, v3, v4

    .line 326
    .restart local v14    # "radius":F
    iget v3, v9, Landroid/graphics/Rect;->left:I

    iget v4, v9, Landroid/graphics/Rect;->right:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float v19, v3, v4

    .line 327
    .restart local v19    # "x":F
    iget v3, v9, Landroid/graphics/Rect;->top:I

    iget v4, v9, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float v20, v3, v4

    .line 329
    .restart local v20    # "y":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRect:Landroid/graphics/RectF;

    sub-float v4, v19, v14

    sub-float v5, v20, v14

    add-float v6, v19, v14

    add-float v7, v20, v14

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 330
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeSize:I

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 331
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 332
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-direct/range {p0 .. p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->getIndeterminateStrokeColor()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 334
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStartAngle:F

    move-object/from16 v0, p0

    iget v6, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mSweepAngle:F

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v3, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    goto/16 :goto_114
.end method

.method private getIndeterminateStrokeColor()I
    .registers 9

    .prologue
    .line 240
    iget v2, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressState:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_b

    iget-object v2, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColors:[I

    array-length v2, v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_12

    .line 241
    :cond_b
    iget-object v2, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColors:[I

    iget v3, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColorIndex:I

    aget v2, v2, v3

    .line 246
    :goto_11
    return v2

    .line 243
    :cond_12
    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastProgressStateTime:J

    sub-long/2addr v4, v6

    long-to-float v4, v4

    iget v5, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mKeepDuration:I

    int-to-float v5, v5

    div-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 244
    .local v1, "value":F
    iget v2, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColorIndex:I

    if-nez v2, :cond_41

    iget-object v2, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColors:[I

    array-length v2, v2

    add-int/lit8 v0, v2, -0x1

    .line 246
    .local v0, "prev_index":I
    :goto_32
    iget-object v2, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColors:[I

    aget v2, v2, v0

    iget-object v3, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColors:[I

    iget v4, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColorIndex:I

    aget v3, v3, v4

    invoke-static {v2, v3, v1}, Lcom/rey/material/util/ColorUtil;->getMiddleColor(IIF)I

    move-result v2

    goto :goto_11

    .line 244
    .end local v0    # "prev_index":I
    :cond_41
    iget v2, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColorIndex:I

    add-int/lit8 v0, v2, -0x1

    goto :goto_32
.end method

.method private resetAnimation()V
    .registers 3

    .prologue
    .line 397
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastUpdateTime:J

    .line 398
    iget-wide v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastUpdateTime:J

    iput-wide v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastProgressStateTime:J

    .line 399
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInitialAngle:F

    iput v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStartAngle:F

    .line 400
    const/4 v0, 0x0

    iput v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColorIndex:I

    .line 401
    iget-boolean v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mReverse:Z

    if-eqz v0, :cond_1b

    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mMinSweepAngle:F

    neg-float v0, v0

    :goto_18
    iput v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mSweepAngle:F

    .line 402
    return-void

    .line 401
    :cond_1b
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mMinSweepAngle:F

    goto :goto_18
.end method

.method private start(Z)V
    .registers 7
    .param p1, "withAnimation"    # Z

    .prologue
    .line 415
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 428
    :goto_6
    return-void

    .line 418
    :cond_7
    invoke-direct {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->resetAnimation()V

    .line 420
    if-eqz p1, :cond_18

    .line 421
    const/4 v0, 0x1

    iput v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRunState:I

    .line 422
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastRunStateTime:J

    .line 423
    const/4 v0, -0x1

    iput v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressState:I

    .line 426
    :cond_18
    iget-object v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x10

    add-long/2addr v1, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/rey/material/drawable/CircularProgressDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 427
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->invalidateSelf()V

    goto :goto_6
.end method

.method private stop(Z)V
    .registers 7
    .param p1, "withAnimation"    # Z

    .prologue
    .line 431
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->isRunning()Z

    move-result v0

    if-nez v0, :cond_7

    .line 447
    :goto_6
    return-void

    .line 434
    :cond_7
    if-eqz p1, :cond_27

    .line 435
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastRunStateTime:J

    .line 436
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRunState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_23

    .line 437
    iget-object v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x10

    add-long/2addr v1, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/rey/material/drawable/CircularProgressDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 438
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->invalidateSelf()V

    .line 440
    :cond_23
    const/4 v0, 0x4

    iput v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRunState:I

    goto :goto_6

    .line 443
    :cond_27
    const/4 v0, 0x0

    iput v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRunState:I

    .line 444
    iget-object v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/rey/material/drawable/CircularProgressDrawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 445
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->invalidateSelf()V

    goto :goto_6
.end method

.method private update()V
    .registers 2

    .prologue
    .line 471
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressMode:I

    packed-switch v0, :pswitch_data_e

    .line 479
    :goto_5
    return-void

    .line 473
    :pswitch_6
    invoke-direct {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->updateDeterminate()V

    goto :goto_5

    .line 476
    :pswitch_a
    invoke-direct {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->updateIndeterminate()V

    goto :goto_5

    .line 471
    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_6
        :pswitch_a
    .end packed-switch
.end method

.method private updateDeterminate()V
    .registers 9

    .prologue
    .line 482
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 483
    .local v0, "curTime":J
    iget-wide v3, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastUpdateTime:J

    sub-long v3, v0, v3

    long-to-float v3, v3

    const/high16 v4, 0x43b40000    # 360.0f

    mul-float/2addr v3, v4

    iget v4, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRotateDuration:I

    int-to-float v4, v4

    div-float v2, v3, v4

    .line 484
    .local v2, "rotateOffset":F
    iget-boolean v3, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mReverse:Z

    if-eqz v3, :cond_16

    .line 485
    neg-float v2, v2

    .line 486
    :cond_16
    iput-wide v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastUpdateTime:J

    .line 488
    iget v3, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStartAngle:F

    add-float/2addr v3, v2

    iput v3, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStartAngle:F

    .line 490
    iget v3, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRunState:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_46

    .line 491
    iget-wide v3, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastRunStateTime:J

    sub-long v3, v0, v3

    iget v5, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInAnimationDuration:I

    int-to-long v5, v5

    cmp-long v3, v3, v5

    if-lez v3, :cond_30

    .line 492
    const/4 v3, 0x3

    iput v3, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRunState:I

    .line 502
    :cond_30
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->isRunning()Z

    move-result v3

    if-eqz v3, :cond_42

    .line 503
    iget-object v3, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    const-wide/16 v6, 0x10

    add-long/2addr v4, v6

    invoke-virtual {p0, v3, v4, v5}, Lcom/rey/material/drawable/CircularProgressDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 505
    :cond_42
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->invalidateSelf()V

    .line 506
    :goto_45
    return-void

    .line 495
    :cond_46
    iget v3, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRunState:I

    const/4 v4, 0x4

    if-ne v3, v4, :cond_30

    .line 496
    iget-wide v3, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastRunStateTime:J

    sub-long v3, v0, v3

    iget v5, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mOutAnimationDuration:I

    int-to-long v5, v5

    cmp-long v3, v3, v5

    if-lez v3, :cond_30

    .line 497
    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lcom/rey/material/drawable/CircularProgressDrawable;->stop(Z)V

    goto :goto_45
.end method

.method private updateIndeterminate()V
    .registers 15

    .prologue
    const/4 v13, 0x3

    const/4 v12, 0x1

    const/4 v11, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    .line 510
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 511
    .local v0, "curTime":J
    iget-wide v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastUpdateTime:J

    sub-long v7, v0, v7

    long-to-float v7, v7

    const/high16 v8, 0x43b40000    # 360.0f

    mul-float/2addr v7, v8

    iget v8, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRotateDuration:I

    int-to-float v8, v8

    div-float v5, v7, v8

    .line 512
    .local v5, "rotateOffset":F
    iget-boolean v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mReverse:Z

    if-eqz v7, :cond_1b

    .line 513
    neg-float v5, v5

    .line 514
    :cond_1b
    iput-wide v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastUpdateTime:J

    .line 516
    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressState:I

    packed-switch v7, :pswitch_data_15a

    .line 582
    :cond_22
    :goto_22
    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRunState:I

    if-ne v7, v12, :cond_145

    .line 583
    iget-wide v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastRunStateTime:J

    sub-long v7, v0, v7

    iget v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInAnimationDuration:I

    int-to-long v9, v9

    cmp-long v7, v7, v9

    if-lez v7, :cond_3d

    .line 584
    iput v13, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRunState:I

    .line 585
    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressState:I

    const/4 v8, -0x1

    if-ne v7, v8, :cond_3d

    .line 586
    invoke-direct {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->resetAnimation()V

    .line 587
    iput v11, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressState:I

    .line 598
    :cond_3d
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->isRunning()Z

    move-result v7

    if-eqz v7, :cond_4f

    .line 599
    iget-object v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    const-wide/16 v10, 0x10

    add-long/2addr v8, v10

    invoke-virtual {p0, v7, v8, v9}, Lcom/rey/material/drawable/CircularProgressDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 601
    :cond_4f
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->invalidateSelf()V

    .line 602
    :goto_52
    return-void

    .line 518
    :pswitch_53
    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mTransformDuration:I

    if-gtz v7, :cond_6d

    .line 519
    iget-boolean v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mReverse:Z

    if-eqz v7, :cond_6a

    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mMinSweepAngle:F

    neg-float v7, v7

    :goto_5e
    iput v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mSweepAngle:F

    .line 520
    iput v12, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressState:I

    .line 521
    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStartAngle:F

    add-float/2addr v7, v5

    iput v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStartAngle:F

    .line 522
    iput-wide v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastProgressStateTime:J

    goto :goto_22

    .line 519
    :cond_6a
    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mMinSweepAngle:F

    goto :goto_5e

    .line 525
    :cond_6d
    iget-wide v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastProgressStateTime:J

    sub-long v7, v0, v7

    long-to-float v7, v7

    iget v8, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mTransformDuration:I

    int-to-float v8, v8

    div-float v6, v7, v8

    .line 526
    .local v6, "value":F
    iget-boolean v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mReverse:Z

    if-eqz v7, :cond_a1

    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mMaxSweepAngle:F

    neg-float v2, v7

    .line 527
    .local v2, "maxAngle":F
    :goto_7e
    iget-boolean v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mReverse:Z

    if-eqz v7, :cond_a4

    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mMinSweepAngle:F

    neg-float v3, v7

    .line 529
    .local v3, "minAngle":F
    :goto_85
    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStartAngle:F

    add-float/2addr v7, v5

    iput v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStartAngle:F

    .line 530
    iget-object v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mTransformInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v7, v6}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v7

    sub-float v8, v2, v3

    mul-float/2addr v7, v8

    add-float/2addr v7, v3

    iput v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mSweepAngle:F

    .line 532
    cmpl-float v7, v6, v9

    if-lez v7, :cond_22

    .line 533
    iput v2, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mSweepAngle:F

    .line 534
    iput v12, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressState:I

    .line 535
    iput-wide v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastProgressStateTime:J

    goto :goto_22

    .line 526
    .end local v2    # "maxAngle":F
    .end local v3    # "minAngle":F
    :cond_a1
    iget v2, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mMaxSweepAngle:F

    goto :goto_7e

    .line 527
    .restart local v2    # "maxAngle":F
    :cond_a4
    iget v3, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mMinSweepAngle:F

    goto :goto_85

    .line 540
    .end local v2    # "maxAngle":F
    .end local v6    # "value":F
    :pswitch_a7
    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStartAngle:F

    add-float/2addr v7, v5

    iput v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStartAngle:F

    .line 542
    iget-wide v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastProgressStateTime:J

    sub-long v7, v0, v7

    iget v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mKeepDuration:I

    int-to-long v9, v9

    cmp-long v7, v7, v9

    if-lez v7, :cond_22

    .line 543
    const/4 v7, 0x2

    iput v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressState:I

    .line 544
    iput-wide v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastProgressStateTime:J

    goto/16 :goto_22

    .line 548
    :pswitch_be
    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mTransformDuration:I

    if-gtz v7, :cond_e3

    .line 549
    iget-boolean v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mReverse:Z

    if-eqz v7, :cond_e0

    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mMinSweepAngle:F

    neg-float v7, v7

    :goto_c9
    iput v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mSweepAngle:F

    .line 550
    iput v13, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressState:I

    .line 551
    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStartAngle:F

    add-float/2addr v7, v5

    iput v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStartAngle:F

    .line 552
    iput-wide v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastProgressStateTime:J

    .line 553
    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColorIndex:I

    add-int/lit8 v7, v7, 0x1

    iget-object v8, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColors:[I

    array-length v8, v8

    rem-int/2addr v7, v8

    iput v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColorIndex:I

    goto/16 :goto_22

    .line 549
    :cond_e0
    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mMinSweepAngle:F

    goto :goto_c9

    .line 556
    :cond_e3
    iget-wide v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastProgressStateTime:J

    sub-long v7, v0, v7

    long-to-float v7, v7

    iget v8, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mTransformDuration:I

    int-to-float v8, v8

    div-float v6, v7, v8

    .line 557
    .restart local v6    # "value":F
    iget-boolean v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mReverse:Z

    if-eqz v7, :cond_129

    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mMaxSweepAngle:F

    neg-float v2, v7

    .line 558
    .restart local v2    # "maxAngle":F
    :goto_f4
    iget-boolean v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mReverse:Z

    if-eqz v7, :cond_12c

    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mMinSweepAngle:F

    neg-float v3, v7

    .line 560
    .restart local v3    # "minAngle":F
    :goto_fb
    iget-object v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mTransformInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v7, v6}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v7

    sub-float v7, v9, v7

    sub-float v8, v2, v3

    mul-float/2addr v7, v8

    add-float v4, v7, v3

    .line 561
    .local v4, "newSweepAngle":F
    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStartAngle:F

    iget v8, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mSweepAngle:F

    add-float/2addr v8, v5

    sub-float/2addr v8, v4

    add-float/2addr v7, v8

    iput v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStartAngle:F

    .line 562
    iput v4, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mSweepAngle:F

    .line 564
    cmpl-float v7, v6, v9

    if-lez v7, :cond_22

    .line 565
    iput v3, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mSweepAngle:F

    .line 566
    iput v13, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressState:I

    .line 567
    iput-wide v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastProgressStateTime:J

    .line 568
    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColorIndex:I

    add-int/lit8 v7, v7, 0x1

    iget-object v8, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColors:[I

    array-length v8, v8

    rem-int/2addr v7, v8

    iput v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColorIndex:I

    goto/16 :goto_22

    .line 557
    .end local v2    # "maxAngle":F
    .end local v3    # "minAngle":F
    .end local v4    # "newSweepAngle":F
    :cond_129
    iget v2, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mMaxSweepAngle:F

    goto :goto_f4

    .line 558
    .restart local v2    # "maxAngle":F
    :cond_12c
    iget v3, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mMinSweepAngle:F

    goto :goto_fb

    .line 573
    .end local v2    # "maxAngle":F
    .end local v6    # "value":F
    :pswitch_12f
    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStartAngle:F

    add-float/2addr v7, v5

    iput v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStartAngle:F

    .line 575
    iget-wide v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastProgressStateTime:J

    sub-long v7, v0, v7

    iget v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mKeepDuration:I

    int-to-long v9, v9

    cmp-long v7, v7, v9

    if-lez v7, :cond_22

    .line 576
    iput v11, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressState:I

    .line 577
    iput-wide v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastProgressStateTime:J

    goto/16 :goto_22

    .line 591
    :cond_145
    iget v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRunState:I

    const/4 v8, 0x4

    if-ne v7, v8, :cond_3d

    .line 592
    iget-wide v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mLastRunStateTime:J

    sub-long v7, v0, v7

    iget v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mOutAnimationDuration:I

    int-to-long v9, v9

    cmp-long v7, v7, v9

    if-lez v7, :cond_3d

    .line 593
    invoke-direct {p0, v11}, Lcom/rey/material/drawable/CircularProgressDrawable;->stop(Z)V

    goto/16 :goto_52

    .line 516
    :pswitch_data_15a
    .packed-switch 0x0
        :pswitch_53
        :pswitch_a7
        :pswitch_be
        :pswitch_12f
    .end packed-switch
.end method


# virtual methods
.method public applyStyle(Landroid/content/Context;I)V
    .registers 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resId"    # I

    .prologue
    const/4 v12, 0x0

    const/4 v11, 0x0

    .line 103
    sget-object v9, Lcom/rey/material/R$styleable;->CircularProgressDrawable:[I

    invoke-virtual {p1, p2, v9}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 105
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v5, 0x0

    .line 106
    .local v5, "strokeColor":I
    const/4 v6, 0x0

    .line 107
    .local v6, "strokeColorDefined":Z
    const/4 v7, 0x0

    .line 109
    .local v7, "strokeColors":[I
    const/4 v3, 0x0

    .local v3, "i":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v2

    .local v2, "count":I
    :goto_10
    if-ge v3, v2, :cond_149

    .line 110
    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v1

    .line 112
    .local v1, "attr":I
    sget v9, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_padding:I

    if-ne v1, v9, :cond_23

    .line 113
    invoke-virtual {v0, v1, v11}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v9

    iput v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPadding:I

    .line 109
    :cond_20
    :goto_20
    add-int/lit8 v3, v3, 0x1

    goto :goto_10

    .line 114
    :cond_23
    sget v9, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_initialAngle:I

    if-ne v1, v9, :cond_2f

    .line 115
    invoke-virtual {v0, v1, v11}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v9

    int-to-float v9, v9

    iput v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInitialAngle:F

    goto :goto_20

    .line 116
    :cond_2f
    sget v9, Lcom/rey/material/R$styleable;->CircularProgressDrawable_pv_progress:I

    if-ne v1, v9, :cond_3b

    .line 117
    invoke-virtual {v0, v1, v12}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v9

    invoke-virtual {p0, v9}, Lcom/rey/material/drawable/CircularProgressDrawable;->setProgress(F)V

    goto :goto_20

    .line 118
    :cond_3b
    sget v9, Lcom/rey/material/R$styleable;->CircularProgressDrawable_pv_secondaryProgress:I

    if-ne v1, v9, :cond_47

    .line 119
    invoke-virtual {v0, v1, v12}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v9

    invoke-virtual {p0, v9}, Lcom/rey/material/drawable/CircularProgressDrawable;->setSecondaryProgress(F)V

    goto :goto_20

    .line 120
    :cond_47
    sget v9, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_maxSweepAngle:I

    if-ne v1, v9, :cond_53

    .line 121
    invoke-virtual {v0, v1, v11}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v9

    int-to-float v9, v9

    iput v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mMaxSweepAngle:F

    goto :goto_20

    .line 122
    :cond_53
    sget v9, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_minSweepAngle:I

    if-ne v1, v9, :cond_5f

    .line 123
    invoke-virtual {v0, v1, v11}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v9

    int-to-float v9, v9

    iput v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mMinSweepAngle:F

    goto :goto_20

    .line 124
    :cond_5f
    sget v9, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_strokeSize:I

    if-ne v1, v9, :cond_6a

    .line 125
    invoke-virtual {v0, v1, v11}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v9

    iput v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeSize:I

    goto :goto_20

    .line 126
    :cond_6a
    sget v9, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_strokeColor:I

    if-ne v1, v9, :cond_74

    .line 127
    invoke-virtual {v0, v1, v11}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v5

    .line 128
    const/4 v6, 0x1

    goto :goto_20

    .line 130
    :cond_74
    sget v9, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_strokeColors:I

    if-ne v1, v9, :cond_9e

    .line 131
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v0, v1, v11}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v10

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v8

    .line 132
    .local v8, "ta":Landroid/content/res/TypedArray;
    invoke-virtual {v8}, Landroid/content/res/TypedArray;->length()I

    move-result v9

    new-array v7, v9, [I

    .line 133
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_8b
    invoke-virtual {v8}, Landroid/content/res/TypedArray;->length()I

    move-result v9

    if-ge v4, v9, :cond_9a

    .line 134
    invoke-virtual {v8, v4, v11}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v9

    aput v9, v7, v4

    .line 133
    add-int/lit8 v4, v4, 0x1

    goto :goto_8b

    .line 135
    :cond_9a
    invoke-virtual {v8}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_20

    .line 137
    .end local v4    # "j":I
    .end local v8    # "ta":Landroid/content/res/TypedArray;
    :cond_9e
    sget v9, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_strokeSecondaryColor:I

    if-ne v1, v9, :cond_aa

    .line 138
    invoke-virtual {v0, v1, v11}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v9

    iput v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeSecondaryColor:I

    goto/16 :goto_20

    .line 139
    :cond_aa
    sget v9, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_reverse:I

    if-ne v1, v9, :cond_b6

    .line 140
    invoke-virtual {v0, v1, v11}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v9

    iput-boolean v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mReverse:Z

    goto/16 :goto_20

    .line 141
    :cond_b6
    sget v9, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_rotateDuration:I

    if-ne v1, v9, :cond_c2

    .line 142
    invoke-virtual {v0, v1, v11}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v9

    iput v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRotateDuration:I

    goto/16 :goto_20

    .line 143
    :cond_c2
    sget v9, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_transformDuration:I

    if-ne v1, v9, :cond_ce

    .line 144
    invoke-virtual {v0, v1, v11}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v9

    iput v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mTransformDuration:I

    goto/16 :goto_20

    .line 145
    :cond_ce
    sget v9, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_keepDuration:I

    if-ne v1, v9, :cond_da

    .line 146
    invoke-virtual {v0, v1, v11}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v9

    iput v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mKeepDuration:I

    goto/16 :goto_20

    .line 147
    :cond_da
    sget v9, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_transformInterpolator:I

    if-ne v1, v9, :cond_ea

    .line 148
    invoke-virtual {v0, v1, v11}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v9

    invoke-static {p1, v9}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v9

    iput-object v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mTransformInterpolator:Landroid/view/animation/Interpolator;

    goto/16 :goto_20

    .line 149
    :cond_ea
    sget v9, Lcom/rey/material/R$styleable;->CircularProgressDrawable_pv_progressMode:I

    if-ne v1, v9, :cond_f6

    .line 150
    invoke-virtual {v0, v1, v11}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v9

    iput v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressMode:I

    goto/16 :goto_20

    .line 151
    :cond_f6
    sget v9, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_inAnimDuration:I

    if-ne v1, v9, :cond_102

    .line 152
    invoke-virtual {v0, v1, v11}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v9

    iput v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInAnimationDuration:I

    goto/16 :goto_20

    .line 153
    :cond_102
    sget v9, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_inStepColors:I

    if-ne v1, v9, :cond_131

    .line 154
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v0, v1, v11}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v10

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v8

    .line 155
    .restart local v8    # "ta":Landroid/content/res/TypedArray;
    invoke-virtual {v8}, Landroid/content/res/TypedArray;->length()I

    move-result v9

    new-array v9, v9, [I

    iput-object v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInColors:[I

    .line 156
    const/4 v4, 0x0

    .restart local v4    # "j":I
    :goto_11b
    invoke-virtual {v8}, Landroid/content/res/TypedArray;->length()I

    move-result v9

    if-ge v4, v9, :cond_12c

    .line 157
    iget-object v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInColors:[I

    invoke-virtual {v8, v4, v11}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v10

    aput v10, v9, v4

    .line 156
    add-int/lit8 v4, v4, 0x1

    goto :goto_11b

    .line 158
    :cond_12c
    invoke-virtual {v8}, Landroid/content/res/TypedArray;->recycle()V

    goto/16 :goto_20

    .line 160
    .end local v4    # "j":I
    .end local v8    # "ta":Landroid/content/res/TypedArray;
    :cond_131
    sget v9, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_inStepPercent:I

    if-ne v1, v9, :cond_13d

    .line 161
    invoke-virtual {v0, v1, v12}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v9

    iput v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInStepPercent:F

    goto/16 :goto_20

    .line 162
    :cond_13d
    sget v9, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_outAnimDuration:I

    if-ne v1, v9, :cond_20

    .line 163
    invoke-virtual {v0, v1, v11}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v9

    iput v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mOutAnimationDuration:I

    goto/16 :goto_20

    .line 166
    .end local v1    # "attr":I
    :cond_149
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 168
    if-eqz v7, :cond_15d

    .line 169
    iput-object v7, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColors:[I

    .line 173
    :cond_150
    :goto_150
    iget v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColorIndex:I

    iget-object v10, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColors:[I

    array-length v10, v10

    if-lt v9, v10, :cond_159

    .line 174
    iput v11, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColorIndex:I

    .line 176
    :cond_159
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->invalidateSelf()V

    .line 177
    return-void

    .line 170
    :cond_15d
    if-eqz v6, :cond_150

    .line 171
    const/4 v9, 0x1

    new-array v9, v9, [I

    aput v5, v9, v11

    iput-object v9, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mStrokeColors:[I

    goto :goto_150
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 181
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressMode:I

    packed-switch v0, :pswitch_data_e

    .line 189
    :goto_5
    return-void

    .line 183
    :pswitch_6
    invoke-direct {p0, p1}, Lcom/rey/material/drawable/CircularProgressDrawable;->drawDeterminate(Landroid/graphics/Canvas;)V

    goto :goto_5

    .line 186
    :pswitch_a
    invoke-direct {p0, p1}, Lcom/rey/material/drawable/CircularProgressDrawable;->drawIndeterminate(Landroid/graphics/Canvas;)V

    goto :goto_5

    .line 181
    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_6
        :pswitch_a
    .end packed-switch
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 350
    const/4 v0, -0x3

    return v0
.end method

.method public getProgress()F
    .registers 2

    .prologue
    .line 365
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressPercent:F

    return v0
.end method

.method public getProgressMode()I
    .registers 2

    .prologue
    .line 354
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressMode:I

    return v0
.end method

.method public getSecondaryProgress()F
    .registers 2

    .prologue
    .line 369
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mSecondaryProgressPercent:F

    return v0
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 451
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRunState:I

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public scheduleSelf(Ljava/lang/Runnable;J)V
    .registers 5
    .param p1, "what"    # Ljava/lang/Runnable;
    .param p2, "when"    # J

    .prologue
    .line 456
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRunState:I

    if-nez v0, :cond_b

    .line 457
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInAnimationDuration:I

    if-lez v0, :cond_f

    const/4 v0, 0x1

    :goto_9
    iput v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mRunState:I

    .line 458
    :cond_b
    invoke-super {p0, p1, p2, p3}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 459
    return-void

    .line 457
    :cond_f
    const/4 v0, 0x3

    goto :goto_9
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 340
    iget-object v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 341
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 345
    iget-object v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 346
    return-void
.end method

.method public setProgress(F)V
    .registers 5
    .param p1, "percent"    # F

    .prologue
    const/4 v2, 0x0

    .line 373
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v2, p1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    .line 374
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressPercent:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_1c

    .line 375
    iput p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressPercent:F

    .line 376
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 377
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->invalidateSelf()V

    .line 381
    :cond_1c
    :goto_1c
    return-void

    .line 378
    :cond_1d
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressPercent:F

    cmpl-float v0, v0, v2

    if-eqz v0, :cond_1c

    .line 379
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->start()V

    goto :goto_1c
.end method

.method public setProgressMode(I)V
    .registers 3
    .param p1, "mode"    # I

    .prologue
    .line 358
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressMode:I

    if-eq v0, p1, :cond_9

    .line 359
    iput p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mProgressMode:I

    .line 360
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->invalidateSelf()V

    .line 362
    :cond_9
    return-void
.end method

.method public setSecondaryProgress(F)V
    .registers 5
    .param p1, "percent"    # F

    .prologue
    const/4 v2, 0x0

    .line 384
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v2, p1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    .line 385
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mSecondaryProgressPercent:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_1c

    .line 386
    iput p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mSecondaryProgressPercent:F

    .line 387
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 388
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->invalidateSelf()V

    .line 392
    :cond_1c
    :goto_1c
    return-void

    .line 389
    :cond_1d
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mSecondaryProgressPercent:F

    cmpl-float v0, v0, v2

    if-eqz v0, :cond_1c

    .line 390
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircularProgressDrawable;->start()V

    goto :goto_1c
.end method

.method public start()V
    .registers 2

    .prologue
    .line 406
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mInAnimationDuration:I

    if-lez v0, :cond_9

    const/4 v0, 0x1

    :goto_5
    invoke-direct {p0, v0}, Lcom/rey/material/drawable/CircularProgressDrawable;->start(Z)V

    .line 407
    return-void

    .line 406
    :cond_9
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 411
    iget v0, p0, Lcom/rey/material/drawable/CircularProgressDrawable;->mOutAnimationDuration:I

    if-lez v0, :cond_9

    const/4 v0, 0x1

    :goto_5
    invoke-direct {p0, v0}, Lcom/rey/material/drawable/CircularProgressDrawable;->stop(Z)V

    .line 412
    return-void

    .line 411
    :cond_9
    const/4 v0, 0x0

    goto :goto_5
.end method
