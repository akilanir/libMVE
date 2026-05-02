.class public Lcom/journeyapps/barcodescanner/BarcodeEncoder;
.super Ljava/lang/Object;
.source "BarcodeEncoder.java"


# static fields
.field private static final BLACK:I = -0x1000000

.field private static final WHITE:I = -0x1


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method


# virtual methods
.method public createBitmap(Lcom/google/zxing/common/BitMatrix;)Landroid/graphics/Bitmap;
    .registers 13
    .param p1, "matrix"    # Lcom/google/zxing/common/BitMatrix;

    .prologue
    const/4 v2, 0x0

    .line 31
    invoke-virtual {p1}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v3

    .line 32
    .local v3, "width":I
    invoke-virtual {p1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v7

    .line 33
    .local v7, "height":I
    mul-int v4, v3, v7

    new-array v1, v4, [I

    .line 34
    .local v1, "pixels":[I
    const/4 v10, 0x0

    .local v10, "y":I
    :goto_e
    if-ge v10, v7, :cond_29

    .line 35
    mul-int v8, v10, v3

    .line 36
    .local v8, "offset":I
    const/4 v9, 0x0

    .local v9, "x":I
    :goto_13
    if-ge v9, v3, :cond_26

    .line 37
    add-int v5, v8, v9

    invoke-virtual {p1, v9, v10}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v4

    if-eqz v4, :cond_24

    const/high16 v4, -0x1000000

    :goto_1f
    aput v4, v1, v5

    .line 36
    add-int/lit8 v9, v9, 0x1

    goto :goto_13

    .line 37
    :cond_24
    const/4 v4, -0x1

    goto :goto_1f

    .line 34
    :cond_26
    add-int/lit8 v10, v10, 0x1

    goto :goto_e

    .line 41
    .end local v8    # "offset":I
    .end local v9    # "x":I
    :cond_29
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v7, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .local v0, "bitmap":Landroid/graphics/Bitmap;
    move v4, v2

    move v5, v2

    move v6, v3

    .line 42
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    .line 43
    return-object v0
.end method

.method public encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    .registers 7
    .param p1, "contents"    # Ljava/lang/String;
    .param p2, "format"    # Lcom/google/zxing/BarcodeFormat;
    .param p3, "width"    # I
    .param p4, "height"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    .line 48
    :try_start_0
    new-instance v1, Lcom/google/zxing/MultiFormatWriter;

    invoke-direct {v1}, Lcom/google/zxing/MultiFormatWriter;-><init>()V

    invoke-virtual {v1, p1, p2, p3, p4}, Lcom/google/zxing/MultiFormatWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    :try_end_8
    .catch Lcom/google/zxing/WriterException; {:try_start_0 .. :try_end_8} :catch_a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_8} :catch_c

    move-result-object v1

    return-object v1

    .line 49
    :catch_a
    move-exception v0

    .line 50
    .local v0, "e":Lcom/google/zxing/WriterException;
    throw v0

    .line 51
    .end local v0    # "e":Lcom/google/zxing/WriterException;
    :catch_c
    move-exception v0

    .line 53
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lcom/google/zxing/WriterException;

    invoke-direct {v1, v0}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    .registers 13
    .param p1, "contents"    # Ljava/lang/String;
    .param p2, "format"    # Lcom/google/zxing/BarcodeFormat;
    .param p3, "width"    # I
    .param p4, "height"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/zxing/BarcodeFormat;",
            "II",
            "Ljava/util/Map",
            "<",
            "Lcom/google/zxing/EncodeHintType;",
            "*>;)",
            "Lcom/google/zxing/common/BitMatrix;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    .line 59
    .local p5, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;*>;"
    :try_start_0
    new-instance v0, Lcom/google/zxing/MultiFormatWriter;

    invoke-direct {v0}, Lcom/google/zxing/MultiFormatWriter;-><init>()V

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/google/zxing/MultiFormatWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    :try_end_d
    .catch Lcom/google/zxing/WriterException; {:try_start_0 .. :try_end_d} :catch_f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_d} :catch_11

    move-result-object v0

    return-object v0

    .line 60
    :catch_f
    move-exception v6

    .line 61
    .local v6, "e":Lcom/google/zxing/WriterException;
    throw v6

    .line 62
    .end local v6    # "e":Lcom/google/zxing/WriterException;
    :catch_11
    move-exception v6

    .line 63
    .local v6, "e":Ljava/lang/Exception;
    new-instance v0, Lcom/google/zxing/WriterException;

    invoke-direct {v0, v6}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public encodeBitmap(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Landroid/graphics/Bitmap;
    .registers 6
    .param p1, "contents"    # Ljava/lang/String;
    .param p2, "format"    # Lcom/google/zxing/BarcodeFormat;
    .param p3, "width"    # I
    .param p4, "height"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    .line 68
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/journeyapps/barcodescanner/BarcodeEncoder;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/journeyapps/barcodescanner/BarcodeEncoder;->createBitmap(Lcom/google/zxing/common/BitMatrix;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public encodeBitmap(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Landroid/graphics/Bitmap;
    .registers 7
    .param p1, "contents"    # Ljava/lang/String;
    .param p2, "format"    # Lcom/google/zxing/BarcodeFormat;
    .param p3, "width"    # I
    .param p4, "height"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/zxing/BarcodeFormat;",
            "II",
            "Ljava/util/Map",
            "<",
            "Lcom/google/zxing/EncodeHintType;",
            "*>;)",
            "Landroid/graphics/Bitmap;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    .line 72
    .local p5, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;*>;"
    invoke-virtual/range {p0 .. p5}, Lcom/journeyapps/barcodescanner/BarcodeEncoder;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/journeyapps/barcodescanner/BarcodeEncoder;->createBitmap(Lcom/google/zxing/common/BitMatrix;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method
