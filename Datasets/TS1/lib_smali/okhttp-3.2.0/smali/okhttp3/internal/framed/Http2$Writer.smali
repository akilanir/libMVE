.class final Lokhttp3/internal/framed/Http2$Writer;
.super Ljava/lang/Object;
.source "Http2.java"

# interfaces
.implements Lokhttp3/internal/framed/FrameWriter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/internal/framed/Http2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Writer"
.end annotation


# instance fields
.field private final client:Z

.field private closed:Z

.field private final hpackBuffer:Lokio/Buffer;

.field private final hpackWriter:Lokhttp3/internal/framed/Hpack$Writer;

.field private maxFrameSize:I

.field private final sink:Lokio/BufferedSink;


# direct methods
.method constructor <init>(Lokio/BufferedSink;Z)V
    .registers 5
    .param p1, "sink"    # Lokio/BufferedSink;
    .param p2, "client"    # Z

    .prologue
    .line 369
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 370
    iput-object p1, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    .line 371
    iput-boolean p2, p0, Lokhttp3/internal/framed/Http2$Writer;->client:Z

    .line 372
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    iput-object v0, p0, Lokhttp3/internal/framed/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    .line 373
    new-instance v0, Lokhttp3/internal/framed/Hpack$Writer;

    iget-object v1, p0, Lokhttp3/internal/framed/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    invoke-direct {v0, v1}, Lokhttp3/internal/framed/Hpack$Writer;-><init>(Lokio/Buffer;)V

    iput-object v0, p0, Lokhttp3/internal/framed/Http2$Writer;->hpackWriter:Lokhttp3/internal/framed/Hpack$Writer;

    .line 374
    const/16 v0, 0x4000

    iput v0, p0, Lokhttp3/internal/framed/Http2$Writer;->maxFrameSize:I

    .line 375
    return-void
.end method

