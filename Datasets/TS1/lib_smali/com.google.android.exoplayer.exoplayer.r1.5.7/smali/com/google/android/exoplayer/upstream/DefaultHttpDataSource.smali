.class public Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;
.super Ljava/lang/Object;
.source "DefaultHttpDataSource.java"

# interfaces
.implements Lcom/google/android/exoplayer/upstream/HttpDataSource;


# static fields
.field private static final CONTENT_RANGE_HEADER:Ljava/util/regex/Pattern;

.field public static final DEFAULT_CONNECT_TIMEOUT_MILLIS:I = 0x1f40

.field public static final DEFAULT_READ_TIMEOUT_MILLIS:I = 0x1f40

.field private static final MAX_REDIRECTS:I = 0x14

.field private static final TAG:Ljava/lang/String; = "DefaultHttpDataSource"

.field private static final skipBufferReference:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<[B>;"
        }
    .end annotation
.end field


# instance fields
.field private final allowCrossProtocolRedirects:Z

.field private bytesRead:J

.field private bytesSkipped:J

.field private bytesToRead:J

.field private bytesToSkip:J

.field private final connectTimeoutMillis:I

.field private connection:Ljava/net/HttpURLConnection;

.field private final contentTypePredicate:Lcom/google/android/exoplayer/util/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer/util/Predicate",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

.field private inputStream:Ljava/io/InputStream;

.field private final listener:Lcom/google/android/exoplayer/upstream/TransferListener;

.field private opened:Z

.field private final readTimeoutMillis:I

.field private final requestProperties:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final userAgent:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 63
    const-string v0, "^bytes (\\d+)-(\\d+)/(\\d+)$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->CONTENT_RANGE_HEADER:Ljava/util/regex/Pattern;

    .line 65
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    sput-object v0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->skipBufferReference:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/google/android/exoplayer/util/Predicate;)V
    .registers 4
    .param p1, "userAgent"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer/util/Predicate",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 93
    .local p2, "contentTypePredicate":Lcom/google/android/exoplayer/util/Predicate;, "Lcom/google/android/exoplayer/util/Predicate<Ljava/lang/String;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer/util/Predicate;Lcom/google/android/exoplayer/upstream/TransferListener;)V

    .line 94
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/google/android/exoplayer/util/Predicate;Lcom/google/android/exoplayer/upstream/TransferListener;)V
    .registers 10
    .param p1, "userAgent"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/google/android/exoplayer/upstream/TransferListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer/util/Predicate",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/exoplayer/upstream/TransferListener;",
            ")V"
        }
    .end annotation

    .prologue
    .local p2, "contentTypePredicate":Lcom/google/android/exoplayer/util/Predicate;, "Lcom/google/android/exoplayer/util/Predicate<Ljava/lang/String;>;"
    const/16 v4, 0x1f40

    .line 105
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer/util/Predicate;Lcom/google/android/exoplayer/upstream/TransferListener;II)V

    .line 107
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/google/android/exoplayer/util/Predicate;Lcom/google/android/exoplayer/upstream/TransferListener;II)V
    .registers 13
    .param p1, "userAgent"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/google/android/exoplayer/upstream/TransferListener;
    .param p4, "connectTimeoutMillis"    # I
    .param p5, "readTimeoutMillis"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer/util/Predicate",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/exoplayer/upstream/TransferListener;",
            "II)V"
        }
    .end annotation

    .prologue
    .line 122
    .local p2, "contentTypePredicate":Lcom/google/android/exoplayer/util/Predicate;, "Lcom/google/android/exoplayer/util/Predicate<Ljava/lang/String;>;"
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer/util/Predicate;Lcom/google/android/exoplayer/upstream/TransferListener;IIZ)V

    .line 123
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/google/android/exoplayer/util/Predicate;Lcom/google/android/exoplayer/upstream/TransferListener;IIZ)V
    .registers 8
    .param p1, "userAgent"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/google/android/exoplayer/upstream/TransferListener;
    .param p4, "connectTimeoutMillis"    # I
    .param p5, "readTimeoutMillis"    # I
    .param p6, "allowCrossProtocolRedirects"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer/util/Predicate",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/exoplayer/upstream/TransferListener;",
            "IIZ)V"
        }
    .end annotation

    .prologue
    .line 141
    .local p2, "contentTypePredicate":Lcom/google/android/exoplayer/util/Predicate;, "Lcom/google/android/exoplayer/util/Predicate<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 142
    invoke-static {p1}, Lcom/google/android/exoplayer/util/Assertions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->userAgent:Ljava/lang/String;

    .line 143
    iput-object p2, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->contentTypePredicate:Lcom/google/android/exoplayer/util/Predicate;

    .line 144
    iput-object p3, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    .line 145
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->requestProperties:Ljava/util/HashMap;

    .line 146
    iput p4, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->connectTimeoutMillis:I

    .line 147
    iput p5, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->readTimeoutMillis:I

    .line 148
    iput-boolean p6, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->allowCrossProtocolRedirects:Z

    .line 149
    return-void
