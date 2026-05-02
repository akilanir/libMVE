.class public Lorg/msgpack/template/BigIntegerTemplate;
.super Lorg/msgpack/template/AbstractTemplate;
.source "BigIntegerTemplate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/msgpack/template/AbstractTemplate",
        "<",
        "Ljava/math/BigInteger;",
        ">;"
    }
.end annotation


# static fields
.field static final instance:Lorg/msgpack/template/BigIntegerTemplate;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 54
    new-instance v0, Lorg/msgpack/template/BigIntegerTemplate;

    invoke-direct {v0}, Lorg/msgpack/template/BigIntegerTemplate;-><init>()V

    sput-object v0, Lorg/msgpack/template/BigIntegerTemplate;->instance:Lorg/msgpack/template/BigIntegerTemplate;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/msgpack/template/AbstractTemplate;-><init>()V

    .line 28
    return-void
.end method

.method public static getInstance()Lorg/msgpack/template/BigIntegerTemplate;
    .registers 1

    .prologue
    .line 51
    sget-object v0, Lorg/msgpack/template/BigIntegerTemplate;->instance:Lorg/msgpack/template/BigIntegerTemplate;

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
    .line 26
    check-cast p2, Ljava/math/BigInteger;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/BigIntegerTemplate;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/math/BigInteger;Z)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public read(Lorg/msgpack/unpacker/Unpacker;Ljava/math/BigInteger;Z)Ljava/math/BigInteger;
    .registers 5
    .param p1, "u"    # Lorg/msgpack/unpacker/Unpacker;
    .param p2, "to"    # Ljava/math/BigInteger;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    if-nez p3, :cond_a

    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->trySkipNil()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 45
    const/4 v0, 0x0

    .line 47
    :goto_9
    return-object v0

    :cond_a
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readBigInteger()Ljava/math/BigInteger;

    move-result-object v0

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
    .line 26
    check-cast p2, Ljava/math/BigInteger;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/BigIntegerTemplate;->write(Lorg/msgpack/packer/Packer;Ljava/math/BigInteger;Z)V

    return-void
.end method

.method public write(Lorg/msgpack/packer/Packer;Ljava/math/BigInteger;Z)V
    .registers 6
    .param p1, "pk"    # Lorg/msgpack/packer/Packer;
    .param p2, "target"    # Ljava/math/BigInteger;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 32
    if-nez p2, :cond_10

    .line 33
    if-eqz p3, :cond_c

    .line 34
    new-instance v0, Lorg/msgpack/MessageTypeException;

    const-string v1, "Attempted to write null"

    invoke-direct {v0, v1}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 36
    :cond_c
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeNil()Lorg/msgpack/packer/Packer;

    .line 40
    :goto_f
    return-void

    .line 39
    :cond_10
    invoke-interface {p1, p2}, Lorg/msgpack/packer/Packer;->write(Ljava/math/BigInteger;)Lorg/msgpack/packer/Packer;

    goto :goto_f
.end method
