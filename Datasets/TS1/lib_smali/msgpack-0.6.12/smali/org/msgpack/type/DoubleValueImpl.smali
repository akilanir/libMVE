.class Lorg/msgpack/type/DoubleValueImpl;
.super Lorg/msgpack/type/FloatValue;
.source "DoubleValueImpl.java"


# instance fields
.field private value:D


# direct methods
.method constructor <init>(D)V
    .registers 3
    .param p1, "value"    # D

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/msgpack/type/FloatValue;-><init>()V

    .line 30
    iput-wide p1, p0, Lorg/msgpack/type/DoubleValueImpl;->value:D

    .line 31
    return-void
.end method


# virtual methods
.method public bigIntegerValue()Ljava/math/BigInteger;
    .registers 4

    .prologue
    .line 65
    new-instance v0, Ljava/math/BigDecimal;

    iget-wide v1, p0, Lorg/msgpack/type/DoubleValueImpl;->value:D

    invoke-direct {v0, v1, v2}, Ljava/math/BigDecimal;-><init>(D)V

    invoke-virtual {v0}, Ljava/math/BigDecimal;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public byteValue()B
    .registers 3

    .prologue
    .line 45
    iget-wide v0, p0, Lorg/msgpack/type/DoubleValueImpl;->value:D

    double-to-int v0, v0

    int-to-byte v0, v0

    return v0
.end method

.method public doubleValue()D
    .registers 3

    .prologue
    .line 75
    iget-wide v0, p0, Lorg/msgpack/type/DoubleValueImpl;->value:D

    return-wide v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 9
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 85
    if-ne p1, p0, :cond_5

    .line 96
    :cond_4
    :goto_4
    return v1

    .line 88
    :cond_5
    instance-of v3, p1, Lorg/msgpack/type/Value;

    if-nez v3, :cond_b

    move v1, v2

    .line 89
    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 91
    check-cast v0, Lorg/msgpack/type/Value;

    .line 92
    .local v0, "v":Lorg/msgpack/type/Value;
    invoke-interface {v0}, Lorg/msgpack/type/Value;->isFloatValue()Z

    move-result v3

    if-nez v3, :cond_16

    move v1, v2

    .line 93
    goto :goto_4

    .line 96
    :cond_16
    iget-wide v3, p0, Lorg/msgpack/type/DoubleValueImpl;->value:D

    invoke-interface {v0}, Lorg/msgpack/type/Value;->asFloatValue()Lorg/msgpack/type/FloatValue;

    move-result-object v5

    invoke-virtual {v5}, Lorg/msgpack/type/FloatValue;->getDouble()D

    move-result-wide v5

    cmpl-double v3, v3, v5

    if-eqz v3, :cond_4

    move v1, v2

    goto :goto_4
.end method

.method public floatValue()F
    .registers 3

    .prologue
    .line 70
    iget-wide v0, p0, Lorg/msgpack/type/DoubleValueImpl;->value:D

    double-to-float v0, v0

    return v0
.end method

.method public getDouble()D
    .registers 3

    .prologue
    .line 40
    iget-wide v0, p0, Lorg/msgpack/type/DoubleValueImpl;->value:D

    return-wide v0
.end method

.method public getFloat()F
    .registers 3

    .prologue
    .line 35
    iget-wide v0, p0, Lorg/msgpack/type/DoubleValueImpl;->value:D

    double-to-float v0, v0

    return v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    .line 103
    iget-wide v2, p0, Lorg/msgpack/type/DoubleValueImpl;->value:D

    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 104
    .local v0, "v":J
    const/16 v2, 0x20

    ushr-long v2, v0, v2

    xor-long/2addr v2, v0

    long-to-int v2, v2

    return v2
.end method

.method public intValue()I
    .registers 3

    .prologue
    .line 55
    iget-wide v0, p0, Lorg/msgpack/type/DoubleValueImpl;->value:D

    double-to-int v0, v0

    return v0
.end method

.method public longValue()J
    .registers 3

    .prologue
    .line 60
    iget-wide v0, p0, Lorg/msgpack/type/DoubleValueImpl;->value:D

    double-to-long v0, v0

    return-wide v0
.end method

.method public shortValue()S
    .registers 3

    .prologue
    .line 50
    iget-wide v0, p0, Lorg/msgpack/type/DoubleValueImpl;->value:D

    double-to-int v0, v0

    int-to-short v0, v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 109
    iget-wide v0, p0, Lorg/msgpack/type/DoubleValueImpl;->value:D

    invoke-static {v0, v1}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .registers 4
    .param p1, "sb"    # Ljava/lang/StringBuilder;

    .prologue
    .line 114
    iget-wide v0, p0, Lorg/msgpack/type/DoubleValueImpl;->value:D

    invoke-static {v0, v1}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public writeTo(Lorg/msgpack/packer/Packer;)V
    .registers 4
    .param p1, "pk"    # Lorg/msgpack/packer/Packer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 80
    iget-wide v0, p0, Lorg/msgpack/type/DoubleValueImpl;->value:D

    invoke-interface {p1, v0, v1}, Lorg/msgpack/packer/Packer;->write(D)Lorg/msgpack/packer/Packer;

    .line 81
    return-void
.end method
