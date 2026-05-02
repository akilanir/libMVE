.class Lcom/squareup/okhttp/internal/DiskLruCache$Editor$1;
.super Lcom/squareup/okhttp/internal/FaultHidingSink;
.source "DiskLruCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->newSink(I)Lokio/Sink;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;


# direct methods
.method constructor <init>(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Lokio/Sink;)V
    .registers 3
    .param p1, "this$1"    # Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    .param p2, "delegate"    # Lokio/Sink;

    .prologue
    .line 879
    iput-object p1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor$1;->this$1:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    invoke-direct {p0, p2}, Lcom/squareup/okhttp/internal/FaultHidingSink;-><init>(Lokio/Sink;)V

    return-void
.end method


# virtual methods
.method protected onException(Ljava/io/IOException;)V
    .registers 5
    .param p1, "e"    # Ljava/io/IOException;

    .prologue
    .line 881
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor$1;->this$1:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    iget-object v1, v0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    monitor-enter v1

    .line 882
    :try_start_5
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor$1;->this$1:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    const/4 v2, 0x1

    # setter for: Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->hasErrors:Z
    invoke-static {v0, v2}, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->access$1902(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)Z

    .line 883
    monitor-exit v1

    .line 884
    return-void

    .line 883
    :catchall_d
    move-exception v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_5 .. :try_end_f} :catchall_d

    throw v0
.end method
