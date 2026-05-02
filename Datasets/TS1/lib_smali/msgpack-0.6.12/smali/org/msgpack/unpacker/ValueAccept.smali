.class final Lorg/msgpack/unpacker/ValueAccept;
.super Lorg/msgpack/unpacker/Accept;
.source "ValueAccept.java"


# instance fields
.field private uc:Lorg/msgpack/packer/Unconverter;


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 30
    invoke-direct {p0, v0}, Lorg/msgpack/unpacker/Accept;-><init>(Ljava/lang/String;)V

    .line 27
    iput-object v0, p0, Lorg/msgpack/unpacker/ValueAccept;->uc:Lorg/msgpack/packer/Unconverter;

    .line 31
    return-void
.end method


# virtual methods
.method acceptArray(I)V
    .registers 3
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    iget-object v0, p0, Lorg/msgpack/unpacker/ValueAccept;->uc:Lorg/msgpack/packer/Unconverter;

    invoke-virtual {v0, p1}, Lorg/msgpack/packer/Unconverter;->writeArrayBegin(I)Lorg/msgpack/packer/Packer;

    .line 114
    return-void
.end method

.method acceptBoolean(Z)V
    .registers 4
    .param p1, "v"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    iget-object v0, p0, Lorg/msgpack/unpacker/ValueAccept;->uc:Lorg/msgpack/packer/Unconverter;

    invoke-static {p1}, Lorg/msgpack/type/ValueFactory;->createBooleanValue(Z)Lorg/msgpack/type/BooleanValue;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/msgpack/packer/Unconverter;->write(Lorg/msgpack/type/Value;)Lorg/msgpack/packer/Packer;

    .line 40
    return-void
.end method

.method acceptDouble(D)V
    .registers 5
    .param p1, "v"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    iget-object v0, p0, Lorg/msgpack/unpacker/ValueAccept;->uc:Lorg/msgpack/packer/Unconverter;

    invoke-static {p1, p2}, Lorg/msgpack/type/ValueFactory;->createFloatValue(D)Lorg/msgpack/type/FloatValue;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/msgpack/packer/Unconverter;->write(Lorg/msgpack/type/Value;)Lorg/msgpack/packer/Packer;

    .line 134
    return-void
.end method

.method acceptEmptyRaw()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    iget-object v0, p0, Lorg/msgpack/unpacker/ValueAccept;->uc:Lorg/msgpack/packer/Unconverter;

    invoke-static {}, Lorg/msgpack/type/ValueFactory;->createRawValue()Lorg/msgpack/type/RawValue;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/msgpack/packer/Unconverter;->write(Lorg/msgpack/type/Value;)Lorg/msgpack/packer/Packer;

    .line 101
    return-void
.end method

.method acceptFloat(F)V
    .registers 4
    .param p1, "v"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    iget-object v0, p0, Lorg/msgpack/unpacker/ValueAccept;->uc:Lorg/msgpack/packer/Unconverter;

    invoke-static {p1}, Lorg/msgpack/type/ValueFactory;->createFloatValue(F)Lorg/msgpack/type/FloatValue;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/msgpack/packer/Unconverter;->write(Lorg/msgpack/type/Value;)Lorg/msgpack/packer/Packer;

    .line 129
    return-void
.end method

.method acceptInteger(B)V
    .registers 4
    .param p1, "v"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    iget-object v0, p0, Lorg/msgpack/unpacker/ValueAccept;->uc:Lorg/msgpack/packer/Unconverter;

    invoke-static {p1}, Lorg/msgpack/type/ValueFactory;->createIntegerValue(B)Lorg/msgpack/type/IntegerValue;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/msgpack/packer/Unconverter;->write(Lorg/msgpack/type/Value;)Lorg/msgpack/packer/Packer;

    .line 45
    return-void
.end method

