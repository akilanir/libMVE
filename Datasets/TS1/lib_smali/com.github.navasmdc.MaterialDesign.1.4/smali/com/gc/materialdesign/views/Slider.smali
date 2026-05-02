.class public Lcom/gc/materialdesign/views/Slider;
.super Lcom/gc/materialdesign/views/CustomView;
.source "Slider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gc/materialdesign/views/Slider$Indicator;,
        Lcom/gc/materialdesign/views/Slider$NumberIndicator;,
        Lcom/gc/materialdesign/views/Slider$Ball;,
        Lcom/gc/materialdesign/views/Slider$OnValueChangedListener;
    }
.end annotation


# instance fields
.field backgroundColor:I

.field ball:Lcom/gc/materialdesign/views/Slider$Ball;

.field max:I

.field min:I

.field numberIndicator:Lcom/gc/materialdesign/views/Slider$NumberIndicator;

.field onValueChangedListener:Lcom/gc/materialdesign/views/Slider$OnValueChangedListener;

.field placedBall:Z

.field press:Z

.field showNumberIndicator:Z

.field value:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x0

    .line 48
    invoke-direct {p0, p1, p2}, Lcom/gc/materialdesign/views/CustomView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 33
    const-string v0, "#4CAF50"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/gc/materialdesign/views/Slider;->backgroundColor:I

    .line 38
    iput-boolean v1, p0, Lcom/gc/materialdesign/views/Slider;->showNumberIndicator:Z

    .line 39
    iput-boolean v1, p0, Lcom/gc/materialdesign/views/Slider;->press:Z

    .line 41
    iput v1, p0, Lcom/gc/materialdesign/views/Slider;->value:I

    .line 42
    const/16 v0, 0x64

    iput v0, p0, Lcom/gc/materialdesign/views/Slider;->max:I

    .line 43
    iput v1, p0, Lcom/gc/materialdesign/views/Slider;->min:I

    .line 304
    iput-boolean v1, p0, Lcom/gc/materialdesign/views/Slider;->placedBall:Z

    .line 49
    invoke-virtual {p0, p2}, Lcom/gc/materialdesign/views/Slider;->setAttributes(Landroid/util/AttributeSet;)V

    .line 50
    return-void
.end method

.method private placeBall()V
    .registers 4

    .prologue
    .line 230
    iget-object v0, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    iget-object v2, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-virtual {v2}, Lcom/gc/materialdesign/views/Slider$Ball;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    invoke-static {v0, v1}, Lcom/nineoldandroids/view/ViewHelper;->setX(Landroid/view/View;F)V

    .line 231
    iget-object v0, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    iget-object v1, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-static {v1}, Lcom/nineoldandroids/view/ViewHelper;->getX(Landroid/view/View;)F

    move-result v1

    iput v1, v0, Lcom/gc/materialdesign/views/Slider$Ball;->xIni:F

    .line 232
    iget-object v0, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-virtual {v2}, Lcom/gc/materialdesign/views/Slider$Ball;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    iput v1, v0, Lcom/gc/materialdesign/views/Slider$Ball;->xFin:F

    .line 233
    iget-object v0, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    iget-object v2, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-virtual {v2}, Lcom/gc/materialdesign/views/Slider$Ball;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    iput v1, v0, Lcom/gc/materialdesign/views/Slider$Ball;->xCen:F

    .line 234
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/gc/materialdesign/views/Slider;->placedBall:Z

    .line 235
    return-void
.end method


# virtual methods
.method public getMax()I
    .registers 2

    .prologue
    .line 272
    iget v0, p0, Lcom/gc/materialdesign/views/Slider;->max:I

    return v0
.end method

.method public getMin()I
    .registers 2

    .prologue
    .line 280
    iget v0, p0, Lcom/gc/materialdesign/views/Slider;->min:I

    return v0
.end method

.method public getOnValueChangedListener()Lcom/gc/materialdesign/views/Slider$OnValueChangedListener;
    .registers 2

    .prologue
    .line 240
    iget-object v0, p0, Lcom/gc/materialdesign/views/Slider;->onValueChangedListener:Lcom/gc/materialdesign/views/Slider$OnValueChangedListener;

    return-object v0
.end method

