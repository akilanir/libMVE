.class public Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageDecoder;
.super Ljava/lang/Object;
.source "SkiaImageDecoder.java"

# interfaces
.implements Lcom/davemorrissey/labs/subscaleview/decoder/ImageDecoder;


# static fields
.field private static final ASSET_PREFIX:Ljava/lang/String; = "file:///android_asset/"

.field private static final FILE_PREFIX:Ljava/lang/String; = "file://"

.field private static final RESOURCE_PREFIX:Ljava/lang/String; = "android.resource://"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public decode(Landroid/content/Context;Landroid/net/Uri;)Landroid/graphics/Bitmap;
    .registers 19
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 29
    invoke-virtual/range {p2 .. p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v13

    .line 30
    .local v13, "uriString":Ljava/lang/String;
    new-instance v6, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v6}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 32
    .local v6, "options":Landroid/graphics/BitmapFactory$Options;
    sget-object v14, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    iput-object v14, v6, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 33
    const-string v14, "android.resource://"

    invoke-virtual {v13, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_86

    .line 35
    invoke-virtual/range {p2 .. p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v7

    .line 36
    .local v7, "packageName":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_61

    .line 37
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    .line 43
    .local v9, "res":Landroid/content/res/Resources;
    :goto_27
    const/4 v4, 0x0

    .line 44
    .local v4, "id":I
    invoke-virtual/range {p2 .. p2}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v11

    .line 45
    .local v11, "segments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v12

    .line 46
    .local v12, "size":I
    const/4 v14, 0x2

    if-ne v12, v14, :cond_6a

    const/4 v14, 0x0

    invoke-interface {v11, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    const-string v15, "drawable"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_6a

    .line 47
    const/4 v14, 0x1

    invoke-interface {v11, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 48
    .local v10, "resName":Ljava/lang/String;
    const-string v14, "drawable"

    invoke-virtual {v9, v10, v14, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    .line 56
    .end local v10    # "resName":Ljava/lang/String;
    :cond_4f
    :goto_4f
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    invoke-static {v14, v4, v6}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 74
    .end local v4    # "id":I
    .end local v7    # "packageName":Ljava/lang/String;
    .end local v9    # "res":Landroid/content/res/Resources;
    .end local v11    # "segments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v12    # "size":I
    .local v2, "bitmap":Landroid/graphics/Bitmap;
    :cond_57
    :goto_57
    if-nez v2, :cond_de

    .line 75
    new-instance v14, Ljava/lang/RuntimeException;

    const-string v15, "Skia image region decoder returned null bitmap - image format may not be supported"

    invoke-direct {v14, v15}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 39
    .end local v2    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v7    # "packageName":Ljava/lang/String;
    :cond_61
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v8

    .line 40
    .local v8, "pm":Landroid/content/pm/PackageManager;
    invoke-virtual {v8, v7}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object v9

    .restart local v9    # "res":Landroid/content/res/Resources;
    goto :goto_27

    .line 49
    .end local v8    # "pm":Landroid/content/pm/PackageManager;
    .restart local v4    # "id":I
    .restart local v11    # "segments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v12    # "size":I
    :cond_6a
    const/4 v14, 0x1

    if-ne v12, v14, :cond_4f

    const/4 v14, 0x0

    invoke-interface {v11, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/CharSequence;

    invoke-static {v14}, Landroid/text/TextUtils;->isDigitsOnly(Ljava/lang/CharSequence;)Z

    move-result v14

    if-eqz v14, :cond_4f

    .line 51
    const/4 v14, 0x0

    :try_start_7b
    invoke-interface {v11, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-static {v14}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_84
    .catch Ljava/lang/NumberFormatException; {:try_start_7b .. :try_end_84} :catch_df

    move-result v4

    goto :goto_4f

    .line 57
    .end local v4    # "id":I
    .end local v7    # "packageName":Ljava/lang/String;
    .end local v9    # "res":Landroid/content/res/Resources;
    .end local v11    # "segments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v12    # "size":I
    :cond_86
    const-string v14, "file:///android_asset/"

    invoke-virtual {v13, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_a6

    .line 58
    const-string v14, "file:///android_asset/"

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 59
    .local v1, "assetName":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v14

    invoke-virtual {v14, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v14

    const/4 v15, 0x0

    invoke-static {v14, v15, v6}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 60
    .restart local v2    # "bitmap":Landroid/graphics/Bitmap;
    goto :goto_57

    .end local v1    # "assetName":Ljava/lang/String;
    .end local v2    # "bitmap":Landroid/graphics/Bitmap;
    :cond_a6
    const-string v14, "file://"

    invoke-virtual {v13, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_bd

    .line 61
    const-string v14, "file://"

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14, v6}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v2

    .restart local v2    # "bitmap":Landroid/graphics/Bitmap;
    goto :goto_57

    .line 63
    .end local v2    # "bitmap":Landroid/graphics/Bitmap;
    :cond_bd
    const/4 v5, 0x0

    .line 65
    .local v5, "inputStream":Ljava/io/InputStream;
    :try_start_be
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    .line 66
    .local v3, "contentResolver":Landroid/content/ContentResolver;
    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v5

    .line 67
    const/4 v14, 0x0

    invoke-static {v5, v14, v6}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_cc
    .catchall {:try_start_be .. :try_end_cc} :catchall_d5

    move-result-object v2

    .line 69
    .restart local v2    # "bitmap":Landroid/graphics/Bitmap;
    if-eqz v5, :cond_57

    .line 70
    :try_start_cf
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_d2
    .catch Ljava/lang/Exception; {:try_start_cf .. :try_end_d2} :catch_d3

    goto :goto_57

    :catch_d3
    move-exception v14

    goto :goto_57

    .line 69
    .end local v2    # "bitmap":Landroid/graphics/Bitmap;
    .end local v3    # "contentResolver":Landroid/content/ContentResolver;
    :catchall_d5
    move-exception v14

    if-eqz v5, :cond_db

    .line 70
    :try_start_d8
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_db
    .catch Ljava/lang/Exception; {:try_start_d8 .. :try_end_db} :catch_dc

    :cond_db
    :goto_db
    throw v14

    :catch_dc
    move-exception v15

    goto :goto_db

    .line 77
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .restart local v2    # "bitmap":Landroid/graphics/Bitmap;
    :cond_de
    return-object v2

    .line 52
    .end local v2    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v4    # "id":I
    .restart local v7    # "packageName":Ljava/lang/String;
    .restart local v9    # "res":Landroid/content/res/Resources;
    .restart local v11    # "segments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v12    # "size":I
    :catch_df
    move-exception v14

    goto/16 :goto_4f
.end method
