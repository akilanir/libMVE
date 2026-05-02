.class abstract Lorg/msgpack/type/AbstractBooleanValue;
.super Lorg/msgpack/type/AbstractValue;
.source "AbstractBooleanValue.java"

# interfaces
.implements Lorg/msgpack/type/BooleanValue;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Lorg/msgpack/type/AbstractValue;-><init>()V

    return-void
.end method


# virtual methods
.method public asBooleanValue()Lorg/msgpack/type/BooleanValue;
    .registers 1

    .prologue
    .line 41
    return-object p0
.end method

.method public getType()Lorg/msgpack/type/ValueType;
    .registers 2

    .prologue
    .line 23
    sget-object v0, Lorg/msgpack/type/ValueType;->BOOLEAN:Lorg/msgpack/type/ValueType;

    return-object v0
.end method

.method public isBooleanValue()Z
    .registers 2

    .prologue
    .line 28
    const/4 v0, 0x1

    return v0
.end method

.method public isFalse()Z
    .registers 2

    .prologue
    .line 36
    invoke-virtual {p0}, Lorg/msgpack/type/AbstractBooleanValue;->getBoolean()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isTrue()Z
    .registers 2

    .prologue
    .line 32
    invoke-virtual {p0}, Lorg/msgpack/type/AbstractBooleanValue;->getBoolean()Z

    move-result v0

    return v0
.end method
