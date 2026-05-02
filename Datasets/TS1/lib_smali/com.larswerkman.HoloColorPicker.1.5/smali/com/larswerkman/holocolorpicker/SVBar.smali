.class public Lcom/larswerkman/holocolorpicker/SVBar;
.super Landroid/view/View;
.source "SVBar.java"


# static fields
.field private static final ORIENTATION_DEFAULT:Z = true

.field private static final ORIENTATION_HORIZONTAL:Z = true

.field private static final ORIENTATION_VERTICAL:Z = false

.field private static final STATE_COLOR:Ljava/lang/String; = "color"

.field private static final STATE_ORIENTATION:Ljava/lang/String; = "orientation"

.field private static final STATE_PARENT:Ljava/lang/String; = "parent"

.field private static final STATE_SATURATION:Ljava/lang/String; = "saturation"

.field private static final STATE_VALUE:Ljava/lang/String; = "value"


# instance fields
.field private mBarLength:I

.field private mBarPaint:Landroid/graphics/Paint;

.field private mBarPointerHaloPaint:Landroid/graphics/Paint;

.field private mBarPointerHaloRadius:I

.field private mBarPointerPaint:Landroid/graphics/Paint;

.field private mBarPointerPosition:I

.field private mBarPointerRadius:I

.field private mBarRect:Landroid/graphics/RectF;

.field private mBarThickness:I

.field private mColor:I

