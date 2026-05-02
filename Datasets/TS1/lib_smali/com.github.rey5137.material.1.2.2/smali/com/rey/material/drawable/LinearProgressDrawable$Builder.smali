.class public Lcom/rey/material/drawable/LinearProgressDrawable$Builder;
.super Ljava/lang/Object;
.source "LinearProgressDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/drawable/LinearProgressDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mInAnimationDuration:I

.field private mKeepDuration:I

.field private mMaxLineWidth:I

.field private mMaxLineWidthPercent:F

.field private mMinLineWidth:I

.field private mMinLineWidthPercent:F

.field private mOutAnimationDuration:I

.field private mProgressMode:I

.field private mProgressPercent:F

.field private mReverse:Z

.field private mSecondaryProgressPercent:F

.field private mStrokeColors:[I

.field private mStrokeSecondaryColor:I

.field private mStrokeSize:I

.field private mTransformDuration:I

.field private mTransformInterpolator:Landroid/view/animation/Interpolator;

.field private mTravelDuration:I

.field private mVerticalAlign:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/16 v1, 0x190

    const/4 v0, 0x0

    .line 931
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 912
    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mProgressPercent:F

    .line 913
    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mSecondaryProgressPercent:F

    .line 918
    const/16 v0, 0x8

    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mStrokeSize:I

    .line 919
    const/4 v0, 0x2

    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mVerticalAlign:I

    .line 922
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mReverse:Z

    .line 923
    const/16 v0, 0x3e8

    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mTravelDuration:I

    .line 924
    const/16 v0, 0x320

    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mTransformDuration:I

    .line 925
    const/16 v0, 0xc8

    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mKeepDuration:I

    .line 927
    const/4 v0, 0x1

    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mProgressMode:I

    .line 928
    iput v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mInAnimationDuration:I

    .line 929
    iput v1, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mOutAnimationDuration:I

    .line 931
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "defStyleRes"    # I

    .prologue
    .line 934
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1, p2}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 935
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 937
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 912
    const/4 v6, 0x0

    iput v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mProgressPercent:F

    .line 913
    const/4 v6, 0x0

    iput v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mSecondaryProgressPercent:F

    .line 918
    const/16 v6, 0x8

    iput v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mStrokeSize:I

    .line 919
    const/4 v6, 0x2

    iput v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mVerticalAlign:I

    .line 922
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mReverse:Z

    .line 923
    const/16 v6, 0x3e8

    iput v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mTravelDuration:I

    .line 924
    const/16 v6, 0x320

    iput v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mTransformDuration:I

    .line 925
    const/16 v6, 0xc8

    iput v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mKeepDuration:I

    .line 927
    const/4 v6, 0x1

    iput v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mProgressMode:I

    .line 928
    const/16 v6, 0x190

    iput v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mInAnimationDuration:I

    .line 929
    const/16 v6, 0x190

    iput v6, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mOutAnimationDuration:I

    .line 938
    sget-object v6, Lcom/rey/material/R$styleable;->LinearProgressDrawable:[I

    invoke-virtual {p1, p2, v6, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 941
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v6, Lcom/rey/material/R$styleable;->LinearProgressDrawable_pv_progress:I

    const/4 v7, 0x0

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->progressPercent(F)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    .line 942
    sget v6, Lcom/rey/material/R$styleable;->LinearProgressDrawable_pv_secondaryProgress:I

    const/4 v7, 0x0

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->secondaryProgressPercent(F)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    .line 944
    sget v6, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_maxLineWidth:I

    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v5

    .line 945
    .local v5, "value":Landroid/util/TypedValue;
    if-nez v5, :cond_b3

    .line 946
    const/high16 v6, 0x3f400000    # 0.75f

    invoke-virtual {p0, v6}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->maxLineWidth(F)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    .line 952
    :goto_51
    sget v6, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_minLineWidth:I

    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v5

    .line 953
    if-nez v5, :cond_d1

    .line 954
    const/high16 v6, 0x3e800000    # 0.25f

    invoke-virtual {p0, v6}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->minLineWidth(F)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    .line 960
    :goto_5e
    sget v6, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_strokeSize:I

    const/4 v7, 0x4

    invoke-static {p1, v7}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->strokeSize(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    .line 961
    sget v6, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_verticalAlign:I

    const/4 v7, 0x2

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->verticalAlign(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    .line 962
    const/4 v6, 0x1

    new-array v6, v6, [I

    const/4 v7, 0x0

    sget v8, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_strokeColor:I

    const/high16 v9, -0x1000000

    invoke-static {p1, v9}, Lcom/rey/material/util/ThemeUtil;->colorPrimary(Landroid/content/Context;I)I

    move-result v9

    invoke-virtual {v0, v8, v9}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v8

    aput v8, v6, v7

    invoke-virtual {p0, v6}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->strokeColors([I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    .line 963
    sget v6, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_strokeColors:I

    const/4 v7, 0x0

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    .local v3, "resId":I
    if-eqz v3, :cond_f7

    .line 964
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v3}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v4

    .line 965
    .local v4, "ta":Landroid/content/res/TypedArray;
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->length()I

    move-result v6

    new-array v1, v6, [I

    .line 966
    .local v1, "colors":[I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_a3
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->length()I

    move-result v6

    if-ge v2, v6, :cond_f1

    .line 967
    const/4 v6, 0x0

    invoke-virtual {v4, v2, v6}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v6

    aput v6, v1, v2

    .line 966
    add-int/lit8 v2, v2, 0x1

    goto :goto_a3

    .line 947
    .end local v1    # "colors":[I
    .end local v2    # "j":I
    .end local v3    # "resId":I
    .end local v4    # "ta":Landroid/content/res/TypedArray;
    :cond_b3
    iget v6, v5, Landroid/util/TypedValue;->type:I

    const/4 v7, 0x6

    if-ne v6, v7, :cond_c6

    .line 948
    sget v6, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_maxLineWidth:I

    const/4 v7, 0x1

    const/4 v8, 0x1

    const/high16 v9, 0x3f400000    # 0.75f

    invoke-virtual {v0, v6, v7, v8, v9}, Landroid/content/res/TypedArray;->getFraction(IIIF)F

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->maxLineWidth(F)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    goto :goto_51

    .line 950
    :cond_c6
    sget v6, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_maxLineWidth:I

    const/4 v7, 0x0

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->maxLineWidth(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    goto :goto_51

    .line 955
    :cond_d1
    iget v6, v5, Landroid/util/TypedValue;->type:I

    const/4 v7, 0x6

    if-ne v6, v7, :cond_e5

    .line 956
    sget v6, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_minLineWidth:I

    const/4 v7, 0x1

    const/4 v8, 0x1

    const/high16 v9, 0x3e800000    # 0.25f

    invoke-virtual {v0, v6, v7, v8, v9}, Landroid/content/res/TypedArray;->getFraction(IIIF)F

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->minLineWidth(F)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    goto/16 :goto_5e

    .line 958
    :cond_e5
    sget v6, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_minLineWidth:I

    const/4 v7, 0x0

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->minLineWidth(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    goto/16 :goto_5e

    .line 968
    .restart local v1    # "colors":[I
    .restart local v2    # "j":I
    .restart local v3    # "resId":I
    .restart local v4    # "ta":Landroid/content/res/TypedArray;
    :cond_f1
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->recycle()V

    .line 969
    invoke-virtual {p0, v1}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->strokeColors([I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    .line 971
    .end local v1    # "colors":[I
    .end local v2    # "j":I
    .end local v4    # "ta":Landroid/content/res/TypedArray;
    :cond_f7
    sget v6, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_strokeSecondaryColor:I

    const/4 v7, 0x0

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->strokeSecondaryColor(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    .line 972
    sget v6, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_reverse:I

    const/4 v7, 0x0

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->reverse(Z)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    .line 973
    sget v6, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_travelDuration:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x10e0002

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v7

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->travelDuration(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    .line 974
    sget v6, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_transformDuration:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x10e0001

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v7

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->transformDuration(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    .line 975
    sget v6, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_keepDuration:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const/high16 v8, 0x10e0000

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v7

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->keepDuration(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    .line 976
    sget v6, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_transformInterpolator:I

    const/4 v7, 0x0

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    if-eqz v3, :cond_156

    .line 977
    invoke-static {p1, v3}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->transformInterpolator(Landroid/view/animation/Interpolator;)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    .line 978
    :cond_156
    sget v6, Lcom/rey/material/R$styleable;->LinearProgressDrawable_pv_progressMode:I

    const/4 v7, 0x1

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->progressMode(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    .line 979
    sget v6, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_inAnimDuration:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x10e0001

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v7

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->inAnimDuration(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    .line 980
    sget v6, Lcom/rey/material/R$styleable;->LinearProgressDrawable_lpd_outAnimDuration:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x10e0001

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v7

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->outAnimDuration(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    .line 982
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 983
    return-void
.end method


# virtual methods
.method public build()Lcom/rey/material/drawable/LinearProgressDrawable;
    .registers 22

    .prologue
    .line 986
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mStrokeColors:[I

    if-nez v1, :cond_13

    .line 987
    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v2, 0x0

    const v3, -0xff6601

    aput v3, v1, v2

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mStrokeColors:[I

    .line 989
    :cond_13
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mTransformInterpolator:Landroid/view/animation/Interpolator;

    if-nez v1, :cond_22

    .line 990
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mTransformInterpolator:Landroid/view/animation/Interpolator;

    .line 992
    :cond_22
    new-instance v1, Lcom/rey/material/drawable/LinearProgressDrawable;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mProgressPercent:F

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mSecondaryProgressPercent:F

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mMaxLineWidth:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mMaxLineWidthPercent:F

    move-object/from16 v0, p0

    iget v6, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mMinLineWidth:I

    move-object/from16 v0, p0

    iget v7, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mMinLineWidthPercent:F

    move-object/from16 v0, p0

    iget v8, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mStrokeSize:I

    move-object/from16 v0, p0

    iget v9, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mVerticalAlign:I

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mStrokeColors:[I

    move-object/from16 v0, p0

    iget v11, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mStrokeSecondaryColor:I

    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mReverse:Z

    move-object/from16 v0, p0

    iget v13, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mTravelDuration:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mTransformDuration:I

    move-object/from16 v0, p0

    iget v15, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mKeepDuration:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mTransformInterpolator:Landroid/view/animation/Interpolator;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mProgressMode:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mInAnimationDuration:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mOutAnimationDuration:I

    move/from16 v19, v0

    const/16 v20, 0x0

    invoke-direct/range {v1 .. v20}, Lcom/rey/material/drawable/LinearProgressDrawable;-><init>(FFIFIFII[IIZIIILandroid/view/animation/Interpolator;IIILcom/rey/material/drawable/LinearProgressDrawable$1;)V

    return-object v1
.end method

.method public inAnimDuration(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 1082
    iput p1, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mInAnimationDuration:I

    .line 1083
    return-object p0
.end method

.method public keepDuration(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 1067
    iput p1, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mKeepDuration:I

    .line 1068
    return-object p0
.end method

.method public maxLineWidth(F)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;
    .registers 4
    .param p1, "percent"    # F

    .prologue
    .line 1011
    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1, p1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mMaxLineWidthPercent:F

    .line 1012
    const/4 v0, 0x0

    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mMaxLineWidth:I

    .line 1013
    return-object p0
.end method

.method public maxLineWidth(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;
    .registers 2
    .param p1, "width"    # I

    .prologue
    .line 1006
    iput p1, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mMaxLineWidth:I

    .line 1007
    return-object p0
.end method

.method public minLineWidth(F)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;
    .registers 4
    .param p1, "percent"    # F

    .prologue
    .line 1022
    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1, p1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mMinLineWidthPercent:F

    .line 1023
    const/4 v0, 0x0

    iput v0, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mMinLineWidth:I

    .line 1024
    return-object p0
.end method

.method public minLineWidth(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;
    .registers 2
    .param p1, "width"    # I

    .prologue
    .line 1017
    iput p1, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mMinLineWidth:I

    .line 1018
    return-object p0
.end method

.method public outAnimDuration(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 1087
    iput p1, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mOutAnimationDuration:I

    .line 1088
    return-object p0
.end method

.method public progressMode(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;
    .registers 2
    .param p1, "mode"    # I

    .prologue
    .line 1077
    iput p1, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mProgressMode:I

    .line 1078
    return-object p0
.end method

.method public progressPercent(F)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;
    .registers 2
    .param p1, "percent"    # F

    .prologue
    .line 1001
    iput p1, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mProgressPercent:F

    .line 1002
    return-object p0
.end method

.method public reverse()Lcom/rey/material/drawable/LinearProgressDrawable$Builder;
    .registers 2

    .prologue
    .line 1053
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->reverse(Z)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;

    move-result-object v0

    return-object v0
.end method

.method public reverse(Z)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;
    .registers 2
    .param p1, "reverse"    # Z

    .prologue
    .line 1048
    iput-boolean p1, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mReverse:Z

    .line 1049
    return-object p0
.end method

.method public secondaryProgressPercent(F)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;
    .registers 2
    .param p1, "percent"    # F

    .prologue
    .line 996
    iput p1, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mSecondaryProgressPercent:F

    .line 997
    return-object p0
.end method

.method public varargs strokeColors([I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;
    .registers 2
    .param p1, "strokeColors"    # [I

    .prologue
    .line 1038
    iput-object p1, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mStrokeColors:[I

    .line 1039
    return-object p0
.end method

.method public strokeSecondaryColor(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 1043
    iput p1, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mStrokeSecondaryColor:I

    .line 1044
    return-object p0
.end method

.method public strokeSize(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;
    .registers 2
    .param p1, "strokeSize"    # I

    .prologue
    .line 1028
    iput p1, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mStrokeSize:I

    .line 1029
    return-object p0
.end method

.method public transformDuration(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 1062
    iput p1, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mTransformDuration:I

    .line 1063
    return-object p0
.end method

.method public transformInterpolator(Landroid/view/animation/Interpolator;)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;
    .registers 2
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 1072
    iput-object p1, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mTransformInterpolator:Landroid/view/animation/Interpolator;

    .line 1073
    return-object p0
.end method

.method public travelDuration(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 1057
    iput p1, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mTravelDuration:I

    .line 1058
    return-object p0
.end method

.method public verticalAlign(I)Lcom/rey/material/drawable/LinearProgressDrawable$Builder;
    .registers 2
    .param p1, "align"    # I

    .prologue
    .line 1033
    iput p1, p0, Lcom/rey/material/drawable/LinearProgressDrawable$Builder;->mVerticalAlign:I

    .line 1034
    return-object p0
.end method
