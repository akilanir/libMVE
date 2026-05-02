.class public Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;
.super Ljava/lang/Object;
.source "DiskLruCacheWrapper.java"

# interfaces
.implements Lcom/bumptech/glide/load/engine/cache/DiskCache;


# static fields
.field private static final APP_VERSION:I = 0x1

.field private static final TAG:Ljava/lang/String; = "DiskLruCacheWrapper"

.field private static final VALUE_COUNT:I = 0x1

.field private static wrapper:Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;


# instance fields
.field private final directory:Ljava/io/File;

.field private diskLruCache:Lcom/bumptech/glide/disklrucache/DiskLruCache;

.field private final maxSize:I

.field private final safeKeyGenerator:Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 26
    const/4 v0, 0x0

    sput-object v0, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;->wrapper:Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;

    return-void
.end method

.method protected constructor <init>(Ljava/io/File;I)V
    .registers 4
    .param p1, "directory"    # Ljava/io/File;
    .param p2, "maxSize"    # I

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;->directory:Ljava/io/File;

    .line 52
    iput p2, p0, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;->maxSize:I

    .line 53
    new-instance v0, Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;->safeKeyGenerator:Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator;

    .line 54
    return-void
.end method

.method public static declared-synchronized get(Ljava/io/File;I)Lcom/bumptech/glide/load/engine/cache/DiskCache;
    .registers 4
    .param p0, "directory"    # Ljava/io/File;
    .param p1, "maxSize"    # I

    .prologue
    .line 44
    const-class v1, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;->wrapper:Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;

    if-nez v0, :cond_e

    .line 45
    new-instance v0, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;

    invoke-direct {v0, p0, p1}, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;-><init>(Ljava/io/File;I)V

    sput-object v0, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;->wrapper:Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;

    .line 47
    :cond_e
    sget-object v0, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;->wrapper:Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_12

    monitor-exit v1

    return-object v0

    .line 44
    :catchall_12
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private declared-synchronized getDiskCache()Lcom/bumptech/glide/disklrucache/DiskLruCache;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;->diskLruCache:Lcom/bumptech/glide/disklrucache/DiskLruCache;

    if-nez v0, :cond_12

    .line 58
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;->directory:Ljava/io/File;

    const/4 v1, 0x1

    const/4 v2, 0x1

    iget v3, p0, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;->maxSize:I

    int-to-long v3, v3

    invoke-static {v0, v1, v2, v3, v4}, Lcom/bumptech/glide/disklrucache/DiskLruCache;->open(Ljava/io/File;IIJ)Lcom/bumptech/glide/disklrucache/DiskLruCache;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;->diskLruCache:Lcom/bumptech/glide/disklrucache/DiskLruCache;

    .line 60
    :cond_12
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;->diskLruCache:Lcom/bumptech/glide/disklrucache/DiskLruCache;
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_16

    monitor-exit p0

    return-object v0

    .line 57
    :catchall_16
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public delete(Lcom/bumptech/glide/load/Key;)V
    .registers 6
    .param p1, "key"    # Lcom/bumptech/glide/load/Key;

    .prologue
    .line 108
    iget-object v2, p0, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;->safeKeyGenerator:Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator;

    invoke-virtual {v2, p1}, Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator;->getSafeKey(Lcom/bumptech/glide/load/Key;)Ljava/lang/String;

    move-result-object v1

    .line 110
    .local v1, "safeKey":Ljava/lang/String;
    :try_start_6
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;->getDiskCache()Lcom/bumptech/glide/disklrucache/DiskLruCache;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/bumptech/glide/disklrucache/DiskLruCache;->remove(Ljava/lang/String;)Z
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_d} :catch_e

    .line 116
    :cond_d
    :goto_d
    return-void

    .line 111
    :catch_e
    move-exception v0

    .line 112
    .local v0, "e":Ljava/io/IOException;
    const-string v2, "DiskLruCacheWrapper"

    const/4 v3, 0x5

    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 113
    const-string v2, "DiskLruCacheWrapper"

    const-string v3, "Unable to delete from disk cache"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_d
.end method