.method private writeContinuationFrames(IJ)V
    .registers 11
    .param p1, "streamId"    # I
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v5, 0x0

    .line 455
    :goto_2
    cmp-long v1, p2, v5

    if-lez v1, :cond_25

    .line 456
    iget v1, p0, Lokhttp3/internal/framed/Http2$Writer;->maxFrameSize:I

    int-to-long v1, v1

    invoke-static {v1, v2, p2, p3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-int v0, v1

    .line 457
    .local v0, "length":I
    int-to-long v1, v0

    sub-long/2addr p2, v1

    .line 458
    const/16 v2, 0x9

    cmp-long v1, p2, v5

    if-nez v1, :cond_23

    const/4 v1, 0x4

    :goto_17
    invoke-virtual {p0, p1, v0, v2, v1}, Lokhttp3/internal/framed/Http2$Writer;->frameHeader(IIBB)V

    .line 459
    iget-object v1, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    iget-object v2, p0, Lokhttp3/internal/framed/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    int-to-long v3, v0

    invoke-interface {v1, v2, v3, v4}, Lokio/BufferedSink;->write(Lokio/Buffer;J)V

    goto :goto_2

    .line 458
    :cond_23
    const/4 v1, 0x0

    goto :goto_17

    .line 461
    .end local v0    # "length":I
    :cond_25
    return-void
.end method


# virtual methods
.method public declared-synchronized ackSettings(Lokhttp3/internal/framed/Settings;)V
    .registers 8
    .param p1, "peerSettings"    # Lokhttp3/internal/framed/Settings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 383
    monitor-enter p0

    :try_start_1
    iget-boolean v4, p0, Lokhttp3/internal/framed/Http2$Writer;->closed:Z

    if-eqz v4, :cond_10

    new-instance v4, Ljava/io/IOException;

    const-string v5, "closed"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    :catchall_d
    move-exception v4

    monitor-exit p0

    throw v4

    .line 384
    :cond_10
    :try_start_10
    iget v4, p0, Lokhttp3/internal/framed/Http2$Writer;->maxFrameSize:I

    invoke-virtual {p1, v4}, Lokhttp3/internal/framed/Settings;->getMaxFrameSize(I)I

    move-result v4

    iput v4, p0, Lokhttp3/internal/framed/Http2$Writer;->maxFrameSize:I

    .line 385
    const/4 v1, 0x0

    .line 386
    .local v1, "length":I
    const/4 v3, 0x4

    .line 387
    .local v3, "type":B
    const/4 v0, 0x1

    .line 388
    .local v0, "flags":B
    const/4 v2, 0x0

    .line 389
    .local v2, "streamId":I
    invoke-virtual {p0, v2, v1, v3, v0}, Lokhttp3/internal/framed/Http2$Writer;->frameHeader(IIBB)V

    .line 390
    iget-object v4, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v4}, Lokio/BufferedSink;->flush()V
    :try_end_24
    .catchall {:try_start_10 .. :try_end_24} :catchall_d

    .line 391
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 563
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lokhttp3/internal/framed/Http2$Writer;->closed:Z

    .line 564
    iget-object v0, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v0}, Lokio/BufferedSink;->close()V
    :try_end_9
    .catchall {:try_start_2 .. :try_end_9} :catchall_b

    .line 565
    monitor-exit p0

    return-void

    .line 563
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized connectionPreface()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 394
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lokhttp3/internal/framed/Http2$Writer;->closed:Z

    if-eqz v0, :cond_10

    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0

    .line 395
    :cond_10
    :try_start_10
    iget-boolean v0, p0, Lokhttp3/internal/framed/Http2$Writer;->client:Z
    :try_end_12
    .catchall {:try_start_10 .. :try_end_12} :catchall_d

    if-nez v0, :cond_16

    .line 401
    :goto_14
    monitor-exit p0

    return-void

    .line 396
    :cond_16
    :try_start_16
    # getter for: Lokhttp3/internal/framed/Http2;->logger:Ljava/util/logging/Logger;
    invoke-static {}, Lokhttp3/internal/framed/Http2;->access$100()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 397
    # getter for: Lokhttp3/internal/framed/Http2;->logger:Ljava/util/logging/Logger;
    invoke-static {}, Lokhttp3/internal/framed/Http2;->access$100()Ljava/util/logging/Logger;

    move-result-object v0

    const-string v1, ">> CONNECTION %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    # getter for: Lokhttp3/internal/framed/Http2;->CONNECTION_PREFACE:Lokio/ByteString;
    invoke-static {}, Lokhttp3/internal/framed/Http2;->access$000()Lokio/ByteString;

    move-result-object v4

    invoke-virtual {v4}, Lokio/ByteString;->hex()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 399
    :cond_3d
    iget-object v0, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    # getter for: Lokhttp3/internal/framed/Http2;->CONNECTION_PREFACE:Lokio/ByteString;
    invoke-static {}, Lokhttp3/internal/framed/Http2;->access$000()Lokio/ByteString;

    move-result-object v1

    invoke-virtual {v1}, Lokio/ByteString;->toByteArray()[B

    move-result-object v1

    invoke-interface {v0, v1}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 400
    iget-object v0, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v0}, Lokio/BufferedSink;->flush()V
    :try_end_4f
    .catchall {:try_start_16 .. :try_end_4f} :catchall_d

    goto :goto_14
.end method

