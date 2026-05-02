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
.field private static final NO_CHUNK_YET:I = -0x1


# instance fields
.field private bytesRemainingInChunk:I

.field private hasMoreChunks:Z

.field private final httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

.field final synthetic this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;


# direct methods
.method constructor <init>(Lcom/squareup/okhttp/internal/http/HttpConnection;Lcom/squareup/okhttp/internal/http/HttpEngine;)V
    .registers 4
    .param p2, "httpEngine"    # Lcom/squareup/okhttp/internal/http/HttpEngine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 440
    iput-object p1, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;-><init>(Lcom/squareup/okhttp/internal/http/HttpConnection;Lcom/squareup/okhttp/internal/http/HttpConnection$1;)V

    .line 436
    const/4 v0, -0x1

    iput v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:I

    .line 437
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->hasMoreChunks:Z

    .line 441
    iput-object p2, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    .line 442
    return-void
.end method

.method private readChunkSize()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v5, -0x1

    .line 465
    iget v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:I

    if-eq v4, v5, :cond_f

    .line 466
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->source:Lokio/BufferedSource;
    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$800(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lokio/BufferedSource;

    move-result-object v4

    invoke-interface {v4}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    .line 468
    :cond_f
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->source:Lokio/BufferedSource;
    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$800(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lokio/BufferedSource;

    move-result-object v4

    invoke-interface {v4}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v0

    .line 469
    .local v0, "chunkSizeString":Ljava/lang/String;
    const-string v4, ";"

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 470
    .local v2, "index":I
    if-eq v2, v5, :cond_25

    .line 471
    invoke-virtual {v0, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 474
    :cond_25
    :try_start_25
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x10

    invoke-static {v4, v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v4

    iput v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:I
    :try_end_31
    .catch Ljava/lang/NumberFormatException; {:try_start_25 .. :try_end_31} :catch_4f

    .line 478
    iget v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:I

    if-nez v4, :cond_4e

    .line 479
    iput-boolean v6, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->hasMoreChunks:Z

    .line 480
    new-instance v3, Lcom/squareup/okhttp/Headers$Builder;

    invoke-direct {v3}, Lcom/squareup/okhttp/Headers$Builder;-><init>()V

    .line 481
    .local v3, "trailersBuilder":Lcom/squareup/okhttp/Headers$Builder;
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {v4, v3}, Lcom/squareup/okhttp/internal/http/HttpConnection;->readHeaders(Lcom/squareup/okhttp/Headers$Builder;)V

    .line 482
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Headers$Builder;->build()Lcom/squareup/okhttp/Headers;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/internal/http/HttpEngine;->receiveHeaders(Lcom/squareup/okhttp/Headers;)V

    .line 483
    const/4 v4, 0x1

    invoke-virtual {p0, v4}, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->endOfInput(Z)V

    .line 485
    .end local v3    # "trailersBuilder":Lcom/squareup/okhttp/Headers$Builder;
    :cond_4e
    return-void

    .line 475
    :catch_4f
    move-exception v1

    .line 476
    .local v1, "e":Ljava/lang/NumberFormatException;
    new-instance v4, Ljava/net/ProtocolException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Expected a hex chunk size but was "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v4
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
    .line 488
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->closed:Z

    if-eqz v0, :cond_5

    .line 493
    :goto_4
    return-void

    .line 489
    :cond_5
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->hasMoreChunks:Z

    if-eqz v0, :cond_16

    const/16 v0, 0x64

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {p0, v0, v1}, Lcom/squareup/okhttp/internal/Util;->discard(Lokio/Source;ILjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-nez v0, :cond_16

    .line 490
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->unexpectedEndOfInput()V

    .line 492
    :cond_16
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->closed:Z

    goto :goto_4
.end method

.method public read(Lokio/Buffer;J)J
    .registers 11
    .param p1, "sink"    # Lokio/Buffer;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v2, -0x1

    .line 445
    const-wide/16 v4, 0x0

    cmp-long v4, p2, v4

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

    .line 446
    :cond_21
    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->closed:Z

    if-eqz v4, :cond_2d

    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "closed"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 447
    :cond_2d
    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->hasMoreChunks:Z

    if-nez v4, :cond_33

    move-wide v0, v2

    .line 460
    :goto_32
    return-wide v0

    .line 449
    :cond_33
    iget v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:I

    if-eqz v4, :cond_3c

    iget v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:I

    const/4 v5, -0x1

    if-ne v4, v5, :cond_45

    .line 450
    :cond_3c
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->readChunkSize()V

    .line 451
    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->hasMoreChunks:Z

    if-nez v4, :cond_45

    move-wide v0, v2

    goto :goto_32

    .line 454
    :cond_45
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->source:Lokio/BufferedSource;
    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$800(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lokio/BufferedSource;

    move-result-object v4

    iget v5, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:I

    int-to-long v5, v5

    invoke-static {p2, p3, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    invoke-interface {v4, p1, v5, v6}, Lokio/BufferedSource;->read(Lokio/Buffer;J)J

    move-result-wide v0

    .line 455
    .local v0, "read":J
    cmp-long v2, v0, v2

    if-nez v2, :cond_65

    .line 456
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->unexpectedEndOfInput()V

    .line 457
    new-instance v2, Ljava/io/IOException;

    const-string v3, "unexpected end of stream"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 459
    :cond_65
    iget v2, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:I

    int-to-long v2, v2

    sub-long/2addr v2, v0

    long-to-int v2, v2

    iput v2, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:I

    goto :goto_32
.end method
