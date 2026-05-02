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
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
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
    .line 80
    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;->decoderLock:Ljava/lang/Object;

    monitor-enter v3

    .line 81
    :try_start_3
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 82
    .local v1, "options":Landroid/graphics/BitmapFactory$Options;
    iput p2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 83
    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    iput-object v2, v1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 84
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;->decoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-virtual {v2, p1, v1}, Landroid/graphics/BitmapRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 85
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-nez v0, :cond_21

    .line 86
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v4, "Skia image decoder returned null bitmap - image format may not be supported"

    invoke-direct {v2, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 89
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "options":Landroid/graphics/BitmapFactory$Options;
    :catchall_1e
    move-exception v2

    monitor-exit v3
    :try_end_20
    .catchall {:try_start_3 .. :try_end_20} :catchall_1e

    throw v2

    .line 88
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
    .registers 18
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 33
    invoke-virtual/range {p2 .. p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v11

    .line 34
    .local v11, "uriString":Ljava/lang/String;
    const-string v12, "android.resource://"

    invoke-virtual {v11, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_8c

    .line 36
    invoke-virtual/range {p2 .. p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v5

    .line 37
    .local v5, "packageName":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_67

    .line 38
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 44
    .local v7, "res":Landroid/content/res/Resources;
    :goto_1e
    const/4 v3, 0x0

    .line 45
    .local v3, "id":I
    invoke-virtual/range {p2 .. p2}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v9

    .line 46
    .local v9, "segments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v10

    .line 47
    .local v10, "size":I
    const/4 v12, 0x2

    if-ne v10, v12, :cond_70

    const/4 v12, 0x0

    invoke-interface {v9, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    const-string v13, "drawable"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_70

    .line 48
    const/4 v12, 0x1

    invoke-interface {v9, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 49
    .local v8, "resName":Ljava/lang/String;
    const-string v12, "drawable"

    invoke-virtual {v7, v8, v12, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 57
    .end local v8    # "resName":Ljava/lang/String;
    :cond_46
    :goto_46
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v12

    const/4 v13, 0x0

    invoke-static {v12, v13}, Landroid/graphics/BitmapRegionDecoder;->newInstance(Ljava/io/InputStream;Z)Landroid/graphics/BitmapRegionDecoder;

    move-result-object v12

    iput-object v12, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;->decoder:Landroid/graphics/BitmapRegionDecoder;

    .line 75
    .end local v3    # "id":I
    .end local v5    # "packageName":Ljava/lang/String;
    .end local v7    # "res":Landroid/content/res/Resources;
    .end local v9    # "segments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v10    # "size":I
    :cond_55
    :goto_55
    new-instance v12, Landroid/graphics/Point;

    iget-object v13, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;->decoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-virtual {v13}, Landroid/graphics/BitmapRegionDecoder;->getWidth()I

    move-result v13

    iget-object v14, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;->decoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-virtual {v14}, Landroid/graphics/BitmapRegionDecoder;->getHeight()I

    move-result v14

    invoke-direct {v12, v13, v14}, Landroid/graphics/Point;-><init>(II)V

    return-object v12

    .line 40
    .restart local v5    # "packageName":Ljava/lang/String;
    :cond_67
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    .line 41
    .local v6, "pm":Landroid/content/pm/PackageManager;
    invoke-virtual {v6, v5}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object v7

    .restart local v7    # "res":Landroid/content/res/Resources;
    goto :goto_1e

    .line 50
    .end local v6    # "pm":Landroid/content/pm/PackageManager;
    .restart local v3    # "id":I
    .restart local v9    # "segments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v10    # "size":I
    :cond_70
    const/4 v12, 0x1

    if-ne v10, v12, :cond_46

    const/4 v12, 0x0

    invoke-interface {v9, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/CharSequence;

    invoke-static {v12}, Landroid/text/TextUtils;->isDigitsOnly(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_46

    .line 52
    const/4 v12, 0x0

    :try_start_81
    invoke-interface {v9, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_8a
    .catch Ljava/lang/NumberFormatException; {:try_start_81 .. :try_end_8a} :catch_ee

    move-result v3

    goto :goto_46

    .line 58
    .end local v3    # "id":I
    .end local v5    # "packageName":Ljava/lang/String;
    .end local v7    # "res":Landroid/content/res/Resources;
    .end local v9    # "segments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v10    # "size":I
    :cond_8c
    const-string v12, "file:///android_asset/"

    invoke-virtual {v11, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_af

    .line 59
    const-string v12, "file:///android_asset/"

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 60
    .local v1, "assetName":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v12

    const/4 v13, 0x1

    invoke-virtual {v12, v1, v13}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;I)Ljava/io/InputStream;

    move-result-object v12

    const/4 v13, 0x0

    invoke-static {v12, v13}, Landroid/graphics/BitmapRegionDecoder;->newInstance(Ljava/io/InputStream;Z)Landroid/graphics/BitmapRegionDecoder;

    move-result-object v12

    iput-object v12, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;->decoder:Landroid/graphics/BitmapRegionDecoder;

    goto :goto_55

    .line 61
    .end local v1    # "assetName":Ljava/lang/String;
    :cond_af
    const-string v12, "file://"

    invoke-virtual {v11, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_c9

    .line 62
    const-string v12, "file://"

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    invoke-static {v12, v13}, Landroid/graphics/BitmapRegionDecoder;->newInstance(Ljava/lang/String;Z)Landroid/graphics/BitmapRegionDecoder;

    move-result-object v12

    iput-object v12, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;->decoder:Landroid/graphics/BitmapRegionDecoder;

    goto :goto_55

    .line 64
    :cond_c9
    const/4 v4, 0x0

    .line 66
    .local v4, "inputStream":Ljava/io/InputStream;
    :try_start_ca
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 67
    .local v2, "contentResolver":Landroid/content/ContentResolver;
    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v4

    .line 68
    const/4 v12, 0x0

    invoke-static {v4, v12}, Landroid/graphics/BitmapRegionDecoder;->newInstance(Ljava/io/InputStream;Z)Landroid/graphics/BitmapRegionDecoder;

    move-result-object v12

    iput-object v12, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;->decoder:Landroid/graphics/BitmapRegionDecoder;
    :try_end_db
    .catchall {:try_start_ca .. :try_end_db} :catchall_e5

    .line 70
    if-eqz v4, :cond_55

    .line 71
    :try_start_dd
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_e0
    .catch Ljava/lang/Exception; {:try_start_dd .. :try_end_e0} :catch_e2

    goto/16 :goto_55

    :catch_e2
    move-exception v12

    goto/16 :goto_55

    .line 70
    .end local v2    # "contentResolver":Landroid/content/ContentResolver;
    :catchall_e5
    move-exception v12

    if-eqz v4, :cond_eb

    .line 71
    :try_start_e8
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_eb
    .catch Ljava/lang/Exception; {:try_start_e8 .. :try_end_eb} :catch_ec

    :cond_eb
    :goto_eb
    throw v12

    :catch_ec
    move-exception v13

    goto :goto_eb

    .line 53
    .end local v4    # "inputStream":Ljava/io/InputStream;
    .restart local v3    # "id":I
    .restart local v5    # "packageName":Ljava/lang/String;
    .restart local v7    # "res":Landroid/content/res/Resources;
    .restart local v9    # "segments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v10    # "size":I
    :catch_ee
    move-exception v12

    goto/16 :goto_46
.end method

.method public isReady()Z
    .registers 2

    .prologue
    .line 94
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
    .line 99
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;->decoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-virtual {v0}, Landroid/graphics/BitmapRegionDecoder;->recycle()V

    .line 100
    return-void
.end method
