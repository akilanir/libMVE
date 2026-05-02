.class public Lorg/msgpack/unpacker/Converter;
.super Lorg/msgpack/unpacker/AbstractUnpacker;
.source "Converter.java"


# instance fields
.field private final stack:Lorg/msgpack/unpacker/UnpackerStack;

.field protected value:Lorg/msgpack/type/Value;

.field private values:[Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lorg/msgpack/MessagePack;Lorg/msgpack/type/Value;)V
    .registers 4
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;
    .param p2, "value"    # Lorg/msgpack/type/Value;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lorg/msgpack/unpacker/AbstractUnpacker;-><init>(Lorg/msgpack/MessagePack;)V

    .line 43
    new-instance v0, Lorg/msgpack/unpacker/UnpackerStack;

    invoke-direct {v0}, Lorg/msgpack/unpacker/UnpackerStack;-><init>()V

    iput-object v0, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    .line 44
    const/16 v0, 0x80

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lorg/msgpack/unpacker/Converter;->values:[Ljava/lang/Object;

    .line 45
    iput-object p2, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 46
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/type/Value;)V
    .registers 3
    .param p1, "value"    # Lorg/msgpack/type/Value;

    .prologue
    .line 38
    new-instance v0, Lorg/msgpack/MessagePack;

    invoke-direct {v0}, Lorg/msgpack/MessagePack;-><init>()V

    invoke-direct {p0, v0, p1}, Lorg/msgpack/unpacker/Converter;-><init>(Lorg/msgpack/MessagePack;Lorg/msgpack/type/Value;)V

    .line 39
    return-void
.end method

.method private ensureValue()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    iget-object v0, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    if-nez v0, :cond_a

    .line 54
    invoke-virtual {p0}, Lorg/msgpack/unpacker/Converter;->nextValue()Lorg/msgpack/type/Value;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 56
    :cond_a
    return-void
.end method

