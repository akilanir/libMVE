.class public Lorg/msgpack/packer/MessagePackPacker;
.super Lorg/msgpack/packer/AbstractPacker;
.source "MessagePackPacker.java"


# instance fields
.field protected final out:Lorg/msgpack/io/Output;

.field private stack:Lorg/msgpack/packer/PackerStack;


# direct methods
.method public constructor <init>(Lorg/msgpack/MessagePack;Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;
    .param p2, "stream"    # Ljava/io/OutputStream;

    .prologue
    .line 36
    new-instance v0, Lorg/msgpack/io/StreamOutput;

    invoke-direct {v0, p2}, Lorg/msgpack/io/StreamOutput;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {p0, p1, v0}, Lorg/msgpack/packer/MessagePackPacker;-><init>(Lorg/msgpack/MessagePack;Lorg/msgpack/io/Output;)V

    .line 37
    return-void
.end method

.method protected constructor <init>(Lorg/msgpack/MessagePack;Lorg/msgpack/io/Output;)V
    .registers 4
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;
    .param p2, "out"    # Lorg/msgpack/io/Output;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lorg/msgpack/packer/AbstractPacker;-><init>(Lorg/msgpack/MessagePack;)V

    .line 33
    new-instance v0, Lorg/msgpack/packer/PackerStack;

    invoke-direct {v0}, Lorg/msgpack/packer/PackerStack;-><init>()V

    iput-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    .line 41
    iput-object p2, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    .line 42
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 332
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    invoke-interface {v0}, Lorg/msgpack/io/Output;->close()V

    .line 333
    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 327
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    invoke-interface {v0}, Lorg/msgpack/io/Output;->flush()V

    .line 328
    return-void
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 322
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v0}, Lorg/msgpack/packer/PackerStack;->clear()V

    .line 323
    return-void
.end method

.method public writeArrayBegin(I)Lorg/msgpack/packer/Packer;
    .registers 5
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 250
    const/16 v0, 0x10

    if-ge p1, v0, :cond_17

    .line 252
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    or-int/lit16 v1, p1, 0x90

    int-to-byte v1, v1

    invoke-interface {v0, v1}, Lorg/msgpack/io/Output;->writeByte(B)V

    .line 258
    :goto_c
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v0}, Lorg/msgpack/packer/PackerStack;->reduceCount()V

    .line 259
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v0, p1}, Lorg/msgpack/packer/PackerStack;->pushArray(I)V

    .line 260
    return-object p0

    .line 253
    :cond_17
    const/high16 v0, 0x10000

    if-ge p1, v0, :cond_24

    .line 254
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x24

    int-to-short v2, p1

    invoke-interface {v0, v1, v2}, Lorg/msgpack/io/Output;->writeByteAndShort(BS)V

    goto :goto_c

    .line 256
    :cond_24
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x23

    invoke-interface {v0, v1, p1}, Lorg/msgpack/io/Output;->writeByteAndInt(BI)V

    goto :goto_c
.end method

.method public writeArrayEnd(Z)Lorg/msgpack/packer/Packer;
    .registers 7
    .param p1, "check"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 265
    iget-object v2, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->topIsArray()Z

    move-result v2

    if-nez v2, :cond_10

    .line 266
    new-instance v2, Lorg/msgpack/MessageTypeException;

    const-string v3, "writeArrayEnd() is called but writeArrayBegin() is not called"

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 270
    :cond_10
    iget-object v2, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->getTopCount()I

    move-result v1

    .line 271
    .local v1, "remain":I
    if-lez v1, :cond_3c

    .line 272
    if-eqz p1, :cond_33

    .line 273
    new-instance v2, Lorg/msgpack/MessageTypeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "writeArrayEnd(check=true) is called but the array is not end: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 276
    :cond_33
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_34
    if-ge v0, v1, :cond_3c

    .line 277
    invoke-virtual {p0}, Lorg/msgpack/packer/MessagePackPacker;->writeNil()Lorg/msgpack/packer/Packer;

    .line 276
    add-int/lit8 v0, v0, 0x1

    goto :goto_34

    .line 280
    .end local v0    # "i":I
    :cond_3c
    iget-object v2, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->pop()V

    .line 281
    return-object p0
