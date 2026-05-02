.class final Lokhttp3/internal/framed/FramedStream$FramedDataSource;
.super Ljava/lang/Object;
.source "FramedStream.java"

# interfaces
.implements Lokio/Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/internal/framed/FramedStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "FramedDataSource"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private closed:Z

.field private finished:Z

.field private final maxByteCount:J

.field private final readBuffer:Lokio/Buffer;

.field private final receiveBuffer:Lokio/Buffer;

.field final synthetic this$0:Lokhttp3/internal/framed/FramedStream;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 313
    const-class v0, Lokhttp3/internal/framed/FramedStream;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private constructor <init>(Lokhttp3/internal/framed/FramedStream;J)V
    .registers 5
    .param p2, "maxByteCount"    # J

    .prologue
    .line 332
    iput-object p1, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 315
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    iput-object v0, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->receiveBuffer:Lokio/Buffer;

    .line 318
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    iput-object v0, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->readBuffer:Lokio/Buffer;

    .line 333
    iput-wide p2, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->maxByteCount:J

    .line 334
    return-void
.end method

.method synthetic constructor <init>(Lokhttp3/internal/framed/FramedStream;JLokhttp3/internal/framed/FramedStream$1;)V
    .registers 5
    .param p1, "x0"    # Lokhttp3/internal/framed/FramedStream;
    .param p2, "x1"    # J
    .param p4, "x2"    # Lokhttp3/internal/framed/FramedStream$1;

    .prologue
    .line 313
    invoke-direct {p0, p1, p2, p3}, Lokhttp3/internal/framed/FramedStream$FramedDataSource;-><init>(Lokhttp3/internal/framed/FramedStream;J)V

    return-void
.end method

.method static synthetic access$100(Lokhttp3/internal/framed/FramedStream$FramedDataSource;)Z
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/framed/FramedStream$FramedDataSource;

    .prologue
    .line 313
    iget-boolean v0, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->finished:Z

    return v0
.end method

.method static synthetic access$102(Lokhttp3/internal/framed/FramedStream$FramedDataSource;Z)Z
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/framed/FramedStream$FramedDataSource;
    .param p1, "x1"    # Z

    .prologue
    .line 313
    iput-boolean p1, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->finished:Z

    return p1
.end method

.method static synthetic access$300(Lokhttp3/internal/framed/FramedStream$FramedDataSource;)Z
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/framed/FramedStream$FramedDataSource;

    .prologue
    .line 313
    iget-boolean v0, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->closed:Z

    return v0
.end method

.method private checkNotClosed()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 437
    iget-boolean v0, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->closed:Z

    if-eqz v0, :cond_c

    .line 438
    new-instance v0, Ljava/io/IOException;

    const-string v1, "stream closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 440
    :cond_c
    iget-object v0, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    # getter for: Lokhttp3/internal/framed/FramedStream;->errorCode:Lokhttp3/internal/framed/ErrorCode;
    invoke-static {v0}, Lokhttp3/internal/framed/FramedStream;->access$800(Lokhttp3/internal/framed/FramedStream;)Lokhttp3/internal/framed/ErrorCode;

    move-result-object v0

    if-eqz v0, :cond_33

    .line 441
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "stream was reset: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    # getter for: Lokhttp3/internal/framed/FramedStream;->errorCode:Lokhttp3/internal/framed/ErrorCode;
    invoke-static {v2}, Lokhttp3/internal/framed/FramedStream;->access$800(Lokhttp3/internal/framed/FramedStream;)Lokhttp3/internal/framed/ErrorCode;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 443
    :cond_33
    return-void
.end method

