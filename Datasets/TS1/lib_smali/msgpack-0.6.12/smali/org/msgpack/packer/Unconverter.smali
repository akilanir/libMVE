.class public Lorg/msgpack/packer/Unconverter;
.super Lorg/msgpack/packer/AbstractPacker;
.source "Unconverter.java"


# instance fields
.field private result:Lorg/msgpack/type/Value;

.field private stack:Lorg/msgpack/packer/PackerStack;

.field private values:[Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 37
    new-instance v0, Lorg/msgpack/MessagePack;

    invoke-direct {v0}, Lorg/msgpack/MessagePack;-><init>()V

    invoke-direct {p0, v0}, Lorg/msgpack/packer/Unconverter;-><init>(Lorg/msgpack/MessagePack;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/MessagePack;)V
    .registers 3
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lorg/msgpack/packer/AbstractPacker;-><init>(Lorg/msgpack/MessagePack;)V

    .line 42
    new-instance v0, Lorg/msgpack/packer/PackerStack;

    invoke-direct {v0}, Lorg/msgpack/packer/PackerStack;-><init>()V

    iput-object v0, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    .line 43
    const/16 v0, 0x80

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lorg/msgpack/packer/Unconverter;->values:[Ljava/lang/Object;

    .line 44
    return-void
.end method

.method private put(Lorg/msgpack/type/Value;)V
    .registers 5
    .param p1, "v"    # Lorg/msgpack/type/Value;

    .prologue
    .line 202
    iget-object v1, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v1}, Lorg/msgpack/packer/PackerStack;->getDepth()I

    move-result v1

    if-gtz v1, :cond_b

    .line 203
    iput-object p1, p0, Lorg/msgpack/packer/Unconverter;->result:Lorg/msgpack/type/Value;

    .line 210
    :goto_a
    return-void

    .line 205
    :cond_b
    iget-object v1, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v1}, Lorg/msgpack/packer/PackerStack;->checkCount()V

    .line 206
    iget-object v1, p0, Lorg/msgpack/packer/Unconverter;->values:[Ljava/lang/Object;

    iget-object v2, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->getDepth()I

    move-result v2

    aget-object v1, v1, v2

    check-cast v1, [Lorg/msgpack/type/Value;

    move-object v0, v1

    check-cast v0, [Lorg/msgpack/type/Value;

    .line 207
    .local v0, "array":[Lorg/msgpack/type/Value;
    array-length v1, v0

    iget-object v2, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->getTopCount()I

    move-result v2

    sub-int/2addr v1, v2

    aput-object p1, v0, v1

    .line 208
    iget-object v1, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v1}, Lorg/msgpack/packer/PackerStack;->reduceCount()V

    goto :goto_a
.end method

.method private putContainer(Lorg/msgpack/type/Value;)V
    .registers 5
    .param p1, "v"    # Lorg/msgpack/type/Value;

    .prologue
    .line 213
    iget-object v1, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v1}, Lorg/msgpack/packer/PackerStack;->getDepth()I

    move-result v1

    if-gtz v1, :cond_e

    .line 214
    iget-object v1, p0, Lorg/msgpack/packer/Unconverter;->values:[Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    .line 221
    :goto_d
    return-void

    .line 216
    :cond_e
    iget-object v1, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v1}, Lorg/msgpack/packer/PackerStack;->checkCount()V

    .line 217
    iget-object v1, p0, Lorg/msgpack/packer/Unconverter;->values:[Ljava/lang/Object;

    iget-object v2, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->getDepth()I

    move-result v2

    aget-object v1, v1, v2

    check-cast v1, [Lorg/msgpack/type/Value;

    move-object v0, v1

    check-cast v0, [Lorg/msgpack/type/Value;

    .line 218
    .local v0, "array":[Lorg/msgpack/type/Value;
    array-length v1, v0

    iget-object v2, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->getTopCount()I

    move-result v2

    sub-int/2addr v1, v2

    aput-object p1, v0, v1

    .line 219
    iget-object v1, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v1}, Lorg/msgpack/packer/PackerStack;->reduceCount()V

    goto :goto_d
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
    .line 229
    return-void
.end method

.method public flush()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 225
    return-void
.end method

.method public getResult()Lorg/msgpack/type/Value;
    .registers 2

    .prologue
    .line 47
    iget-object v0, p0, Lorg/msgpack/packer/Unconverter;->result:Lorg/msgpack/type/Value;

    return-object v0
.end method

.method public resetResult()V
    .registers 2

    .prologue
    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/msgpack/packer/Unconverter;->result:Lorg/msgpack/type/Value;

    .line 52
    return-void
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
    .line 197
    invoke-direct {p0, p1}, Lorg/msgpack/packer/Unconverter;->put(Lorg/msgpack/type/Value;)V

    .line 198
    return-object p0
.end method

.method public writeArrayBegin(I)Lorg/msgpack/packer/Packer;
    .registers 6
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 117
    if-nez p1, :cond_1b

    .line 119
    invoke-static {}, Lorg/msgpack/type/ValueFactory;->createArrayValue()Lorg/msgpack/type/ArrayValue;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/msgpack/packer/Unconverter;->putContainer(Lorg/msgpack/type/Value;)V

    .line 120
    iget-object v1, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/msgpack/packer/PackerStack;->pushArray(I)V

    .line 121
    iget-object v1, p0, Lorg/msgpack/packer/Unconverter;->values:[Ljava/lang/Object;

    iget-object v2, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->getDepth()I

    move-result v2

    const/4 v3, 0x0

    aput-object v3, v1, v2

    .line 128
    :goto_1a
    return-object p0

    .line 123
    :cond_1b
    new-array v0, p1, [Lorg/msgpack/type/Value;

    .line 124
    .local v0, "array":[Lorg/msgpack/type/Value;
    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/msgpack/type/ValueFactory;->createArrayValue([Lorg/msgpack/type/Value;Z)Lorg/msgpack/type/ArrayValue;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/msgpack/packer/Unconverter;->putContainer(Lorg/msgpack/type/Value;)V

    .line 125
    iget-object v1, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v1, p1}, Lorg/msgpack/packer/PackerStack;->pushArray(I)V

    .line 126
    iget-object v1, p0, Lorg/msgpack/packer/Unconverter;->values:[Ljava/lang/Object;

    iget-object v2, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->getDepth()I

    move-result v2

    aput-object v0, v1, v2

    goto :goto_1a
.end method

.method public writeArrayEnd(Z)Lorg/msgpack/packer/Packer;
    .registers 6
    .param p1, "check"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    iget-object v2, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->topIsArray()Z

    move-result v2

    if-nez v2, :cond_10

    .line 134
    new-instance v2, Lorg/msgpack/MessageTypeException;

    const-string v3, "writeArrayEnd() is called but writeArrayBegin() is not called"

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 138
    :cond_10
    iget-object v2, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->getTopCount()I

    move-result v1

    .line 139
    .local v1, "remain":I
    if-lez v1, :cond_2b

    .line 140
    if-eqz p1, :cond_22

    .line 141
    new-instance v2, Lorg/msgpack/MessageTypeException;

    const-string v3, "writeArrayEnd(check=true) is called but the array is not end"

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 144
    :cond_22
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_23
    if-ge v0, v1, :cond_2b

    .line 145
    invoke-virtual {p0}, Lorg/msgpack/packer/Unconverter;->writeNil()Lorg/msgpack/packer/Packer;

    .line 144
    add-int/lit8 v0, v0, 0x1

    goto :goto_23

    .line 148
    .end local v0    # "i":I
    :cond_2b
    iget-object v2, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->pop()V

    .line 149
    iget-object v2, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->getDepth()I

    move-result v2

    if-gtz v2, :cond_41

    .line 150
    iget-object v2, p0, Lorg/msgpack/packer/Unconverter;->values:[Ljava/lang/Object;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    check-cast v2, Lorg/msgpack/type/Value;

    iput-object v2, p0, Lorg/msgpack/packer/Unconverter;->result:Lorg/msgpack/type/Value;

    .line 152
    :cond_41
    return-object p0
.end method

.method public writeBigInteger(Ljava/math/BigInteger;)V
    .registers 3
    .param p1, "v"    # Ljava/math/BigInteger;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    invoke-static {p1}, Lorg/msgpack/type/ValueFactory;->createIntegerValue(Ljava/math/BigInteger;)Lorg/msgpack/type/IntegerValue;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/msgpack/packer/Unconverter;->put(Lorg/msgpack/type/Value;)V

    .line 77
    return-void
.end method

.method public writeBoolean(Z)V
    .registers 3
    .param p1, "v"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    invoke-static {p1}, Lorg/msgpack/type/ValueFactory;->createBooleanValue(Z)Lorg/msgpack/type/BooleanValue;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/msgpack/packer/Unconverter;->put(Lorg/msgpack/type/Value;)V

    .line 57
    return-void
.end method

.method public writeByte(B)V
    .registers 3
    .param p1, "v"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 61
    invoke-static {p1}, Lorg/msgpack/type/ValueFactory;->createIntegerValue(B)Lorg/msgpack/type/IntegerValue;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/msgpack/packer/Unconverter;->put(Lorg/msgpack/type/Value;)V

    .line 62
    return-void
.end method

.method public writeByteArray([BII)V
    .registers 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 96
    invoke-static {p1, p2, p3}, Lorg/msgpack/type/ValueFactory;->createRawValue([BII)Lorg/msgpack/type/RawValue;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/msgpack/packer/Unconverter;->put(Lorg/msgpack/type/Value;)V

    .line 97
    return-void
.end method

.method public writeByteBuffer(Ljava/nio/ByteBuffer;)V
    .registers 3
    .param p1, "bb"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    invoke-static {p1}, Lorg/msgpack/type/ValueFactory;->createRawValue(Ljava/nio/ByteBuffer;)Lorg/msgpack/type/RawValue;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/msgpack/packer/Unconverter;->put(Lorg/msgpack/type/Value;)V

    .line 102
    return-void
.end method

.method public writeDouble(D)V
    .registers 4
    .param p1, "v"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    invoke-static {p1, p2}, Lorg/msgpack/type/ValueFactory;->createFloatValue(D)Lorg/msgpack/type/FloatValue;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/msgpack/packer/Unconverter;->put(Lorg/msgpack/type/Value;)V

    .line 92
    return-void
.end method

.method public writeFloat(F)V
    .registers 3
    .param p1, "v"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    invoke-static {p1}, Lorg/msgpack/type/ValueFactory;->createFloatValue(F)Lorg/msgpack/type/FloatValue;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/msgpack/packer/Unconverter;->put(Lorg/msgpack/type/Value;)V

    .line 87
    return-void
.end method

.method public writeInt(I)V
    .registers 3
    .param p1, "v"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    invoke-static {p1}, Lorg/msgpack/type/ValueFactory;->createIntegerValue(I)Lorg/msgpack/type/IntegerValue;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/msgpack/packer/Unconverter;->put(Lorg/msgpack/type/Value;)V

    .line 72
    return-void
.end method

.method public writeLong(J)V
    .registers 4
    .param p1, "v"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    invoke-static {p1, p2}, Lorg/msgpack/type/ValueFactory;->createIntegerValue(J)Lorg/msgpack/type/IntegerValue;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/msgpack/packer/Unconverter;->put(Lorg/msgpack/type/Value;)V

    .line 82
    return-void
.end method

.method public writeMapBegin(I)Lorg/msgpack/packer/Packer;
    .registers 6
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 157
    iget-object v1, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v1}, Lorg/msgpack/packer/PackerStack;->checkCount()V

    .line 158
    if-nez p1, :cond_20

    .line 159
    invoke-static {}, Lorg/msgpack/type/ValueFactory;->createMapValue()Lorg/msgpack/type/MapValue;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/msgpack/packer/Unconverter;->putContainer(Lorg/msgpack/type/Value;)V

    .line 160
    iget-object v1, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/msgpack/packer/PackerStack;->pushMap(I)V

    .line 161
    iget-object v1, p0, Lorg/msgpack/packer/Unconverter;->values:[Ljava/lang/Object;

    iget-object v2, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->getDepth()I

    move-result v2

    const/4 v3, 0x0

    aput-object v3, v1, v2

    .line 168
    :goto_1f
    return-object p0

    .line 163
    :cond_20
    mul-int/lit8 v1, p1, 0x2

    new-array v0, v1, [Lorg/msgpack/type/Value;

    .line 164
    .local v0, "array":[Lorg/msgpack/type/Value;
    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/msgpack/type/ValueFactory;->createMapValue([Lorg/msgpack/type/Value;Z)Lorg/msgpack/type/MapValue;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/msgpack/packer/Unconverter;->putContainer(Lorg/msgpack/type/Value;)V

    .line 165
    iget-object v1, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v1, p1}, Lorg/msgpack/packer/PackerStack;->pushMap(I)V

    .line 166
    iget-object v1, p0, Lorg/msgpack/packer/Unconverter;->values:[Ljava/lang/Object;

    iget-object v2, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->getDepth()I

    move-result v2

    aput-object v0, v1, v2

    goto :goto_1f
.end method

.method public writeMapEnd(Z)Lorg/msgpack/packer/Packer;
    .registers 6
    .param p1, "check"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 173
    iget-object v2, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->topIsMap()Z

    move-result v2

    if-nez v2, :cond_10

    .line 174
    new-instance v2, Lorg/msgpack/MessageTypeException;

    const-string v3, "writeMapEnd() is called but writeMapBegin() is not called"

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 178
    :cond_10
    iget-object v2, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->getTopCount()I

    move-result v1

    .line 179
    .local v1, "remain":I
    if-lez v1, :cond_2b

    .line 180
    if-eqz p1, :cond_22

    .line 181
    new-instance v2, Lorg/msgpack/MessageTypeException;

    const-string v3, "writeMapEnd(check=true) is called but the map is not end"

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 184
    :cond_22
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_23
    if-ge v0, v1, :cond_2b

    .line 185
    invoke-virtual {p0}, Lorg/msgpack/packer/Unconverter;->writeNil()Lorg/msgpack/packer/Packer;

    .line 184
    add-int/lit8 v0, v0, 0x1

    goto :goto_23

    .line 188
    .end local v0    # "i":I
    :cond_2b
    iget-object v2, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->pop()V

    .line 189
    iget-object v2, p0, Lorg/msgpack/packer/Unconverter;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->getDepth()I

    move-result v2

    if-gtz v2, :cond_41

    .line 190
    iget-object v2, p0, Lorg/msgpack/packer/Unconverter;->values:[Ljava/lang/Object;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    check-cast v2, Lorg/msgpack/type/Value;

    iput-object v2, p0, Lorg/msgpack/packer/Unconverter;->result:Lorg/msgpack/type/Value;

    .line 192
    :cond_41
    return-object p0
.end method

.method public writeNil()Lorg/msgpack/packer/Packer;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    invoke-static {}, Lorg/msgpack/type/ValueFactory;->createNilValue()Lorg/msgpack/type/NilValue;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/msgpack/packer/Unconverter;->put(Lorg/msgpack/type/Value;)V

    .line 112
    return-object p0
.end method

.method public writeShort(S)V
    .registers 3
    .param p1, "v"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    invoke-static {p1}, Lorg/msgpack/type/ValueFactory;->createIntegerValue(S)Lorg/msgpack/type/IntegerValue;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/msgpack/packer/Unconverter;->put(Lorg/msgpack/type/Value;)V

    .line 67
    return-void
.end method

.method public writeString(Ljava/lang/String;)V
    .registers 3
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    invoke-static {p1}, Lorg/msgpack/type/ValueFactory;->createRawValue(Ljava/lang/String;)Lorg/msgpack/type/RawValue;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/msgpack/packer/Unconverter;->put(Lorg/msgpack/type/Value;)V

    .line 107
    return-void
.end method
