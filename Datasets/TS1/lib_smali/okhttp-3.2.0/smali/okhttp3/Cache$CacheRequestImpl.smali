.class final Lokhttp3/Cache$CacheRequestImpl;
.super Ljava/lang/Object;
.source "Cache.java"

# interfaces
.implements Lokhttp3/internal/http/CacheRequest;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/Cache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "CacheRequestImpl"
.end annotation


# instance fields
.field private body:Lokio/Sink;

.field private cacheOut:Lokio/Sink;

.field private done:Z

.field private final editor:Lokhttp3/internal/DiskLruCache$Editor;

.field final synthetic this$0:Lokhttp3/Cache;


# direct methods
.method public constructor <init>(Lokhttp3/Cache;Lokhttp3/internal/DiskLruCache$Editor;)V
    .registers 5
    .param p2, "editor"    # Lokhttp3/internal/DiskLruCache$Editor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 434
    iput-object p1, p0, Lokhttp3/Cache$CacheRequestImpl;->this$0:Lokhttp3/Cache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 435
    iput-object p2, p0, Lokhttp3/Cache$CacheRequestImpl;->editor:Lokhttp3/internal/DiskLruCache$Editor;

    .line 436
    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Lokhttp3/internal/DiskLruCache$Editor;->newSink(I)Lokio/Sink;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/Cache$CacheRequestImpl;->cacheOut:Lokio/Sink;

    .line 437
    new-instance v0, Lokhttp3/Cache$CacheRequestImpl$1;

    iget-object v1, p0, Lokhttp3/Cache$CacheRequestImpl;->cacheOut:Lokio/Sink;

    invoke-direct {v0, p0, v1, p1, p2}, Lokhttp3/Cache$CacheRequestImpl$1;-><init>(Lokhttp3/Cache$CacheRequestImpl;Lokio/Sink;Lokhttp3/Cache;Lokhttp3/internal/DiskLruCache$Editor;)V

    iput-object v0, p0, Lokhttp3/Cache$CacheRequestImpl;->body:Lokio/Sink;

    .line 450
    return-void
.end method

.method static synthetic access$700(Lokhttp3/Cache$CacheRequestImpl;)Z
    .registers 2
    .param p0, "x0"    # Lokhttp3/Cache$CacheRequestImpl;

    .prologue
    .line 428
    iget-boolean v0, p0, Lokhttp3/Cache$CacheRequestImpl;->done:Z

    return v0
.end method

.method static synthetic access$702(Lokhttp3/Cache$CacheRequestImpl;Z)Z
    .registers 2
    .param p0, "x0"    # Lokhttp3/Cache$CacheRequestImpl;
    .param p1, "x1"    # Z

    .prologue
    .line 428
    iput-boolean p1, p0, Lokhttp3/Cache$CacheRequestImpl;->done:Z

    return p1
.end method


# virtual methods
.method public abort()V
    .registers 3

    .prologue
    .line 453
    iget-object v1, p0, Lokhttp3/Cache$CacheRequestImpl;->this$0:Lokhttp3/Cache;

    monitor-enter v1

    .line 454
    :try_start_3
    iget-boolean v0, p0, Lokhttp3/Cache$CacheRequestImpl;->done:Z

    if-eqz v0, :cond_9

    .line 455
    monitor-exit v1

    .line 465
    :goto_8
    return-void

    .line 457
    :cond_9
    const/4 v0, 0x1

    iput-boolean v0, p0, Lokhttp3/Cache$CacheRequestImpl;->done:Z

    .line 458
    iget-object v0, p0, Lokhttp3/Cache$CacheRequestImpl;->this$0:Lokhttp3/Cache;

    # operator++ for: Lokhttp3/Cache;->writeAbortCount:I
    invoke-static {v0}, Lokhttp3/Cache;->access$908(Lokhttp3/Cache;)I

    .line 459
    monitor-exit v1
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_1f

    .line 460
    iget-object v0, p0, Lokhttp3/Cache$CacheRequestImpl;->cacheOut:Lokio/Sink;

    invoke-static {v0}, Lokhttp3/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 462
    :try_start_17
    iget-object v0, p0, Lokhttp3/Cache$CacheRequestImpl;->editor:Lokhttp3/internal/DiskLruCache$Editor;

    invoke-virtual {v0}, Lokhttp3/internal/DiskLruCache$Editor;->abort()V
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_1c} :catch_1d

    goto :goto_8

    .line 463
    :catch_1d
    move-exception v0

    goto :goto_8

    .line 459
    :catchall_1f
    move-exception v0

    :try_start_20
    monitor-exit v1
    :try_end_21
    .catchall {:try_start_20 .. :try_end_21} :catchall_1f

    throw v0
.end method

.method public body()Lokio/Sink;
    .registers 2

    .prologue
    .line 468
    iget-object v0, p0, Lokhttp3/Cache$CacheRequestImpl;->body:Lokio/Sink;

    return-object v0
.end method
