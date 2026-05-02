.class public abstract Lorg/msgpack/packer/AbstractPacker;
.super Ljava/lang/Object;
.source "AbstractPacker.java"

# interfaces
.implements Lorg/msgpack/packer/Packer;


# instance fields
.field protected msgpack:Lorg/msgpack/MessagePack;


# direct methods
.method protected constructor <init>(Lorg/msgpack/MessagePack;)V
    .registers 2
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lorg/msgpack/packer/AbstractPacker;->msgpack:Lorg/msgpack/MessagePack;

    .line 32
    return-void
.end method


# virtual methods
.method public close()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 232
    return-void
.end method

.method public write(B)Lorg/msgpack/packer/Packer;
    .registers 2
    .param p1, "o"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    invoke-virtual {p0, p1}, Lorg/msgpack/packer/AbstractPacker;->writeByte(B)V

    .line 43
    return-object p0
.end method

.method public write(D)Lorg/msgpack/packer/Packer;
    .registers 3
    .param p1, "o"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    invoke-virtual {p0, p1, p2}, Lorg/msgpack/packer/AbstractPacker;->writeDouble(D)V

    .line 73
    return-object p0
.end method

.method public write(F)Lorg/msgpack/packer/Packer;
    .registers 2
    .param p1, "o"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    invoke-virtual {p0, p1}, Lorg/msgpack/packer/AbstractPacker;->writeFloat(F)V

    .line 67
    return-object p0
.end method

.method public write(I)Lorg/msgpack/packer/Packer;
    .registers 2
    .param p1, "o"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    invoke-virtual {p0, p1}, Lorg/msgpack/packer/AbstractPacker;->writeInt(I)V

    .line 55
    return-object p0
.end method

.method public write(J)Lorg/msgpack/packer/Packer;
    .registers 3
    .param p1, "o"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    invoke-virtual {p0, p1, p2}, Lorg/msgpack/packer/AbstractPacker;->writeLong(J)V

    .line 61
    return-object p0
.end method

.method public write(Ljava/lang/Boolean;)Lorg/msgpack/packer/Packer;
    .registers 3
    .param p1, "o"    # Ljava/lang/Boolean;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    if-nez p1, :cond_6

    .line 79
    invoke-virtual {p0}, Lorg/msgpack/packer/AbstractPacker;->writeNil()Lorg/msgpack/packer/Packer;

    .line 83
    :goto_5
    return-object p0

    .line 81
    :cond_6
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {p0, v0}, Lorg/msgpack/packer/AbstractPacker;->writeBoolean(Z)V

    goto :goto_5
.end method

.method public write(Ljava/lang/Byte;)Lorg/msgpack/packer/Packer;
    .registers 3
    .param p1, "o"    # Ljava/lang/Byte;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    if-nez p1, :cond_6

    .line 89
    invoke-virtual {p0}, Lorg/msgpack/packer/AbstractPacker;->writeNil()Lorg/msgpack/packer/Packer;

    .line 93
    :goto_5
    return-object p0

    .line 91
    :cond_6
    invoke-virtual {p1}, Ljava/lang/Byte;->byteValue()B

    move-result v0

    invoke-virtual {p0, v0}, Lorg/msgpack/packer/AbstractPacker;->writeByte(B)V

    goto :goto_5
.end method

.method public write(Ljava/lang/Double;)Lorg/msgpack/packer/Packer;
    .registers 4
    .param p1, "o"    # Ljava/lang/Double;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 148
    if-nez p1, :cond_6

    .line 149
    invoke-virtual {p0}, Lorg/msgpack/packer/AbstractPacker;->writeNil()Lorg/msgpack/packer/Packer;

    .line 153
    :goto_5
    return-object p0

    .line 151
    :cond_6
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/packer/AbstractPacker;->writeDouble(D)V

    goto :goto_5
.end method

