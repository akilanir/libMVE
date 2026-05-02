.class public Lcom/makeramen/RoundedDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "RoundedDrawable.java"


# static fields
.field public static final DEFAULT_BORDER_COLOR:I = -0x1000000

.field public static final TAG:Ljava/lang/String; = "RoundedDrawable"


# instance fields
.field private final mBitmap:Landroid/graphics/Bitmap;

.field private final mBitmapHeight:I

.field private final mBitmapPaint:Landroid/graphics/Paint;

.field private final mBitmapRect:Landroid/graphics/RectF;

.field private mBitmapShader:Landroid/graphics/BitmapShader;

.field private final mBitmapWidth:I

.field private mBorderColor:Landroid/content/res/ColorStateList;

.field private final mBorderPaint:Landroid/graphics/Paint;

.field private final mBorderRect:Landroid/graphics/RectF;

.field private mBorderWidth:F

.field private final mBounds:Landroid/graphics/RectF;

.field private mCornerRadius:F

.field private final mDrawableRect:Landroid/graphics/RectF;

.field private mOval:Z

.field private mRebuildShader:Z

.field private mScaleType:Landroid/widget/ImageView$ScaleType;

.field private final mShaderMatrix:Landroid/graphics/Matrix;

.field private mTileModeX:Landroid/graphics/Shader$TileMode;

