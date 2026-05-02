.class final Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;
.super Ljava/lang/Object;
.source "Spdy3.java"

# interfaces
.implements Lcom/koushikdutta/async/http/spdy/FrameReader;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/async/http/spdy/Spdy3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Reader"
.end annotation


# instance fields
.field private final client:Z

.field private final emitter:Lcom/koushikdutta/async/DataEmitter;

.field private final emptyList:Lcom/koushikdutta/async/ByteBufferList;

.field flags:I

.field private final handler:Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;

.field private final headerReader:Lcom/koushikdutta/async/http/spdy/HeaderReader;

.field inFinished:Z

.field length:I

.field private final onDataFrame:Lcom/koushikdutta/async/callback/DataCallback;

.field private final onFrame:Lcom/koushikdutta/async/callback/DataCallback;

.field private final onFullFrame:Lcom/koushikdutta/async/callback/DataCallback;

.field partial:Lcom/koushikdutta/async/ByteBufferList;

.field private final reader:Lcom/koushikdutta/async/DataEmitterReader;

.field streamId:I

.field w1:I

.field w2:I


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;Z)V
    .registers 5
    .param p1, "emitter"    # Lcom/koushikdutta/async/DataEmitter;
    .param p2, "handler"    # Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;
    .param p3, "client"    # Z

    .prologue
    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    new-instance v0, Lcom/koushikdutta/async/http/spdy/HeaderReader;

    invoke-direct {v0}, Lcom/koushikdutta/async/http/spdy/HeaderReader;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->headerReader:Lcom/koushikdutta/async/http/spdy/HeaderReader;

    .line 156
    new-instance v0, Lcom/koushikdutta/async/ByteBufferList;

    invoke-direct {v0}, Lcom/koushikdutta/async/ByteBufferList;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->emptyList:Lcom/koushikdutta/async/ByteBufferList;

    .line 157
    new-instance v0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;-><init>(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;)V

    iput-object v0, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->onFrame:Lcom/koushikdutta/async/callback/DataCallback;

    .line 185
    new-instance v0, Lcom/koushikdutta/async/ByteBufferList;

    invoke-direct {v0}, Lcom/koushikdutta/async/ByteBufferList;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->partial:Lcom/koushikdutta/async/ByteBufferList;

    .line 186
    new-instance v0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$3;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$3;-><init>(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;)V

    iput-object v0, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->onDataFrame:Lcom/koushikdutta/async/callback/DataCallback;

    .line 203
    new-instance v0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;-><init>(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;)V

    iput-object v0, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->onFullFrame:Lcom/koushikdutta/async/callback/DataCallback;

    .line 130
    iput-object p1, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->emitter:Lcom/koushikdutta/async/DataEmitter;

    .line 131
    iput-object p2, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->handler:Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;

    .line 132
    iput-boolean p3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->client:Z

    .line 134
    new-instance v0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$1;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$1;-><init>(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;)V

    invoke-interface {p1, v0}, Lcom/koushikdutta/async/DataEmitter;->setEndCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 141
    new-instance v0, Lcom/koushikdutta/async/DataEmitterReader;

    invoke-direct {v0}, Lcom/koushikdutta/async/DataEmitterReader;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->reader:Lcom/koushikdutta/async/DataEmitterReader;

    .line 142
    invoke-direct {p0}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->parseFrameHeader()V

    .line 143
    return-void
.end method

.method static synthetic access$000(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;)Lcom/koushikdutta/async/callback/DataCallback;
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    .prologue
    .line 122
    iget-object v0, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->onDataFrame:Lcom/koushikdutta/async/callback/DataCallback;

    return-object v0
.end method

.method static synthetic access$100(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;)Lcom/koushikdutta/async/ByteBufferList;
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    .prologue
    .line 122
    iget-object v0, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->emptyList:Lcom/koushikdutta/async/ByteBufferList;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;Lcom/koushikdutta/async/ByteBufferList;II)V
    .registers 4
    .param p0, "x0"    # Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;
    .param p1, "x1"    # Lcom/koushikdutta/async/ByteBufferList;
    .param p2, "x2"    # I
    .param p3, "x3"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 122
    invoke-direct {p0, p1, p2, p3}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->readPing(Lcom/koushikdutta/async/ByteBufferList;II)V

    return-void
.end method

.method static synthetic access$1100(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;Lcom/koushikdutta/async/ByteBufferList;II)V
    .registers 4
    .param p0, "x0"    # Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;
    .param p1, "x1"    # Lcom/koushikdutta/async/ByteBufferList;
    .param p2, "x2"    # I
    .param p3, "x3"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 122
    invoke-direct {p0, p1, p2, p3}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->readGoAway(Lcom/koushikdutta/async/ByteBufferList;II)V

    return-void
