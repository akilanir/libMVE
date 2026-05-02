.class final Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSink;
.super Ljava/lang/Object;
.source "Http1xStream.java"

# interfaces
.implements Lokio/Sink;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/http/Http1xStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ChunkedSink"
.end annotation


# instance fields
.field private closed:Z

.field final synthetic this$0:Lcom/squareup/okhttp/internal/http/Http1xStream;

.field private final timeout:Lokio/ForwardingTimeout;


# direct methods
.method private constructor <init>(Lcom/squareup/okhttp/internal/http/Http1xStream;)V
    .registers 4

    .prologue
    .line 311
    iput-object p1, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSink;->this$0:Lcom/squareup/okhttp/internal/http/Http1xStream;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 312
    new-instance v0, Lokio/ForwardingTimeout;

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSink;->this$0:Lcom/squareup/okhttp/internal/http/Http1xStream;

    # getter for: Lcom/squareup/okhttp/internal/http/Http1xStream;->sink:Lokio/BufferedSink;
    invoke-static {v1}, Lcom/squareup/okhttp/internal/http/Http1xStream;->access$300(Lcom/squareup/okhttp/internal/http/Http1xStream;)Lokio/BufferedSink;

    move-result-object v1

    invoke-interface {v1}, Lokio/BufferedSink;->timeout()Lokio/Timeout;

    move-result-object v1

    invoke-direct {v0, v1}, Lokio/ForwardingTimeout;-><init>(Lokio/Timeout;)V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSink;->timeout:Lokio/ForwardingTimeout;

    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/internal/http/Http1xStream;Lcom/squareup/okhttp/internal/http/Http1xStream$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/squareup/okhttp/internal/http/Http1xStream;
    .param p2, "x1"    # Lcom/squareup/okhttp/internal/http/Http1xStream$1;

    .prologue
    .line 311
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSink;-><init>(Lcom/squareup/okhttp/internal/http/Http1xStream;)V

    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 335
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSink;->closed:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_23

    if-eqz v0, :cond_7

    .line 340
    :goto_5
    monitor-exit p0

    return-void

    .line 336
    :cond_7
    const/4 v0, 0x1

    :try_start_8
    iput-boolean v0, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSink;->closed:Z

    .line 337
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSink;->this$0:Lcom/squareup/okhttp/internal/http/Http1xStream;

    # getter for: Lcom/squareup/okhttp/internal/http/Http1xStream;->sink:Lokio/BufferedSink;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/Http1xStream;->access$300(Lcom/squareup/okhttp/internal/http/Http1xStream;)Lokio/BufferedSink;

    move-result-object v0

    const-string v1, "0\r\n\r\n"

    invoke-interface {v0, v1}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 338
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSink;->this$0:Lcom/squareup/okhttp/internal/http/Http1xStream;

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSink;->timeout:Lokio/ForwardingTimeout;

    # invokes: Lcom/squareup/okhttp/internal/http/Http1xStream;->detachTimeout(Lokio/ForwardingTimeout;)V
    invoke-static {v0, v1}, Lcom/squareup/okhttp/internal/http/Http1xStream;->access$400(Lcom/squareup/okhttp/internal/http/Http1xStream;Lokio/ForwardingTimeout;)V

    .line 339
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSink;->this$0:Lcom/squareup/okhttp/internal/http/Http1xStream;

    const/4 v1, 0x3

    # setter for: Lcom/squareup/okhttp/internal/http/Http1xStream;->state:I
    invoke-static {v0, v1}, Lcom/squareup/okhttp/internal/http/Http1xStream;->access$502(Lcom/squareup/okhttp/internal/http/Http1xStream;I)I
    :try_end_22
    .catchall {:try_start_8 .. :try_end_22} :catchall_23

    goto :goto_5

    .line 335
    :catchall_23
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 330
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSink;->closed:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_11

    if-eqz v0, :cond_7

    .line 332
    :goto_5
    monitor-exit p0

    return-void

    .line 331
    :cond_7
    :try_start_7
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSink;->this$0:Lcom/squareup/okhttp/internal/http/Http1xStream;

    # getter for: Lcom/squareup/okhttp/internal/http/Http1xStream;->sink:Lokio/BufferedSink;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/Http1xStream;->access$300(Lcom/squareup/okhttp/internal/http/Http1xStream;)Lokio/BufferedSink;

    move-result-object v0

    invoke-interface {v0}, Lokio/BufferedSink;->flush()V
    :try_end_10
    .catchall {:try_start_7 .. :try_end_10} :catchall_11

    goto :goto_5

    .line 330
    :catchall_11
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public timeout()Lokio/Timeout;
    .registers 2

    .prologue
    .line 316
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSink;->timeout:Lokio/ForwardingTimeout;

    return-object v0
.end method

.method public write(Lokio/Buffer;J)V
    .registers 6
    .param p1, "source"    # Lokio/Buffer;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 320
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSink;->closed:Z

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 321
    :cond_c
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-nez v0, :cond_13

    .line 327
    :goto_12
    return-void

    .line 323
    :cond_13
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSink;->this$0:Lcom/squareup/okhttp/internal/http/Http1xStream;

    # getter for: Lcom/squareup/okhttp/internal/http/Http1xStream;->sink:Lokio/BufferedSink;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/Http1xStream;->access$300(Lcom/squareup/okhttp/internal/http/Http1xStream;)Lokio/BufferedSink;

    move-result-object v0

    invoke-interface {v0, p2, p3}, Lokio/BufferedSink;->writeHexadecimalUnsignedLong(J)Lokio/BufferedSink;

    .line 324
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSink;->this$0:Lcom/squareup/okhttp/internal/http/Http1xStream;

    # getter for: Lcom/squareup/okhttp/internal/http/Http1xStream;->sink:Lokio/BufferedSink;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/Http1xStream;->access$300(Lcom/squareup/okhttp/internal/http/Http1xStream;)Lokio/BufferedSink;

    move-result-object v0

    const-string v1, "\r\n"

    invoke-interface {v0, v1}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 325
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSink;->this$0:Lcom/squareup/okhttp/internal/http/Http1xStream;

    # getter for: Lcom/squareup/okhttp/internal/http/Http1xStream;->sink:Lokio/BufferedSink;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/Http1xStream;->access$300(Lcom/squareup/okhttp/internal/http/Http1xStream;)Lokio/BufferedSink;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lokio/BufferedSink;->write(Lokio/Buffer;J)V

    .line 326
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSink;->this$0:Lcom/squareup/okhttp/internal/http/Http1xStream;

    # getter for: Lcom/squareup/okhttp/internal/http/Http1xStream;->sink:Lokio/BufferedSink;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/Http1xStream;->access$300(Lcom/squareup/okhttp/internal/http/Http1xStream;)Lokio/BufferedSink;

    move-result-object v0

    const-string v1, "\r\n"

    invoke-interface {v0, v1}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    goto :goto_12
.end method
