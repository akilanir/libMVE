.class public abstract Lzmq/EncoderBase;
.super Ljava/lang/Object;
.source "EncoderBase.java"

# interfaces
.implements Lzmq/IEncoder;


# instance fields
.field private beginning:Z

.field private buffer:Ljava/nio/ByteBuffer;

.field private bufferSize:I

.field private error:Z

.field private next:I

.field private toWrite:I

.field private writeBuf:[B

.field private writeChannel:Ljava/nio/channels/FileChannel;

.field private writePos:I


# direct methods
.method protected constructor <init>(I)V
    .registers 3
    .param p1, "bufferSize"    # I

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput p1, p0, Lzmq/EncoderBase;->bufferSize:I

    .line 53
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lzmq/EncoderBase;->buffer:Ljava/nio/ByteBuffer;

    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Lzmq/EncoderBase;->error:Z

    .line 55
    return-void
.end method


# virtual methods
.method protected encodingError()V
    .registers 2

    .prologue
    .line 147
    const/4 v0, 0x1

    iput-boolean v0, p0, Lzmq/EncoderBase;->error:Z

    .line 148
    return-void
.end method

.method public getData(Ljava/nio/ByteBuffer;)Lzmq/Transfer;
    .registers 12
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .prologue
    const/4 v9, 0x0

    .line 64
    if-nez p1, :cond_5

    .line 65
    iget-object p1, p0, Lzmq/EncoderBase;->buffer:Ljava/nio/ByteBuffer;

    .line 68
    :cond_5
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 70
    :cond_8
    :goto_8
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 74
    iget v1, p0, Lzmq/EncoderBase;->toWrite:I

    if-nez v1, :cond_21

    .line 78
    invoke-virtual {p0}, Lzmq/EncoderBase;->next()Z

    move-result v1

    if-nez v1, :cond_21

    .line 125
    :cond_18
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 126
    new-instance v0, Lzmq/Transfer$ByteBufferTransfer;

    invoke-direct {v0, p1}, Lzmq/Transfer$ByteBufferTransfer;-><init>(Ljava/nio/ByteBuffer;)V

    :goto_20
    return-object v0

    .line 86
    :cond_21
    iget-object v1, p0, Lzmq/EncoderBase;->writeChannel:Ljava/nio/channels/FileChannel;

    if-eqz v1, :cond_3b

    .line 87
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 88
    new-instance v0, Lzmq/Transfer$FileChannelTransfer;

    iget-object v2, p0, Lzmq/EncoderBase;->writeChannel:Ljava/nio/channels/FileChannel;

    iget v1, p0, Lzmq/EncoderBase;->writePos:I

    int-to-long v3, v1

    iget v1, p0, Lzmq/EncoderBase;->toWrite:I

    int-to-long v5, v1

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lzmq/Transfer$FileChannelTransfer;-><init>(Ljava/nio/ByteBuffer;Ljava/nio/channels/FileChannel;JJ)V

    .line 90
    .local v0, "t":Lzmq/Transfer;
    iput v9, p0, Lzmq/EncoderBase;->writePos:I

    .line 91
    iput v9, p0, Lzmq/EncoderBase;->toWrite:I

    goto :goto_20

    .line 105
    .end local v0    # "t":Lzmq/Transfer;
    :cond_3b
    iget-object v1, p0, Lzmq/EncoderBase;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    if-nez v1, :cond_5e

    iget v1, p0, Lzmq/EncoderBase;->toWrite:I

    iget v2, p0, Lzmq/EncoderBase;->bufferSize:I

    if-lt v1, v2, :cond_5e

    .line 107
    iget-object v1, p0, Lzmq/EncoderBase;->writeBuf:[B

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v7

    .line 108
    .local v7, "b":Ljava/nio/ByteBuffer;
    iget v1, p0, Lzmq/EncoderBase;->writePos:I

    invoke-virtual {v7, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 109
    new-instance v0, Lzmq/Transfer$ByteBufferTransfer;

    invoke-direct {v0, v7}, Lzmq/Transfer$ByteBufferTransfer;-><init>(Ljava/nio/ByteBuffer;)V

    .line 110
    .restart local v0    # "t":Lzmq/Transfer;
    iput v9, p0, Lzmq/EncoderBase;->writePos:I

    .line 111
    iput v9, p0, Lzmq/EncoderBase;->toWrite:I

    goto :goto_20

    .line 117
    .end local v0    # "t":Lzmq/Transfer;
    .end local v7    # "b":Ljava/nio/ByteBuffer;
    :cond_5e
    iget v1, p0, Lzmq/EncoderBase;->toWrite:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 118
    .local v8, "toCopy":I
    if-lez v8, :cond_8

    .line 119
    iget-object v1, p0, Lzmq/EncoderBase;->writeBuf:[B

    iget v2, p0, Lzmq/EncoderBase;->writePos:I

    invoke-virtual {p1, v1, v2, v8}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 120
    iget v1, p0, Lzmq/EncoderBase;->writePos:I

    add-int/2addr v1, v8

    iput v1, p0, Lzmq/EncoderBase;->writePos:I

    .line 121
    iget v1, p0, Lzmq/EncoderBase;->toWrite:I

    sub-int/2addr v1, v8

    iput v1, p0, Lzmq/EncoderBase;->toWrite:I

    goto :goto_8
.end method

.method public hasData()Z
    .registers 2

    .prologue
    .line 132
    iget v0, p0, Lzmq/EncoderBase;->toWrite:I

    if-lez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public final isError()Z
    .registers 2

    .prologue
    .line 152
    iget-boolean v0, p0, Lzmq/EncoderBase;->error:Z

    return v0
.end method

.method protected abstract next()Z
.end method

.method protected nextStep(Ljava/nio/channels/FileChannel;JJIZ)V
    .registers 9
    .param p1, "ch"    # Ljava/nio/channels/FileChannel;
    .param p2, "pos"    # J
    .param p4, "toWrite"    # J
    .param p6, "next"    # I
    .param p7, "beginning"    # Z

    .prologue
    .line 181
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/EncoderBase;->writeBuf:[B

    .line 182
    iput-object p1, p0, Lzmq/EncoderBase;->writeChannel:Ljava/nio/channels/FileChannel;

    .line 183
    long-to-int v0, p2

    iput v0, p0, Lzmq/EncoderBase;->writePos:I

    .line 184
    long-to-int v0, p4

    iput v0, p0, Lzmq/EncoderBase;->toWrite:I

    .line 185
    iput p6, p0, Lzmq/EncoderBase;->next:I

    .line 186
    iput-boolean p7, p0, Lzmq/EncoderBase;->beginning:Z

    .line 187
    return-void
.end method

.method protected nextStep(Lzmq/Msg;IZ)V
    .registers 6
    .param p1, "msg"    # Lzmq/Msg;
    .param p2, "state"    # I
    .param p3, "beginning"    # Z

    .prologue
    .line 159
    if-nez p1, :cond_8

    .line 160
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, p2, p3}, Lzmq/EncoderBase;->nextStep([BIIZ)V

    .line 165
    :goto_7
    return-void

    .line 163
    :cond_8
    invoke-virtual {p1}, Lzmq/Msg;->data()[B

    move-result-object v0

    invoke-virtual {p1}, Lzmq/Msg;->size()I

    move-result v1

    invoke-virtual {p0, v0, v1, p2, p3}, Lzmq/EncoderBase;->nextStep([BIIZ)V

    goto :goto_7
.end method

.method protected nextStep([BIIZ)V
    .registers 6
    .param p1, "buf"    # [B
    .param p2, "toWrite"    # I
    .param p3, "next"    # I
    .param p4, "beginning"    # Z

    .prologue
    .line 170
    iput-object p1, p0, Lzmq/EncoderBase;->writeBuf:[B

    .line 171
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/EncoderBase;->writeChannel:Ljava/nio/channels/FileChannel;

    .line 172
    const/4 v0, 0x0

    iput v0, p0, Lzmq/EncoderBase;->writePos:I

    .line 173
    iput p2, p0, Lzmq/EncoderBase;->toWrite:I

    .line 174
    iput p3, p0, Lzmq/EncoderBase;->next:I

    .line 175
    iput-boolean p4, p0, Lzmq/EncoderBase;->beginning:Z

    .line 176
    return-void
.end method

.method protected state()I
    .registers 2

    .prologue
    .line 137
    iget v0, p0, Lzmq/EncoderBase;->next:I

    return v0
.end method

.method protected state(I)V
    .registers 2
    .param p1, "state"    # I

    .prologue
    .line 142
    iput p1, p0, Lzmq/EncoderBase;->next:I

    .line 143
    return-void
.end method
