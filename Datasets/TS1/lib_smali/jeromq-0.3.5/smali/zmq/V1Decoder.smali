.class public Lzmq/V1Decoder;
.super Lzmq/DecoderBase;
.source "V1Decoder.java"


# static fields
.field private static final EIGHT_BYTE_SIZE_READY:I = 0x1

.field private static final FLAGS_READY:I = 0x2

.field private static final MESSAGE_READY:I = 0x3

.field private static final ONE_BYTE_SIZE_READY:I


# instance fields
.field private inProgress:Lzmq/Msg;

.field private final maxmsgsize:J

.field private msgFlags:I

.field private msgSink:Lzmq/IMsgSink;

.field private final tmpbuf:[B


# direct methods
.method public constructor <init>(IJLzmq/IMsgSink;)V
    .registers 8
    .param p1, "bufsize"    # I
    .param p2, "maxmsgsize"    # J
    .param p4, "session"    # Lzmq/IMsgSink;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lzmq/DecoderBase;-><init>(I)V

    .line 41
    iput-wide p2, p0, Lzmq/V1Decoder;->maxmsgsize:J

    .line 42
    iput-object p4, p0, Lzmq/V1Decoder;->msgSink:Lzmq/IMsgSink;

    .line 44
    const/16 v0, 0x8

    new-array v0, v0, [B

    iput-object v0, p0, Lzmq/V1Decoder;->tmpbuf:[B

    .line 47
    iget-object v0, p0, Lzmq/V1Decoder;->tmpbuf:[B

    const/4 v1, 0x1

    const/4 v2, 0x2

    invoke-virtual {p0, v0, v1, v2}, Lzmq/V1Decoder;->nextStep([BII)V

    .line 48
    return-void
.end method

.method private eightByteSizeReady()Z
    .registers 8

    .prologue
    const/4 v2, 0x0

    .line 105
    iget-object v3, p0, Lzmq/V1Decoder;->tmpbuf:[B

    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    .line 108
    .local v0, "msgSize":J
    iget-wide v3, p0, Lzmq/V1Decoder;->maxmsgsize:J

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-ltz v3, :cond_1d

    .line 109
    iget-wide v3, p0, Lzmq/V1Decoder;->maxmsgsize:J

    cmp-long v3, v0, v3

    if-lez v3, :cond_1d

    .line 110
    invoke-virtual {p0}, Lzmq/V1Decoder;->decodingError()V

    .line 130
    :goto_1c
    return v2

    .line 116
    :cond_1d
    const-wide/32 v3, 0x7fffffff

    cmp-long v3, v0, v3

    if-lez v3, :cond_28

    .line 117
    invoke-virtual {p0}, Lzmq/V1Decoder;->decodingError()V

    goto :goto_1c

    .line 124
    :cond_28
    new-instance v2, Lzmq/Msg;

    long-to-int v3, v0

    invoke-direct {v2, v3}, Lzmq/Msg;-><init>(I)V

    iput-object v2, p0, Lzmq/V1Decoder;->inProgress:Lzmq/Msg;

    .line 126
    iget-object v2, p0, Lzmq/V1Decoder;->inProgress:Lzmq/Msg;

    iget v3, p0, Lzmq/V1Decoder;->msgFlags:I

    invoke-virtual {v2, v3}, Lzmq/Msg;->setFlags(I)V

    .line 127
    iget-object v2, p0, Lzmq/V1Decoder;->inProgress:Lzmq/Msg;

    invoke-virtual {v2}, Lzmq/Msg;->data()[B

    move-result-object v2

    iget-object v3, p0, Lzmq/V1Decoder;->inProgress:Lzmq/Msg;

    invoke-virtual {v3}, Lzmq/Msg;->size()I

    move-result v3

    const/4 v4, 0x3

    invoke-virtual {p0, v2, v3, v4}, Lzmq/V1Decoder;->nextStep([BII)V

    .line 130
    const/4 v2, 0x1

    goto :goto_1c
.end method

.method private flagsReady()Z
    .registers 5

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 136
    iput v2, p0, Lzmq/V1Decoder;->msgFlags:I

    .line 137
    iget-object v1, p0, Lzmq/V1Decoder;->tmpbuf:[B

    aget-byte v0, v1, v2

    .line 138
    .local v0, "first":I
    and-int/lit8 v1, v0, 0x1

    if-lez v1, :cond_12

    .line 139
    iget v1, p0, Lzmq/V1Decoder;->msgFlags:I

    or-int/lit8 v1, v1, 0x1

    iput v1, p0, Lzmq/V1Decoder;->msgFlags:I

    .line 144
    :cond_12
    and-int/lit8 v1, v0, 0x2

    if-lez v1, :cond_1e

    .line 145
    iget-object v1, p0, Lzmq/V1Decoder;->tmpbuf:[B

    const/16 v2, 0x8

    invoke-virtual {p0, v1, v2, v3}, Lzmq/V1Decoder;->nextStep([BII)V

    .line 151
    :goto_1d
    return v3

    .line 148
    :cond_1e
    iget-object v1, p0, Lzmq/V1Decoder;->tmpbuf:[B

    invoke-virtual {p0, v1, v3, v2}, Lzmq/V1Decoder;->nextStep([BII)V

    goto :goto_1d
.end method

.method private messageReady()Z
    .registers 6

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 159
    iget-object v3, p0, Lzmq/V1Decoder;->msgSink:Lzmq/IMsgSink;

    if-nez v3, :cond_7

    .line 174
    :cond_6
    :goto_6
    return v1

    .line 163
    :cond_7
    iget-object v3, p0, Lzmq/V1Decoder;->msgSink:Lzmq/IMsgSink;

    iget-object v4, p0, Lzmq/V1Decoder;->inProgress:Lzmq/Msg;

    invoke-interface {v3, v4}, Lzmq/IMsgSink;->pushMsg(Lzmq/Msg;)I

    move-result v0

    .line 164
    .local v0, "rc":I
    if-eqz v0, :cond_19

    .line 165
    const/16 v2, 0x23

    if-eq v0, v2, :cond_6

    .line 166
    invoke-virtual {p0}, Lzmq/V1Decoder;->decodingError()V

    goto :goto_6

    .line 172
    :cond_19
    iget-object v1, p0, Lzmq/V1Decoder;->tmpbuf:[B

    const/4 v3, 0x2

    invoke-virtual {p0, v1, v2, v3}, Lzmq/V1Decoder;->nextStep([BII)V

    move v1, v2

    .line 174
    goto :goto_6
.end method

.method private oneByteSizeReady()Z
    .registers 7

    .prologue
    const/4 v1, 0x0

    .line 76
    iget-object v2, p0, Lzmq/V1Decoder;->tmpbuf:[B

    aget-byte v0, v2, v1

    .line 77
    .local v0, "size":I
    if-gez v0, :cond_9

    .line 78
    and-int/lit16 v0, v0, 0xff

    .line 82
    :cond_9
    iget-wide v2, p0, Lzmq/V1Decoder;->maxmsgsize:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-ltz v2, :cond_1c

    .line 83
    int-to-long v2, v0

    iget-wide v4, p0, Lzmq/V1Decoder;->maxmsgsize:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_1c

    .line 84
    invoke-virtual {p0}, Lzmq/V1Decoder;->decodingError()V

    .line 98
    :goto_1b
    return v1

    .line 92
    :cond_1c
    new-instance v1, Lzmq/Msg;

    invoke-direct {v1, v0}, Lzmq/Msg;-><init>(I)V

    iput-object v1, p0, Lzmq/V1Decoder;->inProgress:Lzmq/Msg;

    .line 94
    iget-object v1, p0, Lzmq/V1Decoder;->inProgress:Lzmq/Msg;

    iget v2, p0, Lzmq/V1Decoder;->msgFlags:I

    invoke-virtual {v1, v2}, Lzmq/Msg;->setFlags(I)V

    .line 95
    iget-object v1, p0, Lzmq/V1Decoder;->inProgress:Lzmq/Msg;

    invoke-virtual {v1}, Lzmq/Msg;->data()[B

    move-result-object v1

    iget-object v2, p0, Lzmq/V1Decoder;->inProgress:Lzmq/Msg;

    invoke-virtual {v2}, Lzmq/Msg;->size()I

    move-result v2

    const/4 v3, 0x3

    invoke-virtual {p0, v1, v2, v3}, Lzmq/V1Decoder;->nextStep([BII)V

    .line 98
    const/4 v1, 0x1

    goto :goto_1b
.end method


# virtual methods
.method protected next()Z
    .registers 2

    .prologue
    .line 60
    invoke-virtual {p0}, Lzmq/V1Decoder;->state()I

    move-result v0

    packed-switch v0, :pswitch_data_1e

    .line 70
    const/4 v0, 0x0

    :goto_8
    return v0

    .line 62
    :pswitch_9
    invoke-direct {p0}, Lzmq/V1Decoder;->oneByteSizeReady()Z

    move-result v0

    goto :goto_8

    .line 64
    :pswitch_e
    invoke-direct {p0}, Lzmq/V1Decoder;->eightByteSizeReady()Z

    move-result v0

    goto :goto_8

    .line 66
    :pswitch_13
    invoke-direct {p0}, Lzmq/V1Decoder;->flagsReady()Z

    move-result v0

    goto :goto_8

    .line 68
    :pswitch_18
    invoke-direct {p0}, Lzmq/V1Decoder;->messageReady()Z

    move-result v0

    goto :goto_8

    .line 60
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
    .line 54
    iput-object p1, p0, Lzmq/V1Decoder;->msgSink:Lzmq/IMsgSink;

    .line 55
    return-void
.end method