.method acceptInteger(I)V
    .registers 4
    .param p1, "v"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    iget-object v0, p0, Lorg/msgpack/unpacker/ValueAccept;->uc:Lorg/msgpack/packer/Unconverter;

    invoke-static {p1}, Lorg/msgpack/type/ValueFactory;->createIntegerValue(I)Lorg/msgpack/type/IntegerValue;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/msgpack/packer/Unconverter;->write(Lorg/msgpack/type/Value;)Lorg/msgpack/packer/Packer;

    .line 55
    return-void
.end method

.method acceptInteger(J)V
    .registers 5
    .param p1, "v"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    iget-object v0, p0, Lorg/msgpack/unpacker/ValueAccept;->uc:Lorg/msgpack/packer/Unconverter;

    invoke-static {p1, p2}, Lorg/msgpack/type/ValueFactory;->createIntegerValue(J)Lorg/msgpack/type/IntegerValue;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/msgpack/packer/Unconverter;->write(Lorg/msgpack/type/Value;)Lorg/msgpack/packer/Packer;

    .line 60
    return-void
.end method

.method acceptInteger(S)V
    .registers 4
    .param p1, "v"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 49
    iget-object v0, p0, Lorg/msgpack/unpacker/ValueAccept;->uc:Lorg/msgpack/packer/Unconverter;

    invoke-static {p1}, Lorg/msgpack/type/ValueFactory;->createIntegerValue(S)Lorg/msgpack/type/IntegerValue;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/msgpack/packer/Unconverter;->write(Lorg/msgpack/type/Value;)Lorg/msgpack/packer/Packer;

    .line 50
    return-void
.end method

.method acceptMap(I)V
    .registers 3
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    iget-object v0, p0, Lorg/msgpack/unpacker/ValueAccept;->uc:Lorg/msgpack/packer/Unconverter;

    invoke-virtual {v0, p1}, Lorg/msgpack/packer/Unconverter;->writeMapBegin(I)Lorg/msgpack/packer/Packer;

    .line 119
    return-void
.end method

.method acceptNil()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 123
    iget-object v0, p0, Lorg/msgpack/unpacker/ValueAccept;->uc:Lorg/msgpack/packer/Unconverter;

    invoke-static {}, Lorg/msgpack/type/ValueFactory;->createNilValue()Lorg/msgpack/type/NilValue;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/msgpack/packer/Unconverter;->write(Lorg/msgpack/type/Value;)Lorg/msgpack/packer/Packer;

    .line 124
    return-void
.end method

