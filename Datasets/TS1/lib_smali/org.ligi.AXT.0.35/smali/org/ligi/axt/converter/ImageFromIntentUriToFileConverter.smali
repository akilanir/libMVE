.class public Lorg/ligi/axt/converter/ImageFromIntentUriToFileConverter;
.super Ljava/lang/Object;
.source "ImageFromIntentUriToFileConverter.java"


# instance fields
.field final context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lorg/ligi/axt/converter/ImageFromIntentUriToFileConverter;->context:Landroid/content/Context;

    .line 22
    return-void
.end method

.method private getBitmap(Ljava/lang/String;Landroid/net/Uri;)Ljava/io/File;
    .registers 8
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "url"    # Landroid/net/Uri;

    .prologue
    .line 88
    iget-object v4, p0, Lorg/ligi/axt/converter/ImageFromIntentUriToFileConverter;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    .line 90
    .local v0, "cacheDir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_f

    .line 91
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 94
    :cond_f
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 97
    .local v2, "f":Ljava/io/File;
    :try_start_14
    invoke-direct {p0, p2}, Lorg/ligi/axt/converter/ImageFromIntentUriToFileConverter;->getInputStreamByURL(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v3

    .line 98
    .local v3, "is":Ljava/io/InputStream;
    invoke-static {v3}, Lorg/ligi/axt/AXT;->at(Ljava/io/InputStream;)Lorg/ligi/axt/extensions/InputStreamAXT;

    move-result-object v4

    invoke-virtual {v4, v2}, Lorg/ligi/axt/extensions/InputStreamAXT;->toFile(Ljava/io/File;)V
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_1f} :catch_20

    .line 102
    .end local v2    # "f":Ljava/io/File;
    .end local v3    # "is":Ljava/io/InputStream;
    :goto_1f
    return-object v2

    .line 100
    .restart local v2    # "f":Ljava/io/File;
    :catch_20
    move-exception v1

    .line 101
    .local v1, "ex":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 102
    const/4 v2, 0x0

    goto :goto_1f
.end method

.method private getFilePathForKITKAT(Landroid/net/Uri;)Ljava/lang/String;
    .registers 14
    .param p1, "selectedImage"    # Landroid/net/Uri;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    const/4 v11, 0x0

    .line 65
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v10

    .line 68
    .local v10, "wholeID":Ljava/lang/String;
    const-string v0, ":"

    invoke-virtual {v10, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    aget-object v7, v0, v4

    .line 70
    .local v7, "id":Ljava/lang/String;
    new-array v2, v4, [Ljava/lang/String;

    const-string v0, "_data"

    aput-object v0, v2, v11

    .line 73
    .local v2, "column":[Ljava/lang/String;
    const-string v9, "_id=?"

    .line 75
    .local v9, "sel":Ljava/lang/String;
    iget-object v0, p0, Lorg/ligi/axt/converter/ImageFromIntentUriToFileConverter;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const-string v3, "_id=?"

    new-array v4, v4, [Ljava/lang/String;

    aput-object v7, v4, v11

    .line 76
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 78
    .local v8, "innerCursor":Landroid/database/Cursor;
    aget-object v0, v2, v11

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 80
    .local v6, "columnIndex":I
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_39

    .line 81
    invoke-interface {v8, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 83
    :cond_39
    return-object v5
.end method

.method private getInputStreamByURL(Landroid/net/Uri;)Ljava/io/InputStream;
    .registers 4
    .param p1, "url"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "content://com.google.android.gallery3d"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 108
    iget-object v0, p0, Lorg/ligi/axt/converter/ImageFromIntentUriToFileConverter;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v0

    .line 110
    :goto_16
    return-object v0

    :cond_17
    new-instance v0, Ljava/net/URL;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v0

    goto :goto_16
.end method


# virtual methods
.method public extract(Landroid/net/Uri;)Ljava/io/File;
    .registers 11
    .param p1, "selectedImage"    # Landroid/net/Uri;

    .prologue
    const/4 v3, 0x0

    .line 25
    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "_data"

    aput-object v1, v2, v0

    const/4 v0, 0x1

    const-string v1, "_display_name"

    aput-object v1, v2, v0

    .line 26
    .local v2, "filePathColumn":[Ljava/lang/String;
    iget-object v0, p0, Lorg/ligi/axt/converter/ImageFromIntentUriToFileConverter;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    move-object v1, p1

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 28
    .local v7, "cursor":Landroid/database/Cursor;
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "content://com.android.gallery3d.provider"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_37

    .line 30
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.android.gallery3d"

    const-string v4, "com.google.android.gallery3d"

    invoke-virtual {v0, v1, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 32
    :cond_37
    if-eqz v7, :cond_77

    .line 33
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 34
    const-string v0, "_data"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 36
    .local v6, "columnIndex":I
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "content://com.google.android.gallery3d"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5e

    .line 37
    const-string v0, "_display_name"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 38
    const/4 v0, -0x1

    if-eq v6, v0, :cond_5d

    .line 41
    const-string v0, "image_file_name.jpg"

    invoke-direct {p0, v0, p1}, Lorg/ligi/axt/converter/ImageFromIntentUriToFileConverter;->getBitmap(Ljava/lang/String;Landroid/net/Uri;)Ljava/io/File;

    move-result-object v3

    .line 60
    .end local v6    # "columnIndex":I
    :cond_5d
    :goto_5d
    return-object v3

    .line 45
    .restart local v6    # "columnIndex":I
    :cond_5e
    invoke-interface {v7, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 48
    .local v8, "filePath":Ljava/lang/String;
    if-nez v8, :cond_6e

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_6e

    .line 49
    invoke-direct {p0, p1}, Lorg/ligi/axt/converter/ImageFromIntentUriToFileConverter;->getFilePathForKITKAT(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v8

    .line 51
    :cond_6e
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 52
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    goto :goto_5d

    .line 56
    .end local v6    # "columnIndex":I
    .end local v8    # "filePath":Ljava/lang/String;
    :cond_77
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_5d

    .line 58
    const-string v0, "image_file_name.jpg"

    invoke-direct {p0, v0, p1}, Lorg/ligi/axt/converter/ImageFromIntentUriToFileConverter;->getBitmap(Ljava/lang/String;Landroid/net/Uri;)Ljava/io/File;

    move-result-object v3

    goto :goto_5d
.end method
