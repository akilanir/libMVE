.class abstract Lorg/msgpack/type/AbstractArrayValue;
.super Ljava/util/AbstractList;
.source "AbstractArrayValue.java"

# interfaces
.implements Lorg/msgpack/type/ArrayValue;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractList",
        "<",
        "Lorg/msgpack/type/Value;",
        ">;",
        "Lorg/msgpack/type/ArrayValue;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    return-void
.end method


# virtual methods
.method public asArrayValue()Lorg/msgpack/type/ArrayValue;
    .registers 1

    .prologue
    .line 36
    return-object p0
.end method

.method public asBooleanValue()Lorg/msgpack/type/BooleanValue;
    .registers 2

    .prologue
    .line 76
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0
.end method

.method public asFloatValue()Lorg/msgpack/type/FloatValue;
    .registers 2

    .prologue
    .line 86
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0
.end method

.method public asIntegerValue()Lorg/msgpack/type/IntegerValue;
    .registers 2

    .prologue
    .line 81
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0
.end method

.method public asMapValue()Lorg/msgpack/type/MapValue;
    .registers 2

    .prologue
    .line 91
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0
.end method

.method public asNilValue()Lorg/msgpack/type/NilValue;
    .registers 2

    .prologue
    .line 71
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0
.end method

.method public asRawValue()Lorg/msgpack/type/RawValue;
    .registers 2

    .prologue
    .line 96
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0
.end method

.method public getType()Lorg/msgpack/type/ValueType;
    .registers 2

    .prologue
    .line 26
    sget-object v0, Lorg/msgpack/type/ValueType;->ARRAY:Lorg/msgpack/type/ValueType;

    return-object v0
.end method

.method public isArrayValue()Z
    .registers 2

    .prologue
    .line 31
    const/4 v0, 0x1

    return v0
.end method

.method public isBooleanValue()Z
    .registers 2

    .prologue
    .line 46
    const/4 v0, 0x0

    return v0
.end method

.method public isFloatValue()Z
    .registers 2

    .prologue
    .line 56
    const/4 v0, 0x0

    return v0
.end method

.method public isIntegerValue()Z
    .registers 2

    .prologue
    .line 51
    const/4 v0, 0x0

    return v0
.end method

.method public isMapValue()Z
    .registers 2

    .prologue
    .line 61
    const/4 v0, 0x0

    return v0
.end method

.method public isNilValue()Z
    .registers 2

    .prologue
    .line 41
    const/4 v0, 0x0

    return v0
.end method

.method public isRawValue()Z
    .registers 2

    .prologue
    .line 66
    const/4 v0, 0x0

    return v0
.end method
