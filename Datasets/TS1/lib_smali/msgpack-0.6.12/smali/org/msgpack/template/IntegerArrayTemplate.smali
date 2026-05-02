.class public Lorg/msgpack/template/IntegerArrayTemplate;
.super Lorg/msgpack/template/AbstractTemplate;
.source "IntegerArrayTemplate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/msgpack/template/AbstractTemplate",
        "<[I>;"
    }
.end annotation


# static fields
.field static final instance:Lorg/msgpack/template/IntegerArrayTemplate;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 68
    new-instance v0, Lorg/msgpack/template/IntegerArrayTemplate;

    invoke-direct {v0}, Lorg/msgpack/template/IntegerArrayTemplate;-><init>()V

    sput-object v0, Lorg/msgpack/template/IntegerArrayTemplate;->instance:Lorg/msgpack/template/IntegerArrayTemplate;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/msgpack/template/AbstractTemplate;-><init>()V

    .line 27
    return-void
.end method

.method public static getInstance()Lorg/msgpack/template/IntegerArrayTemplate;
    .registers 1

    .prologue
    .line 65
    sget-object v0, Lorg/msgpack/template/IntegerArrayTemplate;->instance:Lorg/msgpack/template/IntegerArrayTemplate;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;Z)Ljava/lang/Object;
    .registers 5
    .param p1, "x0"    # Lorg/msgpack/unpacker/Unpacker;
    .param p2, "x1"    # Ljava/lang/Object;
    .param p3, "x2"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 25
    check-cast p2, [I

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/IntegerArrayTemplate;->read(Lorg/msgpack/unpacker/Unpacker;[IZ)[I

    move-result-object v0

    return-object v0
.end method

.method public read(Lorg/msgpack/unpacker/Unpacker;[IZ)[I
    .registers 8
    .param p1, "u"    # Lorg/msgpack/unpacker/Unpacker;
    .param p2, "to"    # [I
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    if-nez p3, :cond_a

    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->trySkipNil()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 48
    const/4 v0, 0x0

    .line 61
    :goto_9
    return-object v0

    .line 50
    :cond_a
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readArrayBegin()I

    move-result v2

    .line 52
    .local v2, "n":I
    if-eqz p2, :cond_20

    array-length v3, p2

    if-ne v3, v2, :cond_20

    .line 53
    move-object v0, p2

    .line 57
    .local v0, "array":[I
    :goto_14
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_15
    if-ge v1, v2, :cond_23

    .line 58
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readInt()I

    move-result v3

    aput v3, v0, v1

    .line 57
    add-int/lit8 v1, v1, 0x1

    goto :goto_15

    .line 55
    .end local v0    # "array":[I
    .end local v1    # "i":I
    :cond_20
    new-array v0, v2, [I

    .restart local v0    # "array":[I
    goto :goto_14

    .line 60
    .restart local v1    # "i":I
    :cond_23
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readArrayEnd()V

    goto :goto_9
.end method

.method public bridge synthetic write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;Z)V
    .registers 4
    .param p1, "x0"    # Lorg/msgpack/packer/Packer;
    .param p2, "x1"    # Ljava/lang/Object;
    .param p3, "x2"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 25
    check-cast p2, [I

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/IntegerArrayTemplate;->write(Lorg/msgpack/packer/Packer;[IZ)V

    return-void
.end method

.method public write(Lorg/msgpack/packer/Packer;[IZ)V
    .registers 10
    .param p1, "pk"    # Lorg/msgpack/packer/Packer;
    .param p2, "target"    # [I
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 31
    if-nez p2, :cond_10

    .line 32
    if-eqz p3, :cond_c

    .line 33
    new-instance v4, Lorg/msgpack/MessageTypeException;

    const-string v5, "Attempted to write null"

    invoke-direct {v4, v5}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 35
    :cond_c
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeNil()Lorg/msgpack/packer/Packer;

    .line 43
    :goto_f
    return-void

    .line 38
    :cond_10
    array-length v4, p2

    invoke-interface {p1, v4}, Lorg/msgpack/packer/Packer;->writeArrayBegin(I)Lorg/msgpack/packer/Packer;

    .line 39
    move-object v1, p2

    .local v1, "arr$":[I
    array-length v3, v1

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_17
    if-ge v2, v3, :cond_21

    aget v0, v1, v2

    .line 40
    .local v0, "a":I
    invoke-interface {p1, v0}, Lorg/msgpack/packer/Packer;->write(I)Lorg/msgpack/packer/Packer;

    .line 39
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 42
    .end local v0    # "a":I
    :cond_21
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeArrayEnd()Lorg/msgpack/packer/Packer;

    goto :goto_f
.end method
