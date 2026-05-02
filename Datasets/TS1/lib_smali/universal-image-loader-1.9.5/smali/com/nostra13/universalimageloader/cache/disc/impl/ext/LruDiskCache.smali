.class public Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;
.super Ljava/lang/Object;
.source "LruDiskCache.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/cache/disc/DiskCache;


# static fields
.field public static final DEFAULT_BUFFER_SIZE:I = 0x8000

.field public static final DEFAULT_COMPRESS_FORMAT:Landroid/graphics/Bitmap$CompressFormat;

.field public static final DEFAULT_COMPRESS_QUALITY:I = 0x64

.field private static final ERROR_ARG_NEGATIVE:Ljava/lang/String; = " argument must be positive number"

.field private static final ERROR_ARG_NULL:Ljava/lang/String; = " argument must be not null"


# instance fields
.field protected bufferSize:I

.field protected cache:Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;

.field protected compressFormat:Landroid/graphics/Bitmap$CompressFormat;

.field protected compressQuality:I

.field protected final fileNameGenerator:Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;

.field private reserveCacheDir:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 43
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    sput-object v0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->DEFAULT_COMPRESS_FORMAT:Landroid/graphics/Bitmap$CompressFormat;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;J)V
    .registers 12
    .param p1, "cacheDir"    # Ljava/io/File;
    .param p2, "fileNameGenerator"    # Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;
    .param p3, "cacheMaxSize"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 69
    const/4 v2, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-wide v4, p3

    invoke-direct/range {v0 .. v6}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;-><init>(Ljava/io/File;Ljava/io/File;Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;JI)V

    .line 70
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/io/File;Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;JI)V
    .registers 13
    .param p1, "cacheDir"    # Ljava/io/File;
    .param p2, "reserveCacheDir"    # Ljava/io/File;
    .param p3, "fileNameGenerator"    # Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;
    .param p4, "cacheMaxSize"    # J
    .param p6, "cacheMaxFileCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v1, 0x0

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    const v0, 0x8000

    iput v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->bufferSize:I

    .line 57
    sget-object v0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->DEFAULT_COMPRESS_FORMAT:Landroid/graphics/Bitmap$CompressFormat;

    iput-object v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->compressFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 58
    const/16 v0, 0x64

    iput v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->compressQuality:I

    .line 84
    if-nez p1, :cond_1c

    .line 85
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "cacheDir argument must be not null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 87
    :cond_1c
    cmp-long v0, p4, v1

    if-gez v0, :cond_28

    .line 88
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "cacheMaxSize argument must be positive number"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 90
    :cond_28
    if-gez p6, :cond_32

    .line 91
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "cacheMaxFileCount argument must be positive number"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 93
    :cond_32
    if-nez p3, :cond_3c

    .line 94
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "fileNameGenerator argument must be not null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 97
    :cond_3c
    cmp-long v0, p4, v1

    if-nez v0, :cond_45

    .line 98
    const-wide p4, 0x7fffffffffffffffL

    .line 100
    :cond_45
    if-nez p6, :cond_4a

    .line 101
    const p6, 0x7fffffff

    .line 104
    :cond_4a
    iput-object p2, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->reserveCacheDir:Ljava/io/File;

    .line 105
    iput-object p3, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->fileNameGenerator:Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p4

    move v5, p6

    .line 106
    invoke-direct/range {v0 .. v5}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->initCache(Ljava/io/File;Ljava/io/File;JI)V

    .line 107
    return-void
.end method

.method private getKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "imageUri"    # Ljava/lang/String;

    .prologue
    .line 224
    iget-object v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->fileNameGenerator:Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;

    invoke-interface {v0, p1}, Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;->generate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private initCache(Ljava/io/File;Ljava/io/File;JI)V
    .registers 13
    .param p1, "cacheDir"    # Ljava/io/File;
    .param p2, "reserveCacheDir"    # Ljava/io/File;
    .param p3, "cacheMaxSize"    # J
    .param p5, "cacheMaxFileCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    const/4 v1, 0x1

    const/4 v2, 0x1

    move-object v0, p1

    move-wide v3, p3

    move v5, p5

    :try_start_5
    invoke-static/range {v0 .. v5}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;->open(Ljava/io/File;IIJI)Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->cache:Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_b} :catch_c

    .line 122
    :cond_b
    return-void

    .line 113
    :catch_c
    move-exception v6

    .line 114
    .local v6, "e":Ljava/io/IOException;
    invoke-static {v6}, Lcom/nostra13/universalimageloader/utils/L;->e(Ljava/lang/Throwable;)V

    .line 115
    if-eqz p2, :cond_1a

    .line 116
    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p2

    move-wide v3, p3

    move v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->initCache(Ljava/io/File;Ljava/io/File;JI)V

    .line 118
    :cond_1a
    iget-object v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->cache:Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;

    if-nez v0, :cond_b

    .line 119
    throw v6
