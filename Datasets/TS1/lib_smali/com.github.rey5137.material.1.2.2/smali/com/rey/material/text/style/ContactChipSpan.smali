.class public Lcom/rey/material/text/style/ContactChipSpan;
.super Landroid/text/style/ReplacementSpan;
.source "ContactChipSpan.java"


# instance fields
.field private mBackgroundColor:I

.field private mBitmap:Landroid/graphics/Bitmap;

.field private mBitmapShader:Landroid/graphics/BitmapShader;

.field private mBoringLayout:Landroid/text/BoringLayout;

.field private mContactName:Ljava/lang/CharSequence;

.field private mHeight:I

.field private mMatrix:Landroid/graphics/Matrix;

.field private mPaddingLeft:I

.field private mPaddingRight:I

.field private mPaint:Landroid/graphics/Paint;

.field private mRect:Landroid/graphics/RectF;

.field private mTextPaint:Landroid/text/TextPaint;

.field private mWidth:I


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;IIIILandroid/graphics/Typeface;III)V
    .registers 22
    .param p1, "name"    # Ljava/lang/CharSequence;
    .param p2, "height"    # I
    .param p3, "maxWidth"    # I
    .param p4, "paddingLeft"    # I
    .param p5, "paddingRight"    # I
    .param p6, "typeface"    # Landroid/graphics/Typeface;
    .param p7, "textColor"    # I
    .param p8, "textSize"    # I
    .param p9, "backgroundColor"    # I

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/text/style/ReplacementSpan;-><init>()V

    .line 39
    new-instance v1, Landroid/graphics/Paint;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mPaint:Landroid/graphics/Paint;

    .line 40
    iget-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 41
    iget-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mPaint:Landroid/graphics/Paint;

    move/from16 v0, p7

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 42
    iget-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p6

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 43
    iget-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mPaint:Landroid/graphics/Paint;

    move/from16 v0, p8

    int-to-float v2, v0

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 45
    new-instance v1, Landroid/text/TextPaint;

    iget-object v2, p0, Lcom/rey/material/text/style/ContactChipSpan;->mPaint:Landroid/graphics/Paint;

    invoke-direct {v1, v2}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    iput-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mTextPaint:Landroid/text/TextPaint;

    .line 48
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mRect:Landroid/graphics/RectF;

    .line 50
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mMatrix:Landroid/graphics/Matrix;

    .line 52
    iput-object p1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mContactName:Ljava/lang/CharSequence;

    .line 53
    move/from16 v0, p4

    iput v0, p0, Lcom/rey/material/text/style/ContactChipSpan;->mPaddingLeft:I

    .line 54
    move/from16 v0, p5

    iput v0, p0, Lcom/rey/material/text/style/ContactChipSpan;->mPaddingRight:I

    .line 55
    move/from16 v0, p9

    iput v0, p0, Lcom/rey/material/text/style/ContactChipSpan;->mBackgroundColor:I

    .line 56
    iput p2, p0, Lcom/rey/material/text/style/ContactChipSpan;->mHeight:I

    .line 57
    int-to-float v1, p3

    iget-object v2, p0, Lcom/rey/material/text/style/ContactChipSpan;->mPaint:Landroid/graphics/Paint;

    const/4 v4, 0x0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    invoke-virtual {v2, p1, v4, v5}, Landroid/graphics/Paint;->measureText(Ljava/lang/CharSequence;II)F

    move-result v2

    move/from16 v0, p4

    int-to-float v4, v0

    add-float/2addr v2, v4

    move/from16 v0, p5

    int-to-float v4, v0

    add-float/2addr v2, v4

    int-to-float v4, p2

    add-float/2addr v2, v4

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mWidth:I

    .line 59
    const/4 v1, 0x0

    iget v2, p0, Lcom/rey/material/text/style/ContactChipSpan;->mWidth:I

    iget v4, p0, Lcom/rey/material/text/style/ContactChipSpan;->mPaddingLeft:I

    sub-int/2addr v2, v4

    iget v4, p0, Lcom/rey/material/text/style/ContactChipSpan;->mPaddingRight:I

    sub-int/2addr v2, v4

    iget v4, p0, Lcom/rey/material/text/style/ContactChipSpan;->mHeight:I

    sub-int/2addr v2, v4

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 60
    .local v3, "outerWidth":I
    iget-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v1}, Landroid/text/TextPaint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v11

    .line 61
    .local v11, "temp":Landroid/graphics/Paint$FontMetricsInt;
    new-instance v7, Landroid/text/BoringLayout$Metrics;

    invoke-direct {v7}, Landroid/text/BoringLayout$Metrics;-><init>()V

    .line 62
    .local v7, "mMetrics":Landroid/text/BoringLayout$Metrics;
    iget-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mTextPaint:Landroid/text/TextPaint;

    iget-object v2, p0, Lcom/rey/material/text/style/ContactChipSpan;->mContactName:Ljava/lang/CharSequence;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/rey/material/text/style/ContactChipSpan;->mContactName:Ljava/lang/CharSequence;

    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    move-result v5

    invoke-virtual {v1, v2, v4, v5}, Landroid/text/TextPaint;->measureText(Ljava/lang/CharSequence;II)F

    move-result v1

    const/high16 v2, 0x3f000000    # 0.5f

    add-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, v7, Landroid/text/BoringLayout$Metrics;->width:I

    .line 63
    iget v1, v11, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    iput v1, v7, Landroid/text/BoringLayout$Metrics;->ascent:I

    .line 64
    iget v1, v11, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    iput v1, v7, Landroid/text/BoringLayout$Metrics;->bottom:I

    .line 65
    iget v1, v11, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iput v1, v7, Landroid/text/BoringLayout$Metrics;->descent:I

    .line 66
    iget v1, v11, Landroid/graphics/Paint$FontMetricsInt;->top:I

    iput v1, v7, Landroid/text/BoringLayout$Metrics;->top:I

    .line 67
    iget v1, v11, Landroid/graphics/Paint$FontMetricsInt;->leading:I

    iput v1, v7, Landroid/text/BoringLayout$Metrics;->leading:I

    .line 68
    iget-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mContactName:Ljava/lang/CharSequence;

    iget-object v2, p0, Lcom/rey/material/text/style/ContactChipSpan;->mTextPaint:Landroid/text/TextPaint;

    sget-object v4, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    const/high16 v5, 0x3f800000    # 1.0f

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v8, 0x1

    sget-object v9, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    move v10, v3

    invoke-static/range {v1 .. v10}, Landroid/text/BoringLayout;->make(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFLandroid/text/BoringLayout$Metrics;ZLandroid/text/TextUtils$TruncateAt;I)Landroid/text/BoringLayout;

    move-result-object v1

    iput-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mBoringLayout:Landroid/text/BoringLayout;

    .line 69
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .registers 17
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "text"    # Ljava/lang/CharSequence;
    .param p3, "start"    # I
    .param p4, "end"    # I
    .param p5, "x"    # F
    .param p6, "top"    # I
    .param p7, "y"    # I
    .param p8, "bottom"    # I
    .param p9, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 101
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 103
    int-to-float v0, p6

    invoke-virtual {p1, p5, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 105
    iget v0, p0, Lcom/rey/material/text/style/ContactChipSpan;->mHeight:I

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float v6, v0, v1

    .line 106
    .local v6, "halfHeight":F
    iget-object v0, p0, Lcom/rey/material/text/style/ContactChipSpan;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 107
    iget-object v0, p0, Lcom/rey/material/text/style/ContactChipSpan;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mBackgroundColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 108
    iget-object v0, p0, Lcom/rey/material/text/style/ContactChipSpan;->mRect:Landroid/graphics/RectF;

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    iget v3, p0, Lcom/rey/material/text/style/ContactChipSpan;->mHeight:I

    add-int/lit8 v3, v3, 0x1

    int-to-float v3, v3

    iget v4, p0, Lcom/rey/material/text/style/ContactChipSpan;->mHeight:I

    int-to-float v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 109
    iget-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mRect:Landroid/graphics/RectF;

    const/high16 v2, 0x42b40000    # 90.0f

    const/high16 v3, 0x43340000    # 180.0f

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/rey/material/text/style/ContactChipSpan;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 110
    iget-object v0, p0, Lcom/rey/material/text/style/ContactChipSpan;->mRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mWidth:I

    iget v2, p0, Lcom/rey/material/text/style/ContactChipSpan;->mHeight:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    const/4 v2, 0x0

    iget v3, p0, Lcom/rey/material/text/style/ContactChipSpan;->mWidth:I

    int-to-float v3, v3

    iget v4, p0, Lcom/rey/material/text/style/ContactChipSpan;->mHeight:I

    int-to-float v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 111
    iget-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mRect:Landroid/graphics/RectF;

    const/high16 v2, 0x43870000    # 270.0f

    const/high16 v3, 0x43340000    # 180.0f

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/rey/material/text/style/ContactChipSpan;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 112
    iget-object v0, p0, Lcom/rey/material/text/style/ContactChipSpan;->mRect:Landroid/graphics/RectF;

    const/4 v1, 0x0

    iget v2, p0, Lcom/rey/material/text/style/ContactChipSpan;->mWidth:I

    int-to-float v2, v2

    sub-float/2addr v2, v6

    iget v3, p0, Lcom/rey/material/text/style/ContactChipSpan;->mHeight:I

    int-to-float v3, v3

    invoke-virtual {v0, v6, v1, v2, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 113
    iget-object v0, p0, Lcom/rey/material/text/style/ContactChipSpan;->mRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 115
    iget-object v0, p0, Lcom/rey/material/text/style/ContactChipSpan;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_7b

    .line 116
    iget-object v0, p0, Lcom/rey/material/text/style/ContactChipSpan;->mPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mBitmapShader:Landroid/graphics/BitmapShader;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 117
    iget-object v0, p0, Lcom/rey/material/text/style/ContactChipSpan;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v6, v6, v6, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 120
    :cond_7b
    iget-object v0, p0, Lcom/rey/material/text/style/ContactChipSpan;->mContactName:Ljava/lang/CharSequence;

    if-eqz v0, :cond_9e

    iget-object v0, p0, Lcom/rey/material/text/style/ContactChipSpan;->mBoringLayout:Landroid/text/BoringLayout;

    if-eqz v0, :cond_9e

    .line 121
    iget v0, p0, Lcom/rey/material/text/style/ContactChipSpan;->mHeight:I

    iget v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mPaddingLeft:I

    add-int/2addr v0, v1

    int-to-float v0, v0

    iget v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mHeight:I

    iget-object v2, p0, Lcom/rey/material/text/style/ContactChipSpan;->mBoringLayout:Landroid/text/BoringLayout;

    invoke-virtual {v2}, Landroid/text/BoringLayout;->getHeight()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 122
    iget-object v0, p0, Lcom/rey/material/text/style/ContactChipSpan;->mBoringLayout:Landroid/text/BoringLayout;

    invoke-virtual {v0, p1}, Landroid/text/BoringLayout;->draw(Landroid/graphics/Canvas;)V

    .line 125
    :cond_9e
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 126
    return-void
.end method

.method public getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I
    .registers 9
    .param p1, "paint"    # Landroid/graphics/Paint;
    .param p2, "text"    # Ljava/lang/CharSequence;
    .param p3, "start"    # I
    .param p4, "end"    # I
    .param p5, "fm"    # Landroid/graphics/Paint$FontMetricsInt;

    .prologue
    .line 88
    if-eqz p5, :cond_38

    .line 89
    iget v1, p5, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    iget v2, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    add-int/2addr v1, v2

    div-int/lit8 v0, v1, 0x2

    .line 90
    .local v0, "cy":I
    iget v1, p5, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    iget v2, p0, Lcom/rey/material/text/style/ContactChipSpan;->mHeight:I

    div-int/lit8 v2, v2, 0x2

    sub-int v2, v0, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, p5, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 91
    iget v1, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iget v2, p0, Lcom/rey/material/text/style/ContactChipSpan;->mHeight:I

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v2, v0

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 92
    iget v1, p5, Landroid/graphics/Paint$FontMetricsInt;->top:I

    iget v2, p5, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, p5, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 93
    iget v1, p5, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    iget v2, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p5, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 96
    .end local v0    # "cy":I
    :cond_38
    iget v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mWidth:I

    return v1
.end method

.method public setImage(Landroid/graphics/Bitmap;)V
    .registers 9
    .param p1, "bm"    # Landroid/graphics/Bitmap;

    .prologue
    const/high16 v6, 0x40000000    # 2.0f

    const/4 v5, 0x0

    .line 72
    iget-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mBitmap:Landroid/graphics/Bitmap;

    if-eq v1, p1, :cond_60

    .line 73
    iput-object p1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mBitmap:Landroid/graphics/Bitmap;

    .line 74
    iget-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_60

    .line 75
    new-instance v1, Landroid/graphics/BitmapShader;

    iget-object v2, p0, Lcom/rey/material/text/style/ContactChipSpan;->mBitmap:Landroid/graphics/Bitmap;

    sget-object v3, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v4, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v1, v2, v3, v4}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    iput-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mBitmapShader:Landroid/graphics/BitmapShader;

    .line 76
    iget-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    .line 77
    iget v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mHeight:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/rey/material/text/style/ContactChipSpan;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/rey/material/text/style/ContactChipSpan;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    int-to-float v2, v2

    div-float v0, v1, v2

    .line 78
    .local v0, "scale":F
    iget-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v0, v0, v5, v5}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 79
    iget-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mMatrix:Landroid/graphics/Matrix;

    iget v2, p0, Lcom/rey/material/text/style/ContactChipSpan;->mHeight:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/rey/material/text/style/ContactChipSpan;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v0

    sub-float/2addr v2, v3

    div-float/2addr v2, v6

    iget v3, p0, Lcom/rey/material/text/style/ContactChipSpan;->mHeight:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/rey/material/text/style/ContactChipSpan;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v0

    sub-float/2addr v3, v4

    div-float/2addr v3, v6

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 81
    iget-object v1, p0, Lcom/rey/material/text/style/ContactChipSpan;->mBitmapShader:Landroid/graphics/BitmapShader;

    iget-object v2, p0, Lcom/rey/material/text/style/ContactChipSpan;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v2}, Landroid/graphics/BitmapShader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 84
    .end local v0    # "scale":F
    :cond_60
    return-void
.end method
