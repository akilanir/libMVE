.class public abstract Lcom/bumptech/glide/load/resource/bitmap/Downsampler;
.super Ljava/lang/Object;
.source "Downsampler.java"

# interfaces
.implements Lcom/bumptech/glide/load/resource/bitmap/BitmapDecoder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/resource/bitmap/BitmapDecoder",
        "<",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# static fields
.field public static final AT_LEAST:Lcom/bumptech/glide/load/resource/bitmap/Downsampler;

.field public static final AT_MOST:Lcom/bumptech/glide/load/resource/bitmap/Downsampler;

.field private static final MARK_POSITION:I = 0x500000

.field public static final NONE:Lcom/bumptech/glide/load/resource/bitmap/Downsampler;

.field private static final OPTIONS_QUEUE:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Landroid/graphics/BitmapFactory$Options;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "Downsampler"

.field private static final TYPES_THAT_USE_POOL:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser$ImageType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 29
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser$ImageType;->JPEG:Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser$ImageType;

    sget-object v1, Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser$ImageType;->PNG_A:Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser$ImageType;

    sget-object v2, Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser$ImageType;->PNG:Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser$ImageType;

    invoke-static {v0, v1, v2}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->TYPES_THAT_USE_POOL:Ljava/util/Set;

    .line 32
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/bumptech/glide/util/Util;->createQueue(I)Ljava/util/Queue;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->OPTIONS_QUEUE:Ljava/util/Queue;

    .line 38
    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/Downsampler$1;

    invoke-direct {v0}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler$1;-><init>()V

    sput-object v0, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->AT_LEAST:Lcom/bumptech/glide/load/resource/bitmap/Downsampler;

    .line 55
    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/Downsampler$2;

    invoke-direct {v0}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler$2;-><init>()V

    sput-object v0, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->AT_MOST:Lcom/bumptech/glide/load/resource/bitmap/Downsampler;

    .line 70
    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/Downsampler$3;

    invoke-direct {v0}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler$3;-><init>()V

    sput-object v0, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->NONE:Lcom/bumptech/glide/load/resource/bitmap/Downsampler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static decodeStream(Lcom/bumptech/glide/util/MarkEnforcingInputStream;Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 8
    .param p0, "is"    # Lcom/bumptech/glide/util/MarkEnforcingInputStream;
    .param p1, "bufferedStream"    # Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 311
    iget-boolean v2, p2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    if-eqz v2, :cond_16

    .line 317
    const/high16 v2, 0x500000

    invoke-virtual {p0, v2}, Lcom/bumptech/glide/util/MarkEnforcingInputStream;->mark(I)V

    .line 325
    :goto_9
    const/4 v2, 0x0

    invoke-static {p0, v2, p2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 328
    .local v1, "result":Landroid/graphics/Bitmap;
    :try_start_e
    iget-boolean v2, p2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    if-eqz v2, :cond_15

    .line 329
    invoke-virtual {p0}, Lcom/bumptech/glide/util/MarkEnforcingInputStream;->reset()V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_15} :catch_1a

    .line 338
    :cond_15
    :goto_15
    return-object v1

    .line 322
    .end local v1    # "result":Landroid/graphics/Bitmap;
    :cond_16
    invoke-virtual {p1}, Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;->fixMarkLimit()V

    goto :goto_9

    .line 331
    .restart local v1    # "result":Landroid/graphics/Bitmap;
    :catch_1a
    move-exception v0

    .line 332
    .local v0, "e":Ljava/io/IOException;
    const-string v2, "Downsampler"

    const/4 v3, 0x6

    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_15

    .line 333
    const-string v2, "Downsampler"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception loading inDecodeBounds="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " sample="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_15
.end method

.method private downsampleWithSize(Lcom/bumptech/glide/util/MarkEnforcingInputStream;Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;Landroid/graphics/BitmapFactory$Options;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;IIILcom/bumptech/glide/load/DecodeFormat;)Landroid/graphics/Bitmap;
    .registers 16
    .param p1, "is"    # Lcom/bumptech/glide/util/MarkEnforcingInputStream;
    .param p2, "bufferedStream"    # Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;
    .param p3, "options"    # Landroid/graphics/BitmapFactory$Options;
    .param p4, "pool"    # Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;
    .param p5, "inWidth"    # I
    .param p6, "inHeight"    # I
    .param p7, "sampleSize"    # I
    .param p8, "decodeFormat"    # Lcom/bumptech/glide/load/DecodeFormat;

    .prologue
    .line 208
    invoke-static {p1, p8}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->getConfig(Ljava/io/InputStream;Lcom/bumptech/glide/load/DecodeFormat;)Landroid/graphics/Bitmap$Config;

    move-result-object v0

    .line 209
    .local v0, "config":Landroid/graphics/Bitmap$Config;
    iput p7, p3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 210
    iput-object v0, p3, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 211
    iget v3, p3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    const/4 v4, 0x1

    if-eq v3, v4, :cond_13

    const/16 v3, 0x13

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    if-gt v3, v4, :cond_30

    :cond_13
    invoke-static {p1}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->shouldUsePool(Ljava/io/InputStream;)Z

    move-result v3

    if-eqz v3, :cond_30

    .line 212
    int-to-double v3, p5

    int-to-double v5, p7

    div-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v2, v3

    .line 213
    .local v2, "targetWidth":I
    int-to-double v3, p6

    int-to-double v5, p7

    div-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v1, v3

    .line 215
    .local v1, "targetHeight":I
    invoke-interface {p4, v2, v1, v0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;->getDirty(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-static {p3, v3}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->setInBitmap(Landroid/graphics/BitmapFactory$Options;Landroid/graphics/Bitmap;)V

    .line 217
    .end local v1    # "targetHeight":I
    .end local v2    # "targetWidth":I
    :cond_30
    invoke-static {p1, p2, p3}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->decodeStream(Lcom/bumptech/glide/util/MarkEnforcingInputStream;Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v3

    return-object v3
.end method

.method private static getConfig(Ljava/io/InputStream;Lcom/bumptech/glide/load/DecodeFormat;)Landroid/graphics/Bitmap$Config;
    .registers 8
    .param p0, "is"    # Ljava/io/InputStream;
    .param p1, "format"    # Lcom/bumptech/glide/load/DecodeFormat;

    .prologue
    const/4 v5, 0x5

    .line 250
    sget-object v2, Lcom/bumptech/glide/load/DecodeFormat;->ALWAYS_ARGB_8888:Lcom/bumptech/glide/load/DecodeFormat;

    if-eq p1, v2, :cond_f

    sget-object v2, Lcom/bumptech/glide/load/DecodeFormat;->PREFER_ARGB_8888:Lcom/bumptech/glide/load/DecodeFormat;

    if-eq p1, v2, :cond_f

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-ne v2, v3, :cond_12

    .line 252
    :cond_f
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 274
    :goto_11
    return-object v2

    .line 255
    :cond_12
    const/4 v1, 0x0

    .line 257
    .local v1, "hasAlpha":Z
    const/16 v2, 0x400

    invoke-virtual {p0, v2}, Ljava/io/InputStream;->mark(I)V

    .line 259
    :try_start_18
    new-instance v2, Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser;

    invoke-direct {v2, p0}, Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v2}, Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser;->hasAlpha()Z
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_20} :catch_3a
    .catchall {:try_start_18 .. :try_end_20} :catchall_71

    move-result v1

    .line 266
    :try_start_21
    invoke-virtual {p0}, Ljava/io/InputStream;->reset()V
    :try_end_24
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_24} :catch_29

    .line 274
    :cond_24
    :goto_24
    if-eqz v1, :cond_87

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    goto :goto_11

    .line 267
    :catch_29
    move-exception v0

    .line 268
    .local v0, "e":Ljava/io/IOException;
    const-string v2, "Downsampler"

    invoke-static {v2, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_24

    .line 269
    const-string v2, "Downsampler"

    const-string v3, "Cannot reset the input stream"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_24

    .line 260
    .end local v0    # "e":Ljava/io/IOException;
    :catch_3a
    move-exception v0

    .line 261
    .restart local v0    # "e":Ljava/io/IOException;
    :try_start_3b
    const-string v2, "Downsampler"

    const/4 v3, 0x5

    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_5c

    .line 262
    const-string v2, "Downsampler"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cannot determine whether the image has alpha or not from header for format "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5c
    .catchall {:try_start_3b .. :try_end_5c} :catchall_71

    .line 266
    :cond_5c
    :try_start_5c
    invoke-virtual {p0}, Ljava/io/InputStream;->reset()V
    :try_end_5f
    .catch Ljava/io/IOException; {:try_start_5c .. :try_end_5f} :catch_60

    goto :goto_24

    .line 267
    :catch_60
    move-exception v0

    .line 268
    const-string v2, "Downsampler"

    invoke-static {v2, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_24

    .line 269
    const-string v2, "Downsampler"

    const-string v3, "Cannot reset the input stream"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_24

    .line 265
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_71
    move-exception v2

    .line 266
    :try_start_72
    invoke-virtual {p0}, Ljava/io/InputStream;->reset()V
    :try_end_75
    .catch Ljava/io/IOException; {:try_start_72 .. :try_end_75} :catch_76

    .line 271
    :cond_75
    :goto_75
    throw v2

    .line 267
    :catch_76
    move-exception v0

    .line 268
    .restart local v0    # "e":Ljava/io/IOException;
    const-string v3, "Downsampler"

    invoke-static {v3, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_75

    .line 269
    const-string v3, "Downsampler"

    const-string v4, "Cannot reset the input stream"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_75

    .line 274
    .end local v0    # "e":Ljava/io/IOException;
    :cond_87
    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    goto :goto_11
.end method

.method private static declared-synchronized getDefaultOptions()Landroid/graphics/BitmapFactory$Options;
    .registers 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 351
    const-class v2, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;

    monitor-enter v2

    :try_start_3
    sget-object v3, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->OPTIONS_QUEUE:Ljava/util/Queue;

    monitor-enter v3
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_1e

    .line 352
    :try_start_6
    sget-object v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->OPTIONS_QUEUE:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/BitmapFactory$Options;

    .line 353
    .local v0, "decodeBitmapOptions":Landroid/graphics/BitmapFactory$Options;
    monitor-exit v3
    :try_end_f
    .catchall {:try_start_6 .. :try_end_f} :catchall_1b

    .line 354
    if-nez v0, :cond_19

    .line 355
    :try_start_11
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .end local v0    # "decodeBitmapOptions":Landroid/graphics/BitmapFactory$Options;
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 356
    .restart local v0    # "decodeBitmapOptions":Landroid/graphics/BitmapFactory$Options;
    invoke-static {v0}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->resetOptions(Landroid/graphics/BitmapFactory$Options;)V
    :try_end_19
    .catchall {:try_start_11 .. :try_end_19} :catchall_1e

    .line 359
    :cond_19
    monitor-exit v2

    return-object v0

    .line 353
    :catchall_1b
    move-exception v1

    :try_start_1c
    monitor-exit v3
    :try_end_1d
    .catchall {:try_start_1c .. :try_end_1d} :catchall_1b

    :try_start_1d
    throw v1
    :try_end_1e
    .catchall {:try_start_1d .. :try_end_1e} :catchall_1e

    .line 351
    :catchall_1e
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method private getRoundedSampleSize(IIIII)I
    .registers 11
    .param p1, "degreesToRotate"    # I
    .param p2, "inWidth"    # I
    .param p3, "inHeight"    # I
    .param p4, "outWidth"    # I
    .param p5, "outHeight"    # I

    .prologue
    const/high16 v4, -0x80000000

    .line 182
    if-ne p5, v4, :cond_1d

    move v2, p3

    .line 183
    .local v2, "targetHeight":I
    :goto_5
    if-ne p4, v4, :cond_1f

    move v3, p2

    .line 186
    .local v3, "targetWidth":I
    :goto_8
    const/16 v4, 0x5a

    if-eq p1, v4, :cond_10

    const/16 v4, 0x10e

    if-ne p1, v4, :cond_21

    .line 189
    :cond_10
    invoke-virtual {p0, p3, p2, v3, v2}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->getSampleSize(IIII)I

    move-result v0

    .line 198
    .local v0, "exactSampleSize":I
    :goto_14
    if-nez v0, :cond_26

    const/4 v1, 0x0

    .line 201
    .local v1, "powerOfTwoSampleSize":I
    :goto_17
    const/4 v4, 0x1

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v4

    return v4

    .end local v0    # "exactSampleSize":I
    .end local v1    # "powerOfTwoSampleSize":I
    .end local v2    # "targetHeight":I
    .end local v3    # "targetWidth":I
    :cond_1d
    move v2, p5

    .line 182
    goto :goto_5

    .restart local v2    # "targetHeight":I
    :cond_1f
    move v3, p4

    .line 183
    goto :goto_8

    .line 191
    .restart local v3    # "targetWidth":I
    :cond_21
    invoke-virtual {p0, p2, p3, v3, v2}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->getSampleSize(IIII)I

    move-result v0

    .restart local v0    # "exactSampleSize":I
    goto :goto_14

    .line 198
    :cond_26
    invoke-static {v0}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result v1

    goto :goto_17
.end method

.method private static releaseOptions(Landroid/graphics/BitmapFactory$Options;)V
    .registers 3
    .param p0, "decodeBitmapOptions"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 363
    invoke-static {p0}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->resetOptions(Landroid/graphics/BitmapFactory$Options;)V

    .line 364
    sget-object v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->OPTIONS_QUEUE:Ljava/util/Queue;

    monitor-enter v1

    .line 365
    :try_start_6
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->OPTIONS_QUEUE:Ljava/util/Queue;

    invoke-interface {v0, p0}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 366
    monitor-exit v1

    .line 367
    return-void

    .line 366
    :catchall_d
    move-exception v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_6 .. :try_end_f} :catchall_d

    throw v0
.end method

.method private static resetOptions(Landroid/graphics/BitmapFactory$Options;)V
    .registers 5
    .param p0, "decodeBitmapOptions"    # Landroid/graphics/BitmapFactory$Options;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v0, 0x0

    .line 371
    iput-object v2, p0, Landroid/graphics/BitmapFactory$Options;->inTempStorage:[B

    .line 372
    iput-boolean v0, p0, Landroid/graphics/BitmapFactory$Options;->inDither:Z

    .line 373
    iput-boolean v0, p0, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 374
    iput v3, p0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 375
    iput-object v2, p0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 376
    iput-boolean v0, p0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 377
    iput v0, p0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 378
    iput v0, p0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 379
    iput-object v2, p0, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    .line 381
    const/16 v0, 0xb

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-gt v0, v1, :cond_1f

    .line 382
    iput-object v2, p0, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    .line 383
    iput-boolean v3, p0, Landroid/graphics/BitmapFactory$Options;->inMutable:Z

    .line 385
    :cond_1f
    return-void
.end method

.method private static setInBitmap(Landroid/graphics/BitmapFactory$Options;Landroid/graphics/Bitmap;)V
    .registers 4
    .param p0, "options"    # Landroid/graphics/BitmapFactory$Options;
    .param p1, "recycled"    # Landroid/graphics/Bitmap;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 343
    const/16 v0, 0xb

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-gt v0, v1, :cond_8

    .line 344
    iput-object p1, p0, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    .line 346
    :cond_8
    return-void
.end method

.method private static shouldUsePool(Ljava/io/InputStream;)Z
    .registers 6
    .param p0, "is"    # Ljava/io/InputStream;

    .prologue
    const/4 v4, 0x5

    .line 222
    const/16 v2, 0x13

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-gt v2, v3, :cond_9

    .line 223
    const/4 v2, 0x1

    .line 245
    :cond_8
    :goto_8
    return v2

    .line 226
    :cond_9
    const/16 v2, 0x400

    invoke-virtual {p0, v2}, Ljava/io/InputStream;->mark(I)V

    .line 228
    :try_start_e
    new-instance v2, Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser;

    invoke-direct {v2, p0}, Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v2}, Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser;->getType()Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser$ImageType;

    move-result-object v1

    .line 231
    .local v1, "type":Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser$ImageType;
    sget-object v2, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->TYPES_THAT_USE_POOL:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_1c} :catch_32
    .catchall {:try_start_e .. :try_end_1c} :catchall_59

    move-result v2

    .line 238
    :try_start_1d
    invoke-virtual {p0}, Ljava/io/InputStream;->reset()V
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_20} :catch_21

    goto :goto_8

    .line 239
    :catch_21
    move-exception v0

    .line 240
    .local v0, "e":Ljava/io/IOException;
    const-string v3, "Downsampler"

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 241
    const-string v3, "Downsampler"

    const-string v4, "Cannot reset the input stream"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_8

    .line 232
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "type":Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser$ImageType;
    :catch_32
    move-exception v0

    .line 233
    .restart local v0    # "e":Ljava/io/IOException;
    :try_start_33
    const-string v2, "Downsampler"

    const/4 v3, 0x5

    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_43

    .line 234
    const-string v2, "Downsampler"

    const-string v3, "Cannot determine the image type from header"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_43
    .catchall {:try_start_33 .. :try_end_43} :catchall_59

    .line 238
    :cond_43
    :try_start_43
    invoke-virtual {p0}, Ljava/io/InputStream;->reset()V
    :try_end_46
    .catch Ljava/io/IOException; {:try_start_43 .. :try_end_46} :catch_48

    .line 245
    :cond_46
    :goto_46
    const/4 v2, 0x0

    goto :goto_8

    .line 239
    :catch_48
    move-exception v0

    .line 240
    const-string v2, "Downsampler"

    invoke-static {v2, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_46

    .line 241
    const-string v2, "Downsampler"

    const-string v3, "Cannot reset the input stream"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_46

    .line 237
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_59
    move-exception v2

    .line 238
    :try_start_5a
    invoke-virtual {p0}, Ljava/io/InputStream;->reset()V
    :try_end_5d
    .catch Ljava/io/IOException; {:try_start_5a .. :try_end_5d} :catch_5e

    .line 243
    :cond_5d
    :goto_5d
    throw v2

    .line 239
    :catch_5e
    move-exception v0

    .line 240
    .restart local v0    # "e":Ljava/io/IOException;
    const-string v3, "Downsampler"

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_5d

    .line 241
    const-string v3, "Downsampler"

    const-string v4, "Cannot reset the input stream"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5d
.end method


# virtual methods
.method public decode(Ljava/io/InputStream;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;IILcom/bumptech/glide/load/DecodeFormat;)Landroid/graphics/Bitmap;
    .registers 33
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "pool"    # Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;
    .param p3, "outWidth"    # I
    .param p4, "outHeight"    # I
    .param p5, "decodeFormat"    # Lcom/bumptech/glide/load/DecodeFormat;

    .prologue
    .line 106
    invoke-static {}, Lcom/bumptech/glide/util/ByteArrayPool;->get()Lcom/bumptech/glide/util/ByteArrayPool;

    move-result-object v16

    .line 107
    .local v16, "byteArrayPool":Lcom/bumptech/glide/util/ByteArrayPool;
    invoke-virtual/range {v16 .. v16}, Lcom/bumptech/glide/util/ByteArrayPool;->getBytes()[B

    move-result-object v17

    .line 108
    .local v17, "bytesForOptions":[B
    invoke-virtual/range {v16 .. v16}, Lcom/bumptech/glide/util/ByteArrayPool;->getBytes()[B

    move-result-object v18

    .line 109
    .local v18, "bytesForStream":[B
    invoke-static {}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->getDefaultOptions()Landroid/graphics/BitmapFactory$Options;

    move-result-object v10

    .line 112
    .local v10, "options":Landroid/graphics/BitmapFactory$Options;
    new-instance v9, Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-direct {v9, v0, v1}, Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;-><init>(Ljava/io/InputStream;[B)V

    .line 117
    .local v9, "bufferedStream":Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;
    invoke-static {v9}, Lcom/bumptech/glide/util/ExceptionCatchingInputStream;->obtain(Ljava/io/InputStream;)Lcom/bumptech/glide/util/ExceptionCatchingInputStream;

    move-result-object v21

    .line 122
    .local v21, "exceptionStream":Lcom/bumptech/glide/util/ExceptionCatchingInputStream;
    new-instance v23, Lcom/bumptech/glide/util/MarkEnforcingInputStream;

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/bumptech/glide/util/MarkEnforcingInputStream;-><init>(Ljava/io/InputStream;)V

    .line 124
    .local v23, "invalidatingStream":Lcom/bumptech/glide/util/MarkEnforcingInputStream;
    const/high16 v3, 0x500000

    :try_start_28
    move-object/from16 v0, v21

    invoke-virtual {v0, v3}, Lcom/bumptech/glide/util/ExceptionCatchingInputStream;->mark(I)V
    :try_end_2d
    .catchall {:try_start_28 .. :try_end_2d} :catchall_79

    .line 125
    const/16 v24, 0x0

    .line 127
    .local v24, "orientation":I
    :try_start_2f
    new-instance v3, Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser;

    move-object/from16 v0, v21

    invoke-direct {v3, v0}, Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v3}, Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser;->getOrientation()I
    :try_end_39
    .catch Ljava/io/IOException; {:try_start_2f .. :try_end_39} :catch_9f
    .catchall {:try_start_2f .. :try_end_39} :catchall_cb

    move-result v24

    .line 134
    :try_start_3a
    invoke-virtual/range {v21 .. v21}, Lcom/bumptech/glide/util/ExceptionCatchingInputStream;->reset()V
    :try_end_3d
    .catch Ljava/io/IOException; {:try_start_3a .. :try_end_3d} :catch_8b
    .catchall {:try_start_3a .. :try_end_3d} :catchall_79

    .line 142
    :cond_3d
    :goto_3d
    :try_start_3d
    move-object/from16 v0, v17

    iput-object v0, v10, Landroid/graphics/BitmapFactory$Options;->inTempStorage:[B

    .line 144
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1, v9, v10}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->getDimensions(Lcom/bumptech/glide/util/MarkEnforcingInputStream;Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;Landroid/graphics/BitmapFactory$Options;)[I

    move-result-object v22

    .line 145
    .local v22, "inDimens":[I
    const/4 v3, 0x0

    aget v5, v22, v3

    .line 146
    .local v5, "inWidth":I
    const/4 v3, 0x1

    aget v6, v22, v3

    .line 148
    .local v6, "inHeight":I
    invoke-static/range {v24 .. v24}, Lcom/bumptech/glide/load/resource/bitmap/TransformationUtils;->getExifOrientationDegrees(I)I

    move-result v4

    .local v4, "degreesToRotate":I
    move-object/from16 v3, p0

    move/from16 v7, p3

    move/from16 v8, p4

    .line 149
    invoke-direct/range {v3 .. v8}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->getRoundedSampleSize(IIIII)I

    move-result v14

    .local v14, "sampleSize":I
    move-object/from16 v7, p0

    move-object/from16 v8, v23

    move-object/from16 v11, p2

    move v12, v5

    move v13, v6

    move-object/from16 v15, p5

    .line 151
    invoke-direct/range {v7 .. v15}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->downsampleWithSize(Lcom/bumptech/glide/util/MarkEnforcingInputStream;Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;Landroid/graphics/BitmapFactory$Options;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;IIILcom/bumptech/glide/load/DecodeFormat;)Landroid/graphics/Bitmap;

    move-result-object v19

    .line 158
    .local v19, "downsampled":Landroid/graphics/Bitmap;
    invoke-virtual/range {v21 .. v21}, Lcom/bumptech/glide/util/ExceptionCatchingInputStream;->getException()Ljava/io/IOException;

    move-result-object v26

    .line 159
    .local v26, "streamException":Ljava/lang/Exception;
    if-eqz v26, :cond_e4

    .line 160
    new-instance v3, Ljava/lang/RuntimeException;

    move-object/from16 v0, v26

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_79
    .catchall {:try_start_3d .. :try_end_79} :catchall_79

    .line 174
    .end local v4    # "degreesToRotate":I
    .end local v5    # "inWidth":I
    .end local v6    # "inHeight":I
    .end local v14    # "sampleSize":I
    .end local v19    # "downsampled":Landroid/graphics/Bitmap;
    .end local v22    # "inDimens":[I
    .end local v24    # "orientation":I
    .end local v26    # "streamException":Ljava/lang/Exception;
    :catchall_79
    move-exception v3

    invoke-virtual/range {v16 .. v17}, Lcom/bumptech/glide/util/ByteArrayPool;->releaseBytes([B)Z

    .line 175
    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/util/ByteArrayPool;->releaseBytes([B)Z

    .line 176
    invoke-virtual/range {v21 .. v21}, Lcom/bumptech/glide/util/ExceptionCatchingInputStream;->release()V

    .line 177
    invoke-static {v10}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->releaseOptions(Landroid/graphics/BitmapFactory$Options;)V

    throw v3

    .line 135
    .restart local v24    # "orientation":I
    :catch_8b
    move-exception v20

    .line 136
    .local v20, "e":Ljava/io/IOException;
    :try_start_8c
    const-string v3, "Downsampler"

    const/4 v7, 0x5

    invoke-static {v3, v7}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_3d

    .line 137
    const-string v3, "Downsampler"

    const-string v7, "Cannot reset the input stream"

    move-object/from16 v0, v20

    invoke-static {v3, v7, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_9e
    .catchall {:try_start_8c .. :try_end_9e} :catchall_79

    goto :goto_3d

    .line 128
    .end local v20    # "e":Ljava/io/IOException;
    :catch_9f
    move-exception v20

    .line 129
    .restart local v20    # "e":Ljava/io/IOException;
    :try_start_a0
    const-string v3, "Downsampler"

    const/4 v7, 0x5

    invoke-static {v3, v7}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_b2

    .line 130
    const-string v3, "Downsampler"

    const-string v7, "Cannot determine the image orientation from header"

    move-object/from16 v0, v20

    invoke-static {v3, v7, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_b2
    .catchall {:try_start_a0 .. :try_end_b2} :catchall_cb

    .line 134
    :cond_b2
    :try_start_b2
    invoke-virtual/range {v21 .. v21}, Lcom/bumptech/glide/util/ExceptionCatchingInputStream;->reset()V
    :try_end_b5
    .catch Ljava/io/IOException; {:try_start_b2 .. :try_end_b5} :catch_b6
    .catchall {:try_start_b2 .. :try_end_b5} :catchall_79

    goto :goto_3d

    .line 135
    :catch_b6
    move-exception v20

    .line 136
    :try_start_b7
    const-string v3, "Downsampler"

    const/4 v7, 0x5

    invoke-static {v3, v7}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_3d

    .line 137
    const-string v3, "Downsampler"

    const-string v7, "Cannot reset the input stream"

    move-object/from16 v0, v20

    invoke-static {v3, v7, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_c9
    .catchall {:try_start_b7 .. :try_end_c9} :catchall_79

    goto/16 :goto_3d

    .line 133
    .end local v20    # "e":Ljava/io/IOException;
    :catchall_cb
    move-exception v3

    .line 134
    :try_start_cc
    invoke-virtual/range {v21 .. v21}, Lcom/bumptech/glide/util/ExceptionCatchingInputStream;->reset()V
    :try_end_cf
    .catch Ljava/io/IOException; {:try_start_cc .. :try_end_cf} :catch_d0
    .catchall {:try_start_cc .. :try_end_cf} :catchall_79

    .line 139
    :cond_cf
    :goto_cf
    :try_start_cf
    throw v3

    .line 135
    :catch_d0
    move-exception v20

    .line 136
    .restart local v20    # "e":Ljava/io/IOException;
    const-string v7, "Downsampler"

    const/4 v8, 0x5

    invoke-static {v7, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_cf

    .line 137
    const-string v7, "Downsampler"

    const-string v8, "Cannot reset the input stream"

    move-object/from16 v0, v20

    invoke-static {v7, v8, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_cf

    .line 163
    .end local v20    # "e":Ljava/io/IOException;
    .restart local v4    # "degreesToRotate":I
    .restart local v5    # "inWidth":I
    .restart local v6    # "inHeight":I
    .restart local v14    # "sampleSize":I
    .restart local v19    # "downsampled":Landroid/graphics/Bitmap;
    .restart local v22    # "inDimens":[I
    .restart local v26    # "streamException":Ljava/lang/Exception;
    :cond_e4
    const/16 v25, 0x0

    .line 164
    .local v25, "rotated":Landroid/graphics/Bitmap;
    if-eqz v19, :cond_109

    .line 165
    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/bumptech/glide/load/resource/bitmap/TransformationUtils;->rotateImageExif(Landroid/graphics/Bitmap;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;I)Landroid/graphics/Bitmap;

    move-result-object v25

    .line 167
    move-object/from16 v0, v19

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_109

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;->put(Landroid/graphics/Bitmap;)Z

    move-result v3

    if-nez v3, :cond_109

    .line 168
    invoke-virtual/range {v19 .. v19}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_109
    .catchall {:try_start_cf .. :try_end_109} :catchall_79

    .line 174
    :cond_109
    invoke-virtual/range {v16 .. v17}, Lcom/bumptech/glide/util/ByteArrayPool;->releaseBytes([B)Z

    .line 175
    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/util/ByteArrayPool;->releaseBytes([B)Z

    .line 176
    invoke-virtual/range {v21 .. v21}, Lcom/bumptech/glide/util/ExceptionCatchingInputStream;->release()V

    .line 177
    invoke-static {v10}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->releaseOptions(Landroid/graphics/BitmapFactory$Options;)V

    return-object v25
.end method

.method public bridge synthetic decode(Ljava/lang/Object;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;IILcom/bumptech/glide/load/DecodeFormat;)Landroid/graphics/Bitmap;
    .registers 12
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;
    .param p3, "x2"    # I
    .param p4, "x3"    # I
    .param p5, "x4"    # Lcom/bumptech/glide/load/DecodeFormat;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 26
    move-object v1, p1

    check-cast v1, Ljava/io/InputStream;

    move-object v0, p0

    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->decode(Ljava/io/InputStream;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;IILcom/bumptech/glide/load/DecodeFormat;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public getDimensions(Lcom/bumptech/glide/util/MarkEnforcingInputStream;Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;Landroid/graphics/BitmapFactory$Options;)[I
    .registers 8
    .param p1, "is"    # Lcom/bumptech/glide/util/MarkEnforcingInputStream;
    .param p2, "bufferedStream"    # Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;
    .param p3, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 303
    iput-boolean v3, p3, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 304
    invoke-static {p1, p2, p3}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->decodeStream(Lcom/bumptech/glide/util/MarkEnforcingInputStream;Lcom/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 305
    iput-boolean v2, p3, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 306
    const/4 v0, 0x2

    new-array v0, v0, [I

    iget v1, p3, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    aput v1, v0, v2

    iget v1, p3, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    aput v1, v0, v3

    return-object v0
.end method

.method protected abstract getSampleSize(IIII)I
.end method
