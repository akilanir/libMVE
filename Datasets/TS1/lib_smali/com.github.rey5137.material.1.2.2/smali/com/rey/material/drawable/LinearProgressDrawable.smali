.class public Lcom/rey/material/drawable/LinearProgressDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "LinearProgressDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/drawable/LinearProgressDrawable$Builder;
    }
.end annotation


# static fields
.field public static final ALIGN_BOTTOM:I = 0x2

.field public static final ALIGN_CENTER:I = 0x1

.field public static final ALIGN_TOP:I = 0x0

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
.field private mAnimTime:F

.field private mInAnimationDuration:I

.field private mKeepDuration:I

.field private mLastProgressStateTime:J

.field private mLastRunStateTime:J

.field private mLastUpdateTime:J

.field private mLineWidth:F

.field private mMaxLineWidth:I

.field private mMaxLineWidthPercent:F

.field private mMinLineWidth:I

.field private mMinLineWidthPercent:F

.field private mOutAnimationDuration:I

.field private mPaint:Landroid/graphics/Paint;

.field private mPath:Landroid/graphics/Path;

.field private mPathEffect:Landroid/graphics/DashPathEffect;

.field private mProgressMode:I

.field private mProgressPercent:F

.field private mProgressState:I

.field private mReverse:Z

.field private mRunState:I

.field private mSecondaryProgressPercent:F

.field private mStartLine:F

.field private mStrokeColorIndex:I