.field private mTileModeY:Landroid/graphics/Shader$TileMode;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;)V
    .registers 8
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/high16 v5, -0x1000000

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 50
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 28
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    .line 29
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/makeramen/RoundedDrawable;->mDrawableRect:Landroid/graphics/RectF;

    .line 30
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    .line 35
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 37
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    .line 40
    sget-object v0, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    iput-object v0, p0, Lcom/makeramen/RoundedDrawable;->mTileModeX:Landroid/graphics/Shader$TileMode;

    .line 41
    sget-object v0, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    iput-object v0, p0, Lcom/makeramen/RoundedDrawable;->mTileModeY:Landroid/graphics/Shader$TileMode;

    .line 42
    iput-boolean v4, p0, Lcom/makeramen/RoundedDrawable;->mRebuildShader:Z

    .line 44
    iput v3, p0, Lcom/makeramen/RoundedDrawable;->mCornerRadius:F

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/makeramen/RoundedDrawable;->mOval:Z

    .line 46
    iput v3, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    .line 47
    invoke-static {v5}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 48
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    iput-object v0, p0, Lcom/makeramen/RoundedDrawable;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 51
    iput-object p1, p0, Lcom/makeramen/RoundedDrawable;->mBitmap:Landroid/graphics/Bitmap;

    .line 53
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/makeramen/RoundedDrawable;->mBitmapWidth:I

    .line 54
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/makeramen/RoundedDrawable;->mBitmapHeight:I

    .line 55
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/makeramen/RoundedDrawable;->mBitmapWidth:I

    int-to-float v1, v1

    iget v2, p0, Lcom/makeramen/RoundedDrawable;->mBitmapHeight:I

    int-to-float v2, v2

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 57
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    .line 58
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 59
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 61
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    .line 62
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 63
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 64
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/makeramen/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Lcom/makeramen/RoundedDrawable;->getState()[I

    move-result-object v2

    invoke-virtual {v1, v2, v5}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 65
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 66
    return-void
.end method

.method public static drawableToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;
    .registers 10
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v6, 0x2

    .line 105
    instance-of v5, p0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v5, :cond_c

    .line 106
    check-cast p0, Landroid/graphics/drawable/BitmapDrawable;

    .end local p0    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 122
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    .local v3, "height":I
    .local v4, "width":I
    .restart local p0    # "drawable":Landroid/graphics/drawable/Drawable;
    :goto_b
    return-object v0

    .line 110
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v3    # "height":I
    .end local v4    # "width":I
    :cond_c
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 111
    .restart local v4    # "width":I
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 113
    .restart local v3    # "height":I
    :try_start_1c
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v4, v3, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 114
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 115
    .local v1, "canvas":Landroid/graphics/Canvas;
    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v7

    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v8

    invoke-virtual {p0, v5, v6, v7, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 116
    invoke-virtual {p0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_37} :catch_38

    goto :goto_b

    .line 117
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "canvas":Landroid/graphics/Canvas;
    :catch_38
    move-exception v2

    .line 118
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 119
    const/4 v0, 0x0

    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    goto :goto_b
.end method

.method public static fromBitmap(Landroid/graphics/Bitmap;)Lcom/makeramen/RoundedDrawable;
    .registers 2
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 69
    if-eqz p0, :cond_8

    .line 70
    new-instance v0, Lcom/makeramen/RoundedDrawable;

    invoke-direct {v0, p0}, Lcom/makeramen/RoundedDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 72
    :goto_7
    return-object v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static fromDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .registers 8
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 77
    if-eqz p0, :cond_6

    .line 78
    instance-of v5, p0, Lcom/makeramen/RoundedDrawable;

    if-eqz v5, :cond_7

    .line 101
    .end local p0    # "drawable":Landroid/graphics/drawable/Drawable;
    .local v0, "bm":Landroid/graphics/Bitmap;
    :cond_6
    :goto_6
    return-object p0

    .line 81
    .end local v0    # "bm":Landroid/graphics/Bitmap;
    .restart local p0    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_7
    instance-of v5, p0, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v5, :cond_29

    move-object v3, p0

    .line 82
    check-cast v3, Landroid/graphics/drawable/LayerDrawable;

    .line 83
    .local v3, "ld":Landroid/graphics/drawable/LayerDrawable;
    invoke-virtual {v3}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v4

    .line 86
    .local v4, "num":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_13
    if-ge v2, v4, :cond_27

    .line 87
    invoke-virtual {v3, v2}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 88
    .local v1, "d":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v3, v2}, Landroid/graphics/drawable/LayerDrawable;->getId(I)I

    move-result v5

    invoke-static {v1}, Lcom/makeramen/RoundedDrawable;->fromDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/graphics/drawable/LayerDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    .line 86
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    .end local v1    # "d":Landroid/graphics/drawable/Drawable;
    :cond_27
    move-object p0, v3

    .line 90
    goto :goto_6

    .line 94
    .end local v2    # "i":I
    .end local v3    # "ld":Landroid/graphics/drawable/LayerDrawable;
    .end local v4    # "num":I
    :cond_29
    invoke-static {p0}, Lcom/makeramen/RoundedDrawable;->drawableToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 95
    .restart local v0    # "bm":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_35

    .line 96
    new-instance p0, Lcom/makeramen/RoundedDrawable;

    .end local p0    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-direct {p0, v0}, Lcom/makeramen/RoundedDrawable;-><init>(Landroid/graphics/Bitmap;)V

    goto :goto_6

    .line 98
    .restart local p0    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_35
    const-string v5, "RoundedDrawable"

    const-string v6, "Failed to create bitmap from drawable!"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6
.end method

.method private updateShaderMatrix()V
    .registers 10

    .prologue
    const/high16 v8, 0x3f000000    # 0.5f

    const/high16 v7, 0x40000000    # 2.0f

    .line 146
    sget-object v3, Lcom/makeramen/RoundedDrawable$1;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v4}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_20c

    .line 202
    :pswitch_11
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 203
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/makeramen/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    sget-object v6, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 204
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 205
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget v4, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v4, v7

    iget v5, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v5, v7

    invoke-virtual {v3, v4, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 206
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    sget-object v6, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 233
    :goto_40
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mDrawableRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 234
    return-void

    .line 148
    :pswitch_48
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 149
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget v4, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v4, v7

    iget v5, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v5, v7

    invoke-virtual {v3, v4, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 151
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3}, Landroid/graphics/Matrix;->reset()V

    .line 152
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    iget v5, p0, Lcom/makeramen/RoundedDrawable;->mBitmapWidth:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    mul-float/2addr v4, v8

    add-float/2addr v4, v8

    float-to-int v4, v4

    int-to-float v4, v4

    iget-object v5, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    .line 153
    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    move-result v5

    iget v6, p0, Lcom/makeramen/RoundedDrawable;->mBitmapHeight:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    mul-float/2addr v5, v8

    add-float/2addr v5, v8

    float-to-int v5, v5

    int-to-float v5, v5

    .line 152
    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->setTranslate(FF)V

    goto :goto_40

    .line 157
    :pswitch_81
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 158
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget v4, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v4, v7

    iget v5, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v5, v7

    invoke-virtual {v3, v4, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 160
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3}, Landroid/graphics/Matrix;->reset()V

    .line 162
    const/4 v0, 0x0

    .line 163
    .local v0, "dx":F
    const/4 v1, 0x0

    .line 165
    .local v1, "dy":F
    iget v3, p0, Lcom/makeramen/RoundedDrawable;->mBitmapWidth:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    mul-float/2addr v3, v4

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    iget v5, p0, Lcom/makeramen/RoundedDrawable;->mBitmapHeight:I

    int-to-float v5, v5

    mul-float/2addr v4, v5

    cmpl-float v3, v3, v4

    if-lez v3, :cond_e4

    .line 166
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    iget v4, p0, Lcom/makeramen/RoundedDrawable;->mBitmapHeight:I

    int-to-float v4, v4

    div-float v2, v3, v4

    .line 167
    .local v2, "scale":F
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget v4, p0, Lcom/makeramen/RoundedDrawable;->mBitmapWidth:I

    int-to-float v4, v4

    mul-float/2addr v4, v2

    sub-float/2addr v3, v4

    mul-float v0, v3, v8

    .line 173
    :goto_ca
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v2, v2}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 174
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    add-float v4, v0, v8

    float-to-int v4, v4

    int-to-float v4, v4

    iget v5, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    add-float/2addr v4, v5

    add-float v5, v1, v8

    float-to-int v5, v5

    int-to-float v5, v5

    iget v6, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    add-float/2addr v5, v6

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto/16 :goto_40

    .line 169
    .end local v2    # "scale":F
    :cond_e4
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget v4, p0, Lcom/makeramen/RoundedDrawable;->mBitmapWidth:I

    int-to-float v4, v4

    div-float v2, v3, v4

    .line 170
    .restart local v2    # "scale":F
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    iget v4, p0, Lcom/makeramen/RoundedDrawable;->mBitmapHeight:I

    int-to-float v4, v4

    mul-float/2addr v4, v2

    sub-float/2addr v3, v4

    mul-float v1, v3, v8

    goto :goto_ca

    .line 179
    .end local v0    # "dx":F
    .end local v1    # "dy":F
    .end local v2    # "scale":F
    :pswitch_fd
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3}, Landroid/graphics/Matrix;->reset()V

    .line 181
    iget v3, p0, Lcom/makeramen/RoundedDrawable;->mBitmapWidth:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_16c

    iget v3, p0, Lcom/makeramen/RoundedDrawable;->mBitmapHeight:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_16c

    .line 182
    const/high16 v2, 0x3f800000    # 1.0f

    .line 188
    .restart local v2    # "scale":F
    :goto_11e
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget v4, p0, Lcom/makeramen/RoundedDrawable;->mBitmapWidth:I

    int-to-float v4, v4

    mul-float/2addr v4, v2

    sub-float/2addr v3, v4

    mul-float/2addr v3, v8

    add-float/2addr v3, v8

    float-to-int v3, v3

    int-to-float v0, v3

    .line 189
    .restart local v0    # "dx":F
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    iget v4, p0, Lcom/makeramen/RoundedDrawable;->mBitmapHeight:I

    int-to-float v4, v4

    mul-float/2addr v4, v2

    sub-float/2addr v3, v4

    mul-float/2addr v3, v8

    add-float/2addr v3, v8

    float-to-int v3, v3

    int-to-float v1, v3

    .line 191
    .restart local v1    # "dy":F
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v2, v2}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 192
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v0, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 194
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 195
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 196
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget v4, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v4, v7

    iget v5, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v5, v7

    invoke-virtual {v3, v4, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 197
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    sget-object v6, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto/16 :goto_40

    .line 184
    .end local v0    # "dx":F
    .end local v1    # "dy":F
    .end local v2    # "scale":F
    :cond_16c
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget v4, p0, Lcom/makeramen/RoundedDrawable;->mBitmapWidth:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    .line 185
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    iget v5, p0, Lcom/makeramen/RoundedDrawable;->mBitmapHeight:I

    int-to-float v5, v5

    div-float/2addr v4, v5

    .line 184
    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .restart local v2    # "scale":F
    goto :goto_11e

    .line 210
    .end local v2    # "scale":F
    :pswitch_185
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 211
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/makeramen/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    sget-object v6, Landroid/graphics/Matrix$ScaleToFit;->END:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 212
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 213
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget v4, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v4, v7

    iget v5, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v5, v7

    invoke-virtual {v3, v4, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 214
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    sget-object v6, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto/16 :goto_40

    .line 218
    :pswitch_1b6
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 219
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/makeramen/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    sget-object v6, Landroid/graphics/Matrix$ScaleToFit;->START:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 220
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 221
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget v4, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v4, v7

    iget v5, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v5, v7

    invoke-virtual {v3, v4, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 222
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    sget-object v6, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto/16 :goto_40

    .line 226
    :pswitch_1e7
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 227
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget v4, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v4, v7

    iget v5, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    div-float/2addr v5, v7

    invoke-virtual {v3, v4, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 228
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3}, Landroid/graphics/Matrix;->reset()V

    .line 229
    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/makeramen/RoundedDrawable;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    sget-object v6, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto/16 :goto_40

    .line 146
    nop

    :pswitch_data_20c
    .packed-switch 0x1
        :pswitch_48
        :pswitch_81
        :pswitch_fd
        :pswitch_11
        :pswitch_185
        :pswitch_1b6
        :pswitch_1e7
    .end packed-switch
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v4, 0x0

    .line 247
    iget-boolean v0, p0, Lcom/makeramen/RoundedDrawable;->mRebuildShader:Z

    if-eqz v0, :cond_2f

    .line 248
    new-instance v0, Landroid/graphics/BitmapShader;

    iget-object v1, p0, Lcom/makeramen/RoundedDrawable;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/makeramen/RoundedDrawable;->mTileModeX:Landroid/graphics/Shader$TileMode;

    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mTileModeY:Landroid/graphics/Shader$TileMode;

    invoke-direct {v0, v1, v2, v3}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    iput-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBitmapShader:Landroid/graphics/BitmapShader;

    .line 249
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mTileModeX:Landroid/graphics/Shader$TileMode;

    sget-object v1, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    if-ne v0, v1, :cond_25

    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mTileModeY:Landroid/graphics/Shader$TileMode;

    sget-object v1, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    if-ne v0, v1, :cond_25

    .line 250
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBitmapShader:Landroid/graphics/BitmapShader;

    iget-object v1, p0, Lcom/makeramen/RoundedDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/BitmapShader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 252
    :cond_25
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/makeramen/RoundedDrawable;->mBitmapShader:Landroid/graphics/BitmapShader;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 253
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/makeramen/RoundedDrawable;->mRebuildShader:Z

    .line 256
    :cond_2f
    iget-boolean v0, p0, Lcom/makeramen/RoundedDrawable;->mOval:Z

    if-eqz v0, :cond_50

    .line 257
    iget v0, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    cmpl-float v0, v0, v4

    if-lez v0, :cond_48

    .line 258
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mDrawableRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/makeramen/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 259
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/makeramen/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 272
    :goto_47
    return-void

    .line 261
    :cond_48
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mDrawableRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/makeramen/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    goto :goto_47

    .line 264
    :cond_50
    iget v0, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    cmpl-float v0, v0, v4

    if-lez v0, :cond_75

    .line 265
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mDrawableRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/makeramen/RoundedDrawable;->mCornerRadius:F

    invoke-static {v1, v4}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iget v2, p0, Lcom/makeramen/RoundedDrawable;->mCornerRadius:F

    .line 266
    invoke-static {v2, v4}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    .line 265
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 267
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBorderRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/makeramen/RoundedDrawable;->mCornerRadius:F

    iget v2, p0, Lcom/makeramen/RoundedDrawable;->mCornerRadius:F

    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_47

    .line 269
    :cond_75
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mDrawableRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/makeramen/RoundedDrawable;->mCornerRadius:F

    iget v2, p0, Lcom/makeramen/RoundedDrawable;->mCornerRadius:F

    iget-object v3, p0, Lcom/makeramen/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_47
.end method

.method public getBorderColor()I
    .registers 2

    .prologue
    .line 331
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    return v0
.end method

.method public getBorderColors()Landroid/content/res/ColorStateList;
    .registers 2

    .prologue
    .line 339
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getBorderWidth()F
    .registers 2

    .prologue
    .line 321
    iget v0, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    return v0
.end method

.method public getCornerRadius()F
    .registers 2

    .prologue
    .line 312
    iget v0, p0, Lcom/makeramen/RoundedDrawable;->mCornerRadius:F

    return v0
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .prologue
    .line 308
    iget v0, p0, Lcom/makeramen/RoundedDrawable;->mBitmapHeight:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .prologue
    .line 303
    iget v0, p0, Lcom/makeramen/RoundedDrawable;->mBitmapWidth:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 276
    const/4 v0, -0x3

    return v0
.end method

.method public getScaleType()Landroid/widget/ImageView$ScaleType;
    .registers 2

    .prologue
    .line 358
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mScaleType:Landroid/widget/ImageView$ScaleType;

    return-object v0
.end method

.method public getTileModeX()Landroid/graphics/Shader$TileMode;
    .registers 2

    .prologue
    .line 373
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mTileModeX:Landroid/graphics/Shader$TileMode;

    return-object v0
.end method

.method public getTileModeY()Landroid/graphics/Shader$TileMode;
    .registers 2

    .prologue
    .line 386
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mTileModeY:Landroid/graphics/Shader$TileMode;

    return-object v0
.end method

.method public isOval()Z
    .registers 2

    .prologue
    .line 349
    iget-boolean v0, p0, Lcom/makeramen/RoundedDrawable;->mOval:Z

    return v0
.end method

.method public isStateful()Z
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v0

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .registers 3
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 238
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 240
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 242
    invoke-direct {p0}, Lcom/makeramen/RoundedDrawable;->updateShaderMatrix()V

    .line 243
    return-void
.end method

.method protected onStateChange([I)Z
    .registers 5
    .param p1, "state"    # [I

    .prologue
    .line 132
    iget-object v1, p0, Lcom/makeramen/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    .line 133
    .local v0, "newColor":I
    iget-object v1, p0, Lcom/makeramen/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->getColor()I

    move-result v1

    if-eq v1, v0, :cond_16

    .line 134
    iget-object v1, p0, Lcom/makeramen/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 135
    const/4 v1, 0x1

    .line 137
    :goto_15
    return v1

    :cond_16
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onStateChange([I)Z

    move-result v1

    goto :goto_15
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 281
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 282
    invoke-virtual {p0}, Lcom/makeramen/RoundedDrawable;->invalidateSelf()V

    .line 283
    return-void
.end method

.method public setBorderColor(I)Lcom/makeramen/RoundedDrawable;
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 335
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/makeramen/RoundedDrawable;->setBorderColor(Landroid/content/res/ColorStateList;)Lcom/makeramen/RoundedDrawable;

    move-result-object v0

    return-object v0
.end method

.method public setBorderColor(Landroid/content/res/ColorStateList;)Lcom/makeramen/RoundedDrawable;
    .registers 6
    .param p1, "colors"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 343
    if-eqz p1, :cond_16

    .end local p1    # "colors":Landroid/content/res/ColorStateList;
    :goto_2
    iput-object p1, p0, Lcom/makeramen/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 344
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/makeramen/RoundedDrawable;->mBorderColor:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Lcom/makeramen/RoundedDrawable;->getState()[I

    move-result-object v2

    const/high16 v3, -0x1000000

    invoke-virtual {v1, v2, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 345
    return-object p0

    .line 343
    .restart local p1    # "colors":Landroid/content/res/ColorStateList;
    :cond_16
    const/4 v0, 0x0

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    goto :goto_2
.end method

.method public setBorderWidth(F)Lcom/makeramen/RoundedDrawable;
    .registers 4
    .param p1, "width"    # F

    .prologue
    .line 325
    iput p1, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    .line 326
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBorderPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/makeramen/RoundedDrawable;->mBorderWidth:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 327
    return-object p0
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 287
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 288
    invoke-virtual {p0}, Lcom/makeramen/RoundedDrawable;->invalidateSelf()V

    .line 289
    return-void
.end method

.method public setCornerRadius(F)Lcom/makeramen/RoundedDrawable;
    .registers 2
    .param p1, "radius"    # F

    .prologue
    .line 316
    iput p1, p0, Lcom/makeramen/RoundedDrawable;->mCornerRadius:F

    .line 317
    return-object p0
.end method

.method public setDither(Z)V
    .registers 3
    .param p1, "dither"    # Z

    .prologue
    .line 292
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 293
    invoke-virtual {p0}, Lcom/makeramen/RoundedDrawable;->invalidateSelf()V

    .line 294
    return-void
.end method

.method public setFilterBitmap(Z)V
    .registers 3
    .param p1, "filter"    # Z

    .prologue
    .line 297
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 298
    invoke-virtual {p0}, Lcom/makeramen/RoundedDrawable;->invalidateSelf()V

    .line 299
    return-void
.end method

.method public setOval(Z)Lcom/makeramen/RoundedDrawable;
    .registers 2
    .param p1, "oval"    # Z

    .prologue
    .line 353
    iput-boolean p1, p0, Lcom/makeramen/RoundedDrawable;->mOval:Z

    .line 354
    return-object p0
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)Lcom/makeramen/RoundedDrawable;
    .registers 3
    .param p1, "scaleType"    # Landroid/widget/ImageView$ScaleType;

    .prologue
    .line 362
    if-nez p1, :cond_4

    .line 363
    sget-object p1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 365
    :cond_4
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mScaleType:Landroid/widget/ImageView$ScaleType;

    if-eq v0, p1, :cond_d

    .line 366
    iput-object p1, p0, Lcom/makeramen/RoundedDrawable;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 367
    invoke-direct {p0}, Lcom/makeramen/RoundedDrawable;->updateShaderMatrix()V

    .line 369
    :cond_d
    return-object p0
.end method

.method public setTileModeX(Landroid/graphics/Shader$TileMode;)Lcom/makeramen/RoundedDrawable;
    .registers 3
    .param p1, "tileModeX"    # Landroid/graphics/Shader$TileMode;

    .prologue
    .line 377
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mTileModeX:Landroid/graphics/Shader$TileMode;

    if-eq v0, p1, :cond_c

    .line 378
    iput-object p1, p0, Lcom/makeramen/RoundedDrawable;->mTileModeX:Landroid/graphics/Shader$TileMode;

    .line 379
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/makeramen/RoundedDrawable;->mRebuildShader:Z

    .line 380
    invoke-virtual {p0}, Lcom/makeramen/RoundedDrawable;->invalidateSelf()V

    .line 382
    :cond_c
    return-object p0
.end method

.method public setTileModeY(Landroid/graphics/Shader$TileMode;)Lcom/makeramen/RoundedDrawable;
    .registers 3
    .param p1, "tileModeY"    # Landroid/graphics/Shader$TileMode;

    .prologue
    .line 390
    iget-object v0, p0, Lcom/makeramen/RoundedDrawable;->mTileModeY:Landroid/graphics/Shader$TileMode;

    if-eq v0, p1, :cond_c

    .line 391
    iput-object p1, p0, Lcom/makeramen/RoundedDrawable;->mTileModeY:Landroid/graphics/Shader$TileMode;

    .line 392
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/makeramen/RoundedDrawable;->mRebuildShader:Z

    .line 393
    invoke-virtual {p0}, Lcom/makeramen/RoundedDrawable;->invalidateSelf()V

    .line 395
    :cond_c
    return-object p0
.end method

.method public toBitmap()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    .line 399
    invoke-static {p0}, Lcom/makeramen/RoundedDrawable;->drawableToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method
