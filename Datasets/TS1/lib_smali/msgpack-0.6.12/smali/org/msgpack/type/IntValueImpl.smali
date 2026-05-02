.class Lorg/msgpack/type/IntValueImpl;
.super Lorg/msgpack/type/IntegerValue;
.source "IntValueImpl.java"


# static fields
.field private static BYTE_MAX:I

.field private static BYTE_MIN:I

.field private static SHORT_MAX:I

.field private static SHORT_MIN:I


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 33
    const/16 v0, 0x7f

    sput v0, Lorg/msgpack/type/IntValueImpl;->BYTE_MAX:I

    .line 34
    const/16 v0, 0x7fff

    sput v0, Lorg/msgpack/type/IntValueImpl;->SHORT_MAX:I

    .line 36
    const/16 v0, -0x80

    sput v0, Lorg/msgpack/type/IntValueImpl;->BYTE_MIN:I

    .line 37
    const/16 v0, -0x8000

    sput v0, Lorg/msgpack/type/IntValueImpl;->SHORT_MIN:I

    return-void
.end method

.method constructor <init>(I)V
    .registers 2
    .param p1, "value"    # I

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/msgpack/type/IntegerValue;-><init>()V

    .line 30
    iput p1, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    .line 31
    return-void
.end method


# virtual methods
.method public bigIntegerValue()Ljava/math/BigInteger;
    .registers 3

    .prologue
    .line 92
    iget v0, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    int-to-long v0, v0

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public byteValue()B
    .registers 2

    .prologue
    .line 72
    iget v0, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    int-to-byte v0, v0

    return v0
.end method

.method public doubleValue()D
    .registers 3

    .prologue
    .line 102
    iget v0, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    int-to-double v0, v0

    return-wide v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 8
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 114
    if-ne p1, p0, :cond_6

    move v3, v2

    .line 129
    :cond_5
    :goto_5
    return v3

    .line 117
    :cond_6
    instance-of v4, p1, Lorg/msgpack/type/Value;

    if-eqz v4, :cond_5

    move-object v1, p1

    .line 120
    check-cast v1, Lorg/msgpack/type/Value;

    .line 121
    .local v1, "v":Lorg/msgpack/type/Value;
    invoke-interface {v1}, Lorg/msgpack/type/Value;->isIntegerValue()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 127
    :try_start_13
    iget v4, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    invoke-interface {v1}, Lorg/msgpack/type/Value;->asIntegerValue()Lorg/msgpack/type/IntegerValue;

    move-result-object v5

    invoke-virtual {v5}, Lorg/msgpack/type/IntegerValue;->getInt()I
    :try_end_1c
    .catch Lorg/msgpack/MessageTypeException; {:try_start_13 .. :try_end_1c} :catch_23

    move-result v5

    if-ne v4, v5, :cond_21

    :goto_1f
    move v3, v2

    goto :goto_5

    :cond_21
    move v2, v3

    goto :goto_1f

    .line 128
    :catch_23
    move-exception v0

    .line 129
    .local v0, "ex":Lorg/msgpack/MessageTypeException;
    goto :goto_5
.end method

.method public floatValue()F
    .registers 2

    .prologue
    .line 97
    iget v0, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    int-to-float v0, v0

    return v0
.end method

.method public getBigInteger()Ljava/math/BigInteger;
    .registers 3

    .prologue
    .line 67
    iget v0, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    int-to-long v0, v0

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public getByte()B
    .registers 3

    .prologue
    .line 41
    iget v0, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    sget v1, Lorg/msgpack/type/IntValueImpl;->BYTE_MAX:I

    if-gt v0, v1, :cond_c

    iget v0, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    sget v1, Lorg/msgpack/type/IntValueImpl;->BYTE_MIN:I

    if-ge v0, v1, :cond_12

    .line 42
    :cond_c
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0

    .line 44
    :cond_12
    iget v0, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    int-to-byte v0, v0

    return v0
.end method

.method public getInt()I
    .registers 2

    .prologue
    .line 57
    iget v0, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    return v0
.end method

.method public getLong()J
    .registers 3

    .prologue
    .line 62
    iget v0, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public getShort()S
    .registers 3

    .prologue
    .line 49
    iget v0, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    sget v1, Lorg/msgpack/type/IntValueImpl;->SHORT_MAX:I

    if-gt v0, v1, :cond_c

    iget v0, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    sget v1, Lorg/msgpack/type/IntValueImpl;->SHORT_MIN:I

    if-ge v0, v1, :cond_12

    .line 50
    :cond_c
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0

    .line 52
    :cond_12
    iget v0, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    int-to-short v0, v0

    return v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 135
    iget v0, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    return v0
.end method

.method public intValue()I
    .registers 2

    .prologue
    .line 82
    iget v0, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    return v0
.end method

.method public longValue()J
    .registers 3

    .prologue
    .line 87
    iget v0, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public shortValue()S
    .registers 2

    .prologue
    .line 77
    iget v0, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    int-to-short v0, v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 140
    iget v0, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .registers 3
    .param p1, "sb"    # Ljava/lang/StringBuilder;

    .prologue
    .line 145
    iget v0, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public writeTo(Lorg/msgpack/packer/Packer;)V
    .registers 3
    .param p1, "pk"    # Lorg/msgpack/packer/Packer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    iget v0, p0, Lorg/msgpack/type/IntValueImpl;->value:I

    invoke-interface {p1, v0}, Lorg/msgpack/packer/Packer;->write(I)Lorg/msgpack/packer/Packer;

    .line 108
    return-void
.end method