.field private mStrokeColors:[I

.field private mStrokeSecondaryColor:I

.field private mStrokeSize:I

.field private mTransformDuration:I

.field private mTransformInterpolator:Landroid/view/animation/Interpolator;

.field private mTravelDuration:I

.field private final mUpdater:Ljava/lang/Runnable;

.field private mVerticalAlign:I


# direct methods
.method private constructor <init>(FFIFIFII[IIZIIILandroid/view/animation/Interpolator;III)V
    .registers 22
    .param p1, "progressPercent"    # F
    .param p2, "secondaryProgressPercent"    # F
    .param p3, "maxLineWidth"    # I
    .param p4, "maxLineWidthPercent"    # F
    .param p5, "minLineWidth"    # I
    .param p6, "minLineWidthPercent"    # F
    .param p7, "strokeSize"    # I
    .param p8, "verticalAlign"    # I
    .param p9, "strokeColors"    # [I
    .param p10, "strokeSecondaryColor"    # I
    .param p11, "reverse"    # Z
    .param p12, "travelDuration"    # I
    .param p13, "transformDuration"    # I
    .param p14, "keepDuration"    # I
    .param p15, "transformInterpolator"    # Landroid/view/animation/Interpolator;
    .param p16, "progressMode"    # I
    .param p17, "inAnimDuration"    # I
    .param p18, "outAnimDuration"    # I

    .prologue
    .line 81
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 41
    const/4 v1, 0x0

    iput v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    .line 636
    new-instance v1, Lcom/rey/material/drawable/LinearProgressDrawable$1;

    invoke-direct {v1, p0}, Lcom/rey/material/drawable/LinearProgressDrawable$1;-><init>(Lcom/rey/material/drawable/LinearProgressDrawable;)V

    iput-object v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mUpdater:Ljava/lang/Runnable;

    .line 82
    invoke-virtual {p0, p1}, Lcom/rey/material/drawable/LinearProgressDrawable;->setProgress(F)V

    .line 83
    invoke-virtual {p0, p2}, Lcom/rey/material/drawable/LinearProgressDrawable;->setSecondaryProgress(F)V

    .line 84
    iput p3, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMaxLineWidth:I

    .line 85
    iput p4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMaxLineWidthPercent:F

    .line 86
    iput p5, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidth:I

    .line 87
    iput p6, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidthPercent:F

    .line 88
    iput p7, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSize:I

    .line 89
    iput p8, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mVerticalAlign:I

    .line 90
    iput-object p9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColors:[I

    .line 91
    iput p10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSecondaryColor:I

    .line 92
    iput-boolean p11, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    .line 93
    iput p12, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTravelDuration:I

    .line 94
    move/from16 v0, p13

    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTransformDuration:I

    .line 95
    move/from16 v0, p14

    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mKeepDuration:I

    .line 96
    move-object/from16 v0, p15

    iput-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTransformInterpolator:Landroid/view/animation/Interpolator;

    .line 97
    move/from16 v0, p16

    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressMode:I

    .line 98
    move/from16 v0, p17

    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mInAnimationDuration:I

    .line 99
    move/from16 v0, p18

    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mOutAnimationDuration:I

    .line 101
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    .line 102
    iget-object v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 103
    iget-object v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 104
    iget-object v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 106
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPath:Landroid/graphics/Path;

    .line 107
    return-void
.end method

.method synthetic constructor <init>(FFIFIFII[IIZIIILandroid/view/animation/Interpolator;IIILcom/rey/material/drawable/LinearProgressDrawable$1;)V
    .registers 20
    .param p1, "x0"    # F
    .param p2, "x1"    # F
    .param p3, "x2"    # I
    .param p4, "x3"    # F
    .param p5, "x4"    # I
    .param p6, "x5"    # F
    .param p7, "x6"    # I
    .param p8, "x7"    # I
    .param p9, "x8"    # [I
    .param p10, "x9"    # I
    .param p11, "x10"    # Z
    .param p12, "x11"    # I
    .param p13, "x12"    # I
    .param p14, "x13"    # I
    .param p15, "x14"    # Landroid/view/animation/Interpolator;
    .param p16, "x15"    # I
    .param p17, "x16"    # I
    .param p18, "x17"    # I
    .param p19, "x18"    # Lcom/rey/material/drawable/LinearProgressDrawable$1;

    .prologue
    .line 28
    invoke-direct/range {p0 .. p18}, Lcom/rey/material/drawable/LinearProgressDrawable;-><init>(FFIFIFII[IIZIIILandroid/view/animation/Interpolator;III)V

    return-void
.end method

.method static synthetic access$000(Lcom/rey/material/drawable/LinearProgressDrawable;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/drawable/LinearProgressDrawable;

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->update()V

    return-void
.end method

.method private drawBuffer(Landroid/graphics/Canvas;)V
    .registers 17
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 381
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v7

    .line 382
    .local v7, "bounds":Landroid/graphics/Rect;
    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v12

    .line 383
    .local v12, "width":I
    const/4 v11, 0x0

    .line 385
    .local v11, "size":F
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_c7

    .line 386
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSize:I

    int-to-float v0, v0

    iget v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mInAnimationDuration:I

    int-to-long v1, v1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget-wide v13, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastRunStateTime:J

    sub-long/2addr v4, v13

    invoke-static {v1, v2, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-float v1, v1

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mInAnimationDuration:I

    int-to-float v1, v1

    div-float v11, v0, v1

    .line 392
    :cond_26
    :goto_26
    const/4 v0, 0x0

    cmpl-float v0, v11, v0

    if-lez v0, :cond_c6

    .line 393
    const/4 v3, 0x0

    .line 394
    .local v3, "y":F
    int-to-float v0, v12

    iget v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressPercent:F

    mul-float v8, v0, v1

    .line 395
    .local v8, "lineWidth":F
    int-to-float v0, v12

    iget v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mSecondaryProgressPercent:F

    mul-float v10, v0, v1

    .line 397
    .local v10, "secondaryLineWidth":F
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mVerticalAlign:I

    packed-switch v0, :pswitch_data_138

    .line 409
    :goto_3b
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 411
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressPercent:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_99

    .line 412
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v11}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 413
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSecondaryColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 414
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 416
    iget-boolean v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    if-eqz v0, :cond_110

    .line 417
    int-to-float v0, v12

    sub-float v2, v0, v10

    int-to-float v0, v12

    sub-float v4, v0, v8

    iget-object v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v0, p0

    move-object/from16 v1, p1

    move v5, v3

    invoke-direct/range {v0 .. v6}, Lcom/rey/material/drawable/LinearProgressDrawable;->drawLinePath(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V

    .line 421
    :goto_6f
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 422
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-direct {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->getPathEffect()Landroid/graphics/PathEffect;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 423
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSize:I

    mul-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    iget v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    sub-float v9, v0, v1

    .line 425
    .local v9, "offset":F
    iget-boolean v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    if-eqz v0, :cond_11d

    .line 426
    neg-float v2, v9

    int-to-float v0, v12

    sub-float v4, v0, v10

    iget-object v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v0, p0

    move-object/from16 v1, p1

    move v5, v3

    invoke-direct/range {v0 .. v6}, Lcom/rey/material/drawable/LinearProgressDrawable;->drawLinePath(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V

    .line 431
    .end local v9    # "offset":F
    :cond_99
    :goto_99
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressPercent:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_c6

    .line 432
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v11}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 433
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColors:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 434
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 436
    iget-boolean v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    if-eqz v0, :cond_12c

    .line 437
    int-to-float v0, v12

    sub-float v2, v0, v8

    int-to-float v4, v12

    iget-object v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v0, p0

    move-object/from16 v1, p1

    move v5, v3

    invoke-direct/range {v0 .. v6}, Lcom/rey/material/drawable/LinearProgressDrawable;->drawLinePath(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V

    .line 442
    .end local v3    # "y":F
    .end local v8    # "lineWidth":F
    .end local v10    # "secondaryLineWidth":F
    :cond_c6
    :goto_c6
    return-void

    .line 387
    :cond_c7
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_e9

    .line 388
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSize:I

    int-to-float v0, v0

    const-wide/16 v1, 0x0

    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mOutAnimationDuration:I

    int-to-long v4, v4

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v13

    sub-long/2addr v4, v13

    iget-wide v13, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastRunStateTime:J

    add-long/2addr v4, v13

    invoke-static {v1, v2, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    long-to-float v1, v1

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mOutAnimationDuration:I

    int-to-float v1, v1

    div-float v11, v0, v1

    goto/16 :goto_26

    .line 389
    :cond_e9
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    if-eqz v0, :cond_26

    .line 390
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSize:I

    int-to-float v11, v0

    goto/16 :goto_26

    .line 399
    .restart local v3    # "y":F
    .restart local v8    # "lineWidth":F
    .restart local v10    # "secondaryLineWidth":F
    :pswitch_f2
    const/high16 v0, 0x40000000    # 2.0f

    div-float v3, v11, v0

    .line 400
    goto/16 :goto_3b

    .line 402
    :pswitch_f8
    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float v3, v0, v1

    .line 403
    goto/16 :goto_3b

    .line 405
    :pswitch_103
    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float v1, v11, v1

    sub-float v3, v0, v1

    goto/16 :goto_3b

    .line 419
    :cond_110
    iget-object v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v0, p0

    move-object/from16 v1, p1

    move v2, v10

    move v4, v8

    move v5, v3

    invoke-direct/range {v0 .. v6}, Lcom/rey/material/drawable/LinearProgressDrawable;->drawLinePath(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_6f

    .line 428
    .restart local v9    # "offset":F
    :cond_11d
    int-to-float v0, v12

    add-float v2, v0, v9

    iget-object v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v0, p0

    move-object/from16 v1, p1

    move v4, v10

    move v5, v3

    invoke-direct/range {v0 .. v6}, Lcom/rey/material/drawable/LinearProgressDrawable;->drawLinePath(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_99

    .line 439
    .end local v9    # "offset":F
    :cond_12c
    const/4 v2, 0x0

    iget-object v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v0, p0

    move-object/from16 v1, p1

    move v4, v8

    move v5, v3

    invoke-direct/range {v0 .. v6}, Lcom/rey/material/drawable/LinearProgressDrawable;->drawLinePath(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V

    goto :goto_c6

    .line 397
    :pswitch_data_138
    .packed-switch 0x0
        :pswitch_f2
        :pswitch_f8
        :pswitch_103
    .end packed-switch
.end method

.method private drawDeterminate(Landroid/graphics/Canvas;)V
    .registers 16
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v9, 0x40000000    # 2.0f

    const/4 v1, 0x0

    .line 219
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v10

    .line 220
    .local v10, "bounds":Landroid/graphics/Rect;
    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v13

    .line 221
    .local v13, "width":I
    const/4 v12, 0x0

    .line 223
    .local v12, "size":F
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    const/4 v3, 0x1

    if-ne v0, v3, :cond_83

    .line 224
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSize:I

    int-to-float v0, v0

    iget v3, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mInAnimationDuration:I

    int-to-long v3, v3

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    iget-wide v7, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastRunStateTime:J

    sub-long/2addr v5, v7

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-float v3, v3

    mul-float/2addr v0, v3

    iget v3, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mInAnimationDuration:I

    int-to-float v3, v3

    div-float v12, v0, v3

    .line 230
    :cond_29
    :goto_29
    cmpl-float v0, v12, v1

    if-lez v0, :cond_82

    .line 231
    const/4 v2, 0x0

    .line 232
    .local v2, "y":F
    int-to-float v0, v13

    iget v3, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressPercent:F

    mul-float v11, v0, v3

    .line 234
    .local v11, "lineWidth":F
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mVerticalAlign:I

    packed-switch v0, :pswitch_data_da

    .line 246
    :goto_38
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v12}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 247
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 249
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressPercent:F

    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v3

    if-eqz v0, :cond_61

    .line 250
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    iget v3, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSecondaryColor:I

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 252
    iget-boolean v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    if-eqz v0, :cond_c3

    .line 253
    int-to-float v0, v13

    sub-float v3, v0, v11

    iget-object v5, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v4, v2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 258
    :cond_61
    :goto_61
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressPercent:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_82

    .line 259
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    iget-object v3, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColors:[I

    const/4 v4, 0x0

    aget v3, v3, v4

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 260
    iget-boolean v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    if-eqz v0, :cond_ce

    .line 261
    int-to-float v0, v13

    sub-float v5, v0, v11

    int-to-float v7, v13

    iget-object v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v3, p0

    move-object v4, p1

    move v6, v2

    move v8, v2

    invoke-direct/range {v3 .. v9}, Lcom/rey/material/drawable/LinearProgressDrawable;->drawLinePath(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V

    .line 266
    .end local v2    # "y":F
    .end local v11    # "lineWidth":F
    :cond_82
    :goto_82
    return-void

    .line 225
    :cond_83
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    const/4 v3, 0x4

    if-ne v0, v3, :cond_a4

    .line 226
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSize:I

    int-to-float v0, v0

    const-wide/16 v3, 0x0

    iget v5, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mOutAnimationDuration:I

    int-to-long v5, v5

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v7

    sub-long/2addr v5, v7

    iget-wide v7, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastRunStateTime:J

    add-long/2addr v5, v7

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    long-to-float v3, v3

    mul-float/2addr v0, v3

    iget v3, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mOutAnimationDuration:I

    int-to-float v3, v3

    div-float v12, v0, v3

    goto :goto_29

    .line 227
    :cond_a4
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    if-eqz v0, :cond_29

    .line 228
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSize:I

    int-to-float v12, v0

    goto/16 :goto_29

    .line 236
    .restart local v2    # "y":F
    .restart local v11    # "lineWidth":F
    :pswitch_ad
    div-float v2, v12, v9

    .line 237
    goto :goto_38

    .line 239
    :pswitch_b0
    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    div-float v2, v0, v9

    .line 240
    goto :goto_38

    .line 242
    :pswitch_b8
    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    div-float v3, v12, v9

    sub-float v2, v0, v3

    goto/16 :goto_38

    .line 255
    :cond_c3
    int-to-float v6, v13

    iget-object v8, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v3, p1

    move v4, v11

    move v5, v2

    move v7, v2

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_61

    .line 263
    :cond_ce
    iget-object v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v3, p0

    move-object v4, p1

    move v5, v1

    move v6, v2

    move v7, v11

    move v8, v2

    invoke-direct/range {v3 .. v9}, Lcom/rey/material/drawable/LinearProgressDrawable;->drawLinePath(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V

    goto :goto_82

    .line 234
    :pswitch_data_da
    .packed-switch 0x0
        :pswitch_ad
        :pswitch_b0
        :pswitch_b8
    .end packed-switch
.end method

.method private drawIndeterminate(Landroid/graphics/Canvas;)V
    .registers 16
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v10, 0x40000000    # 2.0f

    const/4 v1, 0x0

    .line 279
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v11

    .line 280
    .local v11, "bounds":Landroid/graphics/Rect;
    invoke-virtual {v11}, Landroid/graphics/Rect;->width()I

    move-result v13

    .line 281
    .local v13, "width":I
    const/4 v12, 0x0

    .line 283
    .local v12, "size":F
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    const/4 v4, 0x1

    if-ne v0, v4, :cond_8c

    .line 284
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSize:I

    int-to-float v0, v0

    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mInAnimationDuration:I

    int-to-long v4, v4

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastRunStateTime:J

    sub-long/2addr v6, v8

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-float v4, v4

    mul-float/2addr v0, v4

    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mInAnimationDuration:I

    int-to-float v4, v4

    div-float v12, v0, v4

    .line 290
    :cond_29
    :goto_29
    cmpl-float v0, v12, v1

    if-lez v0, :cond_8b

    .line 291
    const/4 v2, 0x0

    .line 293
    .local v2, "y":F
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mVerticalAlign:I

    packed-switch v0, :pswitch_data_1aa

    .line 305
    :goto_33
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v12}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 306
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 308
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    int-to-float v5, v13

    invoke-direct {p0, v0, v4, v5}, Lcom/rey/material/drawable/LinearProgressDrawable;->offset(FFF)F

    move-result v3

    .line 310
    .local v3, "endLine":F
    iget-boolean v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    if-eqz v0, :cond_11a

    .line 311
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    cmpg-float v0, v3, v0

    if-gtz v0, :cond_cf

    .line 312
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSecondaryColor:I

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 313
    cmpl-float v0, v3, v1

    if-lez v0, :cond_64

    .line 314
    iget-object v5, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v4, v2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 315
    :cond_64
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    int-to-float v1, v13

    cmpg-float v0, v0, v1

    if-gez v0, :cond_76

    .line 316
    iget v5, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    int-to-float v7, v13

    iget-object v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v4, p1

    move v6, v2

    move v8, v2

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 318
    :cond_76
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-direct {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->getIndeterminateStrokeColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 319
    iget v8, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    iget-object v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v4, p0

    move-object v5, p1

    move v6, v3

    move v7, v2

    move v9, v2

    invoke-direct/range {v4 .. v10}, Lcom/rey/material/drawable/LinearProgressDrawable;->drawLinePath(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V

    .line 371
    .end local v2    # "y":F
    .end local v3    # "endLine":F
    :cond_8b
    :goto_8b
    return-void

    .line 285
    :cond_8c
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    const/4 v4, 0x4

    if-ne v0, v4, :cond_ae

    .line 286
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSize:I

    int-to-float v0, v0

    const-wide/16 v4, 0x0

    iget v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mOutAnimationDuration:I

    int-to-long v6, v6

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    sub-long/2addr v6, v8

    iget-wide v8, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastRunStateTime:J

    add-long/2addr v6, v8

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    long-to-float v4, v4

    mul-float/2addr v0, v4

    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mOutAnimationDuration:I

    int-to-float v4, v4

    div-float v12, v0, v4

    goto/16 :goto_29

    .line 287
    :cond_ae
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    if-eqz v0, :cond_29

    .line 288
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSize:I

    int-to-float v12, v0

    goto/16 :goto_29

    .line 295
    .restart local v2    # "y":F
    :pswitch_b7
    div-float v2, v12, v10

    .line 296
    goto/16 :goto_33

    .line 298
    :pswitch_bb
    invoke-virtual {v11}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    div-float v2, v0, v10

    .line 299
    goto/16 :goto_33

    .line 301
    :pswitch_c4
    invoke-virtual {v11}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    div-float v4, v12, v10

    sub-float v2, v0, v4

    goto/16 :goto_33

    .line 322
    .restart local v3    # "endLine":F
    :cond_cf
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSecondaryColor:I

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 323
    iget v5, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    iget-object v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v4, p1

    move v6, v2

    move v7, v3

    move v8, v2

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 325
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-direct {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->getIndeterminateStrokeColor()I

    move-result v4

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 326
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 328
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_101

    .line 329
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 330
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPath:Landroid/graphics/Path;

    iget v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 332
    :cond_101
    int-to-float v0, v13

    cmpg-float v0, v3, v0

    if-gez v0, :cond_111

    .line 333
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v0, v3, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 334
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPath:Landroid/graphics/Path;

    int-to-float v1, v13

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 337
    :cond_111
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto/16 :goto_8b

    .line 341
    :cond_11a
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    cmpl-float v0, v3, v0

    if-ltz v0, :cond_15e

    .line 342
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSecondaryColor:I

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 343
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_138

    .line 344
    iget v7, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    iget-object v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v4, p1

    move v5, v1

    move v6, v2

    move v8, v2

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 345
    :cond_138
    int-to-float v0, v13

    cmpg-float v0, v3, v0

    if-gez v0, :cond_147

    .line 346
    int-to-float v7, v13

    iget-object v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v4, p1

    move v5, v3

    move v6, v2

    move v8, v2

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 348
    :cond_147
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-direct {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->getIndeterminateStrokeColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 349
    iget v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    iget-object v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v4, p0

    move-object v5, p1

    move v7, v2

    move v8, v3

    move v9, v2

    invoke-direct/range {v4 .. v10}, Lcom/rey/material/drawable/LinearProgressDrawable;->drawLinePath(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_8b

    .line 352
    :cond_15e
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSecondaryColor:I

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 353
    iget v7, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    iget-object v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v4, p1

    move v5, v3

    move v6, v2

    move v8, v2

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 355
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-direct {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->getIndeterminateStrokeColor()I

    move-result v4

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 356
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 358
    cmpl-float v0, v3, v1

    if-lez v0, :cond_18c

    .line 359
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 360
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v0, v3, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 362
    :cond_18c
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    int-to-float v1, v13

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1a0

    .line 363
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPath:Landroid/graphics/Path;

    iget v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 364
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPath:Landroid/graphics/Path;

    int-to-float v1, v13

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 367
    :cond_1a0
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto/16 :goto_8b

    .line 293
    nop

    :pswitch_data_1aa
    .packed-switch 0x0
        :pswitch_b7
        :pswitch_bb
        :pswitch_c4
    .end packed-switch
.end method

.method private drawLinePath(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "x1"    # F
    .param p3, "y1"    # F
    .param p4, "x2"    # F
    .param p5, "y2"    # F
    .param p6, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 212
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 213
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v0, p2, p3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 214
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v0, p4, p5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 215
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {p1, v0, p6}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 216
    return-void
.end method

.method private drawQuery(Landroid/graphics/Canvas;)V
    .registers 21
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 449
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v16

    .line 450
    .local v16, "bounds":Landroid/graphics/Rect;
    invoke-virtual/range {v16 .. v16}, Landroid/graphics/Rect;->width()I

    move-result v18

    .line 451
    .local v18, "width":I
    const/16 v17, 0x0

    .line 453
    .local v17, "size":F
    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_ea

    .line 454
    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSize:I

    int-to-float v1, v1

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mInAnimationDuration:I

    int-to-long v4, v2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    move-object/from16 v0, p0

    iget-wide v9, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastRunStateTime:J

    sub-long/2addr v6, v9

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-float v2, v4

    mul-float/2addr v1, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mInAnimationDuration:I

    int-to-float v2, v2

    div-float v17, v1, v2

    .line 460
    :cond_31
    :goto_31
    const/4 v1, 0x0

    cmpl-float v1, v17, v1

    if-lez v1, :cond_e9

    .line 461
    const/4 v3, 0x0

    .line 463
    .local v3, "y":F
    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mVerticalAlign:I

    packed-switch v1, :pswitch_data_152

    .line 475
    :goto_3e
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move/from16 v0, v17

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 476
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 478
    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressPercent:F

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_ae

    .line 479
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSecondaryColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 480
    const/4 v2, 0x0

    move/from16 v0, v18

    int-to-float v4, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    move v5, v3

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 482
    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mAnimTime:F

    const/high16 v2, 0x3f800000    # 1.0f

    cmpg-float v1, v1, v2

    if-gez v1, :cond_ae

    .line 483
    const/4 v1, 0x0

    move/from16 v0, v18

    int-to-float v2, v0

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    move-object/from16 v0, p0

    iget v5, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    add-float/2addr v4, v5

    invoke-static {v2, v4}, Ljava/lang/Math;->min(FF)F

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v8

    .line 484
    .local v8, "endLine":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-direct/range {p0 .. p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->getQueryStrokeColor()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 485
    move-object/from16 v0, p0

    iget v6, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move v7, v3

    move v9, v3

    invoke-direct/range {v4 .. v10}, Lcom/rey/material/drawable/LinearProgressDrawable;->drawLinePath(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V

    .line 489
    .end local v8    # "endLine":F
    :cond_ae
    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressPercent:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_e9

    .line 490
    move/from16 v0, v18

    int-to-float v1, v0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressPercent:F

    mul-float v13, v1, v2

    .line 491
    .local v13, "lineWidth":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColors:[I

    const/4 v4, 0x0

    aget v2, v2, v4

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 493
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    if-eqz v1, :cond_143

    .line 494
    move/from16 v0, v18

    int-to-float v1, v0

    sub-float v11, v1, v13

    move/from16 v0, v18

    int-to-float v13, v0

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    .end local v13    # "lineWidth":F
    move-object/from16 v9, p0

    move-object/from16 v10, p1

    move v12, v3

    move v14, v3

    invoke-direct/range {v9 .. v15}, Lcom/rey/material/drawable/LinearProgressDrawable;->drawLinePath(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V

    .line 500
    .end local v3    # "y":F
    :cond_e9
    :goto_e9
    return-void

    .line 455
    :cond_ea
    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    const/4 v2, 0x4

    if-ne v1, v2, :cond_116

    .line 456
    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSize:I

    int-to-float v1, v1

    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mOutAnimationDuration:I

    int-to-long v6, v2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    sub-long/2addr v6, v9

    move-object/from16 v0, p0

    iget-wide v9, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastRunStateTime:J

    add-long/2addr v6, v9

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    long-to-float v2, v4

    mul-float/2addr v1, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mOutAnimationDuration:I

    int-to-float v2, v2

    div-float v17, v1, v2

    goto/16 :goto_31

    .line 457
    :cond_116
    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    if-eqz v1, :cond_31

    .line 458
    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSize:I

    int-to-float v0, v1

    move/from16 v17, v0

    goto/16 :goto_31

    .line 465
    .restart local v3    # "y":F
    :pswitch_125
    const/high16 v1, 0x40000000    # 2.0f

    div-float v3, v17, v1

    .line 466
    goto/16 :goto_3e

    .line 468
    :pswitch_12b
    invoke-virtual/range {v16 .. v16}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float v3, v1, v2

    .line 469
    goto/16 :goto_3e

    .line 471
    :pswitch_136
    invoke-virtual/range {v16 .. v16}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, v17, v2

    sub-float v3, v1, v2

    goto/16 :goto_3e

    .line 496
    .restart local v13    # "lineWidth":F
    :cond_143
    const/4 v11, 0x0

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v9, p0

    move-object/from16 v10, p1

    move v12, v3

    move v14, v3

    invoke-direct/range {v9 .. v15}, Lcom/rey/material/drawable/LinearProgressDrawable;->drawLinePath(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V

    goto :goto_e9

    .line 463
    :pswitch_data_152
    .packed-switch 0x0
        :pswitch_125
        :pswitch_12b
        :pswitch_136
    .end packed-switch
.end method

.method private getIndeterminateStrokeColor()I
    .registers 9

    .prologue
    .line 269
    iget v2, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressState:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_b

    iget-object v2, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColors:[I

    array-length v2, v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_12

    .line 270
    :cond_b
    iget-object v2, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColors:[I

    iget v3, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColorIndex:I

    aget v2, v2, v3

    .line 275
    :goto_11
    return v2

    .line 272
    :cond_12
    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    sub-long/2addr v4, v6

    long-to-float v4, v4

    iget v5, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mKeepDuration:I

    int-to-float v5, v5

    div-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 273
    .local v1, "value":F
    iget v2, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColorIndex:I

    if-nez v2, :cond_41

    iget-object v2, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColors:[I

    array-length v2, v2

    add-int/lit8 v0, v2, -0x1

    .line 275
    .local v0, "prev_index":I
    :goto_32
    iget-object v2, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColors:[I

    aget v2, v2, v0

    iget-object v3, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColors:[I

    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColorIndex:I

    aget v3, v3, v4

    invoke-static {v2, v3, v1}, Lcom/rey/material/util/ColorUtil;->getMiddleColor(IIF)I

    move-result v2

    goto :goto_11

    .line 273
    .end local v0    # "prev_index":I
    :cond_41
    iget v2, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColorIndex:I

    add-int/lit8 v0, v2, -0x1

    goto :goto_32
.end method

.method private getPathEffect()Landroid/graphics/PathEffect;
    .registers 5

    .prologue
    .line 374
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPathEffect:Landroid/graphics/DashPathEffect;

    if-nez v0, :cond_1d

    .line 375
    new-instance v0, Landroid/graphics/DashPathEffect;

    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v2, 0x0

    const v3, 0x3dcccccd    # 0.1f

    aput v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSize:I

    mul-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    aput v3, v1, v2

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    iput-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPathEffect:Landroid/graphics/DashPathEffect;

    .line 377
    :cond_1d
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPathEffect:Landroid/graphics/DashPathEffect;

    return-object v0
.end method

.method private getQueryStrokeColor()I
    .registers 3

    .prologue
    .line 445
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColors:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    iget v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mAnimTime:F

    invoke-static {v0, v1}, Lcom/rey/material/util/ColorUtil;->getColor(IF)I

    move-result v0

    return v0
.end method

.method private offset(FFF)F
    .registers 5
    .param p1, "pos"    # F
    .param p2, "offset"    # F
    .param p3, "max"    # F

    .prologue
    .line 685
    add-float/2addr p1, p2

    .line 686
    cmpl-float v0, p1, p3

    if-lez v0, :cond_7

    .line 687
    sub-float/2addr p1, p3

    .line 690
    .end local p1    # "pos":F
    :cond_6
    :goto_6
    return p1

    .line 688
    .restart local p1    # "pos":F
    :cond_7
    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_6

    .line 689
    add-float/2addr p1, p3

    goto :goto_6
.end method

.method private resetAnimation()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v0, 0x0

    .line 561
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastUpdateTime:J

    .line 562
    iget-wide v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastUpdateTime:J

    iput-wide v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    .line 563
    iget v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressMode:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_33

    .line 564
    iget-boolean v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    if-eqz v1, :cond_1e

    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    :cond_1e
    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    .line 565
    iput v3, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColorIndex:I

    .line 566
    iget-boolean v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    if-eqz v0, :cond_2f

    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidth:I

    neg-int v0, v0

    int-to-float v0, v0

    :goto_2a
    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    .line 567
    iput v3, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressState:I

    .line 577
    :cond_2e
    :goto_2e
    return-void

    .line 566
    :cond_2f
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidth:I

    int-to-float v0, v0

    goto :goto_2a

    .line 569
    :cond_33
    iget v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressMode:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_3b

    .line 570
    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    goto :goto_2e

    .line 572
    :cond_3b
    iget v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressMode:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_2e

    .line 573
    iget-boolean v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    if-nez v1, :cond_4d

    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    :cond_4d
    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    .line 574
    iput v3, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColorIndex:I

    .line 575
    iget-boolean v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    if-nez v0, :cond_5c

    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMaxLineWidth:I

    neg-int v0, v0

    int-to-float v0, v0

    :goto_59
    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    goto :goto_2e

    :cond_5c
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMaxLineWidth:I

    int-to-float v0, v0

    goto :goto_59
.end method

.method private start(Z)V
    .registers 7
    .param p1, "withAnimation"    # Z

    .prologue
    .line 590
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 602
    :goto_6
    return-void

    .line 593
    :cond_7
    if-eqz p1, :cond_12

    .line 594
    const/4 v0, 0x1

    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    .line 595
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastRunStateTime:J

    .line 598
    :cond_12
    invoke-direct {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->resetAnimation()V

    .line 600
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x10

    add-long/2addr v1, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/rey/material/drawable/LinearProgressDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 601
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->invalidateSelf()V

    goto :goto_6
.end method

.method private stop(Z)V
    .registers 7
    .param p1, "withAnimation"    # Z

    .prologue
    .line 605
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->isRunning()Z

    move-result v0

    if-nez v0, :cond_7

    .line 622
    :goto_6
    return-void

    .line 608
    :cond_7
    if-eqz p1, :cond_27

    .line 609
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastRunStateTime:J

    .line 611
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_23

    .line 612
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x10

    add-long/2addr v1, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/rey/material/drawable/LinearProgressDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 613
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->invalidateSelf()V

    .line 615
    :cond_23
    const/4 v0, 0x4

    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    goto :goto_6

    .line 618
    :cond_27
    const/4 v0, 0x0

    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    .line 619
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/rey/material/drawable/LinearProgressDrawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 620
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->invalidateSelf()V

    goto :goto_6
.end method

.method private update()V
    .registers 2

    .prologue
    .line 646
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressMode:I

    packed-switch v0, :pswitch_data_16

    .line 660
    :goto_5
    return-void

    .line 648
    :pswitch_6
    invoke-direct {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->updateDeterminate()V

    goto :goto_5

    .line 651
    :pswitch_a
    invoke-direct {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->updateIndeterminate()V

    goto :goto_5

    .line 654
    :pswitch_e
    invoke-direct {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->updateBuffer()V

    goto :goto_5

    .line 657
    :pswitch_12
    invoke-direct {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->updateQuery()V

    goto :goto_5

    .line 646
    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_6
        :pswitch_a
        :pswitch_e
        :pswitch_12
    .end packed-switch
.end method

.method private updateBuffer()V
    .registers 12

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x3

    const/4 v8, 0x1

    const/high16 v7, 0x3f800000    # 1.0f

    .line 796
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 797
    .local v0, "curTime":J
    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSize:I

    mul-int/lit8 v4, v4, 0x2

    int-to-float v2, v4

    .line 798
    .local v2, "maxDistance":F
    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    iget-wide v5, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastUpdateTime:J

    sub-long v5, v0, v5

    long-to-float v5, v5

    mul-float/2addr v5, v2

    iget v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTravelDuration:I

    int-to-float v6, v6

    div-float/2addr v5, v6

    add-float/2addr v4, v5

    iput v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    .line 799
    :goto_1d
    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    cmpl-float v4, v4, v2

    if-lez v4, :cond_29

    .line 800
    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    sub-float/2addr v4, v2

    iput v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    goto :goto_1d

    .line 801
    :cond_29
    iput-wide v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastUpdateTime:J

    .line 803
    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressState:I

    packed-switch v4, :pswitch_data_ea

    .line 850
    :cond_30
    :goto_30
    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    if-ne v4, v8, :cond_d4

    .line 851
    iget-wide v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastRunStateTime:J

    sub-long v4, v0, v4

    iget v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mInAnimationDuration:I

    int-to-long v6, v6

    cmp-long v4, v4, v6

    if-lez v4, :cond_41

    .line 852
    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    .line 861
    :cond_41
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->isRunning()Z

    move-result v4

    if-eqz v4, :cond_53

    .line 862
    iget-object v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    const-wide/16 v7, 0x10

    add-long/2addr v5, v7

    invoke-virtual {p0, v4, v5, v6}, Lcom/rey/material/drawable/LinearProgressDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 864
    :cond_53
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->invalidateSelf()V

    .line 865
    :goto_56
    return-void

    .line 805
    :pswitch_57
    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTransformDuration:I

    if-gtz v4, :cond_60

    .line 806
    iput v8, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressState:I

    .line 807
    iput-wide v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    goto :goto_30

    .line 810
    :cond_60
    iget-wide v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    sub-long v4, v0, v4

    long-to-float v4, v4

    iget v5, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTransformDuration:I

    int-to-float v5, v5

    div-float v3, v4, v5

    .line 811
    .local v3, "value":F
    iget-object v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTransformInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v4, v3}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v4

    iget v5, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSize:I

    int-to-float v5, v5

    mul-float/2addr v4, v5

    iput v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    .line 813
    cmpl-float v4, v3, v7

    if-lez v4, :cond_30

    .line 814
    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSize:I

    int-to-float v4, v4

    iput v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    .line 815
    iput v8, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressState:I

    .line 816
    iput-wide v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    goto :goto_30

    .line 821
    .end local v3    # "value":F
    :pswitch_84
    iget-wide v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    sub-long v4, v0, v4

    iget v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mKeepDuration:I

    int-to-long v6, v6

    cmp-long v4, v4, v6

    if-lez v4, :cond_30

    .line 822
    const/4 v4, 0x2

    iput v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressState:I

    .line 823
    iput-wide v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    goto :goto_30

    .line 827
    :pswitch_95
    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTransformDuration:I

    if-gtz v4, :cond_9e

    .line 828
    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressState:I

    .line 829
    iput-wide v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    goto :goto_30

    .line 832
    :cond_9e
    iget-wide v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    sub-long v4, v0, v4

    long-to-float v4, v4

    iget v5, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTransformDuration:I

    int-to-float v5, v5

    div-float v3, v4, v5

    .line 833
    .restart local v3    # "value":F
    iget-object v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTransformInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v4, v3}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v4

    sub-float v4, v7, v4

    iget v5, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSize:I

    int-to-float v5, v5

    mul-float/2addr v4, v5

    iput v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    .line 835
    cmpl-float v4, v3, v7

    if-lez v4, :cond_30

    .line 836
    const/4 v4, 0x0

    iput v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    .line 837
    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressState:I

    .line 838
    iput-wide v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    goto/16 :goto_30

    .line 843
    .end local v3    # "value":F
    :pswitch_c3
    iget-wide v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    sub-long v4, v0, v4

    iget v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mKeepDuration:I

    int-to-long v6, v6

    cmp-long v4, v4, v6

    if-lez v4, :cond_30

    .line 844
    iput v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressState:I

    .line 845
    iput-wide v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    goto/16 :goto_30

    .line 854
    :cond_d4
    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    const/4 v5, 0x4

    if-ne v4, v5, :cond_41

    .line 855
    iget-wide v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastRunStateTime:J

    sub-long v4, v0, v4

    iget v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mOutAnimationDuration:I

    int-to-long v6, v6

    cmp-long v4, v4, v6

    if-lez v4, :cond_41

    .line 856
    invoke-direct {p0, v10}, Lcom/rey/material/drawable/LinearProgressDrawable;->stop(Z)V

    goto/16 :goto_56

    .line 803
    nop

    :pswitch_data_ea
    .packed-switch 0x0
        :pswitch_57
        :pswitch_84
        :pswitch_95
        :pswitch_c3
    .end packed-switch
.end method

.method private updateDeterminate()V
    .registers 8

    .prologue
    .line 663
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 665
    .local v0, "curTime":J
    iget v2, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_18

    .line 666
    iget-wide v2, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastRunStateTime:J

    sub-long v2, v0, v2

    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mInAnimationDuration:I

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_2d

    .line 667
    const/4 v2, 0x2

    iput v2, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    .line 682
    :goto_17
    return-void

    .line 671
    :cond_18
    iget v2, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    const/4 v3, 0x4

    if-ne v2, v3, :cond_2d

    .line 672
    iget-wide v2, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastRunStateTime:J

    sub-long v2, v0, v2

    iget v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mOutAnimationDuration:I

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_2d

    .line 673
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/rey/material/drawable/LinearProgressDrawable;->stop(Z)V

    goto :goto_17

    .line 678
    :cond_2d
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_3f

    .line 679
    iget-object v2, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x10

    add-long/2addr v3, v5

    invoke-virtual {p0, v2, v3, v4}, Lcom/rey/material/drawable/LinearProgressDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 681
    :cond_3f
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->invalidateSelf()V

    goto :goto_17
.end method

.method private updateIndeterminate()V
    .registers 15

    .prologue
    .line 694
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 695
    .local v0, "bounds":Landroid/graphics/Rect;
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v8

    .line 697
    .local v8, "width":I
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 698
    .local v1, "curTime":J
    iget-wide v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastUpdateTime:J

    sub-long v9, v1, v9

    long-to-float v9, v9

    int-to-float v10, v8

    mul-float/2addr v9, v10

    iget v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTravelDuration:I

    int-to-float v10, v10

    div-float v6, v9, v10

    .line 699
    .local v6, "travelOffset":F
    iget-boolean v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    if-eqz v9, :cond_1d

    .line 700
    neg-float v6, v6

    .line 701
    :cond_1d
    iput-wide v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastUpdateTime:J

    .line 703
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressState:I

    packed-switch v9, :pswitch_data_1b2

    .line 778
    :cond_24
    :goto_24
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    const/4 v10, 0x1

    if-ne v9, v10, :cond_19c

    .line 779
    iget-wide v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastRunStateTime:J

    sub-long v9, v1, v9

    iget v11, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mInAnimationDuration:I

    int-to-long v11, v11

    cmp-long v9, v9, v11

    if-lez v9, :cond_37

    .line 780
    const/4 v9, 0x3

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    .line 789
    :cond_37
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->isRunning()Z

    move-result v9

    if-eqz v9, :cond_49

    .line 790
    iget-object v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v10

    const-wide/16 v12, 0x10

    add-long/2addr v10, v12

    invoke-virtual {p0, v9, v10, v11}, Lcom/rey/material/drawable/LinearProgressDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 792
    :cond_49
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->invalidateSelf()V

    .line 793
    :goto_4c
    return-void

    .line 705
    :pswitch_4d
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTransformDuration:I

    if-gtz v9, :cond_77

    .line 706
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidth:I

    if-nez v9, :cond_73

    int-to-float v9, v8

    iget v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidthPercent:F

    mul-float/2addr v9, v10

    :goto_59
    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    .line 707
    iget-boolean v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    if-eqz v9, :cond_64

    .line 708
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    neg-float v9, v9

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    .line 709
    :cond_64
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    int-to-float v10, v8

    invoke-direct {p0, v9, v6, v10}, Lcom/rey/material/drawable/LinearProgressDrawable;->offset(FFF)F

    move-result v9

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    .line 710
    const/4 v9, 0x1

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressState:I

    .line 711
    iput-wide v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    goto :goto_24

    .line 706
    :cond_73
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidth:I

    int-to-float v9, v9

    goto :goto_59

    .line 714
    :cond_77
    iget-wide v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    sub-long v9, v1, v9

    long-to-float v9, v9

    iget v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTransformDuration:I

    int-to-float v10, v10

    div-float v7, v9, v10

    .line 715
    .local v7, "value":F
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMaxLineWidth:I

    if-nez v9, :cond_c5

    int-to-float v9, v8

    iget v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMaxLineWidthPercent:F

    mul-float v3, v9, v10

    .line 716
    .local v3, "maxWidth":F
    :goto_8a
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidth:I

    if-nez v9, :cond_c9

    int-to-float v9, v8

    iget v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidthPercent:F

    mul-float v4, v9, v10

    .line 718
    .local v4, "minWidth":F
    :goto_93
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    int-to-float v10, v8

    invoke-direct {p0, v9, v6, v10}, Lcom/rey/material/drawable/LinearProgressDrawable;->offset(FFF)F

    move-result v9

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    .line 719
    iget-object v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTransformInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v9, v7}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v9

    sub-float v10, v3, v4

    mul-float/2addr v9, v10

    add-float/2addr v9, v4

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    .line 720
    iget-boolean v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    if-eqz v9, :cond_b1

    .line 721
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    neg-float v9, v9

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    .line 723
    :cond_b1
    const/high16 v9, 0x3f800000    # 1.0f

    cmpl-float v9, v7, v9

    if-lez v9, :cond_24

    .line 724
    iget-boolean v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    if-eqz v9, :cond_bc

    neg-float v3, v3

    .end local v3    # "maxWidth":F
    :cond_bc
    iput v3, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    .line 725
    const/4 v9, 0x1

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressState:I

    .line 726
    iput-wide v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    goto/16 :goto_24

    .line 715
    .end local v4    # "minWidth":F
    :cond_c5
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMaxLineWidth:I

    int-to-float v3, v9

    goto :goto_8a

    .line 716
    .restart local v3    # "maxWidth":F
    :cond_c9
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidth:I

    int-to-float v4, v9

    goto :goto_93

    .line 731
    .end local v3    # "maxWidth":F
    .end local v7    # "value":F
    :pswitch_cd
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    int-to-float v10, v8

    invoke-direct {p0, v9, v6, v10}, Lcom/rey/material/drawable/LinearProgressDrawable;->offset(FFF)F

    move-result v9

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    .line 733
    iget-wide v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    sub-long v9, v1, v9

    iget v11, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mKeepDuration:I

    int-to-long v11, v11

    cmp-long v9, v9, v11

    if-lez v9, :cond_24

    .line 734
    const/4 v9, 0x2

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressState:I

    .line 735
    iput-wide v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    goto/16 :goto_24

    .line 739
    :pswitch_e8
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTransformDuration:I

    if-gtz v9, :cond_11d

    .line 740
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidth:I

    if-nez v9, :cond_119

    int-to-float v9, v8

    iget v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidthPercent:F

    mul-float/2addr v9, v10

    :goto_f4
    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    .line 741
    iget-boolean v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    if-eqz v9, :cond_ff

    .line 742
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    neg-float v9, v9

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    .line 743
    :cond_ff
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    int-to-float v10, v8

    invoke-direct {p0, v9, v6, v10}, Lcom/rey/material/drawable/LinearProgressDrawable;->offset(FFF)F

    move-result v9

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    .line 744
    const/4 v9, 0x3

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressState:I

    .line 745
    iput-wide v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    .line 746
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColorIndex:I

    add-int/lit8 v9, v9, 0x1

    iget-object v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColors:[I

    array-length v10, v10

    rem-int/2addr v9, v10

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColorIndex:I

    goto/16 :goto_24

    .line 740
    :cond_119
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidth:I

    int-to-float v9, v9

    goto :goto_f4

    .line 749
    :cond_11d
    iget-wide v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    sub-long v9, v1, v9

    long-to-float v9, v9

    iget v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTransformDuration:I

    int-to-float v10, v10

    div-float v7, v9, v10

    .line 750
    .restart local v7    # "value":F
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMaxLineWidth:I

    if-nez v9, :cond_179

    int-to-float v9, v8

    iget v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMaxLineWidthPercent:F

    mul-float v3, v9, v10

    .line 751
    .restart local v3    # "maxWidth":F
    :goto_130
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidth:I

    if-nez v9, :cond_17d

    int-to-float v9, v8

    iget v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidthPercent:F

    mul-float v4, v9, v10

    .line 753
    .restart local v4    # "minWidth":F
    :goto_139
    const/high16 v9, 0x3f800000    # 1.0f

    iget-object v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTransformInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v10, v7}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v10

    sub-float/2addr v9, v10

    sub-float v10, v3, v4

    mul-float/2addr v9, v10

    add-float v5, v9, v4

    .line 754
    .local v5, "newLineWidth":F
    iget-boolean v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    if-eqz v9, :cond_14c

    .line 755
    neg-float v5, v5

    .line 757
    :cond_14c
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    iget v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    add-float/2addr v10, v6

    sub-float/2addr v10, v5

    int-to-float v11, v8

    invoke-direct {p0, v9, v10, v11}, Lcom/rey/material/drawable/LinearProgressDrawable;->offset(FFF)F

    move-result v9

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    .line 758
    iput v5, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    .line 760
    const/high16 v9, 0x3f800000    # 1.0f

    cmpl-float v9, v7, v9

    if-lez v9, :cond_24

    .line 761
    iget-boolean v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    if-eqz v9, :cond_166

    neg-float v4, v4

    .end local v4    # "minWidth":F
    :cond_166
    iput v4, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    .line 762
    const/4 v9, 0x3

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressState:I

    .line 763
    iput-wide v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    .line 764
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColorIndex:I

    add-int/lit8 v9, v9, 0x1

    iget-object v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColors:[I

    array-length v10, v10

    rem-int/2addr v9, v10

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColorIndex:I

    goto/16 :goto_24

    .line 750
    .end local v3    # "maxWidth":F
    .end local v5    # "newLineWidth":F
    :cond_179
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMaxLineWidth:I

    int-to-float v3, v9

    goto :goto_130

    .line 751
    .restart local v3    # "maxWidth":F
    :cond_17d
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidth:I

    int-to-float v4, v9

    goto :goto_139

    .line 769
    .end local v3    # "maxWidth":F
    .end local v7    # "value":F
    :pswitch_181
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    int-to-float v10, v8

    invoke-direct {p0, v9, v6, v10}, Lcom/rey/material/drawable/LinearProgressDrawable;->offset(FFF)F

    move-result v9

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    .line 771
    iget-wide v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    sub-long v9, v1, v9

    iget v11, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mKeepDuration:I

    int-to-long v11, v11

    cmp-long v9, v9, v11

    if-lez v9, :cond_24

    .line 772
    const/4 v9, 0x0

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressState:I

    .line 773
    iput-wide v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    goto/16 :goto_24

    .line 782
    :cond_19c
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    const/4 v10, 0x4

    if-ne v9, v10, :cond_37

    .line 783
    iget-wide v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastRunStateTime:J

    sub-long v9, v1, v9

    iget v11, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mOutAnimationDuration:I

    int-to-long v11, v11

    cmp-long v9, v9, v11

    if-lez v9, :cond_37

    .line 784
    const/4 v9, 0x0

    invoke-direct {p0, v9}, Lcom/rey/material/drawable/LinearProgressDrawable;->stop(Z)V

    goto/16 :goto_4c

    .line 703
    :pswitch_data_1b2
    .packed-switch 0x0
        :pswitch_4d
        :pswitch_cd
        :pswitch_e8
        :pswitch_181
    .end packed-switch
.end method

.method private updateQuery()V
    .registers 16

    .prologue
    const/4 v14, 0x3

    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v13, 0x4

    const/high16 v12, 0x3f800000    # 1.0f

    .line 868
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 869
    .local v1, "curTime":J
    iget-wide v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    sub-long v9, v1, v9

    long-to-float v9, v9

    iget v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTravelDuration:I

    int-to-float v10, v10

    div-float/2addr v9, v10

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mAnimTime:F

    .line 870
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    if-eq v9, v13, :cond_26

    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressPercent:F

    const/4 v10, 0x0

    cmpl-float v9, v9, v10

    if-eqz v9, :cond_26

    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mAnimTime:F

    cmpg-float v9, v9, v12

    if-gez v9, :cond_b3

    :cond_26
    move v5, v8

    .line 872
    .local v5, "requestUpdate":Z
    :goto_27
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mAnimTime:F

    cmpl-float v9, v9, v12

    if-lez v9, :cond_42

    .line 873
    long-to-float v9, v1

    iget v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mAnimTime:F

    sub-float/2addr v10, v12

    iget v11, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTravelDuration:I

    int-to-float v11, v11

    mul-float/2addr v10, v11

    sub-float/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    int-to-long v9, v9

    iput-wide v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastProgressStateTime:J

    .line 874
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mAnimTime:F

    sub-float/2addr v9, v12

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mAnimTime:F

    .line 877
    :cond_42
    if-eqz v5, :cond_8a

    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    if-eq v9, v13, :cond_8a

    .line 878
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 879
    .local v0, "bounds":Landroid/graphics/Rect;
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v6

    .line 881
    .local v6, "width":I
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMaxLineWidth:I

    if-nez v9, :cond_b6

    int-to-float v9, v6

    iget v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMaxLineWidthPercent:F

    mul-float v3, v9, v10

    .line 882
    .local v3, "maxWidth":F
    :goto_59
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidth:I

    if-nez v9, :cond_ba

    int-to-float v9, v6

    iget v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidthPercent:F

    mul-float v4, v9, v10

    .line 883
    .local v4, "minWidth":F
    :goto_62
    iget-object v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTransformInterpolator:Landroid/view/animation/Interpolator;

    iget v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mAnimTime:F

    invoke-interface {v9, v10}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v9

    sub-float v10, v4, v3

    mul-float/2addr v9, v10

    add-float/2addr v9, v3

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    .line 884
    iget-boolean v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    if-eqz v9, :cond_79

    .line 885
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    neg-float v9, v9

    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLineWidth:F

    .line 887
    :cond_79
    iget-boolean v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    if-eqz v9, :cond_be

    iget-object v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTransformInterpolator:Landroid/view/animation/Interpolator;

    iget v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mAnimTime:F

    invoke-interface {v9, v10}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v9

    int-to-float v10, v6

    add-float/2addr v10, v4

    mul-float/2addr v9, v10

    :goto_88
    iput v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStartLine:F

    .line 890
    .end local v0    # "bounds":Landroid/graphics/Rect;
    .end local v3    # "maxWidth":F
    .end local v4    # "minWidth":F
    .end local v6    # "width":I
    :cond_8a
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    if-ne v9, v8, :cond_cd

    .line 891
    iget-wide v7, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastRunStateTime:J

    sub-long v7, v1, v7

    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mInAnimationDuration:I

    int-to-long v9, v9

    cmp-long v7, v7, v9

    if-lez v7, :cond_9b

    .line 892
    iput v14, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    .line 901
    :cond_9b
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->isRunning()Z

    move-result v7

    if-eqz v7, :cond_af

    .line 902
    if-eqz v5, :cond_e0

    .line 903
    iget-object v7, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    const-wide/16 v10, 0x10

    add-long/2addr v8, v10

    invoke-virtual {p0, v7, v8, v9}, Lcom/rey/material/drawable/LinearProgressDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 908
    :cond_af
    :goto_af
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->invalidateSelf()V

    .line 909
    :goto_b2
    return-void

    .end local v5    # "requestUpdate":Z
    :cond_b3
    move v5, v7

    .line 870
    goto/16 :goto_27

    .line 881
    .restart local v0    # "bounds":Landroid/graphics/Rect;
    .restart local v5    # "requestUpdate":Z
    .restart local v6    # "width":I
    :cond_b6
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMaxLineWidth:I

    int-to-float v3, v9

    goto :goto_59

    .line 882
    .restart local v3    # "maxWidth":F
    :cond_ba
    iget v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidth:I

    int-to-float v4, v9

    goto :goto_62

    .line 887
    .restart local v4    # "minWidth":F
    :cond_be
    iget-object v9, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTransformInterpolator:Landroid/view/animation/Interpolator;

    iget v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mAnimTime:F

    invoke-interface {v9, v10}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v9

    sub-float v9, v12, v9

    int-to-float v10, v6

    add-float/2addr v10, v4

    mul-float/2addr v9, v10

    sub-float/2addr v9, v4

    goto :goto_88

    .line 894
    .end local v0    # "bounds":Landroid/graphics/Rect;
    .end local v3    # "maxWidth":F
    .end local v4    # "minWidth":F
    .end local v6    # "width":I
    :cond_cd
    iget v8, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    if-ne v8, v13, :cond_9b

    .line 895
    iget-wide v8, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mLastRunStateTime:J

    sub-long v8, v1, v8

    iget v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mOutAnimationDuration:I

    int-to-long v10, v10

    cmp-long v8, v8, v10

    if-lez v8, :cond_9b

    .line 896
    invoke-direct {p0, v7}, Lcom/rey/material/drawable/LinearProgressDrawable;->stop(Z)V

    goto :goto_b2

    .line 904
    :cond_e0
    iget v7, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    if-ne v7, v14, :cond_af

    .line 905
    const/4 v7, 0x2

    iput v7, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    goto :goto_af
.end method


# virtual methods
.method public applyStyle(Landroid/content/Context;I)V
    .registers 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resId"    # I

    .prologue
    .line 110
    sget-object v10, Lcom/rey/material/R$styleable;->LinearProgressDrawable:[I

    invoke-virtual {p1, p2, v10}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 112
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v5, 0x0

    .line 113
    .local v5, "strokeColor":I
    const/4 v6, 0x0

    .line 114
    .local v6, "strokeColorDefined":Z
    const/4 v7, 0x0

    .line 116
    .local v7, "strokeColors":[I
    const/4 v3, 0x0

    .local v3, "i":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v2

    .local v2, "count":I
    :goto_e
    if-ge v3, v2, :cond_145

    .line 117
    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v1

    .line 119
    .local v1, "attr":I
    sget v10, Lcom/rey/material/R$styleable;->LinearProgressDrawable_pv_progress:I

    if-ne v1, v10, :cond_23

    .line 120
    const/4 v10, 0x0

    invoke-virtual {v0, v1, v10}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v10

    invoke-virtual {p0, v10}, Lcom/rey/material/drawable/LinearProgressDrawable;->setProgress(F)V

    .line 116
    :cond_20
    :goto_20
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 121
    :cond_23
    sget v10, Lcom/rey/material/R$styleable;->LinearProgressDrawable_pv_secondaryProgress:I

    if-ne v1, v10, :cond_30

    .line 122
    const/4 v10, 0x0

    invoke-virtual {v0, v1, v10}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v10

    invoke-virtual {p0, v10}, Lcom/rey/material/drawable/LinearProgressDrawable;->setSecondaryProgress(F)V

    goto :goto_20

    .line 123
    :cond_30
    sget v10, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_maxLineWidth:I

    if-ne v1, v10, :cond_56

    .line 124
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v9

    .line 125
    .local v9, "value":Landroid/util/TypedValue;
    iget v10, v9, Landroid/util/TypedValue;->type:I

    const/4 v11, 0x6

    if-ne v10, v11, :cond_4b

    .line 126
    const/4 v10, 0x1

    const/4 v11, 0x1

    const/high16 v12, 0x3f400000    # 0.75f

    invoke-virtual {v0, v1, v10, v11, v12}, Landroid/content/res/TypedArray;->getFraction(IIIF)F

    move-result v10

    iput v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMaxLineWidthPercent:F

    .line 127
    const/4 v10, 0x0

    iput v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMaxLineWidth:I

    goto :goto_20

    .line 130
    :cond_4b
    const/4 v10, 0x0

    invoke-virtual {v0, v1, v10}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v10

    iput v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMaxLineWidth:I

    .line 131
    const/4 v10, 0x0

    iput v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMaxLineWidthPercent:F

    goto :goto_20

    .line 134
    .end local v9    # "value":Landroid/util/TypedValue;
    :cond_56
    sget v10, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_minLineWidth:I

    if-ne v1, v10, :cond_7c

    .line 135
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v9

    .line 136
    .restart local v9    # "value":Landroid/util/TypedValue;
    iget v10, v9, Landroid/util/TypedValue;->type:I

    const/4 v11, 0x6

    if-ne v10, v11, :cond_71

    .line 137
    const/4 v10, 0x1

    const/4 v11, 0x1

    const/high16 v12, 0x3e800000    # 0.25f

    invoke-virtual {v0, v1, v10, v11, v12}, Landroid/content/res/TypedArray;->getFraction(IIIF)F

    move-result v10

    iput v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidthPercent:F

    .line 138
    const/4 v10, 0x0

    iput v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidth:I

    goto :goto_20

    .line 141
    :cond_71
    const/4 v10, 0x0

    invoke-virtual {v0, v1, v10}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v10

    iput v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidth:I

    .line 142
    const/4 v10, 0x0

    iput v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mMinLineWidthPercent:F

    goto :goto_20

    .line 145
    .end local v9    # "value":Landroid/util/TypedValue;
    :cond_7c
    sget v10, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_strokeSize:I

    if-ne v1, v10, :cond_88

    .line 146
    const/4 v10, 0x0

    invoke-virtual {v0, v1, v10}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v10

    iput v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSize:I

    goto :goto_20

    .line 147
    :cond_88
    sget v10, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_verticalAlign:I

    if-ne v1, v10, :cond_94

    .line 148
    const/4 v10, 0x0

    invoke-virtual {v0, v1, v10}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v10

    iput v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mVerticalAlign:I

    goto :goto_20

    .line 149
    :cond_94
    sget v10, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_strokeColor:I

    if-ne v1, v10, :cond_9f

    .line 150
    const/4 v10, 0x0

    invoke-virtual {v0, v1, v10}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v5

    .line 151
    const/4 v6, 0x1

    goto :goto_20

    .line 153
    :cond_9f
    sget v10, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_strokeColors:I

    if-ne v1, v10, :cond_cc

    .line 154
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v0, v1, v11}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v8

    .line 155
    .local v8, "ta":Landroid/content/res/TypedArray;
    invoke-virtual {v8}, Landroid/content/res/TypedArray;->length()I

    move-result v10

    new-array v7, v10, [I

    .line 156
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_b7
    invoke-virtual {v8}, Landroid/content/res/TypedArray;->length()I

    move-result v10

    if-ge v4, v10, :cond_c7

    .line 157
    const/4 v10, 0x0

    invoke-virtual {v8, v4, v10}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v10

    aput v10, v7, v4

    .line 156
    add-int/lit8 v4, v4, 0x1

    goto :goto_b7

    .line 158
    :cond_c7
    invoke-virtual {v8}, Landroid/content/res/TypedArray;->recycle()V

    goto/16 :goto_20

    .line 160
    .end local v4    # "j":I
    .end local v8    # "ta":Landroid/content/res/TypedArray;
    :cond_cc
    sget v10, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_strokeSecondaryColor:I

    if-ne v1, v10, :cond_d9

    .line 161
    const/4 v10, 0x0

    invoke-virtual {v0, v1, v10}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v10

    iput v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeSecondaryColor:I

    goto/16 :goto_20

    .line 162
    :cond_d9
    sget v10, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_reverse:I

    if-ne v1, v10, :cond_e6

    .line 163
    const/4 v10, 0x0

    invoke-virtual {v0, v1, v10}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v10

    iput-boolean v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mReverse:Z

    goto/16 :goto_20

    .line 164
    :cond_e6
    sget v10, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_travelDuration:I

    if-ne v1, v10, :cond_f3

    .line 165
    const/4 v10, 0x0

    invoke-virtual {v0, v1, v10}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v10

    iput v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTravelDuration:I

    goto/16 :goto_20

    .line 166
    :cond_f3
    sget v10, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_transformDuration:I

    if-ne v1, v10, :cond_100

    .line 167
    const/4 v10, 0x0

    invoke-virtual {v0, v1, v10}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v10

    iput v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTransformDuration:I

    goto/16 :goto_20

    .line 168
    :cond_100
    sget v10, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_keepDuration:I

    if-ne v1, v10, :cond_10d

    .line 169
    const/4 v10, 0x0

    invoke-virtual {v0, v1, v10}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v10

    iput v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mKeepDuration:I

    goto/16 :goto_20

    .line 170
    :cond_10d
    sget v10, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_transformInterpolator:I

    if-ne v1, v10, :cond_11e

    .line 171
    const/4 v10, 0x0

    invoke-virtual {v0, v1, v10}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v10

    invoke-static {p1, v10}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v10

    iput-object v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mTransformInterpolator:Landroid/view/animation/Interpolator;

    goto/16 :goto_20

    .line 172
    :cond_11e
    sget v10, Lcom/rey/material/R$styleable;->LinearProgressDrawable_pv_progressMode:I

    if-ne v1, v10, :cond_12b

    .line 173
    const/4 v10, 0x0

    invoke-virtual {v0, v1, v10}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v10

    iput v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressMode:I

    goto/16 :goto_20

    .line 174
    :cond_12b
    sget v10, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_inAnimDuration:I

    if-ne v1, v10, :cond_138

    .line 175
    const/4 v10, 0x0

    invoke-virtual {v0, v1, v10}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v10

    iput v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mInAnimationDuration:I

    goto/16 :goto_20

    .line 176
    :cond_138
    sget v10, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_outAnimDuration:I

    if-ne v1, v10, :cond_20

    .line 177
    const/4 v10, 0x0

    invoke-virtual {v0, v1, v10}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v10

    iput v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mOutAnimationDuration:I

    goto/16 :goto_20

    .line 180
    .end local v1    # "attr":I
    :cond_145
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 182
    if-eqz v7, :cond_15a

    .line 183
    iput-object v7, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColors:[I

    .line 187
    :cond_14c
    :goto_14c
    iget v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColorIndex:I

    iget-object v11, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColors:[I

    array-length v11, v11

    if-lt v10, v11, :cond_156

    .line 188
    const/4 v10, 0x0

    iput v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColorIndex:I

    .line 190
    :cond_156
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->invalidateSelf()V

    .line 191
    return-void

    .line 184
    :cond_15a
    if-eqz v6, :cond_14c

    .line 185
    const/4 v10, 0x1

    new-array v10, v10, [I

    const/4 v11, 0x0

    aput v5, v10, v11

    iput-object v10, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mStrokeColors:[I

    goto :goto_14c
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 195
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressMode:I

    packed-switch v0, :pswitch_data_16

    .line 209
    :goto_5
    return-void

    .line 197
    :pswitch_6
    invoke-direct {p0, p1}, Lcom/rey/material/drawable/LinearProgressDrawable;->drawDeterminate(Landroid/graphics/Canvas;)V

    goto :goto_5

    .line 200
    :pswitch_a
    invoke-direct {p0, p1}, Lcom/rey/material/drawable/LinearProgressDrawable;->drawIndeterminate(Landroid/graphics/Canvas;)V

    goto :goto_5

    .line 203
    :pswitch_e
    invoke-direct {p0, p1}, Lcom/rey/material/drawable/LinearProgressDrawable;->drawBuffer(Landroid/graphics/Canvas;)V

    goto :goto_5

    .line 206
    :pswitch_12
    invoke-direct {p0, p1}, Lcom/rey/material/drawable/LinearProgressDrawable;->drawQuery(Landroid/graphics/Canvas;)V

    goto :goto_5

    .line 195
    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_6
        :pswitch_a
        :pswitch_e
        :pswitch_12
    .end packed-switch
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 514
    const/4 v0, -0x3

    return v0
.end method

.method public getProgress()F
    .registers 2

    .prologue
    .line 529
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressPercent:F

    return v0
.end method

.method public getProgressMode()I
    .registers 2

    .prologue
    .line 518
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressMode:I

    return v0
.end method

.method public getSecondaryProgress()F
    .registers 2

    .prologue
    .line 533
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mSecondaryProgressPercent:F

    return v0
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 626
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

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
    .line 631
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    if-nez v0, :cond_b

    .line 632
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mInAnimationDuration:I

    if-lez v0, :cond_f

    const/4 v0, 0x1

    :goto_9
    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mRunState:I

    .line 633
    :cond_b
    invoke-super {p0, p1, p2, p3}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 634
    return-void

    .line 632
    :cond_f
    const/4 v0, 0x3

    goto :goto_9
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 504
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 505
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 509
    iget-object v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 510
    return-void
.end method

.method public setProgress(F)V
    .registers 5
    .param p1, "percent"    # F

    .prologue
    const/4 v2, 0x0

    .line 537
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v2, p1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    .line 538
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressPercent:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_1c

    .line 539
    iput p1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressPercent:F

    .line 540
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 541
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->invalidateSelf()V

    .line 545
    :cond_1c
    :goto_1c
    return-void

    .line 542
    :cond_1d
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressPercent:F

    cmpl-float v0, v0, v2

    if-eqz v0, :cond_1c

    .line 543
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->start()V

    goto :goto_1c
.end method

.method public setProgressMode(I)V
    .registers 3
    .param p1, "mode"    # I

    .prologue
    .line 522
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressMode:I

    if-eq v0, p1, :cond_9

    .line 523
    iput p1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mProgressMode:I

    .line 524
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->invalidateSelf()V

    .line 526
    :cond_9
    return-void
.end method

.method public setSecondaryProgress(F)V
    .registers 5
    .param p1, "percent"    # F

    .prologue
    const/4 v2, 0x0

    .line 548
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v2, p1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    .line 549
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mSecondaryProgressPercent:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_1c

    .line 550
    iput p1, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mSecondaryProgressPercent:F

    .line 551
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 552
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->invalidateSelf()V

    .line 556
    :cond_1c
    :goto_1c
    return-void

    .line 553
    :cond_1d
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mSecondaryProgressPercent:F

    cmpl-float v0, v0, v2

    if-eqz v0, :cond_1c

    .line 554
    invoke-virtual {p0}, Lcom/rey/material/drawable/LinearProgressDrawable;->start()V

    goto :goto_1c
.end method

.method public start()V
    .registers 2

    .prologue
    .line 581
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mInAnimationDuration:I

    if-lez v0, :cond_9

    const/4 v0, 0x1

    :goto_5
    invoke-direct {p0, v0}, Lcom/rey/material/drawable/LinearProgressDrawable;->start(Z)V

    .line 582
    return-void

    .line 581
    :cond_9
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 586
    iget v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable;->mOutAnimationDuration:I

    if-lez v0, :cond_9

    const/4 v0, 0x1

    :goto_5
    invoke-direct {p0, v0}, Lcom/rey/material/drawable/LinearProgressDrawable;->stop(Z)V

    .line 587
    return-void

    .line 586
    :cond_9
    const/4 v0, 0x0

    goto :goto_5
.end method
