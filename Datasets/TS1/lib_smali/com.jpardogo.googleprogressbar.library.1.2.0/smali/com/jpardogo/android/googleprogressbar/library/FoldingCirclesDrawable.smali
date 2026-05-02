.class public Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "FoldingCirclesDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Drawable$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$1;,
        Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$Builder;,
        Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$ProgressStates;
    }
.end annotation


# static fields
.field private static final ALPHA_ABOVE_DEFAULT:I = 0xeb

.field private static final ALPHA_OPAQUE:I = 0xff

.field private static final CIRCLE_COUNT:F

.field private static final MAX_LEVEL:F = 10000.0f

.field private static final MAX_LEVEL_PER_CIRCLE:F

.field private static mColor1:I

.field private static mColor2:I

.field private static mColor3:I

.field private static mColor4:I


# instance fields
.field private fstColor:I

.field private goesBackward:Z

.field private mAbovePaint:Landroid/graphics/Paint;

.field private mAlpha:I

.field private mAxisValue:I

.field private mColorFilter:Landroid/graphics/ColorFilter;

.field private mControlPointMaximum:I

.field private mControlPointMinimum:I

.field private mCurrentState:Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$ProgressStates;

.field private mDiameter:I

.field private mFstHalfPaint:Landroid/graphics/Paint;

.field private mHalf:I

.field private mOval:Landroid/graphics/RectF;

.field private mPath:Landroid/graphics/Path;

.field private mScndHalfPaint:Landroid/graphics/Paint;