.end method

.method static synthetic access$1200(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;Lcom/koushikdutta/async/ByteBufferList;II)V
    .registers 4
    .param p0, "x0"    # Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;
    .param p1, "x1"    # Lcom/koushikdutta/async/ByteBufferList;
    .param p2, "x2"    # I
    .param p3, "x3"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 122
    invoke-direct {p0, p1, p2, p3}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->readHeaders(Lcom/koushikdutta/async/ByteBufferList;II)V

    return-void
.end method

.method static synthetic access$1300(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;Lcom/koushikdutta/async/ByteBufferList;II)V
    .registers 4
    .param p0, "x0"    # Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;
    .param p1, "x1"    # Lcom/koushikdutta/async/ByteBufferList;
    .param p2, "x2"    # I
    .param p3, "x3"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 122
    invoke-direct {p0, p1, p2, p3}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->readWindowUpdate(Lcom/koushikdutta/async/ByteBufferList;II)V

    return-void
.end method

.method static synthetic access$200(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;)Lcom/koushikdutta/async/callback/DataCallback;
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    .prologue
    .line 122
    iget-object v0, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->onFullFrame:Lcom/koushikdutta/async/callback/DataCallback;

    return-object v0
.end method

.method static synthetic access$300(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;)Lcom/koushikdutta/async/DataEmitterReader;
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    .prologue
    .line 122
    iget-object v0, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->reader:Lcom/koushikdutta/async/DataEmitterReader;

    return-object v0
.end method

.method static synthetic access$400(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;)Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    .prologue
    .line 122
    iget-object v0, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->handler:Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;

    return-object v0
.end method

.method static synthetic access$500(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;)V
    .registers 1
    .param p0, "x0"    # Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    .prologue
    .line 122
    invoke-direct {p0}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->parseFrameHeader()V

    return-void
.end method

.method static synthetic access$600(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;Lcom/koushikdutta/async/ByteBufferList;II)V
    .registers 4
    .param p0, "x0"    # Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;
    .param p1, "x1"    # Lcom/koushikdutta/async/ByteBufferList;
    .param p2, "x2"    # I
    .param p3, "x3"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 122
    invoke-direct {p0, p1, p2, p3}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->readSynStream(Lcom/koushikdutta/async/ByteBufferList;II)V

    return-void
.end method

.method static synthetic access$700(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;Lcom/koushikdutta/async/ByteBufferList;II)V
    .registers 4
    .param p0, "x0"    # Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;
    .param p1, "x1"    # Lcom/koushikdutta/async/ByteBufferList;
    .param p2, "x2"    # I
    .param p3, "x3"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 122
    invoke-direct {p0, p1, p2, p3}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->readSynReply(Lcom/koushikdutta/async/ByteBufferList;II)V

    return-void
.end method

.method static synthetic access$800(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;Lcom/koushikdutta/async/ByteBufferList;II)V
    .registers 4
    .param p0, "x0"    # Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;
    .param p1, "x1"    # Lcom/koushikdutta/async/ByteBufferList;
    .param p2, "x2"    # I
    .param p3, "x3"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 122
    invoke-direct {p0, p1, p2, p3}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->readRstStream(Lcom/koushikdutta/async/ByteBufferList;II)V

    return-void
.end method

.method static synthetic access$900(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;Lcom/koushikdutta/async/ByteBufferList;II)V
    .registers 4
    .param p0, "x0"    # Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;
    .param p1, "x1"    # Lcom/koushikdutta/async/ByteBufferList;
    .param p2, "x2"    # I
    .param p3, "x3"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 122
    invoke-direct {p0, p1, p2, p3}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->readSettings(Lcom/koushikdutta/async/ByteBufferList;II)V

    return-void
.end method

.method private static varargs ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    .registers 4
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 354
    new-instance v0, Ljava/io/IOException;

    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private parseFrameHeader()V
    .registers 4

    .prologue
    .line 146
    iget-object v0, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->emitter:Lcom/koushikdutta/async/DataEmitter;

    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->reader:Lcom/koushikdutta/async/DataEmitterReader;

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/DataEmitter;->setDataCallback(Lcom/koushikdutta/async/callback/DataCallback;)V

    .line 147
    iget-object v0, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->reader:Lcom/koushikdutta/async/DataEmitterReader;

    const/16 v1, 0x8

    iget-object v2, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->onFrame:Lcom/koushikdutta/async/callback/DataCallback;

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/async/DataEmitterReader;->read(ILcom/koushikdutta/async/callback/DataCallback;)V

    .line 148
    return-void
