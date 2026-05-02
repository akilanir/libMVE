.class public Lcom/octo/android/robospice/request/simple/BitmapRequest;
.super Lcom/octo/android/robospice/request/SpiceRequest;
.source "BitmapRequest.java"

# interfaces
.implements Lcom/octo/android/robospice/request/simple/IBitmapRequest;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/octo/android/robospice/request/SpiceRequest",
        "<",
        "Landroid/graphics/Bitmap;",
        ">;",
        "Lcom/octo/android/robospice/request/simple/IBitmapRequest;"
    }
.end annotation


# static fields
.field private static final BUF_SIZE:I = 0x1000


# instance fields
.field private cacheFile:Ljava/io/File;

.field private height:I

.field private options:Landroid/graphics/BitmapFactory$Options;

.field private url:Ljava/lang/String;

.field private width:I


# direct methods
.method public constructor <init>(Ljava/lang/String;IILjava/io/File;)V
    .registers 7
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "cacheFile"    # Ljava/io/File;

    .prologue
    const/4 v1, -0x1

    .line 76
    const-class v0, Landroid/graphics/Bitmap;

    invoke-direct {p0, v0}, Lcom/octo/android/robospice/request/SpiceRequest;-><init>(Ljava/lang/Class;)V

    .line 34
    iput v1, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->height:I

    .line 35
    iput v1, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->width:I

    .line 77
    iput-object p1, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->url:Ljava/lang/String;

    .line 78
    iput p2, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->width:I

    .line 79
    iput p3, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->height:I

    .line 80
    iput-object p4, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->cacheFile:Ljava/io/File;

    .line 81
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;Ljava/io/File;)V
    .registers 6
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;
    .param p3, "cacheFile"    # Ljava/io/File;

    .prologue
    const/4 v1, -0x1

    .line 58
    const-class v0, Landroid/graphics/Bitmap;

    invoke-direct {p0, v0}, Lcom/octo/android/robospice/request/SpiceRequest;-><init>(Ljava/lang/Class;)V

    .line 34
    iput v1, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->height:I

    .line 35
    iput v1, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->width:I

    .line 59
    iput-object p1, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->url:Ljava/lang/String;

    .line 60
    iput-object p2, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->options:Landroid/graphics/BitmapFactory$Options;

    .line 61
    iput-object p3, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->cacheFile:Ljava/io/File;

    .line 62
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/io/File;)V
    .registers 4
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "cacheFile"    # Ljava/io/File;

    .prologue
    .line 45
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    invoke-direct {p0, p1, v0, p2}, Lcom/octo/android/robospice/request/simple/BitmapRequest;-><init>(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;Ljava/io/File;)V

    .line 46
    return-void
.end method

.method private static calculateInSampleSize(Landroid/graphics/BitmapFactory$Options;II)I
    .registers 8
    .param p0, "options"    # Landroid/graphics/BitmapFactory$Options;
    .param p1, "reqWidth"    # I
    .param p2, "reqHeight"    # I

    .prologue
    .line 158
    iget v0, p0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 159
    .local v0, "height":I
    iget v2, p0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 160
    .local v2, "width":I
    const/4 v1, 0x1

    .line 162
    .local v1, "inSampleSize":I
    if-gt v0, p2, :cond_9

    if-le v2, p1, :cond_12

    .line 163
    :cond_9
    if-le v2, v0, :cond_13

    .line 164
    int-to-float v3, v0

    int-to-float v4, p2

    div-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 169
    :cond_12
    :goto_12
    return v1

    .line 166
    :cond_13
    int-to-float v3, v2

    int-to-float v4, p1

    div-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v1

    goto :goto_12
.end method


# virtual methods
.method public getCacheFile()Ljava/io/File;
    .registers 2

    .prologue
    .line 120
    iget-object v0, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->cacheFile:Ljava/io/File;

    return-object v0
.end method

.method protected final getUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 110
    iget-object v0, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->url:Ljava/lang/String;

    return-object v0
.end method

.method public loadDataFromNetwork()Landroid/graphics/Bitmap;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, -0x1

    const/4 v6, 0x0

    .line 86
    :try_start_2
    new-instance v2, Ljava/net/URL;

    iget-object v3, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->url:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 87
    .local v1, "httpURLConnection":Ljava/net/HttpURLConnection;
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v2

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/octo/android/robospice/request/simple/BitmapRequest;->processStream(ILjava/io/InputStream;)V

    .line 89
    iget v2, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->width:I

    if-eq v2, v4, :cond_5e

    iget v2, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->height:I

    if-eq v2, v4, :cond_5e

    .line 90
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    iput-object v2, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->options:Landroid/graphics/BitmapFactory$Options;

    .line 91
    iget-object v2, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->options:Landroid/graphics/BitmapFactory$Options;

    const/4 v3, 0x1

    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 92
    iget-object v2, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->cacheFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->options:Landroid/graphics/BitmapFactory$Options;

    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 93
    iget-object v2, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->options:Landroid/graphics/BitmapFactory$Options;

    iget-object v3, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->options:Landroid/graphics/BitmapFactory$Options;

    iget v4, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->width:I

    iget v5, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->height:I

    invoke-static {v3, v4, v5}, Lcom/octo/android/robospice/request/simple/BitmapRequest;->calculateInSampleSize(Landroid/graphics/BitmapFactory$Options;II)I

    move-result v3

    iput v3, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 94
    iget-object v2, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->options:Landroid/graphics/BitmapFactory$Options;

    const/4 v3, 0x0

    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 95
    iget-object v2, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->options:Landroid/graphics/BitmapFactory$Options;

    const/4 v3, 0x1

    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 96
    iget-object v2, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->cacheFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->options:Landroid/graphics/BitmapFactory$Options;

    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 98
    :goto_5d
    return-object v2

    :cond_5e
    iget-object v2, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->cacheFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->options:Landroid/graphics/BitmapFactory$Options;

    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_69
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_69} :catch_6b
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_69} :catch_74

    move-result-object v2

    goto :goto_5d

    .line 100
    .end local v1    # "httpURLConnection":Ljava/net/HttpURLConnection;
    :catch_6b
    move-exception v0

    .line 101
    .local v0, "e":Ljava/net/MalformedURLException;
    const-string v2, "Unable to create URL"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {v0, v2, v3}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 102
    throw v0

    .line 103
    .end local v0    # "e":Ljava/net/MalformedURLException;
    :catch_74
    move-exception v0

    .line 104
    .local v0, "e":Ljava/io/IOException;
    const-string v2, "Unable to download binary"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {v0, v2, v3}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 105
    throw v0