.method private getTop()Lorg/msgpack/type/Value;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 274
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->ensureValue()V

    .line 276
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->checkCount()V

    .line 277
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v1

    if-nez v1, :cond_13

    .line 282
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 285
    :goto_12
    return-object v1

    .line 284
    :cond_13
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->values:[Ljava/lang/Object;

    iget-object v2, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v2

    aget-object v1, v1, v2

    check-cast v1, [Lorg/msgpack/type/Value;

    move-object v0, v1

    check-cast v0, [Lorg/msgpack/type/Value;

    .line 285
    .local v0, "array":[Lorg/msgpack/type/Value;
    array-length v1, v0

    iget-object v2, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->getTopCount()I

    move-result v2

    sub-int/2addr v1, v2

    aget-object v1, v0, v1

    goto :goto_12
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
    .line 417
    return-void
.end method

.method public getNextType()Lorg/msgpack/type/ValueType;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 407
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->getTop()Lorg/msgpack/type/Value;

    move-result-object v0

    invoke-interface {v0}, Lorg/msgpack/type/Value;->getType()Lorg/msgpack/type/ValueType;

    move-result-object v0

    return-object v0
.end method

.method public getReadByteCount()I
    .registers 3

    .prologue
    .line 421
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not implemented yet"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected nextValue()Lorg/msgpack/type/Value;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 49
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public readArrayBegin()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 200
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->getTop()Lorg/msgpack/type/Value;

    move-result-object v1

    .line 201
    .local v1, "v":Lorg/msgpack/type/Value;
    invoke-interface {v1}, Lorg/msgpack/type/Value;->isArrayValue()Z

    move-result v2

    if-nez v2, :cond_12

    .line 202
    new-instance v2, Lorg/msgpack/MessageTypeException;

    const-string v3, "Expected array but got not array value"

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 205
    :cond_12
    invoke-interface {v1}, Lorg/msgpack/type/Value;->asArrayValue()Lorg/msgpack/type/ArrayValue;

    move-result-object v0

    .line 206
    .local v0, "a":Lorg/msgpack/type/ArrayValue;
    iget-object v2, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 207
    iget-object v2, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-interface {v0}, Lorg/msgpack/type/ArrayValue;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Lorg/msgpack/unpacker/UnpackerStack;->pushArray(I)V

    .line 208
    iget-object v2, p0, Lorg/msgpack/unpacker/Converter;->values:[Ljava/lang/Object;

    iget-object v3, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v3}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v3

    invoke-interface {v0}, Lorg/msgpack/type/ArrayValue;->getElementArray()[Lorg/msgpack/type/Value;

    move-result-object v4

    aput-object v4, v2, v3

    .line 209
    invoke-interface {v0}, Lorg/msgpack/type/ArrayValue;->size()I

    move-result v2

    return v2
.end method

.method public readArrayEnd(Z)V
    .registers 6
    .param p1, "check"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 214
    iget-object v2, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->topIsArray()Z

    move-result v2

    if-nez v2, :cond_10

    .line 215
    new-instance v2, Lorg/msgpack/MessageTypeException;

    const-string v3, "readArrayEnd() is called but readArrayBegin() is not called"

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 219
    :cond_10
    iget-object v2, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->getTopCount()I

    move-result v1

    .line 220
    .local v1, "remain":I
    if-lez v1, :cond_2b

    .line 221
    if-eqz p1, :cond_22

    .line 222
    new-instance v2, Lorg/msgpack/MessageTypeException;

    const-string v3, "readArrayEnd(check=true) is called but the array is not end"

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 225
    :cond_22
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_23
    if-ge v0, v1, :cond_2b

    .line 226
    invoke-virtual {p0}, Lorg/msgpack/unpacker/Converter;->skip()V

    .line 225
    add-int/lit8 v0, v0, 0x1

    goto :goto_23

    .line 229
    .end local v0    # "i":I
    :cond_2b
    iget-object v2, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->pop()V

    .line 231
    iget-object v2, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v2

    if-nez v2, :cond_3b

    .line 232
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 234
    :cond_3b
    return-void
.end method

.method public readBigInteger()Ljava/math/BigInteger;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 150
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->getTop()Lorg/msgpack/type/Value;

    move-result-object v1

    invoke-interface {v1}, Lorg/msgpack/type/Value;->asIntegerValue()Lorg/msgpack/type/IntegerValue;

    move-result-object v1

    invoke-virtual {v1}, Lorg/msgpack/type/IntegerValue;->getBigInteger()Ljava/math/BigInteger;

    move-result-object v0

    .line 151
    .local v0, "v":Ljava/math/BigInteger;
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 152
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v1

    if-nez v1, :cond_1c

    .line 153
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 155
    :cond_1c
    return-object v0
.end method

.method public readBoolean()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->getTop()Lorg/msgpack/type/Value;

    move-result-object v1

    invoke-interface {v1}, Lorg/msgpack/type/Value;->asBooleanValue()Lorg/msgpack/type/BooleanValue;

    move-result-object v1

    invoke-interface {v1}, Lorg/msgpack/type/BooleanValue;->getBoolean()Z

    move-result v0

    .line 104
    .local v0, "v":Z
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 105
    return v0
.end method

.method public readByte()B
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 110
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->getTop()Lorg/msgpack/type/Value;

    move-result-object v1

    invoke-interface {v1}, Lorg/msgpack/type/Value;->asIntegerValue()Lorg/msgpack/type/IntegerValue;

    move-result-object v1

    invoke-virtual {v1}, Lorg/msgpack/type/IntegerValue;->getByte()B

    move-result v0

    .line 111
    .local v0, "v":B
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 112
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v1

    if-nez v1, :cond_1c

    .line 113
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 115
    :cond_1c
    return v0
.end method

.method public readByteArray()[B
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 180
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->getTop()Lorg/msgpack/type/Value;

    move-result-object v1

    invoke-interface {v1}, Lorg/msgpack/type/Value;->asRawValue()Lorg/msgpack/type/RawValue;

    move-result-object v1

    invoke-interface {v1}, Lorg/msgpack/type/RawValue;->getByteArray()[B

    move-result-object v0

    .line 181
    .local v0, "raw":[B
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 182
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v1

    if-nez v1, :cond_1c

    .line 183
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 185
    :cond_1c
    return-object v0
.end method

.method public readDouble()D
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 170
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->getTop()Lorg/msgpack/type/Value;

    move-result-object v2

    invoke-interface {v2}, Lorg/msgpack/type/Value;->asFloatValue()Lorg/msgpack/type/FloatValue;

    move-result-object v2

    invoke-virtual {v2}, Lorg/msgpack/type/FloatValue;->getDouble()D

    move-result-wide v0

    .line 171
    .local v0, "v":D
    iget-object v2, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 172
    iget-object v2, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v2

    if-nez v2, :cond_1c

    .line 173
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 175
    :cond_1c
    return-wide v0
.end method

.method public readFloat()F
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 160
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->getTop()Lorg/msgpack/type/Value;

    move-result-object v1

    invoke-interface {v1}, Lorg/msgpack/type/Value;->asFloatValue()Lorg/msgpack/type/FloatValue;

    move-result-object v1

    invoke-virtual {v1}, Lorg/msgpack/type/FloatValue;->getFloat()F

    move-result v0

    .line 161
    .local v0, "v":F
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 162
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v1

    if-nez v1, :cond_1c

    .line 163
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 165
    :cond_1c
    return v0
.end method

.method public readInt()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->getTop()Lorg/msgpack/type/Value;

    move-result-object v1

    invoke-interface {v1}, Lorg/msgpack/type/Value;->asIntegerValue()Lorg/msgpack/type/IntegerValue;

    move-result-object v1

    invoke-virtual {v1}, Lorg/msgpack/type/IntegerValue;->getInt()I

    move-result v0

    .line 131
    .local v0, "v":I
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 132
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v1

    if-nez v1, :cond_1c

    .line 133
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 135
    :cond_1c
    return v0
.end method

.method public readLong()J
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 140
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->getTop()Lorg/msgpack/type/Value;

    move-result-object v2

    invoke-interface {v2}, Lorg/msgpack/type/Value;->asIntegerValue()Lorg/msgpack/type/IntegerValue;

    move-result-object v2

    invoke-virtual {v2}, Lorg/msgpack/type/IntegerValue;->getLong()J

    move-result-wide v0

    .line 141
    .local v0, "v":J
    iget-object v2, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 142
    iget-object v2, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v2

    if-nez v2, :cond_1c

    .line 143
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 145
    :cond_1c
    return-wide v0
.end method

.method public readMapBegin()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 238
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->getTop()Lorg/msgpack/type/Value;

    move-result-object v1

    .line 239
    .local v1, "v":Lorg/msgpack/type/Value;
    invoke-interface {v1}, Lorg/msgpack/type/Value;->isMapValue()Z

    move-result v2

    if-nez v2, :cond_12

    .line 240
    new-instance v2, Lorg/msgpack/MessageTypeException;

    const-string v3, "Expected map but got not map value"

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 242
    :cond_12
    invoke-interface {v1}, Lorg/msgpack/type/Value;->asMapValue()Lorg/msgpack/type/MapValue;

    move-result-object v0

    .line 243
    .local v0, "m":Lorg/msgpack/type/MapValue;
    iget-object v2, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 244
    iget-object v2, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-interface {v0}, Lorg/msgpack/type/MapValue;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Lorg/msgpack/unpacker/UnpackerStack;->pushMap(I)V

    .line 245
    iget-object v2, p0, Lorg/msgpack/unpacker/Converter;->values:[Ljava/lang/Object;

    iget-object v3, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v3}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v3

    invoke-interface {v0}, Lorg/msgpack/type/MapValue;->getKeyValueArray()[Lorg/msgpack/type/Value;

    move-result-object v4

    aput-object v4, v2, v3

    .line 246
    invoke-interface {v0}, Lorg/msgpack/type/MapValue;->size()I

    move-result v2

    return v2
.end method

.method public readMapEnd(Z)V
    .registers 6
    .param p1, "check"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 251
    iget-object v2, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->topIsMap()Z

    move-result v2

    if-nez v2, :cond_10

    .line 252
    new-instance v2, Lorg/msgpack/MessageTypeException;

    const-string v3, "readMapEnd() is called but readMapBegin() is not called"

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 256
    :cond_10
    iget-object v2, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->getTopCount()I

    move-result v1

    .line 257
    .local v1, "remain":I
    if-lez v1, :cond_2b

    .line 258
    if-eqz p1, :cond_22

    .line 259
    new-instance v2, Lorg/msgpack/MessageTypeException;

    const-string v3, "readMapEnd(check=true) is called but the map is not end"

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 262
    :cond_22
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_23
    if-ge v0, v1, :cond_2b

    .line 263
    invoke-virtual {p0}, Lorg/msgpack/unpacker/Converter;->skip()V

    .line 262
    add-int/lit8 v0, v0, 0x1

    goto :goto_23

    .line 266
    .end local v0    # "i":I
    :cond_2b
    iget-object v2, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->pop()V

    .line 268
    iget-object v2, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v2

    if-nez v2, :cond_3b

    .line 269
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 271
    :cond_3b
    return-void
.end method

.method public readNil()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->getTop()Lorg/msgpack/type/Value;

    move-result-object v0

    invoke-interface {v0}, Lorg/msgpack/type/Value;->isNilValue()Z

    move-result v0

    if-nez v0, :cond_12

    .line 93
    new-instance v0, Lorg/msgpack/MessageTypeException;

    const-string v1, "Expected nil but got not nil value"

    invoke-direct {v0, v1}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 95
    :cond_12
    iget-object v0, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v0}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 96
    iget-object v0, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v0}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v0

    if-nez v0, :cond_22

    .line 97
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 99
    :cond_22
    return-void
.end method

.method public readShort()S
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->getTop()Lorg/msgpack/type/Value;

    move-result-object v1

    invoke-interface {v1}, Lorg/msgpack/type/Value;->asIntegerValue()Lorg/msgpack/type/IntegerValue;

    move-result-object v1

    invoke-virtual {v1}, Lorg/msgpack/type/IntegerValue;->getShort()S

    move-result v0

    .line 121
    .local v0, "v":S
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 122
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v1

    if-nez v1, :cond_1c

    .line 123
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 125
    :cond_1c
    return v0
.end method

.method public readString()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->getTop()Lorg/msgpack/type/Value;

    move-result-object v1

    invoke-interface {v1}, Lorg/msgpack/type/Value;->asRawValue()Lorg/msgpack/type/RawValue;

    move-result-object v1

    invoke-interface {v1}, Lorg/msgpack/type/RawValue;->getString()Ljava/lang/String;

    move-result-object v0

    .line 191
    .local v0, "str":Ljava/lang/String;
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 192
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v1

    if-nez v1, :cond_1c

    .line 193
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 195
    :cond_1c
    return-object v0
.end method

.method public readValue()Lorg/msgpack/type/Value;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 290
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v1

    if-nez v1, :cond_17

    .line 291
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    if-nez v1, :cond_11

    .line 292
    invoke-virtual {p0}, Lorg/msgpack/unpacker/Converter;->nextValue()Lorg/msgpack/type/Value;

    move-result-object v0

    .line 299
    :goto_10
    return-object v0

    .line 294
    :cond_11
    iget-object v0, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 295
    .local v0, "v":Lorg/msgpack/type/Value;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    goto :goto_10

    .line 299
    .end local v0    # "v":Lorg/msgpack/type/Value;
    :cond_17
    invoke-super {p0}, Lorg/msgpack/unpacker/AbstractUnpacker;->readValue()Lorg/msgpack/type/Value;

    move-result-object v0

    goto :goto_10
.end method

.method protected readValue(Lorg/msgpack/packer/Unconverter;)V
    .registers 10
    .param p1, "uc"    # Lorg/msgpack/packer/Unconverter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 304
    invoke-virtual {p1}, Lorg/msgpack/packer/Unconverter;->getResult()Lorg/msgpack/type/Value;

    move-result-object v3

    if-eqz v3, :cond_b

    .line 305
    invoke-virtual {p1}, Lorg/msgpack/packer/Unconverter;->resetResult()V

    .line 308
    :cond_b
    iget-object v3, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v3}, Lorg/msgpack/unpacker/UnpackerStack;->checkCount()V

    .line 309
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->getTop()Lorg/msgpack/type/Value;

    move-result-object v2

    .line 310
    .local v2, "v":Lorg/msgpack/type/Value;
    invoke-interface {v2}, Lorg/msgpack/type/Value;->isArrayValue()Z

    move-result v3

    if-nez v3, :cond_6f

    invoke-interface {v2}, Lorg/msgpack/type/Value;->isMapValue()Z

    move-result v3

    if-nez v3, :cond_6f

    .line 311
    invoke-virtual {p1, v2}, Lorg/msgpack/packer/Unconverter;->write(Lorg/msgpack/type/Value;)Lorg/msgpack/packer/Packer;

    .line 312
    iget-object v3, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v3}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 313
    iget-object v3, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v3}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v3

    if-nez v3, :cond_32

    .line 314
    iput-object v7, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 316
    :cond_32
    invoke-virtual {p1}, Lorg/msgpack/packer/Unconverter;->getResult()Lorg/msgpack/type/Value;

    move-result-object v3

    if-eqz v3, :cond_6f

    .line 336
    :goto_38
    return-void

    .line 340
    :cond_39
    iget-object v3, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v3}, Lorg/msgpack/unpacker/UnpackerStack;->checkCount()V

    .line 341
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->getTop()Lorg/msgpack/type/Value;

    move-result-object v2

    .line 342
    invoke-interface {v2}, Lorg/msgpack/type/Value;->isArrayValue()Z

    move-result v3

    if-eqz v3, :cond_b9

    .line 343
    invoke-interface {v2}, Lorg/msgpack/type/Value;->asArrayValue()Lorg/msgpack/type/ArrayValue;

    move-result-object v0

    .line 344
    .local v0, "a":Lorg/msgpack/type/ArrayValue;
    invoke-interface {v0}, Lorg/msgpack/type/ArrayValue;->size()I

    move-result v3

    invoke-virtual {p1, v3}, Lorg/msgpack/packer/Unconverter;->writeArrayBegin(I)Lorg/msgpack/packer/Packer;

    .line 345
    iget-object v3, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v3}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 346
    iget-object v3, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-interface {v0}, Lorg/msgpack/type/ArrayValue;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Lorg/msgpack/unpacker/UnpackerStack;->pushArray(I)V

    .line 347
    iget-object v3, p0, Lorg/msgpack/unpacker/Converter;->values:[Ljava/lang/Object;

    iget-object v4, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v4}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v4

    invoke-interface {v0}, Lorg/msgpack/type/ArrayValue;->getElementArray()[Lorg/msgpack/type/Value;

    move-result-object v5

    aput-object v5, v3, v4

    .line 322
    .end local v0    # "a":Lorg/msgpack/type/ArrayValue;
    :cond_6f
    :goto_6f
    iget-object v3, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v3}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v3

    if-eqz v3, :cond_39

    iget-object v3, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v3}, Lorg/msgpack/unpacker/UnpackerStack;->getTopCount()I

    move-result v3

    if-nez v3, :cond_39

    .line 323
    iget-object v3, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v3}, Lorg/msgpack/unpacker/UnpackerStack;->topIsArray()Z

    move-result v3

    if-eqz v3, :cond_a0

    .line 324
    invoke-virtual {p1, v6}, Lorg/msgpack/packer/Unconverter;->writeArrayEnd(Z)Lorg/msgpack/packer/Packer;

    .line 325
    iget-object v3, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v3}, Lorg/msgpack/unpacker/UnpackerStack;->pop()V

    .line 332
    :goto_8f
    iget-object v3, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v3}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v3

    if-nez v3, :cond_99

    .line 333
    iput-object v7, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 335
    :cond_99
    invoke-virtual {p1}, Lorg/msgpack/packer/Unconverter;->getResult()Lorg/msgpack/type/Value;

    move-result-object v3

    if-eqz v3, :cond_6f

    goto :goto_38

    .line 326
    :cond_a0
    iget-object v3, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v3}, Lorg/msgpack/unpacker/UnpackerStack;->topIsMap()Z

    move-result v3

    if-eqz v3, :cond_b1

    .line 327
    invoke-virtual {p1, v6}, Lorg/msgpack/packer/Unconverter;->writeMapEnd(Z)Lorg/msgpack/packer/Packer;

    .line 328
    iget-object v3, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v3}, Lorg/msgpack/unpacker/UnpackerStack;->pop()V

    goto :goto_8f

    .line 330
    :cond_b1
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "invalid stack"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 349
    :cond_b9
    invoke-interface {v2}, Lorg/msgpack/type/Value;->isMapValue()Z

    move-result v3

    if-eqz v3, :cond_e7

    .line 350
    invoke-interface {v2}, Lorg/msgpack/type/Value;->asMapValue()Lorg/msgpack/type/MapValue;

    move-result-object v1

    .line 351
    .local v1, "m":Lorg/msgpack/type/MapValue;
    invoke-interface {v1}, Lorg/msgpack/type/MapValue;->size()I

    move-result v3

    invoke-virtual {p1, v3}, Lorg/msgpack/packer/Unconverter;->writeMapBegin(I)Lorg/msgpack/packer/Packer;

    .line 352
    iget-object v3, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v3}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 353
    iget-object v3, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-interface {v1}, Lorg/msgpack/type/MapValue;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Lorg/msgpack/unpacker/UnpackerStack;->pushMap(I)V

    .line 354
    iget-object v3, p0, Lorg/msgpack/unpacker/Converter;->values:[Ljava/lang/Object;

    iget-object v4, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v4}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v4

    invoke-interface {v1}, Lorg/msgpack/type/MapValue;->getKeyValueArray()[Lorg/msgpack/type/Value;

    move-result-object v5

    aput-object v5, v3, v4

    goto :goto_6f

    .line 357
    .end local v1    # "m":Lorg/msgpack/type/MapValue;
    :cond_e7
    invoke-virtual {p1, v2}, Lorg/msgpack/packer/Unconverter;->write(Lorg/msgpack/type/Value;)Lorg/msgpack/packer/Packer;

    .line 358
    iget-object v3, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v3}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    goto :goto_6f
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 411
    iget-object v0, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v0}, Lorg/msgpack/unpacker/UnpackerStack;->clear()V

    .line 412
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 413
    return-void
