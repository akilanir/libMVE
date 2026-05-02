.class Lokhttp3/Cache$CacheRequestImpl$1;
.super Lokio/ForwardingSink;
.source "Cache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lokhttp3/Cache$CacheRequestImpl;-><init>(Lokhttp3/Cache;Lokhttp3/internal/DiskLruCache$Editor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lokhttp3/Cache$CacheRequestImpl;

.field final synthetic val$editor:Lokhttp3/internal/DiskLruCache$Editor;

.field final synthetic val$this$0:Lokhttp3/Cache;


# direct methods
.method constructor <init>(Lokhttp3/Cache$CacheRequestImpl;Lokio/Sink;Lokhttp3/Cache;Lokhttp3/internal/DiskLruCache$Editor;)V
    .registers 5
    .param p1, "this$1"    # Lokhttp3/Cache$CacheRequestImpl;
    .param p2, "x0"    # Lokio/Sink;

    .prologue
    .line 437
    iput-object p1, p0, Lokhttp3/Cache$CacheRequestImpl$1;->this$1:Lokhttp3/Cache$CacheRequestImpl;

    iput-object p3, p0, Lokhttp3/Cache$CacheRequestImpl$1;->val$this$0:Lokhttp3/Cache;

    iput-object p4, p0, Lokhttp3/Cache$CacheRequestImpl$1;->val$editor:Lokhttp3/internal/DiskLruCache$Editor;

    invoke-direct {p0, p2}, Lokio/ForwardingSink;-><init>(Lokio/Sink;)V

    return-void
.end method


# virtual methods
.method public close()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 439
    iget-object v0, p0, Lokhttp3/Cache$CacheRequestImpl$1;->this$1:Lokhttp3/Cache$CacheRequestImpl;

    iget-object v1, v0, Lokhttp3/Cache$CacheRequestImpl;->this$0:Lokhttp3/Cache;

    monitor-enter v1

    .line 440
    :try_start_5
    iget-object v0, p0, Lokhttp3/Cache$CacheRequestImpl$1;->this$1:Lokhttp3/Cache$CacheRequestImpl;

    # getter for: Lokhttp3/Cache$CacheRequestImpl;->done:Z
    invoke-static {v0}, Lokhttp3/Cache$CacheRequestImpl;->access$700(Lokhttp3/Cache$CacheRequestImpl;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 441
    monitor-exit v1

    .line 448
    :goto_e
    return-void

    .line 443
    :cond_f
    iget-object v0, p0, Lokhttp3/Cache$CacheRequestImpl$1;->this$1:Lokhttp3/Cache$CacheRequestImpl;

    const/4 v2, 0x1

    # setter for: Lokhttp3/Cache$CacheRequestImpl;->done:Z
    invoke-static {v0, v2}, Lokhttp3/Cache$CacheRequestImpl;->access$702(Lokhttp3/Cache$CacheRequestImpl;Z)Z

    .line 444
    iget-object v0, p0, Lokhttp3/Cache$CacheRequestImpl$1;->this$1:Lokhttp3/Cache$CacheRequestImpl;

    iget-object v0, v0, Lokhttp3/Cache$CacheRequestImpl;->this$0:Lokhttp3/Cache;

    # operator++ for: Lokhttp3/Cache;->writeSuccessCount:I
    invoke-static {v0}, Lokhttp3/Cache;->access$808(Lokhttp3/Cache;)I

    .line 445
    monitor-exit v1
    :try_end_1d
    .catchall {:try_start_5 .. :try_end_1d} :catchall_26

    .line 446
    invoke-super {p0}, Lokio/ForwardingSink;->close()V

    .line 447
    iget-object v0, p0, Lokhttp3/Cache$CacheRequestImpl$1;->val$editor:Lokhttp3/internal/DiskLruCache$Editor;

    invoke-virtual {v0}, Lokhttp3/internal/DiskLruCache$Editor;->commit()V

    goto :goto_e

    .line 445
    :catchall_26
    move-exception v0

    :try_start_27
    monitor-exit v1
    :try_end_28
    .catchall {:try_start_27 .. :try_end_28} :catchall_26

    throw v0
.end method