.field private scndColor:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 22
    invoke-static {}, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$ProgressStates;->values()[Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$ProgressStates;

    move-result-object v0

    array-length v0, v0

    int-to-float v0, v0

    sput v0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->CIRCLE_COUNT:F

    .line 23
    const v0, 0x461c4000    # 10000.0f

    sget v1, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->CIRCLE_COUNT:F

    div-float/2addr v0, v1

    sput v0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->MAX_LEVEL_PER_CIRCLE:F

    return-void
.end method

.method public constructor <init>([I)V
    .registers 3
    .param p1, "colors"    # [I

    .prologue
    .line 54
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 30
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mOval:Landroid/graphics/RectF;

    .line 38
    const/16 v0, 0xff

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mAlpha:I

    .line 55
    invoke-direct {p0, p1}, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->initCirclesProgress([I)V

    .line 56
    return-void
.end method

.method private drawXMotion(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v4, 0x1

    const/4 v7, 0x0

    .line 186
    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mOval:Landroid/graphics/RectF;

    const/high16 v2, 0x42b40000    # 90.0f

    const/high16 v3, 0x43340000    # 180.0f

    iget-object v5, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mFstHalfPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 187
    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mOval:Landroid/graphics/RectF;

    const/high16 v2, -0x3c790000    # -270.0f

    const/high16 v3, -0x3ccc0000    # -180.0f

    iget-object v5, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mScndHalfPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 188
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 189
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mPath:Landroid/graphics/Path;

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mHalf:I

    int-to-float v1, v1

    invoke-virtual {v0, v1, v7}, Landroid/graphics/Path;->moveTo(FF)V

    .line 190
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mPath:Landroid/graphics/Path;

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mAxisValue:I

    int-to-float v1, v1

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mAxisValue:I

    int-to-float v3, v2

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mDiameter:I

    int-to-float v4, v2

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mHalf:I

    int-to-float v5, v2

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mDiameter:I

    int-to-float v6, v2

    move v2, v7

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 192
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mPath:Landroid/graphics/Path;

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mHalf:I

    add-int/lit8 v1, v1, 0x1

    int-to-float v1, v1

    invoke-virtual {v0, v1, v7}, Landroid/graphics/Path;->moveTo(FF)V

    .line 193
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mPath:Landroid/graphics/Path;

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mAxisValue:I

    int-to-float v1, v1

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mAxisValue:I

    int-to-float v3, v2

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mDiameter:I

    int-to-float v4, v2

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mHalf:I

    add-int/lit8 v2, v2, 0x1

    int-to-float v5, v2

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mDiameter:I

    int-to-float v6, v2

    move v2, v7

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 194
    return-void
.end method

.method private drawYMotion(Landroid/graphics/Canvas;)V
    .registers 13
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v4, 0x1

    const/high16 v3, -0x3ccc0000    # -180.0f

    const/4 v2, 0x0

    .line 197
    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mOval:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mFstHalfPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 198
    iget-object v6, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mOval:Landroid/graphics/RectF;

    iget-object v10, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mScndHalfPaint:Landroid/graphics/Paint;

    move-object v5, p1

    move v7, v3

    move v8, v3

    move v9, v4

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 199
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 200
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mPath:Landroid/graphics/Path;

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mHalf:I

    int-to-float v1, v1

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 201
    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mPath:Landroid/graphics/Path;

    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mAxisValue:I

    int-to-float v3, v0

    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mDiameter:I

    int-to-float v4, v0

    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mAxisValue:I

    int-to-float v5, v0

    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mDiameter:I

    int-to-float v6, v0

    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mHalf:I

    int-to-float v7, v0

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 203
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mPath:Landroid/graphics/Path;

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mHalf:I

    add-int/lit8 v1, v1, 0x1

    int-to-float v1, v1

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 204
    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mPath:Landroid/graphics/Path;

    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mAxisValue:I

    int-to-float v3, v0

    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mDiameter:I

    int-to-float v4, v0

    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mAxisValue:I

    int-to-float v5, v0

    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mDiameter:I

    int-to-float v6, v0

    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mHalf:I

    add-int/lit8 v0, v0, 0x1

    int-to-float v7, v0

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 205
    return-void
.end method

.method private initCirclesProgress([I)V
    .registers 4
    .param p1, "colors"    # [I

    .prologue
    .line 59
    invoke-direct {p0, p1}, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->initColors([I)V

    .line 60
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mPath:Landroid/graphics/Path;

    .line 62
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 63
    .local v0, "basePaint":Landroid/graphics/Paint;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 65
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v0}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mFstHalfPaint:Landroid/graphics/Paint;

    .line 66
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v0}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mScndHalfPaint:Landroid/graphics/Paint;

    .line 67
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v0}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mAbovePaint:Landroid/graphics/Paint;

    .line 70
    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mAlpha:I

    invoke-virtual {p0, v1}, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->setAlpha(I)V

    .line 71
    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mColorFilter:Landroid/graphics/ColorFilter;

    invoke-virtual {p0, v1}, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 72
    return-void
.end method

.method private initColors([I)V
    .registers 3
    .param p1, "colors"    # [I

    .prologue
    .line 75
    const/4 v0, 0x0

    aget v0, p1, v0

    sput v0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mColor1:I

    .line 76
    const/4 v0, 0x1

    aget v0, p1, v0

    sput v0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mColor2:I

    .line 77
    const/4 v0, 0x2

    aget v0, p1, v0

    sput v0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mColor3:I

    .line 78
    const/4 v0, 0x3

    aget v0, p1, v0

    sput v0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mColor4:I

    .line 79
    return-void
.end method

.method private makeCirclesProgress(Landroid/graphics/Canvas;)V
    .registers 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 171
    sget-object v0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$1;->$SwitchMap$com$jpardogo$android$googleprogressbar$library$FoldingCirclesDrawable$ProgressStates:[I

    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mCurrentState:Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$ProgressStates;

    invoke-virtual {v1}, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$ProgressStates;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1e

    .line 182
    :goto_d
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mAbovePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 183
    return-void

    .line 174
    :pswitch_15
    invoke-direct {p0, p1}, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->drawYMotion(Landroid/graphics/Canvas;)V

    goto :goto_d

    .line 178
    :pswitch_19
    invoke-direct {p0, p1}, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->drawXMotion(Landroid/graphics/Canvas;)V

    goto :goto_d

    .line 171
    nop

    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_15
        :pswitch_19
        :pswitch_15
        :pswitch_19
    .end packed-switch
.end method

.method private measureCircleProgress(II)V
    .registers 7
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    const/4 v3, 0x0

    .line 162
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mDiameter:I

    .line 163
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mDiameter:I

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mHalf:I

    .line 164
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mOval:Landroid/graphics/RectF;

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mDiameter:I

    int-to-float v1, v1

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mDiameter:I

    int-to-float v2, v2

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 165
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mDiameter:I

    neg-int v0, v0

    div-int/lit8 v0, v0, 0x6

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mControlPointMinimum:I

    .line 166
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mDiameter:I

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mDiameter:I

    div-int/lit8 v1, v1, 0x6

    add-int/2addr v0, v1

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mControlPointMaximum:I

    .line 167
    return-void
.end method

.method private resetColor(Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$ProgressStates;)V
    .registers 6
    .param p1, "currentState"    # Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$ProgressStates;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 130
    sget-object v0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$1;->$SwitchMap$com$jpardogo$android$googleprogressbar$library$FoldingCirclesDrawable$ProgressStates:[I

    invoke-virtual {p1}, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$ProgressStates;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_3a

    .line 152
    :goto_d
    return-void

    .line 132
    :pswitch_e
    sget v0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mColor1:I

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->fstColor:I

    .line 133
    sget v0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mColor2:I

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->scndColor:I

    .line 134
    iput-boolean v2, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->goesBackward:Z

    goto :goto_d

    .line 137
    :pswitch_19
    sget v0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mColor1:I

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->fstColor:I

    .line 138
    sget v0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mColor3:I

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->scndColor:I

    .line 139
    iput-boolean v3, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->goesBackward:Z

    goto :goto_d

    .line 142
    :pswitch_24
    sget v0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mColor3:I

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->fstColor:I

    .line 143
    sget v0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mColor4:I

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->scndColor:I

    .line 144
    iput-boolean v3, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->goesBackward:Z

    goto :goto_d

    .line 147
    :pswitch_2f
    sget v0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mColor2:I

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->fstColor:I

    .line 148
    sget v0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mColor4:I

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->scndColor:I

    .line 149
    iput-boolean v2, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->goesBackward:Z

    goto :goto_d

    .line 130
    :pswitch_data_3a
    .packed-switch 0x1
        :pswitch_e
        :pswitch_19
        :pswitch_24
        :pswitch_2f
    .end packed-switch
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 156
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mCurrentState:Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$ProgressStates;

    if-eqz v0, :cond_7

    .line 157
    invoke-direct {p0, p1}, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->makeCirclesProgress(Landroid/graphics/Canvas;)V

    .line 159
    :cond_7
    return-void
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 226
    const/4 v0, -0x3

    return v0
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 231
    invoke-virtual {p0}, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    .line 232
    .local v0, "callback":Landroid/graphics/drawable/Drawable$Callback;
    if-eqz v0, :cond_9

    .line 233
    invoke-interface {v0, p0}, Landroid/graphics/drawable/Drawable$Callback;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 235
    :cond_9
    return-void
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .registers 4
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 83
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 84
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->measureCircleProgress(II)V

    .line 85
    return-void
.end method

.method protected onLevelChange(I)Z
    .registers 11
    .param p1, "level"    # I

    .prologue
    const/high16 v8, 0x40000000    # 2.0f

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 92
    int-to-float v6, p1

    const v7, 0x461c4000    # 10000.0f

    cmpl-float v6, v6, v7

    if-nez v6, :cond_64

    move v0, v4

    .line 95
    .local v0, "animationLevel":I
    :goto_d
    int-to-float v6, v0

    sget v7, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->MAX_LEVEL_PER_CIRCLE:F

    div-float/2addr v6, v7

    float-to-int v3, v6

    .line 96
    .local v3, "stateForLevel":I
    invoke-static {}, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$ProgressStates;->values()[Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$ProgressStates;

    move-result-object v6

    aget-object v6, v6, v3

    iput-object v6, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mCurrentState:Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$ProgressStates;

    .line 99
    iget-object v6, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mCurrentState:Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$ProgressStates;

    invoke-direct {p0, v6}, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->resetColor(Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$ProgressStates;)V

    .line 100
    int-to-float v6, v0

    sget v7, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->MAX_LEVEL_PER_CIRCLE:F

    rem-float/2addr v6, v7

    float-to-int v2, v6

    .line 103
    .local v2, "levelForCircle":I
    iget-boolean v6, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->goesBackward:Z

    if-nez v6, :cond_68

    .line 104
    int-to-float v6, v0

    sget v7, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->MAX_LEVEL_PER_CIRCLE:F

    div-float/2addr v7, v8

    rem-float/2addr v6, v7

    float-to-int v6, v6

    if-eq v2, v6, :cond_66

    move v1, v5

    .line 110
    .local v1, "halfPassed":Z
    :goto_31
    iget-object v4, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mFstHalfPaint:Landroid/graphics/Paint;

    iget v6, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->fstColor:I

    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 111
    iget-object v4, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mScndHalfPaint:Landroid/graphics/Paint;

    iget v6, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->scndColor:I

    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 113
    if-nez v1, :cond_79

    .line 114
    iget-object v4, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mAbovePaint:Landroid/graphics/Paint;

    iget-object v6, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mScndHalfPaint:Landroid/graphics/Paint;

    invoke-virtual {v6}, Landroid/graphics/Paint;->getColor()I

    move-result v6

    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 121
    :goto_4c
    iget v4, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mAlpha:I

    invoke-virtual {p0, v4}, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->setAlpha(I)V

    .line 124
    iget v4, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mControlPointMinimum:I

    int-to-float v4, v4

    iget v6, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mControlPointMaximum:I

    iget v7, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mControlPointMinimum:I

    sub-int/2addr v6, v7

    int-to-float v6, v6

    int-to-float v7, v2

    sget v8, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->MAX_LEVEL_PER_CIRCLE:F

    div-float/2addr v7, v8

    mul-float/2addr v6, v7

    add-float/2addr v4, v6

    float-to-int v4, v4

    iput v4, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mAxisValue:I

    .line 126
    return v5

    .end local v0    # "animationLevel":I
    .end local v1    # "halfPassed":Z
    .end local v2    # "levelForCircle":I
    .end local v3    # "stateForLevel":I
    :cond_64
    move v0, p1

    .line 92
    goto :goto_d

    .restart local v0    # "animationLevel":I
    .restart local v2    # "levelForCircle":I
    .restart local v3    # "stateForLevel":I
    :cond_66
    move v1, v4

    .line 104
    goto :goto_31

    .line 106
    :cond_68
    int-to-float v6, v0

    sget v7, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->MAX_LEVEL_PER_CIRCLE:F

    div-float/2addr v7, v8

    rem-float/2addr v6, v7

    float-to-int v6, v6

    if-ne v2, v6, :cond_77

    move v1, v5

    .line 107
    .restart local v1    # "halfPassed":Z
    :goto_71
    sget v4, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->MAX_LEVEL_PER_CIRCLE:F

    int-to-float v6, v2

    sub-float/2addr v4, v6

    float-to-int v2, v4

    goto :goto_31

    .end local v1    # "halfPassed":Z
    :cond_77
    move v1, v4

    .line 106
    goto :goto_71

    .line 116
    .restart local v1    # "halfPassed":Z
    :cond_79
    iget-object v4, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mAbovePaint:Landroid/graphics/Paint;

    iget-object v6, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mFstHalfPaint:Landroid/graphics/Paint;

    invoke-virtual {v6}, Landroid/graphics/Paint;->getColor()I

    move-result v6

    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_4c
.end method

.method public scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .registers 6
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;
    .param p2, "what"    # Ljava/lang/Runnable;
    .param p3, "when"    # J

    .prologue
    .line 239
    invoke-virtual {p0}, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    .line 240
    .local v0, "callback":Landroid/graphics/drawable/Drawable$Callback;
    if-eqz v0, :cond_9

    .line 241
    invoke-interface {v0, p0, p2, p3, p4}, Landroid/graphics/drawable/Drawable$Callback;->scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V

    .line 243
    :cond_9
    return-void
.end method

.method public setAlpha(I)V
    .registers 4
    .param p1, "alpha"    # I

    .prologue
    .line 209
    iput p1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mAlpha:I

    .line 210
    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mFstHalfPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 211
    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mScndHalfPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 212
    mul-int/lit16 v1, p1, 0xeb

    div-int/lit16 v0, v1, 0xff

    .line 213
    .local v0, "targetAboveAlpha":I
    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mAbovePaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 214
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 218
    iput-object p1, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mColorFilter:Landroid/graphics/ColorFilter;

    .line 219
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mFstHalfPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 220
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mScndHalfPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 221
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->mAbovePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 222
    return-void
.end method

.method public unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .registers 4
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;
    .param p2, "what"    # Ljava/lang/Runnable;

    .prologue
    .line 247
    invoke-virtual {p0}, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    .line 248
    .local v0, "callback":Landroid/graphics/drawable/Drawable$Callback;
    if-eqz v0, :cond_9

    .line 249
    invoke-interface {v0, p0, p2}, Landroid/graphics/drawable/Drawable$Callback;->unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V

    .line 251
    :cond_9
    return-void
.end method