.method acceptRaw([B)V
    .registers 4
    .param p1, "raw"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    iget-object v0, p0, Lorg/msgpack/unpacker/ValueAccept;->uc:Lorg/msgpack/packer/Unconverter;

    invoke-static {p1}, Lorg/msgpack/type/ValueFactory;->createRawValue([B)Lorg/msgpack/type/RawValue;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/msgpack/packer/Unconverter;->write(Lorg/msgpack/type/Value;)Lorg/msgpack/packer/Packer;

    .line 96
    return-void
.end method

.method acceptUnsignedInteger(B)V
    .registers 4
    .param p1, "v"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    iget-object v0, p0, Lorg/msgpack/unpacker/ValueAccept;->uc:Lorg/msgpack/packer/Unconverter;

    and-int/lit16 v1, p1, 0xff

    invoke-static {v1}, Lorg/msgpack/type/ValueFactory;->createIntegerValue(I)Lorg/msgpack/type/IntegerValue;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/msgpack/packer/Unconverter;->write(Lorg/msgpack/type/Value;)Lorg/msgpack/packer/Packer;

    .line 65
    return-void
.end method

.method acceptUnsignedInteger(I)V
    .registers 8
    .param p1, "v"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    if-gez p1, :cond_18

    .line 75
    const v2, 0x7fffffff

    and-int/2addr v2, p1

    int-to-long v2, v2

    const-wide v4, 0x80000000L

    add-long v0, v2, v4

    .line 76
    .local v0, "value":J
    iget-object v2, p0, Lorg/msgpack/unpacker/ValueAccept;->uc:Lorg/msgpack/packer/Unconverter;

    invoke-static {v0, v1}, Lorg/msgpack/type/ValueFactory;->createIntegerValue(J)Lorg/msgpack/type/IntegerValue;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/msgpack/packer/Unconverter;->write(Lorg/msgpack/type/Value;)Lorg/msgpack/packer/Packer;

    .line 80
    .end local v0    # "value":J
    :goto_17
    return-void

    .line 78
    :cond_18
    iget-object v2, p0, Lorg/msgpack/unpacker/ValueAccept;->uc:Lorg/msgpack/packer/Unconverter;

    invoke-static {p1}, Lorg/msgpack/type/ValueFactory;->createIntegerValue(I)Lorg/msgpack/type/IntegerValue;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/msgpack/packer/Unconverter;->write(Lorg/msgpack/type/Value;)Lorg/msgpack/packer/Packer;

    goto :goto_17
.end method

.method acceptUnsignedInteger(J)V
    .registers 8
    .param p1, "v"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    if-gez v1, :cond_23

    .line 85
    const-wide v1, 0x7fffffffffffffffL

    add-long/2addr v1, p1

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    const/16 v2, 0x3f

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->setBit(I)Ljava/math/BigInteger;

    move-result-object v0

    .line 87
    .local v0, "value":Ljava/math/BigInteger;
    iget-object v1, p0, Lorg/msgpack/unpacker/ValueAccept;->uc:Lorg/msgpack/packer/Unconverter;

    invoke-static {v0}, Lorg/msgpack/type/ValueFactory;->createIntegerValue(Ljava/math/BigInteger;)Lorg/msgpack/type/IntegerValue;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/msgpack/packer/Unconverter;->write(Lorg/msgpack/type/Value;)Lorg/msgpack/packer/Packer;

    .line 91
    .end local v0    # "value":Ljava/math/BigInteger;
    :goto_22
    return-void

    .line 89
    :cond_23
    iget-object v1, p0, Lorg/msgpack/unpacker/ValueAccept;->uc:Lorg/msgpack/packer/Unconverter;

    invoke-static {p1, p2}, Lorg/msgpack/type/ValueFactory;->createIntegerValue(J)Lorg/msgpack/type/IntegerValue;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/msgpack/packer/Unconverter;->write(Lorg/msgpack/type/Value;)Lorg/msgpack/packer/Packer;

    goto :goto_22
.end method

.method acceptUnsignedInteger(S)V
    .registers 4
    .param p1, "v"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 69
    iget-object v0, p0, Lorg/msgpack/unpacker/ValueAccept;->uc:Lorg/msgpack/packer/Unconverter;

    const v1, 0xffff

    and-int/2addr v1, p1

    invoke-static {v1}, Lorg/msgpack/type/ValueFactory;->createIntegerValue(I)Lorg/msgpack/type/IntegerValue;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/msgpack/packer/Unconverter;->write(Lorg/msgpack/type/Value;)Lorg/msgpack/packer/Packer;

    .line 70
    return-void
.end method

.method public refer(Ljava/nio/ByteBuffer;Z)V
    .registers 6
    .param p1, "bb"    # Ljava/nio/ByteBuffer;
    .param p2, "gift"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    new-array v0, v1, [B

    .line 107
    .local v0, "raw":[B
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 108
    iget-object v1, p0, Lorg/msgpack/unpacker/ValueAccept;->uc:Lorg/msgpack/packer/Unconverter;

    const/4 v2, 0x1

    invoke-static {v0, v2}, Lorg/msgpack/type/ValueFactory;->createRawValue([BZ)Lorg/msgpack/type/RawValue;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/msgpack/packer/Unconverter;->write(Lorg/msgpack/type/Value;)Lorg/msgpack/packer/Packer;

    .line 109
    return-void
.end method

.method setUnconverter(Lorg/msgpack/packer/Unconverter;)V
    .registers 2
    .param p1, "uc"    # Lorg/msgpack/packer/Unconverter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 34
    iput-object p1, p0, Lorg/msgpack/unpacker/ValueAccept;->uc:Lorg/msgpack/packer/Unconverter;

    .line 35
    return-void
.end method
