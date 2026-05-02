.class Lcom/squareup/okhttp/internal/framed/FramedConnection$6;
.super Lcom/squareup/okhttp/internal/NamedRunnable;
.source "FramedConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/squareup/okhttp/internal/framed/FramedConnection;->pushDataLater(ILokio/BufferedSource;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

.field final synthetic val$buffer:Lokio/Buffer;

.field final synthetic val$byteCount:I

.field final synthetic val$inFinished:Z

.field final synthetic val$streamId:I


# direct methods
.method varargs constructor <init>(Lcom/squareup/okhttp/internal/framed/FramedConnection;Ljava/lang/String;[Ljava/lang/Object;ILokio/Buffer;IZ)V
    .registers 8
    .param p1, "this$0"    # Lcom/squareup/okhttp/internal/framed/FramedConnection;
    .param p2, "format"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 855
    iput-object p1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$6;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    iput p4, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$6;->val$streamId:I

    iput-object p5, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$6;->val$buffer:Lokio/Buffer;

    iput p6, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$6;->val$byteCount:I

    iput-boolean p7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$6;->val$inFinished:Z

    invoke-direct {p0, p2, p3}, Lcom/squareup/okhttp/internal/NamedRunnable;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public execute()V
    .registers 7

    .prologue
    .line 858
    :try_start_0
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$6;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->pushObserver:Lcom/squareup/okhttp/internal/framed/PushObserver;
    invoke-static {v1}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$2500(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Lcom/squareup/okhttp/internal/framed/PushObserver;

    move-result-object v1

    iget v2, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$6;->val$streamId:I

    iget-object v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$6;->val$buffer:Lokio/Buffer;

    iget v4, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$6;->val$byteCount:I

    iget-boolean v5, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$6;->val$inFinished:Z

    invoke-interface {v1, v2, v3, v4, v5}, Lcom/squareup/okhttp/internal/framed/PushObserver;->onData(ILokio/BufferedSource;IZ)Z

    move-result v0

    .line 859
    .local v0, "cancel":Z
    if-eqz v0, :cond_1f

    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$6;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    iget-object v1, v1, Lcom/squareup/okhttp/internal/framed/FramedConnection;->frameWriter:Lcom/squareup/okhttp/internal/framed/FrameWriter;

    iget v2, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$6;->val$streamId:I

    sget-object v3, Lcom/squareup/okhttp/internal/framed/ErrorCode;->CANCEL:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    invoke-interface {v1, v2, v3}, Lcom/squareup/okhttp/internal/framed/FrameWriter;->rstStream(ILcom/squareup/okhttp/internal/framed/ErrorCode;)V

    .line 860
    :cond_1f
    if-nez v0, :cond_25

    iget-boolean v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$6;->val$inFinished:Z

    if-eqz v1, :cond_38

    .line 861
    :cond_25
    iget-object v2, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$6;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    monitor-enter v2
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_28} :catch_3c

    .line 862
    :try_start_28
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$6;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->currentPushRequests:Ljava/util/Set;
    invoke-static {v1}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$2600(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Ljava/util/Set;

    move-result-object v1

    iget v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$6;->val$streamId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 863
    monitor-exit v2

    .line 867
    .end local v0    # "cancel":Z
    :cond_38
    :goto_38
    return-void

    .line 863
    .restart local v0    # "cancel":Z
    :catchall_39
    move-exception v1

    monitor-exit v2
    :try_end_3b
    .catchall {:try_start_28 .. :try_end_3b} :catchall_39

    :try_start_3b
    throw v1
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_3b .. :try_end_3c} :catch_3c

    .line 865
    .end local v0    # "cancel":Z
    :catch_3c
    move-exception v1

    goto :goto_38
.end method