.end method

.method private closeConnectionQuietly()V
    .registers 4

    .prologue
    .line 572
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    if-eqz v1, :cond_c

    .line 574
    :try_start_4
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_9} :catch_d

    .line 578
    :goto_9
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    .line 580
    :cond_c
    return-void

    .line 575
    :catch_d
    move-exception v0

    .line 576
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "DefaultHttpDataSource"

    const-string v2, "Unexpected error while disconnecting"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_9
.end method

.method private static getContentLength(Ljava/net/HttpURLConnection;)J
    .registers 13
    .param p0, "connection"    # Ljava/net/HttpURLConnection;

    .prologue
    .line 455
    const-wide/16 v0, -0x1

    .line 456
    .local v0, "contentLength":J
    const-string v8, "Content-Length"

    invoke-virtual {p0, v8}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 457
    .local v4, "contentLengthHeader":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_12

    .line 459
    :try_start_e
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_11
    .catch Ljava/lang/NumberFormatException; {:try_start_e .. :try_end_11} :catch_49

    move-result-wide v0

    .line 464
    :cond_12
    :goto_12
    const-string v8, "Content-Range"

    invoke-virtual {p0, v8}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 465
    .local v5, "contentRangeHeader":Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_48

    .line 466
    sget-object v8, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->CONTENT_RANGE_HEADER:Ljava/util/regex/Pattern;

    invoke-virtual {v8, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    .line 467
    .local v7, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    if-eqz v8, :cond_48

    .line 469
    const/4 v8, 0x2

    :try_start_2b
    invoke-virtual {v7, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    const/4 v10, 0x1

    invoke-virtual {v7, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_3b
    .catch Ljava/lang/NumberFormatException; {:try_start_2b .. :try_end_3b} :catch_9a

    move-result-wide v10

    sub-long/2addr v8, v10

    const-wide/16 v10, 0x1

    add-long v2, v8, v10

    .line 471
    .local v2, "contentLengthFromRange":J
    const-wide/16 v8, 0x0

    cmp-long v8, v0, v8

    if-gez v8, :cond_69

    .line 474
    move-wide v0, v2

    .line 489
    .end local v2    # "contentLengthFromRange":J
    .end local v7    # "matcher":Ljava/util/regex/Matcher;
    :cond_48
    :goto_48
    return-wide v0

    .line 460
    .end local v5    # "contentRangeHeader":Ljava/lang/String;
    :catch_49
    move-exception v6

    .line 461
    .local v6, "e":Ljava/lang/NumberFormatException;
    const-string v8, "DefaultHttpDataSource"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unexpected Content-Length ["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "]"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_12

    .line 475
    .end local v6    # "e":Ljava/lang/NumberFormatException;
    .restart local v2    # "contentLengthFromRange":J
    .restart local v5    # "contentRangeHeader":Ljava/lang/String;
    .restart local v7    # "matcher":Ljava/util/regex/Matcher;
    :cond_69
    cmp-long v8, v0, v2

    if-eqz v8, :cond_48

    .line 480
    :try_start_6d
    const-string v8, "DefaultHttpDataSource"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Inconsistent headers ["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "] ["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "]"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 482
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J
    :try_end_98
    .catch Ljava/lang/NumberFormatException; {:try_start_6d .. :try_end_98} :catch_9a

    move-result-wide v0

    goto :goto_48

    .line 484
    .end local v2    # "contentLengthFromRange":J
    :catch_9a
    move-exception v6

    .line 485
    .restart local v6    # "e":Ljava/lang/NumberFormatException;
    const-string v8, "DefaultHttpDataSource"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unexpected Content-Range ["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "]"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_48
.end method

.method private static handleRedirect(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;
    .registers 7
    .param p0, "originalUrl"    # Ljava/net/URL;
    .param p1, "location"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 428
    if-nez p1, :cond_a

    .line 429
    new-instance v2, Ljava/net/ProtocolException;

    const-string v3, "Null location redirect"

    invoke-direct {v2, v3}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 432
    :cond_a
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0, p1}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .line 434
    .local v1, "url":Ljava/net/URL;
    invoke-virtual {v1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v0

    .line 435
    .local v0, "protocol":Ljava/lang/String;
    const-string v2, "https"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3c

    const-string v2, "http"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3c

    .line 436
    new-instance v2, Ljava/net/ProtocolException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unsupported protocol redirect: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 445
    :cond_3c
    return-object v1
.end method

.method private makeConnection(Lcom/google/android/exoplayer/upstream/DataSpec;)Ljava/net/HttpURLConnection;
    .registers 18
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 332
    new-instance v2, Ljava/net/URL;

    move-object/from16 v0, p1

    iget-object v1, v0, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 333
    .local v2, "url":Ljava/net/URL;
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/google/android/exoplayer/upstream/DataSpec;->postBody:[B

    .line 334
    .local v3, "postBody":[B
    move-object/from16 v0, p1

    iget-wide v4, v0, Lcom/google/android/exoplayer/upstream/DataSpec;->position:J

    .line 335
    .local v4, "position":J
    move-object/from16 v0, p1

    iget-wide v6, v0, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    .line 336
    .local v6, "length":J
    move-object/from16 v0, p1

    iget v1, v0, Lcom/google/android/exoplayer/upstream/DataSpec;->flags:I

    and-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_30

    const/4 v8, 0x1

    .line 338
    .local v8, "allowGzip":Z
    :goto_22
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->allowCrossProtocolRedirects:Z

    if-nez v1, :cond_32

    .line 341
    const/4 v9, 0x1

    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v9}, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->makeConnection(Ljava/net/URL;[BJJZZ)Ljava/net/HttpURLConnection;

    move-result-object v10

    .line 366
    .local v10, "connection":Ljava/net/HttpURLConnection;
    :cond_2f
    return-object v10

    .line 336
    .end local v8    # "allowGzip":Z
    .end local v10    # "connection":Ljava/net/HttpURLConnection;
    :cond_30
    const/4 v8, 0x0

    goto :goto_22

    .line 347
    .restart local v8    # "allowGzip":Z
    :cond_32
    const/4 v12, 0x0

    .local v12, "redirectCount":I
    move v13, v12

    .line 348
    .end local v12    # "redirectCount":I
    .local v13, "redirectCount":I
    :goto_34
    add-int/lit8 v12, v13, 0x1

    .end local v13    # "redirectCount":I
    .restart local v12    # "redirectCount":I
    const/16 v1, 0x14

    if-gt v13, v1, :cond_6f

    .line 349
    const/4 v9, 0x0

    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v9}, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->makeConnection(Ljava/net/URL;[BJJZZ)Ljava/net/HttpURLConnection;

    move-result-object v10

    .line 351
    .restart local v10    # "connection":Ljava/net/HttpURLConnection;
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v14

    .line 352
    .local v14, "responseCode":I
    const/16 v1, 0x12c

    if-eq v14, v1, :cond_5f

    const/16 v1, 0x12d

    if-eq v14, v1, :cond_5f

    const/16 v1, 0x12e

    if-eq v14, v1, :cond_5f

    const/16 v1, 0x12f

    if-eq v14, v1, :cond_5f

    if-nez v3, :cond_2f

    const/16 v1, 0x133

    if-eq v14, v1, :cond_5f

    const/16 v1, 0x134

    if-ne v14, v1, :cond_2f

    .line 361
    :cond_5f
    const/4 v3, 0x0

    .line 362
    const-string v1, "Location"

    invoke-virtual {v10, v1}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 363
    .local v11, "location":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 364
    invoke-static {v2, v11}, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->handleRedirect(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    move v13, v12

    .line 368
    .end local v12    # "redirectCount":I
    .restart local v13    # "redirectCount":I
    goto :goto_34

    .line 371
    .end local v10    # "connection":Ljava/net/HttpURLConnection;
    .end local v11    # "location":Ljava/lang/String;
    .end local v13    # "redirectCount":I
    .end local v14    # "responseCode":I
    .restart local v12    # "redirectCount":I
    :cond_6f
    new-instance v1, Ljava/net/NoRouteToHostException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Too many redirects: "

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v1, v9}, Ljava/net/NoRouteToHostException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private makeConnection(Ljava/net/URL;[BJJZZ)Ljava/net/HttpURLConnection;
    .registers 20
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "postBody"    # [B
    .param p3, "position"    # J
    .param p5, "length"    # J
    .param p7, "allowGzip"    # Z
    .param p8, "followRedirects"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 386
    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 387
    .local v1, "connection":Ljava/net/HttpURLConnection;
    iget v6, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->connectTimeoutMillis:I

    invoke-virtual {v1, v6}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 388
    iget v6, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->readTimeoutMillis:I

    invoke-virtual {v1, v6}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 389
    iget-object v8, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->requestProperties:Ljava/util/HashMap;

    monitor-enter v8

    .line 390
    :try_start_13
    iget-object v6, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->requestProperties:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 391
    .local v4, "property":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v1, v6, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1d

    .line 393
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v4    # "property":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :catchall_39
    move-exception v6

    monitor-exit v8
    :try_end_3b
    .catchall {:try_start_13 .. :try_end_3b} :catchall_39

    throw v6

    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_3c
    :try_start_3c
    monitor-exit v8
    :try_end_3d
    .catchall {:try_start_3c .. :try_end_3d} :catchall_39

    .line 394
    const-wide/16 v6, 0x0

    cmp-long v6, p3, v6

    if-nez v6, :cond_49

    const-wide/16 v6, -0x1

    cmp-long v6, p5, v6

    if-eqz v6, :cond_83

    .line 395
    :cond_49
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "bytes="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "-"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 396
    .local v5, "rangeRequest":Ljava/lang/String;
    const-wide/16 v6, -0x1

    cmp-long v6, p5, v6

    if-eqz v6, :cond_7e

    .line 397
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    add-long v7, p3, p5

    const-wide/16 v9, 0x1

    sub-long/2addr v7, v9

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 399
    :cond_7e
    const-string v6, "Range"

    invoke-virtual {v1, v6, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 401
    .end local v5    # "rangeRequest":Ljava/lang/String;
    :cond_83
    const-string v6, "User-Agent"

    iget-object v7, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->userAgent:Ljava/lang/String;

    invoke-virtual {v1, v6, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 402
    if-nez p7, :cond_93

    .line 403
    const-string v6, "Accept-Encoding"

    const-string v7, "identity"

    invoke-virtual {v1, v6, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 405
    :cond_93
    move/from16 v0, p8

    invoke-virtual {v1, v0}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 406
    if-eqz p2, :cond_b2

    const/4 v6, 0x1

    :goto_9b
    invoke-virtual {v1, v6}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 407
    if-eqz p2, :cond_b4

    .line 408
    array-length v6, p2

    invoke-virtual {v1, v6}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 409
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->connect()V

    .line 410
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    .line 411
    .local v3, "os":Ljava/io/OutputStream;
    invoke-virtual {v3, p2}, Ljava/io/OutputStream;->write([B)V

    .line 412
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 416
    .end local v3    # "os":Ljava/io/OutputStream;
    :goto_b1
    return-object v1

    .line 406
    :cond_b2
    const/4 v6, 0x0

    goto :goto_9b

    .line 414
    :cond_b4
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->connect()V

    goto :goto_b1
.end method

.method private readInternal([BII)I
    .registers 14
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "readLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, -0x1

    const/4 v1, -0x1

    .line 545
    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesToRead:J

    cmp-long v2, v2, v8

    if-nez v2, :cond_d

    .line 547
    :goto_9
    if-nez p3, :cond_19

    move v0, v1

    .line 565
    :cond_c
    :goto_c
    return v0

    .line 545
    :cond_d
    int-to-long v2, p3

    iget-wide v4, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesToRead:J

    iget-wide v6, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesRead:J

    sub-long/2addr v4, v6

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int p3, v2

    goto :goto_9

    .line 552
    :cond_19
    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 553
    .local v0, "read":I
    if-ne v0, v1, :cond_37

    .line 554
    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesToRead:J

    cmp-long v2, v2, v8

    if-eqz v2, :cond_35

    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesToRead:J

    iget-wide v4, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesRead:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_35

    .line 556
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    :cond_35
    move v0, v1

    .line 558
    goto :goto_c

    .line 561
    :cond_37
    iget-wide v1, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesRead:J

    int-to-long v3, v0

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesRead:J

    .line 562
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    if-eqz v1, :cond_c

    .line 563
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    invoke-interface {v1, v0}, Lcom/google/android/exoplayer/upstream/TransferListener;->onBytesTransferred(I)V

    goto :goto_c
.end method

.method private skipInternal()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 501
    iget-wide v3, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesSkipped:J

    iget-wide v5, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesToSkip:J

    cmp-long v3, v3, v5

    if-nez v3, :cond_9

    .line 528
    :goto_8
    return-void

    .line 506
    :cond_9
    sget-object v3, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->skipBufferReference:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    .line 507
    .local v2, "skipBuffer":[B
    if-nez v2, :cond_18

    .line 508
    const/16 v3, 0x1000

    new-array v2, v3, [B

    .line 511
    :cond_18
    :goto_18
    iget-wide v3, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesSkipped:J

    iget-wide v5, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesToSkip:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_58

    .line 512
    iget-wide v3, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesToSkip:J

    iget-wide v5, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesSkipped:J

    sub-long/2addr v3, v5

    array-length v5, v2

    int-to-long v5, v5

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int v1, v3

    .line 513
    .local v1, "readLength":I
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->inputStream:Ljava/io/InputStream;

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 514
    .local v0, "read":I
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v3

    if-eqz v3, :cond_3f

    .line 515
    new-instance v3, Ljava/io/InterruptedIOException;

    invoke-direct {v3}, Ljava/io/InterruptedIOException;-><init>()V

    throw v3

    .line 517
    :cond_3f
    const/4 v3, -0x1

    if-ne v0, v3, :cond_48

    .line 518
    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3

    .line 520
    :cond_48
    iget-wide v3, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesSkipped:J

    int-to-long v5, v0

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesSkipped:J

    .line 521
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    if-eqz v3, :cond_18

    .line 522
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    invoke-interface {v3, v0}, Lcom/google/android/exoplayer/upstream/TransferListener;->onBytesTransferred(I)V

    goto :goto_18

    .line 527
    .end local v0    # "read":I
    .end local v1    # "readLength":I
    :cond_58
    sget-object v3, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->skipBufferReference:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    goto :goto_8
.end method


# virtual methods
.method protected final bytesRead()J
    .registers 3

    .prologue
    .line 313
    iget-wide v0, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesRead:J

    return-wide v0
.end method

.method protected final bytesRemaining()J
    .registers 5

    .prologue
    .line 325
    iget-wide v0, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesToRead:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_b

    iget-wide v0, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesToRead:J

    :goto_a
    return-wide v0

    :cond_b
    iget-wide v0, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesToRead:J

    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesRead:J

    sub-long/2addr v0, v2

    goto :goto_a
.end method

.method protected final bytesSkipped()J
    .registers 3

    .prologue
    .line 303
    iget-wide v0, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesSkipped:J

    return-wide v0
.end method

.method public clearAllRequestProperties()V
    .registers 3

    .prologue
    .line 180
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->requestProperties:Ljava/util/HashMap;

    monitor-enter v1

    .line 181
    :try_start_3
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->requestProperties:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 182
    monitor-exit v1

    .line 183
    return-void

    .line 182
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public clearRequestProperty(Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 172
    invoke-static {p1}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->requestProperties:Ljava/util/HashMap;

    monitor-enter v1

    .line 174
    :try_start_6
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->requestProperties:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    monitor-exit v1

    .line 176
    return-void

    .line 175
    :catchall_d
    move-exception v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_6 .. :try_end_f} :catchall_d

    throw v0
.end method

.method public close()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 267
    :try_start_2
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->inputStream:Ljava/io/InputStream;

    if-eqz v1, :cond_14

    .line 268
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {p0}, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesRemaining()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/google/android/exoplayer/util/Util;->maybeTerminateInputStream(Ljava/net/HttpURLConnection;J)V
    :try_end_f
    .catchall {:try_start_2 .. :try_end_f} :catchall_32

    .line 270
    :try_start_f
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_14} :catch_29
    .catchall {:try_start_f .. :try_end_14} :catchall_32

    .line 276
    :cond_14
    iput-object v5, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->inputStream:Ljava/io/InputStream;

    .line 277
    invoke-direct {p0}, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->closeConnectionQuietly()V

    .line 278
    iget-boolean v1, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->opened:Z

    if-eqz v1, :cond_28

    .line 279
    iput-boolean v4, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->opened:Z

    .line 280
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    if-eqz v1, :cond_28

    .line 281
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    invoke-interface {v1}, Lcom/google/android/exoplayer/upstream/TransferListener;->onTransferEnd()V

    .line 285
    :cond_28
    return-void

    .line 271
    :catch_29
    move-exception v0

    .line 272
    .local v0, "e":Ljava/io/IOException;
    :try_start_2a
    new-instance v1, Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;

    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    invoke-direct {v1, v0, v2}, Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;-><init>(Ljava/io/IOException;Lcom/google/android/exoplayer/upstream/DataSpec;)V

    throw v1
    :try_end_32
    .catchall {:try_start_2a .. :try_end_32} :catchall_32

    .line 276
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_32
    move-exception v1

    iput-object v5, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->inputStream:Ljava/io/InputStream;

    .line 277
    invoke-direct {p0}, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->closeConnectionQuietly()V

    .line 278
    iget-boolean v2, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->opened:Z

    if-eqz v2, :cond_47

    .line 279
    iput-boolean v4, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->opened:Z

    .line 280
    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    if-eqz v2, :cond_47

    .line 281
    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    invoke-interface {v2}, Lcom/google/android/exoplayer/upstream/TransferListener;->onTransferEnd()V

    :cond_47
    throw v1
.end method

.method protected final getConnection()Ljava/net/HttpURLConnection;
    .registers 2

    .prologue
    .line 293
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    return-object v0
.end method

.method public getResponseHeaders()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 158
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v0

    goto :goto_5
.end method

.method public getUri()Ljava/lang/String;
    .registers 2

    .prologue
    .line 153
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_5
.end method

.method public open(Lcom/google/android/exoplayer/upstream/DataSpec;)J
    .registers 14
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;
        }
    .end annotation

    .prologue
    const/16 v11, 0xc8

    const-wide/16 v8, -0x1

    const-wide/16 v6, 0x0

    .line 187
    iput-object p1, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    .line 188
    iput-wide v6, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesRead:J

    .line 189
    iput-wide v6, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesSkipped:J

    .line 191
    :try_start_c
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->makeConnection(Lcom/google/android/exoplayer/upstream/DataSpec;)Ljava/net/HttpURLConnection;

    move-result-object v10

    iput-object v10, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_12} :catch_2d

    .line 199
    :try_start_12
    iget-object v10, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_17} :catch_4d

    move-result v5

    .line 207
    .local v5, "responseCode":I
    if-lt v5, v11, :cond_1e

    const/16 v10, 0x12b

    if-le v5, v10, :cond_70

    .line 208
    :cond_1e
    iget-object v6, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v4

    .line 209
    .local v4, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-direct {p0}, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->closeConnectionQuietly()V

    .line 210
    new-instance v6, Lcom/google/android/exoplayer/upstream/HttpDataSource$InvalidResponseCodeException;

    invoke-direct {v6, v5, v4, p1}, Lcom/google/android/exoplayer/upstream/HttpDataSource$InvalidResponseCodeException;-><init>(ILjava/util/Map;Lcom/google/android/exoplayer/upstream/DataSpec;)V

    throw v6

    .line 192
    .end local v4    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v5    # "responseCode":I
    :catch_2d
    move-exception v3

    .line 193
    .local v3, "e":Ljava/io/IOException;
    new-instance v6, Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unable to connect to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v8}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v3, p1}, Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;-><init>(Ljava/lang/String;Ljava/io/IOException;Lcom/google/android/exoplayer/upstream/DataSpec;)V

    throw v6

    .line 200
    .end local v3    # "e":Ljava/io/IOException;
    :catch_4d
    move-exception v3

    .line 201
    .restart local v3    # "e":Ljava/io/IOException;
    invoke-direct {p0}, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->closeConnectionQuietly()V

    .line 202
    new-instance v6, Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unable to connect to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v8}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v3, p1}, Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;-><init>(Ljava/lang/String;Ljava/io/IOException;Lcom/google/android/exoplayer/upstream/DataSpec;)V

    throw v6

    .line 214
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v5    # "responseCode":I
    :cond_70
    iget-object v10, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v2

    .line 215
    .local v2, "contentType":Ljava/lang/String;
    iget-object v10, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->contentTypePredicate:Lcom/google/android/exoplayer/util/Predicate;

    if-eqz v10, :cond_8b

    iget-object v10, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->contentTypePredicate:Lcom/google/android/exoplayer/util/Predicate;

    invoke-interface {v10, v2}, Lcom/google/android/exoplayer/util/Predicate;->evaluate(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_8b

    .line 216
    invoke-direct {p0}, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->closeConnectionQuietly()V

    .line 217
    new-instance v6, Lcom/google/android/exoplayer/upstream/HttpDataSource$InvalidContentTypeException;

    invoke-direct {v6, v2, p1}, Lcom/google/android/exoplayer/upstream/HttpDataSource$InvalidContentTypeException;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer/upstream/DataSpec;)V

    throw v6

    .line 223
    :cond_8b
    if-ne v5, v11, :cond_95

    iget-wide v10, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->position:J

    cmp-long v10, v10, v6

    if-eqz v10, :cond_95

    iget-wide v6, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->position:J

    :cond_95
    iput-wide v6, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesToSkip:J

    .line 226
    iget v6, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->flags:I

    and-int/lit8 v6, v6, 0x1

    if-nez v6, :cond_cf

    .line 227
    iget-object v6, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    invoke-static {v6}, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->getContentLength(Ljava/net/HttpURLConnection;)J

    move-result-wide v0

    .line 228
    .local v0, "contentLength":J
    iget-wide v6, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    cmp-long v6, v6, v8

    if-eqz v6, :cond_c4

    iget-wide v6, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    :goto_ab
    iput-wide v6, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesToRead:J

    .line 240
    .end local v0    # "contentLength":J
    :goto_ad
    :try_start_ad
    iget-object v6, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    iput-object v6, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->inputStream:Ljava/io/InputStream;
    :try_end_b5
    .catch Ljava/io/IOException; {:try_start_ad .. :try_end_b5} :catch_d4

    .line 246
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->opened:Z

    .line 247
    iget-object v6, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    if-eqz v6, :cond_c1

    .line 248
    iget-object v6, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    invoke-interface {v6}, Lcom/google/android/exoplayer/upstream/TransferListener;->onTransferStart()V

    .line 251
    :cond_c1
    iget-wide v6, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesToRead:J

    return-wide v6

    .line 228
    .restart local v0    # "contentLength":J
    :cond_c4
    cmp-long v6, v0, v8

    if-eqz v6, :cond_cd

    iget-wide v6, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesToSkip:J

    sub-long v6, v0, v6

    goto :goto_ab

    :cond_cd
    move-wide v6, v8

    goto :goto_ab

    .line 236
    .end local v0    # "contentLength":J
    :cond_cf
    iget-wide v6, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    iput-wide v6, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->bytesToRead:J

    goto :goto_ad

    .line 241
    :catch_d4
    move-exception v3

    .line 242
    .restart local v3    # "e":Ljava/io/IOException;
    invoke-direct {p0}, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->closeConnectionQuietly()V

    .line 243
    new-instance v6, Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;

    invoke-direct {v6, v3, p1}, Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;-><init>(Ljava/io/IOException;Lcom/google/android/exoplayer/upstream/DataSpec;)V

    throw v6
.end method

.method public read([BII)I
    .registers 7
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "readLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;
        }
    .end annotation

    .prologue
    .line 257
    :try_start_0
    invoke-direct {p0}, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->skipInternal()V

    .line 258
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->readInternal([BII)I
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_6} :catch_8

    move-result v1

    return v1

    .line 259
    :catch_8
    move-exception v0

    .line 260
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;

    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    invoke-direct {v1, v0, v2}, Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;-><init>(Ljava/io/IOException;Lcom/google/android/exoplayer/upstream/DataSpec;)V

    throw v1
.end method

.method public setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 163
    invoke-static {p1}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    invoke-static {p2}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->requestProperties:Ljava/util/HashMap;

    monitor-enter v1

    .line 166
    :try_start_9
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/DefaultHttpDataSource;->requestProperties:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    monitor-exit v1

    .line 168
    return-void

    .line 167
    :catchall_10
    move-exception v0

    monitor-exit v1
    :try_end_12
    .catchall {:try_start_9 .. :try_end_12} :catchall_10

    throw v0
.end method
