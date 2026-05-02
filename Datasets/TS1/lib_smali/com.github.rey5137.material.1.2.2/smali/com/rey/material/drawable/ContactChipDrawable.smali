.class public Lcom/rey/material/drawable/ContactChipDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "ContactChipDrawable.java"


# instance fields
.field private mBackgroundColor:I

.field private mBitmap:Landroid/graphics/Bitmap;

.field private mBitmapShader:Landroid/graphics/BitmapShader;

.field private mBoringLayout:Landroid/text/BoringLayout;

.field private mContactName:Ljava/lang/CharSequence;

.field private mMatrix:Landroid/graphics/Matrix;

.field private mMetrics:Landroid/text/BoringLayout$Metrics;

.field private mPaddingLeft:I

.field private mPaddingRight:I

.field private mPaint:Landroid/graphics/Paint;

.field private mRect:Landroid/graphics/RectF;

.field private mTextPaint:Landroid/text/TextPaint;


# direct methods
.method public constructor <init>(IILandroid/graphics/Typeface;III)V
    .registers 10
    .param p1, "paddingLeft"    # I
    .param p2, "paddingRight"    # I
    .param p3, "typeface"    # Landroid/graphics/Typeface;
    .param p4, "textColor"    # I
    .param p5, "textSize"    # I
    .param p6, "backgroundColor"    # I

    .prologue
    .line 40
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 41
    new-instance v1, Landroid/graphics/Paint;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mPaint:Landroid/graphics/Paint;

    .line 42
    iget-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 43
    iget-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, p4}, Landroid/graphics/Paint;->setColor(I)V

    .line 44
    iget-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, p3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 45
    iget-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mPaint:Landroid/graphics/Paint;

    int-to-float v2, p5

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 47
    new-instance v1, Landroid/text/TextPaint;

    iget-object v2, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-direct {v1, v2}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    iput-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mTextPaint:Landroid/text/TextPaint;

    .line 48
    new-instance v1, Landroid/text/BoringLayout$Metrics;

    invoke-direct {v1}, Landroid/text/BoringLayout$Metrics;-><init>()V

    iput-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mMetrics:Landroid/text/BoringLayout$Metrics;

    .line 49
    iget-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v1}, Landroid/text/TextPaint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v0

    .line 50
    .local v0, "temp":Landroid/graphics/Paint$FontMetricsInt;
    iget-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mMetrics:Landroid/text/BoringLayout$Metrics;

    iget v2, v0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    iput v2, v1, Landroid/text/BoringLayout$Metrics;->ascent:I

    .line 51
    iget-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mMetrics:Landroid/text/BoringLayout$Metrics;

    iget v2, v0, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    iput v2, v1, Landroid/text/BoringLayout$Metrics;->bottom:I

    .line 52
    iget-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mMetrics:Landroid/text/BoringLayout$Metrics;

    iget v2, v0, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iput v2, v1, Landroid/text/BoringLayout$Metrics;->descent:I

    .line 53
    iget-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mMetrics:Landroid/text/BoringLayout$Metrics;

    iget v2, v0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    iput v2, v1, Landroid/text/BoringLayout$Metrics;->top:I

    .line 54
    iget-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mMetrics:Landroid/text/BoringLayout$Metrics;

    iget v2, v0, Landroid/graphics/Paint$FontMetricsInt;->leading:I

    iput v2, v1, Landroid/text/BoringLayout$Metrics;->leading:I

    .line 56
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mRect:Landroid/graphics/RectF;

    .line 58
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mMatrix:Landroid/graphics/Matrix;

    .line 60
    iput p1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mPaddingLeft:I

    .line 61
    iput p2, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mPaddingRight:I

    .line 62
    iput p6, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBackgroundColor:I

    .line 63
    return-void
.end method

