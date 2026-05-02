.class final Lcom/theartofdev/edmodo/cropper/BitmapUtils;
.super Ljava/lang/Object;
.source "BitmapUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/theartofdev/edmodo/cropper/BitmapUtils$RotateBitmapResult;,
        Lcom/theartofdev/edmodo/cropper/BitmapUtils$DecodeBitmapResult;
    }
.end annotation


# static fields
.field static final EMPTY_RECT:Landroid/graphics/Rect;

.field static final EMPTY_RECT_F:Landroid/graphics/RectF;

.field static final RECT:Landroid/graphics/RectF;

.field static mMaxTextureSize:I

.field static mStateBitmap:Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 47
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->EMPTY_RECT:Landroid/graphics/Rect;

    .line 49
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    sput-object v0, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->EMPTY_RECT_F:Landroid/graphics/RectF;

    .line 54
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    sput-object v0, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->RECT:Landroid/graphics/RectF;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static calculateInSampleSizeByMaxTextureSize(II)I
    .registers 5
    .param p0, "width"    # I
    .param p1, "height"    # I

    .prologue
    .line 382
    const/4 v0, 0x1

    .line 383
    .local v0, "inSampleSize":I
    sget v1, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->mMaxTextureSize:I

    if-nez v1, :cond_b

    .line 384
    invoke-static {}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->getMaxTextureSize()I

    move-result v1

    sput v1, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->mMaxTextureSize:I

    .line 386
    :cond_b
    sget v1, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->mMaxTextureSize:I

    if-lez v1, :cond_1e

    .line 387
    :goto_f
    div-int v1, p1, v0

    sget v2, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->mMaxTextureSize:I

    if-gt v1, v2, :cond_1b

    div-int v1, p0, v0

    sget v2, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->mMaxTextureSize:I

    if-le v1, v2, :cond_1e

    .line 388
    :cond_1b
    mul-int/lit8 v0, v0, 0x2

    goto :goto_f

    .line 391
    :cond_1e
    return v0
.end method

.method private static calculateInSampleSizeByReqestedSize(IIII)I
    .registers 6
    .param p0, "width"    # I
    .param p1, "height"    # I
    .param p2, "reqWidth"    # I
    .param p3, "reqHeight"    # I

    .prologue
    .line 368
    const/4 v0, 0x1

    .line 369
    .local v0, "inSampleSize":I
    if-gt p1, p3, :cond_5

    if-le p0, p2, :cond_12

    .line 370
    :cond_5
    :goto_5
    div-int/lit8 v1, p1, 0x2

    div-int/2addr v1, v0

    if-le v1, p3, :cond_12

    div-int/lit8 v1, p0, 0x2

    div-int/2addr v1, v0

    if-le v1, p2, :cond_12

    .line 371
    mul-int/lit8 v0, v0, 0x2

    goto :goto_5

    .line 374
    :cond_12
    return v0
.end method

.method private static closeSafe(Ljava/io/Closeable;)V
    .registers 2
    .param p0, "closeable"    # Ljava/io/Closeable;

    .prologue
    .line 499
    if-eqz p0, :cond_5

    .line 501
    :try_start_2
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_6

    .line 505
    :cond_5
    :goto_5
    return-void

    .line 502
    :catch_6
    move-exception v0

    goto :goto_5
.end method