.end method

.method protected writeBigInteger(Ljava/math/BigInteger;)V
    .registers 6
    .param p1, "d"    # Ljava/math/BigInteger;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 157
    invoke-virtual {p1}, Ljava/math/BigInteger;->bitLength()I

    move-result v0

    const/16 v1, 0x3f

    if-gt v0, v1, :cond_15

    .line 158
    invoke-virtual {p1}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/packer/MessagePackPacker;->writeLong(J)V

    .line 159
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v0}, Lorg/msgpack/packer/PackerStack;->reduceCount()V

    .line 168
    :goto_14
    return-void

    .line 160
    :cond_15
    invoke-virtual {p1}, Ljava/math/BigInteger;->bitLength()I

    move-result v0

    const/16 v1, 0x40

    if-ne v0, v1, :cond_35

    invoke-virtual {p1}, Ljava/math/BigInteger;->signum()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_35

    .line 162
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x31

    invoke-virtual {p1}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Lorg/msgpack/io/Output;->writeByteAndLong(BJ)V

    .line 163
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v0}, Lorg/msgpack/packer/PackerStack;->reduceCount()V

    goto :goto_14

    .line 165
    :cond_35
    new-instance v0, Lorg/msgpack/MessageTypeException;

    const-string v1, "MessagePack can\'t serialize BigInteger larger than (2^64)-1"

    invoke-direct {v0, v1}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected writeBoolean(Z)V
    .registers 4
    .param p1, "d"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 184
    if-eqz p1, :cond_f

    .line 186
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x3d

    invoke-interface {v0, v1}, Lorg/msgpack/io/Output;->writeByte(B)V

    .line 191
    :goto_9
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v0}, Lorg/msgpack/packer/PackerStack;->reduceCount()V

    .line 192
    return-void

    .line 189
    :cond_f
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x3e

    invoke-interface {v0, v1}, Lorg/msgpack/io/Output;->writeByte(B)V

    goto :goto_9
.end method

.method protected writeByte(B)V
    .registers 4
    .param p1, "d"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 46
    const/16 v0, -0x20

    if-ge p1, v0, :cond_11

    .line 47
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x30

    invoke-interface {v0, v1, p1}, Lorg/msgpack/io/Output;->writeByteAndByte(BB)V

    .line 51
    :goto_b
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v0}, Lorg/msgpack/packer/PackerStack;->reduceCount()V

    .line 52
    return-void

    .line 49
    :cond_11
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    invoke-interface {v0, p1}, Lorg/msgpack/io/Output;->writeByte(B)V

    goto :goto_b
.end method