.method private updateLayout()V
    .registers 16

    .prologue
    .line 83
    iget-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mContactName:Ljava/lang/CharSequence;

    if-nez v0, :cond_5

    .line 97
    :cond_4
    :goto_4
    return-void

    .line 86
    :cond_5
    invoke-virtual {p0}, Lcom/rey/material/drawable/ContactChipDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v14

    .line 87
    .local v14, "bounds":Landroid/graphics/Rect;
    invoke-virtual {v14}, Landroid/graphics/Rect;->width()I

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {v14}, Landroid/graphics/Rect;->height()I

    move-result v0

    if-eqz v0, :cond_4

    .line 90
    const/4 v0, 0x0

    invoke-virtual {v14}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v14}, Landroid/graphics/Rect;->height()I

    move-result v3

    sub-int/2addr v1, v3

    iget v3, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mPaddingLeft:I

    sub-int/2addr v1, v3

    iget v3, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mPaddingRight:I

    sub-int/2addr v1, v3

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 91
    .local v2, "outerWidth":I
    iget-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mMetrics:Landroid/text/BoringLayout$Metrics;

    iget-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mTextPaint:Landroid/text/TextPaint;

    iget-object v3, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mContactName:Ljava/lang/CharSequence;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mContactName:Ljava/lang/CharSequence;

    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    move-result v5

    invoke-virtual {v1, v3, v4, v5}, Landroid/text/TextPaint;->measureText(Ljava/lang/CharSequence;II)F

    move-result v1

    const/high16 v3, 0x3f000000    # 0.5f

    add-float/2addr v1, v3

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, v0, Landroid/text/BoringLayout$Metrics;->width:I

    .line 93
    iget-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBoringLayout:Landroid/text/BoringLayout;

    if-nez v0, :cond_5e

    .line 94
    iget-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mContactName:Ljava/lang/CharSequence;

    iget-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mTextPaint:Landroid/text/TextPaint;

    sget-object v3, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v5, 0x3f800000    # 1.0f

    iget-object v6, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mMetrics:Landroid/text/BoringLayout$Metrics;

    const/4 v7, 0x1

    sget-object v8, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    move v9, v2

    invoke-static/range {v0 .. v9}, Landroid/text/BoringLayout;->make(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFLandroid/text/BoringLayout$Metrics;ZLandroid/text/TextUtils$TruncateAt;I)Landroid/text/BoringLayout;

    move-result-object v0

    iput-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBoringLayout:Landroid/text/BoringLayout;

    goto :goto_4

    .line 96
    :cond_5e
    iget-object v3, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBoringLayout:Landroid/text/BoringLayout;

    iget-object v4, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mContactName:Ljava/lang/CharSequence;

    iget-object v5, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mTextPaint:Landroid/text/TextPaint;

    sget-object v7, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    const/high16 v8, 0x3f800000    # 1.0f

    const/high16 v9, 0x3f800000    # 1.0f

    iget-object v10, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mMetrics:Landroid/text/BoringLayout$Metrics;

    const/4 v11, 0x1

    sget-object v12, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    move v6, v2

    move v13, v2

    invoke-virtual/range {v3 .. v13}, Landroid/text/BoringLayout;->replaceOrMake(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFLandroid/text/BoringLayout$Metrics;ZLandroid/text/TextUtils$TruncateAt;I)Landroid/text/BoringLayout;

    move-result-object v0

    iput-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBoringLayout:Landroid/text/BoringLayout;

    goto :goto_4
.end method

