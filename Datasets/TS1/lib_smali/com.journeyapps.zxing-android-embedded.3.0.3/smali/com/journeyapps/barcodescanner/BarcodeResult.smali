.class public Lcom/journeyapps/barcodescanner/BarcodeResult;
.super Ljava/lang/Object;
.source "BarcodeResult.java"


# static fields
.field private static final PREVIEW_DOT_WIDTH:F = 10.0f

.field private static final PREVIEW_LINE_WIDTH:F = 4.0f


# instance fields
.field protected mResult:Lcom/google/zxing/Result;

.field private final mScaleFactor:I

.field protected sourceData:Lcom/journeyapps/barcodescanner/SourceData;


# direct methods
.method public constructor <init>(Lcom/google/zxing/Result;Lcom/journeyapps/barcodescanner/SourceData;)V
    .registers 4
    .param p1, "result"    # Lcom/google/zxing/Result;
    .param p2, "sourceData"    # Lcom/journeyapps/barcodescanner/SourceData;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    const/4 v0, 0x2

    iput v0, p0, Lcom/journeyapps/barcodescanner/BarcodeResult;->mScaleFactor:I

    .line 31
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/BarcodeResult;->mResult:Lcom/google/zxing/Result;

    .line 32
    iput-object p2, p0, Lcom/journeyapps/barcodescanner/BarcodeResult;->sourceData:Lcom/journeyapps/barcodescanner/SourceData;

    .line 33
    return-void
.end method

