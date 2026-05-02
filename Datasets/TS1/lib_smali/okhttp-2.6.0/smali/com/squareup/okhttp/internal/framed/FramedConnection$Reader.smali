.class Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;
.super Lcom/squareup/okhttp/internal/NamedRunnable;
.source "FramedConnection.java"

# interfaces
.implements Lcom/squareup/okhttp/internal/framed/FrameReader$Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/framed/FramedConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Reader"
.end annotation


# instance fields
.field frameReader:Lcom/squareup/okhttp/internal/framed/FrameReader;

.field final synthetic this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;


# direct methods
.method private constructor <init>(Lcom/squareup/okhttp/internal/framed/FramedConnection;)V
    .registers 6
    .param p1, "this$0"    # Lcom/squareup/okhttp/internal/framed/FramedConnection;

    .prologue
    .line 567
    iput-object p1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    .line 568
    const-string v0, "OkHttp %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->hostName:Ljava/lang/String;
    invoke-static {p1}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$900(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-direct {p0, v0, v1}, Lcom/squareup/okhttp/internal/NamedRunnable;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 569
    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/internal/framed/FramedConnection;Lcom/squareup/okhttp/internal/framed/FramedConnection$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/squareup/okhttp/internal/framed/FramedConnection;
    .param p2, "x1"    # Lcom/squareup/okhttp/internal/framed/FramedConnection$1;

    .prologue
    .line 564
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;-><init>(Lcom/squareup/okhttp/internal/framed/FramedConnection;)V

    return-void
.end method

.method private ackSettingsLater(Lcom/squareup/okhttp/internal/framed/Settings;)V
    .registers 8
    .param p1, "peerSettings"    # Lcom/squareup/okhttp/internal/framed/Settings;

    .prologue
    .line 717
    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->executor:Ljava/util/concurrent/ExecutorService;
    invoke-static {}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1900()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader$2;

    const-string v2, "OkHttp %s ACK Settings"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->hostName:Ljava/lang/String;
    invoke-static {v5}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$900(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-direct {v1, p0, v2, v3, p1}, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader$2;-><init>(Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;Ljava/lang/String;[Ljava/lang/Object;Lcom/squareup/okhttp/internal/framed/Settings;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 725
    return-void
.end method


# virtual methods
.method public ackSettings()V
    .registers 1

    .prologue
    .line 729
    return-void
.end method

.method public alternateService(ILjava/lang/String;Lokio/ByteString;Ljava/lang/String;IJ)V
    .registers 8
    .param p1, "streamId"    # I
    .param p2, "origin"    # Ljava/lang/String;
    .param p3, "protocol"    # Lokio/ByteString;
    .param p4, "host"    # Ljava/lang/String;
    .param p5, "port"    # I
    .param p6, "maxAge"    # J

    .prologue
    .line 792
    return-void
.end method

.method public data(ZILokio/BufferedSource;I)V
    .registers 8
    .param p1, "inFinished"    # Z
    .param p2, "streamId"    # I
    .param p3, "source"    # Lokio/BufferedSource;
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 597
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->pushedStream(I)Z
    invoke-static {v1, p2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1100(Lcom/squareup/okhttp/internal/framed/FramedConnection;I)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 598
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->pushDataLater(ILokio/BufferedSource;IZ)V
    invoke-static {v1, p2, p3, p4, p1}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1200(Lcom/squareup/okhttp/internal/framed/FramedConnection;ILokio/BufferedSource;IZ)V

    .line 611
    :cond_d
    :goto_d
    return-void

    .line 601
    :cond_e
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v1, p2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->getStream(I)Lcom/squareup/okhttp/internal/framed/FramedStream;

    move-result-object v0

    .line 602
    .local v0, "dataStream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    if-nez v0, :cond_22

    .line 603
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    sget-object v2, Lcom/squareup/okhttp/internal/framed/ErrorCode;->INVALID_STREAM:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    invoke-virtual {v1, p2, v2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->writeSynResetLater(ILcom/squareup/okhttp/internal/framed/ErrorCode;)V

    .line 604
    int-to-long v1, p4

    invoke-interface {p3, v1, v2}, Lokio/BufferedSource;->skip(J)V

    goto :goto_d

    .line 607
    :cond_22
    invoke-virtual {v0, p3, p4}, Lcom/squareup/okhttp/internal/framed/FramedStream;->receiveData(Lokio/BufferedSource;I)V

    .line 608
    if-eqz p1, :cond_d

    .line 609
    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/framed/FramedStream;->receiveFin()V

    goto :goto_d
.end method

.method protected execute()V
    .registers 7

    .prologue
    .line 572
    sget-object v0, Lcom/squareup/okhttp/internal/framed/ErrorCode;->INTERNAL_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 573
    .local v0, "connectionErrorCode":Lcom/squareup/okhttp/internal/framed/ErrorCode;
    sget-object v2, Lcom/squareup/okhttp/internal/framed/ErrorCode;->INTERNAL_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 575
    .local v2, "streamErrorCode":Lcom/squareup/okhttp/internal/framed/ErrorCode;
    :try_start_4
    iget-object v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    iget-object v3, v3, Lcom/squareup/okhttp/internal/framed/FramedConnection;->variant:Lcom/squareup/okhttp/internal/framed/Variant;

    iget-object v4, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    iget-object v4, v4, Lcom/squareup/okhttp/internal/framed/FramedConnection;->socket:Ljava/net/Socket;

    invoke-static {v4}, Lokio/Okio;->source(Ljava/net/Socket;)Lokio/Source;

    move-result-object v4

    invoke-static {v4}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    move-result-object v4

    iget-object v5, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    iget-boolean v5, v5, Lcom/squareup/okhttp/internal/framed/FramedConnection;->client:Z

    invoke-interface {v3, v4, v5}, Lcom/squareup/okhttp/internal/framed/Variant;->newReader(Lokio/BufferedSource;Z)Lcom/squareup/okhttp/internal/framed/FrameReader;

    move-result-object v3

    iput-object v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->frameReader:Lcom/squareup/okhttp/internal/framed/FrameReader;

    .line 576
    iget-object v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    iget-boolean v3, v3, Lcom/squareup/okhttp/internal/framed/FramedConnection;->client:Z

    if-nez v3, :cond_29

    .line 577
    iget-object v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->frameReader:Lcom/squareup/okhttp/internal/framed/FrameReader;

    invoke-interface {v3}, Lcom/squareup/okhttp/internal/framed/FrameReader;->readConnectionPreface()V

    .line 579
    :cond_29
    iget-object v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->frameReader:Lcom/squareup/okhttp/internal/framed/FrameReader;

    invoke-interface {v3, p0}, Lcom/squareup/okhttp/internal/framed/FrameReader;->nextFrame(Lcom/squareup/okhttp/internal/framed/FrameReader$Handler;)Z

    move-result v3

    if-nez v3, :cond_29

    .line 581
    sget-object v0, Lcom/squareup/okhttp/internal/framed/ErrorCode;->NO_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 582
    sget-object v2, Lcom/squareup/okhttp/internal/framed/ErrorCode;->CANCEL:Lcom/squareup/okhttp/internal/framed/ErrorCode;
    :try_end_35
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_35} :catch_40
    .catchall {:try_start_4 .. :try_end_35} :catchall_50

    .line 588
    :try_start_35
    iget-object v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->close(Lcom/squareup/okhttp/internal/framed/ErrorCode;Lcom/squareup/okhttp/internal/framed/ErrorCode;)V
    invoke-static {v3, v0, v2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1000(Lcom/squareup/okhttp/internal/framed/FramedConnection;Lcom/squareup/okhttp/internal/framed/ErrorCode;Lcom/squareup/okhttp/internal/framed/ErrorCode;)V
    :try_end_3a
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_3a} :catch_60

    .line 591
    :goto_3a
    iget-object v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->frameReader:Lcom/squareup/okhttp/internal/framed/FrameReader;

    invoke-static {v3}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 593
    :goto_3f
    return-void

    .line 583
    :catch_40
    move-exception v1

    .line 584
    .local v1, "e":Ljava/io/IOException;
    :try_start_41
    sget-object v0, Lcom/squareup/okhttp/internal/framed/ErrorCode;->PROTOCOL_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 585
    sget-object v2, Lcom/squareup/okhttp/internal/framed/ErrorCode;->PROTOCOL_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;
    :try_end_45
    .catchall {:try_start_41 .. :try_end_45} :catchall_50

    .line 588
    :try_start_45
    iget-object v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->close(Lcom/squareup/okhttp/internal/framed/ErrorCode;Lcom/squareup/okhttp/internal/framed/ErrorCode;)V
    invoke-static {v3, v0, v2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1000(Lcom/squareup/okhttp/internal/framed/FramedConnection;Lcom/squareup/okhttp/internal/framed/ErrorCode;Lcom/squareup/okhttp/internal/framed/ErrorCode;)V
    :try_end_4a
    .catch Ljava/io/IOException; {:try_start_45 .. :try_end_4a} :catch_5e

    .line 591
    :goto_4a
    iget-object v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->frameReader:Lcom/squareup/okhttp/internal/framed/FrameReader;

    invoke-static {v3}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_3f

    .line 587
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_50
    move-exception v3

    .line 588
    :try_start_51
    iget-object v4, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->close(Lcom/squareup/okhttp/internal/framed/ErrorCode;Lcom/squareup/okhttp/internal/framed/ErrorCode;)V
    invoke-static {v4, v0, v2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1000(Lcom/squareup/okhttp/internal/framed/FramedConnection;Lcom/squareup/okhttp/internal/framed/ErrorCode;Lcom/squareup/okhttp/internal/framed/ErrorCode;)V
    :try_end_56
    .catch Ljava/io/IOException; {:try_start_51 .. :try_end_56} :catch_5c

    .line 591
    :goto_56
    iget-object v4, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->frameReader:Lcom/squareup/okhttp/internal/framed/FrameReader;

    invoke-static {v4}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    throw v3

    .line 589
    :catch_5c
    move-exception v4

    goto :goto_56

    .restart local v1    # "e":Ljava/io/IOException;
    :catch_5e
    move-exception v3

    goto :goto_4a

    .end local v1    # "e":Ljava/io/IOException;
    :catch_60
    move-exception v3

    goto :goto_3a
.end method

.method public goAway(ILcom/squareup/okhttp/internal/framed/ErrorCode;Lokio/ByteString;)V
    .registers 10
    .param p1, "lastGoodStreamId"    # I
    .param p2, "errorCode"    # Lcom/squareup/okhttp/internal/framed/ErrorCode;
    .param p3, "debugData"    # Lokio/ByteString;

    .prologue
    .line 744
    invoke-virtual {p3}, Lokio/ByteString;->size()I

    move-result v2

    if-lez v2, :cond_6

    .line 749
    :cond_6
    iget-object v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    monitor-enter v3

    .line 750
    :try_start_9
    iget-object v2, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->streams:Ljava/util/Map;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1700(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    iget-object v4, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->streams:Ljava/util/Map;
    invoke-static {v4}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1700(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v4

    new-array v4, v4, [Lcom/squareup/okhttp/internal/framed/FramedStream;

    invoke-interface {v2, v4}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/squareup/okhttp/internal/framed/FramedStream;

    .line 751
    .local v1, "streamsCopy":[Lcom/squareup/okhttp/internal/framed/FramedStream;
    iget-object v2, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    const/4 v4, 0x1

    # setter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->shutdown:Z
    invoke-static {v2, v4}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1402(Lcom/squareup/okhttp/internal/framed/FramedConnection;Z)Z

    .line 752
    monitor-exit v3
    :try_end_2c
    .catchall {:try_start_9 .. :try_end_2c} :catchall_4f

    .line 755
    array-length v3, v1

    const/4 v2, 0x0

    :goto_2e
    if-ge v2, v3, :cond_52

    aget-object v0, v1, v2

    .line 756
    .local v0, "framedStream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/framed/FramedStream;->getId()I

    move-result v4

    if-le v4, p1, :cond_4c

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/framed/FramedStream;->isLocallyInitiated()Z

    move-result v4

    if-eqz v4, :cond_4c

    .line 757
    sget-object v4, Lcom/squareup/okhttp/internal/framed/ErrorCode;->REFUSED_STREAM:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    invoke-virtual {v0, v4}, Lcom/squareup/okhttp/internal/framed/FramedStream;->receiveRstStream(Lcom/squareup/okhttp/internal/framed/ErrorCode;)V

    .line 758
    iget-object v4, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/framed/FramedStream;->getId()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->removeStream(I)Lcom/squareup/okhttp/internal/framed/FramedStream;

    .line 755
    :cond_4c
    add-int/lit8 v2, v2, 0x1

    goto :goto_2e

    .line 752
    .end local v0    # "framedStream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    .end local v1    # "streamsCopy":[Lcom/squareup/okhttp/internal/framed/FramedStream;
    :catchall_4f
    move-exception v2

    :try_start_50
    monitor-exit v3
    :try_end_51
    .catchall {:try_start_50 .. :try_end_51} :catchall_4f

    throw v2

    .line 761
    .restart local v1    # "streamsCopy":[Lcom/squareup/okhttp/internal/framed/FramedStream;
    :cond_52
    return-void
.end method

.method public headers(ZZIILjava/util/List;Lcom/squareup/okhttp/internal/framed/HeadersMode;)V
    .registers 16
    .param p1, "outFinished"    # Z
    .param p2, "inFinished"    # Z
    .param p3, "streamId"    # I
    .param p4, "associatedStreamId"    # I
    .param p6, "headersMode"    # Lcom/squareup/okhttp/internal/framed/HeadersMode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZII",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/internal/framed/Header;",
            ">;",
            "Lcom/squareup/okhttp/internal/framed/HeadersMode;",
            ")V"
        }
    .end annotation

    .prologue
    .line 615
    .local p5, "headerBlock":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/internal/framed/Header;>;"
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->pushedStream(I)Z
    invoke-static {v1, p3}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1100(Lcom/squareup/okhttp/internal/framed/FramedConnection;I)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 616
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->pushHeadersLater(ILjava/util/List;Z)V
    invoke-static {v1, p3, p5, p2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1300(Lcom/squareup/okhttp/internal/framed/FramedConnection;ILjava/util/List;Z)V

    .line 672
    :cond_d
    :goto_d
    return-void

    .line 620
    :cond_e
    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    monitor-enter v7

    .line 622
    :try_start_11
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->shutdown:Z
    invoke-static {v1}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1400(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Z

    move-result v1

    if-eqz v1, :cond_1e

    monitor-exit v7

    goto :goto_d

    .line 660
    :catchall_1b
    move-exception v1

    monitor-exit v7
    :try_end_1d
    .catchall {:try_start_11 .. :try_end_1d} :catchall_1b

    throw v1

    .line 624
    :cond_1e
    :try_start_1e
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v1, p3}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->getStream(I)Lcom/squareup/okhttp/internal/framed/FramedStream;

    move-result-object v6

    .line 626
    .local v6, "stream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    if-nez v6, :cond_8d

    .line 628
    invoke-virtual {p6}, Lcom/squareup/okhttp/internal/framed/HeadersMode;->failIfStreamAbsent()Z

    move-result v1

    if-eqz v1, :cond_35

    .line 629
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    sget-object v2, Lcom/squareup/okhttp/internal/framed/ErrorCode;->INVALID_STREAM:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    invoke-virtual {v1, p3, v2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->writeSynResetLater(ILcom/squareup/okhttp/internal/framed/ErrorCode;)V

    .line 630
    monitor-exit v7

    goto :goto_d

    .line 634
    :cond_35
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->lastGoodStreamId:I
    invoke-static {v1}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1500(Lcom/squareup/okhttp/internal/framed/FramedConnection;)I

    move-result v1

    if-gt p3, v1, :cond_3f

    monitor-exit v7

    goto :goto_d

    .line 637
    :cond_3f
    rem-int/lit8 v1, p3, 0x2

    iget-object v2, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->nextStreamId:I
    invoke-static {v2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1600(Lcom/squareup/okhttp/internal/framed/FramedConnection;)I

    move-result v2

    rem-int/lit8 v2, v2, 0x2

    if-ne v1, v2, :cond_4d

    monitor-exit v7

    goto :goto_d

    .line 641
    :cond_4d
    new-instance v0, Lcom/squareup/okhttp/internal/framed/FramedStream;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    move v1, p3

    move v3, p1

    move v4, p2

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/squareup/okhttp/internal/framed/FramedStream;-><init>(ILcom/squareup/okhttp/internal/framed/FramedConnection;ZZLjava/util/List;)V

    .line 643
    .local v0, "newStream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # setter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->lastGoodStreamId:I
    invoke-static {v1, p3}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1502(Lcom/squareup/okhttp/internal/framed/FramedConnection;I)I

    .line 644
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->streams:Ljava/util/Map;
    invoke-static {v1}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1700(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Ljava/util/Map;

    move-result-object v1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 645
    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->executor:Ljava/util/concurrent/ExecutorService;
    invoke-static {}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1900()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader$1;

    const-string v3, "OkHttp %s stream %d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v8, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->hostName:Ljava/lang/String;
    invoke-static {v8}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$900(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v4, v5

    const/4 v5, 0x1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v4, v5

    invoke-direct {v2, p0, v3, v4, v0}, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader$1;-><init>(Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;Ljava/lang/String;[Ljava/lang/Object;Lcom/squareup/okhttp/internal/framed/FramedStream;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 658
    monitor-exit v7

    goto :goto_d

    .line 660
    .end local v0    # "newStream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    :cond_8d
    monitor-exit v7
    :try_end_8e
    .catchall {:try_start_1e .. :try_end_8e} :catchall_1b

    .line 663
    invoke-virtual {p6}, Lcom/squareup/okhttp/internal/framed/HeadersMode;->failIfStreamPresent()Z

    move-result v1

    if-eqz v1, :cond_a0

    .line 664
    sget-object v1, Lcom/squareup/okhttp/internal/framed/ErrorCode;->PROTOCOL_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    invoke-virtual {v6, v1}, Lcom/squareup/okhttp/internal/framed/FramedStream;->closeLater(Lcom/squareup/okhttp/internal/framed/ErrorCode;)V

    .line 665
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v1, p3}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->removeStream(I)Lcom/squareup/okhttp/internal/framed/FramedStream;

    goto/16 :goto_d

    .line 670
    :cond_a0
    invoke-virtual {v6, p5, p6}, Lcom/squareup/okhttp/internal/framed/FramedStream;->receiveHeaders(Ljava/util/List;Lcom/squareup/okhttp/internal/framed/HeadersMode;)V

    .line 671
    if-eqz p2, :cond_d

    invoke-virtual {v6}, Lcom/squareup/okhttp/internal/framed/FramedStream;->receiveFin()V

    goto/16 :goto_d
.end method

.method public ping(ZII)V
    .registers 8
    .param p1, "reply"    # Z
    .param p2, "payload1"    # I
    .param p3, "payload2"    # I

    .prologue
    .line 732
    if-eqz p1, :cond_e

    .line 733
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->removePing(I)Lcom/squareup/okhttp/internal/framed/Ping;
    invoke-static {v1, p2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$2200(Lcom/squareup/okhttp/internal/framed/FramedConnection;I)Lcom/squareup/okhttp/internal/framed/Ping;

    move-result-object v0

    .line 734
    .local v0, "ping":Lcom/squareup/okhttp/internal/framed/Ping;
    if-eqz v0, :cond_d

    .line 735
    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/framed/Ping;->receive()V

    .line 741
    .end local v0    # "ping":Lcom/squareup/okhttp/internal/framed/Ping;
    :cond_d
    :goto_d
    return-void

    .line 739
    :cond_e
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    const/4 v2, 0x1

    const/4 v3, 0x0

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->writePingLater(ZIILcom/squareup/okhttp/internal/framed/Ping;)V
    invoke-static {v1, v2, p2, p3, v3}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$2300(Lcom/squareup/okhttp/internal/framed/FramedConnection;ZIILcom/squareup/okhttp/internal/framed/Ping;)V

    goto :goto_d
.end method

.method public priority(IIIZ)V
    .registers 5
    .param p1, "streamId"    # I
    .param p2, "streamDependency"    # I
    .param p3, "weight"    # I
    .param p4, "exclusive"    # Z

    .prologue
    .line 782
    return-void
.end method

.method public pushPromise(IILjava/util/List;)V
    .registers 5
    .param p1, "streamId"    # I
    .param p2, "promisedStreamId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/internal/framed/Header;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 786
    .local p3, "requestHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/internal/framed/Header;>;"
    iget-object v0, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->pushRequestLater(ILjava/util/List;)V
    invoke-static {v0, p2, p3}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$2400(Lcom/squareup/okhttp/internal/framed/FramedConnection;ILjava/util/List;)V

    .line 787
    return-void
.end method

.method public rstStream(ILcom/squareup/okhttp/internal/framed/ErrorCode;)V
    .registers 5
    .param p1, "streamId"    # I
    .param p2, "errorCode"    # Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .prologue
    .line 675
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->pushedStream(I)Z
    invoke-static {v1, p1}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1100(Lcom/squareup/okhttp/internal/framed/FramedConnection;I)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 676
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->pushResetLater(ILcom/squareup/okhttp/internal/framed/ErrorCode;)V
    invoke-static {v1, p1, p2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$2000(Lcom/squareup/okhttp/internal/framed/FramedConnection;ILcom/squareup/okhttp/internal/framed/ErrorCode;)V

    .line 683
    :cond_d
    :goto_d
    return-void

    .line 679
    :cond_e
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v1, p1}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->removeStream(I)Lcom/squareup/okhttp/internal/framed/FramedStream;

    move-result-object v0

    .line 680
    .local v0, "rstStream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    if-eqz v0, :cond_d

    .line 681
    invoke-virtual {v0, p2}, Lcom/squareup/okhttp/internal/framed/FramedStream;->receiveRstStream(Lcom/squareup/okhttp/internal/framed/ErrorCode;)V

    goto :goto_d
.end method

.method public settings(ZLcom/squareup/okhttp/internal/framed/Settings;)V
    .registers 13
    .param p1, "clearPrevious"    # Z
    .param p2, "newSettings"    # Lcom/squareup/okhttp/internal/framed/Settings;

    .prologue
    .line 686
    const-wide/16 v1, 0x0

    .line 687
    .local v1, "delta":J
    const/4 v6, 0x0

    .line 688
    .local v6, "streamsToNotify":[Lcom/squareup/okhttp/internal/framed/FramedStream;
    iget-object v8, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    monitor-enter v8

    .line 689
    :try_start_6
    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    iget-object v7, v7, Lcom/squareup/okhttp/internal/framed/FramedConnection;->peerSettings:Lcom/squareup/okhttp/internal/framed/Settings;

    const/high16 v9, 0x10000

    invoke-virtual {v7, v9}, Lcom/squareup/okhttp/internal/framed/Settings;->getInitialWindowSize(I)I

    move-result v4

    .line 690
    .local v4, "priorWriteWindowSize":I
    if-eqz p1, :cond_19

    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    iget-object v7, v7, Lcom/squareup/okhttp/internal/framed/FramedConnection;->peerSettings:Lcom/squareup/okhttp/internal/framed/Settings;

    invoke-virtual {v7}, Lcom/squareup/okhttp/internal/framed/Settings;->clear()V

    .line 691
    :cond_19
    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    iget-object v7, v7, Lcom/squareup/okhttp/internal/framed/FramedConnection;->peerSettings:Lcom/squareup/okhttp/internal/framed/Settings;

    invoke-virtual {v7, p2}, Lcom/squareup/okhttp/internal/framed/Settings;->merge(Lcom/squareup/okhttp/internal/framed/Settings;)V

    .line 692
    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v7}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->getProtocol()Lcom/squareup/okhttp/Protocol;

    move-result-object v7

    sget-object v9, Lcom/squareup/okhttp/Protocol;->HTTP_2:Lcom/squareup/okhttp/Protocol;

    if-ne v7, v9, :cond_2d

    .line 693
    invoke-direct {p0, p2}, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->ackSettingsLater(Lcom/squareup/okhttp/internal/framed/Settings;)V

    .line 695
    :cond_2d
    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    iget-object v7, v7, Lcom/squareup/okhttp/internal/framed/FramedConnection;->peerSettings:Lcom/squareup/okhttp/internal/framed/Settings;

    const/high16 v9, 0x10000

    invoke-virtual {v7, v9}, Lcom/squareup/okhttp/internal/framed/Settings;->getInitialWindowSize(I)I

    move-result v3

    .line 696
    .local v3, "peerInitialWindowSize":I
    const/4 v7, -0x1

    if-eq v3, v7, :cond_7c

    if-eq v3, v4, :cond_7c

    .line 697
    sub-int v7, v3, v4

    int-to-long v1, v7

    .line 698
    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->receivedInitialPeerSettings:Z
    invoke-static {v7}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$2100(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Z

    move-result v7

    if-nez v7, :cond_52

    .line 699
    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v7, v1, v2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->addBytesToWriteWindow(J)V

    .line 700
    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    const/4 v9, 0x1

    # setter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->receivedInitialPeerSettings:Z
    invoke-static {v7, v9}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$2102(Lcom/squareup/okhttp/internal/framed/FramedConnection;Z)Z

    .line 702
    :cond_52
    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->streams:Ljava/util/Map;
    invoke-static {v7}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1700(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Map;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_7c

    .line 703
    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->streams:Ljava/util/Map;
    invoke-static {v7}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1700(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v7

    iget-object v9, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->streams:Ljava/util/Map;
    invoke-static {v9}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1700(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Ljava/util/Map;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Map;->size()I

    move-result v9

    new-array v9, v9, [Lcom/squareup/okhttp/internal/framed/FramedStream;

    invoke-interface {v7, v9}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    move-object v0, v7

    check-cast v0, [Lcom/squareup/okhttp/internal/framed/FramedStream;

    move-object v6, v0

    .line 706
    :cond_7c
    monitor-exit v8
    :try_end_7d
    .catchall {:try_start_6 .. :try_end_7d} :catchall_93

    .line 707
    if-eqz v6, :cond_99

    const-wide/16 v7, 0x0

    cmp-long v7, v1, v7

    if-eqz v7, :cond_99

    .line 708
    array-length v8, v6

    const/4 v7, 0x0

    :goto_87
    if-ge v7, v8, :cond_99

    aget-object v5, v6, v7

    .line 709
    .local v5, "stream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    monitor-enter v5

    .line 710
    :try_start_8c
    invoke-virtual {v5, v1, v2}, Lcom/squareup/okhttp/internal/framed/FramedStream;->addBytesToWriteWindow(J)V

    .line 711
    monitor-exit v5
    :try_end_90
    .catchall {:try_start_8c .. :try_end_90} :catchall_96

    .line 708
    add-int/lit8 v7, v7, 0x1

    goto :goto_87

    .line 706
    .end local v3    # "peerInitialWindowSize":I
    .end local v4    # "priorWriteWindowSize":I
    .end local v5    # "stream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    :catchall_93
    move-exception v7

    :try_start_94
    monitor-exit v8
    :try_end_95
    .catchall {:try_start_94 .. :try_end_95} :catchall_93

    throw v7

    .line 711
    .restart local v3    # "peerInitialWindowSize":I
    .restart local v4    # "priorWriteWindowSize":I
    .restart local v5    # "stream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    :catchall_96
    move-exception v7

    :try_start_97
    monitor-exit v5
    :try_end_98
    .catchall {:try_start_97 .. :try_end_98} :catchall_96

    throw v7

    .line 714
    .end local v5    # "stream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    :cond_99
    return-void
.end method

.method public windowUpdate(IJ)V
    .registers 9
    .param p1, "streamId"    # I
    .param p2, "windowSizeIncrement"    # J

    .prologue
    .line 764
    if-nez p1, :cond_16

    .line 765
    iget-object v2, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    monitor-enter v2

    .line 766
    :try_start_5
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    iget-wide v3, v1, Lcom/squareup/okhttp/internal/framed/FramedConnection;->bytesLeftInWriteWindow:J

    add-long/2addr v3, p2

    iput-wide v3, v1, Lcom/squareup/okhttp/internal/framed/FramedConnection;->bytesLeftInWriteWindow:J

    .line 767
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 768
    monitor-exit v2

    .line 777
    :cond_12
    :goto_12
    return-void

    .line 768
    :catchall_13
    move-exception v1

    monitor-exit v2
    :try_end_15
    .catchall {:try_start_5 .. :try_end_15} :catchall_13

    throw v1

    .line 770
    :cond_16
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v1, p1}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->getStream(I)Lcom/squareup/okhttp/internal/framed/FramedStream;

    move-result-object v0

    .line 771
    .local v0, "stream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    if-eqz v0, :cond_12

    .line 772
    monitor-enter v0

    .line 773
    :try_start_1f
    invoke-virtual {v0, p2, p3}, Lcom/squareup/okhttp/internal/framed/FramedStream;->addBytesToWriteWindow(J)V

    .line 774
    monitor-exit v0

    goto :goto_12

    :catchall_24
    move-exception v1

    monitor-exit v0
    :try_end_26
    .catchall {:try_start_1f .. :try_end_26} :catchall_24

    throw v1
.end method
