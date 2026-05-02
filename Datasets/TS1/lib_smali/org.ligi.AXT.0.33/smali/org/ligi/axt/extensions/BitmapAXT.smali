.class public Lorg/ligi/axt/extensions/BitmapAXT;
.super Ljava/lang/Object;
.source "BitmapAXT.java"


# instance fields
.field private final bitmap:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;)V
    .registers 2
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lorg/ligi/axt/extensions/BitmapAXT;->bitmap:Landroid/graphics/Bitmap;

    .line 14
    return-void
.end method


# virtual methods
.method public getSizeAsPoint()Landroid/graphics/Point;
    .registers 4

    .prologue
    .line 47
    new-instance v0, Landroid/graphics/Point;

    iget-object v1, p0, Lorg/ligi/axt/extensions/BitmapAXT;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iget-object v2, p0, Lorg/ligi/axt/extensions/BitmapAXT;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/Point;-><init>(II)V

    return-object v0
.end method

.method public scaleRelative(IIFF)Landroid/graphics/Bitmap;
    .registers 14
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "inScaleX"    # F
    .param p4, "inScaleY"    # F

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 22
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 25
    .local v5, "matrix":Landroid/graphics/Matrix;
    cmpl-float v0, p4, v3

    if-eqz v0, :cond_3d

    .line 27
    int-to-float v0, p2

    mul-float/2addr v0, p4

    iget-object v2, p0, Lorg/ligi/axt/extensions/BitmapAXT;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float v8, v0, v2

    .line 33
    .local v8, "outScaleY":F
    :goto_16
    cmpl-float v0, p3, v3

    if-eqz v0, :cond_49

    .line 35
    int-to-float v0, p1

    mul-float/2addr v0, p3

    iget-object v2, p0, Lorg/ligi/axt/extensions/BitmapAXT;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    div-float v7, v0, v2

    .line 41
    .local v7, "outScaleX":F
    :goto_25
    invoke-virtual {v5, v7, v8}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 43
    iget-object v0, p0, Lorg/ligi/axt/extensions/BitmapAXT;->bitmap:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lorg/ligi/axt/extensions/BitmapAXT;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    iget-object v2, p0, Lorg/ligi/axt/extensions/BitmapAXT;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x1

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    .line 30
    .end local v7    # "outScaleX":F
    .end local v8    # "outScaleY":F
    :cond_3d
    int-to-float v0, p1

    mul-float/2addr v0, p3

    iget-object v2, p0, Lorg/ligi/axt/extensions/BitmapAXT;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    div-float v8, v0, v2

    .restart local v8    # "outScaleY":F
    goto :goto_16

    .line 38
    :cond_49
    int-to-float v0, p2

    mul-float/2addr v0, p4

    iget-object v2, p0, Lorg/ligi/axt/extensions/BitmapAXT;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float v7, v0, v2

    .restart local v7    # "outScaleX":F
    goto :goto_25
.end method

.method public scaleRelative2View(Landroid/view/View;FF)Landroid/graphics/Bitmap;
    .registers 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "inScaleX"    # F
    .param p3, "inScaleY"    # F

    .prologue
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-virtual {p0, v0, v1, p2, p3}, Lorg/ligi/axt/extensions/BitmapAXT;->scaleRelative(IIFF)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public scaleToFitMaxPixels(ILandroid/graphics/Point;)Landroid/graphics/Point;
    .registers 7
    .param p1, "maxPixels"    # I
    .param p2, "point"    # Landroid/graphics/Point;

    .prologue
    .line 52
    iget v1, p2, Landroid/graphics/Point;->x:I

    if-ge v1, p1, :cond_1a

    iget v1, p2, Landroid/graphics/Point;->y:I

    if-ge v1, p1, :cond_1a

    .line 54
    const/high16 v0, 0x3f800000    # 1.0f

    .line 64
    .local v0, "scale":F
    :goto_a
    new-instance v1, Landroid/graphics/Point;

    iget v2, p2, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    mul-float/2addr v2, v0

    float-to-int v2, v2

    iget v3, p2, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    mul-float/2addr v3, v0

    float-to-int v3, v3

    invoke-direct {v1, v2, v3}, Landroid/graphics/Point;-><init>(II)V

    return-object v1

    .line 57
    .end local v0    # "scale":F
    :cond_1a
    iget v1, p2, Landroid/graphics/Point;->x:I

    iget v2, p2, Landroid/graphics/Point;->y:I

    if-le v1, v2, :cond_27

    .line 58
    iget v1, p2, Landroid/graphics/Point;->x:I

    int-to-float v1, v1

    int-to-float v2, p1

    div-float v0, v1, v2

    .restart local v0    # "scale":F
    goto :goto_a

    .line 60
    .end local v0    # "scale":F
    :cond_27
    iget v1, p2, Landroid/graphics/Point;->y:I

    int-to-float v1, v1

    int-to-float v2, p1

    div-float v0, v1, v2

    .restart local v0    # "scale":F
    goto :goto_a
.end method