.method protected writeByteArray([BII)V
    .registers 7
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 197
    const/16 v0, 0x20

    if-ge p3, v0, :cond_17

    .line 198
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    or-int/lit16 v1, p3, 0xa0

    int-to-byte v1, v1

    invoke-interface {v0, v1}, Lorg/msgpack/io/Output;->writeByte(B)V

    .line 204
    :goto_c
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    invoke-interface {v0, p1, p2, p3}, Lorg/msgpack/io/Output;->write([BII)V

    .line 205
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v0}, Lorg/msgpack/packer/PackerStack;->reduceCount()V

    .line 206
    return-void

    .line 199
    :cond_17
    const/high16 v0, 0x10000

    if-ge p3, v0, :cond_24

    .line 200
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x26

    int-to-short v2, p3

    invoke-interface {v0, v1, v2}, Lorg/msgpack/io/Output;->writeByteAndShort(BS)V

    goto :goto_c

    .line 202
    :cond_24
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x25

    invoke-interface {v0, v1, p3}, Lorg/msgpack/io/Output;->writeByteAndInt(BI)V

    goto :goto_c
.end method

.method protected writeByteBuffer(Ljava/nio/ByteBuffer;)V
    .registers 7
    .param p1, "bb"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 210
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    .line 211
    .local v0, "len":I
    const/16 v2, 0x20

    if-ge v0, v2, :cond_22

    .line 212
    iget-object v2, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    or-int/lit16 v3, v0, 0xa0

    int-to-byte v3, v3

    invoke-interface {v2, v3}, Lorg/msgpack/io/Output;->writeByte(B)V

    .line 218
    :goto_10
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    .line 220
    .local v1, "pos":I
    :try_start_14
    iget-object v2, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    invoke-interface {v2, p1}, Lorg/msgpack/io/Output;->write(Ljava/nio/ByteBuffer;)V
    :try_end_19
    .catchall {:try_start_14 .. :try_end_19} :catchall_37

    .line 222
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 224
    iget-object v2, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->reduceCount()V

    .line 225
    return-void

    .line 213
    .end local v1    # "pos":I
    :cond_22
    const/high16 v2, 0x10000

    if-ge v0, v2, :cond_2f

    .line 214
    iget-object v2, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v3, -0x26

    int-to-short v4, v0

    invoke-interface {v2, v3, v4}, Lorg/msgpack/io/Output;->writeByteAndShort(BS)V

    goto :goto_10

    .line 216
    :cond_2f
    iget-object v2, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v3, -0x25

    invoke-interface {v2, v3, v0}, Lorg/msgpack/io/Output;->writeByteAndInt(BI)V

    goto :goto_10

    .line 222
    .restart local v1    # "pos":I
    :catchall_37
    move-exception v2

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    throw v2
.end method

.method protected writeDouble(D)V
    .registers 5
    .param p1, "d"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 178
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x35

    invoke-interface {v0, v1, p1, p2}, Lorg/msgpack/io/Output;->writeByteAndDouble(BD)V

    .line 179
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v0}, Lorg/msgpack/packer/PackerStack;->reduceCount()V

    .line 180
    return-void
.end method

.method protected writeFloat(F)V
    .registers 4
    .param p1, "d"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 172
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x36

    invoke-interface {v0, v1, p1}, Lorg/msgpack/io/Output;->writeByteAndFloat(BF)V

    .line 173
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v0}, Lorg/msgpack/packer/PackerStack;->reduceCount()V

    .line 174
    return-void
.end method

.method protected writeInt(I)V
    .registers 5
    .param p1, "d"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    const/16 v0, -0x20

    if-ge p1, v0, :cond_2b

    .line 82
    const/16 v0, -0x8000

    if-ge p1, v0, :cond_15

    .line 84
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x2e

    invoke-interface {v0, v1, p1}, Lorg/msgpack/io/Output;->writeByteAndInt(BI)V

    .line 107
    :goto_f
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v0}, Lorg/msgpack/packer/PackerStack;->reduceCount()V

    .line 108
    return-void

    .line 85
    :cond_15
    const/16 v0, -0x80

    if-ge p1, v0, :cond_22

    .line 87
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x2f

    int-to-short v2, p1

    invoke-interface {v0, v1, v2}, Lorg/msgpack/io/Output;->writeByteAndShort(BS)V

    goto :goto_f

    .line 90
    :cond_22
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x30

    int-to-byte v2, p1

    invoke-interface {v0, v1, v2}, Lorg/msgpack/io/Output;->writeByteAndByte(BB)V

    goto :goto_f

    .line 92
    :cond_2b
    const/16 v0, 0x80

    if-ge p1, v0, :cond_36

    .line 94
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    int-to-byte v1, p1

    invoke-interface {v0, v1}, Lorg/msgpack/io/Output;->writeByte(B)V

    goto :goto_f

    .line 96
    :cond_36
    const/16 v0, 0x100

    if-ge p1, v0, :cond_43

    .line 98
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x34

    int-to-byte v2, p1

    invoke-interface {v0, v1, v2}, Lorg/msgpack/io/Output;->writeByteAndByte(BB)V

    goto :goto_f

    .line 99
    :cond_43
    const/high16 v0, 0x10000

    if-ge p1, v0, :cond_50

    .line 101
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x33

    int-to-short v2, p1

    invoke-interface {v0, v1, v2}, Lorg/msgpack/io/Output;->writeByteAndShort(BS)V

    goto :goto_f

    .line 104
    :cond_50
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x32

    invoke-interface {v0, v1, p1}, Lorg/msgpack/io/Output;->writeByteAndInt(BI)V

    goto :goto_f
.end method

