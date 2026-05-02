.class public Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;
.super Landroid/view/View;
.source "RadialTextsView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$1;,
        Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$InvalidateUpdateListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "RadialTextsView"


# instance fields
.field private mAmPmCircleRadiusMultiplier:F

.field private mAnimationRadiusMultiplier:F

.field private mCircleRadius:F

.field private mCircleRadiusMultiplier:F

.field mDisappearAnimator:Landroid/animation/ObjectAnimator;

.field private mDrawValuesReady:Z

.field private mHasInnerCircle:Z

.field private mInnerNumbersRadiusMultiplier:F

.field private mInnerTextGridHeights:[F

.field private mInnerTextGridWidths:[F

.field private mInnerTextSize:F

.field private mInnerTextSizeMultiplier:F

.field private mInnerTexts:[Ljava/lang/String;

.field private mInvalidateUpdateListener:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$InvalidateUpdateListener;

.field private mIs24HourMode:Z

.field private mIsInitialized:Z

.field private mNumbersRadiusMultiplier:F

.field private final mPaint:Landroid/graphics/Paint;

.field mReappearAnimator:Landroid/animation/ObjectAnimator;

.field private final mSelectedPaint:Landroid/graphics/Paint;

.field private mTextGridHeights:[F

.field private mTextGridValuesDirty:Z

.field private mTextGridWidths:[F

.field private mTextSize:F

.field private mTextSizeMultiplier:F

.field private mTexts:[Ljava/lang/String;

.field private mTransitionEndRadiusMultiplier:F

.field private mTransitionMidRadiusMultiplier:F

.field private mTypefaceLight:Landroid/graphics/Typeface;

.field private mTypefaceRegular:Landroid/graphics/Typeface;

.field private mXCenter:I

.field private mYCenter:I

.field private selection:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 81
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 41
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    .line 42
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mSelectedPaint:Landroid/graphics/Paint;

    .line 47
    const/4 v0, -0x1

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->selection:I

    .line 82
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mIsInitialized:Z

    .line 83
    return-void
.end method

.method private calculateGridSizes(FFFF[F[F)V
    .registers 12
    .param p1, "numbersRadius"    # F
    .param p2, "xCenter"    # F
    .param p3, "yCenter"    # F
    .param p4, "textSize"    # F
    .param p5, "textGridHeights"    # [F
    .param p6, "textGridWidths"    # [F

    .prologue
    .line 258
    move v0, p1

    .line 260
    .local v0, "offset1":F
    const-wide/high16 v3, 0x4008000000000000L    # 3.0

    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    double-to-float v3, v3

    mul-float/2addr v3, p1

    const/high16 v4, 0x40000000    # 2.0f

    div-float v1, v3, v4

    .line 262
    .local v1, "offset2":F
    const/high16 v3, 0x40000000    # 2.0f

    div-float v2, p1, v3

    .line 263
    .local v2, "offset3":F
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, p4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 264
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mSelectedPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, p4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 266
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->descent()F

    move-result v3

    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v4}, Landroid/graphics/Paint;->ascent()F

    move-result v4

    add-float/2addr v3, v4

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    sub-float/2addr p3, v3

    .line 268
    const/4 v3, 0x0

    sub-float v4, p3, v0

    aput v4, p5, v3

    .line 269
    const/4 v3, 0x0

    sub-float v4, p2, v0

    aput v4, p6, v3

    .line 270
    const/4 v3, 0x1

    sub-float v4, p3, v1

    aput v4, p5, v3

    .line 271
    const/4 v3, 0x1

    sub-float v4, p2, v1

    aput v4, p6, v3

    .line 272
    const/4 v3, 0x2

    sub-float v4, p3, v2

    aput v4, p5, v3

    .line 273
    const/4 v3, 0x2

    sub-float v4, p2, v2

    aput v4, p6, v3

    .line 274
    const/4 v3, 0x3

    aput p3, p5, v3

    .line 275
    const/4 v3, 0x3

    aput p2, p6, v3

    .line 276
    const/4 v3, 0x4

    add-float v4, p3, v2

    aput v4, p5, v3

    .line 277
    const/4 v3, 0x4

    add-float v4, p2, v2

    aput v4, p6, v3

    .line 278
    const/4 v3, 0x5

    add-float v4, p3, v1

    aput v4, p5, v3

    .line 279
    const/4 v3, 0x5

    add-float v4, p2, v1

    aput v4, p6, v3

    .line 280
    const/4 v3, 0x6

    add-float v4, p3, v0

    aput v4, p5, v3

    .line 281
    const/4 v3, 0x6

    add-float v4, p2, v0

    aput v4, p6, v3

    .line 282
    return-void
.end method

.method private drawTexts(Landroid/graphics/Canvas;FLandroid/graphics/Typeface;[Ljava/lang/String;[F[F)V
    .registers 12
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "textSize"    # F
    .param p3, "typeface"    # Landroid/graphics/Typeface;
    .param p4, "texts"    # [Ljava/lang/String;
    .param p5, "textGridWidths"    # [F
    .param p6, "textGridHeights"    # [F

    .prologue
    .line 289
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 290
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 291
    const/4 v0, 0x0

    aget-object v1, p4, v0

    const/4 v0, 0x3

    aget v2, p5, v0

    const/4 v0, 0x0

    aget v3, p6, v0

    const/4 v0, 0x0

    aget-object v0, p4, v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->selection:I

    if-ne v0, v4, :cond_13f

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mSelectedPaint:Landroid/graphics/Paint;

    :goto_20
    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 292
    const/4 v0, 0x1

    aget-object v1, p4, v0

    const/4 v0, 0x4

    aget v2, p5, v0

    const/4 v0, 0x1

    aget v3, p6, v0

    const/4 v0, 0x1

    aget-object v0, p4, v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->selection:I

    if-ne v0, v4, :cond_143

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mSelectedPaint:Landroid/graphics/Paint;

    :goto_39
    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 293
    const/4 v0, 0x2

    aget-object v1, p4, v0

    const/4 v0, 0x5

    aget v2, p5, v0

    const/4 v0, 0x2

    aget v3, p6, v0

    const/4 v0, 0x2

    aget-object v0, p4, v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->selection:I

    if-ne v0, v4, :cond_147

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mSelectedPaint:Landroid/graphics/Paint;

    :goto_52
    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 294
    const/4 v0, 0x3

    aget-object v1, p4, v0

    const/4 v0, 0x6

    aget v2, p5, v0

    const/4 v0, 0x3

    aget v3, p6, v0

    const/4 v0, 0x3

    aget-object v0, p4, v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->selection:I

    if-ne v0, v4, :cond_14b

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mSelectedPaint:Landroid/graphics/Paint;

    :goto_6b
    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 295
    const/4 v0, 0x4

    aget-object v1, p4, v0

    const/4 v0, 0x5

    aget v2, p5, v0

    const/4 v0, 0x4

    aget v3, p6, v0

    const/4 v0, 0x4

    aget-object v0, p4, v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->selection:I

    if-ne v0, v4, :cond_14f

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mSelectedPaint:Landroid/graphics/Paint;

    :goto_84
    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 296
    const/4 v0, 0x5

    aget-object v1, p4, v0

    const/4 v0, 0x4

    aget v2, p5, v0

    const/4 v0, 0x5

    aget v3, p6, v0

    const/4 v0, 0x5

    aget-object v0, p4, v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->selection:I

    if-ne v0, v4, :cond_153

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mSelectedPaint:Landroid/graphics/Paint;

    :goto_9d
    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 297
    const/4 v0, 0x6

    aget-object v1, p4, v0

    const/4 v0, 0x3

    aget v2, p5, v0

    const/4 v0, 0x6

    aget v3, p6, v0

    const/4 v0, 0x6

    aget-object v0, p4, v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->selection:I

    if-ne v0, v4, :cond_157

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mSelectedPaint:Landroid/graphics/Paint;

    :goto_b6
    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 298
    const/4 v0, 0x7

    aget-object v1, p4, v0

    const/4 v0, 0x2

    aget v2, p5, v0

    const/4 v0, 0x5

    aget v3, p6, v0

    const/4 v0, 0x7

    aget-object v0, p4, v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->selection:I

    if-ne v0, v4, :cond_15b

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mSelectedPaint:Landroid/graphics/Paint;

    :goto_cf
    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 299
    const/16 v0, 0x8

    aget-object v1, p4, v0

    const/4 v0, 0x1

    aget v2, p5, v0

    const/4 v0, 0x4

    aget v3, p6, v0

    const/16 v0, 0x8

    aget-object v0, p4, v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->selection:I

    if-ne v0, v4, :cond_15f

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mSelectedPaint:Landroid/graphics/Paint;

    :goto_ea
    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 300
    const/16 v0, 0x9

    aget-object v1, p4, v0

    const/4 v0, 0x0

    aget v2, p5, v0

    const/4 v0, 0x3

    aget v3, p6, v0

    const/16 v0, 0x9

    aget-object v0, p4, v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->selection:I

    if-ne v0, v4, :cond_162

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mSelectedPaint:Landroid/graphics/Paint;

    :goto_105
    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 301
    const/16 v0, 0xa

    aget-object v1, p4, v0

    const/4 v0, 0x1

    aget v2, p5, v0

    const/4 v0, 0x2

    aget v3, p6, v0

    const/16 v0, 0xa

    aget-object v0, p4, v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->selection:I

    if-ne v0, v4, :cond_165

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mSelectedPaint:Landroid/graphics/Paint;

    :goto_120
    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 302
    const/16 v0, 0xb

    aget-object v1, p4, v0

    const/4 v0, 0x2

    aget v2, p5, v0

    const/4 v0, 0x1

    aget v3, p6, v0

    const/16 v0, 0xb

    aget-object v0, p4, v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->selection:I

    if-ne v0, v4, :cond_168

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mSelectedPaint:Landroid/graphics/Paint;

    :goto_13b
    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 303
    return-void

    .line 291
    :cond_13f
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    goto/16 :goto_20

    .line 292
    :cond_143
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    goto/16 :goto_39

    .line 293
    :cond_147
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    goto/16 :goto_52

    .line 294
    :cond_14b
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    goto/16 :goto_6b

    .line 295
    :cond_14f
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    goto/16 :goto_84

    .line 296
    :cond_153
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    goto/16 :goto_9d

    .line 297
    :cond_157
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    goto/16 :goto_b6

    .line 298
    :cond_15b
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    goto/16 :goto_cf

    .line 299
    :cond_15f
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    goto :goto_ea

    .line 300
    :cond_162
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    goto :goto_105

    .line 301
    :cond_165
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    goto :goto_120

    .line 302
    :cond_168
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    goto :goto_13b
.end method

.method private renderAnimations()V
    .registers 21

    .prologue
    .line 310
    const v11, 0x3e4ccccd    # 0.2f

    .line 311
    .local v11, "midwayPoint":F
    const/16 v4, 0x1f4

    .line 314
    .local v4, "duration":I
    const/16 v17, 0x0

    const/high16 v18, 0x3f800000    # 1.0f

    invoke-static/range {v17 .. v18}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v7

    .line 315
    .local v7, "kf0":Landroid/animation/Keyframe;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTransitionMidRadiusMultiplier:F

    move/from16 v17, v0

    move/from16 v0, v17

    invoke-static {v11, v0}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v8

    .line 316
    .local v8, "kf1":Landroid/animation/Keyframe;
    const/high16 v17, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTransitionEndRadiusMultiplier:F

    move/from16 v18, v0

    invoke-static/range {v17 .. v18}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v9

    .line 317
    .local v9, "kf2":Landroid/animation/Keyframe;
    const-string v17, "animationRadiusMultiplier"

    const/16 v18, 0x3

    move/from16 v0, v18

    new-array v0, v0, [Landroid/animation/Keyframe;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v7, v18, v19

    const/16 v19, 0x1

    aput-object v8, v18, v19

    const/16 v19, 0x2

    aput-object v9, v18, v19

    invoke-static/range {v17 .. v18}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    move-result-object v12

    .line 320
    .local v12, "radiusDisappear":Landroid/animation/PropertyValuesHolder;
    const/16 v17, 0x0

    const/high16 v18, 0x3f800000    # 1.0f

    invoke-static/range {v17 .. v18}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v7

    .line 321
    const/high16 v17, 0x3f800000    # 1.0f

    const/16 v18, 0x0

    invoke-static/range {v17 .. v18}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v8

    .line 322
    const-string v17, "alpha"

    const/16 v18, 0x2

    move/from16 v0, v18

    new-array v0, v0, [Landroid/animation/Keyframe;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v7, v18, v19

    const/16 v19, 0x1

    aput-object v8, v18, v19

    invoke-static/range {v17 .. v18}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    move-result-object v6

    .line 324
    .local v6, "fadeOut":Landroid/animation/PropertyValuesHolder;
    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v0, v0, [Landroid/animation/PropertyValuesHolder;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aput-object v12, v17, v18

    const/16 v18, 0x1

    aput-object v6, v17, v18

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v17

    int-to-long v0, v4

    move-wide/from16 v18, v0

    invoke-virtual/range {v17 .. v19}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mDisappearAnimator:Landroid/animation/ObjectAnimator;

    .line 326
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mDisappearAnimator:Landroid/animation/ObjectAnimator;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mInvalidateUpdateListener:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$InvalidateUpdateListener;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 330
    const/high16 v2, 0x3e800000    # 0.25f

    .line 331
    .local v2, "delayMultiplier":F
    const/high16 v16, 0x3f800000    # 1.0f

    .line 332
    .local v16, "transitionDurationMultiplier":F
    add-float v15, v16, v2

    .line 333
    .local v15, "totalDurationMultiplier":F
    int-to-float v0, v4

    move/from16 v17, v0

    mul-float v17, v17, v15

    move/from16 v0, v17

    float-to-int v14, v0

    .line 334
    .local v14, "totalDuration":I
    int-to-float v0, v4

    move/from16 v17, v0

    mul-float v17, v17, v2

    int-to-float v0, v14

    move/from16 v18, v0

    div-float v3, v17, v18

    .line 335
    .local v3, "delayPoint":F
    const/high16 v17, 0x3f800000    # 1.0f

    const/high16 v18, 0x3f800000    # 1.0f

    sub-float v18, v18, v3

    mul-float v18, v18, v11

    sub-float v11, v17, v18

    .line 337
    const/16 v17, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTransitionEndRadiusMultiplier:F

    move/from16 v18, v0

    invoke-static/range {v17 .. v18}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v7

    .line 338
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTransitionEndRadiusMultiplier:F

    move/from16 v17, v0

    move/from16 v0, v17

    invoke-static {v3, v0}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v8

    .line 339
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTransitionMidRadiusMultiplier:F

    move/from16 v17, v0

    move/from16 v0, v17

    invoke-static {v11, v0}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v9

    .line 340
    const/high16 v17, 0x3f800000    # 1.0f

    const/high16 v18, 0x3f800000    # 1.0f

    invoke-static/range {v17 .. v18}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v10

    .line 341
    .local v10, "kf3":Landroid/animation/Keyframe;
    const-string v17, "animationRadiusMultiplier"

    const/16 v18, 0x4

    move/from16 v0, v18

    new-array v0, v0, [Landroid/animation/Keyframe;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v7, v18, v19

    const/16 v19, 0x1

    aput-object v8, v18, v19

    const/16 v19, 0x2

    aput-object v9, v18, v19

    const/16 v19, 0x3

    aput-object v10, v18, v19

    invoke-static/range {v17 .. v18}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    move-result-object v13

    .line 344
    .local v13, "radiusReappear":Landroid/animation/PropertyValuesHolder;
    const/16 v17, 0x0

    const/16 v18, 0x0

    invoke-static/range {v17 .. v18}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v7

    .line 345
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-static {v3, v0}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v8

    .line 346
    const/high16 v17, 0x3f800000    # 1.0f

    const/high16 v18, 0x3f800000    # 1.0f

    invoke-static/range {v17 .. v18}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v9

    .line 347
    const-string v17, "alpha"

    const/16 v18, 0x3

    move/from16 v0, v18

    new-array v0, v0, [Landroid/animation/Keyframe;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v7, v18, v19

    const/16 v19, 0x1

    aput-object v8, v18, v19

    const/16 v19, 0x2

    aput-object v9, v18, v19

    invoke-static/range {v17 .. v18}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    move-result-object v5

    .line 349
    .local v5, "fadeIn":Landroid/animation/PropertyValuesHolder;
    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v0, v0, [Landroid/animation/PropertyValuesHolder;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aput-object v13, v17, v18

    const/16 v18, 0x1

    aput-object v5, v17, v18

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v17

    int-to-long v0, v14

    move-wide/from16 v18, v0

    invoke-virtual/range {v17 .. v19}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mReappearAnimator:Landroid/animation/ObjectAnimator;

    .line 351
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mReappearAnimator:Landroid/animation/ObjectAnimator;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mInvalidateUpdateListener:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$InvalidateUpdateListener;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 352
    return-void
.end method


# virtual methods
.method public getDisappearAnimator()Landroid/animation/ObjectAnimator;
    .registers 3

    .prologue
    .line 355
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mIsInitialized:Z

    if-eqz v0, :cond_c

    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mDrawValuesReady:Z

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mDisappearAnimator:Landroid/animation/ObjectAnimator;

    if-nez v0, :cond_15

    .line 356
    :cond_c
    const-string v0, "RadialTextsView"

    const-string v1, "RadialTextView was not ready for animation."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 357
    const/4 v0, 0x0

    .line 360
    :goto_14
    return-object v0

    :cond_15
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mDisappearAnimator:Landroid/animation/ObjectAnimator;

    goto :goto_14
.end method

.method public getReappearAnimator()Landroid/animation/ObjectAnimator;
    .registers 3

    .prologue
    .line 364
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mIsInitialized:Z

    if-eqz v0, :cond_c

    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mDrawValuesReady:Z

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mReappearAnimator:Landroid/animation/ObjectAnimator;

    if-nez v0, :cond_15

    .line 365
    :cond_c
    const-string v0, "RadialTextsView"

    const-string v1, "RadialTextView was not ready for animation."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 366
    const/4 v0, 0x0

    .line 369
    :goto_14
    return-object v0

    :cond_15
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mReappearAnimator:Landroid/animation/ObjectAnimator;

    goto :goto_14
.end method

.method public hasOverlappingRendering()Z
    .registers 2

    .prologue
    .line 179
    const/4 v0, 0x0

    return v0
.end method

.method public initialize(Landroid/content/res/Resources;[Ljava/lang/String;[Ljava/lang/String;ZZ)V
    .registers 13
    .param p1, "res"    # Landroid/content/res/Resources;
    .param p2, "texts"    # [Ljava/lang/String;
    .param p3, "innerTexts"    # [Ljava/lang/String;
    .param p4, "is24HourMode"    # Z
    .param p5, "disappearsOut"    # Z

    .prologue
    .line 87
    iget-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mIsInitialized:Z

    if-eqz v4, :cond_c

    .line 88
    const-string v4, "RadialTextsView"

    const-string v5, "This RadialTextsView may only be initialized once."

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    :goto_b
    return-void

    .line 93
    :cond_c
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_numbers_text_color:I

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 94
    .local v0, "numbersTextColor":I
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v4, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 95
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_radial_numbers_typeface:I

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 96
    .local v2, "typefaceFamily":Ljava/lang/String;
    const/4 v4, 0x0

    invoke-static {v2, v4}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v4

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTypefaceLight:Landroid/graphics/Typeface;

    .line 97
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_sans_serif:I

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 98
    .local v3, "typefaceFamilyRegular":Ljava/lang/String;
    const/4 v4, 0x0

    invoke-static {v3, v4}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v4

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTypefaceRegular:Landroid/graphics/Typeface;

    .line 99
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 100
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 103
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_white:I

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    .line 104
    .local v1, "selectedTextColor":I
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mSelectedPaint:Landroid/graphics/Paint;

    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 105
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mSelectedPaint:Landroid/graphics/Paint;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 106
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mSelectedPaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 108
    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTexts:[Ljava/lang/String;

    .line 109
    iput-object p3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mInnerTexts:[Ljava/lang/String;

    .line 110
    iput-boolean p4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mIs24HourMode:Z

    .line 111
    if-eqz p3, :cond_e5

    const/4 v4, 0x1

    :goto_5f
    iput-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mHasInnerCircle:Z

    .line 114
    if-eqz p4, :cond_e8

    .line 115
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_circle_radius_multiplier_24HourMode:I

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mCircleRadiusMultiplier:F

    .line 125
    :goto_6f
    const/4 v4, 0x7

    new-array v4, v4, [F

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTextGridHeights:[F

    .line 126
    const/4 v4, 0x7

    new-array v4, v4, [F

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTextGridWidths:[F

    .line 127
    iget-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mHasInnerCircle:Z

    if-eqz v4, :cond_102

    .line 128
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_numbers_radius_multiplier_outer:I

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mNumbersRadiusMultiplier:F

    .line 130
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_text_size_multiplier_outer:I

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTextSizeMultiplier:F

    .line 132
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_numbers_radius_multiplier_inner:I

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mInnerNumbersRadiusMultiplier:F

    .line 134
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_text_size_multiplier_inner:I

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mInnerTextSizeMultiplier:F

    .line 137
    const/4 v4, 0x7

    new-array v4, v4, [F

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mInnerTextGridHeights:[F

    .line 138
    const/4 v4, 0x7

    new-array v4, v4, [F

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mInnerTextGridWidths:[F

    .line 146
    :goto_b7
    const/high16 v4, 0x3f800000    # 1.0f

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mAnimationRadiusMultiplier:F

    .line 147
    const/high16 v5, 0x3f800000    # 1.0f

    const v6, 0x3d4ccccd    # 0.05f

    if-eqz p5, :cond_11b

    const/4 v4, -0x1

    :goto_c3
    int-to-float v4, v4

    mul-float/2addr v4, v6

    add-float/2addr v4, v5

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTransitionMidRadiusMultiplier:F

    .line 148
    const/high16 v5, 0x3f800000    # 1.0f

    const v6, 0x3e99999a    # 0.3f

    if-eqz p5, :cond_11d

    const/4 v4, 0x1

    :goto_d0
    int-to-float v4, v4

    mul-float/2addr v4, v6

    add-float/2addr v4, v5

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTransitionEndRadiusMultiplier:F

    .line 149
    new-instance v4, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$InvalidateUpdateListener;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$InvalidateUpdateListener;-><init>(Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$1;)V

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mInvalidateUpdateListener:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$InvalidateUpdateListener;

    .line 151
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTextGridValuesDirty:Z

    .line 152
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mIsInitialized:Z

    goto/16 :goto_b

    .line 111
    :cond_e5
    const/4 v4, 0x0

    goto/16 :goto_5f

    .line 118
    :cond_e8
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_circle_radius_multiplier:I

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mCircleRadiusMultiplier:F

    .line 120
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_ampm_circle_radius_multiplier:I

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mAmPmCircleRadiusMultiplier:F

    goto/16 :goto_6f

    .line 140
    :cond_102
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_numbers_radius_multiplier_normal:I

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mNumbersRadiusMultiplier:F

    .line 142
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_text_size_multiplier_normal:I

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTextSizeMultiplier:F

    goto :goto_b7

    .line 147
    :cond_11b
    const/4 v4, 0x1

    goto :goto_c3

    .line 148
    :cond_11d
    const/4 v4, -0x1

    goto :goto_d0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 15
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v10, 0x1

    .line 193
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getWidth()I

    move-result v12

    .line 194
    .local v12, "viewWidth":I
    if-eqz v12, :cond_b

    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mIsInitialized:Z

    if-nez v0, :cond_c

    .line 246
    :cond_b
    :goto_b
    return-void

    .line 198
    :cond_c
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mDrawValuesReady:Z

    if-nez v0, :cond_5c

    .line 199
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mXCenter:I

    .line 200
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mYCenter:I

    .line 201
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mXCenter:I

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mYCenter:I

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mCircleRadiusMultiplier:F

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mCircleRadius:F

    .line 202
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mIs24HourMode:Z

    if-nez v0, :cond_43

    .line 206
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mCircleRadius:F

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mAmPmCircleRadiusMultiplier:F

    mul-float v11, v0, v2

    .line 207
    .local v11, "amPmCircleRadius":F
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mYCenter:I

    int-to-double v4, v0

    float-to-double v6, v11

    const-wide/high16 v8, 0x3fe8000000000000L    # 0.75

    mul-double/2addr v6, v8

    sub-double/2addr v4, v6

    double-to-int v0, v4

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mYCenter:I

    .line 210
    .end local v11    # "amPmCircleRadius":F
    :cond_43
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mCircleRadius:F

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTextSizeMultiplier:F

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTextSize:F

    .line 211
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mHasInnerCircle:Z

    if-eqz v0, :cond_55

    .line 212
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mCircleRadius:F

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mInnerTextSizeMultiplier:F

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mInnerTextSize:F

    .line 216
    :cond_55
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->renderAnimations()V

    .line 218
    iput-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTextGridValuesDirty:Z

    .line 219
    iput-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mDrawValuesReady:Z

    .line 223
    :cond_5c
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTextGridValuesDirty:Z

    if-eqz v0, :cond_99

    .line 224
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mCircleRadius:F

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mNumbersRadiusMultiplier:F

    mul-float/2addr v0, v2

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mAnimationRadiusMultiplier:F

    mul-float v1, v0, v2

    .line 228
    .local v1, "numbersRadius":F
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mXCenter:I

    int-to-float v2, v0

    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mYCenter:I

    int-to-float v3, v0

    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTextSize:F

    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTextGridHeights:[F

    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTextGridWidths:[F

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->calculateGridSizes(FFFF[F[F)V

    .line 230
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mHasInnerCircle:Z

    if-eqz v0, :cond_96

    .line 232
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mCircleRadius:F

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mInnerNumbersRadiusMultiplier:F

    mul-float/2addr v0, v2

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mAnimationRadiusMultiplier:F

    mul-float v3, v0, v2

    .line 234
    .local v3, "innerNumbersRadius":F
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mXCenter:I

    int-to-float v4, v0

    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mYCenter:I

    int-to-float v5, v0

    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mInnerTextSize:F

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mInnerTextGridHeights:[F

    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mInnerTextGridWidths:[F

    move-object v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->calculateGridSizes(FFFF[F[F)V

    .line 237
    .end local v3    # "innerNumbersRadius":F
    :cond_96
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTextGridValuesDirty:Z

    .line 241
    .end local v1    # "numbersRadius":F
    :cond_99
    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTextSize:F

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTypefaceLight:Landroid/graphics/Typeface;

    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTexts:[Ljava/lang/String;

    iget-object v9, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTextGridWidths:[F

    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTextGridHeights:[F

    move-object v4, p0

    move-object v5, p1

    invoke-direct/range {v4 .. v10}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->drawTexts(Landroid/graphics/Canvas;FLandroid/graphics/Typeface;[Ljava/lang/String;[F[F)V

    .line 242
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mHasInnerCircle:Z

    if-eqz v0, :cond_b

    .line 243
    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mInnerTextSize:F

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTypefaceRegular:Landroid/graphics/Typeface;

    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mInnerTexts:[Ljava/lang/String;

    iget-object v9, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mInnerTextGridWidths:[F

    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mInnerTextGridHeights:[F

    move-object v4, p0

    move-object v5, p1

    invoke-direct/range {v4 .. v10}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->drawTexts(Landroid/graphics/Canvas;FLandroid/graphics/Typeface;[Ljava/lang/String;[F[F)V

    goto/16 :goto_b
.end method

.method public setAnimationRadiusMultiplier(F)V
    .registers 3
    .param p1, "animationRadiusMultiplier"    # F

    .prologue
    .line 187
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mAnimationRadiusMultiplier:F

    .line 188
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mTextGridValuesDirty:Z

    .line 189
    return-void
.end method

.method protected setSelection(I)V
    .registers 2
    .param p1, "selection"    # I

    .prologue
    .line 171
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->selection:I

    .line 172
    return-void
.end method

.method setTheme(Landroid/content/Context;Z)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "themeDark"    # Z

    .prologue
    .line 156
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 158
    .local v0, "res":Landroid/content/res/Resources;
    if-eqz p2, :cond_12

    .line 159
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_white:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    .line 163
    .local v1, "textColor":I
    :goto_c
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 164
    return-void

    .line 161
    .end local v1    # "textColor":I
    :cond_12
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_numbers_text_color:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    .restart local v1    # "textColor":I
    goto :goto_c
.end method