.method private waitUntilReadable()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 373
    iget-object v0, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    # getter for: Lokhttp3/internal/framed/FramedStream;->readTimeout:Lokhttp3/internal/framed/FramedStream$StreamTimeout;
    invoke-static {v0}, Lokhttp3/internal/framed/FramedStream;->access$700(Lokhttp3/internal/framed/FramedStream;)Lokhttp3/internal/framed/FramedStream$StreamTimeout;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/internal/framed/FramedStream$StreamTimeout;->enter()V

    .line 375
    :goto_9
    :try_start_9
    iget-object v0, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->readBuffer:Lokio/Buffer;

    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_36

    iget-boolean v0, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->finished:Z

    if-nez v0, :cond_36

    iget-boolean v0, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->closed:Z

    if-nez v0, :cond_36

    iget-object v0, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    # getter for: Lokhttp3/internal/framed/FramedStream;->errorCode:Lokhttp3/internal/framed/ErrorCode;
    invoke-static {v0}, Lokhttp3/internal/framed/FramedStream;->access$800(Lokhttp3/internal/framed/FramedStream;)Lokhttp3/internal/framed/ErrorCode;

    move-result-object v0

    if-nez v0, :cond_36

    .line 376
    iget-object v0, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    # invokes: Lokhttp3/internal/framed/FramedStream;->waitForIo()V
    invoke-static {v0}, Lokhttp3/internal/framed/FramedStream;->access$900(Lokhttp3/internal/framed/FramedStream;)V
    :try_end_2a
    .catchall {:try_start_9 .. :try_end_2a} :catchall_2b

    goto :goto_9

    .line 379
    :catchall_2b
    move-exception v0

    iget-object v1, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    # getter for: Lokhttp3/internal/framed/FramedStream;->readTimeout:Lokhttp3/internal/framed/FramedStream$StreamTimeout;
    invoke-static {v1}, Lokhttp3/internal/framed/FramedStream;->access$700(Lokhttp3/internal/framed/FramedStream;)Lokhttp3/internal/framed/FramedStream$StreamTimeout;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/internal/framed/FramedStream$StreamTimeout;->exitAndThrowIfTimedOut()V

    throw v0

    :cond_36
    iget-object v0, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    # getter for: Lokhttp3/internal/framed/FramedStream;->readTimeout:Lokhttp3/internal/framed/FramedStream$StreamTimeout;
    invoke-static {v0}, Lokhttp3/internal/framed/FramedStream;->access$700(Lokhttp3/internal/framed/FramedStream;)Lokhttp3/internal/framed/FramedStream$StreamTimeout;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/internal/framed/FramedStream$StreamTimeout;->exitAndThrowIfTimedOut()V

    .line 381
    return-void
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 428
    iget-object v1, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    monitor-enter v1

    .line 429
    const/4 v0, 0x1

    :try_start_4
    iput-boolean v0, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->closed:Z

    .line 430
    iget-object v0, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->readBuffer:Lokio/Buffer;

    invoke-virtual {v0}, Lokio/Buffer;->clear()V

    .line 431
    iget-object v0, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 432
    monitor-exit v1
    :try_end_11
    .catchall {:try_start_4 .. :try_end_11} :catchall_17

    .line 433
    iget-object v0, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    # invokes: Lokhttp3/internal/framed/FramedStream;->cancelStreamIfNecessary()V
    invoke-static {v0}, Lokhttp3/internal/framed/FramedStream;->access$1000(Lokhttp3/internal/framed/FramedStream;)V

    .line 434
    return-void

    .line 432
    :catchall_17
    move-exception v0

    :try_start_18
    monitor-exit v1
    :try_end_19
    .catchall {:try_start_18 .. :try_end_19} :catchall_17

    throw v0
.end method

