.class public Lcom/koushikdutta/ion/bitmap/IonBitmapCache;
.super Ljava/lang/Object;
.source "IonBitmapCache.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final DEFAULT_ERROR_CACHE_DURATION:J = 0x7530L


# instance fields
.field cache:Lcom/koushikdutta/ion/bitmap/LruBitmapCache;

.field errorCacheDuration:J

.field heapRatio:D

.field ion:Lcom/koushikdutta/ion/Ion;

.field metrics:Landroid/util/DisplayMetrics;

.field resources:Landroid/content/res/Resources;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 31
    const-class v0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lcom/koushikdutta/ion/Ion;)V
    .registers 7
    .param p1, "ion"    # Lcom/koushikdutta/ion/Ion;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const-wide/16 v2, 0x7530

    iput-wide v2, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->errorCacheDuration:J

    .line 67
    const-wide v2, 0x3fc2492492492492L    # 0.14285714285714285

    iput-wide v2, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->heapRatio:D

    .line 49
    invoke-virtual {p1}, Lcom/koushikdutta/ion/Ion;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 50
    .local v0, "context":Landroid/content/Context;
    iput-object p1, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->ion:Lcom/koushikdutta/ion/Ion;

    .line 51
    new-instance v2, Landroid/util/DisplayMetrics;

    invoke-direct {v2}, Landroid/util/DisplayMetrics;-><init>()V

    iput-object v2, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->metrics:Landroid/util/DisplayMetrics;

    .line 52
    const-string v2, "window"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager;

    .line 53
    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    iget-object v3, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->metrics:Landroid/util/DisplayMetrics;

    invoke-virtual {v2, v3}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 54
    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    .line 55
    .local v1, "mgr":Landroid/content/res/AssetManager;
    new-instance v2, Landroid/content/res/Resources;

    iget-object v3, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->metrics:Landroid/util/DisplayMetrics;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    invoke-direct {v2, v1, v3, v4}, Landroid/content/res/Resources;-><init>(Landroid/content/res/AssetManager;Landroid/util/DisplayMetrics;Landroid/content/res/Configuration;)V

    iput-object v2, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->resources:Landroid/content/res/Resources;

    .line 56
    new-instance v2, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;

    invoke-static {v0}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->getHeapSize(Landroid/content/Context;)I

    move-result v3

    div-int/lit8 v3, v3, 0x7

    invoke-direct {v2, v3}, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;-><init>(I)V

    iput-object v2, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->cache:Lcom/koushikdutta/ion/bitmap/LruBitmapCache;

    .line 57
    return-void
.end method

.method private computeTarget(II)Landroid/graphics/Point;
    .registers 6
    .param p1, "minx"    # I
    .param p2, "miny"    # I

    .prologue
    .line 123
    move v1, p1

    .line 124
    .local v1, "targetWidth":I
    move v0, p2

    .line 125
    .local v0, "targetHeight":I
    if-nez v1, :cond_8

    .line 126
    iget-object v2, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->metrics:Landroid/util/DisplayMetrics;

    iget v1, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 127
    :cond_8
    if-gtz v1, :cond_d

    .line 128
    const v1, 0x7fffffff

    .line 129
    :cond_d
    if-nez v0, :cond_13

    .line 130
    iget-object v2, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->metrics:Landroid/util/DisplayMetrics;

    iget v0, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 131
    :cond_13
    if-gtz v0, :cond_18

    .line 132
    const v0, 0x7fffffff

    .line 133
    :cond_18
    new-instance v2, Landroid/graphics/Point;

    invoke-direct {v2, v1, v0}, Landroid/graphics/Point;-><init>(II)V

    return-object v2
.end method

.method private static getHeapSize(Landroid/content/Context;)I
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 266
    const-string v0, "activity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    invoke-virtual {v0}, Landroid/app/ActivityManager;->getMemoryClass()I

    move-result v0

    mul-int/lit16 v0, v0, 0x400

    mul-int/lit16 v0, v0, 0x400

    return v0
.end method

.method private static getRotatedBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .registers 9
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "rotation"    # I

    .prologue
    const/4 v1, 0x0

    .line 178
    if-nez p0, :cond_5

    .line 179
    const/4 p0, 0x0

    .line 185
    .end local p0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_4
    :goto_4
    return-object p0

    .line 180
    .restart local p0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_5
    if-eqz p1, :cond_4

    .line 183
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 184
    .local v5, "matrix":Landroid/graphics/Matrix;
    int-to-float v0, p1

    invoke-virtual {v5, v0}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 185
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x1

    move-object v0, p0

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_4
.end method

