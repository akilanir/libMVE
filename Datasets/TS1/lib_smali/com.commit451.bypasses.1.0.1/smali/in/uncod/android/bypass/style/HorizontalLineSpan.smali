.class public Lin/uncod/android/bypass/style/HorizontalLineSpan;
.super Landroid/text/style/ReplacementSpan;
.source "HorizontalLineSpan.java"


# instance fields
.field private mLineHeight:I

.field private mPaint:Landroid/graphics/Paint;

.field private mTopBottomPadding:I


# direct methods
.method public constructor <init>(III)V
    .registers 5
    .param p1, "color"    # I
    .param p2, "lineHeight"    # I
    .param p3, "topBottomPadding"    # I

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/text/style/ReplacementSpan;-><init>()V

    .line 17
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lin/uncod/android/bypass/style/HorizontalLineSpan;->mPaint:Landroid/graphics/Paint;

    .line 18
    iget-object v0, p0, Lin/uncod/android/bypass/style/HorizontalLineSpan;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 19
    iput p2, p0, Lin/uncod/android/bypass/style/HorizontalLineSpan;->mLineHeight:I

    .line 20
    iput p3, p0, Lin/uncod/android/bypass/style/HorizontalLineSpan;->mTopBottomPadding:I

    .line 21
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .registers 18
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
    .line 41
    add-int v0, p6, p8

    div-int/lit8 v7, v0, 0x2

    .line 42
    .local v7, "middle":I
    iget v0, p0, Lin/uncod/android/bypass/style/HorizontalLineSpan;->mLineHeight:I

    div-int/lit8 v6, v0, 0x2

    .line 43
    .local v6, "halfLineHeight":I
    sub-int v0, v7, v6

    int-to-float v2, v0

    const/high16 v3, 0x4f000000

    add-int v0, v7, v6

    int-to-float v4, v0

    iget-object v5, p0, Lin/uncod/android/bypass/style/HorizontalLineSpan;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v1, p5

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 44
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
    const/4 v2, 0x0

    .line 26
    if-eqz p5, :cond_13

    .line 27
    iget v0, p0, Lin/uncod/android/bypass/style/HorizontalLineSpan;->mLineHeight:I

    neg-int v0, v0

    iget v1, p0, Lin/uncod/android/bypass/style/HorizontalLineSpan;->mTopBottomPadding:I

    sub-int/2addr v0, v1

    iput v0, p5, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 28
    iput v2, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 30
    iget v0, p5, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    iput v0, p5, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 31
    iput v2, p5, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 35
    :cond_13
    const v0, 0x7fffffff

    return v0
.end method
