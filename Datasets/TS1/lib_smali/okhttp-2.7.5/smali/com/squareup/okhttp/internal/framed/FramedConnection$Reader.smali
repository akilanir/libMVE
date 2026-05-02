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
.field final frameReader:Lcom/squareup/okhttp/internal/framed/FrameReader;

.field final synthetic this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;


# direct methods
.method private constructor <init>(Lcom/squareup/okhttp/internal/framed/FramedConnection;Lcom/squareup/okhttp/internal/framed/FrameReader;)V
    .registers 7
    .param p1, "this$0"    # Lcom/squareup/okhttp/internal/framed/FramedConnection;
    .param p2, "frameReader"    # Lcom/squareup/okhttp/internal/framed/FrameReader;

    .prologue
    .line 594
    iput-object p1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    .line 595
    const-string v0, "OkHttp %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->hostName:Ljava/lang/String;
    invoke-static {p1}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1100(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-direct {p0, v0, v1}, Lcom/squareup/okhttp/internal/NamedRunnable;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 596
    iput-object p2, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->frameReader:Lcom/squareup/okhttp/internal/framed/FrameReader;

    .line 597
    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/internal/framed/FramedConnection;Lcom/squareup/okhttp/internal/framed/FrameReader;Lcom/squareup/okhttp/internal/framed/FramedConnection$1;)V
    .registers 4
    .param p1, "x0"    # Lcom/squareup/okhttp/internal/framed/FramedConnection;
    .param p2, "x1"    # Lcom/squareup/okhttp/internal/framed/FrameReader;
    .param p3, "x2"    # Lcom/squareup/okhttp/internal/framed/FramedConnection$1;

    .prologue
    .line 591
    invoke-direct {p0, p1, p2}, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;-><init>(Lcom/squareup/okhttp/internal/framed/FramedConnection;Lcom/squareup/okhttp/internal/framed/FrameReader;)V

    return-void
.end method