.method protected writeLong(J)V
    .registers 6
    .param p1, "d"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    const-wide/16 v0, -0x20

    cmp-long v0, p1, v0

    if-gez v0, :cond_43

    .line 113
    const-wide/16 v0, -0x8000

    cmp-long v0, p1, v0

    if-gez v0, :cond_29

    .line 114
    const-wide/32 v0, -0x80000000

    cmp-long v0, p1, v0

    if-gez v0, :cond_20

    .line 116
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x2d

    invoke-interface {v0, v1, p1, p2}, Lorg/msgpack/io/Output;->writeByteAndLong(BJ)V

    .line 152
    :goto_1a
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v0}, Lorg/msgpack/packer/PackerStack;->reduceCount()V

    .line 153
    return-void

    .line 119
    :cond_20
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x2e

    long-to-int v2, p1

    invoke-interface {v0, v1, v2}, Lorg/msgpack/io/Output;->writeByteAndInt(BI)V

    goto :goto_1a

    .line 122
    :cond_29
    const-wide/16 v0, -0x80

    cmp-long v0, p1, v0

    if-gez v0, :cond_39

    .line 124
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x2f

    long-to-int v2, p1

    int-to-short v2, v2

    invoke-interface {v0, v1, v2}, Lorg/msgpack/io/Output;->writeByteAndShort(BS)V

    goto :goto_1a

    .line 127
    :cond_39
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x30

    long-to-int v2, p1

    int-to-byte v2, v2

    invoke-interface {v0, v1, v2}, Lorg/msgpack/io/Output;->writeByteAndByte(BB)V

    goto :goto_1a

    .line 130
    :cond_43
    const-wide/16 v0, 0x80

    cmp-long v0, p1, v0

    if-gez v0, :cond_51

    .line 132
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    long-to-int v1, p1

    int-to-byte v1, v1

    invoke-interface {v0, v1}, Lorg/msgpack/io/Output;->writeByte(B)V

    goto :goto_1a

    .line 134
    :cond_51
    const-wide/32 v0, 0x10000

    cmp-long v0, p1, v0

    if-gez v0, :cond_72

    .line 135
    const-wide/16 v0, 0x100

    cmp-long v0, p1, v0

    if-gez v0, :cond_68

    .line 137
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x34

    long-to-int v2, p1

    int-to-byte v2, v2

    invoke-interface {v0, v1, v2}, Lorg/msgpack/io/Output;->writeByteAndByte(BB)V

    goto :goto_1a

    .line 140
    :cond_68
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x33

    long-to-int v2, p1

    int-to-short v2, v2

    invoke-interface {v0, v1, v2}, Lorg/msgpack/io/Output;->writeByteAndShort(BS)V

    goto :goto_1a

    .line 143
    :cond_72
    const-wide v0, 0x100000000L

    cmp-long v0, p1, v0

    if-gez v0, :cond_84

    .line 145
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x32

    long-to-int v2, p1

    invoke-interface {v0, v1, v2}, Lorg/msgpack/io/Output;->writeByteAndInt(BI)V

    goto :goto_1a

    .line 148
    :cond_84
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x31

    invoke-interface {v0, v1, p1, p2}, Lorg/msgpack/io/Output;->writeByteAndLong(BJ)V

    goto :goto_1a
.end method

.method public writeMapBegin(I)Lorg/msgpack/packer/Packer;
    .registers 5
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 287
    const/16 v0, 0x10

    if-ge p1, v0, :cond_17

    .line 289
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    or-int/lit16 v1, p1, 0x80

    int-to-byte v1, v1

    invoke-interface {v0, v1}, Lorg/msgpack/io/Output;->writeByte(B)V

    .line 295
    :goto_c
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v0}, Lorg/msgpack/packer/PackerStack;->reduceCount()V

    .line 296
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v0, p1}, Lorg/msgpack/packer/PackerStack;->pushMap(I)V

    .line 297
    return-object p0

    .line 290
    :cond_17
    const/high16 v0, 0x10000

    if-ge p1, v0, :cond_24

    .line 291
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x22

    int-to-short v2, p1

    invoke-interface {v0, v1, v2}, Lorg/msgpack/io/Output;->writeByteAndShort(BS)V

    goto :goto_c

    .line 293
    :cond_24
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x21

    invoke-interface {v0, v1, p1}, Lorg/msgpack/io/Output;->writeByteAndInt(BI)V

    goto :goto_c