.method public get(Lcom/bumptech/glide/load/Key;)Ljava/io/File;
    .registers 8
    .param p1, "key"    # Lcom/bumptech/glide/load/Key;

    .prologue
    .line 65
    iget-object v4, p0, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;->safeKeyGenerator:Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator;

    invoke-virtual {v4, p1}, Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator;->getSafeKey(Lcom/bumptech/glide/load/Key;)Ljava/lang/String;

    move-result-object v2

    .line 66
    .local v2, "safeKey":Ljava/lang/String;
    const/4 v1, 0x0

    .line 71
    .local v1, "result":Ljava/io/File;
    :try_start_7
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;->getDiskCache()Lcom/bumptech/glide/disklrucache/DiskLruCache;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/bumptech/glide/disklrucache/DiskLruCache;->get(Ljava/lang/String;)Lcom/bumptech/glide/disklrucache/DiskLruCache$Value;

    move-result-object v3

    .line 72
    .local v3, "value":Lcom/bumptech/glide/disklrucache/DiskLruCache$Value;
    if-eqz v3, :cond_16

    .line 73
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/bumptech/glide/disklrucache/DiskLruCache$Value;->getFile(I)Ljava/io/File;
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_15} :catch_17

    move-result-object v1

    .line 80
    .end local v3    # "value":Lcom/bumptech/glide/disklrucache/DiskLruCache$Value;
    :cond_16
    :goto_16
    return-object v1

    .line 75
    :catch_17
    move-exception v0

    .line 76
    .local v0, "e":Ljava/io/IOException;
    const-string v4, "DiskLruCacheWrapper"

    const/4 v5, 0x5

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_16

    .line 77
    const-string v4, "DiskLruCacheWrapper"

    const-string v5, "Unable to get from disk cache"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_16
.end method

.method public put(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/cache/DiskCache$Writer;)V
    .registers 9
    .param p1, "key"    # Lcom/bumptech/glide/load/Key;
    .param p2, "writer"    # Lcom/bumptech/glide/load/engine/cache/DiskCache$Writer;

    .prologue
    .line 85
    iget-object v4, p0, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;->safeKeyGenerator:Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator;

    invoke-virtual {v4, p1}, Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator;->getSafeKey(Lcom/bumptech/glide/load/Key;)Ljava/lang/String;

    move-result-object v3

    .line 87
    .local v3, "safeKey":Ljava/lang/String;
    :try_start_6
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;->getDiskCache()Lcom/bumptech/glide/disklrucache/DiskLruCache;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/bumptech/glide/disklrucache/DiskLruCache;->edit(Ljava/lang/String;)Lcom/bumptech/glide/disklrucache/DiskLruCache$Editor;
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_d} :catch_27

    move-result-object v1

    .line 89
    .local v1, "editor":Lcom/bumptech/glide/disklrucache/DiskLruCache$Editor;
    if-eqz v1, :cond_21

    .line 91
    const/4 v4, 0x0

    :try_start_11
    invoke-virtual {v1, v4}, Lcom/bumptech/glide/disklrucache/DiskLruCache$Editor;->getFile(I)Ljava/io/File;

    move-result-object v2

    .line 92
    .local v2, "file":Ljava/io/File;
    invoke-interface {p2, v2}, Lcom/bumptech/glide/load/engine/cache/DiskCache$Writer;->write(Ljava/io/File;)Z

    move-result v4

    if-eqz v4, :cond_1e

    .line 93
    invoke-virtual {v1}, Lcom/bumptech/glide/disklrucache/DiskLruCache$Editor;->commit()V
    :try_end_1e
    .catchall {:try_start_11 .. :try_end_1e} :catchall_22

    .line 96
    :cond_1e
    :try_start_1e
    invoke-virtual {v1}, Lcom/bumptech/glide/disklrucache/DiskLruCache$Editor;->abortUnlessCommitted()V

    .line 104
    .end local v1    # "editor":Lcom/bumptech/glide/disklrucache/DiskLruCache$Editor;
    .end local v2    # "file":Ljava/io/File;
    :cond_21
    :goto_21
    return-void

    .line 96
    .restart local v1    # "editor":Lcom/bumptech/glide/disklrucache/DiskLruCache$Editor;
    :catchall_22
    move-exception v4

    invoke-virtual {v1}, Lcom/bumptech/glide/disklrucache/DiskLruCache$Editor;->abortUnlessCommitted()V

    throw v4
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_27} :catch_27

    .line 99
    .end local v1    # "editor":Lcom/bumptech/glide/disklrucache/DiskLruCache$Editor;
    :catch_27
    move-exception v0

    .line 100
    .local v0, "e":Ljava/io/IOException;
    const-string v4, "DiskLruCacheWrapper"

    const/4 v5, 0x5

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_21

    .line 101
    const-string v4, "DiskLruCacheWrapper"

    const-string v5, "Unable to put to disk cache"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_21
.end method
