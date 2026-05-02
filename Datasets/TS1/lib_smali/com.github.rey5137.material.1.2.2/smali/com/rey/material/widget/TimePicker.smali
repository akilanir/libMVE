.class public Lcom/rey/material/widget/TimePicker;
.super Landroid/view/View;
.source "TimePicker.java"

# interfaces
.implements Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/widget/TimePicker$SavedState;,
        Lcom/rey/material/widget/TimePicker$OnTimeChangedListener;
    }
.end annotation


# static fields
.field public static final MODE_HOUR:I = 0x0

.field public static final MODE_MINUTE:I = 0x1


# instance fields
.field private m24Hour:Z

.field private mAnimDuration:I

.field private mAnimProgress:F

.field private mBackgroundColor:I

.field private mCenterPoint:Landroid/graphics/PointF;

.field protected mCurrentStyle:I

.field private mEdited:Z

.field private mHour:I

.field private mInInterpolator:Landroid/view/animation/Interpolator;

.field private mInnerRadius:F

.field private mLocations:[F

.field private mMinute:I

.field private mMode:I

.field private mOnTimeChangedListener:Lcom/rey/material/widget/TimePicker$OnTimeChangedListener;

.field private mOutInterpolator:Landroid/view/animation/Interpolator;

.field private mOuterRadius:F

.field private mPaint:Landroid/graphics/Paint;

.field private mRect:Landroid/graphics/Rect;

.field private mRunning:Z

.field private mSecondInnerRadius:F

.field private mSelectionColor:I

.field private mSelectionRadius:I

.field private mStartTime:J

.field protected mStyleId:I

.field private mTextColor:I

.field private mTextHighlightColor:I

.field private mTextSize:I

.field private mTickSize:I

.field private mTicks:[Ljava/lang/String;

.field private mTypeface:Landroid/graphics/Typeface;

.field private final mUpdater:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, -0x1

    const/4 v1, 0x0

    .line 106
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 37
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/TimePicker;->mCurrentStyle:I

    .line 41
    iput v2, p0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    .line 42
    iput v2, p0, Lcom/rey/material/widget/TimePicker;->mTickSize:I

    .line 43
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iput-object v0, p0, Lcom/rey/material/widget/TimePicker;->mTypeface:Landroid/graphics/Typeface;

    .line 44
    iput v2, p0, Lcom/rey/material/widget/TimePicker;->mTextSize:I

    .line 45
    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/rey/material/widget/TimePicker;->mTextColor:I

    .line 46
    iput v2, p0, Lcom/rey/material/widget/TimePicker;->mTextHighlightColor:I

    .line 47
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/widget/TimePicker;->m24Hour:Z

    .line 49
    iput v2, p0, Lcom/rey/material/widget/TimePicker;->mAnimDuration:I

    .line 63
    const/16 v0, 0x48

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/rey/material/widget/TimePicker;->mLocations:[F

    .line 67
    iput v1, p0, Lcom/rey/material/widget/TimePicker;->mMode:I

    .line 72
    iput v1, p0, Lcom/rey/material/widget/TimePicker;->mHour:I

    .line 73
    iput v1, p0, Lcom/rey/material/widget/TimePicker;->mMinute:I

    .line 75
    iput-boolean v1, p0, Lcom/rey/material/widget/TimePicker;->mEdited:Z

    .line 793
    new-instance v0, Lcom/rey/material/widget/TimePicker$1;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/TimePicker$1;-><init>(Lcom/rey/material/widget/TimePicker;)V

    iput-object v0, p0, Lcom/rey/material/widget/TimePicker;->mUpdater:Ljava/lang/Runnable;

    .line 108
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v1, v1}, Lcom/rey/material/widget/TimePicker;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 109
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, -0x1

    const/4 v1, 0x0

    .line 112
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/TimePicker;->mCurrentStyle:I

    .line 41
    iput v2, p0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    .line 42
    iput v2, p0, Lcom/rey/material/widget/TimePicker;->mTickSize:I

    .line 43
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iput-object v0, p0, Lcom/rey/material/widget/TimePicker;->mTypeface:Landroid/graphics/Typeface;

    .line 44
    iput v2, p0, Lcom/rey/material/widget/TimePicker;->mTextSize:I

    .line 45
    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/rey/material/widget/TimePicker;->mTextColor:I

    .line 46
    iput v2, p0, Lcom/rey/material/widget/TimePicker;->mTextHighlightColor:I

    .line 47
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/widget/TimePicker;->m24Hour:Z

    .line 49
    iput v2, p0, Lcom/rey/material/widget/TimePicker;->mAnimDuration:I

    .line 63
    const/16 v0, 0x48

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/rey/material/widget/TimePicker;->mLocations:[F

    .line 67
    iput v1, p0, Lcom/rey/material/widget/TimePicker;->mMode:I

    .line 72
    iput v1, p0, Lcom/rey/material/widget/TimePicker;->mHour:I

    .line 73
    iput v1, p0, Lcom/rey/material/widget/TimePicker;->mMinute:I

    .line 75
    iput-boolean v1, p0, Lcom/rey/material/widget/TimePicker;->mEdited:Z

    .line 793
    new-instance v0, Lcom/rey/material/widget/TimePicker$1;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/TimePicker$1;-><init>(Lcom/rey/material/widget/TimePicker;)V

    iput-object v0, p0, Lcom/rey/material/widget/TimePicker;->mUpdater:Ljava/lang/Runnable;

    .line 114
    invoke-virtual {p0, p1, p2, v1, v1}, Lcom/rey/material/widget/TimePicker;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 115
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

    .line 118
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 37
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/TimePicker;->mCurrentStyle:I

    .line 41
    iput v1, p0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    .line 42
    iput v1, p0, Lcom/rey/material/widget/TimePicker;->mTickSize:I

    .line 43
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iput-object v0, p0, Lcom/rey/material/widget/TimePicker;->mTypeface:Landroid/graphics/Typeface;

    .line 44
    iput v1, p0, Lcom/rey/material/widget/TimePicker;->mTextSize:I

    .line 45
    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/rey/material/widget/TimePicker;->mTextColor:I

    .line 46
    iput v1, p0, Lcom/rey/material/widget/TimePicker;->mTextHighlightColor:I

    .line 47
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/widget/TimePicker;->m24Hour:Z

    .line 49
    iput v1, p0, Lcom/rey/material/widget/TimePicker;->mAnimDuration:I

    .line 63
    const/16 v0, 0x48

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/rey/material/widget/TimePicker;->mLocations:[F

    .line 67
    iput v2, p0, Lcom/rey/material/widget/TimePicker;->mMode:I

    .line 72
    iput v2, p0, Lcom/rey/material/widget/TimePicker;->mHour:I

    .line 73
    iput v2, p0, Lcom/rey/material/widget/TimePicker;->mMinute:I

    .line 75
    iput-boolean v2, p0, Lcom/rey/material/widget/TimePicker;->mEdited:Z

    .line 793
    new-instance v0, Lcom/rey/material/widget/TimePicker$1;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/TimePicker$1;-><init>(Lcom/rey/material/widget/TimePicker;)V

    iput-object v0, p0, Lcom/rey/material/widget/TimePicker;->mUpdater:Ljava/lang/Runnable;

    .line 120
    invoke-virtual {p0, p1, p2, p3, v2}, Lcom/rey/material/widget/TimePicker;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 121
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

    .line 125
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 37
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/TimePicker;->mCurrentStyle:I

    .line 41
    iput v1, p0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    .line 42
    iput v1, p0, Lcom/rey/material/widget/TimePicker;->mTickSize:I

    .line 43
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iput-object v0, p0, Lcom/rey/material/widget/TimePicker;->mTypeface:Landroid/graphics/Typeface;

    .line 44
    iput v1, p0, Lcom/rey/material/widget/TimePicker;->mTextSize:I

    .line 45
    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/rey/material/widget/TimePicker;->mTextColor:I

    .line 46
    iput v1, p0, Lcom/rey/material/widget/TimePicker;->mTextHighlightColor:I

    .line 47
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/widget/TimePicker;->m24Hour:Z

    .line 49
    iput v1, p0, Lcom/rey/material/widget/TimePicker;->mAnimDuration:I

    .line 63
    const/16 v0, 0x48

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/rey/material/widget/TimePicker;->mLocations:[F

    .line 67
    iput v2, p0, Lcom/rey/material/widget/TimePicker;->mMode:I

    .line 72
    iput v2, p0, Lcom/rey/material/widget/TimePicker;->mHour:I

    .line 73
    iput v2, p0, Lcom/rey/material/widget/TimePicker;->mMinute:I

    .line 75
    iput-boolean v2, p0, Lcom/rey/material/widget/TimePicker;->mEdited:Z

    .line 793
    new-instance v0, Lcom/rey/material/widget/TimePicker$1;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/TimePicker$1;-><init>(Lcom/rey/material/widget/TimePicker;)V

    iput-object v0, p0, Lcom/rey/material/widget/TimePicker;->mUpdater:Ljava/lang/Runnable;

    .line 127
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/TimePicker;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 128
    return-void
.end method

.method static synthetic access$000(Lcom/rey/material/widget/TimePicker;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/widget/TimePicker;

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/rey/material/widget/TimePicker;->update()V

    return-void
.end method

.method private calculateTextLocation()V
    .registers 15

    .prologue
    const/16 v13, 0xc

    const/4 v12, 0x0

    const/high16 v11, 0x40000000    # 2.0f

    .line 450
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    if-nez v7, :cond_a

    .line 511
    :cond_9
    return-void

    .line 453
    :cond_a
    const-wide v3, 0x3fe0c152382d7365L    # 0.5235987755982988

    .line 454
    .local v3, "step":D
    const-wide v0, -0x400f3eadc7d28c9bL    # -1.0471975511965976

    .line 457
    .local v0, "angle":D
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    iget v8, p0, Lcom/rey/material/widget/TimePicker;->mTextSize:I

    int-to-float v8, v8

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 458
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    iget-object v8, p0, Lcom/rey/material/widget/TimePicker;->mTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 459
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    sget-object v8, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 461
    iget-boolean v7, p0, Lcom/rey/material/widget/TimePicker;->m24Hour:Z

    if-eqz v7, :cond_de

    .line 462
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2f
    if-ge v2, v13, :cond_8d

    .line 463
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    iget-object v8, p0, Lcom/rey/material/widget/TimePicker;->mTicks:[Ljava/lang/String;

    aget-object v8, v8, v2

    iget-object v9, p0, Lcom/rey/material/widget/TimePicker;->mTicks:[Ljava/lang/String;

    aget-object v9, v9, v2

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    iget-object v10, p0, Lcom/rey/material/widget/TimePicker;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v7, v8, v12, v9, v10}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 464
    if-nez v2, :cond_56

    .line 465
    iget v7, p0, Lcom/rey/material/widget/TimePicker;->mInnerRadius:F

    iget v8, p0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    int-to-float v8, v8

    sub-float/2addr v7, v8

    iget-object v8, p0, Lcom/rey/material/widget/TimePicker;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v8

    int-to-float v8, v8

    sub-float/2addr v7, v8

    iput v7, p0, Lcom/rey/material/widget/TimePicker;->mSecondInnerRadius:F

    .line 467
    :cond_56
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v7, v7, Landroid/graphics/PointF;->x:F

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v8

    double-to-float v8, v8

    iget v9, p0, Lcom/rey/material/widget/TimePicker;->mSecondInnerRadius:F

    mul-float/2addr v8, v9

    add-float v5, v7, v8

    .line 468
    .local v5, "x":F
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v7, v7, Landroid/graphics/PointF;->y:F

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v8

    double-to-float v8, v8

    iget v9, p0, Lcom/rey/material/widget/TimePicker;->mSecondInnerRadius:F

    mul-float/2addr v8, v9

    add-float v6, v7, v8

    .line 470
    .local v6, "y":F
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mLocations:[F

    mul-int/lit8 v8, v2, 0x2

    aput v5, v7, v8

    .line 471
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mLocations:[F

    mul-int/lit8 v8, v2, 0x2

    add-int/lit8 v8, v8, 0x1

    iget-object v9, p0, Lcom/rey/material/widget/TimePicker;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    move-result v9

    int-to-float v9, v9

    div-float/2addr v9, v11

    add-float/2addr v9, v6

    aput v9, v7, v8

    .line 473
    add-double/2addr v0, v3

    .line 462
    add-int/lit8 v2, v2, 0x1

    goto :goto_2f

    .line 476
    .end local v5    # "x":F
    .end local v6    # "y":F
    :cond_8d
    const/16 v2, 0xc

    :goto_8f
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mTicks:[Ljava/lang/String;

    array-length v7, v7

    if-ge v2, v7, :cond_9

    .line 477
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v7, v7, Landroid/graphics/PointF;->x:F

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v8

    double-to-float v8, v8

    iget v9, p0, Lcom/rey/material/widget/TimePicker;->mInnerRadius:F

    mul-float/2addr v8, v9

    add-float v5, v7, v8

    .line 478
    .restart local v5    # "x":F
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v7, v7, Landroid/graphics/PointF;->y:F

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v8

    double-to-float v8, v8

    iget v9, p0, Lcom/rey/material/widget/TimePicker;->mInnerRadius:F

    mul-float/2addr v8, v9

    add-float v6, v7, v8

    .line 480
    .restart local v6    # "y":F
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    iget-object v8, p0, Lcom/rey/material/widget/TimePicker;->mTicks:[Ljava/lang/String;

    aget-object v8, v8, v2

    iget-object v9, p0, Lcom/rey/material/widget/TimePicker;->mTicks:[Ljava/lang/String;

    aget-object v9, v9, v2

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    iget-object v10, p0, Lcom/rey/material/widget/TimePicker;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v7, v8, v12, v9, v10}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 481
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mLocations:[F

    mul-int/lit8 v8, v2, 0x2

    aput v5, v7, v8

    .line 482
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mLocations:[F

    mul-int/lit8 v8, v2, 0x2

    add-int/lit8 v8, v8, 0x1

    iget-object v9, p0, Lcom/rey/material/widget/TimePicker;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    move-result v9

    int-to-float v9, v9

    div-float/2addr v9, v11

    add-float/2addr v9, v6

    aput v9, v7, v8

    .line 484
    add-double/2addr v0, v3

    .line 476
    add-int/lit8 v2, v2, 0x1

    goto :goto_8f

    .line 488
    .end local v2    # "i":I
    .end local v5    # "x":F
    .end local v6    # "y":F
    :cond_de
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_df
    if-ge v2, v13, :cond_12b

    .line 489
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v7, v7, Landroid/graphics/PointF;->x:F

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v8

    double-to-float v8, v8

    iget v9, p0, Lcom/rey/material/widget/TimePicker;->mInnerRadius:F

    mul-float/2addr v8, v9

    add-float v5, v7, v8

    .line 490
    .restart local v5    # "x":F
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v7, v7, Landroid/graphics/PointF;->y:F

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v8

    double-to-float v8, v8

    iget v9, p0, Lcom/rey/material/widget/TimePicker;->mInnerRadius:F

    mul-float/2addr v8, v9

    add-float v6, v7, v8

    .line 492
    .restart local v6    # "y":F
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    iget-object v8, p0, Lcom/rey/material/widget/TimePicker;->mTicks:[Ljava/lang/String;

    aget-object v8, v8, v2

    iget-object v9, p0, Lcom/rey/material/widget/TimePicker;->mTicks:[Ljava/lang/String;

    aget-object v9, v9, v2

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    iget-object v10, p0, Lcom/rey/material/widget/TimePicker;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v7, v8, v12, v9, v10}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 493
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mLocations:[F

    mul-int/lit8 v8, v2, 0x2

    aput v5, v7, v8

    .line 494
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mLocations:[F

    mul-int/lit8 v8, v2, 0x2

    add-int/lit8 v8, v8, 0x1

    iget-object v9, p0, Lcom/rey/material/widget/TimePicker;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    move-result v9

    int-to-float v9, v9

    div-float/2addr v9, v11

    add-float/2addr v9, v6

    aput v9, v7, v8

    .line 496
    add-double/2addr v0, v3

    .line 488
    add-int/lit8 v2, v2, 0x1

    goto :goto_df

    .line 499
    .end local v5    # "x":F
    .end local v6    # "y":F
    :cond_12b
    const/16 v2, 0x18

    :goto_12d
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mTicks:[Ljava/lang/String;

    array-length v7, v7

    if-ge v2, v7, :cond_9

    .line 500
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v7, v7, Landroid/graphics/PointF;->x:F

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v8

    double-to-float v8, v8

    iget v9, p0, Lcom/rey/material/widget/TimePicker;->mInnerRadius:F

    mul-float/2addr v8, v9

    add-float v5, v7, v8

    .line 501
    .restart local v5    # "x":F
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v7, v7, Landroid/graphics/PointF;->y:F

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v8

    double-to-float v8, v8

    iget v9, p0, Lcom/rey/material/widget/TimePicker;->mInnerRadius:F

    mul-float/2addr v8, v9

    add-float v6, v7, v8

    .line 503
    .restart local v6    # "y":F
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    iget-object v8, p0, Lcom/rey/material/widget/TimePicker;->mTicks:[Ljava/lang/String;

    aget-object v8, v8, v2

    iget-object v9, p0, Lcom/rey/material/widget/TimePicker;->mTicks:[Ljava/lang/String;

    aget-object v9, v9, v2

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    iget-object v10, p0, Lcom/rey/material/widget/TimePicker;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v7, v8, v12, v9, v10}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 504
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mLocations:[F

    mul-int/lit8 v8, v2, 0x2

    aput v5, v7, v8

    .line 505
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mLocations:[F

    mul-int/lit8 v8, v2, 0x2

    add-int/lit8 v8, v8, 0x1

    iget-object v9, p0, Lcom/rey/material/widget/TimePicker;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    move-result v9

    int-to-float v9, v9

    div-float/2addr v9, v11

    add-float/2addr v9, v6

    aput v9, v7, v8

    .line 507
    add-double/2addr v0, v3

    .line 499
    add-int/lit8 v2, v2, 0x1

    goto :goto_12d
.end method

.method private getAngle(II)F
    .registers 9
    .param p1, "value"    # I
    .param p2, "mode"    # I

    .prologue
    const-wide v4, -0x4006de04abbbd2e8L    # -1.5707963267948966

    .line 412
    packed-switch p2, :pswitch_data_1e

    .line 418
    const/4 v0, 0x0

    :goto_9
    return v0

    .line 414
    :pswitch_a
    const-wide v0, 0x3fe0c152382d7365L    # 0.5235987755982988

    int-to-double v2, p1

    mul-double/2addr v0, v2

    add-double/2addr v0, v4

    double-to-float v0, v0

    goto :goto_9

    .line 416
    :pswitch_14
    const-wide v0, 0x3fbacee9f37bebd5L    # 0.10471975511965977

    int-to-double v2, p1

    mul-double/2addr v0, v2

    add-double/2addr v0, v4

    double-to-float v0, v0

    goto :goto_9

    .line 412
    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_a
        :pswitch_14
    .end packed-switch
.end method

.method private getPointedValue(FFZ)I
    .registers 13
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "isDown"    # Z

    .prologue
    .line 530
    iget-object v3, p0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->x:F

    sub-float v3, p1, v3

    float-to-double v3, v3

    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    iget-object v5, p0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v5, v5, Landroid/graphics/PointF;->y:F

    sub-float v5, p2, v5

    float-to-double v5, v5

    const-wide/high16 v7, 0x4000000000000000L    # 2.0

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v5

    add-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    double-to-float v1, v3

    .line 531
    .local v1, "radius":F
    if-eqz p3, :cond_56

    .line 532
    iget v3, p0, Lcom/rey/material/widget/TimePicker;->mMode:I

    if-nez v3, :cond_40

    iget-boolean v3, p0, Lcom/rey/material/widget/TimePicker;->m24Hour:Z

    if-eqz v3, :cond_40

    .line 533
    iget v3, p0, Lcom/rey/material/widget/TimePicker;->mInnerRadius:F

    iget v4, p0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    int-to-float v4, v4

    add-float/2addr v3, v4

    cmpl-float v3, v1, v3

    if-gtz v3, :cond_3e

    iget v3, p0, Lcom/rey/material/widget/TimePicker;->mSecondInnerRadius:F

    iget v4, p0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    int-to-float v4, v4

    sub-float/2addr v3, v4

    cmpg-float v3, v1, v3

    if-gez v3, :cond_56

    .line 534
    :cond_3e
    const/4 v2, -0x1

    .line 570
    :cond_3f
    :goto_3f
    return v2

    .line 536
    :cond_40
    iget v3, p0, Lcom/rey/material/widget/TimePicker;->mInnerRadius:F

    iget v4, p0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    int-to-float v4, v4

    add-float/2addr v3, v4

    cmpl-float v3, v1, v3

    if-gtz v3, :cond_54

    iget v3, p0, Lcom/rey/material/widget/TimePicker;->mInnerRadius:F

    iget v4, p0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    int-to-float v4, v4

    sub-float/2addr v3, v4

    cmpg-float v3, v1, v3

    if-gez v3, :cond_56

    .line 537
    :cond_54
    const/4 v2, -0x1

    goto :goto_3f

    .line 540
    :cond_56
    iget-object v3, p0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    sub-float v3, p2, v3

    float-to-double v3, v3

    iget-object v5, p0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v5, v5, Landroid/graphics/PointF;->x:F

    sub-float v5, p1, v5

    float-to-double v5, v5

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v3

    double-to-float v0, v3

    .line 541
    .local v0, "angle":F
    const/4 v3, 0x0

    cmpg-float v3, v0, v3

    if-gez v3, :cond_76

    .line 542
    float-to-double v3, v0

    const-wide v5, 0x401921fb54442d18L    # 6.283185307179586

    add-double/2addr v3, v5

    double-to-float v0, v3

    .line 544
    :cond_76
    iget v3, p0, Lcom/rey/material/widget/TimePicker;->mMode:I

    if-nez v3, :cond_d9

    .line 545
    iget-boolean v3, p0, Lcom/rey/material/widget/TimePicker;->m24Hour:Z

    if-eqz v3, :cond_c0

    .line 546
    iget v3, p0, Lcom/rey/material/widget/TimePicker;->mSecondInnerRadius:F

    iget v4, p0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    add-float/2addr v3, v4

    cmpl-float v3, v1, v3

    if-lez v3, :cond_a8

    .line 547
    const/high16 v3, 0x40c00000    # 6.0f

    mul-float/2addr v3, v0

    float-to-double v3, v3

    const-wide v5, 0x400921fb54442d18L    # Math.PI

    div-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->round(D)J

    move-result-wide v3

    long-to-int v3, v3

    add-int/lit8 v2, v3, 0xf

    .line 548
    .local v2, "value":I
    const/16 v3, 0x18

    if-ne v2, v3, :cond_a1

    .line 549
    const/4 v2, 0x0

    goto :goto_3f

    .line 550
    :cond_a1
    const/16 v3, 0x18

    if-le v2, v3, :cond_3f

    .line 551
    add-int/lit8 v2, v2, -0xc

    goto :goto_3f

    .line 556
    .end local v2    # "value":I
    :cond_a8
    const/high16 v3, 0x40c00000    # 6.0f

    mul-float/2addr v3, v0

    float-to-double v3, v3

    const-wide v5, 0x400921fb54442d18L    # Math.PI

    div-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->round(D)J

    move-result-wide v3

    long-to-int v3, v3

    add-int/lit8 v2, v3, 0x3

    .line 557
    .restart local v2    # "value":I
    const/16 v3, 0xc

    if-le v2, v3, :cond_3f

    add-int/lit8 v2, v2, -0xc

    goto :goto_3f

    .line 561
    .end local v2    # "value":I
    :cond_c0
    const/high16 v3, 0x40c00000    # 6.0f

    mul-float/2addr v3, v0

    float-to-double v3, v3

    const-wide v5, 0x400921fb54442d18L    # Math.PI

    div-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->round(D)J

    move-result-wide v3

    long-to-int v3, v3

    add-int/lit8 v2, v3, 0x3

    .line 562
    .restart local v2    # "value":I
    const/16 v3, 0xb

    if-le v2, v3, :cond_3f

    add-int/lit8 v2, v2, -0xc

    goto/16 :goto_3f

    .line 565
    .end local v2    # "value":I
    :cond_d9
    iget v3, p0, Lcom/rey/material/widget/TimePicker;->mMode:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_f7

    .line 566
    const/high16 v3, 0x41f00000    # 30.0f

    mul-float/2addr v3, v0

    float-to-double v3, v3

    const-wide v5, 0x400921fb54442d18L    # Math.PI

    div-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->round(D)J

    move-result-wide v3

    long-to-int v3, v3

    add-int/lit8 v2, v3, 0xf

    .line 567
    .restart local v2    # "value":I
    const/16 v3, 0x3b

    if-le v2, v3, :cond_3f

    add-int/lit8 v2, v2, -0x3c

    goto/16 :goto_3f

    .line 570
    .end local v2    # "value":I
    :cond_f7
    const/4 v2, -0x1

    goto/16 :goto_3f
.end method

.method private getSelectedTick(II)I
    .registers 4
    .param p1, "value"    # I
    .param p2, "mode"    # I

    .prologue
    .line 423
    packed-switch p2, :pswitch_data_22

    .line 430
    :cond_3
    const/4 v0, -0x1

    :goto_4
    return v0

    .line 425
    :pswitch_5
    if-nez p1, :cond_11

    iget-boolean v0, p0, Lcom/rey/material/widget/TimePicker;->m24Hour:Z

    if-eqz v0, :cond_e

    const/16 v0, 0x17

    goto :goto_4

    :cond_e
    const/16 v0, 0xb

    goto :goto_4

    :cond_11
    add-int/lit8 v0, p1, -0x1

    goto :goto_4

    .line 427
    :pswitch_14
    rem-int/lit8 v0, p1, 0x5

    if-nez v0, :cond_3

    .line 428
    if-nez p1, :cond_1d

    const/16 v0, 0x23

    goto :goto_4

    :cond_1d
    div-int/lit8 v0, p1, 0x5

    add-int/lit8 v0, v0, 0x17

    goto :goto_4

    .line 423
    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_5
        :pswitch_14
    .end packed-switch
.end method

.method private initTickLabels()V
    .registers 10

    .prologue
    const/16 v8, 0x23

    const/16 v7, 0x17

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 153
    const-string v0, "%2d"

    .line 154
    .local v0, "format":Ljava/lang/String;
    const/16 v2, 0x24

    new-array v2, v2, [Ljava/lang/String;

    iput-object v2, p0, Lcom/rey/material/widget/TimePicker;->mTicks:[Ljava/lang/String;

    .line 155
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    if-ge v1, v7, :cond_26

    .line 156
    iget-object v2, p0, Lcom/rey/material/widget/TimePicker;->mTicks:[Ljava/lang/String;

    new-array v3, v6, [Ljava/lang/Object;

    add-int/lit8 v4, v1, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    .line 155
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 157
    :cond_26
    iget-object v2, p0, Lcom/rey/material/widget/TimePicker;->mTicks:[Ljava/lang/String;

    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v7

    .line 158
    iget-object v2, p0, Lcom/rey/material/widget/TimePicker;->mTicks:[Ljava/lang/String;

    iget-object v3, p0, Lcom/rey/material/widget/TimePicker;->mTicks:[Ljava/lang/String;

    aget-object v3, v3, v7

    aput-object v3, v2, v8

    .line 159
    const/16 v1, 0x18

    :goto_40
    if-ge v1, v8, :cond_59

    .line 160
    iget-object v2, p0, Lcom/rey/material/widget/TimePicker;->mTicks:[Ljava/lang/String;

    new-array v3, v6, [Ljava/lang/Object;

    add-int/lit8 v4, v1, -0x17

    mul-int/lit8 v4, v4, 0x5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    .line 159
    add-int/lit8 v1, v1, 0x1

    goto :goto_40

    .line 161
    :cond_59
    return-void
.end method

.method private resetAnimation()V
    .registers 3

    .prologue
    .line 771
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/rey/material/widget/TimePicker;->mStartTime:J

    .line 772
    const/4 v0, 0x0

    iput v0, p0, Lcom/rey/material/widget/TimePicker;->mAnimProgress:F

    .line 773
    return-void
.end method

.method private startAnimation()V
    .registers 7

    .prologue
    .line 776
    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getHandler()Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_1c

    .line 777
    invoke-direct {p0}, Lcom/rey/material/widget/TimePicker;->resetAnimation()V

    .line 778
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/widget/TimePicker;->mRunning:Z

    .line 779
    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getHandler()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/rey/material/widget/TimePicker;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x10

    add-long/2addr v2, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    .line 782
    :cond_1c
    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->invalidate()V

    .line 783
    return-void
.end method

.method private stopAnimation()V
    .registers 3

    .prologue
    .line 786
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/widget/TimePicker;->mRunning:Z

    .line 787
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/rey/material/widget/TimePicker;->mAnimProgress:F

    .line 788
    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getHandler()Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_16

    .line 789
    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getHandler()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/rey/material/widget/TimePicker;->mUpdater:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 790
    :cond_16
    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->invalidate()V

    .line 791
    return-void
.end method

.method private update()V
    .registers 9

    .prologue
    const/high16 v4, 0x3f800000    # 1.0f

    .line 803
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 804
    .local v0, "curTime":J
    iget-wide v2, p0, Lcom/rey/material/widget/TimePicker;->mStartTime:J

    sub-long v2, v0, v2

    long-to-float v2, v2

    iget v3, p0, Lcom/rey/material/widget/TimePicker;->mAnimDuration:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-static {v4, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, p0, Lcom/rey/material/widget/TimePicker;->mAnimProgress:F

    .line 806
    iget v2, p0, Lcom/rey/material/widget/TimePicker;->mAnimProgress:F

    cmpl-float v2, v2, v4

    if-nez v2, :cond_1e

    .line 807
    invoke-direct {p0}, Lcom/rey/material/widget/TimePicker;->stopAnimation()V

    .line 809
    :cond_1e
    iget-boolean v2, p0, Lcom/rey/material/widget/TimePicker;->mRunning:Z

    if-eqz v2, :cond_38

    .line 810
    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getHandler()Landroid/os/Handler;

    move-result-object v2

    if-eqz v2, :cond_3c

    .line 811
    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getHandler()Landroid/os/Handler;

    move-result-object v2

    iget-object v3, p0, Lcom/rey/material/widget/TimePicker;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    const-wide/16 v6, 0x10

    add-long/2addr v4, v6

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    .line 816
    :cond_38
    :goto_38
    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->invalidate()V

    .line 817
    return-void

    .line 813
    :cond_3c
    invoke-direct {p0}, Lcom/rey/material/widget/TimePicker;->stopAnimation()V

    goto :goto_38
.end method


# virtual methods
.method public applyStyle(I)V
    .registers 5
    .param p1, "styleId"    # I

    .prologue
    .line 164
    invoke-static {p0, p1}, Lcom/rey/material/util/ViewUtil;->applyStyle(Landroid/view/View;I)V

    .line 165
    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/rey/material/widget/TimePicker;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 166
    return-void
.end method

.method protected applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 14
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/4 v8, 0x0

    .line 169
    sget-object v7, Lcom/rey/material/R$styleable;->TimePicker:[I

    invoke-virtual {p1, p2, v7, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 171
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v4, 0x0

    .line 172
    .local v4, "hourDefined":Z
    const/4 v3, 0x0

    .line 173
    .local v3, "familyName":Ljava/lang/String;
    const/4 v6, -0x1

    .line 175
    .local v6, "style":I
    const/4 v5, 0x0

    .local v5, "i":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v2

    .local v2, "count":I
    :goto_f
    if-ge v5, v2, :cond_d5

    .line 176
    invoke-virtual {v0, v5}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v1

    .line 178
    .local v1, "attr":I
    sget v7, Lcom/rey/material/R$styleable;->TimePicker_tp_backgroundColor:I

    if-ne v1, v7, :cond_22

    .line 179
    invoke-virtual {v0, v1, v8}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v7

    iput v7, p0, Lcom/rey/material/widget/TimePicker;->mBackgroundColor:I

    .line 175
    :cond_1f
    :goto_1f
    add-int/lit8 v5, v5, 0x1

    goto :goto_f

    .line 180
    :cond_22
    sget v7, Lcom/rey/material/R$styleable;->TimePicker_tp_selectionColor:I

    if-ne v1, v7, :cond_2d

    .line 181
    invoke-virtual {v0, v1, v8}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v7

    iput v7, p0, Lcom/rey/material/widget/TimePicker;->mSelectionColor:I

    goto :goto_1f

    .line 182
    :cond_2d
    sget v7, Lcom/rey/material/R$styleable;->TimePicker_tp_selectionRadius:I

    if-ne v1, v7, :cond_38

    .line 183
    invoke-virtual {v0, v1, v8}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v7

    iput v7, p0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    goto :goto_1f

    .line 184
    :cond_38
    sget v7, Lcom/rey/material/R$styleable;->TimePicker_tp_tickSize:I

    if-ne v1, v7, :cond_43

    .line 185
    invoke-virtual {v0, v1, v8}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v7

    iput v7, p0, Lcom/rey/material/widget/TimePicker;->mTickSize:I

    goto :goto_1f

    .line 186
    :cond_43
    sget v7, Lcom/rey/material/R$styleable;->TimePicker_tp_textSize:I

    if-ne v1, v7, :cond_4e

    .line 187
    invoke-virtual {v0, v1, v8}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v7

    iput v7, p0, Lcom/rey/material/widget/TimePicker;->mTextSize:I

    goto :goto_1f

    .line 188
    :cond_4e
    sget v7, Lcom/rey/material/R$styleable;->TimePicker_tp_textColor:I

    if-ne v1, v7, :cond_59

    .line 189
    invoke-virtual {v0, v1, v8}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v7

    iput v7, p0, Lcom/rey/material/widget/TimePicker;->mTextColor:I

    goto :goto_1f

    .line 190
    :cond_59
    sget v7, Lcom/rey/material/R$styleable;->TimePicker_tp_textHighlightColor:I

    if-ne v1, v7, :cond_64

    .line 191
    invoke-virtual {v0, v1, v8}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v7

    iput v7, p0, Lcom/rey/material/widget/TimePicker;->mTextHighlightColor:I

    goto :goto_1f

    .line 192
    :cond_64
    sget v7, Lcom/rey/material/R$styleable;->TimePicker_tp_animDuration:I

    if-ne v1, v7, :cond_6f

    .line 193
    invoke-virtual {v0, v1, v8}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v7

    iput v7, p0, Lcom/rey/material/widget/TimePicker;->mAnimDuration:I

    goto :goto_1f

    .line 194
    :cond_6f
    sget v7, Lcom/rey/material/R$styleable;->TimePicker_tp_inInterpolator:I

    if-ne v1, v7, :cond_7e

    .line 195
    invoke-virtual {v0, v1, v8}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v7

    invoke-static {p1, v7}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v7

    iput-object v7, p0, Lcom/rey/material/widget/TimePicker;->mInInterpolator:Landroid/view/animation/Interpolator;

    goto :goto_1f

    .line 196
    :cond_7e
    sget v7, Lcom/rey/material/R$styleable;->TimePicker_tp_outInterpolator:I

    if-ne v1, v7, :cond_8d

    .line 197
    invoke-virtual {v0, v1, v8}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v7

    invoke-static {p1, v7}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v7

    iput-object v7, p0, Lcom/rey/material/widget/TimePicker;->mOutInterpolator:Landroid/view/animation/Interpolator;

    goto :goto_1f

    .line 198
    :cond_8d
    sget v7, Lcom/rey/material/R$styleable;->TimePicker_tp_mode:I

    if-ne v1, v7, :cond_99

    .line 199
    invoke-virtual {v0, v1, v8}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v7

    invoke-virtual {p0, v7, v8}, Lcom/rey/material/widget/TimePicker;->setMode(IZ)V

    goto :goto_1f

    .line 200
    :cond_99
    sget v7, Lcom/rey/material/R$styleable;->TimePicker_tp_24Hour:I

    if-ne v1, v7, :cond_a7

    .line 201
    invoke-virtual {v0, v1, v8}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    invoke-virtual {p0, v7}, Lcom/rey/material/widget/TimePicker;->set24Hour(Z)V

    .line 202
    const/4 v4, 0x1

    goto/16 :goto_1f

    .line 204
    :cond_a7
    sget v7, Lcom/rey/material/R$styleable;->TimePicker_tp_hour:I

    if-ne v1, v7, :cond_b4

    .line 205
    invoke-virtual {v0, v1, v8}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/rey/material/widget/TimePicker;->setHour(I)V

    goto/16 :goto_1f

    .line 206
    :cond_b4
    sget v7, Lcom/rey/material/R$styleable;->TimePicker_tp_minute:I

    if-ne v1, v7, :cond_c1

    .line 207
    invoke-virtual {v0, v1, v8}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/rey/material/widget/TimePicker;->setMinute(I)V

    goto/16 :goto_1f

    .line 208
    :cond_c1
    sget v7, Lcom/rey/material/R$styleable;->TimePicker_tp_fontFamily:I

    if-ne v1, v7, :cond_cb

    .line 209
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_1f

    .line 210
    :cond_cb
    sget v7, Lcom/rey/material/R$styleable;->TimePicker_tp_textStyle:I

    if-ne v1, v7, :cond_1f

    .line 211
    invoke-virtual {v0, v1, v8}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v6

    goto/16 :goto_1f

    .line 214
    .end local v1    # "attr":I
    :cond_d5
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 216
    iget v7, p0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    if-gez v7, :cond_e5

    .line 217
    const/16 v7, 0x8

    invoke-static {p1, v7}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v7

    int-to-float v7, v7

    iput v7, p0, Lcom/rey/material/widget/TimePicker;->mSecondInnerRadius:F

    .line 219
    :cond_e5
    iget v7, p0, Lcom/rey/material/widget/TimePicker;->mTickSize:I

    if-gez v7, :cond_f0

    .line 220
    const/4 v7, 0x1

    invoke-static {p1, v7}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v7

    iput v7, p0, Lcom/rey/material/widget/TimePicker;->mTickSize:I

    .line 222
    :cond_f0
    iget v7, p0, Lcom/rey/material/widget/TimePicker;->mTextSize:I

    if-gez v7, :cond_100

    .line 223
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    sget v8, Lcom/rey/material/R$dimen;->abc_text_size_caption_material:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v7

    iput v7, p0, Lcom/rey/material/widget/TimePicker;->mTextSize:I

    .line 225
    :cond_100
    iget v7, p0, Lcom/rey/material/widget/TimePicker;->mAnimDuration:I

    if-gez v7, :cond_111

    .line 226
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x10e0001

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v7

    iput v7, p0, Lcom/rey/material/widget/TimePicker;->mAnimDuration:I

    .line 228
    :cond_111
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mInInterpolator:Landroid/view/animation/Interpolator;

    if-nez v7, :cond_11c

    .line 229
    new-instance v7, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v7}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object v7, p0, Lcom/rey/material/widget/TimePicker;->mInInterpolator:Landroid/view/animation/Interpolator;

    .line 231
    :cond_11c
    iget-object v7, p0, Lcom/rey/material/widget/TimePicker;->mOutInterpolator:Landroid/view/animation/Interpolator;

    if-nez v7, :cond_127

    .line 232
    new-instance v7, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v7}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object v7, p0, Lcom/rey/material/widget/TimePicker;->mOutInterpolator:Landroid/view/animation/Interpolator;

    .line 234
    :cond_127
    if-nez v4, :cond_130

    .line 235
    invoke-static {p1}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v7

    invoke-virtual {p0, v7}, Lcom/rey/material/widget/TimePicker;->set24Hour(Z)V

    .line 237
    :cond_130
    if-nez v3, :cond_134

    if-ltz v6, :cond_13a

    .line 238
    :cond_134
    invoke-static {p1, v3, v6}, Lcom/rey/material/util/TypefaceUtil;->load(Landroid/content/Context;Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v7

    iput-object v7, p0, Lcom/rey/material/widget/TimePicker;->mTypeface:Landroid/graphics/Typeface;

    .line 239
    :cond_13a
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 37
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 613
    invoke-super/range {p0 .. p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 615
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mBackgroundColor:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 616
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 617
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/TimePicker;->mOuterRadius:F

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 619
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/rey/material/widget/TimePicker;->mRunning:Z

    if-nez v2, :cond_1aa

    .line 626
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mMode:I

    if-nez v2, :cond_183

    .line 627
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mHour:I

    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/rey/material/widget/TimePicker;->getAngle(II)F

    move-result v8

    .line 628
    .local v8, "angle":F
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mHour:I

    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/rey/material/widget/TimePicker;->getSelectedTick(II)I

    move-result v27

    .line 629
    .local v27, "selectedTick":I
    const/16 v28, 0x0

    .line 630
    .local v28, "start":I
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/rey/material/widget/TimePicker;->m24Hour:Z

    if-eqz v2, :cond_177

    const/16 v18, 0x18

    .line 631
    .local v18, "length":I
    :goto_5c
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/rey/material/widget/TimePicker;->m24Hour:Z

    if-eqz v2, :cond_17b

    const/16 v2, 0xc

    move/from16 v0, v27

    if-ge v0, v2, :cond_17b

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/widget/TimePicker;->mSecondInnerRadius:F

    move/from16 v26, v0

    .line 641
    .local v26, "radius":F
    :goto_6e
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mSelectionColor:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 642
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    float-to-double v3, v8

    invoke-static {v3, v4}, Ljava/lang/Math;->cos(D)D

    move-result-wide v3

    double-to-float v3, v3

    mul-float v3, v3, v26

    add-float v5, v2, v3

    .line 643
    .local v5, "x":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    float-to-double v3, v8

    invoke-static {v3, v4}, Ljava/lang/Math;->sin(D)D

    move-result-wide v3

    double-to-float v3, v3

    mul-float v3, v3, v26

    add-float v6, v2, v3

    .line 644
    .local v6, "y":F
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v6, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 646
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 647
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mTickSize:I

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 648
    float-to-double v2, v8

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    double-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    int-to-float v3, v3

    mul-float/2addr v2, v3

    sub-float/2addr v5, v2

    .line 649
    float-to-double v2, v8

    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    double-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    int-to-float v3, v3

    mul-float/2addr v2, v3

    sub-float/2addr v6, v2

    .line 650
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v3, v2, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v4, v2, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 652
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 653
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mTextColor:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 654
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/TimePicker;->mTickSize:I

    mul-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 656
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mTextSize:I

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 657
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/TimePicker;->mTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 658
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 661
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_13c
    move/from16 v0, v18

    if-ge v10, v0, :cond_50a

    .line 662
    add-int v17, v28, v10

    .line 663
    .local v17, "index":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move/from16 v0, v17

    move/from16 v1, v27

    if-ne v0, v1, :cond_1a5

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mTextHighlightColor:I

    :goto_150
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 664
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mTicks:[Ljava/lang/String;

    aget-object v2, v2, v17

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/TimePicker;->mLocations:[F

    mul-int/lit8 v4, v17, 0x2

    aget v3, v3, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/TimePicker;->mLocations:[F

    mul-int/lit8 v7, v17, 0x2

    add-int/lit8 v7, v7, 0x1

    aget v4, v4, v7

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 661
    add-int/lit8 v10, v10, 0x1

    goto :goto_13c

    .line 630
    .end local v5    # "x":F
    .end local v6    # "y":F
    .end local v10    # "i":I
    .end local v17    # "index":I
    .end local v18    # "length":I
    .end local v26    # "radius":F
    :cond_177
    const/16 v18, 0xc

    goto/16 :goto_5c

    .line 631
    .restart local v18    # "length":I
    :cond_17b
    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/widget/TimePicker;->mInnerRadius:F

    move/from16 v26, v0

    goto/16 :goto_6e

    .line 634
    .end local v8    # "angle":F
    .end local v18    # "length":I
    .end local v27    # "selectedTick":I
    .end local v28    # "start":I
    :cond_183
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mMinute:I

    const/4 v3, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/rey/material/widget/TimePicker;->getAngle(II)F

    move-result v8

    .line 635
    .restart local v8    # "angle":F
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mMinute:I

    const/4 v3, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/rey/material/widget/TimePicker;->getSelectedTick(II)I

    move-result v27

    .line 636
    .restart local v27    # "selectedTick":I
    const/16 v28, 0x18

    .line 637
    .restart local v28    # "start":I
    const/16 v18, 0xc

    .line 638
    .restart local v18    # "length":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/widget/TimePicker;->mInnerRadius:F

    move/from16 v26, v0

    .restart local v26    # "radius":F
    goto/16 :goto_6e

    .line 663
    .restart local v5    # "x":F
    .restart local v6    # "y":F
    .restart local v10    # "i":I
    .restart local v17    # "index":I
    :cond_1a5
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mTextColor:I

    goto :goto_150

    .line 668
    .end local v5    # "x":F
    .end local v6    # "y":F
    .end local v8    # "angle":F
    .end local v10    # "i":I
    .end local v17    # "index":I
    .end local v18    # "length":I
    .end local v26    # "radius":F
    .end local v27    # "selectedTick":I
    .end local v28    # "start":I
    :cond_1aa
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mOuterRadius:F

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mInnerRadius:F

    sub-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mTextSize:I

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    add-float v19, v2, v3

    .line 669
    .local v19, "maxOffset":F
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mTextColor:I

    const/high16 v3, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/TimePicker;->mAnimProgress:F

    sub-float/2addr v3, v4

    invoke-static {v2, v3}, Lcom/rey/material/util/ColorUtil;->getColor(IF)I

    move-result v34

    .line 670
    .local v34, "textOutColor":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mTextHighlightColor:I

    const/high16 v3, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/TimePicker;->mAnimProgress:F

    sub-float/2addr v3, v4

    invoke-static {v2, v3}, Lcom/rey/material/util/ColorUtil;->getColor(IF)I

    move-result v32

    .line 671
    .local v32, "textHighlightOutColor":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mTextColor:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mAnimProgress:F

    invoke-static {v2, v3}, Lcom/rey/material/util/ColorUtil;->getColor(IF)I

    move-result v33

    .line 672
    .local v33, "textInColor":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mTextHighlightColor:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mAnimProgress:F

    invoke-static {v2, v3}, Lcom/rey/material/util/ColorUtil;->getColor(IF)I

    move-result v31

    .line 686
    .local v31, "textHighlightInColor":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mMode:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_441

    .line 687
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mHour:I

    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/rey/material/widget/TimePicker;->getAngle(II)F

    move-result v20

    .line 688
    .local v20, "outAngle":F
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mMinute:I

    const/4 v3, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/rey/material/widget/TimePicker;->getAngle(II)F

    move-result v11

    .line 689
    .local v11, "inAngle":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mOutInterpolator:Landroid/view/animation/Interpolator;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mAnimProgress:F

    invoke-interface {v2, v3}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v2

    mul-float v22, v2, v19

    .line 690
    .local v22, "outOffset":F
    const/high16 v2, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/TimePicker;->mInInterpolator:Landroid/view/animation/Interpolator;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/TimePicker;->mAnimProgress:F

    invoke-interface {v3, v4}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v3

    sub-float/2addr v2, v3

    move/from16 v0, v19

    neg-float v3, v0

    mul-float v13, v2, v3

    .line 691
    .local v13, "inOffset":F
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mHour:I

    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/rey/material/widget/TimePicker;->getSelectedTick(II)I

    move-result v24

    .line 692
    .local v24, "outSelectedTick":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mMinute:I

    const/4 v3, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/rey/material/widget/TimePicker;->getSelectedTick(II)I

    move-result v15

    .line 693
    .local v15, "inSelectedTick":I
    const/16 v25, 0x0

    .line 694
    .local v25, "outStart":I
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/rey/material/widget/TimePicker;->m24Hour:Z

    if-eqz v2, :cond_435

    const/16 v21, 0x18

    .line 695
    .local v21, "outLength":I
    :goto_251
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/rey/material/widget/TimePicker;->m24Hour:Z

    if-eqz v2, :cond_439

    const/16 v2, 0xc

    move/from16 v0, v24

    if-ge v0, v2, :cond_439

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/widget/TimePicker;->mSecondInnerRadius:F

    move/from16 v23, v0

    .line 696
    .local v23, "outRadius":F
    :goto_263
    const/16 v16, 0x18

    .line 697
    .local v16, "inStart":I
    const/16 v12, 0xc

    .line 698
    .local v12, "inLength":I
    move-object/from16 v0, p0

    iget v14, v0, Lcom/rey/material/widget/TimePicker;->mInnerRadius:F

    .line 715
    .local v14, "inRadius":F
    :goto_26b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mSelectionColor:I

    const/high16 v4, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v7, v0, Lcom/rey/material/widget/TimePicker;->mAnimProgress:F

    sub-float/2addr v4, v7

    invoke-static {v3, v4}, Lcom/rey/material/util/ColorUtil;->getColor(IF)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 716
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    move/from16 v0, v20

    float-to-double v3, v0

    invoke-static {v3, v4}, Ljava/lang/Math;->cos(D)D

    move-result-wide v3

    double-to-float v3, v3

    add-float v4, v23, v22

    mul-float/2addr v3, v4

    add-float v5, v2, v3

    .line 717
    .restart local v5    # "x":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    move/from16 v0, v20

    float-to-double v3, v0

    invoke-static {v3, v4}, Ljava/lang/Math;->sin(D)D

    move-result-wide v3

    double-to-float v3, v3

    add-float v4, v23, v22

    mul-float/2addr v3, v4

    add-float v6, v2, v3

    .line 718
    .restart local v6    # "y":F
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v6, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 720
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 721
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mTickSize:I

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 722
    move/from16 v0, v20

    float-to-double v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    double-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    int-to-float v3, v3

    mul-float/2addr v2, v3

    sub-float/2addr v5, v2

    .line 723
    move/from16 v0, v20

    float-to-double v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    double-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    int-to-float v3, v3

    mul-float/2addr v2, v3

    sub-float/2addr v6, v2

    .line 724
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v3, v2, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v4, v2, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 726
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 727
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mSelectionColor:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/TimePicker;->mAnimProgress:F

    invoke-static {v3, v4}, Lcom/rey/material/util/ColorUtil;->getColor(IF)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 728
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    float-to-double v3, v11

    invoke-static {v3, v4}, Ljava/lang/Math;->cos(D)D

    move-result-wide v3

    double-to-float v3, v3

    add-float v4, v14, v13

    mul-float/2addr v3, v4

    add-float v5, v2, v3

    .line 729
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    float-to-double v3, v11

    invoke-static {v3, v4}, Ljava/lang/Math;->sin(D)D

    move-result-wide v3

    double-to-float v3, v3

    add-float v4, v14, v13

    mul-float/2addr v3, v4

    add-float v6, v2, v3

    .line 730
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v6, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 732
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 733
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mTickSize:I

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 734
    float-to-double v2, v11

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    double-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    int-to-float v3, v3

    mul-float/2addr v2, v3

    sub-float/2addr v5, v2

    .line 735
    float-to-double v2, v11

    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    double-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    int-to-float v3, v3

    mul-float/2addr v2, v3

    sub-float/2addr v6, v2

    .line 736
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v3, v2, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v4, v2, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 738
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 739
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mTextColor:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 740
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/TimePicker;->mTickSize:I

    mul-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 742
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mTextSize:I

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 743
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/TimePicker;->mTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 744
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 746
    const-wide v29, 0x3fe0c152382d7365L    # 0.5235987755982988

    .line 747
    .local v29, "step":D
    const-wide v8, -0x400f3eadc7d28c9bL    # -1.0471975511965976

    .line 750
    .local v8, "angle":D
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_3e8
    move/from16 v0, v21

    if-ge v10, v0, :cond_4bf

    .line 751
    add-int v17, v10, v25

    .line 752
    .restart local v17    # "index":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mLocations:[F

    mul-int/lit8 v3, v17, 0x2

    aget v2, v2, v3

    invoke-static {v8, v9}, Ljava/lang/Math;->cos(D)D

    move-result-wide v3

    double-to-float v3, v3

    mul-float v3, v3, v22

    add-float v5, v2, v3

    .line 753
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mLocations:[F

    mul-int/lit8 v3, v17, 0x2

    add-int/lit8 v3, v3, 0x1

    aget v2, v2, v3

    invoke-static {v8, v9}, Ljava/lang/Math;->sin(D)D

    move-result-wide v3

    double-to-float v3, v3

    mul-float v3, v3, v22

    add-float v6, v2, v3

    .line 754
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move/from16 v0, v17

    move/from16 v1, v24

    if-ne v0, v1, :cond_4bb

    move/from16 v2, v32

    :goto_41e
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 755
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mTicks:[Ljava/lang/String;

    aget-object v2, v2, v17

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v5, v6, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 756
    add-double v8, v8, v29

    .line 750
    add-int/lit8 v10, v10, 0x1

    goto :goto_3e8

    .line 694
    .end local v5    # "x":F
    .end local v6    # "y":F
    .end local v8    # "angle":D
    .end local v10    # "i":I
    .end local v12    # "inLength":I
    .end local v14    # "inRadius":F
    .end local v16    # "inStart":I
    .end local v17    # "index":I
    .end local v21    # "outLength":I
    .end local v23    # "outRadius":F
    .end local v29    # "step":D
    :cond_435
    const/16 v21, 0xc

    goto/16 :goto_251

    .line 695
    .restart local v21    # "outLength":I
    :cond_439
    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/widget/TimePicker;->mInnerRadius:F

    move/from16 v23, v0

    goto/16 :goto_263

    .line 701
    .end local v11    # "inAngle":F
    .end local v13    # "inOffset":F
    .end local v15    # "inSelectedTick":I
    .end local v20    # "outAngle":F
    .end local v21    # "outLength":I
    .end local v22    # "outOffset":F
    .end local v24    # "outSelectedTick":I
    .end local v25    # "outStart":I
    :cond_441
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mMinute:I

    const/4 v3, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/rey/material/widget/TimePicker;->getAngle(II)F

    move-result v20

    .line 702
    .restart local v20    # "outAngle":F
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mHour:I

    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/rey/material/widget/TimePicker;->getAngle(II)F

    move-result v11

    .line 703
    .restart local v11    # "inAngle":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mOutInterpolator:Landroid/view/animation/Interpolator;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/rey/material/widget/TimePicker;->mAnimProgress:F

    invoke-interface {v2, v3}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v2

    move/from16 v0, v19

    neg-float v3, v0

    mul-float v22, v2, v3

    .line 704
    .restart local v22    # "outOffset":F
    const/high16 v2, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/TimePicker;->mInInterpolator:Landroid/view/animation/Interpolator;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/TimePicker;->mAnimProgress:F

    invoke-interface {v3, v4}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v3

    sub-float/2addr v2, v3

    mul-float v13, v2, v19

    .line 705
    .restart local v13    # "inOffset":F
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mMinute:I

    const/4 v3, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/rey/material/widget/TimePicker;->getSelectedTick(II)I

    move-result v24

    .line 706
    .restart local v24    # "outSelectedTick":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/widget/TimePicker;->mHour:I

    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/rey/material/widget/TimePicker;->getSelectedTick(II)I

    move-result v15

    .line 707
    .restart local v15    # "inSelectedTick":I
    const/16 v25, 0x18

    .line 708
    .restart local v25    # "outStart":I
    const/16 v21, 0xc

    .line 709
    .restart local v21    # "outLength":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/widget/TimePicker;->mInnerRadius:F

    move/from16 v23, v0

    .line 710
    .restart local v23    # "outRadius":F
    const/16 v16, 0x0

    .line 711
    .restart local v16    # "inStart":I
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/rey/material/widget/TimePicker;->m24Hour:Z

    if-eqz v2, :cond_4b3

    const/16 v12, 0x18

    .line 712
    .restart local v12    # "inLength":I
    :goto_4a3
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/rey/material/widget/TimePicker;->m24Hour:Z

    if-eqz v2, :cond_4b6

    const/16 v2, 0xc

    if-ge v15, v2, :cond_4b6

    move-object/from16 v0, p0

    iget v14, v0, Lcom/rey/material/widget/TimePicker;->mSecondInnerRadius:F

    .restart local v14    # "inRadius":F
    :goto_4b1
    goto/16 :goto_26b

    .line 711
    .end local v12    # "inLength":I
    .end local v14    # "inRadius":F
    :cond_4b3
    const/16 v12, 0xc

    goto :goto_4a3

    .line 712
    .restart local v12    # "inLength":I
    :cond_4b6
    move-object/from16 v0, p0

    iget v14, v0, Lcom/rey/material/widget/TimePicker;->mInnerRadius:F

    goto :goto_4b1

    .restart local v5    # "x":F
    .restart local v6    # "y":F
    .restart local v8    # "angle":D
    .restart local v10    # "i":I
    .restart local v14    # "inRadius":F
    .restart local v17    # "index":I
    .restart local v29    # "step":D
    :cond_4bb
    move/from16 v2, v34

    .line 754
    goto/16 :goto_41e

    .line 759
    .end local v17    # "index":I
    :cond_4bf
    const/4 v10, 0x0

    :goto_4c0
    if-ge v10, v12, :cond_50a

    .line 760
    add-int v17, v10, v16

    .line 761
    .restart local v17    # "index":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mLocations:[F

    mul-int/lit8 v3, v17, 0x2

    aget v2, v2, v3

    invoke-static {v8, v9}, Ljava/lang/Math;->cos(D)D

    move-result-wide v3

    double-to-float v3, v3

    mul-float/2addr v3, v13

    add-float v5, v2, v3

    .line 762
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mLocations:[F

    mul-int/lit8 v3, v17, 0x2

    add-int/lit8 v3, v3, 0x1

    aget v2, v2, v3

    invoke-static {v8, v9}, Ljava/lang/Math;->sin(D)D

    move-result-wide v3

    double-to-float v3, v3

    mul-float/2addr v3, v13

    add-float v6, v2, v3

    .line 763
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move/from16 v0, v17

    if-ne v0, v15, :cond_507

    move/from16 v2, v31

    :goto_4f0
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 764
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/widget/TimePicker;->mTicks:[Ljava/lang/String;

    aget-object v2, v2, v17

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v5, v6, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 765
    add-double v8, v8, v29

    .line 759
    add-int/lit8 v10, v10, 0x1

    goto :goto_4c0

    :cond_507
    move/from16 v2, v33

    .line 763
    goto :goto_4f0

    .line 768
    .end local v8    # "angle":D
    .end local v11    # "inAngle":F
    .end local v12    # "inLength":I
    .end local v13    # "inOffset":F
    .end local v14    # "inRadius":F
    .end local v15    # "inSelectedTick":I
    .end local v16    # "inStart":I
    .end local v17    # "index":I
    .end local v19    # "maxOffset":F
    .end local v20    # "outAngle":F
    .end local v21    # "outLength":I
    .end local v22    # "outOffset":F
    .end local v23    # "outRadius":F
    .end local v24    # "outSelectedTick":I
    .end local v25    # "outStart":I
    .end local v29    # "step":D
    .end local v31    # "textHighlightInColor":I
    .end local v32    # "textHighlightOutColor":I
    .end local v33    # "textInColor":I
    .end local v34    # "textOutColor":I
    :cond_50a
    return-void
.end method

.method public getAnimDuration()I
    .registers 2

    .prologue
    .line 291
    iget v0, p0, Lcom/rey/material/widget/TimePicker;->mAnimDuration:I

    return v0
.end method

.method public getBackgroundColor()I
    .registers 2

    .prologue
    .line 267
    iget v0, p0, Lcom/rey/material/widget/TimePicker;->mBackgroundColor:I

    return v0
.end method

.method public getHour()I
    .registers 2

    .prologue
    .line 313
    iget v0, p0, Lcom/rey/material/widget/TimePicker;->mHour:I

    return v0
.end method

.method public getInInterpolator()Landroid/view/animation/Interpolator;
    .registers 2

    .prologue
    .line 295
    iget-object v0, p0, Lcom/rey/material/widget/TimePicker;->mInInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method public getMinute()I
    .registers 2

    .prologue
    .line 320
    iget v0, p0, Lcom/rey/material/widget/TimePicker;->mMinute:I

    return v0
.end method

.method public getMode()I
    .registers 2

    .prologue
    .line 306
    iget v0, p0, Lcom/rey/material/widget/TimePicker;->mMode:I

    return v0
.end method

.method public getOutInterpolator()Landroid/view/animation/Interpolator;
    .registers 2

    .prologue
    .line 299
    iget-object v0, p0, Lcom/rey/material/widget/TimePicker;->mOutInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method public getSelectionColor()I
    .registers 2

    .prologue
    .line 271
    iget v0, p0, Lcom/rey/material/widget/TimePicker;->mSelectionColor:I

    return v0
.end method

.method public getTextColor()I
    .registers 2

    .prologue
    .line 283
    iget v0, p0, Lcom/rey/material/widget/TimePicker;->mTextColor:I

    return v0
.end method

.method public getTextHighlightColor()I
    .registers 2

    .prologue
    .line 287
    iget v0, p0, Lcom/rey/material/widget/TimePicker;->mTextHighlightColor:I

    return v0
.end method

.method public getTextSize()I
    .registers 2

    .prologue
    .line 279
    iget v0, p0, Lcom/rey/material/widget/TimePicker;->mTextSize:I

    return v0
.end method

.method public getTypeface()Landroid/graphics/Typeface;
    .registers 2

    .prologue
    .line 275
    iget-object v0, p0, Lcom/rey/material/widget/TimePicker;->mTypeface:Landroid/graphics/Typeface;

    return-object v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/high16 v2, -0x1000000

    .line 131
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/rey/material/widget/TimePicker;->mPaint:Landroid/graphics/Paint;

    .line 132
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/TimePicker;->mRect:Landroid/graphics/Rect;

    .line 134
    invoke-static {p1, v2}, Lcom/rey/material/util/ThemeUtil;->colorPrimary(Landroid/content/Context;I)I

    move-result v0

    const/high16 v1, 0x3e800000    # 0.25f

    invoke-static {v0, v1}, Lcom/rey/material/util/ColorUtil;->getColor(IF)I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/TimePicker;->mBackgroundColor:I

    .line 135
    invoke-static {p1, v2}, Lcom/rey/material/util/ThemeUtil;->colorPrimary(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/TimePicker;->mSelectionColor:I

    .line 137
    invoke-direct {p0}, Lcom/rey/material/widget/TimePicker;->initTickLabels()V

    .line 139
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TimePicker;->setWillNotDraw(Z)V

    .line 140
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/TimePicker;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 142
    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_39

    .line 143
    invoke-static {p1, p2, p3, p4}, Lcom/rey/material/app/ThemeManager;->getStyleId(Landroid/content/Context;Landroid/util/AttributeSet;II)I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/TimePicker;->mStyleId:I

    .line 144
    :cond_39
    return-void
.end method

.method public is24Hour()Z
    .registers 2

    .prologue
    .line 327
    iget-boolean v0, p0, Lcom/rey/material/widget/TimePicker;->m24Hour:Z

    return v0
.end method

.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 252
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 253
    iget v0, p0, Lcom/rey/material/widget/TimePicker;->mStyleId:I

    if-eqz v0, :cond_12

    .line 254
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->registerOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 255
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TimePicker;->onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V

    .line 257
    :cond_12
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 261
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 262
    iget v0, p0, Lcom/rey/material/widget/TimePicker;->mStyleId:I

    if-eqz v0, :cond_e

    .line 263
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->unregisterOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 264
    :cond_e
    return-void
.end method

.method protected onMeasure(II)V
    .registers 13
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v9, 0x40000000    # 2.0f

    .line 436
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v5

    .line 437
    .local v5, "widthMode":I
    if-nez v5, :cond_38

    iget v7, p0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    mul-int/lit8 v6, v7, 0xc

    .line 438
    .local v6, "widthSize":I
    :goto_c
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 439
    .local v1, "heightMode":I
    if-nez v1, :cond_48

    iget v7, p0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    mul-int/lit8 v2, v7, 0xc

    .line 441
    .local v2, "heightSize":I
    :goto_16
    invoke-static {v6, v2}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 443
    .local v3, "size":I
    if-ne v5, v9, :cond_58

    move v4, v6

    .line 444
    .local v4, "width":I
    :goto_1d
    if-ne v1, v9, :cond_5a

    move v0, v2

    .line 446
    .local v0, "height":I
    :goto_20
    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getPaddingLeft()I

    move-result v7

    add-int/2addr v7, v4

    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getPaddingRight()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getPaddingTop()I

    move-result v8

    add-int/2addr v8, v0

    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getPaddingBottom()I

    move-result v9

    add-int/2addr v8, v9

    invoke-virtual {p0, v7, v8}, Lcom/rey/material/widget/TimePicker;->setMeasuredDimension(II)V

    .line 447
    return-void

    .line 437
    .end local v0    # "height":I
    .end local v1    # "heightMode":I
    .end local v2    # "heightSize":I
    .end local v3    # "size":I
    .end local v4    # "width":I
    .end local v6    # "widthSize":I
    :cond_38
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v7

    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getPaddingLeft()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getPaddingRight()I

    move-result v8

    sub-int v6, v7, v8

    goto :goto_c

    .line 439
    .restart local v1    # "heightMode":I
    .restart local v6    # "widthSize":I
    :cond_48
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v7

    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getPaddingTop()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getPaddingBottom()I

    move-result v8

    sub-int v2, v7, v8

    goto :goto_16

    .restart local v2    # "heightSize":I
    .restart local v3    # "size":I
    :cond_58
    move v4, v3

    .line 443
    goto :goto_1d

    .restart local v4    # "width":I
    :cond_5a
    move v0, v3

    .line 444
    goto :goto_20
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 835
    move-object v0, p1

    check-cast v0, Lcom/rey/material/widget/TimePicker$SavedState;

    .line 836
    .local v0, "ss":Lcom/rey/material/widget/TimePicker$SavedState;
    invoke-virtual {v0}, Lcom/rey/material/widget/TimePicker$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 837
    iget-boolean v1, v0, Lcom/rey/material/widget/TimePicker$SavedState;->is24Hour:Z

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/TimePicker;->set24Hour(Z)V

    .line 838
    iget v1, v0, Lcom/rey/material/widget/TimePicker$SavedState;->mode:I

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/rey/material/widget/TimePicker;->setMode(IZ)V

    .line 839
    iget v1, v0, Lcom/rey/material/widget/TimePicker$SavedState;->hour:I

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/TimePicker;->setHour(I)V

    .line 840
    iget v1, v0, Lcom/rey/material/widget/TimePicker$SavedState;->minute:I

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/TimePicker;->setMinute(I)V

    .line 841
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 821
    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 823
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Lcom/rey/material/widget/TimePicker$SavedState;

    invoke-direct {v0, v1}, Lcom/rey/material/widget/TimePicker$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 825
    .local v0, "ss":Lcom/rey/material/widget/TimePicker$SavedState;
    iget v2, p0, Lcom/rey/material/widget/TimePicker;->mMode:I

    iput v2, v0, Lcom/rey/material/widget/TimePicker$SavedState;->mode:I

    .line 826
    iget v2, p0, Lcom/rey/material/widget/TimePicker;->mHour:I

    iput v2, v0, Lcom/rey/material/widget/TimePicker$SavedState;->hour:I

    .line 827
    iget v2, p0, Lcom/rey/material/widget/TimePicker;->mMinute:I

    iput v2, v0, Lcom/rey/material/widget/TimePicker$SavedState;->minute:I

    .line 828
    iget-boolean v2, p0, Lcom/rey/material/widget/TimePicker;->m24Hour:Z

    iput-boolean v2, v0, Lcom/rey/material/widget/TimePicker$SavedState;->is24Hour:Z

    .line 830
    return-object v0
.end method

.method protected onSizeChanged(IIII)V
    .registers 12
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 515
    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getPaddingLeft()I

    move-result v0

    .line 516
    .local v0, "left":I
    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getPaddingTop()I

    move-result v2

    .line 517
    .local v2, "top":I
    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getPaddingLeft()I

    move-result v3

    sub-int v3, p1, v3

    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getPaddingRight()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getPaddingTop()I

    move-result v4

    sub-int v4, p2, v4

    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getPaddingBottom()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 519
    .local v1, "size":I
    iget-object v3, p0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    if-nez v3, :cond_2d

    .line 520
    new-instance v3, Landroid/graphics/PointF;

    invoke-direct {v3}, Landroid/graphics/PointF;-><init>()V

    iput-object v3, p0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    .line 522
    :cond_2d
    int-to-float v3, v1

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    iput v3, p0, Lcom/rey/material/widget/TimePicker;->mOuterRadius:F

    .line 523
    iget-object v3, p0, Lcom/rey/material/widget/TimePicker;->mCenterPoint:Landroid/graphics/PointF;

    int-to-float v4, v0

    iget v5, p0, Lcom/rey/material/widget/TimePicker;->mOuterRadius:F

    add-float/2addr v4, v5

    int-to-float v5, v2

    iget v6, p0, Lcom/rey/material/widget/TimePicker;->mOuterRadius:F

    add-float/2addr v5, v6

    invoke-virtual {v3, v4, v5}, Landroid/graphics/PointF;->set(FF)V

    .line 524
    iget v3, p0, Lcom/rey/material/widget/TimePicker;->mOuterRadius:F

    iget v4, p0, Lcom/rey/material/widget/TimePicker;->mSelectionRadius:I

    int-to-float v4, v4

    sub-float/2addr v3, v4

    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->getContext()Landroid/content/Context;

    move-result-object v4

    const/4 v5, 0x4

    invoke-static {v4, v5}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v3, v4

    iput v3, p0, Lcom/rey/material/widget/TimePicker;->mInnerRadius:F

    .line 526
    invoke-direct {p0}, Lcom/rey/material/widget/TimePicker;->calculateTextLocation()V

    .line 527
    return-void
.end method

.method public onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V
    .registers 5
    .param p1, "event"    # Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;

    .prologue
    .line 243
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/widget/TimePicker;->mStyleId:I

    invoke-virtual {v1, v2}, Lcom/rey/material/app/ThemeManager;->getCurrentStyle(I)I

    move-result v0

    .line 244
    .local v0, "style":I
    iget v1, p0, Lcom/rey/material/widget/TimePicker;->mCurrentStyle:I

    if-eq v1, v0, :cond_15

    .line 245
    iput v0, p0, Lcom/rey/material/widget/TimePicker;->mCurrentStyle:I

    .line 246
    iget v1, p0, Lcom/rey/material/widget/TimePicker;->mCurrentStyle:I

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/TimePicker;->applyStyle(I)V

    .line 248
    :cond_15
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 575
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    packed-switch v3, :pswitch_data_60

    .line 608
    :cond_9
    :goto_9
    return v1

    .line 577
    :pswitch_a
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-direct {p0, v3, v4, v2}, Lcom/rey/material/widget/TimePicker;->getPointedValue(FFZ)I

    move-result v0

    .line 578
    .local v0, "value":I
    if-ltz v0, :cond_9

    .line 580
    iget v1, p0, Lcom/rey/material/widget/TimePicker;->mMode:I

    if-nez v1, :cond_23

    .line 581
    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TimePicker;->setHour(I)V

    .line 584
    :cond_1f
    :goto_1f
    iput-boolean v2, p0, Lcom/rey/material/widget/TimePicker;->mEdited:Z

    move v1, v2

    .line 585
    goto :goto_9

    .line 582
    :cond_23
    iget v1, p0, Lcom/rey/material/widget/TimePicker;->mMode:I

    if-ne v1, v2, :cond_1f

    .line 583
    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TimePicker;->setMinute(I)V

    goto :goto_1f

    .line 587
    .end local v0    # "value":I
    :pswitch_2b
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-direct {p0, v3, v4, v1}, Lcom/rey/material/widget/TimePicker;->getPointedValue(FFZ)I

    move-result v0

    .line 588
    .restart local v0    # "value":I
    if-gez v0, :cond_3b

    move v1, v2

    .line 589
    goto :goto_9

    .line 590
    :cond_3b
    iget v1, p0, Lcom/rey/material/widget/TimePicker;->mMode:I

    if-nez v1, :cond_46

    .line 591
    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TimePicker;->setHour(I)V

    .line 594
    :cond_42
    :goto_42
    iput-boolean v2, p0, Lcom/rey/material/widget/TimePicker;->mEdited:Z

    move v1, v2

    .line 595
    goto :goto_9

    .line 592
    :cond_46
    iget v1, p0, Lcom/rey/material/widget/TimePicker;->mMode:I

    if-ne v1, v2, :cond_42

    .line 593
    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TimePicker;->setMinute(I)V

    goto :goto_42

    .line 597
    .end local v0    # "value":I
    :pswitch_4e
    iget-boolean v3, p0, Lcom/rey/material/widget/TimePicker;->mEdited:Z

    if-eqz v3, :cond_9

    iget v3, p0, Lcom/rey/material/widget/TimePicker;->mMode:I

    if-nez v3, :cond_9

    .line 598
    invoke-virtual {p0, v2, v2}, Lcom/rey/material/widget/TimePicker;->setMode(IZ)V

    .line 599
    iput-boolean v1, p0, Lcom/rey/material/widget/TimePicker;->mEdited:Z

    move v1, v2

    .line 600
    goto :goto_9

    .line 604
    :pswitch_5d
    iput-boolean v1, p0, Lcom/rey/material/widget/TimePicker;->mEdited:Z

    goto :goto_9

    .line 575
    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_a
        :pswitch_4e
        :pswitch_2b
        :pswitch_5d
    .end packed-switch
.end method

.method public set24Hour(Z)V
    .registers 4
    .param p1, "b"    # Z

    .prologue
    .line 403
    iget-boolean v0, p0, Lcom/rey/material/widget/TimePicker;->m24Hour:Z

    if-eq v0, p1, :cond_1a

    .line 404
    iput-boolean p1, p0, Lcom/rey/material/widget/TimePicker;->m24Hour:Z

    .line 405
    iget-boolean v0, p0, Lcom/rey/material/widget/TimePicker;->m24Hour:Z

    if-nez v0, :cond_17

    iget v0, p0, Lcom/rey/material/widget/TimePicker;->mHour:I

    const/16 v1, 0xb

    if-le v0, v1, :cond_17

    .line 406
    iget v0, p0, Lcom/rey/material/widget/TimePicker;->mHour:I

    add-int/lit8 v0, v0, -0xc

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TimePicker;->setHour(I)V

    .line 407
    :cond_17
    invoke-direct {p0}, Lcom/rey/material/widget/TimePicker;->calculateTextLocation()V

    .line 409
    :cond_1a
    return-void
.end method

.method public setHour(I)V
    .registers 5
    .param p1, "hour"    # I

    .prologue
    const/4 v2, 0x0

    .line 354
    iget-boolean v1, p0, Lcom/rey/material/widget/TimePicker;->m24Hour:Z

    if-eqz v1, :cond_26

    .line 355
    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    rem-int/lit8 p1, v1, 0x18

    .line 359
    :goto_b
    iget v1, p0, Lcom/rey/material/widget/TimePicker;->mHour:I

    if-eq v1, p1, :cond_25

    .line 360
    iget v0, p0, Lcom/rey/material/widget/TimePicker;->mHour:I

    .line 361
    .local v0, "old":I
    iput p1, p0, Lcom/rey/material/widget/TimePicker;->mHour:I

    .line 363
    iget-object v1, p0, Lcom/rey/material/widget/TimePicker;->mOnTimeChangedListener:Lcom/rey/material/widget/TimePicker$OnTimeChangedListener;

    if-eqz v1, :cond_1e

    .line 364
    iget-object v1, p0, Lcom/rey/material/widget/TimePicker;->mOnTimeChangedListener:Lcom/rey/material/widget/TimePicker$OnTimeChangedListener;

    iget v2, p0, Lcom/rey/material/widget/TimePicker;->mHour:I

    invoke-interface {v1, v0, v2}, Lcom/rey/material/widget/TimePicker$OnTimeChangedListener;->onHourChanged(II)V

    .line 366
    :cond_1e
    iget v1, p0, Lcom/rey/material/widget/TimePicker;->mMode:I

    if-nez v1, :cond_25

    .line 367
    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->invalidate()V

    .line 369
    .end local v0    # "old":I
    :cond_25
    return-void

    .line 357
    :cond_26
    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    rem-int/lit8 p1, v1, 0xc

    goto :goto_b
.end method

.method public setMinute(I)V
    .registers 5
    .param p1, "minute"    # I

    .prologue
    .line 376
    const/4 v1, 0x0

    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    const/16 v2, 0x3b

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 378
    iget v1, p0, Lcom/rey/material/widget/TimePicker;->mMinute:I

    if-eq v1, p1, :cond_26

    .line 379
    iget v0, p0, Lcom/rey/material/widget/TimePicker;->mMinute:I

    .line 380
    .local v0, "old":I
    iput p1, p0, Lcom/rey/material/widget/TimePicker;->mMinute:I

    .line 382
    iget-object v1, p0, Lcom/rey/material/widget/TimePicker;->mOnTimeChangedListener:Lcom/rey/material/widget/TimePicker$OnTimeChangedListener;

    if-eqz v1, :cond_1e

    .line 383
    iget-object v1, p0, Lcom/rey/material/widget/TimePicker;->mOnTimeChangedListener:Lcom/rey/material/widget/TimePicker$OnTimeChangedListener;

    iget v2, p0, Lcom/rey/material/widget/TimePicker;->mMinute:I

    invoke-interface {v1, v0, v2}, Lcom/rey/material/widget/TimePicker$OnTimeChangedListener;->onMinuteChanged(II)V

    .line 385
    :cond_1e
    iget v1, p0, Lcom/rey/material/widget/TimePicker;->mMode:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_26

    .line 386
    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->invalidate()V

    .line 388
    .end local v0    # "old":I
    :cond_26
    return-void
.end method

.method public setMode(IZ)V
    .registers 5
    .param p1, "mode"    # I
    .param p2, "animation"    # Z

    .prologue
    .line 336
    iget v0, p0, Lcom/rey/material/widget/TimePicker;->mMode:I

    if-eq v0, p1, :cond_16

    .line 337
    iput p1, p0, Lcom/rey/material/widget/TimePicker;->mMode:I

    .line 339
    iget-object v0, p0, Lcom/rey/material/widget/TimePicker;->mOnTimeChangedListener:Lcom/rey/material/widget/TimePicker$OnTimeChangedListener;

    if-eqz v0, :cond_11

    .line 340
    iget-object v0, p0, Lcom/rey/material/widget/TimePicker;->mOnTimeChangedListener:Lcom/rey/material/widget/TimePicker$OnTimeChangedListener;

    iget v1, p0, Lcom/rey/material/widget/TimePicker;->mMode:I

    invoke-interface {v0, v1}, Lcom/rey/material/widget/TimePicker$OnTimeChangedListener;->onModeChanged(I)V

    .line 342
    :cond_11
    if-eqz p2, :cond_17

    .line 343
    invoke-direct {p0}, Lcom/rey/material/widget/TimePicker;->startAnimation()V

    .line 347
    :cond_16
    :goto_16
    return-void

    .line 345
    :cond_17
    invoke-virtual {p0}, Lcom/rey/material/widget/TimePicker;->invalidate()V

    goto :goto_16
.end method

.method public setOnTimeChangedListener(Lcom/rey/material/widget/TimePicker$OnTimeChangedListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/rey/material/widget/TimePicker$OnTimeChangedListener;

    .prologue
    .line 395
    iput-object p1, p0, Lcom/rey/material/widget/TimePicker;->mOnTimeChangedListener:Lcom/rey/material/widget/TimePicker$OnTimeChangedListener;

    .line 396
    return-void
.end method
