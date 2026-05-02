.class public Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;
.super Landroid/view/View;
.source "RadialSelectorView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView$1;,
        Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView$InvalidateUpdateListener;
    }
.end annotation


# static fields
.field private static final FULL_ALPHA:I = 0xff

.field private static final SELECTED_ALPHA:I = 0xff

.field private static final SELECTED_ALPHA_THEME_DARK:I = 0xff

.field private static final TAG:Ljava/lang/String; = "RadialSelectorView"


# instance fields
.field private mAmPmCircleRadiusMultiplier:F

.field private mAnimationRadiusMultiplier:F

.field private mCircleRadius:I

.field private mCircleRadiusMultiplier:F

.field private mDrawValuesReady:Z

.field private mForceDrawDot:Z

.field private mHasInnerCircle:Z

.field private mInnerNumbersRadiusMultiplier:F

.field private mInvalidateUpdateListener:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView$InvalidateUpdateListener;

.field private mIs24HourMode:Z

.field private mIsInitialized:Z

.field private mLineLength:I

.field private mNumbersRadiusMultiplier:F

.field private mOuterNumbersRadiusMultiplier:F

.field private final mPaint:Landroid/graphics/Paint;

.field private mSelectionAlpha:I

.field private mSelectionDegrees:I

.field private mSelectionRadians:D

.field private mSelectionRadius:I

.field private mSelectionRadiusMultiplier:F

.field private mTransitionEndRadiusMultiplier:F

.field private mTransitionMidRadiusMultiplier:F

.field private mXCenter:I

.field private mYCenter:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 77
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 47
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mPaint:Landroid/graphics/Paint;

    .line 78
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mIsInitialized:Z

    .line 79
    return-void
.end method


