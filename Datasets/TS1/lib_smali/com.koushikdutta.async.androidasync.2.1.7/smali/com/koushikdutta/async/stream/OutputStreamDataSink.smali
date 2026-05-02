.class public Lcom/koushikdutta/async/stream/OutputStreamDataSink;
.super Ljava/lang/Object;
.source "OutputStreamDataSink.java"

# interfaces
.implements Lcom/koushikdutta/async/DataSink;


# instance fields
.field closeException:Ljava/lang/Exception;

.field closeReported:Z

.field mClosedCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

.field mStream:Ljava/io/OutputStream;

.field mWritable:Lcom/koushikdutta/async/callback/WritableCallback;

.field outputStreamCallback:Lcom/koushikdutta/async/callback/WritableCallback;

.field server:Lcom/koushikdutta/async/AsyncServer;


# direct methods
.method public constructor <init>(Lcom/koushikdutta/async/AsyncServer;)V
    .registers 3
    .param p1, "server"    # Lcom/koushikdutta/async/AsyncServer;

    .prologue
    .line 15
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/koushikdutta/async/stream/OutputStreamDataSink;-><init>(Lcom/koushikdutta/async/AsyncServer;Ljava/io/OutputStream;)V

    .line 16
    return-void
.end method

.method public constructor <init>(Lcom/koushikdutta/async/AsyncServer;Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "server"    # Lcom/koushikdutta/async/AsyncServer;
    .param p2, "stream"    # Ljava/io/OutputStream;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->server:Lcom/koushikdutta/async/AsyncServer;

    .line 33
    invoke-virtual {p0, p2}, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->setOutputStream(Ljava/io/OutputStream;)V

    .line 34
    return-void
.end method


# virtual methods
.method public end()V
    .registers 3

    .prologue
    .line 21
    :try_start_0
    iget-object v1, p0, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->mStream:Ljava/io/OutputStream;

    if-eqz v1, :cond_9

    .line 22
    iget-object v1, p0, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->mStream:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 23
    :cond_9
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->reportClose(Ljava/lang/Exception;)V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_d} :catch_e

    .line 28
    :goto_d
    return-void

    .line 25
    :catch_e
    move-exception v0

    .line 26
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->reportClose(Ljava/lang/Exception;)V

    goto :goto_d
.end method

.method public getClosedCallback()Lcom/koushikdutta/async/callback/CompletedCallback;
    .registers 2

    .prologue
    .line 98
    iget-object v0, p0, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->mClosedCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    iget-object v0, p0, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->mStream:Ljava/io/OutputStream;

    return-object v0
.end method

.method public getServer()Lcom/koushikdutta/async/AsyncServer;
    .registers 2

    .prologue
    .line 103
    iget-object v0, p0, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->server:Lcom/koushikdutta/async/AsyncServer;

    return-object v0
.end method

.method public getWriteableCallback()Lcom/koushikdutta/async/callback/WritableCallback;
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->mWritable:Lcom/koushikdutta/async/callback/WritableCallback;

    return-object v0
.end method

.method public isOpen()Z
    .registers 2

    .prologue
    .line 75
    iget-boolean v0, p0, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->closeReported:Z

    return v0
.end method

.method public reportClose(Ljava/lang/Exception;)V
    .registers 4
    .param p1, "ex"    # Ljava/lang/Exception;

    .prologue
    .line 81
    iget-boolean v0, p0, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->closeReported:Z

    if-eqz v0, :cond_5

    .line 88
    :cond_4
    :goto_4
    return-void

    .line 83
    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->closeReported:Z

    .line 84
    iput-object p1, p0, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->closeException:Ljava/lang/Exception;

    .line 86
    iget-object v0, p0, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->mClosedCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    if-eqz v0, :cond_4

    .line 87
    iget-object v0, p0, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->mClosedCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    iget-object v1, p0, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->closeException:Ljava/lang/Exception;

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/callback/CompletedCallback;->onCompleted(Ljava/lang/Exception;)V

    goto :goto_4
.end method

.method public setClosedCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 2
    .param p1, "handler"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->mClosedCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    .line 94
    return-void
.end method

.method public setOutputStream(Ljava/io/OutputStream;)V
    .registers 2
    .param p1, "stream"    # Ljava/io/OutputStream;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->mStream:Ljava/io/OutputStream;

    .line 39
    return-void
.end method

.method public setOutputStreamWritableCallback(Lcom/koushikdutta/async/callback/WritableCallback;)V
    .registers 2
    .param p1, "outputStreamCallback"    # Lcom/koushikdutta/async/callback/WritableCallback;

    .prologue
    .line 108
    iput-object p1, p0, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->outputStreamCallback:Lcom/koushikdutta/async/callback/WritableCallback;

    .line 109
    return-void
.end method

.method public setWriteableCallback(Lcom/koushikdutta/async/callback/WritableCallback;)V
    .registers 2
    .param p1, "handler"    # Lcom/koushikdutta/async/callback/WritableCallback;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->mWritable:Lcom/koushikdutta/async/callback/WritableCallback;

    .line 66
    return-void
.end method

.method public write(Lcom/koushikdutta/async/ByteBufferList;)V
    .registers 8
    .param p1, "bb"    # Lcom/koushikdutta/async/ByteBufferList;

    .prologue
    .line 48
    :goto_0
    :try_start_0
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->size()I

    move-result v2

    if-lez v2, :cond_2e

    .line 49
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->remove()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 50
    .local v0, "b":Ljava/nio/ByteBuffer;
    invoke-virtual {p0}, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v4

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    invoke-virtual {v2, v3, v4, v5}, Ljava/io/OutputStream;->write([BII)V

    .line 51
    invoke-static {v0}, Lcom/koushikdutta/async/ByteBufferList;->reclaim(Ljava/nio/ByteBuffer;)V
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_25} :catch_26
    .catchall {:try_start_0 .. :try_end_25} :catchall_32

    goto :goto_0

    .line 54
    .end local v0    # "b":Ljava/nio/ByteBuffer;
    :catch_26
    move-exception v1

    .line 55
    .local v1, "e":Ljava/io/IOException;
    :try_start_27
    invoke-virtual {p0, v1}, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->reportClose(Ljava/lang/Exception;)V
    :try_end_2a
    .catchall {:try_start_27 .. :try_end_2a} :catchall_32

    .line 58
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->recycle()V

    .line 60
    .end local v1    # "e":Ljava/io/IOException;
    :goto_2d
    return-void

    .line 58
    :cond_2e
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->recycle()V

    goto :goto_2d

    :catchall_32
    move-exception v2

    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->recycle()V

    throw v2
.end method