.method private static drawLine(Landroid/graphics/Canvas;Landroid/graphics/Paint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)V
    .registers 11
    .param p0, "canvas"    # Landroid/graphics/Canvas;
    .param p1, "paint"    # Landroid/graphics/Paint;
    .param p2, "a"    # Lcom/google/zxing/ResultPoint;
    .param p3, "b"    # Lcom/google/zxing/ResultPoint;
    .param p4, "scaleFactor"    # I

    .prologue
    .line 36
    if-eqz p2, :cond_25

    if-eqz p3, :cond_25

    .line 37
    invoke-virtual {p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    int-to-float v1, p4

    div-float v1, v0, v1

    invoke-virtual {p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v0

    int-to-float v2, p4

    div-float v2, v0, v2

    invoke-virtual {p3}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    int-to-float v3, p4

    div-float v3, v0, v3

    invoke-virtual {p3}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v0

    int-to-float v4, p4

    div-float v4, v0, v4

    move-object v0, p0

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 43
    :cond_25
    return-void
.end method


# virtual methods
.method public getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;
    .registers 2

    .prologue
    .line 135
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeResult;->mResult:Lcom/google/zxing/Result;

    invoke-virtual {v0}, Lcom/google/zxing/Result;->getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;

    move-result-object v0

    return-object v0
.end method

.method public getBitmap()Landroid/graphics/Bitmap;
    .registers 3

    .prologue
    .line 57
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeResult;->sourceData:Lcom/journeyapps/barcodescanner/SourceData;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/SourceData;->getBitmap(I)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public getBitmapScaleFactor()I
    .registers 2

    .prologue
    .line 101
    const/4 v0, 0x2

    return v0
.end method

.method public getBitmapWithResultPoints(I)Landroid/graphics/Bitmap;
    .registers 14
    .param p1, "color"    # I

    .prologue
    .line 65
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/BarcodeResult;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    .line 66
    .local v2, "bitmap":Landroid/graphics/Bitmap;
    move-object v1, v2

    .line 67
    .local v1, "barcode":Landroid/graphics/Bitmap;
    iget-object v9, p0, Lcom/journeyapps/barcodescanner/BarcodeResult;->mResult:Lcom/google/zxing/Result;

    invoke-virtual {v9}, Lcom/google/zxing/Result;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v8

    .line 69
    .local v8, "points":[Lcom/google/zxing/ResultPoint;
    if-eqz v8, :cond_46

    array-length v9, v8

    if-lez v9, :cond_46

    if-eqz v2, :cond_46

    .line 70
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    sget-object v11, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v9, v10, v11}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 71
    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 72
    .local v3, "canvas":Landroid/graphics/Canvas;
    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual {v3, v2, v9, v10, v11}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 73
    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    .line 74
    .local v6, "paint":Landroid/graphics/Paint;
    invoke-virtual {v6, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 75
    array-length v9, v8

    const/4 v10, 0x2

    if-ne v9, v10, :cond_47

    .line 76
    const/high16 v9, 0x40800000    # 4.0f

    invoke-virtual {v6, v9}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 77
    const/4 v9, 0x0

    aget-object v9, v8, v9

    const/4 v10, 0x1

    aget-object v10, v8, v10

    const/4 v11, 0x2

    invoke-static {v3, v6, v9, v10, v11}, Lcom/journeyapps/barcodescanner/BarcodeResult;->drawLine(Landroid/graphics/Canvas;Landroid/graphics/Paint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)V

    .line 93
    .end local v3    # "canvas":Landroid/graphics/Canvas;
    .end local v6    # "paint":Landroid/graphics/Paint;
    :cond_46
    :goto_46
    return-object v1

    .line 78
    .restart local v3    # "canvas":Landroid/graphics/Canvas;
    .restart local v6    # "paint":Landroid/graphics/Paint;
    :cond_47
    array-length v9, v8

    const/4 v10, 0x4

    if-ne v9, v10, :cond_74

    iget-object v9, p0, Lcom/journeyapps/barcodescanner/BarcodeResult;->mResult:Lcom/google/zxing/Result;

    invoke-virtual {v9}, Lcom/google/zxing/Result;->getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;

    move-result-object v9

    sget-object v10, Lcom/google/zxing/BarcodeFormat;->UPC_A:Lcom/google/zxing/BarcodeFormat;

    if-eq v9, v10, :cond_5f

    iget-object v9, p0, Lcom/journeyapps/barcodescanner/BarcodeResult;->mResult:Lcom/google/zxing/Result;

    invoke-virtual {v9}, Lcom/google/zxing/Result;->getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;

    move-result-object v9

    sget-object v10, Lcom/google/zxing/BarcodeFormat;->EAN_13:Lcom/google/zxing/BarcodeFormat;

    if-ne v9, v10, :cond_74

    .line 82
    :cond_5f
    const/4 v9, 0x0

    aget-object v9, v8, v9

    const/4 v10, 0x1

    aget-object v10, v8, v10

    const/4 v11, 0x2

    invoke-static {v3, v6, v9, v10, v11}, Lcom/journeyapps/barcodescanner/BarcodeResult;->drawLine(Landroid/graphics/Canvas;Landroid/graphics/Paint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)V

    .line 83
    const/4 v9, 0x2

    aget-object v9, v8, v9

    const/4 v10, 0x3

    aget-object v10, v8, v10

    const/4 v11, 0x2

    invoke-static {v3, v6, v9, v10, v11}, Lcom/journeyapps/barcodescanner/BarcodeResult;->drawLine(Landroid/graphics/Canvas;Landroid/graphics/Paint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)V

    goto :goto_46

    .line 85
    :cond_74
    const/high16 v9, 0x41200000    # 10.0f

    invoke-virtual {v6, v9}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 86
    move-object v0, v8

    .local v0, "arr$":[Lcom/google/zxing/ResultPoint;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_7c
    if-ge v4, v5, :cond_46

    aget-object v7, v0, v4

    .line 87
    .local v7, "point":Lcom/google/zxing/ResultPoint;
    if-eqz v7, :cond_93

    .line 88
    invoke-virtual {v7}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v9

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v9, v10

    invoke-virtual {v7}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v10

    const/high16 v11, 0x40000000    # 2.0f

    div-float/2addr v10, v11

    invoke-virtual {v3, v9, v10, v6}, Landroid/graphics/Canvas;->drawPoint(FFLandroid/graphics/Paint;)V

    .line 86
    :cond_93
    add-int/lit8 v4, v4, 0x1

    goto :goto_7c
.end method

.method public getRawBytes()[B
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeResult;->mResult:Lcom/google/zxing/Result;

    invoke-virtual {v0}, Lcom/google/zxing/Result;->getRawBytes()[B

    move-result-object v0

    return-object v0
.end method

.method public getResult()Lcom/google/zxing/Result;
    .registers 2

    .prologue
    .line 49
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeResult;->mResult:Lcom/google/zxing/Result;

    return-object v0
.end method

.method public getResultMetadata()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lcom/google/zxing/ResultMetadataType;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 145
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeResult;->mResult:Lcom/google/zxing/Result;

    invoke-virtual {v0}, Lcom/google/zxing/Result;->getResultMetadata()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getResultPoints()[Lcom/google/zxing/ResultPoint;
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeResult;->mResult:Lcom/google/zxing/Result;

    invoke-virtual {v0}, Lcom/google/zxing/Result;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v0

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeResult;->mResult:Lcom/google/zxing/Result;

    invoke-virtual {v0}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTimestamp()J
    .registers 3

    .prologue
    .line 149
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeResult;->mResult:Lcom/google/zxing/Result;

    invoke-virtual {v0}, Lcom/google/zxing/Result;->getTimestamp()J

    move-result-wide v0

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 154
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeResult;->mResult:Lcom/google/zxing/Result;

    invoke-virtual {v0}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
