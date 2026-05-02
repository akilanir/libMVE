.class public abstract Lzmq/DecoderBase;
.super Ljava/lang/Object;
.source "DecoderBase.java"

# interfaces
.implements Lzmq/IDecoder;


# instance fields
.field private buf:Ljava/nio/ByteBuffer;

.field private bufsize:I

.field private readBuf:[B

.field private readPos:I

.field private state:I

.field protected toRead:I

.field zeroCopy:Z


# direct methods
.method public constructor <init>(I)V
    .registers 4
    .param p1, "bufsize"    # I

    .prologue
    const/4 v1, 0x0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const/4 v0, -0x1

    iput v0, p0, Lzmq/DecoderBase;->state:I

    .line 55
    iput v1, p0, Lzmq/DecoderBase;->toRead:I

    .line 56
    iput p1, p0, Lzmq/DecoderBase;->bufsize:I

    .line 57
    if-lez p1, :cond_13

    .line 58
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lzmq/DecoderBase;->buf:Ljava/nio/ByteBuffer;

    .line 60
    :cond_13
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/DecoderBase;->readBuf:[B

    .line 61
    iput-boolean v1, p0, Lzmq/DecoderBase;->zeroCopy:Z

    .line 62
    return-void
.end method


# virtual methods
.method protected decodingError()V
    .registers 2

    .prologue
    .line 172
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lzmq/DecoderBase;->state(I)V

    .line 173
    return-void
.end method

.method public getBuffer()Ljava/nio/ByteBuffer;
    .registers 4

    .prologue
    .line 77
    iget v1, p0, Lzmq/DecoderBase;->toRead:I

    iget v2, p0, Lzmq/DecoderBase;->bufsize:I

    if-lt v1, v2, :cond_15

    .line 78
    const/4 v1, 0x1

    iput-boolean v1, p0, Lzmq/DecoderBase;->zeroCopy:Z

    .line 79
    iget-object v1, p0, Lzmq/DecoderBase;->readBuf:[B

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 80
    .local v0, "b":Ljava/nio/ByteBuffer;
    iget v1, p0, Lzmq/DecoderBase;->readPos:I

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 87
    :goto_14
    return-object v0

    .line 83
    .end local v0    # "b":Ljava/nio/ByteBuffer;
    :cond_15
    const/4 v1, 0x0

    iput-boolean v1, p0, Lzmq/DecoderBase;->zeroCopy:Z

    .line 84
    iget-object v0, p0, Lzmq/DecoderBase;->buf:Ljava/nio/ByteBuffer;

    .line 85
    .restart local v0    # "b":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    goto :goto_14
.end method

.method protected abstract next()Z
.end method

.method protected nextStep(Lzmq/Msg;I)V
    .registers 5
    .param p1, "msg"    # Lzmq/Msg;
    .param p2, "state"    # I

    .prologue
    .line 149
    invoke-virtual {p1}, Lzmq/Msg;->data()[B

    move-result-object v0

    invoke-virtual {p1}, Lzmq/Msg;->size()I

    move-result v1

    invoke-virtual {p0, v0, v1, p2}, Lzmq/DecoderBase;->nextStep([BII)V

    .line 150
    return-void
.end method

.method protected nextStep([BII)V
    .registers 5
    .param p1, "buf"    # [B
    .param p2, "toRead"    # I
    .param p3, "state"    # I

    .prologue
    .line 154
    iput-object p1, p0, Lzmq/DecoderBase;->readBuf:[B

    .line 155
    const/4 v0, 0x0

    iput v0, p0, Lzmq/DecoderBase;->readPos:I

    .line 156
    iput p2, p0, Lzmq/DecoderBase;->toRead:I

    .line 157
    iput p3, p0, Lzmq/DecoderBase;->state:I

    .line 158
    return-void
.end method

.method public processBuffer(Ljava/nio/ByteBuffer;I)I
    .registers 8
    .param p1, "buf"    # Ljava/nio/ByteBuffer;
    .param p2, "size"    # I

    .prologue
    const/4 v2, -0x1

    .line 97
    invoke-virtual {p0}, Lzmq/DecoderBase;->state()I

    move-result v3

    if-gez v3, :cond_9

    move p2, v2

    .line 135
    .end local p2    # "size":I
    :cond_8
    :goto_8
    return p2

    .line 104
    .restart local p2    # "size":I
    :cond_9
    iget-boolean v3, p0, Lzmq/DecoderBase;->zeroCopy:Z

    if-eqz v3, :cond_29

    .line 105
    iget v3, p0, Lzmq/DecoderBase;->readPos:I

    add-int/2addr v3, p2

    iput v3, p0, Lzmq/DecoderBase;->readPos:I

    .line 106
    iget v3, p0, Lzmq/DecoderBase;->toRead:I

    sub-int/2addr v3, p2

    iput v3, p0, Lzmq/DecoderBase;->toRead:I

    .line 108
    :cond_17
    iget v3, p0, Lzmq/DecoderBase;->toRead:I

    if-nez v3, :cond_8

    .line 109
    invoke-virtual {p0}, Lzmq/DecoderBase;->next()Z

    move-result v3

    if-nez v3, :cond_17

    .line 110
    invoke-virtual {p0}, Lzmq/DecoderBase;->state()I

    move-result v3

    if-gez v3, :cond_8

    move p2, v2

    .line 111
    goto :goto_8

    .line 119
    :cond_29
    const/4 v0, 0x0

    .line 123
    .local v0, "pos":I
    :cond_2a
    :goto_2a
    iget v3, p0, Lzmq/DecoderBase;->toRead:I

    if-nez v3, :cond_3e

    .line 124
    invoke-virtual {p0}, Lzmq/DecoderBase;->next()Z

    move-result v3

    if-nez v3, :cond_2a

    .line 125
    invoke-virtual {p0}, Lzmq/DecoderBase;->state()I

    move-result v3

    if-gez v3, :cond_3c

    move p2, v2

    .line 126
    goto :goto_8

    :cond_3c
    move p2, v0

    .line 129
    goto :goto_8

    .line 134
    :cond_3e
    if-ne v0, p2, :cond_42

    move p2, v0

    .line 135
    goto :goto_8

    .line 139
    :cond_42
    iget v3, p0, Lzmq/DecoderBase;->toRead:I

    sub-int v4, p2, v0

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 140
    .local v1, "toCopy":I
    iget-object v3, p0, Lzmq/DecoderBase;->readBuf:[B

    iget v4, p0, Lzmq/DecoderBase;->readPos:I

    invoke-virtual {p1, v3, v4, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 141
    iget v3, p0, Lzmq/DecoderBase;->readPos:I

    add-int/2addr v3, v1

    iput v3, p0, Lzmq/DecoderBase;->readPos:I

    .line 142
    add-int/2addr v0, v1

    .line 143
    iget v3, p0, Lzmq/DecoderBase;->toRead:I

    sub-int/2addr v3, v1

    iput v3, p0, Lzmq/DecoderBase;->toRead:I

    goto :goto_2a
.end method

.method public stalled()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 182
    invoke-virtual {p0}, Lzmq/DecoderBase;->next()Z

    move-result v1

    if-nez v1, :cond_8

    .line 191
    :cond_7
    :goto_7
    return v0

    .line 186
    :cond_8
    iget v1, p0, Lzmq/DecoderBase;->toRead:I

    if-nez v1, :cond_7

    .line 187
    invoke-virtual {p0}, Lzmq/DecoderBase;->next()Z

    move-result v1

    if-nez v1, :cond_8

    .line 188
    invoke-virtual {p0}, Lzmq/DecoderBase;->next()Z

    move-result v0

    goto :goto_7
.end method

.method protected state()I
    .registers 2

    .prologue
    .line 162
    iget v0, p0, Lzmq/DecoderBase;->state:I

    return v0
.end method

.method protected state(I)V
    .registers 2
    .param p1, "state"    # I

    .prologue
    .line 167
    iput p1, p0, Lzmq/DecoderBase;->state:I

    .line 168
    return-void
.end method
