.class Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;
.super Lcom/squareup/okhttp/internal/http/Http1xStream$AbstractSource;
.source "Http1xStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/http/Http1xStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ChunkedSource"
.end annotation


# static fields
.field private static final NO_CHUNK_YET:J = -0x1L


# instance fields
.field private bytesRemainingInChunk:J

.field private hasMoreChunks:Z

.field private final httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

.field final synthetic this$0:Lcom/squareup/okhttp/internal/http/Http1xStream;


# direct methods
.method constructor <init>(Lcom/squareup/okhttp/internal/http/Http1xStream;Lcom/squareup/okhttp/internal/http/HttpEngine;)V
    .registers 5
    .param p2, "httpEngine"    # Lcom/squareup/okhttp/internal/http/HttpEngine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 425
    iput-object p1, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/Http1xStream;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/squareup/okhttp/internal/http/Http1xStream$AbstractSource;-><init>(Lcom/squareup/okhttp/internal/http/Http1xStream;Lcom/squareup/okhttp/internal/http/Http1xStream$1;)V

    .line 421
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->bytesRemainingInChunk:J

    .line 422
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->hasMoreChunks:Z

    .line 426
    iput-object p2, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    .line 427
    return-void
.end method

.method private readChunkSize()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x0

    .line 450
    iget-wide v2, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->bytesRemainingInChunk:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-eqz v2, :cond_13

    .line 451
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/Http1xStream;

    # getter for: Lcom/squareup/okhttp/internal/http/Http1xStream;->source:Lokio/BufferedSource;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/http/Http1xStream;->access$600(Lcom/squareup/okhttp/internal/http/Http1xStream;)Lokio/BufferedSource;

    move-result-object v2

    invoke-interface {v2}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    .line 454
    :cond_13
    :try_start_13
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/Http1xStream;

    # getter for: Lcom/squareup/okhttp/internal/http/Http1xStream;->source:Lokio/BufferedSource;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/http/Http1xStream;->access$600(Lcom/squareup/okhttp/internal/http/Http1xStream;)Lokio/BufferedSource;

    move-result-object v2

    invoke-interface {v2}, Lokio/BufferedSource;->readHexadecimalUnsignedLong()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->bytesRemainingInChunk:J

    .line 455
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/Http1xStream;

    # getter for: Lcom/squareup/okhttp/internal/http/Http1xStream;->source:Lokio/BufferedSource;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/http/Http1xStream;->access$600(Lcom/squareup/okhttp/internal/http/Http1xStream;)Lokio/BufferedSource;

    move-result-object v2

    invoke-interface {v2}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 456
    .local v1, "extensions":Ljava/lang/String;
    iget-wide v2, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->bytesRemainingInChunk:J

    cmp-long v2, v2, v6

    if-ltz v2, :cond_41

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_71

    const-string v2, ";"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_71

    .line 457
    :cond_41
    new-instance v2, Ljava/net/ProtocolException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "expected chunk size and optional extensions but was \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->bytesRemainingInChunk:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_66
    .catch Ljava/lang/NumberFormatException; {:try_start_13 .. :try_end_66} :catch_66

    .line 460
    .end local v1    # "extensions":Ljava/lang/String;
    :catch_66
    move-exception v0

    .line 461
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v2, Ljava/net/ProtocolException;

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 463
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .restart local v1    # "extensions":Ljava/lang/String;
    :cond_71
    iget-wide v2, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->bytesRemainingInChunk:J

    cmp-long v2, v2, v6

    if-nez v2, :cond_88

    .line 464
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->hasMoreChunks:Z

    .line 465
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/Http1xStream;

    invoke-virtual {v3}, Lcom/squareup/okhttp/internal/http/Http1xStream;->readHeaders()Lcom/squareup/okhttp/Headers;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/squareup/okhttp/internal/http/HttpEngine;->receiveHeaders(Lcom/squareup/okhttp/Headers;)V

    .line 466
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->endOfInput()V

    .line 468
    :cond_88
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
    .line 471
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->closed:Z

    if-eqz v0, :cond_5

    .line 476
    :goto_4
    return-void

    .line 472
    :cond_5
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->hasMoreChunks:Z

    if-eqz v0, :cond_16

    const/16 v0, 0x64

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {p0, v0, v1}, Lcom/squareup/okhttp/internal/Util;->discard(Lokio/Source;ILjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-nez v0, :cond_16

    .line 473
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->unexpectedEndOfInput()V

    .line 475
    :cond_16
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->closed:Z

    goto :goto_4
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

    const-wide/16 v2, -0x1

    .line 430
    cmp-long v4, p2, v6

    if-gez v4, :cond_21

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

    .line 431
    :cond_21
    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->closed:Z

    if-eqz v4, :cond_2d

    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "closed"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 432
    :cond_2d
    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->hasMoreChunks:Z

    if-nez v4, :cond_33

    move-wide v0, v2

    .line 445
    :goto_32
    return-wide v0

    .line 434
    :cond_33
    iget-wide v4, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->bytesRemainingInChunk:J

    cmp-long v4, v4, v6

    if-eqz v4, :cond_3f

    iget-wide v4, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->bytesRemainingInChunk:J

    cmp-long v4, v4, v2

    if-nez v4, :cond_48

    .line 435
    :cond_3f
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->readChunkSize()V

    .line 436
    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->hasMoreChunks:Z

    if-nez v4, :cond_48

    move-wide v0, v2

    goto :goto_32

    .line 439
    :cond_48
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/Http1xStream;

    # getter for: Lcom/squareup/okhttp/internal/http/Http1xStream;->source:Lokio/BufferedSource;
    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/Http1xStream;->access$600(Lcom/squareup/okhttp/internal/http/Http1xStream;)Lokio/BufferedSource;

    move-result-object v4

    iget-wide v5, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->bytesRemainingInChunk:J

    invoke-static {p2, p3, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    invoke-interface {v4, p1, v5, v6}, Lokio/BufferedSource;->read(Lokio/Buffer;J)J

    move-result-wide v0

    .line 440
    .local v0, "read":J
    cmp-long v2, v0, v2

    if-nez v2, :cond_67

    .line 441
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->unexpectedEndOfInput()V

    .line 442
    new-instance v2, Ljava/net/ProtocolException;

    const-string v3, "unexpected end of stream"

    invoke-direct {v2, v3}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 444
    :cond_67
    iget-wide v2, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->bytesRemainingInChunk:J

    sub-long/2addr v2, v0

    iput-wide v2, p0, Lcom/squareup/okhttp/internal/http/Http1xStream$ChunkedSource;->bytesRemainingInChunk:J

    goto :goto_32
.end method
