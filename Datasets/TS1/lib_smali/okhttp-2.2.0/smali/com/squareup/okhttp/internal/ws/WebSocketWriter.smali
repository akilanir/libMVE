.class public final Lcom/squareup/okhttp/internal/ws/WebSocketWriter;
.super Ljava/lang/Object;
.source "WebSocketWriter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/internal/ws/WebSocketWriter$FrameSink;
    }
.end annotation


# instance fields
.field private activeWriter:Z

.field private closed:Z

.field private final frameSink:Lcom/squareup/okhttp/internal/ws/WebSocketWriter$FrameSink;

.field private final isClient:Z

.field private final maskBuffer:[B

.field private final maskKey:[B

.field private final random:Ljava/util/Random;

.field private final sink:Lokio/BufferedSink;


# direct methods
.method public constructor <init>(ZLokio/BufferedSink;Ljava/util/Random;)V
    .registers 6
    .param p1, "isClient"    # Z
    .param p2, "sink"    # Lokio/BufferedSink;
    .param p3, "random"    # Ljava/util/Random;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter$FrameSink;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/squareup/okhttp/internal/ws/WebSocketWriter$FrameSink;-><init>(Lcom/squareup/okhttp/internal/ws/WebSocketWriter;Lcom/squareup/okhttp/internal/ws/WebSocketWriter$1;)V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->frameSink:Lcom/squareup/okhttp/internal/ws/WebSocketWriter$FrameSink;

    .line 61
    const/4 v0, 0x4

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->maskKey:[B

    .line 62
    const/16 v0, 0x800

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->maskBuffer:[B

    .line 65
    if-nez p2, :cond_20

    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "sink"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 66
    :cond_20
    if-nez p3, :cond_2a

    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "random"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 67
    :cond_2a
    iput-boolean p1, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->isClient:Z

    .line 68
    iput-object p2, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    .line 69
    iput-object p3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->random:Ljava/util/Random;

    .line 70
    return-void
.end method

.method static synthetic access$300(Lcom/squareup/okhttp/internal/ws/WebSocketWriter;Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;Lokio/Buffer;JZZ)V
    .registers 7
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/ws/WebSocketWriter;
    .param p1, "x1"    # Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;
    .param p2, "x2"    # Lokio/Buffer;
    .param p3, "x3"    # J
    .param p5, "x4"    # Z
    .param p6, "x5"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    invoke-direct/range {p0 .. p6}, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->writeFrame(Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;Lokio/Buffer;JZZ)V

    return-void
.end method

.method static synthetic access$400(Lcom/squareup/okhttp/internal/ws/WebSocketWriter;)Lokio/BufferedSink;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/ws/WebSocketWriter;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    return-object v0
.end method

.method static synthetic access$500(Lcom/squareup/okhttp/internal/ws/WebSocketWriter;)Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/ws/WebSocketWriter;

    .prologue
    .line 50
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->isClient:Z

    return v0
.end method

.method static synthetic access$600(Lcom/squareup/okhttp/internal/ws/WebSocketWriter;)[B
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/ws/WebSocketWriter;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->maskKey:[B

    return-object v0
.end method

.method static synthetic access$700(Lcom/squareup/okhttp/internal/ws/WebSocketWriter;)Ljava/util/Random;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/ws/WebSocketWriter;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->random:Ljava/util/Random;

    return-object v0
.end method

.method static synthetic access$802(Lcom/squareup/okhttp/internal/ws/WebSocketWriter;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/ws/WebSocketWriter;
    .param p1, "x1"    # Z

    .prologue
    .line 50
    iput-boolean p1, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->activeWriter:Z

    return p1
.end method

.method private writeAllMasked(Lokio/BufferedSource;J)V
    .registers 13
    .param p1, "source"    # Lokio/BufferedSource;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 251
    const-wide/16 v4, 0x0

    .line 252
    .local v4, "written":J
    :goto_3
    cmp-long v0, v4, p2

    if-gez v0, :cond_31

    .line 253
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->maskBuffer:[B

    array-length v0, v0

    int-to-long v0, v0

    invoke-static {p2, p3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v7, v0

    .line 254
    .local v7, "toRead":I
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->maskBuffer:[B

    invoke-interface {p1, v0, v8, v7}, Lokio/BufferedSource;->read([BII)I

    move-result v6

    .line 255
    .local v6, "read":I
    const/4 v0, -0x1

    if-ne v6, v0, :cond_1f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 256
    :cond_1f
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->maskBuffer:[B

    int-to-long v1, v6

    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->maskKey:[B

    invoke-static/range {v0 .. v5}, Lcom/squareup/okhttp/internal/ws/Protocol;->toggleMask([BJ[BJ)V

    .line 257
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    iget-object v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->maskBuffer:[B

    invoke-interface {v0, v1, v8, v6}, Lokio/BufferedSink;->write([BII)Lokio/BufferedSink;

    .line 258
    int-to-long v0, v6

    add-long/2addr v4, v0

    .line 259
    goto :goto_3

    .line 260
    .end local v6    # "read":I
    .end local v7    # "toRead":I
    :cond_31
    return-void
.end method

.method private writeControlFrame(ILokio/Buffer;)V
    .registers 8
    .param p1, "opcode"    # I
    .param p2, "payload"    # Lokio/Buffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    const/4 v2, 0x0

    .line 134
    .local v2, "length":I
    if-eqz p2, :cond_14

    .line 135
    invoke-virtual {p2}, Lokio/Buffer;->size()J

    move-result-wide v3

    long-to-int v2, v3

    .line 136
    const/16 v3, 0x7d

    if-le v2, v3, :cond_14

    .line 137
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Control frame payload must be less than 125B."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 142
    :cond_14
    or-int/lit16 v0, p1, 0x80

    .line 143
    .local v0, "b0":I
    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v3, v0}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 145
    move v1, v2

    .line 146
    .local v1, "b1":I
    iget-boolean v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->isClient:Z

    if-eqz v3, :cond_41

    .line 147
    or-int/lit16 v1, v1, 0x80

    .line 148
    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v3, v1}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 150
    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->random:Ljava/util/Random;

    iget-object v4, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->maskKey:[B

    invoke-virtual {v3, v4}, Ljava/util/Random;->nextBytes([B)V

    .line 151
    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    iget-object v4, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->maskKey:[B

    invoke-interface {v3, v4}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 153
    if-eqz p2, :cond_3b

    .line 154
    int-to-long v3, v2

    invoke-direct {p0, p2, v3, v4}, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->writeAllMasked(Lokio/BufferedSource;J)V

    .line 164
    :cond_3b
    :goto_3b
    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v3}, Lokio/BufferedSink;->flush()V

    .line 165
    return-void

    .line 157
    :cond_41
    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v3, v1}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 159
    if-eqz p2, :cond_3b

    .line 160
    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v3, p2}, Lokio/BufferedSink;->writeAll(Lokio/Source;)J

    goto :goto_3b
.end method

.method private writeFrame(Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;Lokio/Buffer;JZZ)V
    .registers 14
    .param p1, "payloadType"    # Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;
    .param p2, "source"    # Lokio/Buffer;
    .param p3, "byteCount"    # J
    .param p5, "isFirstFrame"    # Z
    .param p6, "isFinal"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 200
    const/4 v2, 0x0

    .line 201
    .local v2, "opcode":I
    if-eqz p5, :cond_28

    .line 202
    sget-object v3, Lcom/squareup/okhttp/internal/ws/WebSocketWriter$1;->$SwitchMap$com$squareup$okhttp$internal$ws$WebSocket$PayloadType:[I

    invoke-virtual {p1}, Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_92

    .line 210
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unknown payload type: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 204
    :pswitch_27
    const/4 v2, 0x1

    .line 214
    :cond_28
    :goto_28
    iget-object v4, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    monitor-enter v4

    .line 215
    move v0, v2

    .line 216
    .local v0, "b0":I
    if-eqz p6, :cond_30

    .line 217
    or-int/lit16 v0, v0, 0x80

    .line 219
    :cond_30
    :try_start_30
    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v3, v0}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 221
    const/4 v1, 0x0

    .line 222
    .local v1, "b1":I
    iget-boolean v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->isClient:Z

    if-eqz v3, :cond_43

    .line 223
    or-int/lit16 v1, v1, 0x80

    .line 224
    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->random:Ljava/util/Random;

    iget-object v5, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->maskKey:[B

    invoke-virtual {v3, v5}, Ljava/util/Random;->nextBytes([B)V

    .line 226
    :cond_43
    const-wide/16 v5, 0x7d

    cmp-long v3, p3, v5

    if-gtz v3, :cond_67

    .line 227
    long-to-int v3, p3

    or-int/2addr v1, v3

    .line 228
    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v3, v1}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 239
    :goto_50
    iget-boolean v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->isClient:Z

    if-eqz v3, :cond_8b

    .line 240
    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    iget-object v5, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->maskKey:[B

    invoke-interface {v3, v5}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 241
    invoke-direct {p0, p2, p3, p4}, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->writeAllMasked(Lokio/BufferedSource;J)V

    .line 246
    :goto_5e
    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v3}, Lokio/BufferedSink;->flush()V

    .line 247
    monitor-exit v4

    .line 248
    return-void

    .line 207
    .end local v0    # "b0":I
    .end local v1    # "b1":I
    :pswitch_65
    const/4 v2, 0x2

    .line 208
    goto :goto_28

    .line 229
    .restart local v0    # "b0":I
    .restart local v1    # "b1":I
    :cond_67
    const-wide/16 v5, 0x7fff

    cmp-long v3, p3, v5

    if-gtz v3, :cond_7e

    .line 230
    or-int/lit8 v1, v1, 0x7e

    .line 231
    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v3, v1}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 232
    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    long-to-int v5, p3

    invoke-interface {v3, v5}, Lokio/BufferedSink;->writeShort(I)Lokio/BufferedSink;

    goto :goto_50

    .line 247
    .end local v1    # "b1":I
    :catchall_7b
    move-exception v3

    monitor-exit v4
    :try_end_7d
    .catchall {:try_start_30 .. :try_end_7d} :catchall_7b

    throw v3

    .line 234
    .restart local v1    # "b1":I
    :cond_7e
    or-int/lit8 v1, v1, 0x7f

    .line 235
    :try_start_80
    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v3, v1}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 236
    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v3, p3, p4}, Lokio/BufferedSink;->writeLong(J)Lokio/BufferedSink;

    goto :goto_50

    .line 243
    :cond_8b
    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    invoke-interface {v3, p2, p3, p4}, Lokio/BufferedSink;->write(Lokio/Buffer;J)V
    :try_end_90
    .catchall {:try_start_80 .. :try_end_90} :catchall_7b

    goto :goto_5e

    .line 202
    nop

    :pswitch_data_92
    .packed-switch 0x1
        :pswitch_27
        :pswitch_65
    .end packed-switch
.end method


# virtual methods
.method public isClosed()Z
    .registers 2

    .prologue
    .line 73
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->closed:Z

    return v0
.end method

.method public newMessageSink(Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;)Lokio/BufferedSink;
    .registers 4
    .param p1, "type"    # Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;

    .prologue
    const/4 v1, 0x1

    .line 172
    if-nez p1, :cond_b

    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "type == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 173
    :cond_b
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->closed:Z

    if-eqz v0, :cond_17

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 174
    :cond_17
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->activeWriter:Z

    if-eqz v0, :cond_23

    .line 175
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Another message writer is active. Did you call close()?"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 177
    :cond_23
    iput-boolean v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->activeWriter:Z

    .line 179
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->frameSink:Lcom/squareup/okhttp/internal/ws/WebSocketWriter$FrameSink;

    # setter for: Lcom/squareup/okhttp/internal/ws/WebSocketWriter$FrameSink;->payloadType:Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;
    invoke-static {v0, p1}, Lcom/squareup/okhttp/internal/ws/WebSocketWriter$FrameSink;->access$102(Lcom/squareup/okhttp/internal/ws/WebSocketWriter$FrameSink;Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;)Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;

    .line 180
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->frameSink:Lcom/squareup/okhttp/internal/ws/WebSocketWriter$FrameSink;

    # setter for: Lcom/squareup/okhttp/internal/ws/WebSocketWriter$FrameSink;->isFirstFrame:Z
    invoke-static {v0, v1}, Lcom/squareup/okhttp/internal/ws/WebSocketWriter$FrameSink;->access$202(Lcom/squareup/okhttp/internal/ws/WebSocketWriter$FrameSink;Z)Z

    .line 181
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->frameSink:Lcom/squareup/okhttp/internal/ws/WebSocketWriter$FrameSink;

    invoke-static {v0}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    move-result-object v0

    return-object v0
.end method

.method public sendMessage(Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;Lokio/Buffer;)V
    .registers 10
    .param p1, "type"    # Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;
    .param p2, "payload"    # Lokio/Buffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 189
    if-nez p1, :cond_b

    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "type == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 190
    :cond_b
    if-nez p2, :cond_15

    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "payload == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 191
    :cond_15
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->closed:Z

    if-eqz v0, :cond_21

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 192
    :cond_21
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->activeWriter:Z

    if-eqz v0, :cond_2d

    .line 193
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "A message writer is active. Did you call close()?"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 195
    :cond_2d
    invoke-virtual {p2}, Lokio/Buffer;->size()J

    move-result-wide v3

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v6, v5

    invoke-direct/range {v0 .. v6}, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->writeFrame(Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;Lokio/Buffer;JZZ)V

    .line 196
    return-void
.end method

.method public writeClose(ILjava/lang/String;)V
    .registers 6
    .param p1, "code"    # I
    .param p2, "reason"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    iget-boolean v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->closed:Z

    if-eqz v1, :cond_c

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Closed"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 105
    :cond_c
    const/4 v0, 0x0

    .line 106
    .local v0, "payload":Lokio/Buffer;
    if-eqz p1, :cond_30

    .line 107
    const/16 v1, 0x3e8

    if-lt p1, v1, :cond_17

    const/16 v1, 0x1388

    if-lt p1, v1, :cond_1f

    .line 108
    :cond_17
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Code must be in range [1000,5000)."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 110
    :cond_1f
    new-instance v0, Lokio/Buffer;

    .end local v0    # "payload":Lokio/Buffer;
    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 111
    .restart local v0    # "payload":Lokio/Buffer;
    invoke-virtual {v0, p1}, Lokio/Buffer;->writeShort(I)Lokio/Buffer;

    .line 112
    if-eqz p2, :cond_2c

    .line 113
    invoke-virtual {v0, p2}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;)Lokio/Buffer;

    .line 118
    :cond_2c
    invoke-virtual {p0, v0}, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->writeClose(Lokio/Buffer;)V

    .line 119
    return-void

    .line 115
    :cond_30
    if-eqz p2, :cond_2c

    .line 116
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Code required to include reason."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public writeClose(Lokio/Buffer;)V
    .registers 4
    .param p1, "payload"    # Lokio/Buffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 126
    iget-object v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    monitor-enter v1

    .line 127
    const/16 v0, 0x8

    :try_start_5
    invoke-direct {p0, v0, p1}, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->writeControlFrame(ILokio/Buffer;)V

    .line 128
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->closed:Z

    .line 129
    monitor-exit v1

    .line 130
    return-void

    .line 129
    :catchall_d
    move-exception v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_5 .. :try_end_f} :catchall_d

    throw v0
.end method

.method public writePing(Lokio/Buffer;)V
    .registers 4
    .param p1, "payload"    # Lokio/Buffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->closed:Z

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 80
    :cond_c
    iget-object v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    monitor-enter v1

    .line 81
    const/16 v0, 0x9

    :try_start_11
    invoke-direct {p0, v0, p1}, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->writeControlFrame(ILokio/Buffer;)V

    .line 82
    monitor-exit v1

    .line 83
    return-void

    .line 82
    :catchall_16
    move-exception v0

    monitor-exit v1
    :try_end_18
    .catchall {:try_start_11 .. :try_end_18} :catchall_16

    throw v0
.end method

.method public writePong(Lokio/Buffer;)V
    .registers 4
    .param p1, "payload"    # Lokio/Buffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->closed:Z

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 89
    :cond_c
    iget-object v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sink:Lokio/BufferedSink;

    monitor-enter v1

    .line 90
    const/16 v0, 0xa

    :try_start_11
    invoke-direct {p0, v0, p1}, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->writeControlFrame(ILokio/Buffer;)V

    .line 91
    monitor-exit v1

    .line 92
    return-void

    .line 91
    :catchall_16
    move-exception v0

    monitor-exit v1
    :try_end_18
    .catchall {:try_start_11 .. :try_end_18} :catchall_16

    throw v0
.end method