.end method

.method public setArraySizeLimit(I)V
    .registers 4
    .param p1, "size"    # I

    .prologue
    .line 431
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not implemented yet"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setMapSizeLimit(I)V
    .registers 4
    .param p1, "size"    # I

    .prologue
    .line 436
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not implemented yet"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setRawSizeLimit(I)V
    .registers 4
    .param p1, "size"    # I

    .prologue
    .line 426
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not implemented yet"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public skip()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 365
    iget-object v4, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v4}, Lorg/msgpack/unpacker/UnpackerStack;->checkCount()V

    .line 366
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->getTop()Lorg/msgpack/type/Value;

    move-result-object v3

    .line 367
    .local v3, "v":Lorg/msgpack/type/Value;
    invoke-interface {v3}, Lorg/msgpack/type/Value;->isArrayValue()Z

    move-result v4

    if-nez v4, :cond_26

    invoke-interface {v3}, Lorg/msgpack/type/Value;->isMapValue()Z

    move-result v4

    if-nez v4, :cond_26

    .line 368
    iget-object v4, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v4}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 369
    iget-object v4, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v4}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v4

    if-nez v4, :cond_25

    .line 370
    iput-object v7, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 382
    :cond_25
    :goto_25
    return-void

    .line 374
    :cond_26
    iget-object v4, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v4}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v2

    .line 376
    .local v2, "targetDepth":I
    :cond_2c
    :goto_2c
    iget-object v4, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v4}, Lorg/msgpack/unpacker/UnpackerStack;->getTopCount()I

    move-result v4

    if-nez v4, :cond_4c

    .line 377
    iget-object v4, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v4}, Lorg/msgpack/unpacker/UnpackerStack;->pop()V

    .line 378
    iget-object v4, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v4}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v4

    if-nez v4, :cond_43

    .line 379
    iput-object v7, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 381
    :cond_43
    iget-object v4, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v4}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v4

    if-gt v4, v2, :cond_2c

    goto :goto_25

    .line 386
    :cond_4c
    iget-object v4, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v4}, Lorg/msgpack/unpacker/UnpackerStack;->checkCount()V

    .line 387
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->getTop()Lorg/msgpack/type/Value;

    move-result-object v3

    .line 388
    invoke-interface {v3}, Lorg/msgpack/type/Value;->isArrayValue()Z

    move-result v4

    if-eqz v4, :cond_7c

    .line 389
    invoke-interface {v3}, Lorg/msgpack/type/Value;->asArrayValue()Lorg/msgpack/type/ArrayValue;

    move-result-object v0

    .line 390
    .local v0, "a":Lorg/msgpack/type/ArrayValue;
    iget-object v4, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v4}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 391
    iget-object v4, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-interface {v0}, Lorg/msgpack/type/ArrayValue;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Lorg/msgpack/unpacker/UnpackerStack;->pushArray(I)V

    .line 392
    iget-object v4, p0, Lorg/msgpack/unpacker/Converter;->values:[Ljava/lang/Object;

    iget-object v5, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v5}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v5

    invoke-interface {v0}, Lorg/msgpack/type/ArrayValue;->getElementArray()[Lorg/msgpack/type/Value;

    move-result-object v6

    aput-object v6, v4, v5

    goto :goto_2c

    .line 394
    .end local v0    # "a":Lorg/msgpack/type/ArrayValue;
    :cond_7c
    invoke-interface {v3}, Lorg/msgpack/type/Value;->isMapValue()Z

    move-result v4

    if-eqz v4, :cond_a3

    .line 395
    invoke-interface {v3}, Lorg/msgpack/type/Value;->asMapValue()Lorg/msgpack/type/MapValue;

    move-result-object v1

    .line 396
    .local v1, "m":Lorg/msgpack/type/MapValue;
    iget-object v4, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v4}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 397
    iget-object v4, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-interface {v1}, Lorg/msgpack/type/MapValue;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Lorg/msgpack/unpacker/UnpackerStack;->pushMap(I)V

    .line 398
    iget-object v4, p0, Lorg/msgpack/unpacker/Converter;->values:[Ljava/lang/Object;

    iget-object v5, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v5}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v5

    invoke-interface {v1}, Lorg/msgpack/type/MapValue;->getKeyValueArray()[Lorg/msgpack/type/Value;

    move-result-object v6

    aput-object v6, v4, v5

    goto :goto_2c

    .line 401
    .end local v1    # "m":Lorg/msgpack/type/MapValue;
    :cond_a3
    iget-object v4, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v4}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    goto :goto_2c
