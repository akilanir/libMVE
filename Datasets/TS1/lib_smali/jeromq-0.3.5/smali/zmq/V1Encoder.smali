.class public Lzmq/V1Encoder;
.super Lzmq/EncoderBase;
.source "V1Encoder.java"


# static fields
.field private static final MESSAGE_READY:I = 0x1

.field private static final SIZE_READY:I


# instance fields
.field private inProgress:Lzmq/Msg;

.field private msgSource:Lzmq/IMsgSource;

.field private final tmpbuf:[B


# direct methods
.method public constructor <init>(ILzmq/IMsgSource;)V
    .registers 6
    .param p1, "bufsize"    # I
    .param p2, "session"    # Lzmq/IMsgSource;

    .prologue
    const/4 v2, 0x1

    .line 37
    invoke-direct {p0, p1}, Lzmq/EncoderBase;-><init>(I)V

    .line 38
    const/16 v0, 0x9

    new-array v0, v0, [B

    iput-object v0, p0, Lzmq/V1Encoder;->tmpbuf:[B

    .line 39
    iput-object p2, p0, Lzmq/V1Encoder;->msgSource:Lzmq/IMsgSource;

    .line 42
    const/4 v0, 0x0

    check-cast v0, [B

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v2, v2}, Lzmq/V1Encoder;->nextStep([BIIZ)V

    .line 43
    return-void
.end method

.method private messageReady()Z
    .registers 9

    .prologue
    const/16 v7, 0xff

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 79
    iget-object v5, p0, Lzmq/V1Encoder;->msgSource:Lzmq/IMsgSource;

    if-nez v5, :cond_9

    .line 111
    :cond_8
    :goto_8
    return v3

    .line 83
    :cond_9
    iget-object v5, p0, Lzmq/V1Encoder;->msgSource:Lzmq/IMsgSource;

    invoke-interface {v5}, Lzmq/IMsgSource;->pullMsg()Lzmq/Msg;

    move-result-object v5

    iput-object v5, p0, Lzmq/V1Encoder;->inProgress:Lzmq/Msg;

    .line 84
    iget-object v5, p0, Lzmq/V1Encoder;->inProgress:Lzmq/Msg;

    if-eqz v5, :cond_8

    .line 88
    const/4 v1, 0x0

    .line 89
    .local v1, "protocolFlags":I
    iget-object v5, p0, Lzmq/V1Encoder;->inProgress:Lzmq/Msg;

    invoke-virtual {v5}, Lzmq/Msg;->hasMore()Z

    move-result v5

    if-eqz v5, :cond_20

    .line 90
    or-int/lit8 v1, v1, 0x1

    .line 92
    :cond_20
    iget-object v5, p0, Lzmq/V1Encoder;->inProgress:Lzmq/Msg;

    invoke-virtual {v5}, Lzmq/Msg;->size()I

    move-result v5

    if-le v5, v7, :cond_2a

    .line 93
    or-int/lit8 v1, v1, 0x2

    .line 95
    :cond_2a
    iget-object v5, p0, Lzmq/V1Encoder;->tmpbuf:[B

    int-to-byte v6, v1

    aput-byte v6, v5, v3

    .line 100
    iget-object v5, p0, Lzmq/V1Encoder;->inProgress:Lzmq/Msg;

    invoke-virtual {v5}, Lzmq/Msg;->size()I

    move-result v2

    .line 101
    .local v2, "size":I
    if-le v2, v7, :cond_4d

    .line 102
    iget-object v5, p0, Lzmq/V1Encoder;->tmpbuf:[B

    invoke-static {v5}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 103
    .local v0, "b":Ljava/nio/ByteBuffer;
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 104
    int-to-long v5, v2

    invoke-virtual {v0, v5, v6}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 105
    iget-object v5, p0, Lzmq/V1Encoder;->tmpbuf:[B

    const/16 v6, 0x9

    invoke-virtual {p0, v5, v6, v3, v3}, Lzmq/V1Encoder;->nextStep([BIIZ)V

    .end local v0    # "b":Ljava/nio/ByteBuffer;
    :goto_4b
    move v3, v4

    .line 111
    goto :goto_8

    .line 108
    :cond_4d
    iget-object v5, p0, Lzmq/V1Encoder;->tmpbuf:[B

    int-to-byte v6, v2

    aput-byte v6, v5, v4

    .line 109
    iget-object v5, p0, Lzmq/V1Encoder;->tmpbuf:[B

    const/4 v6, 0x2

    invoke-virtual {p0, v5, v6, v3, v3}, Lzmq/V1Encoder;->nextStep([BIIZ)V

    goto :goto_4b
.end method

.method private sizeReady()Z
    .registers 5

    .prologue
    const/4 v1, 0x1

    .line 67
    iget-object v0, p0, Lzmq/V1Encoder;->inProgress:Lzmq/Msg;

    invoke-virtual {v0}, Lzmq/Msg;->data()[B

    move-result-object v2

    iget-object v0, p0, Lzmq/V1Encoder;->inProgress:Lzmq/Msg;

    invoke-virtual {v0}, Lzmq/Msg;->size()I

    move-result v3

    iget-object v0, p0, Lzmq/V1Encoder;->inProgress:Lzmq/Msg;

    invoke-virtual {v0}, Lzmq/Msg;->hasMore()Z

    move-result v0

    if-nez v0, :cond_1a

    move v0, v1

    :goto_16
    invoke-virtual {p0, v2, v3, v1, v0}, Lzmq/V1Encoder;->nextStep([BIIZ)V

    .line 69
    return v1

    .line 67
    :cond_1a
    const/4 v0, 0x0

    goto :goto_16
.end method


# virtual methods
.method protected next()Z
    .registers 2

    .prologue
    .line 54
    invoke-virtual {p0}, Lzmq/V1Encoder;->state()I

    move-result v0

    packed-switch v0, :pswitch_data_14

    .line 60
    const/4 v0, 0x0

    :goto_8
    return v0

    .line 56
    :pswitch_9
    invoke-direct {p0}, Lzmq/V1Encoder;->sizeReady()Z

    move-result v0

    goto :goto_8

    .line 58
    :pswitch_e
    invoke-direct {p0}, Lzmq/V1Encoder;->messageReady()Z

    move-result v0

    goto :goto_8

    .line 54
    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_9
        :pswitch_e
    .end packed-switch
.end method

.method public setMsgSource(Lzmq/IMsgSource;)V
    .registers 2
    .param p1, "msgSource"    # Lzmq/IMsgSource;

    .prologue
    .line 48
    iput-object p1, p0, Lzmq/V1Encoder;->msgSource:Lzmq/IMsgSource;

    .line 49
    return-void
.end method