.end method


# virtual methods
.method public clear()V
    .registers 8

    .prologue
    .line 212
    :try_start_0
    iget-object v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->cache:Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;->delete()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_1e

    .line 217
    :goto_5
    :try_start_5
    iget-object v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->cache:Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;->getDirectory()Ljava/io/File;

    move-result-object v1

    iget-object v2, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->reserveCacheDir:Ljava/io/File;

    iget-object v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->cache:Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;->getMaxSize()J

    move-result-wide v3

    iget-object v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->cache:Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;->getMaxFileCount()I

    move-result v5

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->initCache(Ljava/io/File;Ljava/io/File;JI)V
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_1d} :catch_23

    .line 221
    :goto_1d
    return-void

    .line 213
    :catch_1e
    move-exception v6

    .line 214
    .local v6, "e":Ljava/io/IOException;
    invoke-static {v6}, Lcom/nostra13/universalimageloader/utils/L;->e(Ljava/lang/Throwable;)V

    goto :goto_5

    .line 218
    .end local v6    # "e":Ljava/io/IOException;
    :catch_23
    move-exception v6

    .line 219
    .restart local v6    # "e":Ljava/io/IOException;
    invoke-static {v6}, Lcom/nostra13/universalimageloader/utils/L;->e(Ljava/lang/Throwable;)V

    goto :goto_1d
.end method

.method public close()V
    .registers 3

    .prologue
    .line 202
    :try_start_0
    iget-object v1, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->cache:Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;

    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_9

    .line 206
    :goto_5
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->cache:Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;

    .line 207
    return-void

    .line 203
    :catch_9
    move-exception v0

    .line 204
    .local v0, "e":Ljava/io/IOException;
    invoke-static {v0}, Lcom/nostra13/universalimageloader/utils/L;->e(Ljava/lang/Throwable;)V

    goto :goto_5
.end method

.method public get(Ljava/lang/String;)Ljava/io/File;
    .registers 7
    .param p1, "imageUri"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 131
    const/4 v1, 0x0

    .line 133
    .local v1, "snapshot":Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;
    :try_start_2
    iget-object v3, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->cache:Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;

    invoke-direct {p0, p1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->getKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;->get(Ljava/lang/String;)Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_b} :catch_1a
    .catchall {:try_start_2 .. :try_end_b} :catchall_24

    move-result-object v1

    .line 134
    if-nez v1, :cond_14

    .line 139
    :goto_e
    if-eqz v1, :cond_13

    .line 140
    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;->close()V

    :cond_13
    :goto_13
    return-object v2

    .line 134
    :cond_14
    const/4 v3, 0x0

    :try_start_15
    invoke-virtual {v1, v3}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;->getFile(I)Ljava/io/File;
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_18} :catch_1a
    .catchall {:try_start_15 .. :try_end_18} :catchall_24

    move-result-object v2

    goto :goto_e

    .line 135
    :catch_1a
    move-exception v0

    .line 136
    .local v0, "e":Ljava/io/IOException;
    :try_start_1b
    invoke-static {v0}, Lcom/nostra13/universalimageloader/utils/L;->e(Ljava/lang/Throwable;)V
    :try_end_1e
    .catchall {:try_start_1b .. :try_end_1e} :catchall_24

    .line 139
    if-eqz v1, :cond_13

    .line 140
    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;->close()V

    goto :goto_13

    .line 139
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_24
    move-exception v2

    if-eqz v1, :cond_2a

    .line 140
    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;->close()V

    :cond_2a
    throw v2
.end method