.method private updateMatrix()V
    .registers 8

    .prologue
    const/high16 v6, 0x40000000    # 2.0f

    const/4 v5, 0x0

    .line 100
    iget-object v2, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBitmap:Landroid/graphics/Bitmap;

    if-nez v2, :cond_8

    .line 113
    :cond_7
    :goto_7
    return-void

    .line 103
    :cond_8
    invoke-virtual {p0}, Lcom/rey/material/drawable/ContactChipDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 104
    .local v0, "bounds":Landroid/graphics/Rect;
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    if-eqz v2, :cond_7

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    if-eqz v2, :cond_7

    .line 107
    iget-object v2, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2}, Landroid/graphics/Matrix;->reset()V

    .line 108
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    iget-object v4, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    int-to-float v3, v3

    div-float v1, v2, v3

    .line 109
    .local v1, "scale":F
    iget-object v2, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, v1, v1, v5, v5}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 110
    iget-object v2, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v1

    sub-float/2addr v3, v4

    div-float/2addr v3, v6

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    iget-object v5, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v1

    sub-float/2addr v4, v5

    div-float/2addr v4, v6

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 112
    iget-object v2, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBitmapShader:Landroid/graphics/BitmapShader;

    iget-object v3, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, v3}, Landroid/graphics/BitmapShader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    goto :goto_7
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 13
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v4, 0x1

    const/high16 v3, 0x43340000    # 180.0f

    const/high16 v10, 0x40000000    # 2.0f

    const/4 v9, 0x0

    .line 123
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v8

    .line 125
    .local v8, "saveCount":I
    invoke-virtual {p0}, Lcom/rey/material/drawable/ContactChipDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v6

    .line 126
    .local v6, "bounds":Landroid/graphics/Rect;
    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    div-float v7, v0, v10

    .line 127
    .local v7, "halfHeight":F
    iget-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 128
    iget-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBackgroundColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 129
    iget-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mRect:Landroid/graphics/RectF;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    int-to-float v2, v2

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v0, v1, v9, v2, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 130
    iget-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mRect:Landroid/graphics/RectF;

    const/high16 v2, 0x42b40000    # 90.0f

    iget-object v5, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 131
    iget-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mRect:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v0, v1, v9, v2, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 132
    iget-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mRect:Landroid/graphics/RectF;

    const/high16 v2, 0x43870000    # 270.0f

    iget-object v5, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 133
    iget-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mRect:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr v1, v7

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v7, v9, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 134
    iget-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 136
    iget-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_89

    .line 137
    iget-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBitmapShader:Landroid/graphics/BitmapShader;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 138
    iget-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v7, v7, v7, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 141
    :cond_89
    iget-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mContactName:Ljava/lang/CharSequence;

    if-eqz v0, :cond_ae

    iget-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBoringLayout:Landroid/text/BoringLayout;

    if-eqz v0, :cond_ae

    .line 142
    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v0

    iget v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mPaddingLeft:I

    add-int/2addr v0, v1

    int-to-float v0, v0

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v1

    iget-object v2, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBoringLayout:Landroid/text/BoringLayout;

    invoke-virtual {v2}, Landroid/text/BoringLayout;->getHeight()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    div-float/2addr v1, v10

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 143
    iget-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBoringLayout:Landroid/text/BoringLayout;

    invoke-virtual {v0, p1}, Landroid/text/BoringLayout;->draw(Landroid/graphics/Canvas;)V

    .line 146
    :cond_ae
    invoke-virtual {p1, v8}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 147
    return-void
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 161
    const/4 v0, -0x3

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .registers 2
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 117
    invoke-direct {p0}, Lcom/rey/material/drawable/ContactChipDrawable;->updateLayout()V

    .line 118
    invoke-direct {p0}, Lcom/rey/material/drawable/ContactChipDrawable;->updateMatrix()V

    .line 119
    return-void
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 151
    iget-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 152
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 156
    iget-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 157
    return-void
.end method

.method public setContactName(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/CharSequence;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mContactName:Ljava/lang/CharSequence;

    .line 67
    invoke-direct {p0}, Lcom/rey/material/drawable/ContactChipDrawable;->updateLayout()V

    .line 68
    invoke-virtual {p0}, Lcom/rey/material/drawable/ContactChipDrawable;->invalidateSelf()V

    .line 69
    return-void
.end method

.method public setImage(Landroid/graphics/Bitmap;)V
    .registers 6
    .param p1, "bm"    # Landroid/graphics/Bitmap;

    .prologue
    .line 72
    iget-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBitmap:Landroid/graphics/Bitmap;

    if-eq v0, p1, :cond_1d

    .line 73
    iput-object p1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBitmap:Landroid/graphics/Bitmap;

    .line 74
    iget-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1a

    .line 75
    new-instance v0, Landroid/graphics/BitmapShader;

    iget-object v1, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBitmap:Landroid/graphics/Bitmap;

    sget-object v2, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v3, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v0, v1, v2, v3}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    iput-object v0, p0, Lcom/rey/material/drawable/ContactChipDrawable;->mBitmapShader:Landroid/graphics/BitmapShader;

    .line 76
    invoke-direct {p0}, Lcom/rey/material/drawable/ContactChipDrawable;->updateMatrix()V

    .line 78
    :cond_1a
    invoke-virtual {p0}, Lcom/rey/material/drawable/ContactChipDrawable;->invalidateSelf()V

    .line 80
    :cond_1d
    return-void
.end method