.method public static loadBitmap(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 12
    .param p0, "res"    # Landroid/content/res/Resources;
    .param p1, "id"    # I
    .param p2, "o"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    const/4 v8, 0x0

    .line 206
    sget-boolean v6, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->$assertionsDisabled:Z

    if-nez v6, :cond_19

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v7

    invoke-virtual {v7}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v7

    if-ne v6, v7, :cond_19

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 209
    :cond_19
    const/4 v3, 0x0

    .line 211
    .local v3, "in":Ljava/io/InputStream;
    :try_start_1a
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v3

    .line 212
    const v6, 0xc350

    new-array v1, v6, [B

    .line 213
    .local v1, "bytes":[B
    invoke-virtual {v3, v1}, Ljava/io/InputStream;->read([B)I

    move-result v4

    .line 214
    .local v4, "length":I
    const/4 v6, 0x0

    invoke-static {v1, v6, v4}, Lcom/koushikdutta/ion/bitmap/Exif;->getOrientation([BII)I
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_2b} :catch_3d

    move-result v5

    .line 219
    .end local v1    # "bytes":[B
    .end local v4    # "length":I
    .local v5, "rotation":I
    :goto_2c
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/io/Closeable;

    aput-object v3, v6, v8

    invoke-static {v6}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 221
    invoke-static {p0, p1, p2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 222
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-static {v0, v5}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->getRotatedBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v6

    return-object v6

    .line 216
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v5    # "rotation":I
    :catch_3d
    move-exception v2

    .line 217
    .local v2, "e":Ljava/lang/Exception;
    const/4 v5, 0x0

    .restart local v5    # "rotation":I
    goto :goto_2c
.end method

.method public static loadBitmap(Ljava/io/File;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 12
    .param p0, "file"    # Ljava/io/File;
    .param p1, "o"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    const/4 v9, 0x0

    .line 246
    sget-boolean v7, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->$assertionsDisabled:Z

    if-nez v7, :cond_19

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v8

    invoke-virtual {v8}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v8

    if-ne v7, v8, :cond_19

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 249
    :cond_19
    const/4 v3, 0x0

    .line 251
    .local v3, "fin":Ljava/io/FileInputStream;
    :try_start_1a
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1f} :catch_43

    .line 252
    .end local v3    # "fin":Ljava/io/FileInputStream;
    .local v4, "fin":Ljava/io/FileInputStream;
    const v7, 0xc350

    :try_start_22
    new-array v1, v7, [B

    .line 253
    .local v1, "bytes":[B
    invoke-virtual {v4, v1}, Ljava/io/FileInputStream;->read([B)I

    move-result v5

    .line 254
    .local v5, "length":I
    const/4 v7, 0x0

    invoke-static {v1, v7, v5}, Lcom/koushikdutta/ion/bitmap/Exif;->getOrientation([BII)I
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_2c} :catch_46

    move-result v6

    .local v6, "rotation":I
    move-object v3, v4

    .line 259
    .end local v1    # "bytes":[B
    .end local v4    # "fin":Ljava/io/FileInputStream;
    .end local v5    # "length":I
    .restart local v3    # "fin":Ljava/io/FileInputStream;
    :goto_2e
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/io/Closeable;

    aput-object v3, v7, v9

    invoke-static {v7}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 261
    invoke-virtual {p0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 262
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-static {v0, v6}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->getRotatedBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v7

    return-object v7

    .line 256
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v6    # "rotation":I
    :catch_43
    move-exception v2

    .line 257
    .local v2, "e":Ljava/lang/Exception;
    :goto_44
    const/4 v6, 0x0

    .restart local v6    # "rotation":I
    goto :goto_2e

    .line 256
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "fin":Ljava/io/FileInputStream;
    .end local v6    # "rotation":I
    .restart local v4    # "fin":Ljava/io/FileInputStream;
    :catch_46
    move-exception v2

    move-object v3, v4

    .end local v4    # "fin":Ljava/io/FileInputStream;
    .restart local v3    # "fin":Ljava/io/FileInputStream;
    goto :goto_44
.end method

.method public static loadBitmap(Ljava/io/InputStream;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 11
    .param p0, "stream"    # Ljava/io/InputStream;
    .param p1, "o"    # Landroid/graphics/BitmapFactory$Options;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const v8, 0xc350

    .line 226
    sget-boolean v6, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->$assertionsDisabled:Z

    if-nez v6, :cond_1b

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v7

    invoke-virtual {v7}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v7

    if-ne v6, v7, :cond_1b

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 229
    :cond_1b
    new-instance v3, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;

    invoke-direct {v3, p0}, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;-><init>(Ljava/io/InputStream;)V

    .line 230
    .local v3, "in":Lcom/koushikdutta/ion/bitmap/MarkableInputStream;
    invoke-virtual {v3, v8}, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->mark(I)V

    .line 232
    const v6, 0xc350

    :try_start_26
    new-array v1, v6, [B

    .line 233
    .local v1, "bytes":[B
    invoke-virtual {v3, v1}, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->read([B)I

    move-result v4

    .line 234
    .local v4, "length":I
    const/4 v6, 0x0

    invoke-static {v1, v6, v4}, Lcom/koushikdutta/ion/bitmap/Exif;->getOrientation([BII)I
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_30} :catch_3e

    move-result v5

    .line 239
    .end local v1    # "bytes":[B
    .end local v4    # "length":I
    .local v5, "rotation":I
    :goto_31
    invoke-virtual {v3}, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->reset()V

    .line 241
    const/4 v6, 0x0

    invoke-static {v3, v6, p1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 242
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-static {v0, v5}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->getRotatedBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v6

    return-object v6

    .line 236
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v5    # "rotation":I
    :catch_3e
    move-exception v2

    .line 237
    .local v2, "e":Ljava/lang/Exception;
    const/4 v5, 0x0

    .restart local v5    # "rotation":I
    goto :goto_31
.end method

.method public static loadBitmap([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 8
    .param p0, "bytes"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I
    .param p3, "o"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 189
    sget-boolean v2, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->$assertionsDisabled:Z

    if-nez v2, :cond_18

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v3

    if-ne v2, v3, :cond_18

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 191
    :cond_18
    invoke-static {p0, p1, p2, p3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 192
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-nez v0, :cond_20

    .line 193
    const/4 v2, 0x0

    .line 195
    :goto_1f
    return-object v2

    .line 194
    :cond_20
    invoke-static {p0, p1, p2}, Lcom/koushikdutta/ion/bitmap/Exif;->getOrientation([BII)I

    move-result v1

    .line 195
    .local v1, "rotation":I
    invoke-static {v0, v1}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->getRotatedBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v2

    goto :goto_1f
.end method

.method public static loadRegion(Landroid/graphics/BitmapRegionDecoder;Landroid/graphics/Rect;I)Landroid/graphics/Bitmap;
    .registers 5
    .param p0, "decoder"    # Landroid/graphics/BitmapRegionDecoder;
    .param p1, "sourceRect"    # Landroid/graphics/Rect;
    .param p2, "inSampleSize"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0xa
    .end annotation

    .prologue
    .line 200
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 201
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    iput p2, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 202
    invoke-virtual {p0, p1, v0}, Landroid/graphics/BitmapRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1
.end method

.method private prepareBitmapOptions(Landroid/graphics/BitmapFactory$Options;II)Landroid/graphics/BitmapFactory$Options;
    .registers 10
    .param p1, "o"    # Landroid/graphics/BitmapFactory$Options;
    .param p2, "minx"    # I
    .param p3, "miny"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/koushikdutta/ion/bitmap/BitmapDecodeException;
        }
    .end annotation

    .prologue
    .line 137
    iget v3, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-ltz v3, :cond_8

    iget v3, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-gez v3, :cond_12

    .line 138
    :cond_8
    new-instance v3, Lcom/koushikdutta/ion/bitmap/BitmapDecodeException;

    iget v4, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v5, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-direct {v3, v4, v5}, Lcom/koushikdutta/ion/bitmap/BitmapDecodeException;-><init>(II)V

    throw v3

    .line 139
    :cond_12
    invoke-direct {p0, p2, p3}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->computeTarget(II)Landroid/graphics/Point;

    move-result-object v2

    .line 140
    .local v2, "target":Landroid/graphics/Point;
    iget v3, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    int-to-float v3, v3

    iget v4, v2, Landroid/graphics/Point;->x:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    iget v4, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    int-to-float v4, v4

    iget v5, v2, Landroid/graphics/Point;->y:I

    int-to-float v5, v5

    div-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 141
    .local v1, "scale":I
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 142
    .local v0, "ret":Landroid/graphics/BitmapFactory$Options;
    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 143
    iget v3, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iput v3, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 144
    iget v3, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iput v3, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 145
    iget-object v3, p1, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    iput-object v3, v0, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    .line 146
    return-object v0
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->cache:Lcom/koushikdutta/ion/bitmap/LruBitmapCache;

    invoke-virtual {v0}, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->evictAllBitmapInfo()V

    .line 65
    return-void
.end method

.method public dump()V
    .registers 5

    .prologue
    .line 118
    const-string v0, "IonBitmapCache"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bitmap cache: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->cache:Lcom/koushikdutta/ion/bitmap/LruBitmapCache;

    invoke-virtual {v2}, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->size()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    const-string v0, "IonBitmapCache"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "freeMemory: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Runtime;->freeMemory()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    return-void
.end method

.method public get(Ljava/lang/String;)Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .registers 8
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 90
    if-nez p1, :cond_5

    move-object v0, v1

    .line 114
    :cond_4
    :goto_4
    return-object v0

    .line 94
    :cond_5
    iget-object v2, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->cache:Lcom/koushikdutta/ion/bitmap/LruBitmapCache;

    invoke-virtual {v2, p1}, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->getBitmapInfo(Ljava/lang/String;)Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    move-result-object v0

    .line 95
    .local v0, "ret":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    if-nez v0, :cond_f

    move-object v0, v1

    .line 96
    goto :goto_4

    .line 97
    :cond_f
    iget-object v2, v0, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_37

    iget-object v2, v0, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v2

    if-eqz v2, :cond_37

    .line 98
    const-string v2, "ION"

    const-string v3, "Cached bitmap was recycled."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    const-string v2, "ION"

    const-string v3, "This may happen if passing Ion bitmaps directly to notification builders or remote media clients."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    const-string v2, "ION"

    const-string v3, "Create a deep copy before doing this."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    iget-object v2, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->cache:Lcom/koushikdutta/ion/bitmap/LruBitmapCache;

    invoke-virtual {v2, p1}, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v1

    .line 102
    goto :goto_4

    .line 104
    :cond_37
    iget-object v2, v0, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->exception:Ljava/lang/Exception;

    if-eqz v2, :cond_4

    .line 110
    iget-wide v2, v0, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->loadTime:J

    iget-wide v4, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->errorCacheDuration:J

    add-long/2addr v2, v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-gtz v2, :cond_4

    .line 113
    iget-object v2, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->cache:Lcom/koushikdutta/ion/bitmap/LruBitmapCache;

    invoke-virtual {v2, p1}, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v1

    .line 114
    goto :goto_4
.end method

.method public getErrorCacheDuration()J
    .registers 3

    .prologue
    .line 41
    iget-wide v0, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->errorCacheDuration:J

    return-wide v0
.end method

.method public getHeapRatio()D
    .registers 3

    .prologue
    .line 69
    iget-wide v0, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->heapRatio:D

    return-wide v0
.end method

.method public prepareBitmapOptions(Landroid/content/res/Resources;III)Landroid/graphics/BitmapFactory$Options;
    .registers 7
    .param p1, "res"    # Landroid/content/res/Resources;
    .param p2, "id"    # I
    .param p3, "minx"    # I
    .param p4, "miny"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/koushikdutta/ion/bitmap/BitmapDecodeException;
        }
    .end annotation

    .prologue
    .line 164
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 165
    .local v0, "o":Landroid/graphics/BitmapFactory$Options;
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 166
    invoke-static {p1, p2, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 167
    invoke-direct {p0, v0, p3, p4}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->prepareBitmapOptions(Landroid/graphics/BitmapFactory$Options;II)Landroid/graphics/BitmapFactory$Options;

    move-result-object v1

    return-object v1
.end method

.method public prepareBitmapOptions(Ljava/io/File;II)Landroid/graphics/BitmapFactory$Options;
    .registers 6
    .param p1, "file"    # Ljava/io/File;
    .param p2, "minx"    # I
    .param p3, "miny"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/koushikdutta/ion/bitmap/BitmapDecodeException;
        }
    .end annotation

    .prologue
    .line 150
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 151
    .local v0, "o":Landroid/graphics/BitmapFactory$Options;
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 152
    invoke-virtual {p1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 153
    invoke-direct {p0, v0, p2, p3}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->prepareBitmapOptions(Landroid/graphics/BitmapFactory$Options;II)Landroid/graphics/BitmapFactory$Options;

    move-result-object v1

    return-object v1
.end method

.method public prepareBitmapOptions(Ljava/io/InputStream;II)Landroid/graphics/BitmapFactory$Options;
    .registers 6
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "minx"    # I
    .param p3, "miny"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/koushikdutta/ion/bitmap/BitmapDecodeException;
        }
    .end annotation

    .prologue
    .line 171
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 172
    .local v0, "o":Landroid/graphics/BitmapFactory$Options;
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 173
    const/4 v1, 0x0

    invoke-static {p1, v1, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 174
    invoke-direct {p0, v0, p2, p3}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->prepareBitmapOptions(Landroid/graphics/BitmapFactory$Options;II)Landroid/graphics/BitmapFactory$Options;

    move-result-object v1

    return-object v1
.end method

.method public prepareBitmapOptions([BIIII)Landroid/graphics/BitmapFactory$Options;
    .registers 8
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .param p4, "minx"    # I
    .param p5, "miny"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/koushikdutta/ion/bitmap/BitmapDecodeException;
        }
    .end annotation

    .prologue
    .line 157
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 158
    .local v0, "o":Landroid/graphics/BitmapFactory$Options;
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 159
    invoke-static {p1, p2, p3, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 160
    invoke-direct {p0, v0, p4, p5}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->prepareBitmapOptions(Landroid/graphics/BitmapFactory$Options;II)Landroid/graphics/BitmapFactory$Options;

    move-result-object v1

    return-object v1
.end method

.method public put(Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    .registers 7
    .param p1, "info"    # Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .prologue
    .line 77
    sget-boolean v1, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->$assertionsDisabled:Z

    if-nez v1, :cond_18

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v2

    if-eq v1, v2, :cond_18

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 78
    :cond_18
    iget-object v1, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->getHeapSize(Landroid/content/Context;)I

    move-result v1

    int-to-double v1, v1

    iget-wide v3, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->heapRatio:D

    mul-double/2addr v1, v3

    double-to-int v0, v1

    .line 79
    .local v0, "maxSize":I
    int-to-long v1, v0

    iget-object v3, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->cache:Lcom/koushikdutta/ion/bitmap/LruBitmapCache;

    invoke-virtual {v3}, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->maxSize()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-eqz v1, :cond_38

    .line 80
    iget-object v1, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->cache:Lcom/koushikdutta/ion/bitmap/LruBitmapCache;

    int-to-long v2, v0

    invoke-virtual {v1, v2, v3}, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->setMaxSize(J)V

    .line 81
    :cond_38
    iget-object v1, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->cache:Lcom/koushikdutta/ion/bitmap/LruBitmapCache;

    iget-object v2, p1, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->key:Ljava/lang/String;

    invoke-virtual {v1, v2, p1}, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    return-void
.end method

.method public putSoft(Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    .registers 4
    .param p1, "info"    # Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .prologue
    .line 85
    sget-boolean v0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->$assertionsDisabled:Z

    if-nez v0, :cond_18

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v1

    if-eq v0, v1, :cond_18

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 86
    :cond_18
    iget-object v0, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->cache:Lcom/koushikdutta/ion/bitmap/LruBitmapCache;

    iget-object v1, p1, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->key:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->putSoft(Ljava/lang/String;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V

    .line 87
    return-void
.end method

.method public remove(Ljava/lang/String;)Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->cache:Lcom/koushikdutta/ion/bitmap/LruBitmapCache;

    invoke-virtual {v0, p1}, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->removeBitmapInfo(Ljava/lang/String;)Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    move-result-object v0

    return-object v0
.end method

.method public setErrorCacheDuration(J)V
    .registers 3
    .param p1, "errorCacheDuration"    # J

    .prologue
    .line 45
    iput-wide p1, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->errorCacheDuration:J

    .line 46
    return-void
.end method

.method public setHeapRatio(D)V
    .registers 3
    .param p1, "heapRatio"    # D

    .prologue
    .line 73
    iput-wide p1, p0, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->heapRatio:D

    .line 74
    return-void
.end method
