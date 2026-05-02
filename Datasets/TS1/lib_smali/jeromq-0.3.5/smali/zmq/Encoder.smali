.class public Lzmq/Encoder;
.super Lzmq/EncoderBase;
.source "Encoder.java"


# static fields
.field private static final MESSAGE_READY:I = 0x1

.field private static final SIZE_READY:I


# instance fields
.field private inProgress:Lzmq/Msg;

.field private msgSource:Lzmq/IMsgSource;

.field private final tmpbuf:[B


# direct methods
.method public constructor <init>(I)V
    .registers 5
    .param p1, "bufsize"    # I

    .prologue
    const/4 v2, 0x1

    .line 35
    invoke-direct {p0, p1}, Lzmq/EncoderBase;-><init>(I)V

    .line 36
    const/16 v0, 0xa

    new-array v0, v0, [B

    iput-object v0, p0, Lzmq/Encoder;->tmpbuf:[B

    .line 38
    const/4 v0, 0x0

    check-cast v0, [B

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v2, v2}, Lzmq/Encoder;->nextStep([BIIZ)V

    .line 39
    return-void
.end method

.method private messageReady()Z
    .registers 7

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 78
    iget-object v4, p0, Lzmq/Encoder;->msgSource:Lzmq/IMsgSource;

    if-nez v4, :cond_7

    .line 110
    :cond_6
    :goto_6
    return v2

    .line 82
    :cond_7
    iget-object v4, p0, Lzmq/Encoder;->msgSource:Lzmq/IMsgSource;

    invoke-interface {v4}, Lzmq/IMsgSource;->pullMsg()Lzmq/Msg;

    move-result-object v4

    iput-object v4, p0, Lzmq/Encoder;->inProgress:Lzmq/Msg;

    .line 83
    iget-object v4, p0, Lzmq/Encoder;->inProgress:Lzmq/Msg;

    if-eqz v4, :cond_6

    .line 88
    iget-object v4, p0, Lzmq/Encoder;->inProgress:Lzmq/Msg;

    invoke-virtual {v4}, Lzmq/Msg;->size()I

    move-result v1

    .line 91
    .local v1, "size":I
    add-int/lit8 v1, v1, 0x1

    .line 97
    const/16 v4, 0xff

    if-ge v1, v4, :cond_39

    .line 98
    iget-object v4, p0, Lzmq/Encoder;->tmpbuf:[B

    int-to-byte v5, v1

    aput-byte v5, v4, v2

    .line 99
    iget-object v4, p0, Lzmq/Encoder;->tmpbuf:[B

    iget-object v5, p0, Lzmq/Encoder;->inProgress:Lzmq/Msg;

    invoke-virtual {v5}, Lzmq/Msg;->flags()I

    move-result v5

    and-int/lit8 v5, v5, 0x1

    int-to-byte v5, v5

    aput-byte v5, v4, v3

    .line 100
    iget-object v4, p0, Lzmq/Encoder;->tmpbuf:[B

    const/4 v5, 0x2

    invoke-virtual {p0, v4, v5, v2, v2}, Lzmq/Encoder;->nextStep([BIIZ)V

    :goto_37
    move v2, v3

    .line 110
    goto :goto_6

    .line 103
    :cond_39
    iget-object v4, p0, Lzmq/Encoder;->tmpbuf:[B

    invoke-static {v4}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 104
    .local v0, "b":Ljava/nio/ByteBuffer;
    const/4 v4, -0x1

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 105
    int-to-long v4, v1

    invoke-virtual {v0, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 106
    iget-object v4, p0, Lzmq/Encoder;->inProgress:Lzmq/Msg;

    invoke-virtual {v4}, Lzmq/Msg;->flags()I

    move-result v4

    and-int/lit8 v4, v4, 0x1

    int-to-byte v4, v4

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 107
    iget-object v4, p0, Lzmq/Encoder;->tmpbuf:[B

    const/16 v5, 0xa

    invoke-virtual {p0, v4, v5, v2, v2}, Lzmq/Encoder;->nextStep([BIIZ)V

    goto :goto_37
.end method

.method private sizeReady()Z
    .registers 5

    .prologue
    const/4 v1, 0x1

    .line 63
    iget-object v0, p0, Lzmq/Encoder;->inProgress:Lzmq/Msg;

    invoke-virtual {v0}, Lzmq/Msg;->data()[B

    move-result-object v2

    iget-object v0, p0, Lzmq/Encoder;->inProgress:Lzmq/Msg;

    invoke-virtual {v0}, Lzmq/Msg;->size()I

    move-result v3

    iget-object v0, p0, Lzmq/Encoder;->inProgress:Lzmq/Msg;

    invoke-virtual {v0}, Lzmq/Msg;->hasMore()Z

    move-result v0

    if-nez v0, :cond_1a

    move v0, v1

    :goto_16
    invoke-virtual {p0, v2, v3, v1, v0}, Lzmq/Encoder;->nextStep([BIIZ)V

    .line 65
    return v1

    .line 63
    :cond_1a
    const/4 v0, 0x0

    goto :goto_16
.end method


# virtual methods
.method protected next()Z
    .registers 2

    .prologue
    .line 50
    invoke-virtual {p0}, Lzmq/Encoder;->state()I

    move-result v0

    packed-switch v0, :pswitch_data_14

    .line 56
    const/4 v0, 0x0

    :goto_8
    return v0

    .line 52
    :pswitch_9
    invoke-direct {p0}, Lzmq/Encoder;->sizeReady()Z

    move-result v0

    goto :goto_8

    .line 54
    :pswitch_e
    invoke-direct {p0}, Lzmq/Encoder;->messageReady()Z

    move-result v0

    goto :goto_8

    .line 50
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
    .line 44
    iput-object p1, p0, Lzmq/Encoder;->msgSource:Lzmq/IMsgSource;

    .line 45
    return-void
.end method
