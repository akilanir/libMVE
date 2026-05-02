.class public Lcom/rey/material/widget/Slider;
.super Landroid/view/View;
.source "Slider.java"

# interfaces
.implements Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/widget/Slider$1;,
        Lcom/rey/material/widget/Slider$SavedState;,
        Lcom/rey/material/widget/Slider$ThumbMoveAnimator;,
        Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;,
        Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;,
        Lcom/rey/material/widget/Slider$ValueDescriptionProvider;,
        Lcom/rey/material/widget/Slider$OnPositionChangeListener;
    }
.end annotation


# instance fields
.field private mAlwaysFillThumb:Z

.field private mBaselineOffset:I

.field protected mCurrentStyle:I

.field private mDiscreteMode:Z

.field private mDrawRect:Landroid/graphics/RectF;

.field private mGravity:I

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mIsDragging:Z

.field private mIsRtl:Z

.field private mLeftTrackPath:Landroid/graphics/Path;

.field private mMarkPath:Landroid/graphics/Path;

.field private mMaxValue:I

.field private mMemoPoint:Landroid/graphics/PointF;

.field private mMemoValue:I

.field private mMinValue:I

.field private mOnPositionChangeListener:Lcom/rey/material/widget/Slider$OnPositionChangeListener;

.field private mPaint:Landroid/graphics/Paint;

.field private mPrimaryColor:I

.field private mRightTrackPath:Landroid/graphics/Path;

.field private mRippleManager:Lcom/rey/material/widget/RippleManager;

.field private mSecondaryColor:I

.field private mStepValue:I

.field protected mStyleId:I

.field private mTempRect:Landroid/graphics/RectF;

.field private mTextColor:I

.field private mTextHeight:I

.field private mTextSize:I

.field private mThumbBorderSize:I

.field private mThumbCurrentRadius:F

.field private mThumbFillPercent:F

.field private mThumbFocusRadius:I

.field private mThumbMoveAnimator:Lcom/rey/material/widget/Slider$ThumbMoveAnimator;

.field private mThumbPosition:F

.field private mThumbRadius:I

.field private mThumbRadiusAnimator:Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;

.field private mThumbStrokeAnimator:Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;

.field private mTouchSlop:I

.field private mTrackCap:Landroid/graphics/Paint$Cap;

.field private mTrackSize:I

.field private mTransformAnimationDuration:I

.field private mTravelAnimationDuration:I

.field private mTypeface:Landroid/graphics/Typeface;

.field private mValueDescriptionProvider:Lcom/rey/material/widget/Slider$ValueDescriptionProvider;

.field private mValueText:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 119
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 43
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/Slider;->mCurrentStyle:I

    .line 52
    iput v2, p0, Lcom/rey/material/widget/Slider;->mMinValue:I

    .line 53
    const/16 v0, 0x64

    iput v0, p0, Lcom/rey/material/widget/Slider;->mMaxValue:I

    .line 54
    const/4 v0, 0x1

    iput v0, p0, Lcom/rey/material/widget/Slider;->mStepValue:I

    .line 56
    iput-boolean v2, p0, Lcom/rey/material/widget/Slider;->mDiscreteMode:Z

    .line 60
    iput v1, p0, Lcom/rey/material/widget/Slider;->mTrackSize:I

    .line 61
    sget-object v0, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    iput-object v0, p0, Lcom/rey/material/widget/Slider;->mTrackCap:Landroid/graphics/Paint$Cap;

    .line 62
    iput v1, p0, Lcom/rey/material/widget/Slider;->mThumbBorderSize:I

    .line 63
    iput v1, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    .line 64
    iput v1, p0, Lcom/rey/material/widget/Slider;->mThumbFocusRadius:I

    .line 65
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/rey/material/widget/Slider;->mThumbPosition:F

    .line 66
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iput-object v0, p0, Lcom/rey/material/widget/Slider;->mTypeface:Landroid/graphics/Typeface;

    .line 67
    iput v1, p0, Lcom/rey/material/widget/Slider;->mTextSize:I

    .line 68
    iput v1, p0, Lcom/rey/material/widget/Slider;->mTextColor:I

    .line 69
    const/16 v0, 0x11

    iput v0, p0, Lcom/rey/material/widget/Slider;->mGravity:I

    .line 70
    iput v1, p0, Lcom/rey/material/widget/Slider;->mTravelAnimationDuration:I

    .line 71
    iput v1, p0, Lcom/rey/material/widget/Slider;->mTransformAnimationDuration:I

    .line 80
    iput-boolean v2, p0, Lcom/rey/material/widget/Slider;->mAlwaysFillThumb:Z

    .line 89
    iput-boolean v2, p0, Lcom/rey/material/widget/Slider;->mIsRtl:Z

    .line 121
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v2, v2}, Lcom/rey/material/widget/Slider;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 122
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 125
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 43
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/Slider;->mCurrentStyle:I

    .line 52
    iput v2, p0, Lcom/rey/material/widget/Slider;->mMinValue:I

    .line 53
    const/16 v0, 0x64

    iput v0, p0, Lcom/rey/material/widget/Slider;->mMaxValue:I

    .line 54
    const/4 v0, 0x1

    iput v0, p0, Lcom/rey/material/widget/Slider;->mStepValue:I

    .line 56
    iput-boolean v2, p0, Lcom/rey/material/widget/Slider;->mDiscreteMode:Z

    .line 60
    iput v1, p0, Lcom/rey/material/widget/Slider;->mTrackSize:I

    .line 61
    sget-object v0, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    iput-object v0, p0, Lcom/rey/material/widget/Slider;->mTrackCap:Landroid/graphics/Paint$Cap;

    .line 62
    iput v1, p0, Lcom/rey/material/widget/Slider;->mThumbBorderSize:I

    .line 63
    iput v1, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    .line 64
    iput v1, p0, Lcom/rey/material/widget/Slider;->mThumbFocusRadius:I

    .line 65
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/rey/material/widget/Slider;->mThumbPosition:F

    .line 66
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iput-object v0, p0, Lcom/rey/material/widget/Slider;->mTypeface:Landroid/graphics/Typeface;

    .line 67
    iput v1, p0, Lcom/rey/material/widget/Slider;->mTextSize:I

    .line 68
    iput v1, p0, Lcom/rey/material/widget/Slider;->mTextColor:I

    .line 69
    const/16 v0, 0x11

    iput v0, p0, Lcom/rey/material/widget/Slider;->mGravity:I

    .line 70
    iput v1, p0, Lcom/rey/material/widget/Slider;->mTravelAnimationDuration:I

    .line 71
    iput v1, p0, Lcom/rey/material/widget/Slider;->mTransformAnimationDuration:I

    .line 80
    iput-boolean v2, p0, Lcom/rey/material/widget/Slider;->mAlwaysFillThumb:Z

    .line 89
    iput-boolean v2, p0, Lcom/rey/material/widget/Slider;->mIsRtl:Z

    .line 127
    invoke-virtual {p0, p1, p2, v2, v2}, Lcom/rey/material/widget/Slider;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 128
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

    .line 131
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 43
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/Slider;->mCurrentStyle:I

    .line 52
    iput v2, p0, Lcom/rey/material/widget/Slider;->mMinValue:I

    .line 53
    const/16 v0, 0x64

    iput v0, p0, Lcom/rey/material/widget/Slider;->mMaxValue:I

    .line 54
    const/4 v0, 0x1

    iput v0, p0, Lcom/rey/material/widget/Slider;->mStepValue:I

    .line 56
    iput-boolean v2, p0, Lcom/rey/material/widget/Slider;->mDiscreteMode:Z

    .line 60
    iput v1, p0, Lcom/rey/material/widget/Slider;->mTrackSize:I

    .line 61
    sget-object v0, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    iput-object v0, p0, Lcom/rey/material/widget/Slider;->mTrackCap:Landroid/graphics/Paint$Cap;

    .line 62
    iput v1, p0, Lcom/rey/material/widget/Slider;->mThumbBorderSize:I

    .line 63
    iput v1, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    .line 64
    iput v1, p0, Lcom/rey/material/widget/Slider;->mThumbFocusRadius:I

    .line 65
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/rey/material/widget/Slider;->mThumbPosition:F

    .line 66
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iput-object v0, p0, Lcom/rey/material/widget/Slider;->mTypeface:Landroid/graphics/Typeface;

    .line 67
    iput v1, p0, Lcom/rey/material/widget/Slider;->mTextSize:I

    .line 68
    iput v1, p0, Lcom/rey/material/widget/Slider;->mTextColor:I

    .line 69
    const/16 v0, 0x11

    iput v0, p0, Lcom/rey/material/widget/Slider;->mGravity:I

    .line 70
    iput v1, p0, Lcom/rey/material/widget/Slider;->mTravelAnimationDuration:I

    .line 71
    iput v1, p0, Lcom/rey/material/widget/Slider;->mTransformAnimationDuration:I

    .line 80
    iput-boolean v2, p0, Lcom/rey/material/widget/Slider;->mAlwaysFillThumb:Z

    .line 89
    iput-boolean v2, p0, Lcom/rey/material/widget/Slider;->mIsRtl:Z

    .line 133
    invoke-virtual {p0, p1, p2, p3, v2}, Lcom/rey/material/widget/Slider;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 134
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

    .line 138
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 43
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/Slider;->mCurrentStyle:I

    .line 52
    iput v2, p0, Lcom/rey/material/widget/Slider;->mMinValue:I

    .line 53
    const/16 v0, 0x64

    iput v0, p0, Lcom/rey/material/widget/Slider;->mMaxValue:I

    .line 54
    const/4 v0, 0x1

    iput v0, p0, Lcom/rey/material/widget/Slider;->mStepValue:I

    .line 56
    iput-boolean v2, p0, Lcom/rey/material/widget/Slider;->mDiscreteMode:Z

    .line 60
    iput v1, p0, Lcom/rey/material/widget/Slider;->mTrackSize:I

    .line 61
    sget-object v0, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    iput-object v0, p0, Lcom/rey/material/widget/Slider;->mTrackCap:Landroid/graphics/Paint$Cap;

    .line 62
    iput v1, p0, Lcom/rey/material/widget/Slider;->mThumbBorderSize:I

    .line 63
    iput v1, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    .line 64
    iput v1, p0, Lcom/rey/material/widget/Slider;->mThumbFocusRadius:I

    .line 65
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/rey/material/widget/Slider;->mThumbPosition:F

    .line 66
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iput-object v0, p0, Lcom/rey/material/widget/Slider;->mTypeface:Landroid/graphics/Typeface;

    .line 67
    iput v1, p0, Lcom/rey/material/widget/Slider;->mTextSize:I

    .line 68
    iput v1, p0, Lcom/rey/material/widget/Slider;->mTextColor:I

    .line 69
    const/16 v0, 0x11

    iput v0, p0, Lcom/rey/material/widget/Slider;->mGravity:I

    .line 70
    iput v1, p0, Lcom/rey/material/widget/Slider;->mTravelAnimationDuration:I

    .line 71
    iput v1, p0, Lcom/rey/material/widget/Slider;->mTransformAnimationDuration:I

    .line 80
    iput-boolean v2, p0, Lcom/rey/material/widget/Slider;->mAlwaysFillThumb:Z

    .line 89
    iput-boolean v2, p0, Lcom/rey/material/widget/Slider;->mIsRtl:Z

    .line 140
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/Slider;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 141
    return-void
.end method