.end method

.method public writeMapEnd(Z)Lorg/msgpack/packer/Packer;
    .registers 7
    .param p1, "check"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 302
    iget-object v2, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->topIsMap()Z

    move-result v2

    if-nez v2, :cond_10

    .line 303
    new-instance v2, Lorg/msgpack/MessageTypeException;

    const-string v3, "writeMapEnd() is called but writeMapBegin() is not called"

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 307
    :cond_10
    iget-object v2, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->getTopCount()I

    move-result v1

    .line 308
    .local v1, "remain":I
    if-lez v1, :cond_3c

    .line 309
    if-eqz p1, :cond_33

    .line 310
    new-instance v2, Lorg/msgpack/MessageTypeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "writeMapEnd(check=true) is called but the map is not end: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 313
    :cond_33
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_34
    if-ge v0, v1, :cond_3c

    .line 314
    invoke-virtual {p0}, Lorg/msgpack/packer/MessagePackPacker;->writeNil()Lorg/msgpack/packer/Packer;

    .line 313
    add-int/lit8 v0, v0, 0x1

    goto :goto_34

    .line 317
    .end local v0    # "i":I
    :cond_3c
    iget-object v2, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->pop()V

    .line 318
    return-object p0
.end method

.method public writeNil()Lorg/msgpack/packer/Packer;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 242
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x40

    invoke-interface {v0, v1}, Lorg/msgpack/io/Output;->writeByte(B)V

    .line 243
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v0}, Lorg/msgpack/packer/PackerStack;->reduceCount()V

    .line 244
    return-object p0
.end method

.method protected writeShort(S)V
    .registers 5
    .param p1, "d"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    const/16 v0, -0x20

    if-ge p1, v0, :cond_1e

    .line 57
    const/16 v0, -0x80

    if-ge p1, v0, :cond_15

    .line 59
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x2f

    invoke-interface {v0, v1, p1}, Lorg/msgpack/io/Output;->writeByteAndShort(BS)V

    .line 76
    :goto_f
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v0}, Lorg/msgpack/packer/PackerStack;->reduceCount()V

    .line 77
    return-void

    .line 62
    :cond_15
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x30

    int-to-byte v2, p1

    invoke-interface {v0, v1, v2}, Lorg/msgpack/io/Output;->writeByteAndByte(BB)V

    goto :goto_f

    .line 64
    :cond_1e
    const/16 v0, 0x80

    if-ge p1, v0, :cond_29

    .line 66
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    int-to-byte v1, p1

    invoke-interface {v0, v1}, Lorg/msgpack/io/Output;->writeByte(B)V

    goto :goto_f

    .line 68
    :cond_29
    const/16 v0, 0x100

    if-ge p1, v0, :cond_36

    .line 70
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x34

    int-to-byte v2, p1

    invoke-interface {v0, v1, v2}, Lorg/msgpack/io/Output;->writeByteAndByte(BB)V

    goto :goto_f

    .line 73
    :cond_36
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, -0x33

    invoke-interface {v0, v1, p1}, Lorg/msgpack/io/Output;->writeByteAndShort(BS)V

    goto :goto_f
.end method

.method protected writeString(Ljava/lang/String;)V
    .registers 6
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 232
    :try_start_0
    const-string v2, "UTF-8"

    invoke-virtual {p1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_5
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_5} :catch_11

    move-result-object v0

    .line 236
    .local v0, "b":[B
    const/4 v2, 0x0

    array-length v3, v0

    invoke-virtual {p0, v0, v2, v3}, Lorg/msgpack/packer/MessagePackPacker;->writeByteArray([BII)V

    .line 237
    iget-object v2, p0, Lorg/msgpack/packer/MessagePackPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->reduceCount()V

    .line 238
    return-void

    .line 233
    .end local v0    # "b":[B
    :catch_11
    move-exception v1

    .line 234
    .local v1, "ex":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Lorg/msgpack/MessageTypeException;

    invoke-direct {v2, v1}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method
