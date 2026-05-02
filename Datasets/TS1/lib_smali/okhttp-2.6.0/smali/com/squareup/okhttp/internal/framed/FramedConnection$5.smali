.class Lcom/squareup/okhttp/internal/framed/FramedConnection$5;
.super Lcom/squareup/okhttp/internal/NamedRunnable;
.source "FramedConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/squareup/okhttp/internal/framed/FramedConnection;->pushHeadersLater(ILjava/util/List;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

.field final synthetic val$inFinished:Z

.field final synthetic val$requestHeaders:Ljava/util/List;

.field final synthetic val$streamId:I


# direct methods
.method varargs constructor <init>(Lcom/squareup/okhttp/internal/framed/FramedConnection;Ljava/lang/String;[Ljava/lang/Object;ILjava/util/List;Z)V
    .registers 7
    .param p1, "this$0"    # Lcom/squareup/okhttp/internal/framed/FramedConnection;
    .param p2, "format"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 829
    iput-object p1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$5;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    iput p4, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$5;->val$streamId:I

    iput-object p5, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$5;->val$requestHeaders:Ljava/util/List;

    iput-boolean p6, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$5;->val$inFinished:Z

    invoke-direct {p0, p2, p3}, Lcom/squareup/okhttp/internal/NamedRunnable;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public execute()V
    .registers 6

    .prologue
    .line 831
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$5;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->pushObserver:Lcom/squareup/okhttp/internal/framed/PushObserver;
    invoke-static {v1}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$2500(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Lcom/squareup/okhttp/internal/framed/PushObserver;

    move-result-object v1

    iget v2, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$5;->val$streamId:I

    iget-object v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$5;->val$requestHeaders:Ljava/util/List;

    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$5;->val$inFinished:Z

    invoke-interface {v1, v2, v3, v4}, Lcom/squareup/okhttp/internal/framed/PushObserver;->onHeaders(ILjava/util/List;Z)Z

    move-result v0

    .line 833
    .local v0, "cancel":Z
    if-eqz v0, :cond_1d

    :try_start_12
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$5;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    iget-object v1, v1, Lcom/squareup/okhttp/internal/framed/FramedConnection;->frameWriter:Lcom/squareup/okhttp/internal/framed/FrameWriter;

    iget v2, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$5;->val$streamId:I

    sget-object v3, Lcom/squareup/okhttp/internal/framed/ErrorCode;->CANCEL:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    invoke-interface {v1, v2, v3}, Lcom/squareup/okhttp/internal/framed/FrameWriter;->rstStream(ILcom/squareup/okhttp/internal/framed/ErrorCode;)V

    .line 834
    :cond_1d
    if-nez v0, :cond_23

    iget-boolean v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$5;->val$inFinished:Z

    if-eqz v1, :cond_36

    .line 835
    :cond_23
    iget-object v2, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$5;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    monitor-enter v2
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_26} :catch_3a

    .line 836
    :try_start_26
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$5;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->currentPushRequests:Ljava/util/Set;
    invoke-static {v1}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$2600(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Ljava/util/Set;

    move-result-object v1

    iget v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$5;->val$streamId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 837
    monitor-exit v2

    .line 841
    :cond_36
    :goto_36
    return-void

    .line 837
    :catchall_37
    move-exception v1

    monitor-exit v2
    :try_end_39
    .catchall {:try_start_26 .. :try_end_39} :catchall_37

    :try_start_39
    throw v1
    :try_end_3a
    .catch Ljava/io/IOException; {:try_start_39 .. :try_end_3a} :catch_3a

    .line 839
    :catch_3a
    move-exception v1

    goto :goto_36
.end method
