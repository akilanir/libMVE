.class public Lcom/larswerkman/holocolorpicker/ValueBar;
.super Landroid/view/View;
.source "ValueBar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/larswerkman/holocolorpicker/ValueBar$OnValueChangedListener;
    }
.end annotation


# static fields
.field private static final ORIENTATION_DEFAULT:Z = true

.field private static final ORIENTATION_HORIZONTAL:Z = true

.field private static final ORIENTATION_VERTICAL:Z = false

.field private static final STATE_COLOR:Ljava/lang/String; = "color"

.field private static final STATE_ORIENTATION:Ljava/lang/String; = "orientation"

.field private static final STATE_PARENT:Ljava/lang/String; = "parent"

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

.field private mPosToSatFactor:F

.field private mPreferredBarLength:I

.field private mSatToPosFactor:F

.field private oldChangedListenerValue:I

.field private onValueChangedListener:Lcom/larswerkman/holocolorpicker/ValueBar$OnValueChangedListener;

.field private shader:Landroid/graphics/Shader;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 171
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 101
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarRect:Landroid/graphics/RectF;

    .line 125
    const/4 v0, 0x3

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mHSVColor:[F

    .line 140
    iput-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    .line 172
    const/4 v0, 0x0

    invoke-direct {p0, v1, v0}, Lcom/larswerkman/holocolorpicker/ValueBar;->init(Landroid/util/AttributeSet;I)V

    .line 173
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 176
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 101
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarRect:Landroid/graphics/RectF;

    .line 125
    const/4 v0, 0x3

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mHSVColor:[F

    .line 140
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    .line 177
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Lcom/larswerkman/holocolorpicker/ValueBar;->init(Landroid/util/AttributeSet;I)V

    .line 178
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 181
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 101
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarRect:Landroid/graphics/RectF;

    .line 125
    const/4 v0, 0x3

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mHSVColor:[F

    .line 140
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    .line 182
    invoke-direct {p0, p2, p3}, Lcom/larswerkman/holocolorpicker/ValueBar;->init(Landroid/util/AttributeSet;I)V

    .line 183
    return-void
.end method

.method private calculateColor(I)V
    .registers 7
    .param p1, "coord"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 466
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    sub-int/2addr p1, v0

    .line 467
    if-gez p1, :cond_28

    .line 468
    const/4 p1, 0x0

    .line 472
    :cond_8
    :goto_8
    const/4 v0, 0x3

    new-array v0, v0, [F

    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mHSVColor:[F

    aget v1, v1, v2

    aput v1, v0, v2

    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mHSVColor:[F

    aget v1, v1, v3

    aput v1, v0, v3

    const/4 v1, 0x2

    const/high16 v2, 0x3f800000    # 1.0f

    iget v3, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPosToSatFactor:F

    int-to-float v4, p1

    mul-float/2addr v3, v4

    sub-float/2addr v2, v3

    aput v2, v0, v1

    invoke-static {v0}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v0

    iput v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    .line 475
    return-void

    .line 469
    :cond_28
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    if-le p1, v0, :cond_8

    .line 470
    iget p1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    goto :goto_8
.end method

.method private init(Landroid/util/AttributeSet;I)V
    .registers 10
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyle"    # I

    .prologue
    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v5, 0x1

    .line 186
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ValueBar;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Lcom/larswerkman/holocolorpicker/R$styleable;->ColorBars:[I

    const/4 v4, 0x0

    invoke-virtual {v2, p1, v3, p2, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 188
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ValueBar;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 190
    .local v1, "b":Landroid/content/res/Resources;
    sget v2, Lcom/larswerkman/holocolorpicker/R$styleable;->ColorBars_bar_thickness:I

    sget v3, Lcom/larswerkman/holocolorpicker/R$dimen;->bar_thickness:I

    .line 192
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 190
    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarThickness:I

    .line 193
    sget v2, Lcom/larswerkman/holocolorpicker/R$styleable;->ColorBars_bar_length:I

    sget v3, Lcom/larswerkman/holocolorpicker/R$dimen;->bar_length:I

    .line 194
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 193
    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    .line 195
    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    iput v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPreferredBarLength:I

    .line 196
    sget v2, Lcom/larswerkman/holocolorpicker/R$styleable;->ColorBars_bar_pointer_radius:I

    sget v3, Lcom/larswerkman/holocolorpicker/R$dimen;->bar_pointer_radius:I

    .line 198
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 196
    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerRadius:I

    .line 199
    sget v2, Lcom/larswerkman/holocolorpicker/R$styleable;->ColorBars_bar_pointer_halo_radius:I

    sget v3, Lcom/larswerkman/holocolorpicker/R$dimen;->bar_pointer_halo_radius:I

    .line 201
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 199
    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    .line 202
    sget v2, Lcom/larswerkman/holocolorpicker/R$styleable;->ColorBars_bar_orientation_horizontal:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mOrientation:Z

    .line 205
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 207
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2, v5}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPaint:Landroid/graphics/Paint;

    .line 208
    iget-object v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPaint:Landroid/graphics/Paint;

    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->shader:Landroid/graphics/Shader;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 210
    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    iput v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerPosition:I

    .line 212
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2, v5}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloPaint:Landroid/graphics/Paint;

    .line 213
    iget-object v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloPaint:Landroid/graphics/Paint;

    const/high16 v3, -0x1000000

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 214
    iget-object v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloPaint:Landroid/graphics/Paint;

    const/16 v3, 0x50

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 216
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2, v5}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerPaint:Landroid/graphics/Paint;

    .line 217
    iget-object v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerPaint:Landroid/graphics/Paint;

    const v3, -0x7e0100

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 219
    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    int-to-float v2, v2

    div-float v2, v6, v2

    iput v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPosToSatFactor:F

    .line 220
    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    int-to-float v2, v2

    div-float/2addr v2, v6

    iput v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mSatToPosFactor:F

    .line 221
    return-void
.end method


# virtual methods
.method public getColor()I
    .registers 2

    .prologue
    .line 483
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    return v0
.end method

.method public getOnValueChangedListener()Lcom/larswerkman/holocolorpicker/ValueBar$OnValueChangedListener;
    .registers 2

    .prologue
    .line 167
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->onValueChangedListener:Lcom/larswerkman/holocolorpicker/ValueBar$OnValueChangedListener;

    return-object v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 320
    iget-object v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 324
    iget-boolean v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mOrientation:Z

    const/4 v3, 0x1

    if-ne v2, v3, :cond_25

    .line 325
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerPosition:I

    .line 326
    .local v0, "cX":I
    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    .line 334
    .local v1, "cY":I
    :goto_10
    int-to-float v2, v0

    int-to-float v3, v1

    iget v4, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    int-to-float v4, v4

    iget-object v5, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 336
    int-to-float v2, v0

    int-to-float v3, v1

    iget v4, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerRadius:I

    int-to-float v4, v4

    iget-object v5, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 337
    return-void

    .line 329
    .end local v0    # "cX":I
    .end local v1    # "cY":I
    :cond_25
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    .line 330
    .restart local v0    # "cX":I
    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerPosition:I

    .restart local v1    # "cY":I
    goto :goto_10
.end method

.method protected onMeasure(II)V
    .registers 11
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 225
    iget v6, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPreferredBarLength:I

    iget v7, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    mul-int/lit8 v7, v7, 0x2

    add-int v1, v6, v7

    .line 230
    .local v1, "intrinsicSize":I
    iget-boolean v6, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mOrientation:Z

    const/4 v7, 0x1

    if-ne v6, v7, :cond_2e

    .line 231
    move v5, p1

    .line 236
    .local v5, "measureSpec":I
    :goto_e
    invoke-static {v5}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    .line 237
    .local v3, "lengthMode":I
    invoke-static {v5}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v4

    .line 240
    .local v4, "lengthSize":I
    const/high16 v6, 0x40000000    # 2.0f

    if-ne v3, v6, :cond_30

    .line 241
    move v2, v4

    .line 250
    .local v2, "length":I
    :goto_1b
    iget v6, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    mul-int/lit8 v0, v6, 0x2

    .line 251
    .local v0, "barPointerHaloRadiusx2":I
    sub-int v6, v2, v0

    iput v6, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    .line 252
    iget-boolean v6, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mOrientation:Z

    if-nez v6, :cond_3b

    .line 253
    iget v6, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    add-int/2addr v6, v0

    invoke-virtual {p0, v0, v6}, Lcom/larswerkman/holocolorpicker/ValueBar;->setMeasuredDimension(II)V

    .line 260
    :goto_2d
    return-void

    .line 234
    .end local v0    # "barPointerHaloRadiusx2":I
    .end local v2    # "length":I
    .end local v3    # "lengthMode":I
    .end local v4    # "lengthSize":I
    .end local v5    # "measureSpec":I
    :cond_2e
    move v5, p2

    .restart local v5    # "measureSpec":I
    goto :goto_e

    .line 243
    .restart local v3    # "lengthMode":I
    .restart local v4    # "lengthSize":I
    :cond_30
    const/high16 v6, -0x80000000

    if-ne v3, v6, :cond_39

    .line 244
    invoke-static {v1, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    .restart local v2    # "length":I
    goto :goto_1b

    .line 247
    .end local v2    # "length":I
    :cond_39
    move v2, v1

    .restart local v2    # "length":I
    goto :goto_1b

    .line 257
    .restart local v0    # "barPointerHaloRadiusx2":I
    :cond_3b
    iget v6, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    add-int/2addr v6, v0

    invoke-virtual {p0, v6, v0}, Lcom/larswerkman/holocolorpicker/ValueBar;->setMeasuredDimension(II)V

    goto :goto_2d
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 516
    move-object v0, p1

    check-cast v0, Landroid/os/Bundle;

    .line 518
    .local v0, "savedState":Landroid/os/Bundle;
    const-string v2, "parent"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    .line 519
    .local v1, "superState":Landroid/os/Parcelable;
    invoke-super {p0, v1}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 521
    const-string v2, "color"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getFloatArray(Ljava/lang/String;)[F

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/larswerkman/holocolorpicker/ValueBar;->setColor(I)V

    .line 522
    const-string v2, "value"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v2

    invoke-virtual {p0, v2}, Lcom/larswerkman/holocolorpicker/ValueBar;->setValue(F)V

    .line 523
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 6

    .prologue
    .line 501
    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v2

    .line 503
    .local v2, "superState":Landroid/os/Parcelable;
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 504
    .local v1, "state":Landroid/os/Bundle;
    const-string v3, "parent"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 505
    const-string v3, "color"

    iget-object v4, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mHSVColor:[F

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putFloatArray(Ljava/lang/String;[F)V

    .line 507
    const/4 v3, 0x3

    new-array v0, v3, [F

    .line 508
    .local v0, "hsvColor":[F
    iget v3, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    invoke-static {v3, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 509
    const-string v3, "value"

    const/4 v4, 0x2

    aget v4, v0, v4

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 511
    return-object v1
.end method

.method protected onSizeChanged(IIII)V
    .registers 17
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 264
    invoke-super/range {p0 .. p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 268
    iget-boolean v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mOrientation:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_99

    .line 269
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    add-int v9, v0, v1

    .line 270
    .local v9, "x1":I
    iget v10, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarThickness:I

    .line 271
    .local v10, "y1":I
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    mul-int/lit8 v0, v0, 0x2

    sub-int v0, p1, v0

    iput v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    .line 272
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    iget v3, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarThickness:I

    div-int/lit8 v3, v3, 0x2

    sub-int/2addr v2, v3

    int-to-float v2, v2

    iget v3, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    iget v4, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    iget v4, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    iget v5, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarThickness:I

    div-int/lit8 v5, v5, 0x2

    add-int/2addr v4, v5

    int-to-float v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 288
    :goto_36
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ValueBar;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_c9

    .line 289
    new-instance v0, Landroid/graphics/LinearGradient;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    int-to-float v1, v1

    const/4 v2, 0x0

    int-to-float v3, v9

    int-to-float v4, v10

    const/4 v5, 0x2

    new-array v5, v5, [I

    const/4 v6, 0x0

    const/16 v7, 0xff

    iget-object v11, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mHSVColor:[F

    .line 291
    invoke-static {v7, v11}, Landroid/graphics/Color;->HSVToColor(I[F)I

    move-result v7

    aput v7, v5, v6

    const/4 v6, 0x1

    const/high16 v7, -0x1000000

    aput v7, v5, v6

    const/4 v6, 0x0

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->shader:Landroid/graphics/Shader;

    .line 301
    :goto_5f
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->shader:Landroid/graphics/Shader;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 302
    const/high16 v0, 0x3f800000    # 1.0f

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPosToSatFactor:F

    .line 303
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    int-to-float v0, v0

    const/high16 v1, 0x3f800000    # 1.0f

    div-float/2addr v0, v1

    iput v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mSatToPosFactor:F

    .line 305
    const/4 v0, 0x3

    new-array v8, v0, [F

    .line 306
    .local v8, "hsvColor":[F
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    invoke-static {v0, v8}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 308
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ValueBar;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_e9

    .line 309
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    int-to-float v0, v0

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mSatToPosFactor:F

    const/4 v2, 0x2

    aget v2, v8, v2

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    .line 310
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerPosition:I

    .line 315
    :goto_98
    return-void

    .line 278
    .end local v8    # "hsvColor":[F
    .end local v9    # "x1":I
    .end local v10    # "y1":I
    :cond_99
    iget v9, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarThickness:I

    .line 279
    .restart local v9    # "x1":I
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    add-int v10, v0, v1

    .line 280
    .restart local v10    # "y1":I
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    mul-int/lit8 v0, v0, 0x2

    sub-int v0, p2, v0

    iput v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    .line 281
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarThickness:I

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    int-to-float v2, v2

    iget v3, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    iget v4, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarThickness:I

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v3, v4

    int-to-float v3, v3

    iget v4, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    iget v5, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    add-int/2addr v4, v5

    int-to-float v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    goto/16 :goto_36

    .line 294
    :cond_c9
    new-instance v0, Landroid/graphics/LinearGradient;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    int-to-float v1, v1

    const/4 v2, 0x0

    int-to-float v3, v9

    int-to-float v4, v10

    const/4 v5, 0x2

    new-array v5, v5, [I

    fill-array-data v5, :array_ee

    const/4 v6, 0x0

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->shader:Landroid/graphics/Shader;

    .line 298
    const v0, -0x7e0100

    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mHSVColor:[F

    invoke-static {v0, v1}, Landroid/graphics/Color;->colorToHSV(I[F)V

    goto/16 :goto_5f

    .line 313
    .restart local v8    # "hsvColor":[F
    :cond_e9
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    iput v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerPosition:I

    goto :goto_98

    .line 294
    :array_ee
    .array-data 4
        -0x7e0100
        -0x1000000
    .end array-data
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v3, 0x1

    .line 341
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ValueBar;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    invoke-interface {v1, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 345
    iget-boolean v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mOrientation:Z

    if-ne v1, v3, :cond_18

    .line 346
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 352
    .local v0, "dimen":F
    :goto_10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    packed-switch v1, :pswitch_data_104

    .line 406
    :cond_17
    :goto_17
    return v3

    .line 349
    .end local v0    # "dimen":F
    :cond_18
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    .restart local v0    # "dimen":F
    goto :goto_10

    .line 354
    :pswitch_1d
    iput-boolean v3, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mIsMovingPointer:Z

    .line 356
    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    int-to-float v1, v1

    cmpl-float v1, v0, v1

    if-ltz v1, :cond_17

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    add-int/2addr v1, v2

    int-to-float v1, v1

    cmpg-float v1, v0, v1

    if-gtz v1, :cond_17

    .line 358
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerPosition:I

    .line 359
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-direct {p0, v1}, Lcom/larswerkman/holocolorpicker/ValueBar;->calculateColor(I)V

    .line 360
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 361
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ValueBar;->invalidate()V

    goto :goto_17

    .line 365
    :pswitch_48
    iget-boolean v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mIsMovingPointer:Z

    if-eqz v1, :cond_86

    .line 367
    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    int-to-float v1, v1

    cmpl-float v1, v0, v1

    if-ltz v1, :cond_9d

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    add-int/2addr v1, v2

    int-to-float v1, v1

    cmpg-float v1, v0, v1

    if-gtz v1, :cond_9d

    .line 369
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerPosition:I

    .line 370
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-direct {p0, v1}, Lcom/larswerkman/holocolorpicker/ValueBar;->calculateColor(I)V

    .line 371
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 372
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    if-eqz v1, :cond_83

    .line 373
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    invoke-virtual {v1, v2}, Lcom/larswerkman/holocolorpicker/ColorPicker;->setNewCenterColor(I)V

    .line 374
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    invoke-virtual {v1, v2}, Lcom/larswerkman/holocolorpicker/ColorPicker;->changeOpacityBarColor(I)V

    .line 376
    :cond_83
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ValueBar;->invalidate()V

    .line 397
    :cond_86
    :goto_86
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->onValueChangedListener:Lcom/larswerkman/holocolorpicker/ValueBar$OnValueChangedListener;

    if-eqz v1, :cond_17

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->oldChangedListenerValue:I

    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    if-eq v1, v2, :cond_17

    .line 398
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->onValueChangedListener:Lcom/larswerkman/holocolorpicker/ValueBar$OnValueChangedListener;

    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    invoke-interface {v1, v2}, Lcom/larswerkman/holocolorpicker/ValueBar$OnValueChangedListener;->onValueChanged(I)V

    .line 399
    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    iput v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->oldChangedListenerValue:I

    goto/16 :goto_17

    .line 377
    :cond_9d
    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    int-to-float v1, v1

    cmpg-float v1, v0, v1

    if-gez v1, :cond_cd

    .line 378
    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    iput v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerPosition:I

    .line 379
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mHSVColor:[F

    invoke-static {v1}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v1

    iput v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    .line 380
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 381
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    if-eqz v1, :cond_c9

    .line 382
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    invoke-virtual {v1, v2}, Lcom/larswerkman/holocolorpicker/ColorPicker;->setNewCenterColor(I)V

    .line 383
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    invoke-virtual {v1, v2}, Lcom/larswerkman/holocolorpicker/ColorPicker;->changeOpacityBarColor(I)V

    .line 385
    :cond_c9
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ValueBar;->invalidate()V

    goto :goto_86

    .line 386
    :cond_cd
    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    add-int/2addr v1, v2

    int-to-float v1, v1

    cmpl-float v1, v0, v1

    if-lez v1, :cond_86

    .line 387
    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerPosition:I

    .line 388
    const/high16 v1, -0x1000000

    iput v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    .line 389
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 390
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    if-eqz v1, :cond_fb

    .line 391
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    invoke-virtual {v1, v2}, Lcom/larswerkman/holocolorpicker/ColorPicker;->setNewCenterColor(I)V

    .line 392
    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v2, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    invoke-virtual {v1, v2}, Lcom/larswerkman/holocolorpicker/ColorPicker;->changeOpacityBarColor(I)V

    .line 394
    :cond_fb
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ValueBar;->invalidate()V

    goto :goto_86

    .line 403
    :pswitch_ff
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mIsMovingPointer:Z

    goto/16 :goto_17

    .line 352
    :pswitch_data_104
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_ff
        :pswitch_48
    .end packed-switch
.end method

.method public setColor(I)V
    .registers 12
    .param p1, "color"    # I

    .prologue
    const/4 v7, 0x1

    .line 418
    iget-boolean v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mOrientation:Z

    if-ne v0, v7, :cond_5d

    .line 419
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    add-int v8, v0, v1

    .line 420
    .local v8, "x1":I
    iget v9, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarThickness:I

    .line 427
    .local v9, "y1":I
    :goto_d
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mHSVColor:[F

    invoke-static {p1, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 428
    new-instance v0, Landroid/graphics/LinearGradient;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    int-to-float v1, v1

    const/4 v2, 0x0

    int-to-float v3, v8

    int-to-float v4, v9

    const/4 v5, 0x2

    new-array v5, v5, [I

    const/4 v6, 0x0

    aput p1, v5, v6

    const/high16 v6, -0x1000000

    aput v6, v5, v7

    const/4 v6, 0x0

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    iput-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->shader:Landroid/graphics/Shader;

    .line 431
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->shader:Landroid/graphics/Shader;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 432
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerPosition:I

    invoke-direct {p0, v0}, Lcom/larswerkman/holocolorpicker/ValueBar;->calculateColor(I)V

    .line 433
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 434
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    if-eqz v0, :cond_59

    .line 435
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/ColorPicker;->setNewCenterColor(I)V

    .line 436
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    invoke-virtual {v0}, Lcom/larswerkman/holocolorpicker/ColorPicker;->hasOpacityBar()Z

    move-result v0

    if-eqz v0, :cond_59

    .line 437
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/ColorPicker;->changeOpacityBarColor(I)V

    .line 439
    :cond_59
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ValueBar;->invalidate()V

    .line 440
    return-void

    .line 423
    .end local v8    # "x1":I
    .end local v9    # "y1":I
    :cond_5d
    iget v8, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarThickness:I

    .line 424
    .restart local v8    # "x1":I
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    add-int v9, v0, v1

    .restart local v9    # "y1":I
    goto :goto_d
.end method

.method public setColorPicker(Lcom/larswerkman/holocolorpicker/ColorPicker;)V
    .registers 2
    .param p1, "picker"    # Lcom/larswerkman/holocolorpicker/ColorPicker;

    .prologue
    .line 496
    iput-object p1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    .line 497
    return-void
.end method

.method public setOnValueChangedListener(Lcom/larswerkman/holocolorpicker/ValueBar$OnValueChangedListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/larswerkman/holocolorpicker/ValueBar$OnValueChangedListener;

    .prologue
    .line 163
    iput-object p1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->onValueChangedListener:Lcom/larswerkman/holocolorpicker/ValueBar$OnValueChangedListener;

    .line 164
    return-void
.end method

.method public setValue(F)V
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 448
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarLength:I

    int-to-float v0, v0

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mSatToPosFactor:F

    mul-float/2addr v1, p1

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerHaloRadius:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    .line 449
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerPosition:I

    .line 451
    iget v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerPosition:I

    invoke-direct {p0, v0}, Lcom/larswerkman/holocolorpicker/ValueBar;->calculateColor(I)V

    .line 452
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mBarPointerPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 453
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    if-eqz v0, :cond_2f

    .line 454
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/ColorPicker;->setNewCenterColor(I)V

    .line 455
    iget-object v0, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mPicker:Lcom/larswerkman/holocolorpicker/ColorPicker;

    iget v1, p0, Lcom/larswerkman/holocolorpicker/ValueBar;->mColor:I

    invoke-virtual {v0, v1}, Lcom/larswerkman/holocolorpicker/ColorPicker;->changeOpacityBarColor(I)V

    .line 457
    :cond_2f
    invoke-virtual {p0}, Lcom/larswerkman/holocolorpicker/ValueBar;->invalidate()V

    .line 458
    return-void
.end method