.method public getDirectory()Ljava/io/File;
    .registers 2

    .prologue
    .line 126
    iget-object v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->cache:Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;->getDirectory()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/String;)Z
    .registers 5
    .param p1, "imageUri"    # Ljava/lang/String;

    .prologue
    .line 192
    :try_start_0
    iget-object v1, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->cache:Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;

    invoke-direct {p0, p1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->getKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;->remove(Ljava/lang/String;)Z
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_9} :catch_b

    move-result v1

    .line 195
    :goto_a
    return v1

    .line 193
    :catch_b
    move-exception v0

    .line 194
    .local v0, "e":Ljava/io/IOException;
    invoke-static {v0}, Lcom/nostra13/universalimageloader/utils/L;->e(Ljava/lang/Throwable;)V

    .line 195
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public save(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
    .registers 8
    .param p1, "imageUri"    # Ljava/lang/String;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 169
    iget-object v3, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->cache:Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;

    invoke-direct {p0, p1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->getKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;->edit(Ljava/lang/String;)Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;

    move-result-object v0

    .line 170
    .local v0, "editor":Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;
    if-nez v0, :cond_e

    .line 186
    :goto_d
    return v2

    .line 174
    :cond_e
    new-instance v1, Ljava/io/BufferedOutputStream;

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;->newOutputStream(I)Ljava/io/OutputStream;

    move-result-object v3

    iget v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->bufferSize:I

    invoke-direct {v1, v3, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    .line 175
    .local v1, "os":Ljava/io/OutputStream;
    const/4 v2, 0x0

    .line 177
    .local v2, "savedSuccessfully":Z
    :try_start_1a
    iget-object v3, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->compressFormat:Landroid/graphics/Bitmap$CompressFormat;

    iget v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->compressQuality:I

    invoke-virtual {p2, v3, v4, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_21
    .catchall {:try_start_1a .. :try_end_21} :catchall_2b

    move-result v2

    .line 179
    invoke-static {v1}, Lcom/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 181
    if-eqz v2, :cond_30

    .line 182
    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;->commit()V

    goto :goto_d

    .line 179
    :catchall_2b
    move-exception v3

    invoke-static {v1}, Lcom/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    throw v3

    .line 184
    :cond_30
    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;->abort()V

    goto :goto_d
.end method

.method public save(Ljava/lang/String;Ljava/io/InputStream;Lcom/nostra13/universalimageloader/utils/IoUtils$CopyListener;)Z
    .registers 9
    .param p1, "imageUri"    # Ljava/lang/String;
    .param p2, "imageStream"    # Ljava/io/InputStream;
    .param p3, "listener"    # Lcom/nostra13/universalimageloader/utils/IoUtils$CopyListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 147
    iget-object v3, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->cache:Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;

    invoke-direct {p0, p1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->getKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;->edit(Ljava/lang/String;)Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;

    move-result-object v1

    .line 148
    .local v1, "editor":Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;
    if-nez v1, :cond_e

    .line 164
    :goto_d
    return v0

    .line 152
    :cond_e
    new-instance v2, Ljava/io/BufferedOutputStream;

    invoke-virtual {v1, v0}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;->newOutputStream(I)Ljava/io/OutputStream;

    move-result-object v3

    iget v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->bufferSize:I

    invoke-direct {v2, v3, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    .line 153
    .local v2, "os":Ljava/io/OutputStream;
    const/4 v0, 0x0

    .line 155
    .local v0, "copied":Z
    :try_start_1a
    iget v3, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->bufferSize:I

    invoke-static {p2, v2, p3, v3}, Lcom/nostra13/universalimageloader/utils/IoUtils;->copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;Lcom/nostra13/universalimageloader/utils/IoUtils$CopyListener;I)Z
    :try_end_1f
    .catchall {:try_start_1a .. :try_end_1f} :catchall_2d

    move-result v0

    .line 157
    invoke-static {v2}, Lcom/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 158
    if-eqz v0, :cond_29

    .line 159
    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;->commit()V

    goto :goto_d

    .line 161
    :cond_29
    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;->abort()V

    goto :goto_d

    .line 157
    :catchall_2d
    move-exception v3

    invoke-static {v2}, Lcom/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 158
    if-eqz v0, :cond_37

    .line 159
    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;->commit()V

    .line 161
    :goto_36
    throw v3

    :cond_37
    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;->abort()V

    goto :goto_36
.end method

.method public setBufferSize(I)V
    .registers 2
    .param p1, "bufferSize"    # I

    .prologue
    .line 228
    iput p1, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->bufferSize:I

    .line 229
    return-void
.end method

.method public setCompressFormat(Landroid/graphics/Bitmap$CompressFormat;)V
    .registers 2
    .param p1, "compressFormat"    # Landroid/graphics/Bitmap$CompressFormat;

    .prologue
    .line 232
    iput-object p1, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->compressFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 233
    return-void
.end method

.method public setCompressQuality(I)V
    .registers 2
    .param p1, "compressQuality"    # I

    .prologue
    .line 236
    iput p1, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiskCache;->compressQuality:I

    .line 237
    return-void
.end method