.method static synthetic access$000(Lcom/rey/material/widget/Slider;)F
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/Slider;

    .prologue
    .line 39
    iget v0, p0, Lcom/rey/material/widget/Slider;->mThumbCurrentRadius:F

    return v0
.end method

.method static synthetic access$002(Lcom/rey/material/widget/Slider;F)F
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/Slider;
    .param p1, "x1"    # F

    .prologue
    .line 39
    iput p1, p0, Lcom/rey/material/widget/Slider;->mThumbCurrentRadius:F

    return p1
.end method

.method static synthetic access$100(Lcom/rey/material/widget/Slider;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/Slider;

    .prologue
    .line 39
    iget v0, p0, Lcom/rey/material/widget/Slider;->mTransformAnimationDuration:I

    return v0
.end method

.method static synthetic access$1000(Lcom/rey/material/widget/Slider;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/Slider;

    .prologue
    .line 39
    iget v0, p0, Lcom/rey/material/widget/Slider;->mThumbBorderSize:I

    return v0
.end method

.method static synthetic access$200(Lcom/rey/material/widget/Slider;)Landroid/view/animation/Interpolator;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/Slider;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method static synthetic access$300(Lcom/rey/material/widget/Slider;)F
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/Slider;

    .prologue
    .line 39
    iget v0, p0, Lcom/rey/material/widget/Slider;->mThumbFillPercent:F

    return v0
.end method

.method static synthetic access$302(Lcom/rey/material/widget/Slider;F)F
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/Slider;
    .param p1, "x1"    # F

    .prologue
    .line 39
    iput p1, p0, Lcom/rey/material/widget/Slider;->mThumbFillPercent:F

    return p1
.end method

.method static synthetic access$400(Lcom/rey/material/widget/Slider;)Z
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/Slider;

    .prologue
    .line 39
    iget-boolean v0, p0, Lcom/rey/material/widget/Slider;->mAlwaysFillThumb:Z

    return v0
.end method

.method static synthetic access$500(Lcom/rey/material/widget/Slider;)F
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/Slider;

    .prologue
    .line 39
    iget v0, p0, Lcom/rey/material/widget/Slider;->mThumbPosition:F

    return v0
.end method

.method static synthetic access$502(Lcom/rey/material/widget/Slider;F)F
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/Slider;
    .param p1, "x1"    # F

    .prologue
    .line 39
    iput p1, p0, Lcom/rey/material/widget/Slider;->mThumbPosition:F

    return p1
.end method

.method static synthetic access$600(Lcom/rey/material/widget/Slider;)Z
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/Slider;

    .prologue
    .line 39
    iget-boolean v0, p0, Lcom/rey/material/widget/Slider;->mDiscreteMode:Z

    return v0
.end method

.method static synthetic access$700(Lcom/rey/material/widget/Slider;)Z
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/Slider;

    .prologue
    .line 39
    iget-boolean v0, p0, Lcom/rey/material/widget/Slider;->mIsDragging:Z

    return v0
.end method

.method static synthetic access$800(Lcom/rey/material/widget/Slider;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/Slider;

    .prologue
    .line 39
    iget v0, p0, Lcom/rey/material/widget/Slider;->mTravelAnimationDuration:I

    return v0
.end method

.method static synthetic access$900(Lcom/rey/material/widget/Slider;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/Slider;

    .prologue
    .line 39
    iget v0, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    return v0
.end method

.method private correctPosition(F)F
    .registers 10
    .param p1, "position"    # F

    .prologue
    .line 672
    iget-boolean v6, p0, Lcom/rey/material/widget/Slider;->mDiscreteMode:Z

    if-nez v6, :cond_6

    move v2, p1

    .line 686
    .end local p1    # "position":F
    .local v2, "position":F
    :goto_5
    return v2

    .line 675
    .end local v2    # "position":F
    .restart local p1    # "position":F
    :cond_6
    iget v6, p0, Lcom/rey/material/widget/Slider;->mMaxValue:I

    iget v7, p0, Lcom/rey/material/widget/Slider;->mMinValue:I

    sub-int v4, v6, v7

    .line 676
    .local v4, "totalOffset":I
    int-to-float v6, v4

    mul-float/2addr v6, p1

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v5

    .line 677
    .local v5, "valueOffset":I
    iget v6, p0, Lcom/rey/material/widget/Slider;->mStepValue:I

    div-int v3, v5, v6

    .line 678
    .local v3, "stepOffset":I
    iget v6, p0, Lcom/rey/material/widget/Slider;->mStepValue:I

    mul-int v1, v3, v6

    .line 679
    .local v1, "lowerValue":I
    add-int/lit8 v6, v3, 0x1

    iget v7, p0, Lcom/rey/material/widget/Slider;->mStepValue:I

    mul-int/2addr v6, v7

    invoke-static {v4, v6}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 681
    .local v0, "higherValue":I
    sub-int v6, v5, v1

    sub-int v7, v0, v5

    if-ge v6, v7, :cond_2f

    .line 682
    int-to-float v6, v1

    int-to-float v7, v4

    div-float p1, v6, v7

    :goto_2d
    move v2, p1

    .line 686
    .end local p1    # "position":F
    .restart local v2    # "position":F
    goto :goto_5

    .line 684
    .end local v2    # "position":F
    .restart local p1    # "position":F
    :cond_2f
    int-to-float v6, v0

    int-to-float v7, v4

    div-float p1, v6, v7

    goto :goto_2d
.end method

.method private distance(FFFF)D
    .registers 11
    .param p1, "x1"    # F
    .param p2, "y1"    # F
    .param p3, "x2"    # F
    .param p4, "y2"    # F

    .prologue
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    .line 668
    sub-float v0, p1, p3

    float-to-double v0, v0

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    sub-float v2, p2, p4

    float-to-double v2, v2

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    add-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    return-wide v0
.end method

.method private getMarkPath(Landroid/graphics/Path;FFFF)Landroid/graphics/Path;
    .registers 32
    .param p1, "path"    # Landroid/graphics/Path;
    .param p2, "cx"    # F
    .param p3, "cy"    # F
    .param p4, "radius"    # F
    .param p5, "factor"    # F

    .prologue
    .line 847
    if-nez p1, :cond_8e

    .line 848
    new-instance p1, Landroid/graphics/Path;

    .end local p1    # "path":Landroid/graphics/Path;
    invoke-direct/range {p1 .. p1}, Landroid/graphics/Path;-><init>()V

    .line 852
    .restart local p1    # "path":Landroid/graphics/Path;
    :goto_7
    sub-float v13, p2, p4

    .line 853
    .local v13, "x1":F
    move/from16 v17, p3

    .line 854
    .local v17, "y1":F
    add-float v14, p2, p4

    .line 855
    .local v14, "x2":F
    move/from16 v18, p3

    .line 856
    .local v18, "y2":F
    move/from16 v15, p2

    .line 857
    .local v15, "x3":F
    add-float v19, p3, p4

    .line 859
    .local v19, "y3":F
    move/from16 v10, p2

    .line 860
    .local v10, "nCx":F
    mul-float v21, p4, p5

    sub-float v11, p3, v21

    .line 863
    .local v11, "nCy":F
    sub-float v21, v18, v11

    move/from16 v0, v21

    float-to-double v0, v0

    move-wide/from16 v21, v0

    sub-float v23, v14, v10

    move/from16 v0, v23

    float-to-double v0, v0

    move-wide/from16 v23, v0

    invoke-static/range {v21 .. v24}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v21

    const-wide v23, 0x4066800000000000L    # 180.0

    mul-double v21, v21, v23

    const-wide v23, 0x400921fb54442d18L    # Math.PI

    div-double v21, v21, v23

    move-wide/from16 v0, v21

    double-to-float v4, v0

    .line 864
    .local v4, "angle":F
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v10, v11, v13, v1}, Lcom/rey/material/widget/Slider;->distance(FFFF)D

    move-result-wide v21

    move-wide/from16 v0, v21

    double-to-float v12, v0

    .line 865
    .local v12, "nRadius":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    sub-float v22, v10, v12

    sub-float v23, v11, v12

    add-float v24, v10, v12

    add-float v25, v11, v12

    invoke-virtual/range {v21 .. v25}, Landroid/graphics/RectF;->set(FFFF)V

    .line 866
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v13, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 867
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    const/high16 v22, 0x43340000    # 180.0f

    sub-float v22, v22, v4

    const/high16 v23, 0x43340000    # 180.0f

    const/high16 v24, 0x40000000    # 2.0f

    mul-float v24, v24, v4

    add-float v23, v23, v24

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 869
    const v21, 0x3f666666    # 0.9f

    cmpl-float v21, p5, v21

    if-lez v21, :cond_93

    .line 870
    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v15, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 897
    :goto_8a
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Path;->close()V

    .line 899
    return-object p1

    .line 850
    .end local v4    # "angle":F
    .end local v10    # "nCx":F
    .end local v11    # "nCy":F
    .end local v12    # "nRadius":F
    .end local v13    # "x1":F
    .end local v14    # "x2":F
    .end local v15    # "x3":F
    .end local v17    # "y1":F
    .end local v18    # "y2":F
    .end local v19    # "y3":F
    :cond_8e
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Path;->reset()V

    goto/16 :goto_7

    .line 873
    .restart local v4    # "angle":F
    .restart local v10    # "nCx":F
    .restart local v11    # "nCy":F
    .restart local v12    # "nRadius":F
    .restart local v13    # "x1":F
    .restart local v14    # "x2":F
    .restart local v15    # "x3":F
    .restart local v17    # "y1":F
    .restart local v18    # "y2":F
    .restart local v19    # "y3":F
    :cond_93
    add-float v21, v14, v15

    const/high16 v22, 0x40000000    # 2.0f

    div-float v16, v21, v22

    .line 874
    .local v16, "x4":F
    add-float v21, v18, v19

    const/high16 v22, 0x40000000    # 2.0f

    div-float v20, v21, v22

    .line 876
    .local v20, "y4":F
    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v16

    move/from16 v3, v20

    invoke-direct {v0, v14, v1, v2, v3}, Lcom/rey/material/widget/Slider;->distance(FFFF)D

    move-result-wide v6

    .line 877
    .local v6, "d1":D
    const-wide v21, 0x400921fb54442d18L    # Math.PI

    const/high16 v23, 0x3f800000    # 1.0f

    sub-float v23, v23, p5

    move/from16 v0, v23

    float-to-double v0, v0

    move-wide/from16 v23, v0

    mul-double v21, v21, v23

    const-wide/high16 v23, 0x4010000000000000L    # 4.0

    div-double v21, v21, v23

    invoke-static/range {v21 .. v22}, Ljava/lang/Math;->tan(D)D

    move-result-wide v21

    div-double v8, v6, v21

    .line 879
    .local v8, "d2":D
    move/from16 v0, v16

    float-to-double v0, v0

    move-wide/from16 v21, v0

    const-wide v23, 0x3fe921fb54442d18L    # 0.7853981633974483

    invoke-static/range {v23 .. v24}, Ljava/lang/Math;->cos(D)D

    move-result-wide v23

    mul-double v23, v23, v8

    sub-double v21, v21, v23

    move-wide/from16 v0, v21

    double-to-float v10, v0

    .line 880
    move/from16 v0, v20

    float-to-double v0, v0

    move-wide/from16 v21, v0

    const-wide v23, 0x3fe921fb54442d18L    # 0.7853981633974483

    invoke-static/range {v23 .. v24}, Ljava/lang/Math;->sin(D)D

    move-result-wide v23

    mul-double v23, v23, v8

    sub-double v21, v21, v23

    move-wide/from16 v0, v21

    double-to-float v11, v0

    .line 883
    sub-float v21, v18, v11

    move/from16 v0, v21

    float-to-double v0, v0

    move-wide/from16 v21, v0

    sub-float v23, v14, v10

    move/from16 v0, v23

    float-to-double v0, v0

    move-wide/from16 v23, v0

    invoke-static/range {v21 .. v24}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v21

    const-wide v23, 0x4066800000000000L    # 180.0

    mul-double v21, v21, v23

    const-wide v23, 0x400921fb54442d18L    # Math.PI

    div-double v21, v21, v23

    move-wide/from16 v0, v21

    double-to-float v4, v0

    .line 884
    sub-float v21, v19, v11

    move/from16 v0, v21

    float-to-double v0, v0

    move-wide/from16 v21, v0

    sub-float v23, v15, v10

    move/from16 v0, v23

    float-to-double v0, v0

    move-wide/from16 v23, v0

    invoke-static/range {v21 .. v24}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v21

    const-wide v23, 0x4066800000000000L    # 180.0

    mul-double v21, v21, v23

    const-wide v23, 0x400921fb54442d18L    # Math.PI

    div-double v21, v21, v23

    move-wide/from16 v0, v21

    double-to-float v5, v0

    .line 885
    .local v5, "angle2":F
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v10, v11, v14, v1}, Lcom/rey/material/widget/Slider;->distance(FFFF)D

    move-result-wide v21

    move-wide/from16 v0, v21

    double-to-float v12, v0

    .line 886
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    sub-float v22, v10, v12

    sub-float v23, v11, v12

    add-float v24, v10, v12

    add-float v25, v11, v12

    invoke-virtual/range {v21 .. v25}, Landroid/graphics/RectF;->set(FFFF)V

    .line 887
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    sub-float v22, v5, v4

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    move/from16 v2, v22

    invoke-virtual {v0, v1, v4, v2}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 890
    const/high16 v21, 0x40000000    # 2.0f

    mul-float v21, v21, p2

    sub-float v10, v21, v10

    .line 891
    sub-float v21, v19, v11

    move/from16 v0, v21

    float-to-double v0, v0

    move-wide/from16 v21, v0

    sub-float v23, v15, v10

    move/from16 v0, v23

    float-to-double v0, v0

    move-wide/from16 v23, v0

    invoke-static/range {v21 .. v24}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v21

    const-wide v23, 0x4066800000000000L    # 180.0

    mul-double v21, v21, v23

    const-wide v23, 0x400921fb54442d18L    # Math.PI

    div-double v21, v21, v23

    move-wide/from16 v0, v21

    double-to-float v4, v0

    .line 892
    sub-float v21, v17, v11

    move/from16 v0, v21

    float-to-double v0, v0

    move-wide/from16 v21, v0

    sub-float v23, v13, v10

    move/from16 v0, v23

    float-to-double v0, v0

    move-wide/from16 v23, v0

    invoke-static/range {v21 .. v24}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v21

    const-wide v23, 0x4066800000000000L    # 180.0

    mul-double v21, v21, v23

    const-wide v23, 0x400921fb54442d18L    # Math.PI

    div-double v21, v21, v23

    move-wide/from16 v0, v21

    double-to-float v5, v0

    .line 893
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    sub-float v22, v10, v12

    sub-float v23, v11, v12

    add-float v24, v10, v12

    add-float v25, v11, v12

    invoke-virtual/range {v21 .. v25}, Landroid/graphics/RectF;->set(FFFF)V

    .line 894
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    const v22, 0x3f490fdb

    add-float v22, v22, v4

    sub-float v23, v5, v4

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    goto/16 :goto_8a
.end method

.method private getTrackPath(FFF)V
    .registers 15
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "radius"    # F

    .prologue
    .line 756
    iget v3, p0, Lcom/rey/material/widget/Slider;->mTrackSize:I

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float v2, v3, v4

    .line 758
    .local v2, "halfStroke":F
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mLeftTrackPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    .line 759
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mRightTrackPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    .line 761
    const/high16 v3, 0x3f800000    # 1.0f

    sub-float v3, p3, v3

    cmpg-float v3, v3, v2

    if-gez v3, :cond_f9

    .line 762
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mTrackCap:Landroid/graphics/Paint$Cap;

    sget-object v4, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    if-eq v3, v4, :cond_82

    .line 763
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    cmpl-float v3, p1, v3

    if-lez v3, :cond_50

    .line 764
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mLeftTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    sub-float v5, p2, v2

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 765
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mLeftTrackPath:Landroid/graphics/Path;

    sub-float v4, p2, v2

    invoke-virtual {v3, p1, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 766
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mLeftTrackPath:Landroid/graphics/Path;

    add-float v4, p2, v2

    invoke-virtual {v3, p1, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 767
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mLeftTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    add-float v5, p2, v2

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 768
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mLeftTrackPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    .line 771
    :cond_50
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    cmpg-float v3, p1, v3

    if-gez v3, :cond_81

    .line 772
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mRightTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    add-float v5, p2, v2

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 773
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mRightTrackPath:Landroid/graphics/Path;

    add-float v4, p2, v2

    invoke-virtual {v3, p1, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 774
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mRightTrackPath:Landroid/graphics/Path;

    sub-float v4, p2, v2

    invoke-virtual {v3, p1, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 775
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mRightTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    sub-float v5, p2, v2

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 776
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mRightTrackPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    .line 844
    :cond_81
    :goto_81
    return-void

    .line 780
    :cond_82
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    cmpl-float v3, p1, v3

    if-lez v3, :cond_bd

    .line 781
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    sub-float v5, p2, v2

    iget-object v6, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    iget v7, p0, Lcom/rey/material/widget/Slider;->mTrackSize:I

    int-to-float v7, v7

    add-float/2addr v6, v7

    add-float v7, p2, v2

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 782
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mLeftTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

    const/high16 v5, 0x42b40000    # 90.0f

    const/high16 v6, 0x43340000    # 180.0f

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 783
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mLeftTrackPath:Landroid/graphics/Path;

    sub-float v4, p2, v2

    invoke-virtual {v3, p1, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 784
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mLeftTrackPath:Landroid/graphics/Path;

    add-float v4, p2, v2

    invoke-virtual {v3, p1, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 785
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mLeftTrackPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    .line 788
    :cond_bd
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    cmpg-float v3, p1, v3

    if-gez v3, :cond_81

    .line 789
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    iget v5, p0, Lcom/rey/material/widget/Slider;->mTrackSize:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    sub-float v5, p2, v2

    iget-object v6, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->right:F

    add-float v7, p2, v2

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 790
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mRightTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

    const/high16 v5, 0x43870000    # 270.0f

    const/high16 v6, 0x43340000    # 180.0f

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 791
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mRightTrackPath:Landroid/graphics/Path;

    add-float v4, p2, v2

    invoke-virtual {v3, p1, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 792
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mRightTrackPath:Landroid/graphics/Path;

    sub-float v4, p2, v2

    invoke-virtual {v3, p1, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 793
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mRightTrackPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    goto :goto_81

    .line 798
    :cond_f9
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mTrackCap:Landroid/graphics/Paint$Cap;

    sget-object v4, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    if-eq v3, v4, :cond_195

    .line 799
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

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

    .line 800
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

    .line 802
    .local v0, "angle":F
    sub-float v3, p1, p3

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_163

    .line 803
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mLeftTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    sub-float v5, p2, v2

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 804
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mLeftTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

    const/high16 v5, 0x43340000    # 180.0f

    add-float/2addr v5, v0

    neg-float v6, v0

    const/high16 v7, 0x40000000    # 2.0f

    mul-float/2addr v6, v7

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 805
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mLeftTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    add-float v5, p2, v2

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 806
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mLeftTrackPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    .line 809
    :cond_163
    add-float v3, p1, p3

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_81

    .line 810
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mRightTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    sub-float v5, p2, v2

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 811
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mRightTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

    neg-float v5, v0

    const/high16 v6, 0x40000000    # 2.0f

    mul-float/2addr v6, v0

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 812
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mRightTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    add-float v5, p2, v2

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 813
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mRightTrackPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    goto/16 :goto_81

    .line 817
    .end local v0    # "angle":F
    :cond_195
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

    .line 819
    .restart local v0    # "angle":F
    sub-float v3, p1, p3

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_224

    .line 820
    const/4 v3, 0x0

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

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

    .line 822
    .local v1, "angle2":F
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    sub-float v5, p2, v2

    iget-object v6, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    iget v7, p0, Lcom/rey/material/widget/Slider;->mTrackSize:I

    int-to-float v7, v7

    add-float/2addr v6, v7

    add-float v7, p2, v2

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 823
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mLeftTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

    const/high16 v5, 0x43340000    # 180.0f

    sub-float/2addr v5, v1

    const/high16 v6, 0x40000000    # 2.0f

    mul-float/2addr v6, v1

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 825
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

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

    .line 826
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mLeftTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

    const/high16 v5, 0x43340000    # 180.0f

    add-float/2addr v5, v0

    neg-float v6, v0

    const/high16 v7, 0x40000000    # 2.0f

    mul-float/2addr v6, v7

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 827
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mLeftTrackPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    .line 830
    .end local v1    # "angle2":F
    :cond_224
    add-float v3, p1, p3

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_81

    .line 831
    const/4 v3, 0x0

    add-float v4, p1, p3

    iget-object v5, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

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

    .line 832
    .restart local v1    # "angle2":F
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mRightTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

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

    .line 834
    float-to-double v3, v1

    const-wide v5, 0x400921fb54442d18L    # Math.PI

    div-double/2addr v3, v5

    const-wide v5, 0x4066800000000000L    # 180.0

    mul-double/2addr v3, v5

    double-to-float v1, v3

    .line 835
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    iget v5, p0, Lcom/rey/material/widget/Slider;->mTrackSize:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    sub-float v5, p2, v2

    iget-object v6, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->right:F

    add-float v7, p2, v2

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 836
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mRightTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

    neg-float v5, v1

    const/high16 v6, 0x40000000    # 2.0f

    mul-float/2addr v5, v6

    invoke-virtual {v3, v4, v1, v5}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 838
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

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

    .line 839
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mRightTrackPath:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

    neg-float v5, v0

    const/high16 v6, 0x40000000    # 2.0f

    mul-float/2addr v6, v0

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 840
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mRightTrackPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    goto/16 :goto_81
.end method

.method private getValueText()Ljava/lang/String;
    .registers 4

    .prologue
    .line 343
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getValue()I

    move-result v0

    .line 344
    .local v0, "value":I
    iget-object v1, p0, Lcom/rey/material/widget/Slider;->mValueText:Ljava/lang/String;

    if-eqz v1, :cond_c

    iget v1, p0, Lcom/rey/material/widget/Slider;->mMemoValue:I

    if-eq v1, v0, :cond_1d

    .line 345
    :cond_c
    iput v0, p0, Lcom/rey/material/widget/Slider;->mMemoValue:I

    .line 346
    iget-object v1, p0, Lcom/rey/material/widget/Slider;->mValueDescriptionProvider:Lcom/rey/material/widget/Slider$ValueDescriptionProvider;

    if-nez v1, :cond_20

    iget v1, p0, Lcom/rey/material/widget/Slider;->mMemoValue:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    :goto_18
    iput-object v1, p0, Lcom/rey/material/widget/Slider;->mValueText:Ljava/lang/String;

    .line 347
    invoke-direct {p0}, Lcom/rey/material/widget/Slider;->measureText()V

    .line 350
    :cond_1d
    iget-object v1, p0, Lcom/rey/material/widget/Slider;->mValueText:Ljava/lang/String;

    return-object v1

    .line 346
    :cond_20
    iget-object v1, p0, Lcom/rey/material/widget/Slider;->mValueDescriptionProvider:Lcom/rey/material/widget/Slider$ValueDescriptionProvider;

    iget v2, p0, Lcom/rey/material/widget/Slider;->mMemoValue:I

    invoke-interface {v1, v2}, Lcom/rey/material/widget/Slider$ValueDescriptionProvider;->getDescription(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_18
.end method

.method private isThumbHit(FFF)Z
    .registers 8
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "radius"    # F

    .prologue
    .line 661
    iget-object v2, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    iget v3, p0, Lcom/rey/material/widget/Slider;->mThumbPosition:F

    mul-float/2addr v2, v3

    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    add-float v0, v2, v3

    .line 662
    .local v0, "cx":F
    iget-object v2, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v1

    .line 664
    .local v1, "cy":F
    sub-float v2, v0, p3

    cmpl-float v2, p1, v2

    if-ltz v2, :cond_2f

    add-float v2, v0, p3

    cmpg-float v2, p1, v2

    if-gtz v2, :cond_2f

    sub-float v2, v1, p3

    cmpl-float v2, p2, v2

    if-ltz v2, :cond_2f

    add-float v2, v1, p3

    cmpg-float v2, p2, v2

    if-gez v2, :cond_2f

    const/4 v2, 0x1

    :goto_2e
    return v2

    :cond_2f
    const/4 v2, 0x0

    goto :goto_2e
.end method

.method private measureText()V
    .registers 11

    .prologue
    const-wide/high16 v8, 0x4000000000000000L    # 2.0

    .line 326
    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mValueText:Ljava/lang/String;

    if-nez v4, :cond_7

    .line 340
    :goto_6
    return-void

    .line 329
    :cond_7
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 330
    .local v1, "temp":Landroid/graphics/Rect;
    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    iget v5, p0, Lcom/rey/material/widget/Slider;->mTextSize:I

    int-to-float v5, v5

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 331
    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    iget-object v5, p0, Lcom/rey/material/widget/Slider;->mValueText:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v3

    .line 332
    .local v3, "width":F
    iget v4, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    int-to-double v4, v4

    invoke-static {v8, v9}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v6

    mul-double/2addr v4, v6

    mul-double/2addr v4, v8

    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getContext()Landroid/content/Context;

    move-result-object v6

    const/16 v7, 0x8

    invoke-static {v6, v7}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v6

    int-to-double v6, v6

    sub-double/2addr v4, v6

    double-to-float v0, v4

    .line 333
    .local v0, "maxWidth":F
    cmpl-float v4, v3, v0

    if-lez v4, :cond_41

    .line 334
    iget v4, p0, Lcom/rey/material/widget/Slider;->mTextSize:I

    int-to-float v4, v4

    mul-float/2addr v4, v0

    div-float v2, v4, v3

    .line 335
    .local v2, "textSize":F
    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 338
    .end local v2    # "textSize":F
    :cond_41
    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    iget-object v5, p0, Lcom/rey/material/widget/Slider;->mValueText:Ljava/lang/String;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/rey/material/widget/Slider;->mValueText:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v4, v5, v6, v7, v1}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 339
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v4

    iput v4, p0, Lcom/rey/material/widget/Slider;->mTextHeight:I

    goto :goto_6
.end method

.method private setPosition(FZZZ)V
    .registers 15
    .param p1, "pos"    # F
    .param p2, "moveAnimation"    # Z
    .param p3, "transformAnimation"    # Z
    .param p4, "fromUser"    # Z

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 425
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPosition()F

    move-result v8

    cmpl-float v8, v8, p1

    if-eqz v8, :cond_4c

    move v7, v0

    .line 426
    .local v7, "change":Z
    :goto_c
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getValue()I

    move-result v5

    .line 427
    .local v5, "oldValue":I
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPosition()F

    move-result v3

    .line 429
    .local v3, "oldPos":F
    if-eqz p2, :cond_1e

    iget-object v8, p0, Lcom/rey/material/widget/Slider;->mThumbMoveAnimator:Lcom/rey/material/widget/Slider$ThumbMoveAnimator;

    invoke-virtual {v8, p1}, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->startAnimation(F)Z

    move-result v8

    if-nez v8, :cond_36

    .line 430
    :cond_1e
    iput p1, p0, Lcom/rey/material/widget/Slider;->mThumbPosition:F

    .line 432
    if-eqz p3, :cond_50

    .line 433
    iget-boolean v8, p0, Lcom/rey/material/widget/Slider;->mIsDragging:Z

    if-nez v8, :cond_2d

    .line 434
    iget-object v8, p0, Lcom/rey/material/widget/Slider;->mThumbRadiusAnimator:Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;

    iget v9, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    invoke-virtual {v8, v9}, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->startAnimation(I)Z

    .line 435
    :cond_2d
    iget-object v8, p0, Lcom/rey/material/widget/Slider;->mThumbStrokeAnimator:Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;

    cmpl-float v2, p1, v2

    if-nez v2, :cond_4e

    :goto_33
    invoke-virtual {v8, v1}, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->startAnimation(I)Z

    .line 444
    :cond_36
    :goto_36
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getValue()I

    move-result v6

    .line 445
    .local v6, "newValue":I
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPosition()F

    move-result v4

    .line 447
    .local v4, "newPos":F
    if-eqz v7, :cond_4b

    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mOnPositionChangeListener:Lcom/rey/material/widget/Slider$OnPositionChangeListener;

    if-eqz v0, :cond_4b

    .line 448
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mOnPositionChangeListener:Lcom/rey/material/widget/Slider$OnPositionChangeListener;

    move-object v1, p0

    move v2, p4

    invoke-interface/range {v0 .. v6}, Lcom/rey/material/widget/Slider$OnPositionChangeListener;->onPositionChanged(Lcom/rey/material/widget/Slider;ZFFII)V

    .line 449
    :cond_4b
    return-void

    .end local v3    # "oldPos":F
    .end local v4    # "newPos":F
    .end local v5    # "oldValue":I
    .end local v6    # "newValue":I
    .end local v7    # "change":Z
    :cond_4c
    move v7, v1

    .line 425
    goto :goto_c

    .restart local v3    # "oldPos":F
    .restart local v5    # "oldValue":I
    .restart local v7    # "change":Z
    :cond_4e
    move v1, v0

    .line 435
    goto :goto_33

    .line 438
    :cond_50
    iget v0, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    int-to-float v0, v0

    iput v0, p0, Lcom/rey/material/widget/Slider;->mThumbCurrentRadius:F

    .line 439
    iget-boolean v0, p0, Lcom/rey/material/widget/Slider;->mAlwaysFillThumb:Z

    if-nez v0, :cond_5f

    iget v0, p0, Lcom/rey/material/widget/Slider;->mThumbPosition:F

    cmpl-float v0, v0, v2

    if-eqz v0, :cond_67

    :cond_5f
    const/high16 v0, 0x3f800000    # 1.0f

    :goto_61
    iput v0, p0, Lcom/rey/material/widget/Slider;->mThumbFillPercent:F

    .line 440
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->invalidate()V

    goto :goto_36

    :cond_67
    move v0, v2

    .line 439
    goto :goto_61
.end method


# virtual methods
.method public applyStyle(I)V
    .registers 5
    .param p1, "resId"    # I

    .prologue
    .line 169
    invoke-static {p0, p1}, Lcom/rey/material/util/ViewUtil;->applyStyle(Landroid/view/View;I)V

    .line 170
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/rey/material/widget/Slider;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 171
    return-void
.end method

.method protected applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 29
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 174
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Slider;->getRippleManager()Lcom/rey/material/widget/RippleManager;

    move-result-object v4

    move-object/from16 v5, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    move/from16 v8, p3

    move/from16 v9, p4

    invoke-virtual/range {v4 .. v9}, Lcom/rey/material/widget/RippleManager;->onCreate(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 176
    sget-object v4, Lcom/rey/material/R$styleable;->Slider:[I

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-virtual {v0, v1, v4, v2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v10

    .line 177
    .local v10, "a":Landroid/content/res/TypedArray;
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Slider;->getMinValue()I

    move-result v17

    .line 178
    .local v17, "minValue":I
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Slider;->getMaxValue()I

    move-result v16

    .line 179
    .local v16, "maxValue":I
    const/16 v23, 0x0

    .line 180
    .local v23, "valueRangeDefined":Z
    const/16 v21, -0x1

    .line 181
    .local v21, "value":I
    const/16 v22, 0x0

    .line 182
    .local v22, "valueDefined":Z
    const/4 v14, 0x0

    .line 183
    .local v14, "familyName":Ljava/lang/String;
    const/16 v19, 0x0

    .line 184
    .local v19, "style":I
    const/16 v20, 0x0

    .line 185
    .local v20, "textStyleDefined":Z
    const/4 v15, 0x0

    .local v15, "i":I
    invoke-virtual {v10}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v13

    .local v13, "count":I
    :goto_37
    if-ge v15, v13, :cond_1a0

    .line 186
    invoke-virtual {v10, v15}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v11

    .line 187
    .local v11, "attr":I
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_discreteMode:I

    if-ne v11, v4, :cond_4d

    .line 188
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/rey/material/widget/Slider;->mDiscreteMode:Z

    .line 185
    :cond_4a
    :goto_4a
    add-int/lit8 v15, v15, 0x1

    goto :goto_37

    .line 189
    :cond_4d
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_primaryColor:I

    if-ne v11, v4, :cond_5b

    .line 190
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Slider;->mPrimaryColor:I

    goto :goto_4a

    .line 191
    :cond_5b
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_secondaryColor:I

    if-ne v11, v4, :cond_69

    .line 192
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Slider;->mSecondaryColor:I

    goto :goto_4a

    .line 193
    :cond_69
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_trackSize:I

    if-ne v11, v4, :cond_77

    .line 194
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Slider;->mTrackSize:I

    goto :goto_4a

    .line 195
    :cond_77
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_trackCap:I

    if-ne v11, v4, :cond_9a

    .line 196
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v12

    .line 197
    .local v12, "cap":I
    if-nez v12, :cond_89

    .line 198
    sget-object v4, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/Slider;->mTrackCap:Landroid/graphics/Paint$Cap;

    goto :goto_4a

    .line 199
    :cond_89
    const/4 v4, 0x1

    if-ne v12, v4, :cond_93

    .line 200
    sget-object v4, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/Slider;->mTrackCap:Landroid/graphics/Paint$Cap;

    goto :goto_4a

    .line 202
    :cond_93
    sget-object v4, Landroid/graphics/Paint$Cap;->SQUARE:Landroid/graphics/Paint$Cap;

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/Slider;->mTrackCap:Landroid/graphics/Paint$Cap;

    goto :goto_4a

    .line 204
    .end local v12    # "cap":I
    :cond_9a
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_thumbBorderSize:I

    if-ne v11, v4, :cond_a8

    .line 205
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Slider;->mThumbBorderSize:I

    goto :goto_4a

    .line 206
    :cond_a8
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_thumbRadius:I

    if-ne v11, v4, :cond_b6

    .line 207
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    goto :goto_4a

    .line 208
    :cond_b6
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_thumbFocusRadius:I

    if-ne v11, v4, :cond_c4

    .line 209
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Slider;->mThumbFocusRadius:I

    goto :goto_4a

    .line 210
    :cond_c4
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_travelAnimDuration:I

    if-ne v11, v4, :cond_db

    .line 211
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Slider;->mTravelAnimationDuration:I

    .line 212
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/Slider;->mTravelAnimationDuration:I

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Slider;->mTransformAnimationDuration:I

    goto/16 :goto_4a

    .line 214
    :cond_db
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_alwaysFillThumb:I

    if-ne v11, v4, :cond_ec

    .line 215
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_alwaysFillThumb:I

    const/4 v5, 0x0

    invoke-virtual {v10, v4, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/rey/material/widget/Slider;->mAlwaysFillThumb:Z

    goto/16 :goto_4a

    .line 217
    :cond_ec
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_interpolator:I

    if-ne v11, v4, :cond_105

    .line 218
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_interpolator:I

    const/4 v5, 0x0

    invoke-virtual {v10, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v18

    .line 219
    .local v18, "resId":I
    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/Slider;->mInterpolator:Landroid/view/animation/Interpolator;

    goto/16 :goto_4a

    .line 221
    .end local v18    # "resId":I
    :cond_105
    sget v4, Lcom/rey/material/R$styleable;->Slider_android_gravity:I

    if-ne v11, v4, :cond_114

    .line 222
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Slider;->mGravity:I

    goto/16 :goto_4a

    .line 223
    :cond_114
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_minValue:I

    if-ne v11, v4, :cond_121

    .line 224
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v17

    .line 225
    const/16 v23, 0x1

    goto/16 :goto_4a

    .line 227
    :cond_121
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_maxValue:I

    if-ne v11, v4, :cond_12e

    .line 228
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v16

    .line 229
    const/16 v23, 0x1

    goto/16 :goto_4a

    .line 231
    :cond_12e
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_stepValue:I

    if-ne v11, v4, :cond_13d

    .line 232
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Slider;->mStepValue:I

    goto/16 :goto_4a

    .line 233
    :cond_13d
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_value:I

    if-ne v11, v4, :cond_14a

    .line 234
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v21

    .line 235
    const/16 v22, 0x1

    goto/16 :goto_4a

    .line 237
    :cond_14a
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_fontFamily:I

    if-ne v11, v4, :cond_156

    .line 238
    invoke-virtual {v10, v11}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 239
    const/16 v20, 0x1

    goto/16 :goto_4a

    .line 241
    :cond_156
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_textStyle:I

    if-ne v11, v4, :cond_163

    .line 242
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v19

    .line 243
    const/16 v20, 0x1

    goto/16 :goto_4a

    .line 245
    :cond_163
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_textColor:I

    if-ne v11, v4, :cond_172

    .line 246
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Slider;->mTextColor:I

    goto/16 :goto_4a

    .line 247
    :cond_172
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_textSize:I

    if-ne v11, v4, :cond_181

    .line 248
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Slider;->mTextSize:I

    goto/16 :goto_4a

    .line 249
    :cond_181
    sget v4, Lcom/rey/material/R$styleable;->Slider_android_enabled:I

    if-ne v11, v4, :cond_191

    .line 250
    const/4 v4, 0x1

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/rey/material/widget/Slider;->setEnabled(Z)V

    goto/16 :goto_4a

    .line 251
    :cond_191
    sget v4, Lcom/rey/material/R$styleable;->Slider_sl_baselineOffset:I

    if-ne v11, v4, :cond_4a

    .line 252
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Slider;->mBaselineOffset:I

    goto/16 :goto_4a

    .line 255
    .end local v11    # "attr":I
    :cond_1a0
    invoke-virtual {v10}, Landroid/content/res/TypedArray;->recycle()V

    .line 257
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/Slider;->mTrackSize:I

    if-gez v4, :cond_1b4

    .line 258
    const/4 v4, 0x2

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Slider;->mTrackSize:I

    .line 260
    :cond_1b4
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/Slider;->mThumbBorderSize:I

    if-gez v4, :cond_1c5

    .line 261
    const/4 v4, 0x2

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Slider;->mThumbBorderSize:I

    .line 263
    :cond_1c5
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    if-gez v4, :cond_1d7

    .line 264
    const/16 v4, 0xa

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    .line 266
    :cond_1d7
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/Slider;->mThumbFocusRadius:I

    if-gez v4, :cond_1e9

    .line 267
    const/16 v4, 0xe

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Slider;->mThumbFocusRadius:I

    .line 269
    :cond_1e9
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/Slider;->mTravelAnimationDuration:I

    if-gez v4, :cond_206

    .line 270
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x10e0001

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Slider;->mTravelAnimationDuration:I

    .line 271
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/Slider;->mTravelAnimationDuration:I

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Slider;->mTransformAnimationDuration:I

    .line 274
    :cond_206
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Slider;->mInterpolator:Landroid/view/animation/Interpolator;

    if-nez v4, :cond_215

    .line 275
    new-instance v4, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v4}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/Slider;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 277
    :cond_215
    if-eqz v23, :cond_221

    .line 278
    const/4 v4, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v16

    invoke-virtual {v0, v1, v2, v4}, Lcom/rey/material/widget/Slider;->setValueRange(IIZ)V

    .line 280
    :cond_221
    if-eqz v22, :cond_275

    .line 281
    move/from16 v0, v21

    int-to-float v4, v0

    const/4 v5, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5}, Lcom/rey/material/widget/Slider;->setValue(FZ)V

    .line 285
    :cond_22c
    :goto_22c
    if-eqz v20, :cond_23a

    .line 286
    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-static {v0, v14, v1}, Lcom/rey/material/util/TypefaceUtil;->load(Landroid/content/Context;Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/Slider;->mTypeface:Landroid/graphics/Typeface;

    .line 288
    :cond_23a
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/Slider;->mTextSize:I

    if-gez v4, :cond_24e

    .line 289
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lcom/rey/material/R$dimen;->abc_text_size_small_material:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/Slider;->mTextSize:I

    .line 291
    :cond_24e
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/rey/material/widget/Slider;->mTextSize:I

    int-to-float v5, v5

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 292
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 293
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/rey/material/widget/Slider;->mTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 295
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/Slider;->measureText()V

    .line 296
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/Slider;->invalidate()V

    .line 297
    return-void

    .line 282
    :cond_275
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/Slider;->mThumbPosition:F

    const/4 v5, 0x0

    cmpg-float v4, v4, v5

    if-gez v4, :cond_22c

    .line 283
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/Slider;->mMinValue:I

    int-to-float v4, v4

    const/4 v5, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5}, Lcom/rey/material/widget/Slider;->setValue(FZ)V

    goto :goto_22c
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 15
    .param p1, "canvas"    # Landroid/graphics/Canvas;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/high16 v12, 0x3f800000    # 1.0f

    const/high16 v11, 0x40000000    # 2.0f

    const/4 v10, 0x0

    .line 904
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 906
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget v1, p0, Lcom/rey/material/widget/Slider;->mThumbPosition:F

    mul-float/2addr v0, v1

    iget-object v1, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    add-float v2, v0, v1

    .line 907
    .local v2, "x":F
    iget-boolean v0, p0, Lcom/rey/material/widget/Slider;->mIsRtl:Z

    if-eqz v0, :cond_24

    .line 908
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    mul-float/2addr v0, v11

    sub-float v2, v0, v2

    .line 909
    :cond_24
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    .line 910
    .local v3, "y":F
    iget v1, p0, Lcom/rey/material/widget/Slider;->mSecondaryColor:I

    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_de

    iget v0, p0, Lcom/rey/material/widget/Slider;->mPrimaryColor:I

    :goto_34
    iget v4, p0, Lcom/rey/material/widget/Slider;->mThumbFillPercent:F

    invoke-static {v1, v0, v4}, Lcom/rey/material/util/ColorUtil;->getMiddleColor(IIF)I

    move-result v6

    .line 912
    .local v6, "filledPrimaryColor":I
    iget v0, p0, Lcom/rey/material/widget/Slider;->mThumbCurrentRadius:F

    invoke-direct {p0, v2, v3, v0}, Lcom/rey/material/widget/Slider;->getTrackPath(FFF)V

    .line 913
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 914
    iget-object v1, p0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    iget-boolean v0, p0, Lcom/rey/material/widget/Slider;->mIsRtl:Z

    if-eqz v0, :cond_e2

    move v0, v6

    :goto_4d
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 915
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mRightTrackPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 916
    iget-object v1, p0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    iget-boolean v0, p0, Lcom/rey/material/widget/Slider;->mIsRtl:Z

    if-eqz v0, :cond_e6

    iget v0, p0, Lcom/rey/material/widget/Slider;->mSecondaryColor:I

    :goto_5f
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 917
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mLeftTrackPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 919
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 920
    iget-boolean v0, p0, Lcom/rey/material/widget/Slider;->mDiscreteMode:Z

    if-eqz v0, :cond_f1

    .line 921
    iget v0, p0, Lcom/rey/material/widget/Slider;->mThumbCurrentRadius:F

    iget v1, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    sub-float v5, v12, v0

    .line 923
    .local v5, "factor":F
    cmpl-float v0, v5, v10

    if-lez v0, :cond_c7

    .line 924
    iget-object v1, p0, Lcom/rey/material/widget/Slider;->mMarkPath:Landroid/graphics/Path;

    iget v0, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    int-to-float v4, v0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/rey/material/widget/Slider;->getMarkPath(Landroid/graphics/Path;FFFF)Landroid/graphics/Path;

    move-result-object v0

    iput-object v0, p0, Lcom/rey/material/widget/Slider;->mMarkPath:Landroid/graphics/Path;

    .line 925
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 926
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v8

    .line 927
    .local v8, "saveCount":I
    iget v0, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    neg-int v0, v0

    mul-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    mul-float/2addr v0, v5

    invoke-virtual {p1, v10, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 928
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mMarkPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 929
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/widget/Slider;->mTextColor:I

    invoke-static {v1, v5}, Lcom/rey/material/util/ColorUtil;->getColor(IF)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 930
    invoke-direct {p0}, Lcom/rey/material/widget/Slider;->getValueText()Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/rey/material/widget/Slider;->mTextHeight:I

    int-to-float v1, v1

    div-float/2addr v1, v11

    add-float/2addr v1, v3

    iget v4, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    int-to-float v4, v4

    mul-float/2addr v4, v5

    sub-float/2addr v1, v4

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v1, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 931
    invoke-virtual {p1, v8}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 934
    .end local v8    # "saveCount":I
    :cond_c7
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_e9

    iget v7, p0, Lcom/rey/material/widget/Slider;->mThumbCurrentRadius:F

    .line 935
    .local v7, "radius":F
    :goto_cf
    cmpl-float v0, v7, v10

    if-lez v0, :cond_dd

    .line 936
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 937
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3, v7, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 952
    .end local v5    # "factor":F
    :cond_dd
    :goto_dd
    return-void

    .line 910
    .end local v6    # "filledPrimaryColor":I
    .end local v7    # "radius":F
    :cond_de
    iget v0, p0, Lcom/rey/material/widget/Slider;->mSecondaryColor:I

    goto/16 :goto_34

    .line 914
    .restart local v6    # "filledPrimaryColor":I
    :cond_e2
    iget v0, p0, Lcom/rey/material/widget/Slider;->mSecondaryColor:I

    goto/16 :goto_4d

    :cond_e6
    move v0, v6

    .line 916
    goto/16 :goto_5f

    .line 934
    .restart local v5    # "factor":F
    :cond_e9
    iget v0, p0, Lcom/rey/material/widget/Slider;->mThumbCurrentRadius:F

    iget v1, p0, Lcom/rey/material/widget/Slider;->mThumbBorderSize:I

    int-to-float v1, v1

    sub-float v7, v0, v1

    goto :goto_cf

    .line 941
    .end local v5    # "factor":F
    :cond_f1
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_10c

    iget v7, p0, Lcom/rey/material/widget/Slider;->mThumbCurrentRadius:F

    .line 942
    .restart local v7    # "radius":F
    :goto_f9
    iget v0, p0, Lcom/rey/material/widget/Slider;->mThumbFillPercent:F

    cmpl-float v0, v0, v12

    if-nez v0, :cond_114

    .line 943
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 950
    :goto_106
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3, v7, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_dd

    .line 941
    .end local v7    # "radius":F
    :cond_10c
    iget v0, p0, Lcom/rey/material/widget/Slider;->mThumbCurrentRadius:F

    iget v1, p0, Lcom/rey/material/widget/Slider;->mThumbBorderSize:I

    int-to-float v1, v1

    sub-float v7, v0, v1

    goto :goto_f9

    .line 945
    .restart local v7    # "radius":F
    :cond_114
    iget v0, p0, Lcom/rey/material/widget/Slider;->mThumbBorderSize:I

    int-to-float v0, v0

    sub-float v0, v7, v0

    iget v1, p0, Lcom/rey/material/widget/Slider;->mThumbFillPercent:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/rey/material/widget/Slider;->mThumbBorderSize:I

    int-to-float v1, v1

    add-float v9, v0, v1

    .line 946
    .local v9, "strokeWidth":F
    div-float v0, v9, v11

    sub-float/2addr v7, v0

    .line 947
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 948
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v9}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    goto :goto_106
.end method

.method public getBaseline()I
    .registers 12

    .prologue
    const/high16 v10, 0x40000000    # 2.0f

    .line 580
    iget v4, p0, Lcom/rey/material/widget/Slider;->mGravity:I

    and-int/lit8 v0, v4, 0x70

    .line 583
    .local v0, "align":I
    iget-boolean v4, p0, Lcom/rey/material/widget/Slider;->mDiscreteMode:Z

    if-eqz v4, :cond_53

    .line 584
    iget v4, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    int-to-double v4, v4

    const-wide/high16 v6, 0x4010000000000000L    # 4.0

    const-wide/high16 v8, 0x4000000000000000L    # 2.0

    invoke-static {v8, v9}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v8

    add-double/2addr v6, v8

    mul-double/2addr v4, v6

    double-to-int v2, v4

    .line 585
    .local v2, "fullHeight":I
    iget v4, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    mul-int/lit8 v3, v4, 0x2

    .line 586
    .local v3, "height":I
    sparse-switch v0, :sswitch_data_7e

    .line 594
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getMeasuredHeight()I

    move-result v4

    sub-int/2addr v4, v3

    int-to-float v4, v4

    div-float/2addr v4, v10

    sub-int v5, v2, v3

    int-to-float v5, v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    move-result v4

    iget v5, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    int-to-float v5, v5

    add-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 613
    .end local v2    # "fullHeight":I
    .local v1, "baseline":I
    :goto_35
    iget v4, p0, Lcom/rey/material/widget/Slider;->mBaselineOffset:I

    add-int/2addr v4, v1

    return v4

    .line 588
    .end local v1    # "baseline":I
    .restart local v2    # "fullHeight":I
    :sswitch_39
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPaddingTop()I

    move-result v4

    sub-int v5, v2, v3

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    iget v5, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    add-int v1, v4, v5

    .line 589
    .restart local v1    # "baseline":I
    goto :goto_35

    .line 591
    .end local v1    # "baseline":I
    :sswitch_48
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getMeasuredHeight()I

    move-result v4

    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPaddingBottom()I

    move-result v5

    sub-int v1, v4, v5

    .line 592
    .restart local v1    # "baseline":I
    goto :goto_35

    .line 599
    .end local v1    # "baseline":I
    .end local v2    # "fullHeight":I
    .end local v3    # "height":I
    :cond_53
    iget v4, p0, Lcom/rey/material/widget/Slider;->mThumbFocusRadius:I

    mul-int/lit8 v3, v4, 0x2

    .line 600
    .restart local v3    # "height":I
    sparse-switch v0, :sswitch_data_88

    .line 608
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getMeasuredHeight()I

    move-result v4

    sub-int/2addr v4, v3

    int-to-float v4, v4

    div-float/2addr v4, v10

    iget v5, p0, Lcom/rey/material/widget/Slider;->mThumbFocusRadius:I

    int-to-float v5, v5

    add-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v1

    .restart local v1    # "baseline":I
    goto :goto_35

    .line 602
    .end local v1    # "baseline":I
    :sswitch_6a
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPaddingTop()I

    move-result v4

    iget v5, p0, Lcom/rey/material/widget/Slider;->mThumbFocusRadius:I

    add-int v1, v4, v5

    .line 603
    .restart local v1    # "baseline":I
    goto :goto_35

    .line 605
    .end local v1    # "baseline":I
    :sswitch_73
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getMeasuredHeight()I

    move-result v4

    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPaddingBottom()I

    move-result v5

    sub-int v1, v4, v5

    .line 606
    .restart local v1    # "baseline":I
    goto :goto_35

    .line 586
    :sswitch_data_7e
    .sparse-switch
        0x30 -> :sswitch_39
        0x50 -> :sswitch_48
    .end sparse-switch

    .line 600
    :sswitch_data_88
    .sparse-switch
        0x30 -> :sswitch_6a
        0x50 -> :sswitch_73
    .end sparse-switch
.end method

.method public getExactValue()F
    .registers 3

    .prologue
    .line 405
    iget v0, p0, Lcom/rey/material/widget/Slider;->mMaxValue:I

    iget v1, p0, Lcom/rey/material/widget/Slider;->mMinValue:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPosition()F

    move-result v1

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/rey/material/widget/Slider;->mMinValue:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    return v0
.end method

.method public getMaxValue()I
    .registers 2

    .prologue
    .line 364
    iget v0, p0, Lcom/rey/material/widget/Slider;->mMaxValue:I

    return v0
.end method

.method public getMinValue()I
    .registers 2

    .prologue
    .line 357
    iget v0, p0, Lcom/rey/material/widget/Slider;->mMinValue:I

    return v0
.end method

.method public getPosition()F
    .registers 2

    .prologue
    .line 412
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mThumbMoveAnimator:Lcom/rey/material/widget/Slider$ThumbMoveAnimator;

    invoke-virtual {v0}, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mThumbMoveAnimator:Lcom/rey/material/widget/Slider$ThumbMoveAnimator;

    invoke-virtual {v0}, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->getPosition()F

    move-result v0

    :goto_e
    return v0

    :cond_f
    iget v0, p0, Lcom/rey/material/widget/Slider;->mThumbPosition:F

    goto :goto_e
.end method

.method protected getRippleManager()Lcom/rey/material/widget/RippleManager;
    .registers 3

    .prologue
    .line 509
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    if-nez v0, :cond_13

    .line 510
    const-class v1, Lcom/rey/material/widget/RippleManager;

    monitor-enter v1

    .line 511
    :try_start_7
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    if-nez v0, :cond_12

    .line 512
    new-instance v0, Lcom/rey/material/widget/RippleManager;

    invoke-direct {v0}, Lcom/rey/material/widget/RippleManager;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/Slider;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    .line 513
    :cond_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_16

    .line 516
    :cond_13
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    return-object v0

    .line 513
    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v0
.end method

.method public getStepValue()I
    .registers 2

    .prologue
    .line 371
    iget v0, p0, Lcom/rey/material/widget/Slider;->mStepValue:I

    return v0
.end method

.method public getSuggestedMinimumHeight()I
    .registers 7

    .prologue
    .line 566
    iget-boolean v0, p0, Lcom/rey/material/widget/Slider;->mDiscreteMode:Z

    if-eqz v0, :cond_1d

    iget v0, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    int-to-double v0, v0

    const-wide/high16 v2, 0x4010000000000000L    # 4.0

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    add-double/2addr v2, v4

    mul-double/2addr v0, v2

    double-to-int v0, v0

    :goto_12
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPaddingTop()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPaddingBottom()I

    move-result v1

    add-int/2addr v0, v1

    return v0

    :cond_1d
    iget v0, p0, Lcom/rey/material/widget/Slider;->mThumbFocusRadius:I

    mul-int/lit8 v0, v0, 0x2

    goto :goto_12
.end method

.method public getSuggestedMinimumWidth()I
    .registers 5

    .prologue
    .line 561
    iget-boolean v0, p0, Lcom/rey/material/widget/Slider;->mDiscreteMode:Z

    if-eqz v0, :cond_1c

    iget v0, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    int-to-double v0, v0

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    mul-double/2addr v0, v2

    double-to-int v0, v0

    :goto_f
    mul-int/lit8 v0, v0, 0x4

    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPaddingLeft()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPaddingRight()I

    move-result v1

    add-int/2addr v0, v1

    return v0

    :cond_1c
    iget v0, p0, Lcom/rey/material/widget/Slider;->mThumbFocusRadius:I

    goto :goto_f
.end method

.method public getValue()I
    .registers 2

    .prologue
    .line 398
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getExactValue()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/high16 v2, -0x1000000

    .line 144
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/rey/material/widget/Slider;->mPaint:Landroid/graphics/Paint;

    .line 147
    invoke-static {p1, v2}, Lcom/rey/material/util/ThemeUtil;->colorControlActivated(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/Slider;->mPrimaryColor:I

    .line 148
    invoke-static {p1, v2}, Lcom/rey/material/util/ThemeUtil;->colorControlNormal(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/Slider;->mSecondaryColor:I

    .line 150
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    .line 151
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/Slider;->mTempRect:Landroid/graphics/RectF;

    .line 152
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/Slider;->mLeftTrackPath:Landroid/graphics/Path;

    .line 153
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/Slider;->mRightTrackPath:Landroid/graphics/Path;

    .line 155
    new-instance v0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;-><init>(Lcom/rey/material/widget/Slider;)V

    iput-object v0, p0, Lcom/rey/material/widget/Slider;->mThumbRadiusAnimator:Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;

    .line 156
    new-instance v0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;-><init>(Lcom/rey/material/widget/Slider;)V

    iput-object v0, p0, Lcom/rey/material/widget/Slider;->mThumbStrokeAnimator:Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;

    .line 157
    new-instance v0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;-><init>(Lcom/rey/material/widget/Slider;)V

    iput-object v0, p0, Lcom/rey/material/widget/Slider;->mThumbMoveAnimator:Lcom/rey/material/widget/Slider$ThumbMoveAnimator;

    .line 159
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/Slider;->mTouchSlop:I

    .line 160
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/Slider;->mMemoPoint:Landroid/graphics/PointF;

    .line 162
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/Slider;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 164
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_67

    .line 165
    invoke-static {p1, p2, p3, p4}, Lcom/rey/material/app/ThemeManager;->getStyleId(Landroid/content/Context;Landroid/util/AttributeSet;II)I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/Slider;->mStyleId:I

    .line 166
    :cond_67
    return-void
.end method

.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 310
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 311
    iget v0, p0, Lcom/rey/material/widget/Slider;->mStyleId:I

    if-eqz v0, :cond_12

    .line 312
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->registerOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 313
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/Slider;->onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V

    .line 315
    :cond_12
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 319
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 320
    invoke-static {p0}, Lcom/rey/material/widget/RippleManager;->cancelRipple(Landroid/view/View;)V

    .line 321
    iget v0, p0, Lcom/rey/material/widget/Slider;->mStyleId:I

    if-eqz v0, :cond_11

    .line 322
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->unregisterOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 323
    :cond_11
    return-void
.end method

.method protected onMeasure(II)V
    .registers 8
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 532
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    .line 533
    .local v3, "widthSize":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    .line 535
    .local v2, "widthMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 536
    .local v1, "heightSize":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 538
    .local v0, "heightMode":I
    sparse-switch v2, :sswitch_data_36

    .line 547
    :goto_13
    sparse-switch v0, :sswitch_data_40

    .line 556
    :goto_16
    invoke-virtual {p0, v3, v1}, Lcom/rey/material/widget/Slider;->setMeasuredDimension(II)V

    .line 557
    return-void

    .line 540
    :sswitch_1a
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getSuggestedMinimumWidth()I

    move-result v3

    .line 541
    goto :goto_13

    .line 543
    :sswitch_1f
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getSuggestedMinimumWidth()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    goto :goto_13

    .line 549
    :sswitch_28
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getSuggestedMinimumHeight()I

    move-result v1

    .line 550
    goto :goto_16

    .line 552
    :sswitch_2d
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getSuggestedMinimumHeight()I

    move-result v4

    invoke-static {v1, v4}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_16

    .line 538
    :sswitch_data_36
    .sparse-switch
        -0x80000000 -> :sswitch_1f
        0x0 -> :sswitch_1a
    .end sparse-switch

    .line 547
    :sswitch_data_40
    .sparse-switch
        -0x80000000 -> :sswitch_2d
        0x0 -> :sswitch_28
    .end sparse-switch
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 1201
    move-object v0, p1

    check-cast v0, Lcom/rey/material/widget/Slider$SavedState;

    .line 1203
    .local v0, "ss":Lcom/rey/material/widget/Slider$SavedState;
    invoke-virtual {v0}, Lcom/rey/material/widget/Slider$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 1204
    iget v1, v0, Lcom/rey/material/widget/Slider$SavedState;->position:F

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/rey/material/widget/Slider;->setPosition(FZ)V

    .line 1205
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->requestLayout()V

    .line 1206
    return-void
.end method

.method public onRtlPropertiesChanged(I)V
    .registers 4
    .param p1, "layoutDirection"    # I

    .prologue
    const/4 v0, 0x1

    .line 571
    if-ne p1, v0, :cond_d

    .line 572
    .local v0, "rtl":Z
    :goto_3
    iget-boolean v1, p0, Lcom/rey/material/widget/Slider;->mIsRtl:Z

    if-eq v1, v0, :cond_c

    .line 573
    iput-boolean v0, p0, Lcom/rey/material/widget/Slider;->mIsRtl:Z

    .line 574
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->invalidate()V

    .line 576
    :cond_c
    return-void

    .line 571
    .end local v0    # "rtl":Z
    :cond_d
    const/4 v0, 0x0

    goto :goto_3
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 1191
    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 1193
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Lcom/rey/material/widget/Slider$SavedState;

    invoke-direct {v0, v1}, Lcom/rey/material/widget/Slider$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 1195
    .local v0, "ss":Lcom/rey/material/widget/Slider$SavedState;
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPosition()F

    move-result v2

    iput v2, v0, Lcom/rey/material/widget/Slider$SavedState;->position:F

    .line 1196
    return-object v0
.end method

.method protected onSizeChanged(IIII)V
    .registers 15
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    const/high16 v9, 0x40000000    # 2.0f

    .line 618
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPaddingLeft()I

    move-result v4

    iget v5, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    add-int/2addr v4, v5

    int-to-float v4, v4

    iput v4, v3, Landroid/graphics/RectF;->left:F

    .line 619
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPaddingRight()I

    move-result v4

    sub-int v4, p1, v4

    iget v5, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    sub-int/2addr v4, v5

    int-to-float v4, v4

    iput v4, v3, Landroid/graphics/RectF;->right:F

    .line 621
    iget v3, p0, Lcom/rey/material/widget/Slider;->mGravity:I

    and-int/lit8 v0, v3, 0x70

    .line 623
    .local v0, "align":I
    iget-boolean v3, p0, Lcom/rey/material/widget/Slider;->mDiscreteMode:Z

    if-eqz v3, :cond_83

    .line 624
    iget v3, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    int-to-double v3, v3

    const-wide/high16 v5, 0x4010000000000000L    # 4.0

    const-wide/high16 v7, 0x4000000000000000L    # 2.0

    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v7

    add-double/2addr v5, v7

    mul-double/2addr v3, v5

    double-to-int v1, v3

    .line 625
    .local v1, "fullHeight":I
    iget v3, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    mul-int/lit8 v2, v3, 0x2

    .line 626
    .local v2, "height":I
    sparse-switch v0, :sswitch_data_c8

    .line 636
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    sub-int v4, p2, v2

    int-to-float v4, v4

    div-float/2addr v4, v9

    sub-int v5, v1, v2

    int-to-float v5, v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    move-result v4

    iput v4, v3, Landroid/graphics/RectF;->top:F

    .line 637
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    int-to-float v5, v2

    add-float/2addr v4, v5

    iput v4, v3, Landroid/graphics/RectF;->bottom:F

    .line 658
    .end local v1    # "fullHeight":I
    :goto_52
    return-void

    .line 628
    .restart local v1    # "fullHeight":I
    :sswitch_53
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPaddingTop()I

    move-result v4

    sub-int v5, v1, v2

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    int-to-float v4, v4

    iput v4, v3, Landroid/graphics/RectF;->top:F

    .line 629
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    int-to-float v5, v2

    add-float/2addr v4, v5

    iput v4, v3, Landroid/graphics/RectF;->bottom:F

    goto :goto_52

    .line 632
    :sswitch_6d
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPaddingBottom()I

    move-result v4

    sub-int v4, p2, v4

    int-to-float v4, v4

    iput v4, v3, Landroid/graphics/RectF;->bottom:F

    .line 633
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    int-to-float v5, v2

    sub-float/2addr v4, v5

    iput v4, v3, Landroid/graphics/RectF;->top:F

    goto :goto_52

    .line 642
    .end local v1    # "fullHeight":I
    .end local v2    # "height":I
    :cond_83
    iget v3, p0, Lcom/rey/material/widget/Slider;->mThumbFocusRadius:I

    mul-int/lit8 v2, v3, 0x2

    .line 643
    .restart local v2    # "height":I
    sparse-switch v0, :sswitch_data_d2

    .line 653
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    sub-int v4, p2, v2

    int-to-float v4, v4

    div-float/2addr v4, v9

    iput v4, v3, Landroid/graphics/RectF;->top:F

    .line 654
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    int-to-float v5, v2

    add-float/2addr v4, v5

    iput v4, v3, Landroid/graphics/RectF;->bottom:F

    goto :goto_52

    .line 645
    :sswitch_9d
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPaddingTop()I

    move-result v4

    int-to-float v4, v4

    iput v4, v3, Landroid/graphics/RectF;->top:F

    .line 646
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    int-to-float v5, v2

    add-float/2addr v4, v5

    iput v4, v3, Landroid/graphics/RectF;->bottom:F

    goto :goto_52

    .line 649
    :sswitch_b1
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPaddingBottom()I

    move-result v4

    sub-int v4, p2, v4

    int-to-float v4, v4

    iput v4, v3, Landroid/graphics/RectF;->bottom:F

    .line 650
    iget-object v3, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    int-to-float v5, v2

    sub-float/2addr v4, v5

    iput v4, v3, Landroid/graphics/RectF;->top:F

    goto :goto_52

    .line 626
    nop

    :sswitch_data_c8
    .sparse-switch
        0x30 -> :sswitch_53
        0x50 -> :sswitch_6d
    .end sparse-switch

    .line 643
    :sswitch_data_d2
    .sparse-switch
        0x30 -> :sswitch_9d
        0x50 -> :sswitch_b1
    .end sparse-switch
.end method

.method public onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V
    .registers 5
    .param p1, "event"    # Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;

    .prologue
    .line 301
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/widget/Slider;->mStyleId:I

    invoke-virtual {v1, v2}, Lcom/rey/material/app/ThemeManager;->getCurrentStyle(I)I

    move-result v0

    .line 302
    .local v0, "style":I
    iget v1, p0, Lcom/rey/material/widget/Slider;->mCurrentStyle:I

    if-eq v1, v0, :cond_15

    .line 303
    iput v0, p0, Lcom/rey/material/widget/Slider;->mCurrentStyle:I

    .line 304
    iget v1, p0, Lcom/rey/material/widget/Slider;->mCurrentStyle:I

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/Slider;->applyStyle(I)V

    .line 306
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
    const/high16 v11, 0x3f800000    # 1.0f

    const/4 v10, 0x0

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 691
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 692
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getRippleManager()Lcom/rey/material/widget/RippleManager;

    move-result-object v4

    invoke-virtual {v4, p0, p1}, Lcom/rey/material/widget/RippleManager;->onTouchEvent(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 694
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->isEnabled()Z

    move-result v4

    if-nez v4, :cond_16

    .line 752
    :goto_15
    return v6

    .line 697
    :cond_16
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    .line 698
    .local v2, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    .line 699
    .local v3, "y":F
    iget-boolean v4, p0, Lcom/rey/material/widget/Slider;->mIsRtl:Z

    if-eqz v4, :cond_2d

    .line 700
    const/high16 v4, 0x40000000    # 2.0f

    iget-object v7, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v7}, Landroid/graphics/RectF;->centerX()F

    move-result v7

    mul-float/2addr v4, v7

    sub-float v2, v4, v2

    .line 702
    :cond_2d
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    packed-switch v4, :pswitch_data_122

    :cond_34
    :goto_34
    move v6, v5

    .line 752
    goto :goto_15

    .line 704
    :pswitch_36
    iget v4, p0, Lcom/rey/material/widget/Slider;->mThumbRadius:I

    int-to-float v4, v4

    invoke-direct {p0, v2, v3, v4}, Lcom/rey/material/widget/Slider;->isThumbHit(FFF)Z

    move-result v4

    if-eqz v4, :cond_6a

    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mThumbMoveAnimator:Lcom/rey/material/widget/Slider$ThumbMoveAnimator;

    invoke-virtual {v4}, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->isRunning()Z

    move-result v4

    if-nez v4, :cond_6a

    move v4, v5

    :goto_48
    iput-boolean v4, p0, Lcom/rey/material/widget/Slider;->mIsDragging:Z

    .line 705
    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mMemoPoint:Landroid/graphics/PointF;

    invoke-virtual {v4, v2, v3}, Landroid/graphics/PointF;->set(FF)V

    .line 706
    iget-boolean v4, p0, Lcom/rey/material/widget/Slider;->mIsDragging:Z

    if-eqz v4, :cond_34

    .line 707
    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mThumbRadiusAnimator:Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;

    iget-boolean v7, p0, Lcom/rey/material/widget/Slider;->mDiscreteMode:Z

    if-eqz v7, :cond_6c

    :goto_59
    invoke-virtual {v4, v6}, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->startAnimation(I)Z

    .line 709
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    if-eqz v4, :cond_34

    .line 710
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    invoke-interface {v4, v5}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_34

    :cond_6a
    move v4, v6

    .line 704
    goto :goto_48

    .line 707
    :cond_6c
    iget v6, p0, Lcom/rey/material/widget/Slider;->mThumbFocusRadius:I

    goto :goto_59

    .line 714
    :pswitch_6f
    iget-boolean v4, p0, Lcom/rey/material/widget/Slider;->mIsDragging:Z

    if-eqz v4, :cond_34

    .line 715
    iget-boolean v4, p0, Lcom/rey/material/widget/Slider;->mDiscreteMode:Z

    if-eqz v4, :cond_94

    .line 716
    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    sub-float v4, v2, v4

    iget-object v6, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v6

    div-float/2addr v4, v6

    invoke-static {v10, v4}, Ljava/lang/Math;->max(FF)F

    move-result v4

    invoke-static {v11, v4}, Ljava/lang/Math;->min(FF)F

    move-result v4

    invoke-direct {p0, v4}, Lcom/rey/material/widget/Slider;->correctPosition(F)F

    move-result v1

    .line 717
    .local v1, "position":F
    invoke-direct {p0, v1, v5, v5, v5}, Lcom/rey/material/widget/Slider;->setPosition(FZZZ)V

    goto :goto_34

    .line 720
    .end local v1    # "position":F
    :cond_94
    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mMemoPoint:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->x:F

    sub-float v4, v2, v4

    iget-object v7, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v7}, Landroid/graphics/RectF;->width()F

    move-result v7

    div-float v0, v4, v7

    .line 721
    .local v0, "offset":F
    iget v4, p0, Lcom/rey/material/widget/Slider;->mThumbPosition:F

    add-float/2addr v4, v0

    invoke-static {v10, v4}, Ljava/lang/Math;->max(FF)F

    move-result v4

    invoke-static {v11, v4}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 722
    .restart local v1    # "position":F
    invoke-direct {p0, v1, v6, v5, v5}, Lcom/rey/material/widget/Slider;->setPosition(FZZZ)V

    .line 723
    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mMemoPoint:Landroid/graphics/PointF;

    iput v2, v4, Landroid/graphics/PointF;->x:F

    .line 724
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->invalidate()V

    goto/16 :goto_34

    .line 729
    .end local v0    # "offset":F
    .end local v1    # "position":F
    :pswitch_b9
    iget-boolean v4, p0, Lcom/rey/material/widget/Slider;->mIsDragging:Z

    if-eqz v4, :cond_d5

    .line 730
    iput-boolean v6, p0, Lcom/rey/material/widget/Slider;->mIsDragging:Z

    .line 731
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPosition()F

    move-result v4

    invoke-direct {p0, v4, v5, v5, v5}, Lcom/rey/material/widget/Slider;->setPosition(FZZZ)V

    .line 733
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    if-eqz v4, :cond_34

    .line 734
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    invoke-interface {v4, v6}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto/16 :goto_34

    .line 736
    :cond_d5
    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mMemoPoint:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->x:F

    iget-object v6, p0, Lcom/rey/material/widget/Slider;->mMemoPoint:Landroid/graphics/PointF;

    iget v6, v6, Landroid/graphics/PointF;->y:F

    invoke-direct {p0, v4, v6, v2, v3}, Lcom/rey/material/widget/Slider;->distance(FFFF)D

    move-result-wide v6

    iget v4, p0, Lcom/rey/material/widget/Slider;->mTouchSlop:I

    int-to-double v8, v4

    cmpg-double v4, v6, v8

    if-gtz v4, :cond_34

    .line 737
    iget-object v4, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    sub-float v4, v2, v4

    iget-object v6, p0, Lcom/rey/material/widget/Slider;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v6

    div-float/2addr v4, v6

    invoke-static {v10, v4}, Ljava/lang/Math;->max(FF)F

    move-result v4

    invoke-static {v11, v4}, Ljava/lang/Math;->min(FF)F

    move-result v4

    invoke-direct {p0, v4}, Lcom/rey/material/widget/Slider;->correctPosition(F)F

    move-result v1

    .line 738
    .restart local v1    # "position":F
    invoke-direct {p0, v1, v5, v5, v5}, Lcom/rey/material/widget/Slider;->setPosition(FZZZ)V

    goto/16 :goto_34

    .line 742
    .end local v1    # "position":F
    :pswitch_106
    iget-boolean v4, p0, Lcom/rey/material/widget/Slider;->mIsDragging:Z

    if-eqz v4, :cond_34

    .line 743
    iput-boolean v6, p0, Lcom/rey/material/widget/Slider;->mIsDragging:Z

    .line 744
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPosition()F

    move-result v4

    invoke-direct {p0, v4, v5, v5, v5}, Lcom/rey/material/widget/Slider;->setPosition(FZZZ)V

    .line 746
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    if-eqz v4, :cond_34

    .line 747
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    invoke-interface {v4, v6}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto/16 :goto_34

    .line 702
    :pswitch_data_122
    .packed-switch 0x0
        :pswitch_36
        :pswitch_b9
        :pswitch_6f
        :pswitch_106
    .end packed-switch
.end method

.method public setAlwaysFillThumb(Z)V
    .registers 2
    .param p1, "alwaysFillThumb"    # Z

    .prologue
    .line 474
    iput-boolean p1, p0, Lcom/rey/material/widget/Slider;->mAlwaysFillThumb:Z

    .line 475
    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 501
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 502
    .local v0, "background":Landroid/graphics/drawable/Drawable;
    instance-of v1, v0, Lcom/rey/material/drawable/RippleDrawable;

    if-eqz v1, :cond_12

    instance-of v1, p1, Lcom/rey/material/drawable/RippleDrawable;

    if-nez v1, :cond_12

    .line 503
    check-cast v0, Lcom/rey/material/drawable/RippleDrawable;

    .end local v0    # "background":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/RippleDrawable;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 506
    :goto_11
    return-void

    .line 505
    .restart local v0    # "background":Landroid/graphics/drawable/Drawable;
    :cond_12
    invoke-super {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_11
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 3
    .param p1, "l"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 521
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getRippleManager()Lcom/rey/material/widget/RippleManager;

    move-result-object v0

    .line 522
    .local v0, "rippleManager":Lcom/rey/material/widget/RippleManager;
    if-ne p1, v0, :cond_a

    .line 523
    invoke-super {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 528
    :goto_9
    return-void

    .line 525
    :cond_a
    invoke-virtual {v0, p1}, Lcom/rey/material/widget/RippleManager;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 526
    invoke-virtual {p0, v0}, Lcom/rey/material/widget/Slider;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_9
.end method

.method public setOnPositionChangeListener(Lcom/rey/material/widget/Slider$OnPositionChangeListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/rey/material/widget/Slider$OnPositionChangeListener;

    .prologue
    .line 492
    iput-object p1, p0, Lcom/rey/material/widget/Slider;->mOnPositionChangeListener:Lcom/rey/material/widget/Slider$OnPositionChangeListener;

    .line 493
    return-void
.end method

.method public setPosition(FZ)V
    .registers 4
    .param p1, "pos"    # F
    .param p2, "animation"    # Z

    .prologue
    .line 421
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p2, v0}, Lcom/rey/material/widget/Slider;->setPosition(FZZZ)V

    .line 422
    return-void
.end method

.method public setPrimaryColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 456
    iput p1, p0, Lcom/rey/material/widget/Slider;->mPrimaryColor:I

    .line 457
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->invalidate()V

    .line 458
    return-void
.end method

.method public setSecondaryColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 465
    iput p1, p0, Lcom/rey/material/widget/Slider;->mSecondaryColor:I

    .line 466
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->invalidate()V

    .line 467
    return-void
.end method

.method public setValue(FZ)V
    .registers 6
    .param p1, "value"    # F
    .param p2, "animation"    # Z

    .prologue
    .line 483
    iget v0, p0, Lcom/rey/material/widget/Slider;->mMaxValue:I

    int-to-float v0, v0

    iget v1, p0, Lcom/rey/material/widget/Slider;->mMinValue:I

    int-to-float v1, v1

    invoke-static {p1, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    .line 484
    iget v0, p0, Lcom/rey/material/widget/Slider;->mMinValue:I

    int-to-float v0, v0

    sub-float v0, p1, v0

    iget v1, p0, Lcom/rey/material/widget/Slider;->mMaxValue:I

    iget v2, p0, Lcom/rey/material/widget/Slider;->mMinValue:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    div-float/2addr v0, v1

    invoke-virtual {p0, v0, p2}, Lcom/rey/material/widget/Slider;->setPosition(FZ)V

    .line 485
    return-void
.end method

.method public setValueDescriptionProvider(Lcom/rey/material/widget/Slider$ValueDescriptionProvider;)V
    .registers 2
    .param p1, "provider"    # Lcom/rey/material/widget/Slider$ValueDescriptionProvider;

    .prologue
    .line 496
    iput-object p1, p0, Lcom/rey/material/widget/Slider;->mValueDescriptionProvider:Lcom/rey/material/widget/Slider$ValueDescriptionProvider;

    .line 497
    return-void
.end method

.method public setValueRange(IIZ)V
    .registers 12
    .param p1, "min"    # I
    .param p2, "max"    # I
    .param p3, "animation"    # Z

    .prologue
    .line 381
    if-lt p2, p1, :cond_a

    iget v0, p0, Lcom/rey/material/widget/Slider;->mMinValue:I

    if-ne p1, v0, :cond_b

    iget v0, p0, Lcom/rey/material/widget/Slider;->mMaxValue:I

    if-ne p2, v0, :cond_b

    .line 392
    :cond_a
    :goto_a
    return-void

    .line 384
    :cond_b
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getExactValue()F

    move-result v7

    .line 385
    .local v7, "oldValue":F
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPosition()F

    move-result v3

    .line 386
    .local v3, "oldPosition":F
    iput p1, p0, Lcom/rey/material/widget/Slider;->mMinValue:I

    .line 387
    iput p2, p0, Lcom/rey/material/widget/Slider;->mMaxValue:I

    .line 389
    invoke-virtual {p0, v7, p3}, Lcom/rey/material/widget/Slider;->setValue(FZ)V

    .line 390
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mOnPositionChangeListener:Lcom/rey/material/widget/Slider$OnPositionChangeListener;

    if-eqz v0, :cond_a

    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getPosition()F

    move-result v0

    cmpl-float v0, v3, v0

    if-nez v0, :cond_a

    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getExactValue()F

    move-result v0

    cmpl-float v0, v7, v0

    if-eqz v0, :cond_a

    .line 391
    iget-object v0, p0, Lcom/rey/material/widget/Slider;->mOnPositionChangeListener:Lcom/rey/material/widget/Slider$OnPositionChangeListener;

    const/4 v2, 0x0

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v5

    invoke-virtual {p0}, Lcom/rey/material/widget/Slider;->getValue()I

    move-result v6

    move-object v1, p0

    move v4, v3

    invoke-interface/range {v0 .. v6}, Lcom/rey/material/widget/Slider$OnPositionChangeListener;->onPositionChanged(Lcom/rey/material/widget/Slider;ZFFII)V

    goto :goto_a
.end method