.method public declared-synchronized data(ZILokio/Buffer;I)V
    .registers 8
    .param p1, "outFinished"    # Z
    .param p2, "streamId"    # I
    .param p3, "source"    # Lokio/Buffer;
    .param p4, "byteCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 482
    monitor-enter p0

    :try_start_1
    iget-boolean v1, p0, Lokhttp3/internal/framed/Http2$Writer;->closed:Z

    if-eqz v1, :cond_10

    new-instance v1, Ljava/io/IOException;

    const-string v2, "closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    :catchall_d
    move-exception v1

    monitor-exit p0

    throw v1

    .line 483
    :cond_10
    const/4 v0, 0x0

    .line 484
    .local v0, "flags":B
    if-eqz p1, :cond_15

    const/4 v1, 0x1

    int-to-byte v0, v1

    .line 485
    :cond_15
    :try_start_15
    invoke-virtual {p0, p2, v0, p3, p4}, Lokhttp3/internal/framed/Http2$Writer;->dataFrame(IBLokio/Buffer;I)V
    :try_end_18
    .catchall {:try_start_15 .. :try_end_18} :catchall_d

    .line 486
    monitor-exit p0

    return-void
.end method

.method dataFrame(IBLokio/Buffer;I)V
    .registers 9
    .param p1, "streamId"    # I
    .param p2, "flags"    # B
    .param p3, "buffer"    # Lokio/Buffer;
    .param p4, "byteCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 489
    const/4 v0, 0x0

    .line 490
    .local v0, "type":B
    invoke-virtual {p0, p1, p4, v0, p2}, Lokhttp3/internal/framed/Http2$Writer;->frameHeader(IIBB)V

    .line 491
    if-lez p4, :cond_c

    .line 492
    iget-object v1, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    int-to-long v2, p4

    invoke-interface {v1, p3, v2, v3}, Lokio/BufferedSink;->write(Lokio/Buffer;J)V

    .line 494
    :cond_c
    return-void
.end method

.method public declared-synchronized flush()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 378
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lokhttp3/internal/framed/Http2$Writer;->closed:Z

    if-eqz v0, :cond_10

    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0

    .line 379
    :cond_10
    :try_start_10
    iget-object v0, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v0}, Lokio/BufferedSink;->flush()V
    :try_end_15
    .catchall {:try_start_10 .. :try_end_15} :catchall_d

    .line 380
    monitor-exit p0

    return-void
.end method

