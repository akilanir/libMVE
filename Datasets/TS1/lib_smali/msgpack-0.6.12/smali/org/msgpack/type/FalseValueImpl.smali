.class Lorg/msgpack/type/FalseValueImpl;
.super Lorg/msgpack/type/AbstractBooleanValue;
.source "FalseValueImpl.java"


# static fields
.field private static instance:Lorg/msgpack/type/FalseValueImpl;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 27
    new-instance v0, Lorg/msgpack/type/FalseValueImpl;

    invoke-direct {v0}, Lorg/msgpack/type/FalseValueImpl;-><init>()V

    sput-object v0, Lorg/msgpack/type/FalseValueImpl;->instance:Lorg/msgpack/type/FalseValueImpl;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Lorg/msgpack/type/AbstractBooleanValue;-><init>()V

    .line 25
    return-void
.end method

.method static getInstance()Lorg/msgpack/type/FalseValueImpl;
    .registers 1

    .prologue
    .line 30
    sget-object v0, Lorg/msgpack/type/FalseValueImpl;->instance:Lorg/msgpack/type/FalseValueImpl;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 45
    if-ne p1, p0, :cond_5

    .line 56
    :cond_4
    :goto_4
    return v1

    .line 48
    :cond_5
    instance-of v3, p1, Lorg/msgpack/type/Value;

    if-nez v3, :cond_b

    move v1, v2

    .line 49
    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 51
    check-cast v0, Lorg/msgpack/type/Value;

    .line 52
    .local v0, "v":Lorg/msgpack/type/Value;
    invoke-interface {v0}, Lorg/msgpack/type/Value;->isBooleanValue()Z

    move-result v3

    if-nez v3, :cond_16

    move v1, v2

    .line 53
    goto :goto_4

    .line 56
    :cond_16
    invoke-interface {v0}, Lorg/msgpack/type/Value;->asBooleanValue()Lorg/msgpack/type/BooleanValue;

    move-result-object v3

    invoke-interface {v3}, Lorg/msgpack/type/BooleanValue;->getBoolean()Z

    move-result v3

    if-eqz v3, :cond_4

    move v1, v2

    goto :goto_4
.end method

.method public getBoolean()Z
    .registers 2

    .prologue
    .line 35
    const/4 v0, 0x0

    return v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 61
    const/16 v0, 0x4d5

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 66
    const-string v0, "false"

    return-object v0
.end method

.method public toString(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .registers 3
    .param p1, "sb"    # Ljava/lang/StringBuilder;

    .prologue
    .line 71
    const-string v0, "false"

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
    .line 40
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lorg/msgpack/packer/Packer;->write(Z)Lorg/msgpack/packer/Packer;

    .line 41
    return-void
.end method