.method public read(Lokio/Buffer;J)J
    .registers 12
    .param p1, "sink"    # Lokio/Buffer;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x0

    .line 338
    cmp-long v2, p2, v6

    if-gez v2, :cond_1f

    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "byteCount < 0: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 341
    :cond_1f
    iget-object v3, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    monitor-enter v3

    .line 342
    :try_start_22
    invoke-direct {p0}, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->waitUntilReadable()V

    .line 343
    invoke-direct {p0}, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->checkNotClosed()V

    .line 344
    iget-object v2, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->readBuffer:Lokio/Buffer;

    invoke-virtual {v2}, Lokio/Buffer;->size()J

    move-result-wide v4

    cmp-long v2, v4, v6

    if-nez v2, :cond_36

    const-wide/16 v0, -0x1

    monitor-exit v3

    .line 368
    :goto_35
    return-wide v0

    .line 347
    :cond_36
    iget-object v2, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->readBuffer:Lokio/Buffer;

    iget-object v4, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->readBuffer:Lokio/Buffer;

    invoke-virtual {v4}, Lokio/Buffer;->size()J

    move-result-wide v4

    invoke-static {p2, p3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    invoke-virtual {v2, p1, v4, v5}, Lokio/Buffer;->read(Lokio/Buffer;J)J

    move-result-wide v0

    .line 350
    .local v0, "read":J
    iget-object v2, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    iget-wide v4, v2, Lokhttp3/internal/framed/FramedStream;->unacknowledgedBytesRead:J

    add-long/2addr v4, v0

    iput-wide v4, v2, Lokhttp3/internal/framed/FramedStream;->unacknowledgedBytesRead:J

    .line 351
    iget-object v2, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    iget-wide v4, v2, Lokhttp3/internal/framed/FramedStream;->unacknowledgedBytesRead:J

    iget-object v2, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    .line 352
    # getter for: Lokhttp3/internal/framed/FramedStream;->connection:Lokhttp3/internal/framed/FramedConnection;
    invoke-static {v2}, Lokhttp3/internal/framed/FramedStream;->access$500(Lokhttp3/internal/framed/FramedStream;)Lokhttp3/internal/framed/FramedConnection;

    move-result-object v2

    iget-object v2, v2, Lokhttp3/internal/framed/FramedConnection;->okHttpSettings:Lokhttp3/internal/framed/Settings;

    const/high16 v6, 0x10000

    invoke-virtual {v2, v6}, Lokhttp3/internal/framed/Settings;->getInitialWindowSize(I)I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-long v6, v2

    cmp-long v2, v4, v6

    if-ltz v2, :cond_7f

    .line 353
    iget-object v2, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    # getter for: Lokhttp3/internal/framed/FramedStream;->connection:Lokhttp3/internal/framed/FramedConnection;
    invoke-static {v2}, Lokhttp3/internal/framed/FramedStream;->access$500(Lokhttp3/internal/framed/FramedStream;)Lokhttp3/internal/framed/FramedConnection;

    move-result-object v2

    iget-object v4, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    # getter for: Lokhttp3/internal/framed/FramedStream;->id:I
    invoke-static {v4}, Lokhttp3/internal/framed/FramedStream;->access$600(Lokhttp3/internal/framed/FramedStream;)I

    move-result v4

    iget-object v5, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    iget-wide v5, v5, Lokhttp3/internal/framed/FramedStream;->unacknowledgedBytesRead:J

    invoke-virtual {v2, v4, v5, v6}, Lokhttp3/internal/framed/FramedConnection;->writeWindowUpdateLater(IJ)V

    .line 354
    iget-object v2, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    const-wide/16 v4, 0x0

    iput-wide v4, v2, Lokhttp3/internal/framed/FramedStream;->unacknowledgedBytesRead:J

    .line 356
    :cond_7f
    monitor-exit v3
    :try_end_80
    .catchall {:try_start_22 .. :try_end_80} :catchall_d1

    .line 359
    iget-object v2, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    # getter for: Lokhttp3/internal/framed/FramedStream;->connection:Lokhttp3/internal/framed/FramedConnection;
    invoke-static {v2}, Lokhttp3/internal/framed/FramedStream;->access$500(Lokhttp3/internal/framed/FramedStream;)Lokhttp3/internal/framed/FramedConnection;

    move-result-object v3

    monitor-enter v3

    .line 360
    :try_start_87
    iget-object v2, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    # getter for: Lokhttp3/internal/framed/FramedStream;->connection:Lokhttp3/internal/framed/FramedConnection;
    invoke-static {v2}, Lokhttp3/internal/framed/FramedStream;->access$500(Lokhttp3/internal/framed/FramedStream;)Lokhttp3/internal/framed/FramedConnection;

    move-result-object v2

    iget-wide v4, v2, Lokhttp3/internal/framed/FramedConnection;->unacknowledgedBytesRead:J

    add-long/2addr v4, v0

    iput-wide v4, v2, Lokhttp3/internal/framed/FramedConnection;->unacknowledgedBytesRead:J

    .line 361
    iget-object v2, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    # getter for: Lokhttp3/internal/framed/FramedStream;->connection:Lokhttp3/internal/framed/FramedConnection;
    invoke-static {v2}, Lokhttp3/internal/framed/FramedStream;->access$500(Lokhttp3/internal/framed/FramedStream;)Lokhttp3/internal/framed/FramedConnection;

    move-result-object v2

    iget-wide v4, v2, Lokhttp3/internal/framed/FramedConnection;->unacknowledgedBytesRead:J

    iget-object v2, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    .line 362
    # getter for: Lokhttp3/internal/framed/FramedStream;->connection:Lokhttp3/internal/framed/FramedConnection;
    invoke-static {v2}, Lokhttp3/internal/framed/FramedStream;->access$500(Lokhttp3/internal/framed/FramedStream;)Lokhttp3/internal/framed/FramedConnection;

    move-result-object v2

    iget-object v2, v2, Lokhttp3/internal/framed/FramedConnection;->okHttpSettings:Lokhttp3/internal/framed/Settings;

    const/high16 v6, 0x10000

    invoke-virtual {v2, v6}, Lokhttp3/internal/framed/Settings;->getInitialWindowSize(I)I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-long v6, v2

    cmp-long v2, v4, v6

    if-ltz v2, :cond_cb

    .line 363
    iget-object v2, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    # getter for: Lokhttp3/internal/framed/FramedStream;->connection:Lokhttp3/internal/framed/FramedConnection;
    invoke-static {v2}, Lokhttp3/internal/framed/FramedStream;->access$500(Lokhttp3/internal/framed/FramedStream;)Lokhttp3/internal/framed/FramedConnection;

    move-result-object v2

    const/4 v4, 0x0

    iget-object v5, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    # getter for: Lokhttp3/internal/framed/FramedStream;->connection:Lokhttp3/internal/framed/FramedConnection;
    invoke-static {v5}, Lokhttp3/internal/framed/FramedStream;->access$500(Lokhttp3/internal/framed/FramedStream;)Lokhttp3/internal/framed/FramedConnection;

    move-result-object v5

    iget-wide v5, v5, Lokhttp3/internal/framed/FramedConnection;->unacknowledgedBytesRead:J

    invoke-virtual {v2, v4, v5, v6}, Lokhttp3/internal/framed/FramedConnection;->writeWindowUpdateLater(IJ)V

    .line 364
    iget-object v2, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    # getter for: Lokhttp3/internal/framed/FramedStream;->connection:Lokhttp3/internal/framed/FramedConnection;
    invoke-static {v2}, Lokhttp3/internal/framed/FramedStream;->access$500(Lokhttp3/internal/framed/FramedStream;)Lokhttp3/internal/framed/FramedConnection;

    move-result-object v2

    const-wide/16 v4, 0x0

    iput-wide v4, v2, Lokhttp3/internal/framed/FramedConnection;->unacknowledgedBytesRead:J

    .line 366
    :cond_cb
    monitor-exit v3

    goto/16 :goto_35

    :catchall_ce
    move-exception v2

    monitor-exit v3
    :try_end_d0
    .catchall {:try_start_87 .. :try_end_d0} :catchall_ce

    throw v2

    .line 356
    .end local v0    # "read":J
    :catchall_d1
    move-exception v2

    :try_start_d2
    monitor-exit v3
    :try_end_d3
    .catchall {:try_start_d2 .. :try_end_d3} :catchall_d1

    throw v2
.end method

.method receive(Lokio/BufferedSource;J)V
    .registers 15
    .param p1, "in"    # Lokio/BufferedSource;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 384
    sget-boolean v5, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->$assertionsDisabled:Z

    if-nez v5, :cond_32

    iget-object v5, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    invoke-static {v5}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_32

    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 410
    .local v0, "finished":Z
    .local v1, "flowControlError":Z
    .local v2, "read":J
    :cond_12
    sub-long/2addr p2, v2

    .line 413
    iget-object v6, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    monitor-enter v6

    .line 414
    :try_start_16
    iget-object v5, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->readBuffer:Lokio/Buffer;

    invoke-virtual {v5}, Lokio/Buffer;->size()J

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v5, v7, v9

    if-nez v5, :cond_76

    const/4 v4, 0x1

    .line 415
    .local v4, "wasEmpty":Z
    :goto_23
    iget-object v5, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->readBuffer:Lokio/Buffer;

    iget-object v7, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->receiveBuffer:Lokio/Buffer;

    invoke-virtual {v5, v7}, Lokio/Buffer;->writeAll(Lokio/Source;)J

    .line 416
    if-eqz v4, :cond_31

    .line 417
    iget-object v5, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    invoke-virtual {v5}, Ljava/lang/Object;->notifyAll()V

    .line 419
    :cond_31
    monitor-exit v6
    :try_end_32
    .catchall {:try_start_16 .. :try_end_32} :catchall_78

    .line 386
    .end local v0    # "finished":Z
    .end local v1    # "flowControlError":Z
    .end local v2    # "read":J
    .end local v4    # "wasEmpty":Z
    :cond_32
    const-wide/16 v5, 0x0

    cmp-long v5, p2, v5

    if-lez v5, :cond_58

    .line 389
    iget-object v6, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    monitor-enter v6

    .line 390
    :try_start_3b
    iget-boolean v0, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->finished:Z

    .line 391
    .restart local v0    # "finished":Z
    iget-object v5, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->readBuffer:Lokio/Buffer;

    invoke-virtual {v5}, Lokio/Buffer;->size()J

    move-result-wide v7

    add-long/2addr v7, p2

    iget-wide v9, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->maxByteCount:J

    cmp-long v5, v7, v9

    if-lez v5, :cond_59

    const/4 v1, 0x1

    .line 392
    .restart local v1    # "flowControlError":Z
    :goto_4b
    monitor-exit v6
    :try_end_4c
    .catchall {:try_start_3b .. :try_end_4c} :catchall_5b

    .line 395
    if-eqz v1, :cond_5e

    .line 396
    invoke-interface {p1, p2, p3}, Lokio/BufferedSource;->skip(J)V

    .line 397
    iget-object v5, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    sget-object v6, Lokhttp3/internal/framed/ErrorCode;->FLOW_CONTROL_ERROR:Lokhttp3/internal/framed/ErrorCode;

    invoke-virtual {v5, v6}, Lokhttp3/internal/framed/FramedStream;->closeLater(Lokhttp3/internal/framed/ErrorCode;)V

    .line 421
    .end local v0    # "finished":Z
    .end local v1    # "flowControlError":Z
    :cond_58
    :goto_58
    return-void

    .line 391
    .restart local v0    # "finished":Z
    :cond_59
    const/4 v1, 0x0

    goto :goto_4b

    .line 392
    .end local v0    # "finished":Z
    :catchall_5b
    move-exception v5

    :try_start_5c
    monitor-exit v6
    :try_end_5d
    .catchall {:try_start_5c .. :try_end_5d} :catchall_5b

    throw v5

    .line 402
    .restart local v0    # "finished":Z
    .restart local v1    # "flowControlError":Z
    :cond_5e
    if-eqz v0, :cond_64

    .line 403
    invoke-interface {p1, p2, p3}, Lokio/BufferedSource;->skip(J)V

    goto :goto_58

    .line 408
    :cond_64
    iget-object v5, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->receiveBuffer:Lokio/Buffer;

    invoke-interface {p1, v5, p2, p3}, Lokio/BufferedSource;->read(Lokio/Buffer;J)J

    move-result-wide v2

    .line 409
    .restart local v2    # "read":J
    const-wide/16 v5, -0x1

    cmp-long v5, v2, v5

    if-nez v5, :cond_12

    new-instance v5, Ljava/io/EOFException;

    invoke-direct {v5}, Ljava/io/EOFException;-><init>()V

    throw v5

    .line 414
    :cond_76
    const/4 v4, 0x0

    goto :goto_23

    .line 419
    :catchall_78
    move-exception v5

    :try_start_79
    monitor-exit v6
    :try_end_7a
    .catchall {:try_start_79 .. :try_end_7a} :catchall_78

    throw v5
.end method

.method public timeout()Lokio/Timeout;
    .registers 2

    .prologue
    .line 424
    iget-object v0, p0, Lokhttp3/internal/framed/FramedStream$FramedDataSource;->this$0:Lokhttp3/internal/framed/FramedStream;

    # getter for: Lokhttp3/internal/framed/FramedStream;->readTimeout:Lokhttp3/internal/framed/FramedStream$StreamTimeout;
    invoke-static {v0}, Lokhttp3/internal/framed/FramedStream;->access$700(Lokhttp3/internal/framed/FramedStream;)Lokhttp3/internal/framed/FramedStream$StreamTimeout;

    move-result-object v0

    return-object v0
.end method