.end method

.method public bridge synthetic loadDataFromNetwork()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 26
    invoke-virtual {p0}, Lcom/octo/android/robospice/request/simple/BitmapRequest;->loadDataFromNetwork()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public processStream(ILjava/io/InputStream;)V
    .registers 10
    .param p1, "contentLength"    # I
    .param p2, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    const/4 v0, 0x0

    .line 127
    .local v0, "fileOutputStream":Ljava/io/OutputStream;
    :try_start_1
    iget-object v3, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->cacheFile:Ljava/io/File;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/io/File;->setLastModified(J)Z

    move-result v2

    .line 128
    .local v2, "isTouchedNow":Z
    if-nez v2, :cond_1e

    .line 129
    const-string v3, "Modification time of file %s could not be changed normally "

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->cacheFile:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 131
    :cond_1e
    new-instance v1, Ljava/io/FileOutputStream;

    iget-object v3, p0, Lcom/octo/android/robospice/request/simple/BitmapRequest;->cacheFile:Ljava/io/File;

    invoke-direct {v1, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_25
    .catchall {:try_start_1 .. :try_end_25} :catchall_32

    .line 132
    .end local v0    # "fileOutputStream":Ljava/io/OutputStream;
    .local v1, "fileOutputStream":Ljava/io/OutputStream;
    :try_start_25
    new-instance v3, Lcom/octo/android/robospice/request/ProgressByteProcessor;

    int-to-long v4, p1

    invoke-direct {v3, p0, v1, v4, v5}, Lcom/octo/android/robospice/request/ProgressByteProcessor;-><init>(Lcom/octo/android/robospice/request/SpiceRequest;Ljava/io/OutputStream;J)V

    invoke-virtual {p0, p2, v3}, Lcom/octo/android/robospice/request/simple/BitmapRequest;->readBytes(Ljava/io/InputStream;Lcom/octo/android/robospice/request/ProgressByteProcessor;)V
    :try_end_2e
    .catchall {:try_start_25 .. :try_end_2e} :catchall_37

    .line 134
    invoke-static {v1}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    .line 136
    return-void

    .line 134
    .end local v1    # "fileOutputStream":Ljava/io/OutputStream;
    .end local v2    # "isTouchedNow":Z
    .restart local v0    # "fileOutputStream":Ljava/io/OutputStream;
    :catchall_32
    move-exception v3

    :goto_33
    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    throw v3

    .end local v0    # "fileOutputStream":Ljava/io/OutputStream;
    .restart local v1    # "fileOutputStream":Ljava/io/OutputStream;
    .restart local v2    # "isTouchedNow":Z
    :catchall_37
    move-exception v3

    move-object v0, v1

    .end local v1    # "fileOutputStream":Ljava/io/OutputStream;
    .restart local v0    # "fileOutputStream":Ljava/io/OutputStream;
    goto :goto_33
.end method

.method protected readBytes(Ljava/io/InputStream;Lcom/octo/android/robospice/request/ProgressByteProcessor;)V
    .registers 6
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "processor"    # Lcom/octo/android/robospice/request/ProgressByteProcessor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 142
    const/16 v2, 0x1000

    new-array v1, v2, [B

    .line 146
    .local v1, "buf":[B
    :cond_4
    :try_start_4
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I
    :try_end_7
    .catchall {:try_start_4 .. :try_end_7} :catchall_17

    move-result v0

    .line 147
    .local v0, "amt":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_f

    .line 152
    :goto_b
    invoke-static {p1}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 154
    return-void

    .line 150
    :cond_f
    const/4 v2, 0x0

    :try_start_10
    invoke-virtual {p2, v1, v2, v0}, Lcom/octo/android/robospice/request/ProgressByteProcessor;->processBytes([BII)Z
    :try_end_13
    .catchall {:try_start_10 .. :try_end_13} :catchall_17

    move-result v2

    if-nez v2, :cond_4

    goto :goto_b

    .line 152
    .end local v0    # "amt":I
    :catchall_17
    move-exception v2

    invoke-static {p1}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    throw v2
.end method
