.class public Lzmq/Decoder;
.super Lzmq/DecoderBase;
.source "Decoder.java"


# static fields
.field private static final EIGHT_BYTE_SIZE_READY:I = 0x1

.field private static final FLAGS_READY:I = 0x2

.field private static final MESSAGE_READY:I = 0x3

.field private static final ONE_BYTE_SIZE_READY:I


# instance fields
.field private inProgress:Lzmq/Msg;

.field private final maxmsgsize:J

.field private msgSink:Lzmq/IMsgSink;

.field private final tmpbuf:[B


# direct methods
.method public constructor <init>(IJ)V
    .registers 7
    .param p1, "bufsize"    # I
    .param p2, "maxmsgsize"    # J

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lzmq/DecoderBase;-><init>(I)V

    .line 50
    iput-wide p2, p0, Lzmq/Decoder;->maxmsgsize:J

    .line 51
    const/16 v0, 0x8

    new-array v0, v0, [B

    iput-object v0, p0, Lzmq/Decoder;->tmpbuf:[B

    .line 54
    iget-object v0, p0, Lzmq/Decoder;->tmpbuf:[B

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lzmq/Decoder;->nextStep([BII)V

    .line 55
    return-void
.end method

.method private eightByteSizeReady()Z
    .registers 12

    .prologue
    const-wide/16 v7, 0x0

    const/4 v4, 0x1

    const-wide/16 v9, 0x1

    const/4 v3, 0x0

    .line 124
    iget-object v5, p0, Lzmq/Decoder;->tmpbuf:[B

    invoke-static {v5}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v1

    .line 127
    .local v1, "payloadLength":J
    cmp-long v5, v1, v7

    if-gtz v5, :cond_18

    .line 128
    invoke-virtual {p0}, Lzmq/Decoder;->decodingError()V

    .line 152
    :goto_17
    return v3

    .line 133
    :cond_18
    iget-wide v5, p0, Lzmq/Decoder;->maxmsgsize:J

    cmp-long v5, v5, v7

    if-ltz v5, :cond_2a

    sub-long v5, v1, v9

    iget-wide v7, p0, Lzmq/Decoder;->maxmsgsize:J

    cmp-long v5, v5, v7

    if-lez v5, :cond_2a

    .line 134
    invoke-virtual {p0}, Lzmq/Decoder;->decodingError()V

    goto :goto_17

    .line 139
    :cond_2a
    sub-long v5, v1, v9

    const-wide/32 v7, 0x7fffffff

    cmp-long v5, v5, v7

    if-lez v5, :cond_37

    .line 140
    invoke-virtual {p0}, Lzmq/Decoder;->decodingError()V

    goto :goto_17

    .line 144
    :cond_37
    sub-long v5, v1, v9

    long-to-int v0, v5

    .line 148
    .local v0, "msgSize":I
    new-instance v3, Lzmq/Msg;

    invoke-direct {v3, v0}, Lzmq/Msg;-><init>(I)V

    iput-object v3, p0, Lzmq/Decoder;->inProgress:Lzmq/Msg;

    .line 150
    iget-object v3, p0, Lzmq/Decoder;->tmpbuf:[B

    const/4 v5, 0x2

    invoke-virtual {p0, v3, v4, v5}, Lzmq/Decoder;->nextStep([BII)V

    move v3, v4

    .line 152
    goto :goto_17
.end method

.method private flagsReady()Z
    .registers 4

    .prologue
    .line 159
    iget-object v1, p0, Lzmq/Decoder;->tmpbuf:[B

    const/4 v2, 0x0

    aget-byte v0, v1, v2

    .line 161
    .local v0, "first":I
    iget-object v1, p0, Lzmq/Decoder;->inProgress:Lzmq/Msg;

    and-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Lzmq/Msg;->setFlags(I)V

    .line 163
    iget-object v1, p0, Lzmq/Decoder;->inProgress:Lzmq/Msg;

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Lzmq/Decoder;->nextStep(Lzmq/Msg;I)V

    .line 166
    const/4 v1, 0x1

    return v1
.end method

.method private messageReady()Z
    .registers 6

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 175
    iget-object v3, p0, Lzmq/Decoder;->msgSink:Lzmq/IMsgSink;

    if-nez v3, :cond_7

    .line 186
    :cond_6
    :goto_6
    return v1

    .line 179
    :cond_7
    iget-object v3, p0, Lzmq/Decoder;->msgSink:Lzmq/IMsgSink;

    iget-object v4, p0, Lzmq/Decoder;->inProgress:Lzmq/Msg;

    invoke-interface {v3, v4}, Lzmq/IMsgSink;->pushMsg(Lzmq/Msg;)I

    move-result v0

    .line 180
    .local v0, "rc":I
    if-nez v0, :cond_6

    .line 184
    iget-object v3, p0, Lzmq/Decoder;->tmpbuf:[B

    invoke-virtual {p0, v3, v2, v1}, Lzmq/Decoder;->nextStep([BII)V

    move v1, v2

    .line 186
    goto :goto_6
.end method

.method private oneByteSizeReady()Z
    .registers 9

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 86
    iget-object v4, p0, Lzmq/Decoder;->tmpbuf:[B

    aget-byte v0, v4, v2

    .line 87
    .local v0, "first":B
    const/4 v4, -0x1

    if-ne v0, v4, :cond_12

    .line 88
    iget-object v2, p0, Lzmq/Decoder;->tmpbuf:[B

    const/16 v4, 0x8

    invoke-virtual {p0, v2, v4, v3}, Lzmq/Decoder;->nextStep([BII)V

    :goto_10
    move v2, v3

    .line 116
    :goto_11
    return v2

    .line 92
    :cond_12
    if-nez v0, :cond_18

    .line 93
    invoke-virtual {p0}, Lzmq/Decoder;->decodingError()V

    goto :goto_11

    .line 97
    :cond_18
    move v1, v0

    .line 98
    .local v1, "size":I
    if-gez v1, :cond_1d

    .line 99
    and-int/lit16 v1, v0, 0xff

    .line 105
    :cond_1d
    iget-wide v4, p0, Lzmq/Decoder;->maxmsgsize:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-ltz v4, :cond_32

    add-int/lit8 v4, v1, -0x1

    int-to-long v4, v4

    iget-wide v6, p0, Lzmq/Decoder;->maxmsgsize:J

    cmp-long v4, v4, v6

    if-lez v4, :cond_32

    .line 106
    invoke-virtual {p0}, Lzmq/Decoder;->decodingError()V

    goto :goto_11

    .line 111
    :cond_32
    new-instance v2, Lzmq/Msg;

    add-int/lit8 v4, v1, -0x1

    invoke-direct {v2, v4}, Lzmq/Msg;-><init>(I)V

    iput-object v2, p0, Lzmq/Decoder;->inProgress:Lzmq/Msg;

    .line 114
    iget-object v2, p0, Lzmq/Decoder;->tmpbuf:[B

    const/4 v4, 0x2

    invoke-virtual {p0, v2, v3, v4}, Lzmq/Decoder;->nextStep([BII)V

    goto :goto_10
.end method


# virtual methods
.method protected next()Z
    .registers 2

    .prologue
    .line 67
    invoke-virtual {p0}, Lzmq/Decoder;->state()I

    move-result v0

    packed-switch v0, :pswitch_data_1e

    .line 77
    const/4 v0, 0x0

    :goto_8
    return v0

    .line 69
    :pswitch_9
    invoke-direct {p0}, Lzmq/Decoder;->oneByteSizeReady()Z

    move-result v0

    goto :goto_8

    .line 71
    :pswitch_e
    invoke-direct {p0}, Lzmq/Decoder;->eightByteSizeReady()Z

    move-result v0

    goto :goto_8

    .line 73
    :pswitch_13
    invoke-direct {p0}, Lzmq/Decoder;->flagsReady()Z

    move-result v0

    goto :goto_8

    .line 75
    :pswitch_18
    invoke-direct {p0}, Lzmq/Decoder;->messageReady()Z

    move-result v0

    goto :goto_8

    .line 67
    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_9
        :pswitch_e
        :pswitch_13
        :pswitch_18
    .end packed-switch
.end method

.method public setMsgSink(Lzmq/IMsgSink;)V
    .registers 2
    .param p1, "msgSink"    # Lzmq/IMsgSink;

    .prologue
    .line 61
    iput-object p1, p0, Lzmq/Decoder;->msgSink:Lzmq/IMsgSink;

    .line 62
    return-void
.end method
