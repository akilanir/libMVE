.class public Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
.super Ljava/lang/Object;
.source "CircularProgressDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/drawable/CircularProgressDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mInAnimationDuration:I

.field private mInColors:[I

.field private mInStepPercent:F

.field private mInitialAngle:F

.field private mKeepDuration:I

.field private mMaxSweepAngle:F

.field private mMinSweepAngle:F

.field private mOutAnimationDuration:I

.field private mPadding:I

.field private mProgressMode:I

.field private mProgressPercent:F

.field private mReverse:Z

.field private mRotateDuration:I

.field private mSecondaryProgressPercent:F

.field private mStrokeColors:[I

.field private mStrokeSecondaryColor:I

.field private mStrokeSize:I

.field private mTransformDuration:I

.field private mTransformInterpolator:Landroid/view/animation/Interpolator;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 625
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "defStyleRes"    # I

    .prologue
    .line 628
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1, p2}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 629
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/4 v6, 0x0

    const v10, 0x10e0001

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 631
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 632
    sget-object v5, Lcom/rey/material/R$styleable;->CircularProgressDrawable:[I

    invoke-virtual {p1, p2, v5, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 635
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v5, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_padding:I

    invoke-virtual {v0, v5, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    invoke-virtual {p0, v5}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->padding(I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    .line 636
    sget v5, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_initialAngle:I

    invoke-virtual {v0, v5, v8}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {p0, v5}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->initialAngle(F)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    .line 637
    sget v5, Lcom/rey/material/R$styleable;->CircularProgressDrawable_pv_progress:I

    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    invoke-virtual {p0, v5}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->progressPercent(F)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    .line 638
    sget v5, Lcom/rey/material/R$styleable;->CircularProgressDrawable_pv_secondaryProgress:I

    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    invoke-virtual {p0, v5}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->secondaryProgressPercent(F)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    .line 639
    sget v5, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_maxSweepAngle:I

    const/16 v6, 0x10e

    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {p0, v5}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->maxSweepAngle(F)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    .line 640
    sget v5, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_minSweepAngle:I

    invoke-virtual {v0, v5, v9}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {p0, v5}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->minSweepAngle(F)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    .line 641
    sget v5, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_strokeSize:I

    const/4 v6, 0x4

    invoke-static {p1, v6}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    invoke-virtual {p0, v5}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->strokeSize(I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    .line 642
    new-array v5, v9, [I

    sget v6, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_strokeColor:I

    const/high16 v7, -0x1000000

    invoke-static {p1, v7}, Lcom/rey/material/util/ThemeUtil;->colorPrimary(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v6

    aput v6, v5, v8

    invoke-virtual {p0, v5}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->strokeColors([I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    .line 643
    sget v5, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_strokeColors:I

    invoke-virtual {v0, v5, v8}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    .local v3, "resId":I
    if-eqz v3, :cond_97

    .line 644
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v4

    .line 645
    .local v4, "ta":Landroid/content/res/TypedArray;
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->length()I

    move-result v5

    new-array v1, v5, [I

    .line 646
    .local v1, "colors":[I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_82
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->length()I

    move-result v5

    if-ge v2, v5, :cond_91

    .line 647
    invoke-virtual {v4, v2, v8}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v5

    aput v5, v1, v2

    .line 646
    add-int/lit8 v2, v2, 0x1

    goto :goto_82

    .line 648
    :cond_91
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->recycle()V

    .line 649
    invoke-virtual {p0, v1}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->strokeColors([I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    .line 651
    .end local v1    # "colors":[I
    .end local v2    # "j":I
    .end local v4    # "ta":Landroid/content/res/TypedArray;
    :cond_97
    sget v5, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_strokeSecondaryColor:I

    invoke-virtual {v0, v5, v8}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v5

    invoke-virtual {p0, v5}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->strokeSecondaryColor(I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    .line 652
    sget v5, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_reverse:I

    invoke-virtual {v0, v5, v8}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    invoke-virtual {p0, v5}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->reverse(Z)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    .line 653
    sget v5, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_rotateDuration:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x10e0002

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v6

    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v5

    invoke-virtual {p0, v5}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->rotateDuration(I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    .line 654
    sget v5, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_transformDuration:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v10}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v6

    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v5

    invoke-virtual {p0, v5}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->transformDuration(I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    .line 655
    sget v5, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_keepDuration:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const/high16 v7, 0x10e0000

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v6

    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v5

    invoke-virtual {p0, v5}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->keepDuration(I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    .line 656
    sget v5, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_transformInterpolator:I

    invoke-virtual {v0, v5, v8}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    if-eqz v3, :cond_f0

    .line 657
    invoke-static {p1, v3}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->transformInterpolator(Landroid/view/animation/Interpolator;)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    .line 658
    :cond_f0
    sget v5, Lcom/rey/material/R$styleable;->CircularProgressDrawable_pv_progressMode:I

    invoke-virtual {v0, v5, v9}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v5

    invoke-virtual {p0, v5}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->progressMode(I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    .line 659
    sget v5, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_inAnimDuration:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v10}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v6

    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v5

    invoke-virtual {p0, v5}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->inAnimDuration(I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    .line 660
    sget v5, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_inStepColors:I

    invoke-virtual {v0, v5, v8}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    if-eqz v3, :cond_136

    .line 661
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v4

    .line 662
    .restart local v4    # "ta":Landroid/content/res/TypedArray;
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->length()I

    move-result v5

    new-array v1, v5, [I

    .line 663
    .restart local v1    # "colors":[I
    const/4 v2, 0x0

    .restart local v2    # "j":I
    :goto_121
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->length()I

    move-result v5

    if-ge v2, v5, :cond_130

    .line 664
    invoke-virtual {v4, v2, v8}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v5

    aput v5, v1, v2

    .line 663
    add-int/lit8 v2, v2, 0x1

    goto :goto_121

    .line 665
    :cond_130
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->recycle()V

    .line 666
    invoke-virtual {p0, v1}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->inStepColors([I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    .line 668
    .end local v1    # "colors":[I
    .end local v2    # "j":I
    .end local v4    # "ta":Landroid/content/res/TypedArray;
    :cond_136
    sget v5, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_inStepPercent:I

    const/high16 v6, 0x3f000000    # 0.5f

    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    invoke-virtual {p0, v5}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->inStepPercent(F)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    .line 669
    sget v5, Lcom/rey/material/R$styleable;->CircularProgressDrawable_cpd_outAnimDuration:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v10}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v6

    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v5

    invoke-virtual {p0, v5}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->outAnimDuration(I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    .line 670
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 671
    return-void
.end method


# virtual methods
.method public build()Lcom/rey/material/drawable/CircularProgressDrawable;
    .registers 23

    .prologue
    .line 674
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mStrokeColors:[I

    if-nez v1, :cond_13

    .line 675
    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v2, 0x0

    const v3, -0xff6601

    aput v3, v1, v2

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mStrokeColors:[I

    .line 677
    :cond_13
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mInColors:[I

    if-nez v1, :cond_29

    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mInAnimationDuration:I

    if-lez v1, :cond_29

    .line 678
    const/4 v1, 0x3

    new-array v1, v1, [I

    fill-array-data v1, :array_96

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mInColors:[I

    .line 680
    :cond_29
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mTransformInterpolator:Landroid/view/animation/Interpolator;

    if-nez v1, :cond_38

    .line 681
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mTransformInterpolator:Landroid/view/animation/Interpolator;

    .line 683
    :cond_38
    new-instance v1, Lcom/rey/material/drawable/CircularProgressDrawable;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mPadding:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mInitialAngle:F

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mProgressPercent:F

    move-object/from16 v0, p0

    iget v5, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mSecondaryProgressPercent:F

    move-object/from16 v0, p0

    iget v6, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mMaxSweepAngle:F

    move-object/from16 v0, p0

    iget v7, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mMinSweepAngle:F

    move-object/from16 v0, p0

    iget v8, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mStrokeSize:I

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mStrokeColors:[I

    move-object/from16 v0, p0

    iget v10, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mStrokeSecondaryColor:I

    move-object/from16 v0, p0

    iget-boolean v11, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mReverse:Z

    move-object/from16 v0, p0

    iget v12, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mRotateDuration:I

    move-object/from16 v0, p0

    iget v13, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mTransformDuration:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mKeepDuration:I

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mTransformInterpolator:Landroid/view/animation/Interpolator;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mProgressMode:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mInAnimationDuration:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mInStepPercent:F

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mInColors:[I

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mOutAnimationDuration:I

    move/from16 v20, v0

    const/16 v21, 0x0

    invoke-direct/range {v1 .. v21}, Lcom/rey/material/drawable/CircularProgressDrawable;-><init>(IFFFFFI[IIZIIILandroid/view/animation/Interpolator;IIF[IILcom/rey/material/drawable/CircularProgressDrawable$1;)V

    return-object v1

    .line 678
    :array_96
    .array-data 4
        -0x4a2b01
        -0x211504
        -0x50002
    .end array-data
.end method

.method public inAnimDuration(I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 766
    iput p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mInAnimationDuration:I

    .line 767
    return-object p0
.end method

.method public varargs inStepColors([I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
    .registers 2
    .param p1, "colors"    # [I

    .prologue
    .line 776
    iput-object p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mInColors:[I

    .line 777
    return-object p0
.end method

.method public inStepPercent(F)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
    .registers 2
    .param p1, "percent"    # F

    .prologue
    .line 771
    iput p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mInStepPercent:F

    .line 772
    return-object p0
.end method

.method public initialAngle(F)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
    .registers 2
    .param p1, "angle"    # F

    .prologue
    .line 692
    iput p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mInitialAngle:F

    .line 693
    return-object p0
.end method

.method public keepDuration(I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 751
    iput p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mKeepDuration:I

    .line 752
    return-object p0
.end method

.method public maxSweepAngle(F)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
    .registers 2
    .param p1, "angle"    # F

    .prologue
    .line 707
    iput p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mMaxSweepAngle:F

    .line 708
    return-object p0
.end method

.method public minSweepAngle(F)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
    .registers 2
    .param p1, "angle"    # F

    .prologue
    .line 712
    iput p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mMinSweepAngle:F

    .line 713
    return-object p0
.end method

.method public outAnimDuration(I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 781
    iput p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mOutAnimationDuration:I

    .line 782
    return-object p0
.end method

.method public padding(I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
    .registers 2
    .param p1, "padding"    # I

    .prologue
    .line 687
    iput p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mPadding:I

    .line 688
    return-object p0
.end method

.method public progressMode(I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
    .registers 2
    .param p1, "mode"    # I

    .prologue
    .line 761
    iput p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mProgressMode:I

    .line 762
    return-object p0
.end method

.method public progressPercent(F)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
    .registers 2
    .param p1, "percent"    # F

    .prologue
    .line 697
    iput p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mProgressPercent:F

    .line 698
    return-object p0
.end method

.method public reverse()Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
    .registers 2

    .prologue
    .line 737
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->reverse(Z)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;

    move-result-object v0

    return-object v0
.end method

.method public reverse(Z)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
    .registers 2
    .param p1, "reverse"    # Z

    .prologue
    .line 732
    iput-boolean p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mReverse:Z

    .line 733
    return-object p0
.end method

.method public rotateDuration(I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 741
    iput p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mRotateDuration:I

    .line 742
    return-object p0
.end method

.method public secondaryProgressPercent(F)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
    .registers 2
    .param p1, "percent"    # F

    .prologue
    .line 702
    iput p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mSecondaryProgressPercent:F

    .line 703
    return-object p0
.end method

.method public varargs strokeColors([I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
    .registers 2
    .param p1, "strokeColors"    # [I

    .prologue
    .line 722
    iput-object p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mStrokeColors:[I

    .line 723
    return-object p0
.end method

.method public strokeSecondaryColor(I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 727
    iput p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mStrokeSecondaryColor:I

    .line 728
    return-object p0
.end method

.method public strokeSize(I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
    .registers 2
    .param p1, "strokeSize"    # I

    .prologue
    .line 717
    iput p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mStrokeSize:I

    .line 718
    return-object p0
.end method

.method public transformDuration(I)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 746
    iput p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mTransformDuration:I

    .line 747
    return-object p0
.end method

.method public transformInterpolator(Landroid/view/animation/Interpolator;)Lcom/rey/material/drawable/CircularProgressDrawable$Builder;
    .registers 2
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 756
    iput-object p1, p0, Lcom/rey/material/drawable/CircularProgressDrawable$Builder;->mTransformInterpolator:Landroid/view/animation/Interpolator;

    .line 757
    return-object p0
.end method
