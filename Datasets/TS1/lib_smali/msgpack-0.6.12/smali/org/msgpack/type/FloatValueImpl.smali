.class Lorg/msgpack/type/FloatValueImpl;
.super Lorg/msgpack/type/FloatValue;
.source "FloatValueImpl.java"


# instance fields
.field private value:F


# direct methods
.method constructor <init>(F)V
    .registers 2
    .param p1, "value"    # F

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/msgpack/type/FloatValue;-><init>()V

    .line 30
    iput p1, p0, Lorg/msgpack/type/FloatValueImpl;->value:F

    .line 31
    return-void
.end method


# virtual methods
.method public bigIntegerValue()Ljava/math/BigInteger;
    .registers 4

    .prologue
    .line 65
    new-instance v0, Ljava/math/BigDecimal;

    iget v1, p0, Lorg/msgpack/type/FloatValueImpl;->value:F

    float-to-double v1, v1

    invoke-direct {v0, v1, v2}, Ljava/math/BigDecimal;-><init>(D)V

    invoke-virtual {v0}, Ljava/math/BigDecimal;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public byteValue()B
    .registers 2

    .prologue
    .line 45
    iget v0, p0, Lorg/msgpack/type/FloatValueImpl;->value:F

    float-to-int v0, v0

    int-to-byte v0, v0

    return v0
.end method

.method public doubleValue()D
    .registers 3

    .prologue
    .line 75
    iget v0, p0, Lorg/msgpack/type/FloatValueImpl;->value:F

    float-to-double v0, v0

    return-wide v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 9
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 80
    if-ne p1, p0, :cond_5

    .line 91
    :cond_4
    :goto_4
    return v1

    .line 83
    :cond_5
    instance-of v3, p1, Lorg/msgpack/type/Value;

    if-nez v3, :cond_b

    move v1, v2

    .line 84
    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 86
    check-cast v0, Lorg/msgpack/type/Value;

    .line 87
    .local v0, "v":Lorg/msgpack/type/Value;
    invoke-interface {v0}, Lorg/msgpack/type/Value;->isFloatValue()Z

    move-result v3

    if-nez v3, :cond_16

    move v1, v2

    .line 88
    goto :goto_4

    .line 91
    :cond_16
    iget v3, p0, Lorg/msgpack/type/FloatValueImpl;->value:F

    float-to-double v3, v3

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
    .registers 2

    .prologue
    .line 70
    iget v0, p0, Lorg/msgpack/type/FloatValueImpl;->value:F

    return v0
.end method

.method public getDouble()D
    .registers 3

    .prologue
    .line 40
    iget v0, p0, Lorg/msgpack/type/FloatValueImpl;->value:F

    float-to-double v0, v0

    return-wide v0
.end method

.method public getFloat()F
    .registers 2

    .prologue
    .line 35
    iget v0, p0, Lorg/msgpack/type/FloatValueImpl;->value:F

    return v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 103
    iget v0, p0, Lorg/msgpack/type/FloatValueImpl;->value:F

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    return v0
.end method

.method public intValue()I
    .registers 2

    .prologue
    .line 55
    iget v0, p0, Lorg/msgpack/type/FloatValueImpl;->value:F

    float-to-int v0, v0

    return v0
.end method

.method public longValue()J
    .registers 3

    .prologue
    .line 60
    iget v0, p0, Lorg/msgpack/type/FloatValueImpl;->value:F

    float-to-long v0, v0

    return-wide v0
.end method

.method public shortValue()S
    .registers 2

    .prologue
    .line 50
    iget v0, p0, Lorg/msgpack/type/FloatValueImpl;->value:F

    float-to-int v0, v0

    int-to-short v0, v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 108
    iget v0, p0, Lorg/msgpack/type/FloatValueImpl;->value:F

    invoke-static {v0}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .registers 3
    .param p1, "sb"    # Ljava/lang/StringBuilder;

    .prologue
    .line 113
    iget v0, p0, Lorg/msgpack/type/FloatValueImpl;->value:F

    invoke-static {v0}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

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
    .line 96
    iget v0, p0, Lorg/msgpack/type/FloatValueImpl;->value:F

    invoke-interface {p1, v0}, Lorg/msgpack/packer/Packer;->write(F)Lorg/msgpack/packer/Packer;

    .line 97
    return-void
.end method
