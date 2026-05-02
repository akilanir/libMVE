.class Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;
.super Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;
.source "HttpConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/http/HttpConnection;
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

.field final synthetic this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;


# direct methods
.method constructor <init>(Lcom/squareup/okhttp/internal/http/HttpConnection;Lcom/squareup/okhttp/internal/http/HttpEngine;)V
    .registers 5
    .param p2, "httpEngine"    # Lcom/squareup/okhttp/internal/http/HttpEngine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 422
    iput-object p1, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;-><init>(Lcom/squareup/okhttp/internal/http/HttpConnection;Lcom/squareup/okhttp/internal/http/HttpConnection$1;)V

    .line 418
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:J

    .line 419
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->hasMoreChunks:Z

    .line 423
    iput-object p2, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    .line 424
    return-void
.end method

.method private readChunkSize()V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v7, 0x0

    .line 447
    iget-wide v3, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:J

    const-wide/16 v5, -0x1

    cmp-long v3, v3, v5

    if-eqz v3, :cond_13

    .line 448
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->source:Lokio/BufferedSource;
    invoke-static {v3}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$500(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lokio/BufferedSource;

    move-result-object v3

    invoke-interface {v3}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    .line 451
    :cond_13
    :try_start_13
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->source:Lokio/BufferedSource;
    invoke-static {v3}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$500(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lokio/BufferedSource;

    move-result-object v3

    invoke-interface {v3}, Lokio/BufferedSource;->readHexadecimalUnsignedLong()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:J

    .line 452
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->source:Lokio/BufferedSource;
    invoke-static {v3}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$500(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lokio/BufferedSource;

    move-result-object v3

    invoke-interface {v3}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 453
    .local v1, "extensions":Ljava/lang/String;
    iget-wide v3, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:J

    cmp-long v3, v3, v7

    if-ltz v3, :cond_41

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_71

    const-string v3, ";"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_71

    .line 454
    :cond_41
    new-instance v3, Ljava/net/ProtocolException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "expected chunk size and optional extensions but was \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_66
    .catch Ljava/lang/NumberFormatException; {:try_start_13 .. :try_end_66} :catch_66

    .line 457
    .end local v1    # "extensions":Ljava/lang/String;
    :catch_66
    move-exception v0

    .line 458
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v3, Ljava/net/ProtocolException;

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 460
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .restart local v1    # "extensions":Ljava/lang/String;
    :cond_71
    iget-wide v3, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:J

    cmp-long v3, v3, v7

    if-nez v3, :cond_91

    .line 461
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->hasMoreChunks:Z

    .line 462
    new-instance v2, Lcom/squareup/okhttp/Headers$Builder;

    invoke-direct {v2}, Lcom/squareup/okhttp/Headers$Builder;-><init>()V

    .line 463
    .local v2, "trailersBuilder":Lcom/squareup/okhttp/Headers$Builder;
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {v3, v2}, Lcom/squareup/okhttp/internal/http/HttpConnection;->readHeaders(Lcom/squareup/okhttp/Headers$Builder;)V

    .line 464
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/Headers$Builder;->build()Lcom/squareup/okhttp/Headers;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->receiveHeaders(Lcom/squareup/okhttp/Headers;)V

    .line 465
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->endOfInput(Z)V

    .line 467
    .end local v2    # "trailersBuilder":Lcom/squareup/okhttp/Headers$Builder;
    :cond_91
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
    .line 470
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->closed:Z

    if-eqz v0, :cond_5

    .line 475
    :goto_4
    return-void

    .line 471
    :cond_5
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->hasMoreChunks:Z

    if-eqz v0, :cond_16

    const/16 v0, 0x64

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {p0, v0, v1}, Lcom/squareup/okhttp/internal/Util;->discard(Lokio/Source;ILjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-nez v0, :cond_16

    .line 472
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->unexpectedEndOfInput()V

    .line 474
    :cond_16
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->closed:Z

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

    .line 427
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

    .line 428
    :cond_21
    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->closed:Z

    if-eqz v4, :cond_2d

    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "closed"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 429
    :cond_2d
    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->hasMoreChunks:Z

    if-nez v4, :cond_33

    move-wide v0, v2

    .line 442
    :goto_32
    return-wide v0

    .line 431
    :cond_33
    iget-wide v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:J

    cmp-long v4, v4, v6

    if-eqz v4, :cond_3f

    iget-wide v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:J

    cmp-long v4, v4, v2

    if-nez v4, :cond_48

    .line 432
    :cond_3f
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->readChunkSize()V

    .line 433
    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->hasMoreChunks:Z

    if-nez v4, :cond_48

    move-wide v0, v2

    goto :goto_32

    .line 436
    :cond_48
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->source:Lokio/BufferedSource;
    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$500(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lokio/BufferedSource;

    move-result-object v4

    iget-wide v5, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:J

    invoke-static {p2, p3, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    invoke-interface {v4, p1, v5, v6}, Lokio/BufferedSource;->read(Lokio/Buffer;J)J

    move-result-wide v0

    .line 437
    .local v0, "read":J
    cmp-long v2, v0, v2

    if-nez v2, :cond_67

    .line 438
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->unexpectedEndOfInput()V

    .line 439
    new-instance v2, Ljava/io/IOException;

    const-string v3, "unexpected end of stream"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 441
    :cond_67
    iget-wide v2, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:J

    sub-long/2addr v2, v0

    iput-wide v2, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:J

    goto :goto_32
.end method