.end method

.method private readGoAway(Lcom/koushikdutta/async/ByteBufferList;II)V
    .registers 11
    .param p1, "source"    # Lcom/koushikdutta/async/ByteBufferList;
    .param p2, "flags"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 326
    const/16 v3, 0x8

    if-eq p3, v3, :cond_15

    const-string v3, "TYPE_GOAWAY length: %d != 8"

    new-array v4, v5, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v3

    throw v3

    .line 327
    :cond_15
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->getInt()I

    move-result v3

    const v4, 0x7fffffff

    and-int v2, v3, v4

    .line 328
    .local v2, "lastGoodStreamId":I
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->getInt()I

    move-result v1

    .line 329
    .local v1, "errorCodeInt":I
    invoke-static {v1}, Lcom/koushikdutta/async/http/spdy/ErrorCode;->fromSpdyGoAway(I)Lcom/koushikdutta/async/http/spdy/ErrorCode;

    move-result-object v0

    .line 330
    .local v0, "errorCode":Lcom/koushikdutta/async/http/spdy/ErrorCode;
    if-nez v0, :cond_37

    .line 331
    const-string v3, "TYPE_GOAWAY unexpected error code: %d"

    new-array v4, v5, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v3

    throw v3

    .line 333
    :cond_37
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->handler:Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;

    sget-object v4, Lcom/koushikdutta/async/http/spdy/ByteString;->EMPTY:Lcom/koushikdutta/async/http/spdy/ByteString;

    invoke-interface {v3, v2, v0, v4}, Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;->goAway(ILcom/koushikdutta/async/http/spdy/ErrorCode;Lcom/koushikdutta/async/http/spdy/ByteString;)V

    .line 334
    return-void
.end method

.method private readHeaders(Lcom/koushikdutta/async/ByteBufferList;II)V
    .registers 12
    .param p1, "source"    # Lcom/koushikdutta/async/ByteBufferList;
    .param p2, "flags"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 302
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->getInt()I

    move-result v7

    .line 303
    .local v7, "w1":I
    const v0, 0x7fffffff

    and-int v3, v7, v0

    .line 304
    .local v3, "streamId":I
    iget-object v0, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->headerReader:Lcom/koushikdutta/async/http/spdy/HeaderReader;

    add-int/lit8 v2, p3, -0x4

    invoke-virtual {v0, p1, v2}, Lcom/koushikdutta/async/http/spdy/HeaderReader;->readHeader(Lcom/koushikdutta/async/ByteBufferList;I)Ljava/util/List;

    move-result-object v5

    .line 305
    .local v5, "headerBlock":Ljava/util/List;, "Ljava/util/List<Lcom/koushikdutta/async/http/spdy/Header;>;"
    iget-object v0, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->handler:Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;

    const/4 v4, -0x1

    sget-object v6, Lcom/koushikdutta/async/http/spdy/HeadersMode;->SPDY_HEADERS:Lcom/koushikdutta/async/http/spdy/HeadersMode;

    move v2, v1

    invoke-interface/range {v0 .. v6}, Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;->headers(ZZIILjava/util/List;Lcom/koushikdutta/async/http/spdy/HeadersMode;)V

    .line 306
    return-void
.end method

.method private readPing(Lcom/koushikdutta/async/ByteBufferList;II)V
    .registers 10
    .param p1, "source"    # Lcom/koushikdutta/async/ByteBufferList;
    .param p2, "flags"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    const/4 v2, 0x0

    .line 319
    const/4 v3, 0x4

    if-eq p3, v3, :cond_14

    const-string v3, "TYPE_PING length: %d != 4"

    new-array v4, v0, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v2

    invoke-static {v3, v4}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 320
    :cond_14
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->getInt()I

    move-result v1

    .line 321
    .local v1, "id":I
    iget-boolean v4, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->client:Z

    and-int/lit8 v3, v1, 0x1

    if-ne v3, v0, :cond_27

    move v3, v0

    :goto_1f
    if-ne v4, v3, :cond_29

    .line 322
    .local v0, "ack":Z
    :goto_21
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->handler:Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;

    invoke-interface {v3, v0, v1, v2}, Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;->ping(ZII)V

    .line 323
    return-void

    .end local v0    # "ack":Z
    :cond_27
    move v3, v2

    .line 321
    goto :goto_1f

    :cond_29
    move v0, v2

    goto :goto_21
.end method

