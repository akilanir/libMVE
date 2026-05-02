.class public Lorg/apache/http/impl/io/SocketInputBuffer;
.super Lorg/apache/http/impl/io/AbstractSessionInputBuffer;
.source "SocketInputBuffer.java"

# interfaces
.implements Lorg/apache/http/io/EofSensor;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private eof:Z

.field private final socket:Ljava/net/Socket;


# direct methods
.method public constructor <init>(Ljava/net/Socket;ILorg/apache/http/params/HttpParams;)V
    .registers 6
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "buffersize"    # I
    .param p3, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    invoke-direct {p0}, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;-><init>()V

    .line 74
    if-nez p1, :cond_d

    .line 75
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Socket may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 77
    :cond_d
    iput-object p1, p0, Lorg/apache/http/impl/io/SocketInputBuffer;->socket:Ljava/net/Socket;

    .line 78
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/http/impl/io/SocketInputBuffer;->eof:Z

    .line 79
    if-gez p2, :cond_18

    .line 80
    invoke-virtual {p1}, Ljava/net/Socket;->getReceiveBufferSize()I

    move-result p2

    .line 82
    :cond_18
    const/16 v0, 0x400

    if-ge p2, v0, :cond_1e

    .line 83
    const/16 p2, 0x400

    .line 85
    :cond_1e
    invoke-virtual {p1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lorg/apache/http/impl/io/SocketInputBuffer;->init(Ljava/io/InputStream;ILorg/apache/http/params/HttpParams;)V

    .line 86
    return-void
.end method


# virtual methods
.method protected fillBuffer()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    invoke-super {p0}, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->fillBuffer()I

    move-result v0

    .line 91
    .local v0, "i":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_b

    const/4 v1, 0x1

    :goto_8
    iput-boolean v1, p0, Lorg/apache/http/impl/io/SocketInputBuffer;->eof:Z

    .line 92
    return v0

    .line 91
    :cond_b
    const/4 v1, 0x0

    goto :goto_8
.end method

.method public isDataAvailable(I)Z
    .registers 7
    .param p1, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 96
    invoke-virtual {p0}, Lorg/apache/http/impl/io/SocketInputBuffer;->hasBufferedData()Z

    move-result v2

    .line 97
    .local v2, "result":Z
    if-nez v2, :cond_1d

    .line 98
    iget-object v3, p0, Lorg/apache/http/impl/io/SocketInputBuffer;->socket:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->getSoTimeout()I

    move-result v1

    .line 100
    .local v1, "oldtimeout":I
    :try_start_c
    iget-object v3, p0, Lorg/apache/http/impl/io/SocketInputBuffer;->socket:Ljava/net/Socket;

    invoke-virtual {v3, p1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 101
    invoke-virtual {p0}, Lorg/apache/http/impl/io/SocketInputBuffer;->fillBuffer()I

    .line 102
    invoke-virtual {p0}, Lorg/apache/http/impl/io/SocketInputBuffer;->hasBufferedData()Z
    :try_end_17
    .catch Ljava/net/SocketTimeoutException; {:try_start_c .. :try_end_17} :catch_1e
    .catchall {:try_start_c .. :try_end_17} :catchall_20

    move-result v2

    .line 106
    iget-object v3, p0, Lorg/apache/http/impl/io/SocketInputBuffer;->socket:Ljava/net/Socket;

    invoke-virtual {v3, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 109
    .end local v1    # "oldtimeout":I
    :cond_1d
    return v2

    .line 103
    .restart local v1    # "oldtimeout":I
    :catch_1e
    move-exception v0

    .line 104
    .local v0, "ex":Ljava/net/SocketTimeoutException;
    :try_start_1f
    throw v0
    :try_end_20
    .catchall {:try_start_1f .. :try_end_20} :catchall_20

    .line 106
    .end local v0    # "ex":Ljava/net/SocketTimeoutException;
    :catchall_20
    move-exception v3

    iget-object v4, p0, Lorg/apache/http/impl/io/SocketInputBuffer;->socket:Ljava/net/Socket;

    invoke-virtual {v4, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    throw v3
.end method

.method public isEof()Z
    .registers 2

    .prologue
    .line 113
    iget-boolean v0, p0, Lorg/apache/http/impl/io/SocketInputBuffer;->eof:Z

    return v0
.end method