.field private mHSVColor:[F

.field private mIsMovingPointer:Z

.field private mOrientation:Z

.field private mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

.field private mPosToSVFactor:F

.field private mPreferredBarLength:I

.field private mSVToPosFactor:F

.field private shader:Landroid/graphics/Shader;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 149
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 102
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarRect:Landroid/graphics/RectF;

    .line 126
    const/4 v0, 0x3

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mHSVColor:[F

    .line 141
    iput-object v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    .line 150
    const/4 v0, 0x0

    invoke-direct {p0, v1, v0}, Lcom/larswerkman/holocolorpicker/SVBar;->init(Landroid/util/AttributeSet;I)V

    .line 151
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 154
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 102
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarRect:Landroid/graphics/RectF;

    .line 126
    const/4 v0, 0x3

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mHSVColor:[F

    .line 141
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    .line 155
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Lcom/larswerkman/holocolorpicker/SVBar;->init(Landroid/util/AttributeSet;I)V

    .line 156
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 159
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 102
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarRect:Landroid/graphics/RectF;

    .line 126
    const/4 v0, 0x3

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mHSVColor:[F

    .line 141
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    .line 160
    invoke-direct {p0, p2, p3}, Lcom/larswerkman/holocolorpicker/SVBar;->init(Landroid/util/AttributeSet;I)V

    .line 161
    return-void
.end method

.method private calculateColor(I)V
    .registers 8
    .param p1, "coord"    # I

    .prologue
    const/4 v1, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    .line 461
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    sub-int/2addr p1, v0

    .line 462
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    div-int/lit8 v0, v0, 0x2

    if-le p1, v0, :cond_32

    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    if-ge p1, v0, :cond_32

    .line 463
    new-array v0, v1, [F

    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mHSVColor:[F

    aget v1, v1, v2

    aput v1, v0, v2

    aput v3, v0, v4

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPosToSVFactor:F

    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    div-int/lit8 v2, v2, 0x2

    sub-int v2, p1, v2

    int-to-float v2, v2

    mul-float/2addr v1, v2

    sub-float v1, v3, v1

    aput v1, v0, v5

    .line 464
    invoke-static {v0}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v0

    iput v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    .line 480
    :cond_31
    :goto_31
    return-void

    .line 467
    :cond_32
    if-lez p1, :cond_4f

    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    if-ge p1, v0, :cond_4f

    .line 468
    new-array v0, v1, [F

    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mHSVColor:[F

    aget v1, v1, v2

    aput v1, v0, v2

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPosToSVFactor:F

    int-to-float v2, p1

    mul-float/2addr v1, v2

    aput v1, v0, v4

    aput v3, v0, v5

    invoke-static {v0}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v0

    iput v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    goto :goto_31

    .line 471
    :cond_4f
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    div-int/lit8 v0, v0, 0x2

    if-ne p1, v0, :cond_68

    .line 472
    new-array v0, v1, [F

    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mHSVColor:[F

    aget v1, v1, v2

    aput v1, v0, v2

    aput v3, v0, v4

    aput v3, v0, v5

    invoke-static {v0}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v0

    iput v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    goto :goto_31

    .line 475
    :cond_68
    if-gtz p1, :cond_6e

    .line 476
    const/4 v0, -0x1

    iput v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    goto :goto_31

    .line 477
    :cond_6e
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    if-lt p1, v0, :cond_31

    .line 478
    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    goto :goto_31
.end method

.method private init(Landroid/util/AttributeSet;I)V
    .registers 11
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyle"    # I

    .prologue
    const/high16 v7, 0x40000000    # 2.0f

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v5, 0x1

    .line 164
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/SVBar;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Lcom/larswerkman/holocolorpicker/R$styleable;->ColorBars:[I

    const/4 v4, 0x0

    invoke-virtual {v2, p1, v3, p2, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 166
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/SVBar;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 168
    .local v1, "b":Landroid/content/res/Resources;
    sget v2, Lcom/larswerkman/holocolorpicker/R$styleable;->ColorBars_bar_thickness:I

    sget v3, Lcom/larswerkman/holocolorpicker/R$dimen;->bar_thickness:I

    .line 170
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 168
    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarThickness:I

    .line 171
    sget v2, Lcom/larswerkman/holocolorpicker/R$styleable;->ColorBars_bar_length:I

    sget v3, Lcom/larswerkman/holocolorpicker/R$dimen;->bar_length:I

    .line 172
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 171
    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    .line 173
    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    iput v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPreferredBarLength:I

    .line 174
    sget v2, Lcom/larswerkman/holocolorpicker/R$styleable;->ColorBars_bar_pointer_radius:I

    sget v3, Lcom/larswerkman/holocolorpicker/R$dimen;->bar_pointer_radius:I

    .line 176
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 174
    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerRadius:I

    .line 177
    sget v2, Lcom/larswerkman/holocolorpicker/R$styleable;->ColorBars_bar_pointer_halo_radius:I

    sget v3, Lcom/larswerkman/holocolorpicker/R$dimen;->bar_pointer_halo_radius:I

    .line 179
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 177
    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    .line 180
    sget v2, Lcom/larswerkman/holocolorpicker/R$styleable;->ColorBars_bar_orientation_horizontal:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mOrientation:Z

    .line 183
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 185
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2, v5}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPaint:Landroid/graphics/Paint;

    .line 186
    iget-object v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPaint:Landroid/graphics/Paint;

    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/SVBar;->shader:Landroid/graphics/Shader;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 188
    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    div-int/lit8 v2, v2, 0x2

    iget v3, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    add-int/2addr v2, v3

    iput v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPosition:I

    .line 190
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2, v5}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloPaint:Landroid/graphics/Paint;

    .line 191
    iget-object v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloPaint:Landroid/graphics/Paint;

    const/high16 v3, -0x1000000

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 192
    iget-object v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloPaint:Landroid/graphics/Paint;

    const/16 v3, 0x50

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 194
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2, v5}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPaint:Landroid/graphics/Paint;

    .line 195
    iget-object v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPaint:Landroid/graphics/Paint;

    const v3, -0x7e0100

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 197
    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    int-to-float v2, v2

    div-float/2addr v2, v7

    div-float v2, v6, v2

    iput v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPosToSVFactor:F

    .line 198
    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    int-to-float v2, v2

    div-float/2addr v2, v7

    div-float/2addr v2, v6

    iput v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mSVToPosFactor:F

    .line 199
    return-void
.end method


# virtual methods
.method public getColor()I
    .registers 2

    .prologue
    .line 488
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 300
    iget-object v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 304
    iget-boolean v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mOrientation:Z

    const/4 v3, 0x1

    if-ne v2, v3, :cond_25

    .line 305
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPosition:I

    .line 306
    .local v0, "cX":I
    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    .line 314
    .local v1, "cY":I
    :goto_10
    int-to-float v2, v0

    int-to-float v3, v1

    iget v4, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    int-to-float v4, v4

    iget-object v5, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 316
    int-to-float v2, v0

    int-to-float v3, v1

    iget v4, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerRadius:I

    int-to-float v4, v4

    iget-object v5, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 317
    return-void

    .line 309
    .end local v0    # "cX":I
    .end local v1    # "cY":I
    :cond_25
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    .line 310
    .restart local v0    # "cX":I
    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPosition:I

    .restart local v1    # "cY":I
    goto :goto_10
.end method

.method protected onMeasure(II)V
    .registers 11
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 203
    iget v6, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPreferredBarLength:I

    iget v7, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    mul-int/lit8 v7, v7, 0x2

    add-int v1, v6, v7

    .line 208
    .local v1, "intrinsicSize":I
    iget-boolean v6, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mOrientation:Z

    const/4 v7, 0x1

    if-ne v6, v7, :cond_2e

    .line 209
    move v5, p1

    .line 214
    .local v5, "measureSpec":I
    :goto_e
    invoke-static {v5}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    .line 215
    .local v3, "lengthMode":I
    invoke-static {v5}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v4

    .line 218
    .local v4, "lengthSize":I
    const/high16 v6, 0x40000000    # 2.0f

    if-ne v3, v6, :cond_30

    .line 219
    move v2, v4

    .line 228
    .local v2, "length":I
    :goto_1b
    iget v6, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    mul-int/lit8 v0, v6, 0x2

    .line 229
    .local v0, "barPointerHaloRadiusx2":I
    sub-int v6, v2, v0

    iput v6, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    .line 230
    iget-boolean v6, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mOrientation:Z

    if-nez v6, :cond_3b

    .line 231
    iget v6, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    add-int/2addr v6, v0

    invoke-virtual {p0, v0, v6}, Lcom/larswerkman/holocolorpicker/SVBar;->setMeasuredDimension(II)V

    .line 238
    :goto_2d
    return-void

    .line 212
    .end local v0    # "barPointerHaloRadiusx2":I
    .end local v2    # "length":I
    .end local v3    # "lengthMode":I
    .end local v4    # "lengthSize":I
    .end local v5    # "measureSpec":I
    :cond_2e
    move v5, p2

    .restart local v5    # "measureSpec":I
    goto :goto_e

    .line 221
    .restart local v3    # "lengthMode":I
    .restart local v4    # "lengthSize":I
    :cond_30
    const/high16 v6, -0x80000000

    if-ne v3, v6, :cond_39

    .line 222
    invoke-static {v1, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    .restart local v2    # "length":I
    goto :goto_1b

    .line 225
    .end local v2    # "length":I
    :cond_39
    move v2, v1

    .restart local v2    # "length":I
    goto :goto_1b

    .line 235
    .restart local v0    # "barPointerHaloRadiusx2":I
    :cond_3b
    iget v6, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    add-int/2addr v6, v0

    invoke-virtual {p0, v6, v0}, Lcom/larswerkman/holocolorpicker/SVBar;->setMeasuredDimension(II)V

    goto :goto_2d
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 524
    move-object v0, p1

    check-cast v0, Landroid/os/Bundle;

    .line 526
    .local v0, "savedState":Landroid/os/Bundle;
    const-string v2, "parent"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    .line 527
    .local v1, "superState":Landroid/os/Parcelable;
    invoke-super {p0, v1}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 529
    const-string v2, "color"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getFloatArray(Ljava/lang/String;)[F

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/larswerkman/holocolorpicker/SVBar;->setColor(I)V

    .line 530
    const-string v2, "saturation"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 531
    const-string v2, "saturation"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v2

    invoke-virtual {p0, v2}, Lcom/larswerkman/holocolorpicker/SVBar;->setSaturation(F)V

    .line 535
    :goto_2a
    return-void

    .line 533
    :cond_2b
    const-string v2, "value"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v2

    invoke-virtual {p0, v2}, Lcom/larswerkman/holocolorpicker/SVBar;->setValue(F)V

    goto :goto_2a
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 8

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 506
    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v2

    .line 508
    .local v2, "superState":Landroid/os/Parcelable;
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 509
    .local v1, "state":Landroid/os/Bundle;
    const-string v3, "parent"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 510
    const-string v3, "color"

    iget-object v4, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mHSVColor:[F

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putFloatArray(Ljava/lang/String;[F)V

    .line 511
    const/4 v3, 0x3

    new-array v0, v3, [F

    .line 512
    .local v0, "hsvColor":[F
    iget v3, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    invoke-static {v3, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 513
    aget v3, v0, v5

    aget v4, v0, v6

    cmpg-float v3, v3, v4

    if-gez v3, :cond_2f

    .line 514
    const-string v3, "saturation"

    aget v4, v0, v5

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 519
    :goto_2e
    return-object v1

    .line 516
    :cond_2f
    const-string v3, "value"

    aget v4, v0, v6

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    goto :goto_2e
.end method

.method protected onSizeChanged(IIII)V
    .registers 16
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 242
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 246
    iget-boolean v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mOrientation:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_b0

    .line 247
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    add-int v9, v0, v1

    .line 248
    .local v9, "x1":I
    iget v10, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarThickness:I

    .line 249
    .local v10, "y1":I
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    mul-int/lit8 v0, v0, 0x2

    sub-int v0, p1, v0

    iput v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    .line 250
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    iget v3, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarThickness:I

    div-int/lit8 v3, v3, 0x2

    sub-int/2addr v2, v3

    int-to-float v2, v2

    iget v3, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    iget v4, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    iget v4, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    iget v5, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarThickness:I

    div-int/lit8 v5, v5, 0x2

    add-int/2addr v4, v5

    int-to-float v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 266
    :goto_36
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/SVBar;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_e0

    .line 267
    new-instance v0, Landroid/graphics/LinearGradient;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    int-to-float v1, v1

    const/4 v2, 0x0

    int-to-float v3, v9

    int-to-float v4, v10

    const/4 v5, 0x3

    new-array v5, v5, [I

    const/4 v6, 0x0

    const/4 v7, -0x1

    aput v7, v5, v6

    const/4 v6, 0x1

    iget-object v7, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mHSVColor:[F

    .line 269
    invoke-static {v7}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v7

    aput v7, v5, v6

    const/4 v6, 0x2

    const/high16 v7, -0x1000000

    aput v7, v5, v6

    const/4 v6, 0x0

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->shader:Landroid/graphics/Shader;

    .line 279
    :goto_61
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->shader:Landroid/graphics/Shader;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 280
    const/high16 v0, 0x3f800000    # 1.0f

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    div-float/2addr v0, v1

    iput v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPosToSVFactor:F

    .line 281
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    const/high16 v1, 0x3f800000    # 1.0f

    div-float/2addr v0, v1

    iput v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mSVToPosFactor:F

    .line 282
    const/4 v0, 0x3

    new-array v8, v0, [F

    .line 283
    .local v8, "hsvColor":[F
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    invoke-static {v0, v8}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 284
    const/4 v0, 0x1

    aget v0, v8, v0

    const/4 v1, 0x2

    aget v1, v8, v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_100

    .line 285
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mSVToPosFactor:F

    const/4 v1, 0x1

    aget v1, v8, v1

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPosition:I

    .line 292
    :goto_a0
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/SVBar;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_af

    .line 293
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    div-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPosition:I

    .line 295
    :cond_af
    return-void

    .line 256
    .end local v8    # "hsvColor":[F
    .end local v9    # "x1":I
    .end local v10    # "y1":I
    :cond_b0
    iget v9, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarThickness:I

    .line 257
    .restart local v9    # "x1":I
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    add-int v10, v0, v1

    .line 258
    .restart local v10    # "y1":I
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    mul-int/lit8 v0, v0, 0x2

    sub-int v0, p2, v0

    iput v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    .line 259
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarThickness:I

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    int-to-float v2, v2

    iget v3, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    iget v4, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarThickness:I

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v3, v4

    int-to-float v3, v3

    iget v4, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    iget v5, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    add-int/2addr v4, v5

    int-to-float v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    goto/16 :goto_36

    .line 272
    :cond_e0
    new-instance v0, Landroid/graphics/LinearGradient;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    int-to-float v1, v1

    const/4 v2, 0x0

    int-to-float v3, v9

    int-to-float v4, v10

    const/4 v5, 0x3

    new-array v5, v5, [I

    fill-array-data v5, :array_11a

    const/4 v6, 0x0

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->shader:Landroid/graphics/Shader;

    .line 276
    const v0, -0x7e0100

    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mHSVColor:[F

    invoke-static {v0, v1}, Landroid/graphics/Color;->colorToHSV(I[F)V

    goto/16 :goto_61

    .line 288
    .restart local v8    # "hsvColor":[F
    :cond_100
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mSVToPosFactor:F

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x2

    aget v2, v8, v2

    sub-float/2addr v1, v2

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    add-float/2addr v0, v1

    .line 289
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPosition:I

    goto :goto_a0

    .line 272
    :array_11a
    .array-data 4
        -0x1
        -0x7e0100
        -0x1000000
    .end array-data
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v3, 0x1

    .line 321
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/SVBar;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    invoke-interface {v1, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 325
    iget-boolean v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mOrientation:Z

    if-ne v1, v3, :cond_18

    .line 326
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 332
    .local v0, "dimen":F
    :goto_10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    packed-switch v1, :pswitch_data_ec

    .line 382
    :cond_17
    :goto_17
    return v3

    .line 329
    .end local v0    # "dimen":F
    :cond_18
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    .restart local v0    # "dimen":F
    goto :goto_10

    .line 334
    :pswitch_1d
    iput-boolean v3, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mIsMovingPointer:Z

    .line 336
    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    int-to-float v1, v1

    cmpl-float v1, v0, v1

    if-ltz v1, :cond_17

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    add-int/2addr v1, v2

    int-to-float v1, v1

    cmpg-float v1, v0, v1

    if-gtz v1, :cond_17

    .line 338
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPosition:I

    .line 339
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-direct {p0, v1}, Lcom/larswerkman/holocolorpicker/SVBar;->calculateColor(I)V

    .line 340
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 341
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/SVBar;->invalidate()V

    goto :goto_17

    .line 345
    :pswitch_48
    iget-boolean v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mIsMovingPointer:Z

    if-eqz v1, :cond_17

    .line 347
    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    int-to-float v1, v1

    cmpl-float v1, v0, v1

    if-ltz v1, :cond_87

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    add-int/2addr v1, v2

    int-to-float v1, v1

    cmpg-float v1, v0, v1

    if-gtz v1, :cond_87

    .line 349
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPosition:I

    .line 350
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-direct {p0, v1}, Lcom/larswerkman/holocolorpicker/SVBar;->calculateColor(I)V

    .line 351
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 352
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    if-eqz v1, :cond_83

    .line 353
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    invoke-virtual {v1, v2}, Lcom/larswerkman/holocolorpicker/ColorPicker;->setNewCenterColor(I)V

    .line 354
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    invoke-virtual {v1, v2}, Lcom/larswerkman/holocolorpicker/ColorPicker;->changeOpacityBarColor(I)V

    .line 356
    :cond_83
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/SVBar;->invalidate()V

    goto :goto_17

    .line 357
    :cond_87
    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    int-to-float v1, v1

    cmpg-float v1, v0, v1

    if-gez v1, :cond_b3

    .line 358
    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    iput v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPosition:I

    .line 359
    const/4 v1, -0x1

    iput v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    .line 360
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 361
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    if-eqz v1, :cond_ae

    .line 362
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    invoke-virtual {v1, v2}, Lcom/larswerkman/holocolorpicker/ColorPicker;->setNewCenterColor(I)V

    .line 363
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    invoke-virtual {v1, v2}, Lcom/larswerkman/holocolorpicker/ColorPicker;->changeOpacityBarColor(I)V

    .line 365
    :cond_ae
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/SVBar;->invalidate()V

    goto/16 :goto_17

    .line 366
    :cond_b3
    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    add-int/2addr v1, v2

    int-to-float v1, v1

    cmpl-float v1, v0, v1

    if-lez v1, :cond_17

    .line 367
    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPosition:I

    .line 368
    const/high16 v1, -0x1000000

    iput v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    .line 369
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 370
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    if-eqz v1, :cond_e1

    .line 371
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    invoke-virtual {v1, v2}, Lcom/larswerkman/holocolorpicker/ColorPicker;->setNewCenterColor(I)V

    .line 372
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v2, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    invoke-virtual {v1, v2}, Lcom/larswerkman/holocolorpicker/ColorPicker;->changeOpacityBarColor(I)V

    .line 374
    :cond_e1
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/SVBar;->invalidate()V

    goto/16 :goto_17

    .line 379
    :pswitch_e6
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mIsMovingPointer:Z

    goto/16 :goto_17

    .line 332
    nop

    :pswitch_data_ec
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_e6
        :pswitch_48
    .end packed-switch
.end method

.method public setColor(I)V
    .registers 12
    .param p1, "color"    # I

    .prologue
    .line 432
    iget-boolean v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mOrientation:Z

    if-eqz v0, :cond_61

    .line 433
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    add-int v8, v0, v1

    .line 434
    .local v8, "x1":I
    iget v9, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarThickness:I

    .line 440
    .local v9, "y1":I
    :goto_c
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mHSVColor:[F

    invoke-static {p1, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 441
    new-instance v0, Landroid/graphics/LinearGradient;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    int-to-float v1, v1

    const/4 v2, 0x0

    int-to-float v3, v8

    int-to-float v4, v9

    const/4 v5, 0x3

    new-array v5, v5, [I

    const/4 v6, 0x0

    const/4 v7, -0x1

    aput v7, v5, v6

    const/4 v6, 0x1

    aput p1, v5, v6

    const/4 v6, 0x2

    const/high16 v7, -0x1000000

    aput v7, v5, v6

    const/4 v6, 0x0

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->shader:Landroid/graphics/Shader;

    .line 444
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->shader:Landroid/graphics/Shader;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 445
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPosition:I

    invoke-direct {p0, v0}, Lcom/larswerkman/holocolorpicker/SVBar;->calculateColor(I)V

    .line 446
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 447
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    if-eqz v0, :cond_5d

    .line 448
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/ColorPicker;->setNewCenterColor(I)V

    .line 449
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    invoke-virtual {v0}, Lcom/larswerkman/holocolorpicker/ColorPicker;->hasOpacityBar()Z

    move-result v0

    if-eqz v0, :cond_5d

    .line 450
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/ColorPicker;->changeOpacityBarColor(I)V

    .line 452
    :cond_5d
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/SVBar;->invalidate()V

    .line 453
    return-void

    .line 436
    .end local v8    # "x1":I
    .end local v9    # "y1":I
    :cond_61
    iget v8, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarThickness:I

    .line 437
    .restart local v8    # "x1":I
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    add-int v9, v0, v1

    .restart local v9    # "y1":I
    goto :goto_c
.end method

.method public setColorPicker(Lcom/larswerkman/holocolorpicker/ColorPicker;)V
    .registers 2
    .param p1, "picker"    # Lcom/larswerkman/holocolorpicker/ColorPicker;

    .prologue
    .line 501
    iput-object p1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    .line 502
    return-void
.end method

.method public setSaturation(F)V
    .registers 4
    .param p1, "saturation"    # F

    .prologue
    .line 391
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mSVToPosFactor:F

    mul-float/2addr v0, p1

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPosition:I

    .line 393
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPosition:I

    invoke-direct {p0, v0}, Lcom/larswerkman/holocolorpicker/SVBar;->calculateColor(I)V

    .line 394
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 397
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    if-eqz v0, :cond_2b

    .line 398
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/ColorPicker;->setNewCenterColor(I)V

    .line 399
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/ColorPicker;->changeOpacityBarColor(I)V

    .line 401
    :cond_2b
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/SVBar;->invalidate()V

    .line 402
    return-void
.end method

.method public setValue(F)V
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 410
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mSVToPosFactor:F

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, p1

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerHaloRadius:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarLength:I

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    add-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPosition:I

    .line 412
    iget v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPosition:I

    invoke-direct {p0, v0}, Lcom/larswerkman/holocolorpicker/SVBar;->calculateColor(I)V

    .line 413
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mBarPointerPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 416
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    if-eqz v0, :cond_34

    .line 417
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/ColorPicker;->setNewCenterColor(I)V

    .line 418
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/SVBar;->mColor:I

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/ColorPicker;->changeOpacityBarColor(I)V

    .line 420
    :cond_34
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/SVBar;->invalidate()V

    .line 421
    return-void
.end method