.method public static cropBitmap(Landroid/content/Context;Landroid/net/Uri;[FIIIZIIII)Landroid/graphics/Bitmap;
    .registers 26
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "loadedImageUri"    # Landroid/net/Uri;
    .param p2, "points"    # [F
    .param p3, "degreesRotated"    # I
    .param p4, "orgWidth"    # I
    .param p5, "orgHeight"    # I
    .param p6, "fixAspectRatio"    # Z
    .param p7, "aspectRatioX"    # I
    .param p8, "aspectRatioY"    # I
    .param p9, "reqWidth"    # I
    .param p10, "reqHeight"    # I

    .prologue
    .line 173
    move-object/from16 v2, p2

    move/from16 v3, p4

    move/from16 v4, p5

    move/from16 v5, p6

    move/from16 v6, p7

    move/from16 v7, p8

    invoke-static/range {v2 .. v7}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->getRectFromPoints([FIIZII)Landroid/graphics/Rect;

    move-result-object v4

    .line 175
    .local v4, "rect":Landroid/graphics/Rect;
    if-lez p9, :cond_3a

    move/from16 v14, p9

    .line 176
    .local v14, "width":I
    :goto_14
    if-lez p10, :cond_3f

    move/from16 v12, p10

    .line 178
    .local v12, "height":I
    :goto_18
    const/4 v2, 0x0

    .line 181
    .local v2, "result":Landroid/graphics/Bitmap;
    :try_start_19
    move-object/from16 v0, p1

    invoke-static {p0, v0, v4, v14, v12}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->decodeSampledBitmapRegion(Landroid/content/Context;Landroid/net/Uri;Landroid/graphics/Rect;II)Landroid/graphics/Bitmap;
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_1e} :catch_95

    move-result-object v2

    .line 185
    :goto_1f
    if-eqz v2, :cond_44

    .line 187
    move/from16 v0, p3

    invoke-static {v2, v0}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->rotateBitmapInt(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 190
    rem-int/lit8 v3, p3, 0x5a

    if-eqz v3, :cond_39

    move-object/from16 v3, p2

    move/from16 v5, p3

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    .line 193
    invoke-static/range {v2 .. v8}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->cropForRotatedImage(Landroid/graphics/Bitmap;[FLandroid/graphics/Rect;IZII)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 212
    :cond_39
    :goto_39
    return-object v2

    .line 175
    .end local v2    # "result":Landroid/graphics/Bitmap;
    .end local v12    # "height":I
    .end local v14    # "width":I
    :cond_3a
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v14

    goto :goto_14

    .line 176
    .restart local v14    # "width":I
    :cond_3f
    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v12

    goto :goto_18

    .line 199
    .restart local v2    # "result":Landroid/graphics/Bitmap;
    .restart local v12    # "height":I
    :cond_44
    :try_start_44
    new-instance v13, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v13}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 200
    .local v13, "options":Landroid/graphics/BitmapFactory$Options;
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v6

    move/from16 v0, p9

    move/from16 v1, p10

    invoke-static {v3, v6, v0, v1}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->calculateInSampleSizeByReqestedSize(IIII)I

    move-result v3

    iput v3, v13, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 202
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-static {v3, v0, v13}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->decodeImage(Landroid/content/ContentResolver;Landroid/net/Uri;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 203
    .local v5, "fullBitmap":Landroid/graphics/Bitmap;
    if-eqz v5, :cond_39

    move-object/from16 v6, p2

    move/from16 v7, p3

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    .line 204
    invoke-static/range {v5 .. v10}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->cropBitmap(Landroid/graphics/Bitmap;[FIZII)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 205
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_78
    .catch Ljava/lang/Exception; {:try_start_44 .. :try_end_78} :catch_79

    goto :goto_39

    .line 207
    .end local v5    # "fullBitmap":Landroid/graphics/Bitmap;
    .end local v13    # "options":Landroid/graphics/BitmapFactory$Options;
    :catch_79
    move-exception v11

    .line 208
    .local v11, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Failed to load sampled bitmap: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6, v11}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 182
    .end local v11    # "e":Ljava/lang/Exception;
    :catch_95
    move-exception v3

    goto :goto_1f
.end method

.method public static cropBitmap(Landroid/graphics/Bitmap;[FIZII)Landroid/graphics/Bitmap;
    .registers 19
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "points"    # [F
    .param p2, "degreesRotated"    # I
    .param p3, "fixAspectRatio"    # Z
    .param p4, "aspectRatioX"    # I
    .param p5, "aspectRatioY"    # I

    .prologue
    .line 143
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    move-object v0, p1

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    invoke-static/range {v0 .. v5}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->getRectFromPoints([FIIZII)Landroid/graphics/Rect;

    move-result-object v8

    .line 146
    .local v8, "rect":Landroid/graphics/Rect;
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 147
    .local v5, "matrix":Landroid/graphics/Matrix;
    int-to-float v0, p2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    invoke-virtual {v5, v0, v1, v2}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 148
    iget v1, v8, Landroid/graphics/Rect;->left:I

    iget v2, v8, Landroid/graphics/Rect;->top:I

    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v4

    const/4 v6, 0x1

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 150
    .local v6, "result":Landroid/graphics/Bitmap;
    if-ne v6, p0, :cond_47

    .line 152
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 156
    :cond_47
    rem-int/lit8 v0, p2, 0x5a

    if-eqz v0, :cond_57

    move-object v7, p1

    move v9, p2

    move/from16 v10, p3

    move/from16 v11, p4

    move/from16 v12, p5

    .line 159
    invoke-static/range {v6 .. v12}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->cropForRotatedImage(Landroid/graphics/Bitmap;[FLandroid/graphics/Rect;IZII)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 162
    :cond_57
    return-object v6
.end method

.method private static cropForRotatedImage(Landroid/graphics/Bitmap;[FLandroid/graphics/Rect;IZII)Landroid/graphics/Bitmap;
    .registers 23
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "points"    # [F
    .param p2, "rect"    # Landroid/graphics/Rect;
    .param p3, "degreesRotated"    # I
    .param p4, "fixAspectRatio"    # Z
    .param p5, "aspectRatioX"    # I
    .param p6, "aspectRatioY"    # I

    .prologue
    .line 336
    rem-int/lit8 v12, p3, 0x5a

    if-eqz v12, :cond_b3

    .line 338
    const/4 v3, 0x0

    .local v3, "adjLeft":I
    const/4 v4, 0x0

    .local v4, "adjTop":I
    const/4 v11, 0x0

    .local v11, "width":I
    const/4 v7, 0x0

    .line 339
    .local v7, "height":I
    move/from16 v0, p3

    int-to-double v12, v0

    invoke-static {v12, v13}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v9

    .line 340
    .local v9, "rads":D
    const/16 v12, 0x5a

    move/from16 v0, p3

    if-lt v0, v12, :cond_21

    const/16 v12, 0xb4

    move/from16 v0, p3

    if-le v0, v12, :cond_b4

    const/16 v12, 0x10e

    move/from16 v0, p3

    if-ge v0, v12, :cond_b4

    :cond_21
    move-object/from16 v0, p2

    iget v6, v0, Landroid/graphics/Rect;->left:I

    .line 341
    .local v6, "compareTo":I
    :goto_25
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_26
    move-object/from16 v0, p1

    array-length v12, v0

    if-ge v8, v12, :cond_84

    .line 342
    aget v12, p1, v8

    float-to-int v12, v12

    if-ne v12, v6, :cond_ba

    .line 343
    invoke-static {v9, v10}, Ljava/lang/Math;->sin(D)D

    move-result-wide v12

    move-object/from16 v0, p2

    iget v14, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v14, v14

    add-int/lit8 v15, v8, 0x1

    aget v15, p1, v15

    sub-float/2addr v14, v15

    float-to-double v14, v14

    mul-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->abs(D)D

    move-result-wide v12

    double-to-int v3, v12

    .line 344
    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    move-result-wide v12

    add-int/lit8 v14, v8, 0x1

    aget v14, p1, v14

    move-object/from16 v0, p2

    iget v15, v0, Landroid/graphics/Rect;->top:I

    int-to-float v15, v15

    sub-float/2addr v14, v15

    float-to-double v14, v14

    mul-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->abs(D)D

    move-result-wide v12

    double-to-int v4, v12

    .line 345
    add-int/lit8 v12, v8, 0x1

    aget v12, p1, v12

    move-object/from16 v0, p2

    iget v13, v0, Landroid/graphics/Rect;->top:I

    int-to-float v13, v13

    sub-float/2addr v12, v13

    float-to-double v12, v12

    invoke-static {v9, v10}, Ljava/lang/Math;->sin(D)D

    move-result-wide v14

    div-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->abs(D)D

    move-result-wide v12

    double-to-int v11, v12

    .line 346
    move-object/from16 v0, p2

    iget v12, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v12, v12

    add-int/lit8 v13, v8, 0x1

    aget v13, p1, v13

    sub-float/2addr v12, v13

    float-to-double v12, v12

    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    move-result-wide v14

    div-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->abs(D)D

    move-result-wide v12

    double-to-int v7, v12

    .line 351
    :cond_84
    add-int v12, v3, v11

    add-int v13, v4, v7

    move-object/from16 v0, p2

    invoke-virtual {v0, v3, v4, v12, v13}, Landroid/graphics/Rect;->set(IIII)V

    .line 352
    if-eqz p4, :cond_98

    .line 353
    move-object/from16 v0, p2

    move/from16 v1, p5

    move/from16 v2, p6

    invoke-static {v0, v1, v2}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->fixRectForAspectRatio(Landroid/graphics/Rect;II)V

    .line 356
    :cond_98
    move-object/from16 v5, p0

    .line 357
    .local v5, "bitmapTmp":Landroid/graphics/Bitmap;
    move-object/from16 v0, p2

    iget v12, v0, Landroid/graphics/Rect;->left:I

    move-object/from16 v0, p2

    iget v13, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Rect;->width()I

    move-result v14

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Rect;->height()I

    move-result v15

    move-object/from16 v0, p0

    invoke-static {v0, v12, v13, v14, v15}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 358
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->recycle()V

    .line 360
    .end local v3    # "adjLeft":I
    .end local v4    # "adjTop":I
    .end local v5    # "bitmapTmp":Landroid/graphics/Bitmap;
    .end local v6    # "compareTo":I
    .end local v7    # "height":I
    .end local v8    # "i":I
    .end local v9    # "rads":D
    .end local v11    # "width":I
    :cond_b3
    return-object p0

    .line 340
    .restart local v3    # "adjLeft":I
    .restart local v4    # "adjTop":I
    .restart local v7    # "height":I
    .restart local v9    # "rads":D
    .restart local v11    # "width":I
    :cond_b4
    move-object/from16 v0, p2

    iget v6, v0, Landroid/graphics/Rect;->right:I

    goto/16 :goto_25

    .line 341
    .restart local v6    # "compareTo":I
    .restart local v8    # "i":I
    :cond_ba
    add-int/lit8 v8, v8, 0x2

    goto/16 :goto_26
.end method

.method private static decodeImage(Landroid/content/ContentResolver;Landroid/net/Uri;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 8
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 285
    :cond_0
    const/4 v1, 0x0

    .line 287
    .local v1, "stream":Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1

    .line 288
    sget-object v2, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->EMPTY_RECT:Landroid/graphics/Rect;

    invoke-static {v1, v2, p2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_a
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_a} :catch_f
    .catchall {:try_start_1 .. :try_end_a} :catchall_38

    move-result-object v2

    .line 292
    invoke-static {v1}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->closeSafe(Ljava/io/Closeable;)V

    return-object v2

    .line 289
    :catch_f
    move-exception v0

    .line 290
    .local v0, "e":Ljava/lang/OutOfMemoryError;
    :try_start_10
    iget v2, p2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    mul-int/lit8 v2, v2, 0x2

    iput v2, p2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
    :try_end_16
    .catchall {:try_start_10 .. :try_end_16} :catchall_38

    .line 292
    invoke-static {v1}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->closeSafe(Ljava/io/Closeable;)V

    .line 294
    iget v2, p2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    const/16 v3, 0x200

    if-le v2, v3, :cond_0

    .line 295
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to decode image: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 292
    .end local v0    # "e":Ljava/lang/OutOfMemoryError;
    :catchall_38
    move-exception v2

    invoke-static {v1}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->closeSafe(Ljava/io/Closeable;)V

    throw v2
.end method

.method private static decodeImageForOption(Landroid/content/ContentResolver;Landroid/net/Uri;)Landroid/graphics/BitmapFactory$Options;
    .registers 5
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 266
    const/4 v1, 0x0

    .line 268
    .local v1, "stream":Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1

    .line 269
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 270
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v2, 0x1

    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 271
    sget-object v2, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->EMPTY_RECT:Landroid/graphics/Rect;

    invoke-static {v1, v2, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 272
    const/4 v2, 0x0

    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
    :try_end_15
    .catchall {:try_start_1 .. :try_end_15} :catchall_19

    .line 275
    invoke-static {v1}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->closeSafe(Ljava/io/Closeable;)V

    return-object v0

    .end local v0    # "options":Landroid/graphics/BitmapFactory$Options;
    :catchall_19
    move-exception v2

    invoke-static {v1}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->closeSafe(Ljava/io/Closeable;)V

    throw v2
.end method

.method public static decodeSampledBitmap(Landroid/content/Context;Landroid/net/Uri;II)Lcom/theartofdev/edmodo/cropper/BitmapUtils$DecodeBitmapResult;
    .registers 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "reqWidth"    # I
    .param p3, "reqHeight"    # I

    .prologue
    .line 114
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    .line 117
    .local v3, "resolver":Landroid/content/ContentResolver;
    invoke-static {v3, p1}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->decodeImageForOption(Landroid/content/ContentResolver;Landroid/net/Uri;)Landroid/graphics/BitmapFactory$Options;

    move-result-object v2

    .line 120
    .local v2, "options":Landroid/graphics/BitmapFactory$Options;
    iget v4, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v5, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 121
    invoke-static {v4, v5, p2, p3}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->calculateInSampleSizeByReqestedSize(IIII)I

    move-result v4

    iget v5, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v6, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 122
    invoke-static {v5, v6}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->calculateInSampleSizeByMaxTextureSize(II)I

    move-result v5

    .line 120
    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    iput v4, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 125
    invoke-static {v3, p1, v2}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->decodeImage(Landroid/content/ContentResolver;Landroid/net/Uri;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 127
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v4, Lcom/theartofdev/edmodo/cropper/BitmapUtils$DecodeBitmapResult;

    iget v5, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    invoke-direct {v4, v0, v5}, Lcom/theartofdev/edmodo/cropper/BitmapUtils$DecodeBitmapResult;-><init>(Landroid/graphics/Bitmap;I)V
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_29} :catch_2a

    return-object v4

    .line 129
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v2    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v3    # "resolver":Landroid/content/ContentResolver;
    :catch_2a
    move-exception v1

    .line 130
    .local v1, "e":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to load sampled bitmap: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method private static decodeSampledBitmapRegion(Landroid/content/Context;Landroid/net/Uri;Landroid/graphics/Rect;II)Landroid/graphics/Bitmap;
    .registers 12
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "rect"    # Landroid/graphics/Rect;
    .param p3, "reqWidth"    # I
    .param p4, "reqHeight"    # I

    .prologue
    .line 302
    const/4 v3, 0x0

    .line 303
    .local v3, "stream":Ljava/io/InputStream;
    const/4 v0, 0x0

    .line 305
    .local v0, "decoder":Landroid/graphics/BitmapRegionDecoder;
    :try_start_2
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 306
    .local v2, "options":Landroid/graphics/BitmapFactory$Options;
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v4

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v5

    invoke-static {v4, v5, p3, p4}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->calculateInSampleSizeByReqestedSize(IIII)I

    move-result v4

    iput v4, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 308
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v3

    .line 309
    const/4 v4, 0x0

    invoke-static {v3, v4}, Landroid/graphics/BitmapRegionDecoder;->newInstance(Ljava/io/InputStream;Z)Landroid/graphics/BitmapRegionDecoder;
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_21} :catch_46
    .catchall {:try_start_2 .. :try_end_21} :catchall_60

    move-result-object v0

    .line 312
    :cond_22
    :try_start_22
    invoke-virtual {v0, p2, v2}, Landroid/graphics/BitmapRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_25
    .catch Ljava/lang/OutOfMemoryError; {:try_start_22 .. :try_end_25} :catch_2f
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_25} :catch_46
    .catchall {:try_start_22 .. :try_end_25} :catchall_60

    move-result-object v4

    .line 320
    invoke-static {v3}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->closeSafe(Ljava/io/Closeable;)V

    .line 321
    if-eqz v0, :cond_2e

    .line 322
    invoke-virtual {v0}, Landroid/graphics/BitmapRegionDecoder;->recycle()V

    .line 325
    :cond_2e
    :goto_2e
    return-object v4

    .line 313
    :catch_2f
    move-exception v1

    .line 314
    .local v1, "e":Ljava/lang/OutOfMemoryError;
    :try_start_30
    iget v4, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    mul-int/lit8 v4, v4, 0x2

    iput v4, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 316
    iget v4, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_38} :catch_46
    .catchall {:try_start_30 .. :try_end_38} :catchall_60

    const/16 v5, 0x200

    if-le v4, v5, :cond_22

    .line 320
    invoke-static {v3}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->closeSafe(Ljava/io/Closeable;)V

    .line 321
    if-eqz v0, :cond_44

    .line 322
    invoke-virtual {v0}, Landroid/graphics/BitmapRegionDecoder;->recycle()V

    .line 325
    :cond_44
    const/4 v4, 0x0

    goto :goto_2e

    .line 317
    .end local v1    # "e":Ljava/lang/OutOfMemoryError;
    .end local v2    # "options":Landroid/graphics/BitmapFactory$Options;
    :catch_46
    move-exception v1

    .line 318
    .local v1, "e":Ljava/lang/Exception;
    :try_start_47
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to load sampled bitmap: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
    :try_end_60
    .catchall {:try_start_47 .. :try_end_60} :catchall_60

    .line 320
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_60
    move-exception v4

    invoke-static {v3}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->closeSafe(Ljava/io/Closeable;)V

    .line 321
    if-eqz v0, :cond_69

    .line 322
    invoke-virtual {v0}, Landroid/graphics/BitmapRegionDecoder;->recycle()V

    :cond_69
    throw v4
.end method

.method public static fixRectForAspectRatio(Landroid/graphics/Rect;II)V
    .registers 6
    .param p0, "rect"    # Landroid/graphics/Rect;
    .param p1, "aspectRatioX"    # I
    .param p2, "aspectRatioY"    # I

    .prologue
    .line 238
    if-ne p1, p2, :cond_24

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result v1

    if-eq v0, v1, :cond_24

    .line 239
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result v1

    if-le v0, v1, :cond_25

    .line 240
    iget v0, p0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result v2

    sub-int/2addr v1, v2

    sub-int/2addr v0, v1

    iput v0, p0, Landroid/graphics/Rect;->bottom:I

    .line 245
    :cond_24
    :goto_24
    return-void

    .line 242
    :cond_25
    iget v0, p0, Landroid/graphics/Rect;->right:I

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result v2

    sub-int/2addr v1, v2

    sub-int/2addr v0, v1

    iput v0, p0, Landroid/graphics/Rect;->right:I

    goto :goto_24
.end method

.method private static getFileFromUri(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/File;
    .registers 13
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 401
    new-instance v8, Ljava/io/File;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v8, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 402
    .local v8, "file":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_11

    move-object v9, v8

    .line 422
    .end local v8    # "file":Ljava/io/File;
    .local v9, "file":Ljava/lang/Object;
    :goto_10
    return-object v9

    .line 407
    .end local v9    # "file":Ljava/lang/Object;
    .restart local v8    # "file":Ljava/io/File;
    :cond_11
    const/4 v7, 0x0

    .line 409
    .local v7, "cursor":Landroid/database/Cursor;
    const/4 v0, 0x1

    :try_start_13
    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "_data"

    aput-object v1, v2, v0

    .line 410
    .local v2, "proj":[Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 411
    const-string v0, "_data"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    .line 412
    .local v6, "column_index":I
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 413
    invoke-interface {v7, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 414
    .local v10, "realPath":Ljava/lang/String;
    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_38} :catch_40
    .catchall {:try_start_13 .. :try_end_38} :catchall_47

    .line 417
    .end local v8    # "file":Ljava/io/File;
    .local v9, "file":Ljava/io/File;
    if-eqz v7, :cond_4e

    .line 418
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    move-object v8, v9

    .end local v2    # "proj":[Ljava/lang/String;
    .end local v6    # "column_index":I
    .end local v9    # "file":Ljava/io/File;
    .end local v10    # "realPath":Ljava/lang/String;
    .restart local v8    # "file":Ljava/io/File;
    :cond_3e
    :goto_3e
    move-object v9, v8

    .line 422
    .local v9, "file":Ljava/lang/Object;
    goto :goto_10

    .line 415
    .end local v9    # "file":Ljava/lang/Object;
    :catch_40
    move-exception v0

    .line 417
    if-eqz v7, :cond_3e

    .line 418
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_3e

    .line 417
    :catchall_47
    move-exception v0

    if-eqz v7, :cond_4d

    .line 418
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_4d
    throw v0

    .end local v8    # "file":Ljava/io/File;
    .restart local v2    # "proj":[Ljava/lang/String;
    .restart local v6    # "column_index":I
    .local v9, "file":Ljava/io/File;
    .restart local v10    # "realPath":Ljava/lang/String;
    :cond_4e
    move-object v8, v9

    .end local v9    # "file":Ljava/io/File;
    .restart local v8    # "file":Ljava/io/File;
    goto :goto_3e
.end method

.method private static getMaxTextureSize()I
    .registers 13

    .prologue
    const/16 v10, 0x800

    .line 449
    const/16 v0, 0x800

    .line 453
    .local v0, "IMAGE_MAX_BITMAP_DIMENSION":I
    :try_start_4
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object v4

    check-cast v4, Ljavax/microedition/khronos/egl/EGL10;

    .line 454
    .local v4, "egl":Ljavax/microedition/khronos/egl/EGL10;
    sget-object v11, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    invoke-interface {v4, v11}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v2

    .line 457
    .local v2, "display":Ljavax/microedition/khronos/egl/EGLDisplay;
    const/4 v11, 0x2

    new-array v9, v11, [I

    .line 458
    .local v9, "version":[I
    invoke-interface {v4, v2, v9}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    .line 461
    const/4 v11, 0x1

    new-array v8, v11, [I

    .line 462
    .local v8, "totalConfigurations":[I
    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-interface {v4, v2, v11, v12, v8}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigs(Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 465
    const/4 v11, 0x0

    aget v11, v8, v11

    new-array v1, v11, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 466
    .local v1, "configurationsList":[Ljavax/microedition/khronos/egl/EGLConfig;
    const/4 v11, 0x0

    aget v11, v8, v11

    invoke-interface {v4, v2, v1, v11, v8}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigs(Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 468
    const/4 v11, 0x1

    new-array v7, v11, [I

    .line 469
    .local v7, "textureSize":[I
    const/4 v6, 0x0

    .line 472
    .local v6, "maximumTextureSize":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2e
    const/4 v11, 0x0

    aget v11, v8, v11

    if-ge v5, v11, :cond_45

    .line 474
    aget-object v11, v1, v5

    const/16 v12, 0x302c

    invoke-interface {v4, v2, v11, v12, v7}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 477
    const/4 v11, 0x0

    aget v11, v7, v11

    if-ge v6, v11, :cond_42

    .line 478
    const/4 v11, 0x0

    aget v6, v7, v11

    .line 472
    :cond_42
    add-int/lit8 v5, v5, 0x1

    goto :goto_2e

    .line 483
    :cond_45
    invoke-interface {v4, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    .line 486
    const/16 v11, 0x800

    invoke-static {v6, v11}, Ljava/lang/Math;->max(II)I
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4d} :catch_4f

    move-result v10

    .line 488
    .end local v1    # "configurationsList":[Ljavax/microedition/khronos/egl/EGLConfig;
    .end local v2    # "display":Ljavax/microedition/khronos/egl/EGLDisplay;
    .end local v4    # "egl":Ljavax/microedition/khronos/egl/EGL10;
    .end local v5    # "i":I
    .end local v6    # "maximumTextureSize":I
    .end local v7    # "textureSize":[I
    .end local v8    # "totalConfigurations":[I
    .end local v9    # "version":[I
    :goto_4e
    return v10

    .line 487
    :catch_4f
    move-exception v3

    .line 488
    .local v3, "e":Ljava/lang/Exception;
    goto :goto_4e
.end method

.method public static getRectFromPoints([FIIZII)Landroid/graphics/Rect;
    .registers 14
    .param p0, "points"    # [F
    .param p1, "imageWidth"    # I
    .param p2, "imageHeight"    # I
    .param p3, "fixAspectRatio"    # Z
    .param p4, "aspectRatioX"    # I
    .param p5, "aspectRatioY"    # I

    .prologue
    .line 220
    const/4 v5, 0x0

    const/4 v6, 0x0

    aget v6, p0, v6

    const/4 v7, 0x2

    aget v7, p0, v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(FF)F

    move-result v6

    const/4 v7, 0x4

    aget v7, p0, v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(FF)F

    move-result v6

    const/4 v7, 0x6

    aget v7, p0, v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(FF)F

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v5

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 221
    .local v1, "left":I
    const/4 v5, 0x0

    const/4 v6, 0x1

    aget v6, p0, v6

    const/4 v7, 0x3

    aget v7, p0, v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(FF)F

    move-result v6

    const/4 v7, 0x5

    aget v7, p0, v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(FF)F

    move-result v6

    const/4 v7, 0x7

    aget v7, p0, v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(FF)F

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v5

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v4

    .line 222
    .local v4, "top":I
    int-to-float v5, p1

    const/4 v6, 0x0

    aget v6, p0, v6

    const/4 v7, 0x2

    aget v7, p0, v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(FF)F

    move-result v6

    const/4 v7, 0x4

    aget v7, p0, v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(FF)F

    move-result v6

    const/4 v7, 0x6

    aget v7, p0, v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(FF)F

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    move-result v5

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 223
    .local v3, "right":I
    int-to-float v5, p2

    const/4 v6, 0x1

    aget v6, p0, v6

    const/4 v7, 0x3

    aget v7, p0, v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(FF)F

    move-result v6

    const/4 v7, 0x5

    aget v7, p0, v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(FF)F

    move-result v6

    const/4 v7, 0x7

    aget v7, p0, v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(FF)F

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    move-result v5

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 225
    .local v0, "bottom":I
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2, v1, v4, v3, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 226
    .local v2, "rect":Landroid/graphics/Rect;
    if-eqz p3, :cond_8e

    .line 227
    invoke-static {v2, p4, p5}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->fixRectForAspectRatio(Landroid/graphics/Rect;II)V

    .line 230
    :cond_8e
    return-object v2
.end method

.method public static rotateBitmapByExif(Landroid/graphics/Bitmap;Landroid/content/Context;Landroid/net/Uri;)Lcom/theartofdev/edmodo/cropper/BitmapUtils$RotateBitmapResult;
    .registers 7
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 73
    :try_start_0
    invoke-static {p1, p2}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->getFileFromUri(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/File;

    move-result-object v1

    .line 74
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 75
    new-instance v0, Landroid/media/ExifInterface;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 76
    .local v0, "ei":Landroid/media/ExifInterface;
    invoke-static {p0, v0}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->rotateBitmapByExif(Landroid/graphics/Bitmap;Landroid/media/ExifInterface;)Lcom/theartofdev/edmodo/cropper/BitmapUtils$RotateBitmapResult;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_16} :catch_18

    move-result-object v2

    .line 80
    .end local v0    # "ei":Landroid/media/ExifInterface;
    .end local v1    # "file":Ljava/io/File;
    :goto_17
    return-object v2

    .line 78
    :catch_18
    move-exception v2

    .line 80
    :cond_19
    new-instance v2, Lcom/theartofdev/edmodo/cropper/BitmapUtils$RotateBitmapResult;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/theartofdev/edmodo/cropper/BitmapUtils$RotateBitmapResult;-><init>(Landroid/graphics/Bitmap;I)V

    goto :goto_17
.end method

.method public static rotateBitmapByExif(Landroid/graphics/Bitmap;Landroid/media/ExifInterface;)Lcom/theartofdev/edmodo/cropper/BitmapUtils$RotateBitmapResult;
    .registers 6
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "exif"    # Landroid/media/ExifInterface;

    .prologue
    .line 90
    const-string v2, "Orientation"

    const/4 v3, 0x1

    invoke-virtual {p1, v2, v3}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v1

    .line 91
    .local v1, "orientation":I
    packed-switch v1, :pswitch_data_1a

    .line 102
    :pswitch_a
    const/4 v0, 0x0

    .line 105
    .local v0, "degrees":I
    :goto_b
    new-instance v2, Lcom/theartofdev/edmodo/cropper/BitmapUtils$RotateBitmapResult;

    invoke-direct {v2, p0, v0}, Lcom/theartofdev/edmodo/cropper/BitmapUtils$RotateBitmapResult;-><init>(Landroid/graphics/Bitmap;I)V

    return-object v2

    .line 93
    .end local v0    # "degrees":I
    :pswitch_11
    const/16 v0, 0x5a

    .line 94
    .restart local v0    # "degrees":I
    goto :goto_b

    .line 96
    .end local v0    # "degrees":I
    :pswitch_14
    const/16 v0, 0xb4

    .line 97
    .restart local v0    # "degrees":I
    goto :goto_b

    .line 99
    .end local v0    # "degrees":I
    :pswitch_17
    const/16 v0, 0x10e

    .line 100
    .restart local v0    # "degrees":I
    goto :goto_b

    .line 91
    :pswitch_data_1a
    .packed-switch 0x3
        :pswitch_14
        :pswitch_a
        :pswitch_a
        :pswitch_11
        :pswitch_a
        :pswitch_17
    .end packed-switch
.end method

.method private static rotateBitmapInt(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .registers 10
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "degrees"    # I

    .prologue
    const/4 v1, 0x0

    .line 430
    if-lez p1, :cond_21

    .line 431
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 432
    .local v5, "matrix":Landroid/graphics/Matrix;
    int-to-float v0, p1

    invoke-virtual {v5, v0}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 433
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    move-object v0, p0

    move v2, v1

    move v6, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 434
    .local v7, "newBitmap":Landroid/graphics/Bitmap;
    if-eq v7, p0, :cond_20

    .line 435
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 439
    .end local v5    # "matrix":Landroid/graphics/Matrix;
    .end local v7    # "newBitmap":Landroid/graphics/Bitmap;
    :cond_20
    :goto_20
    return-object v7

    :cond_21
    move-object v7, p0

    goto :goto_20
.end method

.method public static writeBitmapToUri(Landroid/content/Context;Landroid/graphics/Bitmap;Landroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;I)V
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "compressFormat"    # Landroid/graphics/Bitmap$CompressFormat;
    .param p4, "compressQuality"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 251
    const/4 v0, 0x0

    .line 253
    .local v0, "outputStream":Ljava/io/OutputStream;
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v0

    .line 254
    invoke-virtual {p1, p3, p4, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_10

    .line 256
    invoke-static {v0}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->closeSafe(Ljava/io/Closeable;)V

    .line 258
    return-void

    .line 256
    :catchall_10
    move-exception v1

    invoke-static {v0}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->closeSafe(Ljava/io/Closeable;)V

    throw v1
.end method
