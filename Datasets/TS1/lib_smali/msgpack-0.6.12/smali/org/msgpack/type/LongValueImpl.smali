.class Lorg/msgpack/type/LongValueImpl;
.super Lorg/msgpack/type/IntegerValue;
.source "LongValueImpl.java"


# static fields
.field private static BYTE_MAX:J

.field private static BYTE_MIN:J

.field private static INT_MAX:J

.field private static INT_MIN:J

.field private static SHORT_MAX:J

.field private static SHORT_MIN:J


# instance fields
.field private value:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 33
    const-wide/16 v0, 0x7f

    sput-wide v0, Lorg/msgpack/type/LongValueImpl;->BYTE_MAX:J

    .line 34
    const-wide/16 v0, 0x7fff

    sput-wide v0, Lorg/msgpack/type/LongValueImpl;->SHORT_MAX:J

    .line 35
    const-wide/32 v0, 0x7fffffff

    sput-wide v0, Lorg/msgpack/type/LongValueImpl;->INT_MAX:J

    .line 37
    const-wide/16 v0, -0x80

    sput-wide v0, Lorg/msgpack/type/LongValueImpl;->BYTE_MIN:J

    .line 38
    const-wide/16 v0, -0x8000

    sput-wide v0, Lorg/msgpack/type/LongValueImpl;->SHORT_MIN:J

    .line 39
    const-wide/32 v0, -0x80000000

    sput-wide v0, Lorg/msgpack/type/LongValueImpl;->INT_MIN:J

    return-void
.end method

.method constructor <init>(J)V
    .registers 3
    .param p1, "value"    # J

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/msgpack/type/IntegerValue;-><init>()V

    .line 30
    iput-wide p1, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    .line 31
    return-void
.end method


# virtual methods
.method public bigIntegerValue()Ljava/math/BigInteger;
    .registers 3

    .prologue
    .line 97
    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public byteValue()B
    .registers 3

    .prologue
    .line 77
    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    long-to-int v0, v0

    int-to-byte v0, v0

    return v0
.end method

.method public doubleValue()D
    .registers 3

    .prologue
    .line 107
    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    long-to-double v0, v0

    return-wide v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 10
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 119
    if-ne p1, p0, :cond_6

    move v3, v2

    .line 134
    :cond_5
    :goto_5
    return v3

    .line 122
    :cond_6
    instance-of v4, p1, Lorg/msgpack/type/Value;

    if-eqz v4, :cond_5

    move-object v1, p1

    .line 125
    check-cast v1, Lorg/msgpack/type/Value;

    .line 126
    .local v1, "v":Lorg/msgpack/type/Value;
    invoke-interface {v1}, Lorg/msgpack/type/Value;->isIntegerValue()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 132
    :try_start_13
    iget-wide v4, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    invoke-interface {v1}, Lorg/msgpack/type/Value;->asIntegerValue()Lorg/msgpack/type/IntegerValue;

    move-result-object v6

    invoke-virtual {v6}, Lorg/msgpack/type/IntegerValue;->getLong()J
    :try_end_1c
    .catch Lorg/msgpack/MessageTypeException; {:try_start_13 .. :try_end_1c} :catch_25

    move-result-wide v6

    cmp-long v4, v4, v6

    if-nez v4, :cond_23

    :goto_21
    move v3, v2

    goto :goto_5

    :cond_23
    move v2, v3

    goto :goto_21

    .line 133
    :catch_25
    move-exception v0

    .line 134
    .local v0, "ex":Lorg/msgpack/MessageTypeException;
    goto :goto_5
.end method

.method public floatValue()F
    .registers 3

    .prologue
    .line 102
    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    long-to-float v0, v0

    return v0
.end method

.method public getBigInteger()Ljava/math/BigInteger;
    .registers 3

    .prologue
    .line 72
    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public getByte()B
    .registers 5

    .prologue
    .line 43
    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    sget-wide v2, Lorg/msgpack/type/LongValueImpl;->BYTE_MAX:J

    cmp-long v0, v0, v2

    if-gtz v0, :cond_10

    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    sget-wide v2, Lorg/msgpack/type/LongValueImpl;->BYTE_MIN:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_16

    .line 44
    :cond_10
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0

    .line 46
    :cond_16
    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    long-to-int v0, v0

    int-to-byte v0, v0

    return v0
.end method

.method public getInt()I
    .registers 5

    .prologue
    .line 59
    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    sget-wide v2, Lorg/msgpack/type/LongValueImpl;->INT_MAX:J

    cmp-long v0, v0, v2

    if-gtz v0, :cond_10

    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    sget-wide v2, Lorg/msgpack/type/LongValueImpl;->INT_MIN:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_16

    .line 60
    :cond_10
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0

    .line 62
    :cond_16
    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    long-to-int v0, v0

    return v0
.end method

.method public getLong()J
    .registers 3

    .prologue
    .line 67
    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    return-wide v0
.end method

.method public getShort()S
    .registers 5

    .prologue
    .line 51
    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    sget-wide v2, Lorg/msgpack/type/LongValueImpl;->SHORT_MAX:J

    cmp-long v0, v0, v2

    if-gtz v0, :cond_10

    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    sget-wide v2, Lorg/msgpack/type/LongValueImpl;->SHORT_MIN:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_16

    .line 52
    :cond_10
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0

    .line 54
    :cond_16
    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    long-to-int v0, v0

    int-to-short v0, v0

    return v0
.end method

.method public hashCode()I
    .registers 6

    .prologue
    .line 140
    sget-wide v0, Lorg/msgpack/type/LongValueImpl;->INT_MIN:J

    iget-wide v2, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    cmp-long v0, v0, v2

    if-gtz v0, :cond_14

    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    sget-wide v2, Lorg/msgpack/type/LongValueImpl;->INT_MAX:J

    cmp-long v0, v0, v2

    if-gtz v0, :cond_14

    .line 141
    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    long-to-int v0, v0

    .line 143
    :goto_13
    return v0

    :cond_14
    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    iget-wide v2, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    const/16 v4, 0x20

    ushr-long/2addr v2, v4

    xor-long/2addr v0, v2

    long-to-int v0, v0

    goto :goto_13
.end method

.method public intValue()I
    .registers 3

    .prologue
    .line 87
    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    long-to-int v0, v0

    return v0
.end method

.method public longValue()J
    .registers 3

    .prologue
    .line 92
    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    return-wide v0
.end method

.method public shortValue()S
    .registers 3

    .prologue
    .line 82
    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    long-to-int v0, v0

    int-to-short v0, v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 149
    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .registers 4
    .param p1, "sb"    # Ljava/lang/StringBuilder;

    .prologue
    .line 154
    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

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
    .line 112
    iget-wide v0, p0, Lorg/msgpack/type/LongValueImpl;->value:J

    invoke-interface {p1, v0, v1}, Lorg/msgpack/packer/Packer;->write(J)Lorg/msgpack/packer/Packer;

    .line 113
    return-void
.end method
