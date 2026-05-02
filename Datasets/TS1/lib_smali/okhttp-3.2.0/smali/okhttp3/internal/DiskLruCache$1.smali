.class Lokhttp3/internal/DiskLruCache$1;
.super Ljava/lang/Object;
.source "DiskLruCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/internal/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lokhttp3/internal/DiskLruCache;


# direct methods
.method constructor <init>(Lokhttp3/internal/DiskLruCache;)V
    .registers 2
    .param p1, "this$0"    # Lokhttp3/internal/DiskLruCache;

    .prologue
    .line 165
    iput-object p1, p0, Lokhttp3/internal/DiskLruCache$1;->this$0:Lokhttp3/internal/DiskLruCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 167
    iget-object v4, p0, Lokhttp3/internal/DiskLruCache$1;->this$0:Lokhttp3/internal/DiskLruCache;

    monitor-enter v4

    .line 168
    :try_start_5
    iget-object v5, p0, Lokhttp3/internal/DiskLruCache$1;->this$0:Lokhttp3/internal/DiskLruCache;

    # getter for: Lokhttp3/internal/DiskLruCache;->initialized:Z
    invoke-static {v5}, Lokhttp3/internal/DiskLruCache;->access$000(Lokhttp3/internal/DiskLruCache;)Z

    move-result v5

    if-nez v5, :cond_18

    :goto_d
    iget-object v3, p0, Lokhttp3/internal/DiskLruCache$1;->this$0:Lokhttp3/internal/DiskLruCache;

    # getter for: Lokhttp3/internal/DiskLruCache;->closed:Z
    invoke-static {v3}, Lokhttp3/internal/DiskLruCache;->access$100(Lokhttp3/internal/DiskLruCache;)Z

    move-result v3

    or-int/2addr v2, v3

    if-eqz v2, :cond_1a

    .line 169
    monitor-exit v4
    :try_end_17
    .catchall {:try_start_5 .. :try_end_17} :catchall_34

    .line 187
    :goto_17
    return-void

    :cond_18
    move v2, v3

    .line 168
    goto :goto_d

    .line 173
    :cond_1a
    :try_start_1a
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache$1;->this$0:Lokhttp3/internal/DiskLruCache;

    # invokes: Lokhttp3/internal/DiskLruCache;->trimToSize()V
    invoke-static {v2}, Lokhttp3/internal/DiskLruCache;->access$200(Lokhttp3/internal/DiskLruCache;)V
    :try_end_1f
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_1f} :catch_37
    .catchall {:try_start_1a .. :try_end_1f} :catchall_34

    .line 179
    :goto_1f
    :try_start_1f
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache$1;->this$0:Lokhttp3/internal/DiskLruCache;

    # invokes: Lokhttp3/internal/DiskLruCache;->journalRebuildRequired()Z
    invoke-static {v2}, Lokhttp3/internal/DiskLruCache;->access$400(Lokhttp3/internal/DiskLruCache;)Z

    move-result v2

    if-eqz v2, :cond_32

    .line 180
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache$1;->this$0:Lokhttp3/internal/DiskLruCache;

    # invokes: Lokhttp3/internal/DiskLruCache;->rebuildJournal()V
    invoke-static {v2}, Lokhttp3/internal/DiskLruCache;->access$500(Lokhttp3/internal/DiskLruCache;)V

    .line 181
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache$1;->this$0:Lokhttp3/internal/DiskLruCache;

    const/4 v3, 0x0

    # setter for: Lokhttp3/internal/DiskLruCache;->redundantOpCount:I
    invoke-static {v2, v3}, Lokhttp3/internal/DiskLruCache;->access$602(Lokhttp3/internal/DiskLruCache;I)I
    :try_end_32
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_32} :catch_3f
    .catchall {:try_start_1f .. :try_end_32} :catchall_34

    .line 186
    :cond_32
    :try_start_32
    monitor-exit v4

    goto :goto_17

    :catchall_34
    move-exception v2

    monitor-exit v4
    :try_end_36
    .catchall {:try_start_32 .. :try_end_36} :catchall_34

    throw v2

    .line 174
    :catch_37
    move-exception v1

    .line 175
    .local v1, "ignored":Ljava/io/IOException;
    :try_start_38
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache$1;->this$0:Lokhttp3/internal/DiskLruCache;

    const/4 v3, 0x1

    # setter for: Lokhttp3/internal/DiskLruCache;->mostRecentTrimFailed:Z
    invoke-static {v2, v3}, Lokhttp3/internal/DiskLruCache;->access$302(Lokhttp3/internal/DiskLruCache;Z)Z

    goto :goto_1f

    .line 183
    .end local v1    # "ignored":Ljava/io/IOException;
    :catch_3f
    move-exception v0

    .line 184
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
    :try_end_46
    .catchall {:try_start_38 .. :try_end_46} :catchall_34
.end method