.method private readRstStream(Lcom/koushikdutta/async/ByteBufferList;II)V
    .registers 11
    .param p1, "source"    # Lcom/koushikdutta/async/ByteBufferList;
    .param p2, "flags"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 291
    const/16 v3, 0x8

    if-eq p3, v3, :cond_15

    const-string v3, "TYPE_RST_STREAM length: %d != 8"

    new-array v4, v5, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v3

    throw v3

    .line 292
    :cond_15
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->getInt()I

    move-result v3

    const v4, 0x7fffffff

    and-int v2, v3, v4

    .line 293
    .local v2, "streamId":I
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->getInt()I

    move-result v1

    .line 294
    .local v1, "errorCodeInt":I
    invoke-static {v1}, Lcom/koushikdutta/async/http/spdy/ErrorCode;->fromSpdy3Rst(I)Lcom/koushikdutta/async/http/spdy/ErrorCode;

    move-result-object v0

    .line 295
    .local v0, "errorCode":Lcom/koushikdutta/async/http/spdy/ErrorCode;
    if-nez v0, :cond_37

    .line 296
    const-string v3, "TYPE_RST_STREAM unexpected error code: %d"

    new-array v4, v5, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v3

    throw v3

    .line 298
    :cond_37
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->handler:Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;

    invoke-interface {v3, v2, v0}, Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;->rstStream(ILcom/koushikdutta/async/http/spdy/ErrorCode;)V

    .line 299
    return-void
.end method

.method private readSettings(Lcom/koushikdutta/async/ByteBufferList;II)V
    .registers 16
    .param p1, "source"    # Lcom/koushikdutta/async/ByteBufferList;
    .param p2, "flags"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    const/4 v8, 0x0

    .line 337
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->getInt()I

    move-result v4

    .line 338
    .local v4, "numberOfEntries":I
    mul-int/lit8 v9, v4, 0x8

    add-int/lit8 v9, v9, 0x4

    if-eq p3, v9, :cond_22

    .line 339
    const-string v9, "TYPE_SETTINGS length: %d != 4 + 8 * %d"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v8

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v10, v0

    invoke-static {v9, v10}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v8

    throw v8

    .line 341
    :cond_22
    new-instance v5, Lcom/koushikdutta/async/http/spdy/Settings;

    invoke-direct {v5}, Lcom/koushikdutta/async/http/spdy/Settings;-><init>()V

    .line 342
    .local v5, "settings":Lcom/koushikdutta/async/http/spdy/Settings;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_28
    if-ge v1, v4, :cond_42

    .line 343
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->getInt()I

    move-result v7

    .line 344
    .local v7, "w1":I
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->getInt()I

    move-result v6

    .line 345
    .local v6, "value":I
    const/high16 v9, -0x1000000

    and-int/2addr v9, v7

    ushr-int/lit8 v3, v9, 0x18

    .line 346
    .local v3, "idFlags":I
    const v9, 0xffffff

    and-int v2, v7, v9

    .line 347
    .local v2, "id":I
    invoke-virtual {v5, v2, v3, v6}, Lcom/koushikdutta/async/http/spdy/Settings;->set(III)Lcom/koushikdutta/async/http/spdy/Settings;

    .line 342
    add-int/lit8 v1, v1, 0x1

    goto :goto_28

    .line 349
    .end local v2    # "id":I
    .end local v3    # "idFlags":I
    .end local v6    # "value":I
    .end local v7    # "w1":I
    :cond_42
    and-int/lit8 v9, p2, 0x1

    if-eqz v9, :cond_4c

    .line 350
    .local v0, "clearPrevious":Z
    :goto_46
    iget-object v8, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->handler:Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;

    invoke-interface {v8, v0, v5}, Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;->settings(ZLcom/koushikdutta/async/http/spdy/Settings;)V

    .line 351
    return-void

    .end local v0    # "clearPrevious":Z
    :cond_4c
    move v0, v8

    .line 349
    goto :goto_46
.end method

