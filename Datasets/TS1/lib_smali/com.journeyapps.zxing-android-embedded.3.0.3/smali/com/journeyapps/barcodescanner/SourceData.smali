.class public Lcom/journeyapps/barcodescanner/SourceData;
.super Ljava/lang/Object;
.source "SourceData.java"


# instance fields
.field private cropRect:Landroid/graphics/Rect;

.field private data:[B

.field private dataHeight:I

.field private dataWidth:I

.field private imageFormat:I

.field private rotation:I


# direct methods
.method public constructor <init>([BIIII)V
    .registers 6
    .param p1, "data"    # [B
    .param p2, "dataWidth"    # I
    .param p3, "dataHeight"    # I
    .param p4, "imageFormat"    # I
    .param p5, "rotation"    # I

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/SourceData;->data:[B

    .line 45
    iput p2, p0, Lcom/journeyapps/barcodescanner/SourceData;->dataWidth:I

    .line 46
    iput p3, p0, Lcom/journeyapps/barcodescanner/SourceData;->dataHeight:I

    .line 47
    iput p5, p0, Lcom/journeyapps/barcodescanner/SourceData;->rotation:I

    .line 48
    iput p4, p0, Lcom/journeyapps/barcodescanner/SourceData;->imageFormat:I

    .line 49
    return-void
.end method

.method private getBitmap(Landroid/graphics/Rect;I)Landroid/graphics/Bitmap;
    .registers 16
    .param p1, "cropRect"    # Landroid/graphics/Rect;
    .param p2, "scaleFactor"    # I

    .prologue
    const/4 v12, 0x0

    .line 128
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/SourceData;->isRotated()Z

    move-result v2

    if-eqz v2, :cond_15

    .line 130
    new-instance v9, Landroid/graphics/Rect;

    iget v2, p1, Landroid/graphics/Rect;->top:I

    iget v3, p1, Landroid/graphics/Rect;->left:I

    iget v4, p1, Landroid/graphics/Rect;->bottom:I

    iget v5, p1, Landroid/graphics/Rect;->right:I

    invoke-direct {v9, v2, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .end local p1    # "cropRect":Landroid/graphics/Rect;
    .local v9, "cropRect":Landroid/graphics/Rect;
    move-object p1, v9

    .line 134
    .end local v9    # "cropRect":Landroid/graphics/Rect;
    .restart local p1    # "cropRect":Landroid/graphics/Rect;
    :cond_15
    new-instance v0, Landroid/graphics/YuvImage;

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/SourceData;->data:[B

    iget v2, p0, Lcom/journeyapps/barcodescanner/SourceData;->imageFormat:I

    iget v3, p0, Lcom/journeyapps/barcodescanner/SourceData;->dataWidth:I

    iget v4, p0, Lcom/journeyapps/barcodescanner/SourceData;->dataHeight:I

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Landroid/graphics/YuvImage;-><init>([BIII[I)V

    .line 135
    .local v0, "img":Landroid/graphics/YuvImage;
    new-instance v8, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v8}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 136
    .local v8, "buffer":Ljava/io/ByteArrayOutputStream;
    const/16 v2, 0x5a

    invoke-virtual {v0, p1, v2, v8}, Landroid/graphics/YuvImage;->compressToJpeg(Landroid/graphics/Rect;ILjava/io/OutputStream;)Z

    .line 137
    invoke-virtual {v8}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v10

    .line 139
    .local v10, "jpegData":[B
    new-instance v11, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v11}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 140
    .local v11, "options":Landroid/graphics/BitmapFactory$Options;
    iput p2, v11, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 141
    array-length v2, v10

    invoke-static {v10, v12, v2, v11}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 144
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    iget v2, p0, Lcom/journeyapps/barcodescanner/SourceData;->rotation:I

    if-eqz v2, :cond_5b

    .line 145
    new-instance v6, Landroid/graphics/Matrix;

    invoke-direct {v6}, Landroid/graphics/Matrix;-><init>()V

    .line 146
    .local v6, "imageMatrix":Landroid/graphics/Matrix;
    iget v2, p0, Lcom/journeyapps/barcodescanner/SourceData;->rotation:I

    int-to-float v2, v2

    invoke-virtual {v6, v2}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 147
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    move v2, v12

    move v3, v12

    move v7, v12

    invoke-static/range {v1 .. v7}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 150
    .end local v6    # "imageMatrix":Landroid/graphics/Matrix;
    :cond_5b
    return-object v1
.end method

.method public static rotate180([BII)[B
    .registers 8
    .param p0, "data"    # [B
    .param p1, "imageWidth"    # I
    .param p2, "imageHeight"    # I

    .prologue
    .line 201
    mul-int v2, p1, p2

    .line 202
    .local v2, "n":I
    new-array v3, v2, [B

    .line 204
    .local v3, "yuv":[B
    add-int/lit8 v0, v2, -0x1

    .line 205
    .local v0, "i":I
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_7
    if-ge v1, v2, :cond_12

    .line 206
    aget-byte v4, p0, v1

    aput-byte v4, v3, v0

    .line 207
    add-int/lit8 v0, v0, -0x1

    .line 205
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 209
    :cond_12
    return-object v3
.end method

.method public static rotateCCW([BII)[B
    .registers 9
    .param p0, "data"    # [B
    .param p1, "imageWidth"    # I
    .param p2, "imageHeight"    # I

    .prologue
    .line 221
    mul-int v1, p1, p2

    .line 222
    .local v1, "n":I
    new-array v4, v1, [B

    .line 223
    .local v4, "yuv":[B
    add-int/lit8 v0, v1, -0x1

    .line 224
    .local v0, "i":I
    const/4 v2, 0x0

    .local v2, "x":I
    :goto_7
    if-ge v2, p1, :cond_1c

    .line 225
    add-int/lit8 v3, p2, -0x1

    .local v3, "y":I
    :goto_b
    if-ltz v3, :cond_19

    .line 226
    mul-int v5, v3, p1

    add-int/2addr v5, v2

    aget-byte v5, p0, v5

    aput-byte v5, v4, v0

    .line 227
    add-int/lit8 v0, v0, -0x1

    .line 225
    add-int/lit8 v3, v3, -0x1

    goto :goto_b

    .line 224
    :cond_19
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 230
    .end local v3    # "y":I
    :cond_1c
    return-object v4
.end method

.method public static rotateCW([BII)[B
    .registers 8
    .param p0, "data"    # [B
    .param p1, "imageWidth"    # I
    .param p2, "imageHeight"    # I

    .prologue
    .line 181
    mul-int v4, p1, p2

    new-array v3, v4, [B

    .line 182
    .local v3, "yuv":[B
    const/4 v0, 0x0

    .line 183
    .local v0, "i":I
    const/4 v1, 0x0

    .local v1, "x":I
    :goto_6
    if-ge v1, p1, :cond_1b

    .line 184
    add-int/lit8 v2, p2, -0x1

    .local v2, "y":I
    :goto_a
    if-ltz v2, :cond_18

    .line 185
    mul-int v4, v2, p1

    add-int/2addr v4, v1

    aget-byte v4, p0, v4

    aput-byte v4, v3, v0

    .line 186
    add-int/lit8 v0, v0, 0x1

    .line 184
    add-int/lit8 v2, v2, -0x1

    goto :goto_a

    .line 183
    :cond_18
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 189
    .end local v2    # "y":I
    :cond_1b
    return-object v3
.end method

.method public static rotateCameraPreview(I[BII)[B
    .registers 4
    .param p0, "cameraRotation"    # I
    .param p1, "data"    # [B
    .param p2, "imageWidth"    # I
    .param p3, "imageHeight"    # I

    .prologue
    .line 154
    sparse-switch p0, :sswitch_data_14

    .line 165
    .end local p1    # "data":[B
    :goto_3
    :sswitch_3
    return-object p1

    .line 158
    .restart local p1    # "data":[B
    :sswitch_4
    invoke-static {p1, p2, p3}, Lcom/journeyapps/barcodescanner/SourceData;->rotateCW([BII)[B

    move-result-object p1

    goto :goto_3

    .line 160
    :sswitch_9
    invoke-static {p1, p2, p3}, Lcom/journeyapps/barcodescanner/SourceData;->rotate180([BII)[B

    move-result-object p1

    goto :goto_3

    .line 162
    :sswitch_e
    invoke-static {p1, p2, p3}, Lcom/journeyapps/barcodescanner/SourceData;->rotateCCW([BII)[B

    move-result-object p1

    goto :goto_3

    .line 154
    nop

    :sswitch_data_14
    .sparse-switch
        0x0 -> :sswitch_3
        0x5a -> :sswitch_4
        0xb4 -> :sswitch_9
        0x10e -> :sswitch_e
    .end sparse-switch
.end method


# virtual methods
.method public createSource()Lcom/google/zxing/PlanarYUVLuminanceSource;
    .registers 10

    .prologue
    const/4 v8, 0x0

    .line 97
    iget v0, p0, Lcom/journeyapps/barcodescanner/SourceData;->rotation:I

    iget-object v2, p0, Lcom/journeyapps/barcodescanner/SourceData;->data:[B

    iget v3, p0, Lcom/journeyapps/barcodescanner/SourceData;->dataWidth:I

    iget v4, p0, Lcom/journeyapps/barcodescanner/SourceData;->dataHeight:I

    invoke-static {v0, v2, v3, v4}, Lcom/journeyapps/barcodescanner/SourceData;->rotateCameraPreview(I[BII)[B

    move-result-object v1

    .line 100
    .local v1, "rotated":[B
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/SourceData;->isRotated()Z

    move-result v0

    if-eqz v0, :cond_31

    .line 102
    new-instance v0, Lcom/google/zxing/PlanarYUVLuminanceSource;

    iget v2, p0, Lcom/journeyapps/barcodescanner/SourceData;->dataHeight:I

    iget v3, p0, Lcom/journeyapps/barcodescanner/SourceData;->dataWidth:I

    iget-object v4, p0, Lcom/journeyapps/barcodescanner/SourceData;->cropRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    iget-object v5, p0, Lcom/journeyapps/barcodescanner/SourceData;->cropRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    iget-object v6, p0, Lcom/journeyapps/barcodescanner/SourceData;->cropRect:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v6

    iget-object v7, p0, Lcom/journeyapps/barcodescanner/SourceData;->cropRect:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v7

    invoke-direct/range {v0 .. v8}, Lcom/google/zxing/PlanarYUVLuminanceSource;-><init>([BIIIIIIZ)V

    .line 104
    :goto_30
    return-object v0

    :cond_31
    new-instance v0, Lcom/google/zxing/PlanarYUVLuminanceSource;

    iget v2, p0, Lcom/journeyapps/barcodescanner/SourceData;->dataWidth:I

    iget v3, p0, Lcom/journeyapps/barcodescanner/SourceData;->dataHeight:I

    iget-object v4, p0, Lcom/journeyapps/barcodescanner/SourceData;->cropRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    iget-object v5, p0, Lcom/journeyapps/barcodescanner/SourceData;->cropRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    iget-object v6, p0, Lcom/journeyapps/barcodescanner/SourceData;->cropRect:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v6

    iget-object v7, p0, Lcom/journeyapps/barcodescanner/SourceData;->cropRect:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v7

    invoke-direct/range {v0 .. v8}, Lcom/google/zxing/PlanarYUVLuminanceSource;-><init>([BIIIIIIZ)V

    goto :goto_30
.end method

.method public getBitmap()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    .line 114
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/journeyapps/barcodescanner/SourceData;->getBitmap(I)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public getBitmap(I)Landroid/graphics/Bitmap;
    .registers 3
    .param p1, "scaleFactor"    # I

    .prologue
    .line 124
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/SourceData;->cropRect:Landroid/graphics/Rect;

    invoke-direct {p0, v0, p1}, Lcom/journeyapps/barcodescanner/SourceData;->getBitmap(Landroid/graphics/Rect;I)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public getCropRect()Landroid/graphics/Rect;
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/SourceData;->cropRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getData()[B
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/SourceData;->data:[B

    return-object v0
.end method

.method public getDataHeight()I
    .registers 2

    .prologue
    .line 81
    iget v0, p0, Lcom/journeyapps/barcodescanner/SourceData;->dataHeight:I

    return v0
.end method

.method public getDataWidth()I
    .registers 2

    .prologue
    .line 73
    iget v0, p0, Lcom/journeyapps/barcodescanner/SourceData;->dataWidth:I

    return v0
.end method

.method public getImageFormat()I
    .registers 2

    .prologue
    .line 93
    iget v0, p0, Lcom/journeyapps/barcodescanner/SourceData;->imageFormat:I

    return v0
.end method

.method public isRotated()Z
    .registers 2

    .prologue
    .line 89
    iget v0, p0, Lcom/journeyapps/barcodescanner/SourceData;->rotation:I

    rem-int/lit16 v0, v0, 0xb4

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public setCropRect(Landroid/graphics/Rect;)V
    .registers 2
    .param p1, "cropRect"    # Landroid/graphics/Rect;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/SourceData;->cropRect:Landroid/graphics/Rect;

    .line 62
    return-void
.end method
