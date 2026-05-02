.class public abstract Lorg/msgpack/type/NumberValue;
.super Ljava/lang/Number;
.source "NumberValue.java"

# interfaces
.implements Lorg/msgpack/type/Value;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Number;-><init>()V

    return-void
.end method


# virtual methods
.method public asArrayValue()Lorg/msgpack/type/ArrayValue;
    .registers 2

    .prologue
    .line 82
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0
.end method

.method public asBooleanValue()Lorg/msgpack/type/BooleanValue;
    .registers 2

    .prologue
    .line 67
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0
.end method

.method public asFloatValue()Lorg/msgpack/type/FloatValue;
    .registers 2

    .prologue
    .line 77
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0
.end method

.method public asIntegerValue()Lorg/msgpack/type/IntegerValue;
    .registers 2

    .prologue
    .line 72
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0
.end method

.method public asMapValue()Lorg/msgpack/type/MapValue;
    .registers 2

    .prologue
    .line 87
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0
.end method

.method public asNilValue()Lorg/msgpack/type/NilValue;
    .registers 2

    .prologue
    .line 62
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0
.end method

.method public asRawValue()Lorg/msgpack/type/RawValue;
    .registers 2

    .prologue
    .line 92
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0
.end method

.method public abstract bigIntegerValue()Ljava/math/BigInteger;
.end method

.method public isArrayValue()Z
    .registers 2

    .prologue
    .line 47
    const/4 v0, 0x0

    return v0
.end method

.method public isBooleanValue()Z
    .registers 2

    .prologue
    .line 32
    const/4 v0, 0x0

    return v0
.end method

.method public isFloatValue()Z
    .registers 2

    .prologue
    .line 42
    const/4 v0, 0x0

    return v0
.end method

.method public isIntegerValue()Z
    .registers 2

    .prologue
    .line 37
    const/4 v0, 0x0

    return v0
.end method

.method public isMapValue()Z
    .registers 2

    .prologue
    .line 52
    const/4 v0, 0x0

    return v0
.end method

.method public isNilValue()Z
    .registers 2

    .prologue
    .line 27
    const/4 v0, 0x0

    return v0
.end method

.method public isRawValue()Z
    .registers 2

    .prologue
    .line 57
    const/4 v0, 0x0

    return v0
.end method