.method public write(Ljava/lang/Float;)Lorg/msgpack/packer/Packer;
    .registers 3
    .param p1, "o"    # Ljava/lang/Float;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    if-nez p1, :cond_6

    .line 139
    invoke-virtual {p0}, Lorg/msgpack/packer/AbstractPacker;->writeNil()Lorg/msgpack/packer/Packer;

    .line 143
    :goto_5
    return-object p0

    .line 141
    :cond_6
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p0, v0}, Lorg/msgpack/packer/AbstractPacker;->writeFloat(F)V

    goto :goto_5
.end method

.method public write(Ljava/lang/Integer;)Lorg/msgpack/packer/Packer;
    .registers 3
    .param p1, "o"    # Ljava/lang/Integer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    if-nez p1, :cond_6

    .line 109
    invoke-virtual {p0}, Lorg/msgpack/packer/AbstractPacker;->writeNil()Lorg/msgpack/packer/Packer;

    .line 113
    :goto_5
    return-object p0

    .line 111
    :cond_6
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/msgpack/packer/AbstractPacker;->writeInt(I)V

    goto :goto_5
.end method

.method public write(Ljava/lang/Long;)Lorg/msgpack/packer/Packer;
    .registers 4
    .param p1, "o"    # Ljava/lang/Long;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    if-nez p1, :cond_6

    .line 119
    invoke-virtual {p0}, Lorg/msgpack/packer/AbstractPacker;->writeNil()Lorg/msgpack/packer/Packer;

    .line 123
    :goto_5
    return-object p0

    .line 121
    :cond_6
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/packer/AbstractPacker;->writeLong(J)V

    goto :goto_5
.end method

.method public write(Ljava/lang/Object;)Lorg/msgpack/packer/Packer;
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 199
    if-nez p1, :cond_6

    .line 200
    invoke-virtual {p0}, Lorg/msgpack/packer/AbstractPacker;->writeNil()Lorg/msgpack/packer/Packer;

    .line 205
    :goto_5
    return-object p0

    .line 202
    :cond_6
    iget-object v1, p0, Lorg/msgpack/packer/AbstractPacker;->msgpack:Lorg/msgpack/MessagePack;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/msgpack/MessagePack;->lookup(Ljava/lang/Class;)Lorg/msgpack/template/Template;

    move-result-object v0

    .line 203
    .local v0, "tmpl":Lorg/msgpack/template/Template;
    invoke-interface {v0, p0, p1}, Lorg/msgpack/template/Template;->write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;)V

    goto :goto_5
.end method

.method public write(Ljava/lang/Short;)Lorg/msgpack/packer/Packer;
    .registers 3
    .param p1, "o"    # Ljava/lang/Short;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 98
    if-nez p1, :cond_6

    .line 99
    invoke-virtual {p0}, Lorg/msgpack/packer/AbstractPacker;->writeNil()Lorg/msgpack/packer/Packer;

    .line 103
    :goto_5
    return-object p0

    .line 101
    :cond_6
    invoke-virtual {p1}, Ljava/lang/Short;->shortValue()S

    move-result v0

    invoke-virtual {p0, v0}, Lorg/msgpack/packer/AbstractPacker;->writeShort(S)V

    goto :goto_5
.end method

.method public write(Ljava/lang/String;)Lorg/msgpack/packer/Packer;
    .registers 2
    .param p1, "o"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 188
    if-nez p1, :cond_6

    .line 189
    invoke-virtual {p0}, Lorg/msgpack/packer/AbstractPacker;->writeNil()Lorg/msgpack/packer/Packer;

    .line 193
    :goto_5
    return-object p0

    .line 191
    :cond_6
    invoke-virtual {p0, p1}, Lorg/msgpack/packer/AbstractPacker;->writeString(Ljava/lang/String;)V

    goto :goto_5
.end method

.method public write(Ljava/math/BigInteger;)Lorg/msgpack/packer/Packer;
    .registers 2
    .param p1, "o"    # Ljava/math/BigInteger;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    if-nez p1, :cond_6

    .line 129
    invoke-virtual {p0}, Lorg/msgpack/packer/AbstractPacker;->writeNil()Lorg/msgpack/packer/Packer;

    .line 133
    :goto_5
    return-object p0

    .line 131
    :cond_6
    invoke-virtual {p0, p1}, Lorg/msgpack/packer/AbstractPacker;->writeBigInteger(Ljava/math/BigInteger;)V

    goto :goto_5
