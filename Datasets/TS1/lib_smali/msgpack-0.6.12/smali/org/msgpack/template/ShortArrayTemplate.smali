.class public Lorg/msgpack/template/ShortArrayTemplate;
.super Lorg/msgpack/template/AbstractTemplate;
.source "ShortArrayTemplate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/msgpack/template/AbstractTemplate",
        "<[S>;"
    }
.end annotation


# static fields
.field static final instance:Lorg/msgpack/template/ShortArrayTemplate;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 65
    new-instance v0, Lorg/msgpack/template/ShortArrayTemplate;

    invoke-direct {v0}, Lorg/msgpack/template/ShortArrayTemplate;-><init>()V

    sput-object v0, Lorg/msgpack/template/ShortArrayTemplate;->instance:Lorg/msgpack/template/ShortArrayTemplate;

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

.method public static getInstance()Lorg/msgpack/template/ShortArrayTemplate;
    .registers 1

    .prologue
    .line 62
    sget-object v0, Lorg/msgpack/template/ShortArrayTemplate;->instance:Lorg/msgpack/template/ShortArrayTemplate;

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
    check-cast p2, [S

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/ShortArrayTemplate;->read(Lorg/msgpack/unpacker/Unpacker;[SZ)[S

    move-result-object v0

    return-object v0
.end method

.method public read(Lorg/msgpack/unpacker/Unpacker;[SZ)[S
    .registers 7
    .param p1, "u"    # Lorg/msgpack/unpacker/Unpacker;
    .param p2, "to"    # [S
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

    move-result v2

    if-eqz v2, :cond_a

    .line 48
    const/4 v2, 0x0

    .line 58
    :goto_9
    return-object v2

    .line 50
    :cond_a
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readArrayBegin()I

    move-result v1

    .line 51
    .local v1, "n":I
    if-eqz p2, :cond_13

    array-length v2, p2

    if-eq v2, v1, :cond_15

    .line 52
    :cond_13
    new-array p2, v1, [S

    .line 54
    :cond_15
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_16
    if-ge v0, v1, :cond_21

    .line 55
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readShort()S

    move-result v2

    aput-short v2, p2, v0

    .line 54
    add-int/lit8 v0, v0, 0x1

    goto :goto_16

    .line 57
    :cond_21
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readArrayEnd()V

    move-object v2, p2

    .line 58
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
    check-cast p2, [S

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/ShortArrayTemplate;->write(Lorg/msgpack/packer/Packer;[SZ)V

    return-void
.end method

.method public write(Lorg/msgpack/packer/Packer;[SZ)V
    .registers 10
    .param p1, "pk"    # Lorg/msgpack/packer/Packer;
    .param p2, "target"    # [S
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

    .local v1, "arr$":[S
    array-length v3, v1

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_17
    if-ge v2, v3, :cond_21

    aget-short v0, v1, v2

    .line 40
    .local v0, "a":S
    invoke-interface {p1, v0}, Lorg/msgpack/packer/Packer;->write(S)Lorg/msgpack/packer/Packer;

    .line 39
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 42
    .end local v0    # "a":S
    :cond_21
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeArrayEnd()Lorg/msgpack/packer/Packer;

    goto :goto_f
.end method
