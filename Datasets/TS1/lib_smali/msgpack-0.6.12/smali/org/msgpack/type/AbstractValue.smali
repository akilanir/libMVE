.class abstract Lorg/msgpack/type/AbstractValue;
.super Ljava/lang/Object;
.source "AbstractValue.java"

# interfaces
.implements Lorg/msgpack/type/Value;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public asArrayValue()Lorg/msgpack/type/ArrayValue;
    .registers 2

    .prologue
    .line 68
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0
.end method

.method public asBooleanValue()Lorg/msgpack/type/BooleanValue;
    .registers 2

    .prologue
    .line 56
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0
.end method

.method public asFloatValue()Lorg/msgpack/type/FloatValue;
    .registers 2

    .prologue
    .line 64
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0
.end method

.method public asIntegerValue()Lorg/msgpack/type/IntegerValue;
    .registers 2

    .prologue
    .line 60
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0
.end method

.method public asMapValue()Lorg/msgpack/type/MapValue;
    .registers 2

    .prologue
    .line 72
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0
.end method

.method public asNilValue()Lorg/msgpack/type/NilValue;
    .registers 2

    .prologue
    .line 52
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0
.end method

.method public asRawValue()Lorg/msgpack/type/RawValue;
    .registers 2

    .prologue
    .line 76
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0
.end method

.method public isArrayValue()Z
    .registers 2

    .prologue
    .line 40
    const/4 v0, 0x0

    return v0
.end method

.method public isBooleanValue()Z
    .registers 2

    .prologue
    .line 28
    const/4 v0, 0x0

    return v0
.end method

.method public isFloatValue()Z
    .registers 2

    .prologue
    .line 36
    const/4 v0, 0x0

    return v0
.end method

.method public isIntegerValue()Z
    .registers 2

    .prologue
    .line 32
    const/4 v0, 0x0

    return v0
.end method

.method public isMapValue()Z
    .registers 2

    .prologue
    .line 44
    const/4 v0, 0x0

    return v0
.end method

.method public isNilValue()Z
    .registers 2

    .prologue
    .line 24
    const/4 v0, 0x0

    return v0
.end method

.method public isRawValue()Z
    .registers 2

    .prologue
    .line 48
    const/4 v0, 0x0

    return v0
.end method