.method public getValue()I
    .registers 2

    .prologue
    .line 249
    iget v0, p0, Lcom/gc/materialdesign/views/Slider;->value:I

    return v0
.end method

.method public invalidate()V
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-virtual {v0}, Lcom/gc/materialdesign/views/Slider$Ball;->invalidate()V

    .line 98
    invoke-super {p0}, Lcom/gc/materialdesign/views/CustomView;->invalidate()V

    .line 99
    return-void
.end method

.method public isShowNumberIndicator()Z
    .registers 2

    .prologue
    .line 288
    iget-boolean v0, p0, Lcom/gc/materialdesign/views/Slider;->showNumberIndicator:Z

    return v0
.end method

.method protected makePressColor()I
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 220
    iget v4, p0, Lcom/gc/materialdesign/views/Slider;->backgroundColor:I

    shr-int/lit8 v4, v4, 0x10

    and-int/lit16 v2, v4, 0xff

    .line 221
    .local v2, "r":I
    iget v4, p0, Lcom/gc/materialdesign/views/Slider;->backgroundColor:I

    shr-int/lit8 v4, v4, 0x8

    and-int/lit16 v1, v4, 0xff

    .line 222
    .local v1, "g":I
    iget v4, p0, Lcom/gc/materialdesign/views/Slider;->backgroundColor:I

    shr-int/lit8 v4, v4, 0x0

    and-int/lit16 v0, v4, 0xff

    .line 223
    .local v0, "b":I
    add-int/lit8 v4, v2, -0x1e

    if-gez v4, :cond_29

    move v2, v3

    .line 224
    :goto_18
    add-int/lit8 v4, v1, -0x1e

    if-gez v4, :cond_2c

    move v1, v3

    .line 225
    :goto_1d
    add-int/lit8 v4, v0, -0x1e

    if-gez v4, :cond_2f

    move v0, v3

    .line 226
    :goto_22
    const/16 v3, 0x46

    invoke-static {v3, v2, v1, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result v3

    return v3

    .line 223
    :cond_29
    add-int/lit8 v2, v2, -0x1e

    goto :goto_18

    .line 224
    :cond_2c
    add-int/lit8 v1, v1, -0x1e

    goto :goto_1d

    .line 225
    :cond_2f
    add-int/lit8 v0, v0, -0x1e

    goto :goto_22
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 19
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 103
    invoke-super/range {p0 .. p1}, Lcom/gc/materialdesign/views/CustomView;->onDraw(Landroid/graphics/Canvas;)V

    .line 104
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/gc/materialdesign/views/Slider;->placedBall:Z

    if-nez v2, :cond_c

    .line 105
    invoke-direct/range {p0 .. p0}, Lcom/gc/materialdesign/views/Slider;->placeBall()V

    .line 107
    :cond_c
    move-object/from16 v0, p0

    iget v2, v0, Lcom/gc/materialdesign/views/Slider;->value:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/gc/materialdesign/views/Slider;->min:I

    if-ne v2, v3, :cond_10f

    .line 109
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v3

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v13

    .line 111
    .local v13, "bitmap":Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v13}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 112
    .local v1, "temp":Landroid/graphics/Canvas;
    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    .line 113
    .local v6, "paint":Landroid/graphics/Paint;
    const-string v2, "#B0B0B0"

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v6, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 114
    const/high16 v2, 0x40000000    # 2.0f

    invoke-virtual/range {p0 .. p0}, Lcom/gc/materialdesign/views/Slider;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v6, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 115
    invoke-virtual/range {p0 .. p0}, Lcom/gc/materialdesign/views/Slider;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    invoke-virtual/range {p0 .. p0}, Lcom/gc/materialdesign/views/Slider;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    invoke-virtual/range {p0 .. p0}, Lcom/gc/materialdesign/views/Slider;->getWidth()I

    move-result v4

    invoke-virtual/range {p0 .. p0}, Lcom/gc/materialdesign/views/Slider;->getHeight()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    sub-int/2addr v4, v5

    int-to-float v4, v4

    invoke-virtual/range {p0 .. p0}, Lcom/gc/materialdesign/views/Slider;->getHeight()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 117
    new-instance v15, Landroid/graphics/Paint;

    invoke-direct {v15}, Landroid/graphics/Paint;-><init>()V

    .line 118
    .local v15, "transparentPaint":Landroid/graphics/Paint;
    invoke-virtual/range {p0 .. p0}, Lcom/gc/materialdesign/views/Slider;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x106000d

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v15, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 120
    new-instance v2, Landroid/graphics/PorterDuffXfermode;

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v2, v3}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v15, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 122
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-static {v2}, Lcom/nineoldandroids/view/ViewHelper;->getX(Landroid/view/View;)F

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-virtual {v3}, Lcom/gc/materialdesign/views/Slider$Ball;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    add-float/2addr v2, v3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-static {v3}, Lcom/nineoldandroids/view/ViewHelper;->getY(Landroid/view/View;)F

    move-result v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-virtual {v4}, Lcom/gc/materialdesign/views/Slider$Ball;->getHeight()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    add-float/2addr v3, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-virtual {v4}, Lcom/gc/materialdesign/views/Slider$Ball;->getWidth()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    invoke-virtual {v1, v2, v3, v4, v15}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 126
    const/4 v2, 0x0

    const/4 v3, 0x0

    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v2, v3, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 141
    .end local v1    # "temp":Landroid/graphics/Canvas;
    .end local v13    # "bitmap":Landroid/graphics/Bitmap;
    .end local v15    # "transparentPaint":Landroid/graphics/Paint;
    :goto_c8
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/gc/materialdesign/views/Slider;->press:Z

    if-eqz v2, :cond_10b

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/gc/materialdesign/views/Slider;->showNumberIndicator:Z

    if-nez v2, :cond_10b

    .line 142
    new-instance v6, Landroid/graphics/Paint;

    .end local v6    # "paint":Landroid/graphics/Paint;
    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    .line 143
    .restart local v6    # "paint":Landroid/graphics/Paint;
    move-object/from16 v0, p0

    iget v2, v0, Lcom/gc/materialdesign/views/Slider;->backgroundColor:I

    invoke-virtual {v6, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 144
    const/4 v2, 0x1

    invoke-virtual {v6, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 145
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-static {v2}, Lcom/nineoldandroids/view/ViewHelper;->getX(Landroid/view/View;)F

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-virtual {v3}, Lcom/gc/materialdesign/views/Slider$Ball;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    add-float/2addr v2, v3

    invoke-virtual/range {p0 .. p0}, Lcom/gc/materialdesign/views/Slider;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    invoke-virtual/range {p0 .. p0}, Lcom/gc/materialdesign/views/Slider;->getHeight()I

    move-result v4

    div-int/lit8 v4, v4, 0x3

    int-to-float v4, v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 148
    :cond_10b
    invoke-virtual/range {p0 .. p0}, Lcom/gc/materialdesign/views/Slider;->invalidate()V

    .line 150
    return-void

    .line 128
    .end local v6    # "paint":Landroid/graphics/Paint;
    :cond_10f
    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    .line 129
    .restart local v6    # "paint":Landroid/graphics/Paint;
    const-string v2, "#B0B0B0"

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v6, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 130
    const/high16 v2, 0x40000000    # 2.0f

    invoke-virtual/range {p0 .. p0}, Lcom/gc/materialdesign/views/Slider;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v6, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 131
    invoke-virtual/range {p0 .. p0}, Lcom/gc/materialdesign/views/Slider;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v8, v2

    invoke-virtual/range {p0 .. p0}, Lcom/gc/materialdesign/views/Slider;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v9, v2

    invoke-virtual/range {p0 .. p0}, Lcom/gc/materialdesign/views/Slider;->getWidth()I

    move-result v2

    invoke-virtual/range {p0 .. p0}, Lcom/gc/materialdesign/views/Slider;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    sub-int/2addr v2, v3

    int-to-float v10, v2

    invoke-virtual/range {p0 .. p0}, Lcom/gc/materialdesign/views/Slider;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v11, v2

    move-object/from16 v7, p1

    move-object v12, v6

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 133
    move-object/from16 v0, p0

    iget v2, v0, Lcom/gc/materialdesign/views/Slider;->backgroundColor:I

    invoke-virtual {v6, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 134
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    iget v2, v2, Lcom/gc/materialdesign/views/Slider$Ball;->xFin:F

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    iget v3, v3, Lcom/gc/materialdesign/views/Slider$Ball;->xIni:F

    sub-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/gc/materialdesign/views/Slider;->max:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/gc/materialdesign/views/Slider;->min:I

    sub-int/2addr v3, v4

    int-to-float v3, v3

    div-float v14, v2, v3

    .line 135
    .local v14, "division":F
    move-object/from16 v0, p0

    iget v2, v0, Lcom/gc/materialdesign/views/Slider;->value:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/gc/materialdesign/views/Slider;->min:I

    sub-int v16, v2, v3

    .line 136
    .local v16, "value":I
    invoke-virtual/range {p0 .. p0}, Lcom/gc/materialdesign/views/Slider;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v8, v2

    invoke-virtual/range {p0 .. p0}, Lcom/gc/materialdesign/views/Slider;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v9, v2

    move/from16 v0, v16

    int-to-float v2, v0

    mul-float/2addr v2, v14

    invoke-virtual/range {p0 .. p0}, Lcom/gc/materialdesign/views/Slider;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    add-float v10, v2, v3

    invoke-virtual/range {p0 .. p0}, Lcom/gc/materialdesign/views/Slider;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v11, v2

    move-object/from16 v7, p1

    move-object v12, v6

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_c8
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 9
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 154
    iput-boolean v6, p0, Lcom/gc/materialdesign/views/Slider;->isLastTouch:Z

    .line 155
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_c7

    .line 156
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    if-eqz v3, :cond_17

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_f6

    .line 158
    :cond_17
    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->numberIndicator:Lcom/gc/materialdesign/views/Slider$NumberIndicator;

    if-eqz v3, :cond_28

    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->numberIndicator:Lcom/gc/materialdesign/views/Slider$NumberIndicator;

    invoke-virtual {v3}, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->isShowing()Z

    move-result v3

    if-nez v3, :cond_28

    .line 160
    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->numberIndicator:Lcom/gc/materialdesign/views/Slider$NumberIndicator;

    invoke-virtual {v3}, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->show()V

    .line 161
    :cond_28
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider;->getWidth()I

    move-result v4

    int-to-float v4, v4

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_e8

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    const/4 v4, 0x0

    cmpl-float v3, v3, v4

    if-ltz v3, :cond_e8

    .line 162
    iput-boolean v6, p0, Lcom/gc/materialdesign/views/Slider;->press:Z

    .line 164
    const/4 v1, 0x0

    .line 165
    .local v1, "newValue":I
    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    iget v3, v3, Lcom/gc/materialdesign/views/Slider$Ball;->xFin:F

    iget-object v4, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    iget v4, v4, Lcom/gc/materialdesign/views/Slider$Ball;->xIni:F

    sub-float/2addr v3, v4

    iget v4, p0, Lcom/gc/materialdesign/views/Slider;->max:I

    iget v5, p0, Lcom/gc/materialdesign/views/Slider;->min:I

    sub-int/2addr v4, v5

    int-to-float v4, v4

    div-float v0, v3, v4

    .line 166
    .local v0, "division":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iget-object v4, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    iget v4, v4, Lcom/gc/materialdesign/views/Slider$Ball;->xFin:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_c8

    .line 167
    iget v1, p0, Lcom/gc/materialdesign/views/Slider;->max:I

    .line 173
    :goto_60
    iget v3, p0, Lcom/gc/materialdesign/views/Slider;->value:I

    if-eq v3, v1, :cond_6f

    .line 174
    iput v1, p0, Lcom/gc/materialdesign/views/Slider;->value:I

    .line 175
    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->onValueChangedListener:Lcom/gc/materialdesign/views/Slider$OnValueChangedListener;

    if-eqz v3, :cond_6f

    .line 176
    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->onValueChangedListener:Lcom/gc/materialdesign/views/Slider$OnValueChangedListener;

    invoke-interface {v3, v1}, Lcom/gc/materialdesign/views/Slider$OnValueChangedListener;->onValueChanged(I)V

    .line 179
    :cond_6f
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    .line 180
    .local v2, "x":F
    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    iget v3, v3, Lcom/gc/materialdesign/views/Slider$Ball;->xIni:F

    cmpg-float v3, v2, v3

    if-gez v3, :cond_7f

    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    iget v2, v3, Lcom/gc/materialdesign/views/Slider$Ball;->xIni:F

    .line 181
    :cond_7f
    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    iget v3, v3, Lcom/gc/materialdesign/views/Slider$Ball;->xFin:F

    cmpl-float v3, v2, v3

    if-lez v3, :cond_8b

    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    iget v2, v3, Lcom/gc/materialdesign/views/Slider$Ball;->xFin:F

    .line 182
    :cond_8b
    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-static {v3, v2}, Lcom/nineoldandroids/view/ViewHelper;->setX(Landroid/view/View;F)V

    .line 183
    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-virtual {v3}, Lcom/gc/materialdesign/views/Slider$Ball;->changeBackground()V

    .line 186
    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->numberIndicator:Lcom/gc/materialdesign/views/Slider$NumberIndicator;

    if-eqz v3, :cond_c7

    .line 188
    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->numberIndicator:Lcom/gc/materialdesign/views/Slider$NumberIndicator;

    iget-object v3, v3, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->indicator:Lcom/gc/materialdesign/views/Slider$Indicator;

    iput v2, v3, Lcom/gc/materialdesign/views/Slider$Indicator;->x:F

    .line 189
    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->numberIndicator:Lcom/gc/materialdesign/views/Slider$NumberIndicator;

    iget-object v3, v3, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->indicator:Lcom/gc/materialdesign/views/Slider$Indicator;

    invoke-static {p0}, Lcom/gc/materialdesign/utils/Utils;->getRelativeTop(Landroid/view/View;)I

    move-result v4

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider;->getHeight()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    sub-int/2addr v4, v5

    int-to-float v4, v4

    iput v4, v3, Lcom/gc/materialdesign/views/Slider$Indicator;->finalY:F

    .line 191
    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->numberIndicator:Lcom/gc/materialdesign/views/Slider$NumberIndicator;

    iget-object v3, v3, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->indicator:Lcom/gc/materialdesign/views/Slider$Indicator;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider;->getHeight()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    iput v4, v3, Lcom/gc/materialdesign/views/Slider$Indicator;->finalSize:F

    .line 192
    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->numberIndicator:Lcom/gc/materialdesign/views/Slider$NumberIndicator;

    iget-object v3, v3, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->numberIndicator:Landroid/widget/TextView;

    const-string v4, ""

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 211
    .end local v0    # "division":F
    .end local v1    # "newValue":I
    .end local v2    # "x":F
    :cond_c7
    :goto_c7
    return v6

    .line 168
    .restart local v0    # "division":F
    .restart local v1    # "newValue":I
    :cond_c8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iget-object v4, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    iget v4, v4, Lcom/gc/materialdesign/views/Slider$Ball;->xIni:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_d7

    .line 169
    iget v1, p0, Lcom/gc/materialdesign/views/Slider;->min:I

    goto :goto_60

    .line 171
    :cond_d7
    iget v3, p0, Lcom/gc/materialdesign/views/Slider;->min:I

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    iget-object v5, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    iget v5, v5, Lcom/gc/materialdesign/views/Slider$Ball;->xIni:F

    sub-float/2addr v4, v5

    div-float/2addr v4, v0

    float-to-int v4, v4

    add-int v1, v3, v4

    goto/16 :goto_60

    .line 196
    .end local v0    # "division":F
    .end local v1    # "newValue":I
    :cond_e8
    iput-boolean v5, p0, Lcom/gc/materialdesign/views/Slider;->press:Z

    .line 197
    iput-boolean v5, p0, Lcom/gc/materialdesign/views/Slider;->isLastTouch:Z

    .line 198
    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->numberIndicator:Lcom/gc/materialdesign/views/Slider$NumberIndicator;

    if-eqz v3, :cond_c7

    .line 199
    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->numberIndicator:Lcom/gc/materialdesign/views/Slider$NumberIndicator;

    invoke-virtual {v3}, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->dismiss()V

    goto :goto_c7

    .line 203
    :cond_f6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    if-eq v3, v6, :cond_103

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    const/4 v4, 0x3

    if-ne v3, v4, :cond_c7

    .line 205
    :cond_103
    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->numberIndicator:Lcom/gc/materialdesign/views/Slider$NumberIndicator;

    if-eqz v3, :cond_10c

    .line 206
    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->numberIndicator:Lcom/gc/materialdesign/views/Slider$NumberIndicator;

    invoke-virtual {v3}, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->dismiss()V

    .line 207
    :cond_10c
    iput-boolean v5, p0, Lcom/gc/materialdesign/views/Slider;->isLastTouch:Z

    .line 208
    iput-boolean v5, p0, Lcom/gc/materialdesign/views/Slider;->press:Z

    goto :goto_c7
.end method

.method protected setAttributes(Landroid/util/AttributeSet;)V
    .registers 10
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/high16 v7, 0x41a00000    # 20.0f

    const/4 v5, 0x0

    const/4 v6, -0x1

    .line 55
    sget v3, Lcom/gc/materialdesign/R$drawable;->background_transparent:I

    invoke-virtual {p0, v3}, Lcom/gc/materialdesign/views/Slider;->setBackgroundResource(I)V

    .line 58
    const/high16 v3, 0x42400000    # 48.0f

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/gc/materialdesign/views/Slider;->setMinimumHeight(I)V

    .line 59
    const/high16 v3, 0x42a00000    # 80.0f

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/gc/materialdesign/views/Slider;->setMinimumWidth(I)V

    .line 63
    const-string v3, "http://schemas.android.com/apk/res/android"

    const-string v4, "background"

    invoke-interface {p1, v3, v4, v6}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    .line 65
    .local v0, "bacgroundColor":I
    if-eq v0, v6, :cond_a1

    .line 66
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/gc/materialdesign/views/Slider;->setBackgroundColor(I)V

    .line 74
    :cond_38
    :goto_38
    const-string v3, "http://schemas.android.com/apk/res-auto"

    const-string v4, "showNumberIndicator"

    invoke-interface {p1, v3, v4, v5}, Landroid/util/AttributeSet;->getAttributeBooleanValue(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, p0, Lcom/gc/materialdesign/views/Slider;->showNumberIndicator:Z

    .line 76
    const-string v3, "http://schemas.android.com/apk/res-auto"

    const-string v4, "min"

    invoke-interface {p1, v3, v4, v5}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/gc/materialdesign/views/Slider;->min:I

    .line 77
    const-string v3, "http://schemas.android.com/apk/res-auto"

    const-string v4, "max"

    invoke-interface {p1, v3, v4, v5}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/gc/materialdesign/views/Slider;->max:I

    .line 78
    const-string v3, "http://schemas.android.com/apk/res-auto"

    const-string v4, "value"

    iget v5, p0, Lcom/gc/materialdesign/views/Slider;->min:I

    invoke-interface {p1, v3, v4, v5}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/gc/materialdesign/views/Slider;->value:I

    .line 80
    new-instance v3, Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, p0, v4}, Lcom/gc/materialdesign/views/Slider$Ball;-><init>(Lcom/gc/materialdesign/views/Slider;Landroid/content/Context;)V

    iput-object v3, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    .line 81
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v7, v3}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v3

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v7, v4}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 83
    .local v2, "params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v3, 0xf

    invoke-virtual {v2, v3, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 84
    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-virtual {v3, v2}, Lcom/gc/materialdesign/views/Slider$Ball;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 85
    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-virtual {p0, v3}, Lcom/gc/materialdesign/views/Slider;->addView(Landroid/view/View;)V

    .line 89
    iget-boolean v3, p0, Lcom/gc/materialdesign/views/Slider;->showNumberIndicator:Z

    if-eqz v3, :cond_a0

    .line 90
    new-instance v3, Lcom/gc/materialdesign/views/Slider$NumberIndicator;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, p0, v4}, Lcom/gc/materialdesign/views/Slider$NumberIndicator;-><init>(Lcom/gc/materialdesign/views/Slider;Landroid/content/Context;)V

    iput-object v3, p0, Lcom/gc/materialdesign/views/Slider;->numberIndicator:Lcom/gc/materialdesign/views/Slider$NumberIndicator;

    .line 93
    :cond_a0
    return-void

    .line 69
    .end local v2    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_a1
    const-string v3, "http://schemas.android.com/apk/res/android"

    const-string v4, "background"

    invoke-interface {p1, v3, v4, v6}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    .line 70
    .local v1, "background":I
    if-eq v1, v6, :cond_38

    .line 71
    invoke-virtual {p0, v1}, Lcom/gc/materialdesign/views/Slider;->setBackgroundColor(I)V

    goto :goto_38
.end method

.method public setBackgroundColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 299
    iput p1, p0, Lcom/gc/materialdesign/views/Slider;->backgroundColor:I

    .line 300
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 301
    iget v0, p0, Lcom/gc/materialdesign/views/Slider;->backgroundColor:I

    iput v0, p0, Lcom/gc/materialdesign/views/Slider;->beforeBackground:I

    .line 302
    :cond_c
    return-void
.end method

.method public setMax(I)V
    .registers 2
    .param p1, "max"    # I

    .prologue
    .line 276
    iput p1, p0, Lcom/gc/materialdesign/views/Slider;->max:I

    .line 277
    return-void
.end method

.method public setMin(I)V
    .registers 2
    .param p1, "min"    # I

    .prologue
    .line 284
    iput p1, p0, Lcom/gc/materialdesign/views/Slider;->min:I

    .line 285
    return-void
.end method

.method public setOnValueChangedListener(Lcom/gc/materialdesign/views/Slider$OnValueChangedListener;)V
    .registers 2
    .param p1, "onValueChangedListener"    # Lcom/gc/materialdesign/views/Slider$OnValueChangedListener;

    .prologue
    .line 245
    iput-object p1, p0, Lcom/gc/materialdesign/views/Slider;->onValueChangedListener:Lcom/gc/materialdesign/views/Slider$OnValueChangedListener;

    .line 246
    return-void
.end method

.method public setShowNumberIndicator(Z)V
    .registers 4
    .param p1, "showNumberIndicator"    # Z

    .prologue
    .line 292
    iput-boolean p1, p0, Lcom/gc/materialdesign/views/Slider;->showNumberIndicator:Z

    .line 293
    if-eqz p1, :cond_10

    new-instance v0, Lcom/gc/materialdesign/views/Slider$NumberIndicator;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/gc/materialdesign/views/Slider$NumberIndicator;-><init>(Lcom/gc/materialdesign/views/Slider;Landroid/content/Context;)V

    :goto_d
    iput-object v0, p0, Lcom/gc/materialdesign/views/Slider;->numberIndicator:Lcom/gc/materialdesign/views/Slider$NumberIndicator;

    .line 295
    return-void

    .line 293
    :cond_10
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public setValue(I)V
    .registers 6
    .param p1, "value"    # I

    .prologue
    .line 253
    iget-boolean v1, p0, Lcom/gc/materialdesign/views/Slider;->placedBall:Z

    if-nez v1, :cond_d

    .line 254
    new-instance v1, Lcom/gc/materialdesign/views/Slider$1;

    invoke-direct {v1, p0, p1}, Lcom/gc/materialdesign/views/Slider$1;-><init>(Lcom/gc/materialdesign/views/Slider;I)V

    invoke-virtual {p0, v1}, Lcom/gc/materialdesign/views/Slider;->post(Ljava/lang/Runnable;)Z

    .line 269
    :goto_c
    return-void

    .line 262
    :cond_d
    iput p1, p0, Lcom/gc/materialdesign/views/Slider;->value:I

    .line 263
    iget-object v1, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    iget v1, v1, Lcom/gc/materialdesign/views/Slider$Ball;->xFin:F

    iget-object v2, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    iget v2, v2, Lcom/gc/materialdesign/views/Slider$Ball;->xIni:F

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/gc/materialdesign/views/Slider;->max:I

    int-to-float v2, v2

    div-float v0, v1, v2

    .line 264
    .local v0, "division":F
    iget-object v1, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    int-to-float v2, p1

    mul-float/2addr v2, v0

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    add-float/2addr v2, v3

    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-virtual {v3}, Lcom/gc/materialdesign/views/Slider$Ball;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    sub-float/2addr v2, v3

    invoke-static {v1, v2}, Lcom/nineoldandroids/view/ViewHelper;->setX(Landroid/view/View;F)V

    .line 266
    iget-object v1, p0, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-virtual {v1}, Lcom/gc/materialdesign/views/Slider$Ball;->changeBackground()V

    goto :goto_c
.end method