# virtual methods
.method public getDegreesFromCoords(FFZ[Ljava/lang/Boolean;)I
    .registers 28
    .param p1, "pointX"    # F
    .param p2, "pointY"    # F
    .param p3, "forceLegal"    # Z
    .param p4, "isInnerCircle"    # [Ljava/lang/Boolean;

    .prologue
    .line 197
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mDrawValuesReady:Z

    move/from16 v19, v0

    if-nez v19, :cond_a

    .line 198
    const/4 v2, -0x1

    .line 268
    :cond_9
    :goto_9
    return v2

    .line 201
    :cond_a
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mYCenter:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    sub-float v19, p2, v19

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mYCenter:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    sub-float v20, p2, v20

    mul-float v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mXCenter:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    sub-float v20, p1, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mXCenter:I

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    sub-float v21, p1, v21

    mul-float v20, v20, v21

    add-float v19, v19, v20

    move/from16 v0, v19

    float-to-double v0, v0

    move-wide/from16 v19, v0

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v7

    .line 205
    .local v7, "hypotenuse":D
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mHasInnerCircle:Z

    move/from16 v19, v0

    if-eqz v19, :cond_198

    .line 206
    if-eqz p3, :cond_ff

    .line 209
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mCircleRadius:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mInnerNumbersRadiusMultiplier:F

    move/from16 v20, v0

    mul-float v19, v19, v20

    move/from16 v0, v19

    float-to-int v9, v0

    .line 210
    .local v9, "innerNumberRadius":I
    int-to-double v0, v9

    move-wide/from16 v19, v0

    sub-double v19, v7, v19

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->abs(D)D

    move-result-wide v19

    move-wide/from16 v0, v19

    double-to-int v3, v0

    .line 211
    .local v3, "distanceToInnerNumber":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mCircleRadius:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mOuterNumbersRadiusMultiplier:F

    move/from16 v20, v0

    mul-float v19, v19, v20

    move/from16 v0, v19

    float-to-int v14, v0

    .line 212
    .local v14, "outerNumberRadius":I
    int-to-double v0, v14

    move-wide/from16 v19, v0

    sub-double v19, v7, v19

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->abs(D)D

    move-result-wide v19

    move-wide/from16 v0, v19

    double-to-int v5, v0

    .line 214
    .local v5, "distanceToOuterNumber":I
    const/16 v20, 0x0

    if-gt v3, v5, :cond_fc

    const/16 v19, 0x1

    :goto_a1
    invoke-static/range {v19 .. v19}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v19

    aput-object v19, p4, v20

    .line 252
    .end local v3    # "distanceToInnerNumber":I
    .end local v5    # "distanceToOuterNumber":I
    .end local v9    # "innerNumberRadius":I
    .end local v14    # "outerNumberRadius":I
    :cond_a7
    :goto_a7
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mYCenter:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    sub-float v19, p2, v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Math;->abs(F)F

    move-result v13

    .line 253
    .local v13, "opposite":F
    float-to-double v0, v13

    move-wide/from16 v19, v0

    div-double v19, v19, v7

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->asin(D)D

    move-result-wide v15

    .line 254
    .local v15, "radians":D
    const-wide v19, 0x4066800000000000L    # 180.0

    mul-double v19, v19, v15

    const-wide v21, 0x400921fb54442d18L    # Math.PI

    div-double v19, v19, v21

    move-wide/from16 v0, v19

    double-to-int v2, v0

    .line 257
    .local v2, "degrees":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mXCenter:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    cmpl-float v19, p1, v19

    if-lez v19, :cond_1cd

    const/16 v17, 0x1

    .line 258
    .local v17, "rightSide":Z
    :goto_e3
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mYCenter:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    cmpg-float v19, p2, v19

    if-gez v19, :cond_1d1

    const/16 v18, 0x1

    .line 259
    .local v18, "topSide":Z
    :goto_f4
    if-eqz v17, :cond_1d5

    if-eqz v18, :cond_1d5

    .line 260
    rsub-int/lit8 v2, v2, 0x5a

    goto/16 :goto_9

    .line 214
    .end local v2    # "degrees":I
    .end local v13    # "opposite":F
    .end local v15    # "radians":D
    .end local v17    # "rightSide":Z
    .end local v18    # "topSide":Z
    .restart local v3    # "distanceToInnerNumber":I
    .restart local v5    # "distanceToOuterNumber":I
    .restart local v9    # "innerNumberRadius":I
    .restart local v14    # "outerNumberRadius":I
    :cond_fc
    const/16 v19, 0x0

    goto :goto_a1

    .line 219
    .end local v3    # "distanceToInnerNumber":I
    .end local v5    # "distanceToOuterNumber":I
    .end local v9    # "innerNumberRadius":I
    .end local v14    # "outerNumberRadius":I
    :cond_ff
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mCircleRadius:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mInnerNumbersRadiusMultiplier:F

    move/from16 v20, v0

    mul-float v19, v19, v20

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mSelectionRadius:I

    move/from16 v20, v0

    sub-int v12, v19, v20

    .line 221
    .local v12, "minAllowedHypotenuseForInnerNumber":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mCircleRadius:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mOuterNumbersRadiusMultiplier:F

    move/from16 v20, v0

    mul-float v19, v19, v20

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mSelectionRadius:I

    move/from16 v20, v0

    add-int v11, v19, v20

    .line 223
    .local v11, "maxAllowedHypotenuseForOuterNumber":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mCircleRadius:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mOuterNumbersRadiusMultiplier:F

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mInnerNumbersRadiusMultiplier:F

    move/from16 v21, v0

    add-float v20, v20, v21

    const/high16 v21, 0x40000000    # 2.0f

    div-float v20, v20, v21

    mul-float v19, v19, v20

    move/from16 v0, v19

    float-to-int v6, v0

    .line 226
    .local v6, "halfwayHypotenusePoint":I
    int-to-double v0, v12

    move-wide/from16 v19, v0

    cmpl-double v19, v7, v19

    if-ltz v19, :cond_17b

    int-to-double v0, v6

    move-wide/from16 v19, v0

    cmpg-double v19, v7, v19

    if-gtz v19, :cond_17b

    .line 228
    const/16 v19, 0x0

    const/16 v20, 0x1

    invoke-static/range {v20 .. v20}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v20

    aput-object v20, p4, v19

    goto/16 :goto_a7

    .line 229
    :cond_17b
    int-to-double v0, v11

    move-wide/from16 v19, v0

    cmpg-double v19, v7, v19

    if-gtz v19, :cond_195

    int-to-double v0, v6

    move-wide/from16 v19, v0

    cmpl-double v19, v7, v19

    if-ltz v19, :cond_195

    .line 231
    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-static/range {v20 .. v20}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v20

    aput-object v20, p4, v19

    goto/16 :goto_a7

    .line 233
    :cond_195
    const/4 v2, -0x1

    goto/16 :goto_9

    .line 240
    .end local v6    # "halfwayHypotenusePoint":I
    .end local v11    # "maxAllowedHypotenuseForOuterNumber":I
    .end local v12    # "minAllowedHypotenuseForInnerNumber":I
    :cond_198
    if-nez p3, :cond_a7

    .line 241
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mLineLength:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-double v0, v0

    move-wide/from16 v19, v0

    sub-double v19, v7, v19

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->abs(D)D

    move-result-wide v19

    move-wide/from16 v0, v19

    double-to-int v4, v0

    .line 244
    .local v4, "distanceToNumber":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mCircleRadius:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    const/high16 v20, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mNumbersRadiusMultiplier:F

    move/from16 v21, v0

    sub-float v20, v20, v21

    mul-float v19, v19, v20

    move/from16 v0, v19

    float-to-int v10, v0

    .line 245
    .local v10, "maxAllowedDistance":I
    if-le v4, v10, :cond_a7

    .line 246
    const/4 v2, -0x1

    goto/16 :goto_9

    .line 257
    .end local v4    # "distanceToNumber":I
    .end local v10    # "maxAllowedDistance":I
    .restart local v2    # "degrees":I
    .restart local v13    # "opposite":F
    .restart local v15    # "radians":D
    :cond_1cd
    const/16 v17, 0x0

    goto/16 :goto_e3

    .line 258
    .restart local v17    # "rightSide":Z
    :cond_1d1
    const/16 v18, 0x0

    goto/16 :goto_f4

    .line 261
    .restart local v18    # "topSide":Z
    :cond_1d5
    if-eqz v17, :cond_1dd

    if-nez v18, :cond_1dd

    .line 262
    add-int/lit8 v2, v2, 0x5a

    goto/16 :goto_9

    .line 263
    :cond_1dd
    if-nez v17, :cond_1e5

    if-nez v18, :cond_1e5

    .line 264
    rsub-int v2, v2, 0x10e

    goto/16 :goto_9

    .line 265
    :cond_1e5
    if-nez v17, :cond_9

    if-eqz v18, :cond_9

    .line 266
    add-int/lit16 v2, v2, 0x10e

    goto/16 :goto_9
.end method

.method public getDisappearAnimator()Landroid/animation/ObjectAnimator;
    .registers 16

    .prologue
    const/4 v14, 0x2

    const/4 v13, 0x1

    const/4 v12, 0x0

    const/4 v11, 0x0

    const/high16 v10, 0x3f800000    # 1.0f

    .line 325
    iget-boolean v8, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mIsInitialized:Z

    if-eqz v8, :cond_e

    iget-boolean v8, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mDrawValuesReady:Z

    if-nez v8, :cond_17

    .line 326
    :cond_e
    const-string v8, "RadialSelectorView"

    const-string v9, "RadialSelectorView was not ready for animation."

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 327
    const/4 v0, 0x0

    .line 348
    :goto_16
    return-object v0

    .line 331
    :cond_17
    const v6, 0x3e4ccccd    # 0.2f

    .line 332
    .local v6, "midwayPoint":F
    const/16 v1, 0x1f4

    .line 334
    .local v1, "duration":I
    invoke-static {v11, v10}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v3

    .line 335
    .local v3, "kf0":Landroid/animation/Keyframe;
    iget v8, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mTransitionMidRadiusMultiplier:F

    invoke-static {v6, v8}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v4

    .line 336
    .local v4, "kf1":Landroid/animation/Keyframe;
    iget v8, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mTransitionEndRadiusMultiplier:F

    invoke-static {v10, v8}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v5

    .line 337
    .local v5, "kf2":Landroid/animation/Keyframe;
    const-string v8, "animationRadiusMultiplier"

    const/4 v9, 0x3

    new-array v9, v9, [Landroid/animation/Keyframe;

    aput-object v3, v9, v12

    aput-object v4, v9, v13

    aput-object v5, v9, v14

    invoke-static {v8, v9}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    move-result-object v7

    .line 340
    .local v7, "radiusDisappear":Landroid/animation/PropertyValuesHolder;
    invoke-static {v11, v10}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v3

    .line 341
    invoke-static {v10, v11}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v4

    .line 342
    const-string v8, "alpha"

    new-array v9, v14, [Landroid/animation/Keyframe;

    aput-object v3, v9, v12

    aput-object v4, v9, v13

    invoke-static {v8, v9}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    move-result-object v2

    .line 344
    .local v2, "fadeOut":Landroid/animation/PropertyValuesHolder;
    new-array v8, v14, [Landroid/animation/PropertyValuesHolder;

    aput-object v7, v8, v12

    aput-object v2, v8, v13

    invoke-static {p0, v8}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v8

    int-to-long v9, v1

    invoke-virtual {v8, v9, v10}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 346
    .local v0, "disappearAnimator":Landroid/animation/ObjectAnimator;
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mInvalidateUpdateListener:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView$InvalidateUpdateListener;

    invoke-virtual {v0, v8}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    goto :goto_16
.end method

.method public getReappearAnimator()Landroid/animation/ObjectAnimator;
    .registers 20

    .prologue
    .line 352
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mIsInitialized:Z

    move/from16 v16, v0

    if-eqz v16, :cond_10

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mDrawValuesReady:Z

    move/from16 v16, v0

    if-nez v16, :cond_19

    .line 353
    :cond_10
    const-string v16, "RadialSelectorView"

    const-string v17, "RadialSelectorView was not ready for animation."

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 354
    const/4 v12, 0x0

    .line 386
    :goto_18
    return-object v12

    .line 358
    :cond_19
    const v10, 0x3e4ccccd    # 0.2f

    .line 359
    .local v10, "midwayPoint":F
    const/16 v4, 0x1f4

    .line 364
    .local v4, "duration":I
    const/high16 v2, 0x3e800000    # 0.25f

    .line 365
    .local v2, "delayMultiplier":F
    const/high16 v15, 0x3f800000    # 1.0f

    .line 366
    .local v15, "transitionDurationMultiplier":F
    add-float v14, v15, v2

    .line 367
    .local v14, "totalDurationMultiplier":F
    int-to-float v0, v4

    move/from16 v16, v0

    mul-float v16, v16, v14

    move/from16 v0, v16

    float-to-int v13, v0

    .line 368
    .local v13, "totalDuration":I
    int-to-float v0, v4

    move/from16 v16, v0

    mul-float v16, v16, v2

    int-to-float v0, v13

    move/from16 v17, v0

    div-float v3, v16, v17

    .line 369
    .local v3, "delayPoint":F
    const/high16 v16, 0x3f800000    # 1.0f

    const/high16 v17, 0x3f800000    # 1.0f

    sub-float v17, v17, v3

    mul-float v17, v17, v10

    sub-float v10, v16, v17

    .line 371
    const/16 v16, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mTransitionEndRadiusMultiplier:F

    move/from16 v17, v0

    invoke-static/range {v16 .. v17}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v6

    .line 372
    .local v6, "kf0":Landroid/animation/Keyframe;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mTransitionEndRadiusMultiplier:F

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-static {v3, v0}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v7

    .line 373
    .local v7, "kf1":Landroid/animation/Keyframe;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mTransitionMidRadiusMultiplier:F

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-static {v10, v0}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v8

    .line 374
    .local v8, "kf2":Landroid/animation/Keyframe;
    const/high16 v16, 0x3f800000    # 1.0f

    const/high16 v17, 0x3f800000    # 1.0f

    invoke-static/range {v16 .. v17}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v9

    .line 375
    .local v9, "kf3":Landroid/animation/Keyframe;
    const-string v16, "animationRadiusMultiplier"

    const/16 v17, 0x4

    move/from16 v0, v17

    new-array v0, v0, [Landroid/animation/Keyframe;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aput-object v6, v17, v18

    const/16 v18, 0x1

    aput-object v7, v17, v18

    const/16 v18, 0x2

    aput-object v8, v17, v18

    const/16 v18, 0x3

    aput-object v9, v17, v18

    invoke-static/range {v16 .. v17}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    move-result-object v11

    .line 378
    .local v11, "radiusReappear":Landroid/animation/PropertyValuesHolder;
    const/16 v16, 0x0

    const/16 v17, 0x0

    invoke-static/range {v16 .. v17}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v6

    .line 379
    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-static {v3, v0}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v7

    .line 380
    const/high16 v16, 0x3f800000    # 1.0f

    const/high16 v17, 0x3f800000    # 1.0f

    invoke-static/range {v16 .. v17}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v8

    .line 381
    const-string v16, "alpha"

    const/16 v17, 0x3

    move/from16 v0, v17

    new-array v0, v0, [Landroid/animation/Keyframe;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aput-object v6, v17, v18

    const/16 v18, 0x1

    aput-object v7, v17, v18

    const/16 v18, 0x2

    aput-object v8, v17, v18

    invoke-static/range {v16 .. v17}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    move-result-object v5

    .line 383
    .local v5, "fadeIn":Landroid/animation/PropertyValuesHolder;
    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Landroid/animation/PropertyValuesHolder;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aput-object v11, v16, v17

    const/16 v17, 0x1

    aput-object v5, v16, v17

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v16

    int-to-long v0, v13

    move-wide/from16 v17, v0

    invoke-virtual/range {v16 .. v18}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v12

    .line 385
    .local v12, "reappearAnimator":Landroid/animation/ObjectAnimator;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mInvalidateUpdateListener:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView$InvalidateUpdateListener;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    goto/16 :goto_18
.end method

.method public hasOverlappingRendering()Z
    .registers 2

    .prologue
    .line 185
    const/4 v0, 0x0

    return v0
.end method

.method public initialize(Landroid/content/Context;ZZZIZ)V
    .registers 14
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "is24HourMode"    # Z
    .param p3, "hasInnerCircle"    # Z
    .param p4, "disappearsOut"    # Z
    .param p5, "selectionDegrees"    # I
    .param p6, "isInnerCircle"    # Z

    .prologue
    const/4 v3, -0x1

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v4, 0x1

    .line 96
    iget-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mIsInitialized:Z

    if-eqz v2, :cond_10

    .line 97
    const-string v2, "RadialSelectorView"

    const-string v3, "This RadialSelectorView may only be initialized once."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    :goto_f
    return-void

    .line 101
    :cond_10
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 103
    .local v1, "res":Landroid/content/res/Resources;
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_accent_color:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 104
    .local v0, "accentColor":I
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 105
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 106
    const/16 v2, 0xff

    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mSelectionAlpha:I

    .line 109
    iput-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mIs24HourMode:Z

    .line 110
    if-eqz p2, :cond_87

    .line 111
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_circle_radius_multiplier_24HourMode:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mCircleRadiusMultiplier:F

    .line 121
    :goto_38
    iput-boolean p3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mHasInnerCircle:Z

    .line 122
    if-eqz p3, :cond_a0

    .line 123
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_numbers_radius_multiplier_inner:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mInnerNumbersRadiusMultiplier:F

    .line 125
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_numbers_radius_multiplier_outer:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mOuterNumbersRadiusMultiplier:F

    .line 131
    :goto_54
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_selection_radius_multiplier:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mSelectionRadiusMultiplier:F

    .line 135
    iput v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mAnimationRadiusMultiplier:F

    .line 136
    const v5, 0x3d4ccccd    # 0.05f

    if-eqz p4, :cond_ad

    move v2, v3

    :goto_68
    int-to-float v2, v2

    mul-float/2addr v2, v5

    add-float/2addr v2, v6

    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mTransitionMidRadiusMultiplier:F

    .line 137
    const v2, 0x3e99999a    # 0.3f

    if-eqz p4, :cond_73

    move v3, v4

    :cond_73
    int-to-float v3, v3

    mul-float/2addr v2, v3

    add-float/2addr v2, v6

    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mTransitionEndRadiusMultiplier:F

    .line 138
    new-instance v2, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView$InvalidateUpdateListener;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView$InvalidateUpdateListener;-><init>(Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView$1;)V

    iput-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mInvalidateUpdateListener:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView$InvalidateUpdateListener;

    .line 140
    const/4 v2, 0x0

    invoke-virtual {p0, p5, p6, v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->setSelection(IZZ)V

    .line 141
    iput-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mIsInitialized:Z

    goto :goto_f

    .line 114
    :cond_87
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_circle_radius_multiplier:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mCircleRadiusMultiplier:F

    .line 116
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_ampm_circle_radius_multiplier:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mAmPmCircleRadiusMultiplier:F

    goto :goto_38

    .line 128
    :cond_a0
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_numbers_radius_multiplier_normal:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mNumbersRadiusMultiplier:F

    goto :goto_54

    :cond_ad
    move v2, v4

    .line 136
    goto :goto_68
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 16
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/16 v13, 0xff

    const/4 v0, 0x1

    .line 273
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getWidth()I

    move-result v10

    .line 274
    .local v10, "viewWidth":I
    if-eqz v10, :cond_d

    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mIsInitialized:Z

    if-nez v1, :cond_e

    .line 322
    :cond_d
    :goto_d
    return-void

    .line 278
    :cond_e
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mDrawValuesReady:Z

    if-nez v1, :cond_52

    .line 279
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mXCenter:I

    .line 280
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mYCenter:I

    .line 281
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mXCenter:I

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mYCenter:I

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mCircleRadiusMultiplier:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mCircleRadius:I

    .line 283
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mIs24HourMode:Z

    if-nez v1, :cond_47

    .line 287
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mCircleRadius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mAmPmCircleRadiusMultiplier:F

    mul-float/2addr v1, v2

    float-to-int v6, v1

    .line 288
    .local v6, "amPmCircleRadius":I
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mYCenter:I

    int-to-double v1, v1

    int-to-double v3, v6

    const-wide/high16 v11, 0x3fe8000000000000L    # 0.75

    mul-double/2addr v3, v11

    sub-double/2addr v1, v3

    double-to-int v1, v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mYCenter:I

    .line 291
    .end local v6    # "amPmCircleRadius":I
    :cond_47
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mCircleRadius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mSelectionRadiusMultiplier:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mSelectionRadius:I

    .line 293
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mDrawValuesReady:Z

    .line 297
    :cond_52
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mCircleRadius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mNumbersRadiusMultiplier:F

    mul-float/2addr v1, v2

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mAnimationRadiusMultiplier:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mLineLength:I

    .line 298
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mXCenter:I

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mLineLength:I

    int-to-double v2, v2

    iget-wide v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mSelectionRadians:D

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    mul-double/2addr v2, v4

    double-to-int v2, v2

    add-int v8, v1, v2

    .line 299
    .local v8, "pointX":I
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mYCenter:I

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mLineLength:I

    int-to-double v2, v2

    iget-wide v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mSelectionRadians:D

    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    move-result-wide v4

    mul-double/2addr v2, v4

    double-to-int v2, v2

    sub-int v9, v1, v2

    .line 302
    .local v9, "pointY":I
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mSelectionAlpha:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 303
    int-to-float v1, v8

    int-to-float v2, v9

    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mSelectionRadius:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 305
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mForceDrawDot:Z

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mSelectionDegrees:I

    rem-int/lit8 v2, v2, 0x1e

    if-eqz v2, :cond_c7

    :goto_95
    or-int/2addr v0, v1

    if-eqz v0, :cond_c9

    .line 307
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v13}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 308
    int-to-float v0, v8

    int-to-float v1, v9

    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mSelectionRadius:I

    mul-int/lit8 v2, v2, 0x2

    div-int/lit8 v2, v2, 0x7

    int-to-float v2, v2

    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 319
    :goto_ab
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v13}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 320
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 321
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mXCenter:I

    int-to-float v1, v0

    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mYCenter:I

    int-to-float v2, v0

    int-to-float v3, v8

    int-to-float v4, v9

    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_d

    .line 305
    :cond_c7
    const/4 v0, 0x0

    goto :goto_95

    .line 312
    :cond_c9
    iget v7, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mLineLength:I

    .line 313
    .local v7, "lineLength":I
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mSelectionRadius:I

    sub-int/2addr v7, v0

    .line 314
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mXCenter:I

    int-to-double v1, v7

    iget-wide v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mSelectionRadians:D

    invoke-static {v3, v4}, Ljava/lang/Math;->sin(D)D

    move-result-wide v3

    mul-double/2addr v1, v3

    double-to-int v1, v1

    add-int v8, v0, v1

    .line 315
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mYCenter:I

    int-to-double v1, v7

    iget-wide v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mSelectionRadians:D

    invoke-static {v3, v4}, Ljava/lang/Math;->cos(D)D

    move-result-wide v3

    mul-double/2addr v1, v3

    double-to-int v1, v1

    sub-int v9, v0, v1

    goto :goto_ab
.end method

.method public setAnimationRadiusMultiplier(F)V
    .registers 2
    .param p1, "animationRadiusMultiplier"    # F

    .prologue
    .line 192
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mAnimationRadiusMultiplier:F

    .line 193
    return-void
.end method

.method public setSelection(IZZ)V
    .registers 8
    .param p1, "selectionDegrees"    # I
    .param p2, "isInnerCircle"    # Z
    .param p3, "forceDrawDot"    # Z

    .prologue
    .line 167
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mSelectionDegrees:I

    .line 168
    int-to-double v0, p1

    const-wide v2, 0x400921fb54442d18L    # Math.PI

    mul-double/2addr v0, v2

    const-wide v2, 0x4066800000000000L    # 180.0

    div-double/2addr v0, v2

    iput-wide v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mSelectionRadians:D

    .line 169
    iput-boolean p3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mForceDrawDot:Z

    .line 171
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mHasInnerCircle:Z

    if-eqz v0, :cond_1d

    .line 172
    if-eqz p2, :cond_1e

    .line 173
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mInnerNumbersRadiusMultiplier:F

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mNumbersRadiusMultiplier:F

    .line 178
    :cond_1d
    :goto_1d
    return-void

    .line 175
    :cond_1e
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mOuterNumbersRadiusMultiplier:F

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mNumbersRadiusMultiplier:F

    goto :goto_1d
.end method

.method setTheme(Landroid/content/Context;Z)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "themeDark"    # Z

    .prologue
    const/16 v3, 0xff

    .line 145
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 147
    .local v1, "res":Landroid/content/res/Resources;
    if-eqz p2, :cond_16

    .line 148
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_red:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 149
    .local v0, "color":I
    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mSelectionAlpha:I

    .line 154
    :goto_10
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 155
    return-void

    .line 151
    .end local v0    # "color":I
    :cond_16
    sget v2, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_accent_color:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 152
    .restart local v0    # "color":I
    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->mSelectionAlpha:I

    goto :goto_10
.end method