.method private readSynReply(Lcom/koushikdutta/async/ByteBufferList;II)V
    .registers 12
    .param p1, "source"    # Lcom/koushikdutta/async/ByteBufferList;
    .param p2, "flags"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 283
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->getInt()I

    move-result v7

    .line 284
    .local v7, "w1":I
    const v0, 0x7fffffff

    and-int v3, v7, v0

    .line 285
    .local v3, "streamId":I
    iget-object v0, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->headerReader:Lcom/koushikdutta/async/http/spdy/HeaderReader;

    add-int/lit8 v4, p3, -0x4

    invoke-virtual {v0, p1, v4}, Lcom/koushikdutta/async/http/spdy/HeaderReader;->readHeader(Lcom/koushikdutta/async/ByteBufferList;I)Ljava/util/List;

    move-result-object v5

    .line 286
    .local v5, "headerBlock":Ljava/util/List;, "Ljava/util/List<Lcom/koushikdutta/async/http/spdy/Header;>;"
    and-int/lit8 v0, p2, 0x1

    if-eqz v0, :cond_20

    const/4 v2, 0x1

    .line 287
    .local v2, "inFinished":Z
    :goto_17
    iget-object v0, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->handler:Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;

    const/4 v4, -0x1

    sget-object v6, Lcom/koushikdutta/async/http/spdy/HeadersMode;->SPDY_REPLY:Lcom/koushikdutta/async/http/spdy/HeadersMode;

    invoke-interface/range {v0 .. v6}, Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;->headers(ZZIILjava/util/List;Lcom/koushikdutta/async/http/spdy/HeadersMode;)V

    .line 288
    return-void

    .end local v2    # "inFinished":Z
    :cond_20
    move v2, v1

    .line 286
    goto :goto_17
.end method

.method private readSynStream(Lcom/koushikdutta/async/ByteBufferList;II)V
    .registers 14
    .param p1, "source"    # Lcom/koushikdutta/async/ByteBufferList;
    .param p2, "flags"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const v6, 0x7fffffff

    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 269
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->getInt()I

    move-result v7

    .line 270
    .local v7, "w1":I
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->getInt()I

    move-result v8

    .line 271
    .local v8, "w2":I
    and-int v3, v7, v6

    .line 272
    .local v3, "streamId":I
    and-int v4, v8, v6

    .line 273
    .local v4, "associatedStreamId":I
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->getShort()S

    .line 274
    iget-object v6, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->headerReader:Lcom/koushikdutta/async/http/spdy/HeaderReader;

    add-int/lit8 v9, p3, -0xa

    invoke-virtual {v6, p1, v9}, Lcom/koushikdutta/async/http/spdy/HeaderReader;->readHeader(Lcom/koushikdutta/async/ByteBufferList;I)Ljava/util/List;

    move-result-object v5

    .line 276
    .local v5, "headerBlock":Ljava/util/List;, "Ljava/util/List<Lcom/koushikdutta/async/http/spdy/Header;>;"
    and-int/lit8 v6, p2, 0x1

    if-eqz v6, :cond_2d

    move v2, v1

    .line 277
    .local v2, "inFinished":Z
    :goto_21
    and-int/lit8 v6, p2, 0x2

    if-eqz v6, :cond_2f

    .line 278
    .local v1, "outFinished":Z
    :goto_25
    iget-object v0, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->handler:Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;

    sget-object v6, Lcom/koushikdutta/async/http/spdy/HeadersMode;->SPDY_SYN_STREAM:Lcom/koushikdutta/async/http/spdy/HeadersMode;

    invoke-interface/range {v0 .. v6}, Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;->headers(ZZIILjava/util/List;Lcom/koushikdutta/async/http/spdy/HeadersMode;)V

    .line 280
    return-void

    .end local v1    # "outFinished":Z
    .end local v2    # "inFinished":Z
    :cond_2d
    move v2, v0

    .line 276
    goto :goto_21

    .restart local v2    # "inFinished":Z
    :cond_2f
    move v1, v0

    .line 277
    goto :goto_25
.end method

.method private readWindowUpdate(Lcom/koushikdutta/async/ByteBufferList;II)V
    .registers 13
    .param p1, "source"    # Lcom/koushikdutta/async/ByteBufferList;
    .param p2, "flags"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const v6, 0x7fffffff

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 309
    const/16 v5, 0x8

    if-eq p3, v5, :cond_18

    const-string v5, "TYPE_WINDOW_UPDATE length: %d != 8"

    new-array v6, v7, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v5

    throw v5

    .line 310
    :cond_18
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->getInt()I

    move-result v3

    .line 311
    .local v3, "w1":I
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->getInt()I

    move-result v4

    .line 312
    .local v4, "w2":I
    and-int v2, v3, v6

    .line 313
    .local v2, "streamId":I
    and-int v5, v4, v6

    int-to-long v0, v5

    .line 314
    .local v0, "increment":J
    const-wide/16 v5, 0x0

    cmp-long v5, v0, v5

    if-nez v5, :cond_3a

    const-string v5, "windowSizeIncrement was 0"

    new-array v6, v7, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v5

    throw v5

    .line 315
    :cond_3a
    iget-object v5, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->handler:Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;

    invoke-interface {v5, v2, v0, v1}, Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;->windowUpdate(IJ)V

    .line 316
    return-void
.end method