.method frameHeader(IIBB)V
    .registers 10
    .param p1, "streamId"    # I
    .param p2, "length"    # I
    .param p3, "type"    # B
    .param p4, "flags"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 568
    # getter for: Lokhttp3/internal/framed/Http2;->logger:Ljava/util/logging/Logger;
    invoke-static {}, Lokhttp3/internal/framed/Http2;->access$100()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_19

    # getter for: Lokhttp3/internal/framed/Http2;->logger:Ljava/util/logging/Logger;
    invoke-static {}, Lokhttp3/internal/framed/Http2;->access$100()Ljava/util/logging/Logger;

    move-result-object v0

    invoke-static {v3, p1, p2, p3, p4}, Lokhttp3/internal/framed/Http2$FrameLogger;->formatHeader(ZIIBB)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 569
    :cond_19
    iget v0, p0, Lokhttp3/internal/framed/Http2$Writer;->maxFrameSize:I

    if-le p2, v0, :cond_35

    .line 570
    const-string v0, "FRAME_SIZE_ERROR length > %d: %d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p0, Lokhttp3/internal/framed/Http2$Writer;->maxFrameSize:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    # invokes: Lokhttp3/internal/framed/Http2;->illegalArgument(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;
    invoke-static {v0, v1}, Lokhttp3/internal/framed/Http2;->access$500(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    .line 572
    :cond_35
    const/high16 v0, -0x80000000

    and-int/2addr v0, p1

    if-eqz v0, :cond_49

    const-string v0, "reserved bit set: %s"

    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    # invokes: Lokhttp3/internal/framed/Http2;->illegalArgument(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;
    invoke-static {v0, v1}, Lokhttp3/internal/framed/Http2;->access$500(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    .line 573
    :cond_49
    iget-object v0, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    # invokes: Lokhttp3/internal/framed/Http2;->writeMedium(Lokio/BufferedSink;I)V
    invoke-static {v0, p2}, Lokhttp3/internal/framed/Http2;->access$600(Lokio/BufferedSink;I)V

    .line 574
    iget-object v0, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    and-int/lit16 v1, p3, 0xff

    invoke-interface {v0, v1}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 575
    iget-object v0, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    and-int/lit16 v1, p4, 0xff

    invoke-interface {v0, v1}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 576
    iget-object v0, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    const v1, 0x7fffffff

    and-int/2addr v1, p1

    invoke-interface {v0, v1}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 577
    return-void
.end method

.method public declared-synchronized goAway(ILokhttp3/internal/framed/ErrorCode;[B)V
    .registers 10
    .param p1, "lastGoodStreamId"    # I
    .param p2, "errorCode"    # Lokhttp3/internal/framed/ErrorCode;
    .param p3, "debugData"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 532
    monitor-enter p0

    :try_start_1
    iget-boolean v4, p0, Lokhttp3/internal/framed/Http2$Writer;->closed:Z

    if-eqz v4, :cond_10

    new-instance v4, Ljava/io/IOException;

    const-string v5, "closed"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    :catchall_d
    move-exception v4

    monitor-exit p0

    throw v4

    .line 533
    :cond_10
    :try_start_10
    iget v4, p2, Lokhttp3/internal/framed/ErrorCode;->httpCode:I

    const/4 v5, -0x1

    if-ne v4, v5, :cond_1f

    const-string v4, "errorCode.httpCode == -1"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    # invokes: Lokhttp3/internal/framed/Http2;->illegalArgument(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;
    invoke-static {v4, v5}, Lokhttp3/internal/framed/Http2;->access$500(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;

    move-result-object v4

    throw v4

    .line 534
    :cond_1f
    array-length v4, p3

    add-int/lit8 v1, v4, 0x8

    .line 535
    .local v1, "length":I
    const/4 v3, 0x7

    .line 536
    .local v3, "type":B
    const/4 v0, 0x0

    .line 537
    .local v0, "flags":B
    const/4 v2, 0x0

    .line 538
    .local v2, "streamId":I
    invoke-virtual {p0, v2, v1, v3, v0}, Lokhttp3/internal/framed/Http2$Writer;->frameHeader(IIBB)V

    .line 539
    iget-object v4, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v4, p1}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 540
    iget-object v4, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    iget v5, p2, Lokhttp3/internal/framed/ErrorCode;->httpCode:I

    invoke-interface {v4, v5}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 541
    array-length v4, p3

    if-lez v4, :cond_3c

    .line 542
    iget-object v4, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v4, p3}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 544
    :cond_3c
    iget-object v4, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v4}, Lokio/BufferedSink;->flush()V
    :try_end_41
    .catchall {:try_start_10 .. :try_end_41} :catchall_d

    .line 545
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized headers(ILjava/util/List;)V
    .registers 5
    .param p1, "streamId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Lokhttp3/internal/framed/Header;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 419
    .local p2, "headerBlock":Ljava/util/List;, "Ljava/util/List<Lokhttp3/internal/framed/Header;>;"
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lokhttp3/internal/framed/Http2$Writer;->closed:Z

    if-eqz v0, :cond_10

    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0

    .line 420
    :cond_10
    const/4 v0, 0x0

    :try_start_11
    invoke-virtual {p0, v0, p1, p2}, Lokhttp3/internal/framed/Http2$Writer;->headers(ZILjava/util/List;)V
    :try_end_14
    .catchall {:try_start_11 .. :try_end_14} :catchall_d

    .line 421
    monitor-exit p0

    return-void
.end method

.method headers(ZILjava/util/List;)V
    .registers 13
    .param p1, "outFinished"    # Z
    .param p2, "streamId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZI",
            "Ljava/util/List",
            "<",
            "Lokhttp3/internal/framed/Header;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 440
    .local p3, "headerBlock":Ljava/util/List;, "Ljava/util/List<Lokhttp3/internal/framed/Header;>;"
    iget-boolean v5, p0, Lokhttp3/internal/framed/Http2$Writer;->closed:Z

    if-eqz v5, :cond_c

    new-instance v5, Ljava/io/IOException;

    const-string v6, "closed"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 441
    :cond_c
    iget-object v5, p0, Lokhttp3/internal/framed/Http2$Writer;->hpackWriter:Lokhttp3/internal/framed/Hpack$Writer;

    invoke-virtual {v5, p3}, Lokhttp3/internal/framed/Hpack$Writer;->writeHeaders(Ljava/util/List;)V

    .line 443
    iget-object v5, p0, Lokhttp3/internal/framed/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    invoke-virtual {v5}, Lokio/Buffer;->size()J

    move-result-wide v0

    .line 444
    .local v0, "byteCount":J
    iget v5, p0, Lokhttp3/internal/framed/Http2$Writer;->maxFrameSize:I

    int-to-long v5, v5

    invoke-static {v5, v6, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    long-to-int v3, v5

    .line 445
    .local v3, "length":I
    const/4 v4, 0x1

    .line 446
    .local v4, "type":B
    int-to-long v5, v3

    cmp-long v5, v0, v5

    if-nez v5, :cond_42

    const/4 v2, 0x4

    .line 447
    .local v2, "flags":B
    :goto_26
    if-eqz p1, :cond_2b

    or-int/lit8 v5, v2, 0x1

    int-to-byte v2, v5

    .line 448
    :cond_2b
    invoke-virtual {p0, p2, v3, v4, v2}, Lokhttp3/internal/framed/Http2$Writer;->frameHeader(IIBB)V

    .line 449
    iget-object v5, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    iget-object v6, p0, Lokhttp3/internal/framed/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    int-to-long v7, v3

    invoke-interface {v5, v6, v7, v8}, Lokio/BufferedSink;->write(Lokio/Buffer;J)V

    .line 451
    int-to-long v5, v3

    cmp-long v5, v0, v5

    if-lez v5, :cond_41

    int-to-long v5, v3

    sub-long v5, v0, v5

    invoke-direct {p0, p2, v5, v6}, Lokhttp3/internal/framed/Http2$Writer;->writeContinuationFrames(IJ)V

    .line 452
    :cond_41
    return-void

    .line 446
    .end local v2    # "flags":B
    :cond_42
    const/4 v2, 0x0

    goto :goto_26
.end method

.method public maxDataLength()I
    .registers 2

    .prologue
    .line 477
    iget v0, p0, Lokhttp3/internal/framed/Http2$Writer;->maxFrameSize:I

    return v0
.end method

.method public declared-synchronized ping(ZII)V
    .registers 10
    .param p1, "ack"    # Z
    .param p2, "payload1"    # I
    .param p3, "payload2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 519
    monitor-enter p0

    :try_start_1
    iget-boolean v4, p0, Lokhttp3/internal/framed/Http2$Writer;->closed:Z

    if-eqz v4, :cond_10

    new-instance v4, Ljava/io/IOException;

    const-string v5, "closed"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    :catchall_d
    move-exception v4

    monitor-exit p0

    throw v4

    .line 520
    :cond_10
    const/16 v1, 0x8

    .line 521
    .local v1, "length":I
    const/4 v3, 0x6

    .line 522
    .local v3, "type":B
    if-eqz p1, :cond_2b

    const/4 v0, 0x1

    .line 523
    .local v0, "flags":B
    :goto_16
    const/4 v2, 0x0

    .line 524
    .local v2, "streamId":I
    :try_start_17
    invoke-virtual {p0, v2, v1, v3, v0}, Lokhttp3/internal/framed/Http2$Writer;->frameHeader(IIBB)V

    .line 525
    iget-object v4, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v4, p2}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 526
    iget-object v4, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v4, p3}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 527
    iget-object v4, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v4}, Lokio/BufferedSink;->flush()V
    :try_end_29
    .catchall {:try_start_17 .. :try_end_29} :catchall_d

    .line 528
    monitor-exit p0

    return-void

    .line 522
    .end local v0    # "flags":B
    .end local v2    # "streamId":I
    :cond_2b
    const/4 v0, 0x0

    goto :goto_16