.end method

.method public write(Ljava/nio/ByteBuffer;)Lorg/msgpack/packer/Packer;
    .registers 2
    .param p1, "o"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 178
    if-nez p1, :cond_6

    .line 179
    invoke-virtual {p0}, Lorg/msgpack/packer/AbstractPacker;->writeNil()Lorg/msgpack/packer/Packer;

    .line 183
    :goto_5
    return-object p0

    .line 181
    :cond_6
    invoke-virtual {p0, p1}, Lorg/msgpack/packer/AbstractPacker;->writeByteBuffer(Ljava/nio/ByteBuffer;)V

    goto :goto_5
.end method

.method public write(Lorg/msgpack/type/Value;)Lorg/msgpack/packer/Packer;
    .registers 2
    .param p1, "v"    # Lorg/msgpack/type/Value;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 210
    if-nez p1, :cond_6

    .line 211
    invoke-virtual {p0}, Lorg/msgpack/packer/AbstractPacker;->writeNil()Lorg/msgpack/packer/Packer;

    .line 215
    :goto_5
    return-object p0

    .line 213
    :cond_6
    invoke-interface {p1, p0}, Lorg/msgpack/type/Value;->writeTo(Lorg/msgpack/packer/Packer;)V

    goto :goto_5
.end method

.method public write(S)Lorg/msgpack/packer/Packer;
    .registers 2
    .param p1, "o"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    invoke-virtual {p0, p1}, Lorg/msgpack/packer/AbstractPacker;->writeShort(S)V

    .line 49
    return-object p0
.end method

.method public write(Z)Lorg/msgpack/packer/Packer;
    .registers 2
    .param p1, "o"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-virtual {p0, p1}, Lorg/msgpack/packer/AbstractPacker;->writeBoolean(Z)V

    .line 37
    return-object p0
.end method

.method public write([B)Lorg/msgpack/packer/Packer;
    .registers 2
    .param p1, "o"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 158
    if-nez p1, :cond_6

    .line 159
    invoke-virtual {p0}, Lorg/msgpack/packer/AbstractPacker;->writeNil()Lorg/msgpack/packer/Packer;

    .line 163
    :goto_5
    return-object p0

    .line 161
    :cond_6
    invoke-virtual {p0, p1}, Lorg/msgpack/packer/AbstractPacker;->writeByteArray([B)V

    goto :goto_5
.end method

.method public write([BII)Lorg/msgpack/packer/Packer;
    .registers 4
    .param p1, "o"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 168
    if-nez p1, :cond_6

    .line 169
    invoke-virtual {p0}, Lorg/msgpack/packer/AbstractPacker;->writeNil()Lorg/msgpack/packer/Packer;

    .line 173
    :goto_5
    return-object p0

    .line 171
    :cond_6
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/packer/AbstractPacker;->writeByteArray([BII)V

    goto :goto_5
.end method

.method public writeArrayEnd()Lorg/msgpack/packer/Packer;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 220
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/msgpack/packer/AbstractPacker;->writeArrayEnd(Z)Lorg/msgpack/packer/Packer;

    .line 221
    return-object p0
.end method

.method protected abstract writeBigInteger(Ljava/math/BigInteger;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract writeBoolean(Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract writeByte(B)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected writeByteArray([B)V
    .registers 4
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 251
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/msgpack/packer/AbstractPacker;->writeByteArray([BII)V

    .line 252
    return-void
.end method

.method protected abstract writeByteArray([BII)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract writeByteBuffer(Ljava/nio/ByteBuffer;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract writeDouble(D)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract writeFloat(F)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract writeInt(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract writeLong(J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public writeMapEnd()Lorg/msgpack/packer/Packer;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 226
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/msgpack/packer/AbstractPacker;->writeMapEnd(Z)Lorg/msgpack/packer/Packer;

    .line 227
    return-object p0
.end method

.method protected abstract writeShort(S)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract writeString(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
