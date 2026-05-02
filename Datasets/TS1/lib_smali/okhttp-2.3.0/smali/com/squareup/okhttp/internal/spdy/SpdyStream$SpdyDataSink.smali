.class final Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;
.super Ljava/lang/Object;
.source "SpdyStream.java"

# interfaces
.implements Lokio/Sink;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/spdy/SpdyStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "SpdyDataSink"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final EMIT_BUFFER_SIZE:J = 0x4000L


# instance fields
.field private closed:Z

.field private finished:Z

.field private final sendBuffer:Lokio/Buffer;

.field final synthetic this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 469
    const-class v0, Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)V
    .registers 3
    .param p1, "this$0"    # Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    .prologue
    .line 469
    iput-object p1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 476
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->sendBuffer:Lokio/Buffer;

    return-void
.end method

.method static synthetic access$200(Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;)Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;

    .prologue
    .line 469
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->finished:Z

    return v0
.end method

.method static synthetic access$202(Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;
    .param p1, "x1"    # Z

    .prologue
    .line 469
    iput-boolean p1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->finished:Z

    return p1
.end method

.method static synthetic access$400(Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;)Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;

    .prologue
    .line 469
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->closed:Z

    return v0
.end method

.method private emitDataFrame(Z)V
    .registers 10
    .param p1, "outFinished"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 500
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    monitor-enter v1

    .line 501
    :try_start_3
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->writeTimeout:Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$1100(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;->enter()V
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_37

    .line 503
    :goto_c
    :try_start_c
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    iget-wide v2, v0, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->bytesLeftInWriteWindow:J

    const-wide/16 v6, 0x0

    cmp-long v0, v2, v6

    if-gtz v0, :cond_3a

    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->finished:Z

    if-nez v0, :cond_3a

    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->closed:Z

    if-nez v0, :cond_3a

    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->errorCode:Lcom/squareup/okhttp/internal/spdy/ErrorCode;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$800(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/ErrorCode;

    move-result-object v0

    if-nez v0, :cond_3a

    .line 504
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # invokes: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->waitForIo()V
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$900(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)V
    :try_end_2b
    .catchall {:try_start_c .. :try_end_2b} :catchall_2c

    goto :goto_c

    .line 507
    :catchall_2c
    move-exception v0

    :try_start_2d
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->writeTimeout:Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$1100(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;

    move-result-object v2

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;->exitAndThrowIfTimedOut()V

    throw v0

    .line 513
    :catchall_37
    move-exception v0

    monitor-exit v1
    :try_end_39
    .catchall {:try_start_2d .. :try_end_39} :catchall_37

    throw v0

    .line 507
    :cond_3a
    :try_start_3a
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->writeTimeout:Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$1100(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;->exitAndThrowIfTimedOut()V

    .line 510
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # invokes: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->checkOutNotClosed()V
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$1200(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)V

    .line 511
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    iget-wide v2, v0, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->bytesLeftInWriteWindow:J

    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->sendBuffer:Lokio/Buffer;

    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v6

    invoke-static {v2, v3, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    .line 512
    .local v4, "toWrite":J
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    iget-wide v2, v0, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->bytesLeftInWriteWindow:J

    sub-long/2addr v2, v4

    iput-wide v2, v0, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->bytesLeftInWriteWindow:J

    .line 513
    monitor-exit v1
    :try_end_5e
    .catchall {:try_start_3a .. :try_end_5e} :catchall_37

    .line 515
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->connection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$500(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    move-result-object v0

    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->id:I
    invoke-static {v1}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$600(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)I

    move-result v1

    if-eqz p1, :cond_7d

    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->sendBuffer:Lokio/Buffer;

    invoke-virtual {v2}, Lokio/Buffer;->size()J

    move-result-wide v2

    cmp-long v2, v4, v2

    if-nez v2, :cond_7d

    const/4 v2, 0x1

    :goto_77
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->sendBuffer:Lokio/Buffer;

    invoke-virtual/range {v0 .. v5}, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->writeData(IZLokio/Buffer;J)V

    .line 516
    return-void

    .line 515
    :cond_7d
    const/4 v2, 0x0

    goto :goto_77
.end method


# virtual methods
.method public close()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v4, 0x0

    const/4 v2, 0x1

    .line 534
    sget-boolean v0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->$assertionsDisabled:Z

    if-nez v0, :cond_15

    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 535
    :cond_15
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    monitor-enter v1

    .line 536
    :try_start_18
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->closed:Z

    if-eqz v0, :cond_1e

    monitor-exit v1

    .line 554
    :goto_1d
    return-void

    .line 537
    :cond_1e
    monitor-exit v1
    :try_end_1f
    .catchall {:try_start_18 .. :try_end_1f} :catchall_3f

    .line 538
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    iget-object v0, v0, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->sink:Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;

    iget-boolean v0, v0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->finished:Z

    if-nez v0, :cond_52

    .line 540
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->sendBuffer:Lokio/Buffer;

    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v0

    cmp-long v0, v0, v4

    if-lez v0, :cond_42

    .line 541
    :goto_31
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->sendBuffer:Lokio/Buffer;

    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v0

    cmp-long v0, v0, v4

    if-lez v0, :cond_52

    .line 542
    invoke-direct {p0, v2}, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->emitDataFrame(Z)V

    goto :goto_31

    .line 537
    :catchall_3f
    move-exception v0

    :try_start_40
    monitor-exit v1
    :try_end_41
    .catchall {:try_start_40 .. :try_end_41} :catchall_3f

    throw v0

    .line 546
    :cond_42
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->connection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$500(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    move-result-object v0

    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->id:I
    invoke-static {v1}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$600(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)I

    move-result v1

    const/4 v3, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->writeData(IZLokio/Buffer;J)V

    .line 549
    :cond_52
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    monitor-enter v1

    .line 550
    const/4 v0, 0x1

    :try_start_56
    iput-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->closed:Z

    .line 551
    monitor-exit v1
    :try_end_59
    .catchall {:try_start_56 .. :try_end_59} :catchall_68

    .line 552
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->connection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$500(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->flush()V

    .line 553
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # invokes: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->cancelStreamIfNecessary()V
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$1000(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)V

    goto :goto_1d

    .line 551
    :catchall_68
    move-exception v0

    :try_start_69
    monitor-exit v1
    :try_end_6a
    .catchall {:try_start_69 .. :try_end_6a} :catchall_68

    throw v0
.end method

.method public flush()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 519
    sget-boolean v0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->$assertionsDisabled:Z

    if-nez v0, :cond_12

    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 520
    :cond_12
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    monitor-enter v1

    .line 521
    :try_start_15
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # invokes: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->checkOutNotClosed()V
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$1200(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)V

    .line 522
    monitor-exit v1
    :try_end_1b
    .catchall {:try_start_15 .. :try_end_1b} :catchall_2c

    .line 523
    :goto_1b
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->sendBuffer:Lokio/Buffer;

    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_2f

    .line 524
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->emitDataFrame(Z)V

    goto :goto_1b

    .line 522
    :catchall_2c
    move-exception v0

    :try_start_2d
    monitor-exit v1
    :try_end_2e
    .catchall {:try_start_2d .. :try_end_2e} :catchall_2c

    throw v0

    .line 526
    :cond_2f
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->connection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$500(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->flush()V

    .line 527
    return-void
.end method

.method public timeout()Lokio/Timeout;
    .registers 2

    .prologue
    .line 530
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->writeTimeout:Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$1100(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;

    move-result-object v0

    return-object v0
.end method

.method public write(Lokio/Buffer;J)V
    .registers 8
    .param p1, "source"    # Lokio/Buffer;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 487
    sget-boolean v0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->$assertionsDisabled:Z

    if-nez v0, :cond_12

    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 488
    :cond_12
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->sendBuffer:Lokio/Buffer;

    invoke-virtual {v0, p1, p2, p3}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    .line 489
    :goto_17
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->sendBuffer:Lokio/Buffer;

    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x4000

    cmp-long v0, v0, v2

    if-ltz v0, :cond_28

    .line 490
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink;->emitDataFrame(Z)V

    goto :goto_17

    .line 492
    :cond_28
    return-void
.end method