.end method

.method public declared-synchronized pushPromise(IILjava/util/List;)V
    .registers 13
    .param p1, "streamId"    # I
    .param p2, "promisedStreamId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List",
            "<",
            "Lokhttp3/internal/framed/Header;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 425
    .local p3, "requestHeaders":Ljava/util/List;, "Ljava/util/List<Lokhttp3/internal/framed/Header;>;"
    monitor-enter p0

    :try_start_1
    iget-boolean v5, p0, Lokhttp3/internal/framed/Http2$Writer;->closed:Z

    if-eqz v5, :cond_10

    new-instance v5, Ljava/io/IOException;

    const-string v6, "closed"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    :catchall_d
    move-exception v5

    monitor-exit p0

    throw v5

    .line 426
    :cond_10
    :try_start_10
    iget-object v5, p0, Lokhttp3/internal/framed/Http2$Writer;->hpackWriter:Lokhttp3/internal/framed/Hpack$Writer;

    invoke-virtual {v5, p3}, Lokhttp3/internal/framed/Hpack$Writer;->writeHeaders(Ljava/util/List;)V

    .line 428
    iget-object v5, p0, Lokhttp3/internal/framed/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    invoke-virtual {v5}, Lokio/Buffer;->size()J

    move-result-wide v0

    .line 429
    .local v0, "byteCount":J
    iget v5, p0, Lokhttp3/internal/framed/Http2$Writer;->maxFrameSize:I

    add-int/lit8 v5, v5, -0x4

    int-to-long v5, v5

    invoke-static {v5, v6, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    long-to-int v3, v5

    .line 430
    .local v3, "length":I
    const/4 v4, 0x5

    .line 431
    .local v4, "type":B
    int-to-long v5, v3

    cmp-long v5, v0, v5

    if-nez v5, :cond_4f

    const/4 v2, 0x4

    .line 432
    .local v2, "flags":B
    :goto_2c
    add-int/lit8 v5, v3, 0x4

    invoke-virtual {p0, p1, v5, v4, v2}, Lokhttp3/internal/framed/Http2$Writer;->frameHeader(IIBB)V

    .line 433
    iget-object v5, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    const v6, 0x7fffffff

    and-int/2addr v6, p2

    invoke-interface {v5, v6}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 434
    iget-object v5, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    iget-object v6, p0, Lokhttp3/internal/framed/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    int-to-long v7, v3

    invoke-interface {v5, v6, v7, v8}, Lokio/BufferedSink;->write(Lokio/Buffer;J)V

    .line 436
    int-to-long v5, v3

    cmp-long v5, v0, v5

    if-lez v5, :cond_4d

    int-to-long v5, v3

    sub-long v5, v0, v5

    invoke-direct {p0, p1, v5, v6}, Lokhttp3/internal/framed/Http2$Writer;->writeContinuationFrames(IJ)V
    :try_end_4d
    .catchall {:try_start_10 .. :try_end_4d} :catchall_d

    .line 437
    :cond_4d
    monitor-exit p0

    return-void

    .line 431
    .end local v2    # "flags":B
    :cond_4f
    const/4 v2, 0x0

    goto :goto_2c
.end method

.method public declared-synchronized rstStream(ILokhttp3/internal/framed/ErrorCode;)V
    .registers 8
    .param p1, "streamId"    # I
    .param p2, "errorCode"    # Lokhttp3/internal/framed/ErrorCode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 465
    monitor-enter p0

    :try_start_1
    iget-boolean v3, p0, Lokhttp3/internal/framed/Http2$Writer;->closed:Z

    if-eqz v3, :cond_10

    new-instance v3, Ljava/io/IOException;

    const-string v4, "closed"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    :catchall_d
    move-exception v3

    monitor-exit p0

    throw v3

    .line 466
    :cond_10
    :try_start_10
    iget v3, p2, Lokhttp3/internal/framed/ErrorCode;->httpCode:I

    const/4 v4, -0x1

    if-ne v3, v4, :cond_1b

    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 468
    :cond_1b
    const/4 v1, 0x4

    .line 469
    .local v1, "length":I
    const/4 v2, 0x3

    .line 470
    .local v2, "type":B
    const/4 v0, 0x0

    .line 471
    .local v0, "flags":B
    invoke-virtual {p0, p1, v1, v2, v0}, Lokhttp3/internal/framed/Http2$Writer;->frameHeader(IIBB)V

    .line 472
    iget-object v3, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    iget v4, p2, Lokhttp3/internal/framed/ErrorCode;->httpCode:I

    invoke-interface {v3, v4}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 473
    iget-object v3, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v3}, Lokio/BufferedSink;->flush()V
    :try_end_2d
    .catchall {:try_start_10 .. :try_end_2d} :catchall_d

    .line 474
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized settings(Lokhttp3/internal/framed/Settings;)V
    .registers 10
    .param p1, "settings"    # Lokhttp3/internal/framed/Settings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 497
    monitor-enter p0

    :try_start_1
    iget-boolean v6, p0, Lokhttp3/internal/framed/Http2$Writer;->closed:Z

    if-eqz v6, :cond_10

    new-instance v6, Ljava/io/IOException;

    const-string v7, "closed"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    :catchall_d
    move-exception v6

    monitor-exit p0

    throw v6

    .line 498
    :cond_10
    :try_start_10
    invoke-virtual {p1}, Lokhttp3/internal/framed/Settings;->size()I

    move-result v6

    mul-int/lit8 v3, v6, 0x6

    .line 499
    .local v3, "length":I
    const/4 v5, 0x4

    .line 500
    .local v5, "type":B
    const/4 v0, 0x0

    .line 501
    .local v0, "flags":B
    const/4 v4, 0x0

    .line 502
    .local v4, "streamId":I
    invoke-virtual {p0, v4, v3, v5, v0}, Lokhttp3/internal/framed/Http2$Writer;->frameHeader(IIBB)V

    .line 503
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1d
    const/16 v6, 0xa

    if-ge v1, v6, :cond_43

    .line 504
    invoke-virtual {p1, v1}, Lokhttp3/internal/framed/Settings;->isSet(I)Z

    move-result v6

    if-nez v6, :cond_2a

    .line 503
    :goto_27
    add-int/lit8 v1, v1, 0x1

    goto :goto_1d

    .line 505
    :cond_2a
    move v2, v1

    .line 506
    .local v2, "id":I
    const/4 v6, 0x4

    if-ne v2, v6, :cond_3e

    .line 507
    const/4 v2, 0x3

    .line 511
    :cond_2f
    :goto_2f
    iget-object v6, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v6, v2}, Lokio/BufferedSink;->writeShort(I)Lokio/BufferedSink;

    .line 512
    iget-object v6, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-virtual {p1, v1}, Lokhttp3/internal/framed/Settings;->get(I)I

    move-result v7

    invoke-interface {v6, v7}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    goto :goto_27

    .line 508
    :cond_3e
    const/4 v6, 0x7

    if-ne v2, v6, :cond_2f

    .line 509
    const/4 v2, 0x4

    goto :goto_2f

    .line 514
    .end local v2    # "id":I
    :cond_43
    iget-object v6, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v6}, Lokio/BufferedSink;->flush()V
    :try_end_48
    .catchall {:try_start_10 .. :try_end_48} :catchall_d

    .line 515
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized synReply(ZILjava/util/List;)V
    .registers 6
    .param p1, "outFinished"    # Z
    .param p2, "streamId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZI",
            "Ljava/util/List",
            "<",
            "Lokhttp3/internal/framed/Header;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 413
    .local p3, "headerBlock":Ljava/util/List;, "Ljava/util/List<Lokhttp3/internal/framed/Header;>;"
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lokhttp3/internal/framed/Http2$Writer;->closed:Z

    if-eqz v0, :cond_10

    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0

    .line 414
    :cond_10
    :try_start_10
    invoke-virtual {p0, p1, p2, p3}, Lokhttp3/internal/framed/Http2$Writer;->headers(ZILjava/util/List;)V
    :try_end_13
    .catchall {:try_start_10 .. :try_end_13} :catchall_d

    .line 415
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized synStream(ZZIILjava/util/List;)V
    .registers 8
    .param p1, "outFinished"    # Z
    .param p2, "inFinished"    # Z
    .param p3, "streamId"    # I
    .param p4, "associatedStreamId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZII",
            "Ljava/util/List",
            "<",
            "Lokhttp3/internal/framed/Header;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 406
    .local p5, "headerBlock":Ljava/util/List;, "Ljava/util/List<Lokhttp3/internal/framed/Header;>;"
    monitor-enter p0

    if-eqz p2, :cond_c

    :try_start_3
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_9

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0

    .line 407
    :cond_c
    :try_start_c
    iget-boolean v0, p0, Lokhttp3/internal/framed/Http2$Writer;->closed:Z

    if-eqz v0, :cond_18

    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 408
    :cond_18
    invoke-virtual {p0, p1, p3, p5}, Lokhttp3/internal/framed/Http2$Writer;->headers(ZILjava/util/List;)V
    :try_end_1b
    .catchall {:try_start_c .. :try_end_1b} :catchall_9

    .line 409
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized windowUpdate(IJ)V
    .registers 11
    .param p1, "streamId"    # I
    .param p2, "windowSizeIncrement"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 549
    monitor-enter p0

    :try_start_1
    iget-boolean v3, p0, Lokhttp3/internal/framed/Http2$Writer;->closed:Z

    if-eqz v3, :cond_10

    new-instance v3, Ljava/io/IOException;

    const-string v4, "closed"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    :catchall_d
    move-exception v3

    monitor-exit p0

    throw v3

    .line 550
    :cond_10
    const-wide/16 v3, 0x0

    cmp-long v3, p2, v3

    if-eqz v3, :cond_1d

    const-wide/32 v3, 0x7fffffff

    cmp-long v3, p2, v3

    if-lez v3, :cond_2e

    .line 551
    :cond_1d
    :try_start_1d
    const-string v3, "windowSizeIncrement == 0 || windowSizeIncrement > 0x7fffffffL: %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    .line 552
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    .line 551
    # invokes: Lokhttp3/internal/framed/Http2;->illegalArgument(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;
    invoke-static {v3, v4}, Lokhttp3/internal/framed/Http2;->access$500(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;

    move-result-object v3

    throw v3

    .line 554
    :cond_2e
    const/4 v1, 0x4

    .line 555
    .local v1, "length":I
    const/16 v2, 0x8

    .line 556
    .local v2, "type":B
    const/4 v0, 0x0

    .line 557
    .local v0, "flags":B
    invoke-virtual {p0, p1, v1, v2, v0}, Lokhttp3/internal/framed/Http2$Writer;->frameHeader(IIBB)V

    .line 558
    iget-object v3, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    long-to-int v4, p2

    invoke-interface {v3, v4}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 559
    iget-object v3, p0, Lokhttp3/internal/framed/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v3}, Lokio/BufferedSink;->flush()V
    :try_end_40
    .catchall {:try_start_1d .. :try_end_40} :catchall_d

    .line 560
    monitor-exit p0

    return-void
.end method
