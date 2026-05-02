.class Lcom/squareup/okhttp/internal/DiskLruCache$1;
.super Ljava/lang/Object;
.source "DiskLruCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/squareup/okhttp/internal/DiskLruCache;


# direct methods
.method constructor <init>(Lcom/squareup/okhttp/internal/DiskLruCache;)V
    .registers 2
    .param p1, "this$0"    # Lcom/squareup/okhttp/internal/DiskLruCache;

    .prologue
    .line 168
    iput-object p1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$1;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 170
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache$1;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    monitor-enter v2

    .line 171
    :try_start_4
    iget-object v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache$1;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache;->initialized:Z
    invoke-static {v3}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$000(Lcom/squareup/okhttp/internal/DiskLruCache;)Z

    move-result v3

    if-nez v3, :cond_d

    const/4 v1, 0x1

    :cond_d
    iget-object v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache$1;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache;->closed:Z
    invoke-static {v3}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$100(Lcom/squareup/okhttp/internal/DiskLruCache;)Z

    move-result v3

    or-int/2addr v1, v3

    if-eqz v1, :cond_18

    .line 172
    monitor-exit v2
    :try_end_17
    .catchall {:try_start_4 .. :try_end_17} :catchall_32

    .line 184
    :goto_17
    return-void

    .line 175
    :cond_18
    :try_start_18
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$1;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    # invokes: Lcom/squareup/okhttp/internal/DiskLruCache;->trimToSize()V
    invoke-static {v1}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$200(Lcom/squareup/okhttp/internal/DiskLruCache;)V

    .line 176
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$1;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    # invokes: Lcom/squareup/okhttp/internal/DiskLruCache;->journalRebuildRequired()Z
    invoke-static {v1}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$300(Lcom/squareup/okhttp/internal/DiskLruCache;)Z

    move-result v1

    if-eqz v1, :cond_30

    .line 177
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$1;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    # invokes: Lcom/squareup/okhttp/internal/DiskLruCache;->rebuildJournal()V
    invoke-static {v1}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$400(Lcom/squareup/okhttp/internal/DiskLruCache;)V

    .line 178
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$1;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    const/4 v3, 0x0

    # setter for: Lcom/squareup/okhttp/internal/DiskLruCache;->redundantOpCount:I
    invoke-static {v1, v3}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$502(Lcom/squareup/okhttp/internal/DiskLruCache;I)I
    :try_end_30
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_30} :catch_35
    .catchall {:try_start_18 .. :try_end_30} :catchall_32

    .line 183
    :cond_30
    :try_start_30
    monitor-exit v2

    goto :goto_17

    :catchall_32
    move-exception v1

    monitor-exit v2
    :try_end_34
    .catchall {:try_start_30 .. :try_end_34} :catchall_32

    throw v1

    .line 180
    :catch_35
    move-exception v0

    .line 181
    .local v0, "e":Ljava/io/IOException;
    :try_start_36
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
    :try_end_3c
    .catchall {:try_start_36 .. :try_end_3c} :catchall_32
.end method
