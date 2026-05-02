.class public Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;
.super Ljava/lang/Object;
.source "SkiaImageRegionDecoder.java"

# interfaces
.implements Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;


# static fields
.field private static final ASSET_PREFIX:Ljava/lang/String; = "file:///android_asset/"

.field private static final FILE_PREFIX:Ljava/lang/String; = "file://"

.field private static final RESOURCE_PREFIX:Ljava/lang/String; = "android.resource://"


# instance fields
.field private decoder:Landroid/graphics/BitmapRegionDecoder;

.field private final decoderLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;->decoderLock:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public decodeRegion(Landroid/graphics/Rect;I)Landroid/graphics/Bitmap;
    .registers 8
    .param p1, "sRect"    # Landroid/graphics/Rect;
    .param p2, "sampleSize"    # I

    .prologue
    .line 71
    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;->decoderLock:Ljava/lang/Object;

    monitor-enter v3

    .line 72
    :try_start_3
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 73
    .local v1, "options":Landroid/graphics/BitmapFactory$Options;
    iput p2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 74
    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    iput-object v2, v1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 75
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;->decoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-virtual {v2, p1, v1}, Landroid/graphics/BitmapRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 76
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-nez v0, :cond_21

    .line 77
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v4, "Skia image decoder returned null bitmap - image format may not be supported"

    invoke-direct {v2, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 80
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "options":Landroid/graphics/BitmapFactory$Options;
    :catchall_1e
    move-exception v2

    monitor-exit v3
    :try_end_20
    .catchall {:try_start_3 .. :try_end_20} :catchall_1e

    throw v2

    .line 79
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v1    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_21
    :try_start_21
    monitor-exit v3
    :try_end_22
    .catchall {:try_start_21 .. :try_end_22} :catchall_1e

    return-object v0
.end method

.method public init(Landroid/content/Context;Landroid/net/Uri;)Landroid/graphics/Point;
    .registers 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 32
    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v9

    .line 33
    .local v9, "uriString":Ljava/lang/String;
    const-string v10, "android.resource://"

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_8c

    .line 35
    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v3

    .line 36
    .local v3, "packageName":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_67

    .line 37
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 43
    .local v5, "res":Landroid/content/res/Resources;
    :goto_1e
    const/4 v2, 0x0

    .line 44
    .local v2, "id":I
    invoke-virtual {p2}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    .line 45
    .local v7, "segments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    .line 46
    .local v8, "size":I
    const/4 v10, 0x2

    if-ne v8, v10, :cond_70

    const/4 v10, 0x0

    invoke-interface {v7, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    const-string v11, "drawable"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_70

    .line 47
    const/4 v10, 0x1

    invoke-interface {v7, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 48
    .local v6, "resName":Ljava/lang/String;
    const-string v10, "drawable"

    invoke-virtual {v5, v6, v10, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 56
    .end local v6    # "resName":Ljava/lang/String;
    :cond_46
    :goto_46
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-virtual {v10, v2}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v10

    const/4 v11, 0x0

    invoke-static {v10, v11}, Landroid/graphics/BitmapRegionDecoder;->newInstance(Ljava/io/InputStream;Z)Landroid/graphics/BitmapRegionDecoder;

    move-result-object v10

    iput-object v10, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;->decoder:Landroid/graphics/BitmapRegionDecoder;

    .line 66
    .end local v2    # "id":I
    .end local v3    # "packageName":Ljava/lang/String;
    .end local v5    # "res":Landroid/content/res/Resources;
    .end local v7    # "segments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v8    # "size":I
    :goto_55
    new-instance v10, Landroid/graphics/Point;

    iget-object v11, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;->decoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-virtual {v11}, Landroid/graphics/BitmapRegionDecoder;->getWidth()I

    move-result v11

    iget-object v12, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;->decoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-virtual {v12}, Landroid/graphics/BitmapRegionDecoder;->getHeight()I

    move-result v12

    invoke-direct {v10, v11, v12}, Landroid/graphics/Point;-><init>(II)V

    return-object v10

    .line 39
    .restart local v3    # "packageName":Ljava/lang/String;
    :cond_67
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 40
    .local v4, "pm":Landroid/content/pm/PackageManager;
    invoke-virtual {v4, v3}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object v5

    .restart local v5    # "res":Landroid/content/res/Resources;
    goto :goto_1e

    .line 49
    .end local v4    # "pm":Landroid/content/pm/PackageManager;
    .restart local v2    # "id":I
    .restart local v7    # "segments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v8    # "size":I
    :cond_70
    const/4 v10, 0x1

    if-ne v8, v10, :cond_46

    const/4 v10, 0x0

    invoke-interface {v7, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/CharSequence;

    invoke-static {v10}, Landroid/text/TextUtils;->isDigitsOnly(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_46

    .line 51
    const/4 v10, 0x0

    :try_start_81
    invoke-interface {v7, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_8a
    .catch Ljava/lang/NumberFormatException; {:try_start_81 .. :try_end_8a} :catch_da

    move-result v2

    goto :goto_46

    .line 57
    .end local v2    # "id":I
    .end local v3    # "packageName":Ljava/lang/String;
    .end local v5    # "res":Landroid/content/res/Resources;
    .end local v7    # "segments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v8    # "size":I
    :cond_8c
    const-string v10, "file:///android_asset/"

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_af

    .line 58
    const-string v10, "file:///android_asset/"

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 59
    .local v0, "assetName":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v10

    const/4 v11, 0x1

    invoke-virtual {v10, v0, v11}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;I)Ljava/io/InputStream;

    move-result-object v10

    const/4 v11, 0x0

    invoke-static {v10, v11}, Landroid/graphics/BitmapRegionDecoder;->newInstance(Ljava/io/InputStream;Z)Landroid/graphics/BitmapRegionDecoder;

    move-result-object v10

    iput-object v10, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;->decoder:Landroid/graphics/BitmapRegionDecoder;

    goto :goto_55

    .line 60
    .end local v0    # "assetName":Ljava/lang/String;
    :cond_af
    const-string v10, "file://"

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_c9

    .line 61
    const-string v10, "file://"

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-static {v10, v11}, Landroid/graphics/BitmapRegionDecoder;->newInstance(Ljava/lang/String;Z)Landroid/graphics/BitmapRegionDecoder;

    move-result-object v10

    iput-object v10, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;->decoder:Landroid/graphics/BitmapRegionDecoder;

    goto :goto_55

    .line 63
    :cond_c9
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 64
    .local v1, "contentResolver":Landroid/content/ContentResolver;
    invoke-virtual {v1, p2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v10

    const/4 v11, 0x0

    invoke-static {v10, v11}, Landroid/graphics/BitmapRegionDecoder;->newInstance(Ljava/io/InputStream;Z)Landroid/graphics/BitmapRegionDecoder;

    move-result-object v10

    iput-object v10, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;->decoder:Landroid/graphics/BitmapRegionDecoder;

    goto/16 :goto_55

    .line 52
    .end local v1    # "contentResolver":Landroid/content/ContentResolver;
    .restart local v2    # "id":I
    .restart local v3    # "packageName":Ljava/lang/String;
    .restart local v5    # "res":Landroid/content/res/Resources;
    .restart local v7    # "segments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v8    # "size":I
    :catch_da
    move-exception v10

    goto/16 :goto_46
.end method

.method public isReady()Z
    .registers 2

    .prologue
    .line 85
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;->decoder:Landroid/graphics/BitmapRegionDecoder;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;->decoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-virtual {v0}, Landroid/graphics/BitmapRegionDecoder;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public recycle()V
    .registers 2

    .prologue
    .line 90
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;->decoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-virtual {v0}, Landroid/graphics/BitmapRegionDecoder;->recycle()V

    .line 91
    return-void
.end method