.end method

.method public tryReadNil()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    iget-object v0, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v0}, Lorg/msgpack/unpacker/UnpackerStack;->checkCount()V

    .line 61
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->getTop()Lorg/msgpack/type/Value;

    move-result-object v0

    invoke-interface {v0}, Lorg/msgpack/type/Value;->isNilValue()Z

    move-result v0

    if-eqz v0, :cond_21

    .line 62
    iget-object v0, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v0}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 63
    iget-object v0, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v0}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v0

    if-nez v0, :cond_1f

    .line 64
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    .line 66
    :cond_1f
    const/4 v0, 0x1

    .line 68
    :goto_20
    return v0

    :cond_21
    const/4 v0, 0x0

    goto :goto_20
.end method

.method public trySkipNil()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 73
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->ensureValue()V

    .line 75
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v1

    if-lez v1, :cond_15

    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->getTopCount()I

    move-result v1

    if-gtz v1, :cond_15

    .line 87
    :cond_14
    :goto_14
    return v0

    .line 80
    :cond_15
    invoke-direct {p0}, Lorg/msgpack/unpacker/Converter;->getTop()Lorg/msgpack/type/Value;

    move-result-object v1

    invoke-interface {v1}, Lorg/msgpack/type/Value;->isNilValue()Z

    move-result v1

    if-eqz v1, :cond_30

    .line 81
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 82
    iget-object v1, p0, Lorg/msgpack/unpacker/Converter;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v1

    if-nez v1, :cond_14

    .line 83
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/msgpack/unpacker/Converter;->value:Lorg/msgpack/type/Value;

    goto :goto_14

    .line 87
    :cond_30
    const/4 v0, 0x0

    goto :goto_14
.end method