.method private ackSettingsLater(Lcom/squareup/okhttp/internal/framed/Settings;)V
    .registers 8
    .param p1, "peerSettings"    # Lcom/squareup/okhttp/internal/framed/Settings;

    .prologue
    .line 749
    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->executor:Ljava/util/concurrent/ExecutorService;
    invoke-static {}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$2100()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader$3;

    const-string v2, "OkHttp %s ACK Settings"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->hostName:Ljava/lang/String;
    invoke-static {v5}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1100(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-direct {v1, p0, v2, v3, p1}, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader$3;-><init>(Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;Ljava/lang/String;[Ljava/lang/Object;Lcom/squareup/okhttp/internal/framed/Settings;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 757
    return-void
.end method


# virtual methods
.method public ackSettings()V
    .registers 1

    .prologue
    .line 761
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
    .line 824
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
    .line 624
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->pushedStream(I)Z
    invoke-static {v1, p2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1300(Lcom/squareup/okhttp/internal/framed/FramedConnection;I)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 625
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->pushDataLater(ILokio/BufferedSource;IZ)V
    invoke-static {v1, p2, p3, p4, p1}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1400(Lcom/squareup/okhttp/internal/framed/FramedConnection;ILokio/BufferedSource;IZ)V

    .line 638
    :cond_d
    :goto_d
    return-void

    .line 628
    :cond_e
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v1, p2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->getStream(I)Lcom/squareup/okhttp/internal/framed/FramedStream;

    move-result-object v0

    .line 629
    .local v0, "dataStream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    if-nez v0, :cond_22

    .line 630
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    sget-object v2, Lcom/squareup/okhttp/internal/framed/ErrorCode;->INVALID_STREAM:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    invoke-virtual {v1, p2, v2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->writeSynResetLater(ILcom/squareup/okhttp/internal/framed/ErrorCode;)V

    .line 631
    int-to-long v1, p4

    invoke-interface {p3, v1, v2}, Lokio/BufferedSource;->skip(J)V

    goto :goto_d

    .line 634
    :cond_22
    invoke-virtual {v0, p3, p4}, Lcom/squareup/okhttp/internal/framed/FramedStream;->receiveData(Lokio/BufferedSource;I)V

    .line 635
    if-eqz p1, :cond_d

    .line 636
    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/framed/FramedStream;->receiveFin()V

    goto :goto_d
.end method

.method protected execute()V
    .registers 6

    .prologue
    .line 600
    sget-object v0, Lcom/squareup/okhttp/internal/framed/ErrorCode;->INTERNAL_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 601
    .local v0, "connectionErrorCode":Lcom/squareup/okhttp/internal/framed/ErrorCode;
    sget-object v2, Lcom/squareup/okhttp/internal/framed/ErrorCode;->INTERNAL_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 603
    .local v2, "streamErrorCode":Lcom/squareup/okhttp/internal/framed/ErrorCode;
    :try_start_4
    iget-object v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    iget-boolean v3, v3, Lcom/squareup/okhttp/internal/framed/FramedConnection;->client:Z

    if-nez v3, :cond_f

    .line 604
    iget-object v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->frameReader:Lcom/squareup/okhttp/internal/framed/FrameReader;

    invoke-interface {v3}, Lcom/squareup/okhttp/internal/framed/FrameReader;->readConnectionPreface()V

    .line 606
    :cond_f
    iget-object v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->frameReader:Lcom/squareup/okhttp/internal/framed/FrameReader;

    invoke-interface {v3, p0}, Lcom/squareup/okhttp/internal/framed/FrameReader;->nextFrame(Lcom/squareup/okhttp/internal/framed/FrameReader$Handler;)Z

    move-result v3

    if-nez v3, :cond_f

    .line 608
    sget-object v0, Lcom/squareup/okhttp/internal/framed/ErrorCode;->NO_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 609
    sget-object v2, Lcom/squareup/okhttp/internal/framed/ErrorCode;->CANCEL:Lcom/squareup/okhttp/internal/framed/ErrorCode;
    :try_end_1b
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_1b} :catch_26
    .catchall {:try_start_4 .. :try_end_1b} :catchall_36

    .line 615
    :try_start_1b
    iget-object v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->close(Lcom/squareup/okhttp/internal/framed/ErrorCode;Lcom/squareup/okhttp/internal/framed/ErrorCode;)V
    invoke-static {v3, v0, v2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1200(Lcom/squareup/okhttp/internal/framed/FramedConnection;Lcom/squareup/okhttp/internal/framed/ErrorCode;Lcom/squareup/okhttp/internal/framed/ErrorCode;)V
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_20} :catch_46

    .line 618
    :goto_20
    iget-object v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->frameReader:Lcom/squareup/okhttp/internal/framed/FrameReader;

    invoke-static {v3}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 620
    :goto_25
    return-void

    .line 610
    :catch_26
    move-exception v1

    .line 611
    .local v1, "e":Ljava/io/IOException;
    :try_start_27
    sget-object v0, Lcom/squareup/okhttp/internal/framed/ErrorCode;->PROTOCOL_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .line 612
    sget-object v2, Lcom/squareup/okhttp/internal/framed/ErrorCode;->PROTOCOL_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;
    :try_end_2b
    .catchall {:try_start_27 .. :try_end_2b} :catchall_36

    .line 615
    :try_start_2b
    iget-object v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->close(Lcom/squareup/okhttp/internal/framed/ErrorCode;Lcom/squareup/okhttp/internal/framed/ErrorCode;)V
    invoke-static {v3, v0, v2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1200(Lcom/squareup/okhttp/internal/framed/FramedConnection;Lcom/squareup/okhttp/internal/framed/ErrorCode;Lcom/squareup/okhttp/internal/framed/ErrorCode;)V
    :try_end_30
    .catch Ljava/io/IOException; {:try_start_2b .. :try_end_30} :catch_44

    .line 618
    :goto_30
    iget-object v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->frameReader:Lcom/squareup/okhttp/internal/framed/FrameReader;

    invoke-static {v3}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_25

    .line 614
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_36
    move-exception v3

    .line 615
    :try_start_37
    iget-object v4, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->close(Lcom/squareup/okhttp/internal/framed/ErrorCode;Lcom/squareup/okhttp/internal/framed/ErrorCode;)V
    invoke-static {v4, v0, v2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1200(Lcom/squareup/okhttp/internal/framed/FramedConnection;Lcom/squareup/okhttp/internal/framed/ErrorCode;Lcom/squareup/okhttp/internal/framed/ErrorCode;)V
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_37 .. :try_end_3c} :catch_42

    .line 618
    :goto_3c
    iget-object v4, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->frameReader:Lcom/squareup/okhttp/internal/framed/FrameReader;

    invoke-static {v4}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    throw v3

    .line 616
    :catch_42
    move-exception v4

    goto :goto_3c

    .restart local v1    # "e":Ljava/io/IOException;
    :catch_44
    move-exception v3

    goto :goto_30

    .end local v1    # "e":Ljava/io/IOException;
    :catch_46
    move-exception v3

    goto :goto_20
.end method

.method public goAway(ILcom/squareup/okhttp/internal/framed/ErrorCode;Lokio/ByteString;)V
    .registers 10
    .param p1, "lastGoodStreamId"    # I
    .param p2, "errorCode"    # Lcom/squareup/okhttp/internal/framed/ErrorCode;
    .param p3, "debugData"    # Lokio/ByteString;

    .prologue
    .line 776
    invoke-virtual {p3}, Lokio/ByteString;->size()I

    move-result v2

    if-lez v2, :cond_6

    .line 781
    :cond_6
    iget-object v3, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    monitor-enter v3

    .line 782
    :try_start_9
    iget-object v2, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->streams:Ljava/util/Map;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1900(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    iget-object v4, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->streams:Ljava/util/Map;
    invoke-static {v4}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1900(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v4

    new-array v4, v4, [Lcom/squareup/okhttp/internal/framed/FramedStream;

    invoke-interface {v2, v4}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/squareup/okhttp/internal/framed/FramedStream;

    .line 783
    .local v1, "streamsCopy":[Lcom/squareup/okhttp/internal/framed/FramedStream;
    iget-object v2, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    const/4 v4, 0x1

    # setter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->shutdown:Z
    invoke-static {v2, v4}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1602(Lcom/squareup/okhttp/internal/framed/FramedConnection;Z)Z

    .line 784
    monitor-exit v3
    :try_end_2c
    .catchall {:try_start_9 .. :try_end_2c} :catchall_4f

    .line 787
    array-length v3, v1

    const/4 v2, 0x0

    :goto_2e
    if-ge v2, v3, :cond_52

    aget-object v0, v1, v2

    .line 788
    .local v0, "framedStream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/framed/FramedStream;->getId()I

    move-result v4

    if-le v4, p1, :cond_4c

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/framed/FramedStream;->isLocallyInitiated()Z

    move-result v4

    if-eqz v4, :cond_4c

    .line 789
    sget-object v4, Lcom/squareup/okhttp/internal/framed/ErrorCode;->REFUSED_STREAM:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    invoke-virtual {v0, v4}, Lcom/squareup/okhttp/internal/framed/FramedStream;->receiveRstStream(Lcom/squareup/okhttp/internal/framed/ErrorCode;)V

    .line 790
    iget-object v4, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/framed/FramedStream;->getId()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->removeStream(I)Lcom/squareup/okhttp/internal/framed/FramedStream;

    .line 787
    :cond_4c
    add-int/lit8 v2, v2, 0x1

    goto :goto_2e

    .line 784
    .end local v0    # "framedStream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    .end local v1    # "streamsCopy":[Lcom/squareup/okhttp/internal/framed/FramedStream;
    :catchall_4f
    move-exception v2

    :try_start_50
    monitor-exit v3
    :try_end_51
    .catchall {:try_start_50 .. :try_end_51} :catchall_4f

    throw v2

    .line 793
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
    .line 642
    .local p5, "headerBlock":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/internal/framed/Header;>;"
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->pushedStream(I)Z
    invoke-static {v1, p3}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1300(Lcom/squareup/okhttp/internal/framed/FramedConnection;I)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 643
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->pushHeadersLater(ILjava/util/List;Z)V
    invoke-static {v1, p3, p5, p2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1500(Lcom/squareup/okhttp/internal/framed/FramedConnection;ILjava/util/List;Z)V

    .line 699
    :cond_d
    :goto_d
    return-void

    .line 647
    :cond_e
    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    monitor-enter v7

    .line 649
    :try_start_11
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->shutdown:Z
    invoke-static {v1}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1600(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Z

    move-result v1

    if-eqz v1, :cond_1e

    monitor-exit v7

    goto :goto_d

    .line 687
    :catchall_1b
    move-exception v1

    monitor-exit v7
    :try_end_1d
    .catchall {:try_start_11 .. :try_end_1d} :catchall_1b

    throw v1

    .line 651
    :cond_1e
    :try_start_1e
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v1, p3}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->getStream(I)Lcom/squareup/okhttp/internal/framed/FramedStream;

    move-result-object v6

    .line 653
    .local v6, "stream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    if-nez v6, :cond_8d

    .line 655
    invoke-virtual {p6}, Lcom/squareup/okhttp/internal/framed/HeadersMode;->failIfStreamAbsent()Z

    move-result v1

    if-eqz v1, :cond_35

    .line 656
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    sget-object v2, Lcom/squareup/okhttp/internal/framed/ErrorCode;->INVALID_STREAM:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    invoke-virtual {v1, p3, v2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->writeSynResetLater(ILcom/squareup/okhttp/internal/framed/ErrorCode;)V

    .line 657
    monitor-exit v7

    goto :goto_d

    .line 661
    :cond_35
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->lastGoodStreamId:I
    invoke-static {v1}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1700(Lcom/squareup/okhttp/internal/framed/FramedConnection;)I

    move-result v1

    if-gt p3, v1, :cond_3f

    monitor-exit v7

    goto :goto_d

    .line 664
    :cond_3f
    rem-int/lit8 v1, p3, 0x2

    iget-object v2, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->nextStreamId:I
    invoke-static {v2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1800(Lcom/squareup/okhttp/internal/framed/FramedConnection;)I

    move-result v2

    rem-int/lit8 v2, v2, 0x2

    if-ne v1, v2, :cond_4d

    monitor-exit v7

    goto :goto_d

    .line 668
    :cond_4d
    new-instance v0, Lcom/squareup/okhttp/internal/framed/FramedStream;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    move v1, p3

    move v3, p1

    move v4, p2

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/squareup/okhttp/internal/framed/FramedStream;-><init>(ILcom/squareup/okhttp/internal/framed/FramedConnection;ZZLjava/util/List;)V

    .line 670
    .local v0, "newStream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # setter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->lastGoodStreamId:I
    invoke-static {v1, p3}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1702(Lcom/squareup/okhttp/internal/framed/FramedConnection;I)I

    .line 671
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->streams:Ljava/util/Map;
    invoke-static {v1}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1900(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Ljava/util/Map;

    move-result-object v1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 672
    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->executor:Ljava/util/concurrent/ExecutorService;
    invoke-static {}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$2100()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader$1;

    const-string v3, "OkHttp %s stream %d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v8, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->hostName:Ljava/lang/String;
    invoke-static {v8}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1100(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v4, v5

    const/4 v5, 0x1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v4, v5

    invoke-direct {v2, p0, v3, v4, v0}, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader$1;-><init>(Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;Ljava/lang/String;[Ljava/lang/Object;Lcom/squareup/okhttp/internal/framed/FramedStream;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 685
    monitor-exit v7

    goto :goto_d

    .line 687
    .end local v0    # "newStream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    :cond_8d
    monitor-exit v7
    :try_end_8e
    .catchall {:try_start_1e .. :try_end_8e} :catchall_1b

    .line 690
    invoke-virtual {p6}, Lcom/squareup/okhttp/internal/framed/HeadersMode;->failIfStreamPresent()Z

    move-result v1

    if-eqz v1, :cond_a0

    .line 691
    sget-object v1, Lcom/squareup/okhttp/internal/framed/ErrorCode;->PROTOCOL_ERROR:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    invoke-virtual {v6, v1}, Lcom/squareup/okhttp/internal/framed/FramedStream;->closeLater(Lcom/squareup/okhttp/internal/framed/ErrorCode;)V

    .line 692
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v1, p3}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->removeStream(I)Lcom/squareup/okhttp/internal/framed/FramedStream;

    goto/16 :goto_d

    .line 697
    :cond_a0
    invoke-virtual {v6, p5, p6}, Lcom/squareup/okhttp/internal/framed/FramedStream;->receiveHeaders(Ljava/util/List;Lcom/squareup/okhttp/internal/framed/HeadersMode;)V

    .line 698
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
    .line 764
    if-eqz p1, :cond_e

    .line 765
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->removePing(I)Lcom/squareup/okhttp/internal/framed/Ping;
    invoke-static {v1, p2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$2400(Lcom/squareup/okhttp/internal/framed/FramedConnection;I)Lcom/squareup/okhttp/internal/framed/Ping;

    move-result-object v0

    .line 766
    .local v0, "ping":Lcom/squareup/okhttp/internal/framed/Ping;
    if-eqz v0, :cond_d

    .line 767
    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/framed/Ping;->receive()V

    .line 773
    .end local v0    # "ping":Lcom/squareup/okhttp/internal/framed/Ping;
    :cond_d
    :goto_d
    return-void

    .line 771
    :cond_e
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    const/4 v2, 0x1

    const/4 v3, 0x0

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->writePingLater(ZIILcom/squareup/okhttp/internal/framed/Ping;)V
    invoke-static {v1, v2, p2, p3, v3}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$2500(Lcom/squareup/okhttp/internal/framed/FramedConnection;ZIILcom/squareup/okhttp/internal/framed/Ping;)V

    goto :goto_d
.end method

.method public priority(IIIZ)V
    .registers 5
    .param p1, "streamId"    # I
    .param p2, "streamDependency"    # I
    .param p3, "weight"    # I
    .param p4, "exclusive"    # Z

    .prologue
    .line 814
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
    .line 818
    .local p3, "requestHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/internal/framed/Header;>;"
    iget-object v0, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->pushRequestLater(ILjava/util/List;)V
    invoke-static {v0, p2, p3}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$2600(Lcom/squareup/okhttp/internal/framed/FramedConnection;ILjava/util/List;)V

    .line 819
    return-void
.end method

.method public rstStream(ILcom/squareup/okhttp/internal/framed/ErrorCode;)V
    .registers 5
    .param p1, "streamId"    # I
    .param p2, "errorCode"    # Lcom/squareup/okhttp/internal/framed/ErrorCode;

    .prologue
    .line 702
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->pushedStream(I)Z
    invoke-static {v1, p1}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1300(Lcom/squareup/okhttp/internal/framed/FramedConnection;I)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 703
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # invokes: Lcom/squareup/okhttp/internal/framed/FramedConnection;->pushResetLater(ILcom/squareup/okhttp/internal/framed/ErrorCode;)V
    invoke-static {v1, p1, p2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$2200(Lcom/squareup/okhttp/internal/framed/FramedConnection;ILcom/squareup/okhttp/internal/framed/ErrorCode;)V

    .line 710
    :cond_d
    :goto_d
    return-void

    .line 706
    :cond_e
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v1, p1}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->removeStream(I)Lcom/squareup/okhttp/internal/framed/FramedStream;

    move-result-object v0

    .line 707
    .local v0, "rstStream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    if-eqz v0, :cond_d

    .line 708
    invoke-virtual {v0, p2}, Lcom/squareup/okhttp/internal/framed/FramedStream;->receiveRstStream(Lcom/squareup/okhttp/internal/framed/ErrorCode;)V

    goto :goto_d
.end method

.method public settings(ZLcom/squareup/okhttp/internal/framed/Settings;)V
    .registers 17
    .param p1, "clearPrevious"    # Z
    .param p2, "newSettings"    # Lcom/squareup/okhttp/internal/framed/Settings;

    .prologue
    .line 713
    const-wide/16 v1, 0x0

    .line 714
    .local v1, "delta":J
    const/4 v6, 0x0

    .line 715
    .local v6, "streamsToNotify":[Lcom/squareup/okhttp/internal/framed/FramedStream;
    iget-object v8, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    monitor-enter v8

    .line 716
    :try_start_6
    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    iget-object v7, v7, Lcom/squareup/okhttp/internal/framed/FramedConnection;->peerSettings:Lcom/squareup/okhttp/internal/framed/Settings;

    const/high16 v9, 0x10000

    invoke-virtual {v7, v9}, Lcom/squareup/okhttp/internal/framed/Settings;->getInitialWindowSize(I)I

    move-result v4

    .line 717
    .local v4, "priorWriteWindowSize":I
    if-eqz p1, :cond_19

    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    iget-object v7, v7, Lcom/squareup/okhttp/internal/framed/FramedConnection;->peerSettings:Lcom/squareup/okhttp/internal/framed/Settings;

    invoke-virtual {v7}, Lcom/squareup/okhttp/internal/framed/Settings;->clear()V

    .line 718
    :cond_19
    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    iget-object v7, v7, Lcom/squareup/okhttp/internal/framed/FramedConnection;->peerSettings:Lcom/squareup/okhttp/internal/framed/Settings;

    move-object/from16 v0, p2

    invoke-virtual {v7, v0}, Lcom/squareup/okhttp/internal/framed/Settings;->merge(Lcom/squareup/okhttp/internal/framed/Settings;)V

    .line 719
    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v7}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->getProtocol()Lcom/squareup/okhttp/Protocol;

    move-result-object v7

    sget-object v9, Lcom/squareup/okhttp/Protocol;->HTTP_2:Lcom/squareup/okhttp/Protocol;

    if-ne v7, v9, :cond_31

    .line 720
    move-object/from16 v0, p2

    invoke-direct {p0, v0}, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->ackSettingsLater(Lcom/squareup/okhttp/internal/framed/Settings;)V

    .line 722
    :cond_31
    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    iget-object v7, v7, Lcom/squareup/okhttp/internal/framed/FramedConnection;->peerSettings:Lcom/squareup/okhttp/internal/framed/Settings;

    const/high16 v9, 0x10000

    invoke-virtual {v7, v9}, Lcom/squareup/okhttp/internal/framed/Settings;->getInitialWindowSize(I)I

    move-result v3

    .line 723
    .local v3, "peerInitialWindowSize":I
    const/4 v7, -0x1

    if-eq v3, v7, :cond_80

    if-eq v3, v4, :cond_80

    .line 724
    sub-int v7, v3, v4

    int-to-long v1, v7

    .line 725
    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->receivedInitialPeerSettings:Z
    invoke-static {v7}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$2300(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Z

    move-result v7

    if-nez v7, :cond_56

    .line 726
    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v7, v1, v2}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->addBytesToWriteWindow(J)V

    .line 727
    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    const/4 v9, 0x1

    # setter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->receivedInitialPeerSettings:Z
    invoke-static {v7, v9}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$2302(Lcom/squareup/okhttp/internal/framed/FramedConnection;Z)Z

    .line 729
    :cond_56
    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->streams:Ljava/util/Map;
    invoke-static {v7}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1900(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Map;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_80

    .line 730
    iget-object v7, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->streams:Ljava/util/Map;
    invoke-static {v7}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1900(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v7

    iget-object v9, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->streams:Ljava/util/Map;
    invoke-static {v9}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1900(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Ljava/util/Map;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Map;->size()I

    move-result v9

    new-array v9, v9, [Lcom/squareup/okhttp/internal/framed/FramedStream;

    invoke-interface {v7, v9}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    move-object v0, v7

    check-cast v0, [Lcom/squareup/okhttp/internal/framed/FramedStream;

    move-object v6, v0

    .line 733
    :cond_80
    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->executor:Ljava/util/concurrent/ExecutorService;
    invoke-static {}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$2100()Ljava/util/concurrent/ExecutorService;

    move-result-object v7

    new-instance v9, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader$2;

    const-string v10, "OkHttp %s settings"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    iget-object v13, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    # getter for: Lcom/squareup/okhttp/internal/framed/FramedConnection;->hostName:Ljava/lang/String;
    invoke-static {v13}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->access$1100(Lcom/squareup/okhttp/internal/framed/FramedConnection;)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-direct {v9, p0, v10, v11}, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader$2;-><init>(Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-interface {v7, v9}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 738
    monitor-exit v8
    :try_end_9b
    .catchall {:try_start_6 .. :try_end_9b} :catchall_b1

    .line 739
    if-eqz v6, :cond_b7

    const-wide/16 v7, 0x0

    cmp-long v7, v1, v7

    if-eqz v7, :cond_b7

    .line 740
    array-length v8, v6

    const/4 v7, 0x0

    :goto_a5
    if-ge v7, v8, :cond_b7

    aget-object v5, v6, v7

    .line 741
    .local v5, "stream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    monitor-enter v5

    .line 742
    :try_start_aa
    invoke-virtual {v5, v1, v2}, Lcom/squareup/okhttp/internal/framed/FramedStream;->addBytesToWriteWindow(J)V

    .line 743
    monitor-exit v5
    :try_end_ae
    .catchall {:try_start_aa .. :try_end_ae} :catchall_b4

    .line 740
    add-int/lit8 v7, v7, 0x1

    goto :goto_a5

    .line 738
    .end local v3    # "peerInitialWindowSize":I
    .end local v4    # "priorWriteWindowSize":I
    .end local v5    # "stream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    :catchall_b1
    move-exception v7

    :try_start_b2
    monitor-exit v8
    :try_end_b3
    .catchall {:try_start_b2 .. :try_end_b3} :catchall_b1

    throw v7

    .line 743
    .restart local v3    # "peerInitialWindowSize":I
    .restart local v4    # "priorWriteWindowSize":I
    .restart local v5    # "stream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    :catchall_b4
    move-exception v7

    :try_start_b5
    monitor-exit v5
    :try_end_b6
    .catchall {:try_start_b5 .. :try_end_b6} :catchall_b4

    throw v7

    .line 746
    .end local v5    # "stream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    :cond_b7
    return-void
.end method

.method public windowUpdate(IJ)V
    .registers 9
    .param p1, "streamId"    # I
    .param p2, "windowSizeIncrement"    # J

    .prologue
    .line 796
    if-nez p1, :cond_16

    .line 797
    iget-object v2, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    monitor-enter v2

    .line 798
    :try_start_5
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    iget-wide v3, v1, Lcom/squareup/okhttp/internal/framed/FramedConnection;->bytesLeftInWriteWindow:J

    add-long/2addr v3, p2

    iput-wide v3, v1, Lcom/squareup/okhttp/internal/framed/FramedConnection;->bytesLeftInWriteWindow:J

    .line 799
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 800
    monitor-exit v2

    .line 809
    :cond_12
    :goto_12
    return-void

    .line 800
    :catchall_13
    move-exception v1

    monitor-exit v2
    :try_end_15
    .catchall {:try_start_5 .. :try_end_15} :catchall_13

    throw v1

    .line 802
    :cond_16
    iget-object v1, p0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v1, p1}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->getStream(I)Lcom/squareup/okhttp/internal/framed/FramedStream;

    move-result-object v0

    .line 803
    .local v0, "stream":Lcom/squareup/okhttp/internal/framed/FramedStream;
    if-eqz v0, :cond_12

    .line 804
    monitor-enter v0

    .line 805
    :try_start_1f
    invoke-virtual {v0, p2, p3}, Lcom/squareup/okhttp/internal/framed/FramedStream;->addBytesToWriteWindow(J)V

    .line 806
    monitor-exit v0

    goto :goto_12

    :catchall_24
    move-exception v1

    monitor-exit v0
    :try_end_26
    .catchall {:try_start_1f .. :try_end_26} :catchall_24

    throw v1
.end method
