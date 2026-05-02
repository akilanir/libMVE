.class public Lorg/msgpack/unpacker/UnpackerIterator;
.super Ljava/lang/Object;
.source "UnpackerIterator.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Lorg/msgpack/type/Value;",
        ">;"
    }
.end annotation


# instance fields
.field private exception:Ljava/io/IOException;

.field private final u:Lorg/msgpack/unpacker/AbstractUnpacker;

.field private final uc:Lorg/msgpack/packer/Unconverter;


# direct methods
.method public constructor <init>(Lorg/msgpack/unpacker/AbstractUnpacker;)V
    .registers 4
    .param p1, "u"    # Lorg/msgpack/unpacker/AbstractUnpacker;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lorg/msgpack/unpacker/UnpackerIterator;->u:Lorg/msgpack/unpacker/AbstractUnpacker;

    .line 34
    new-instance v0, Lorg/msgpack/packer/Unconverter;

    iget-object v1, p1, Lorg/msgpack/unpacker/AbstractUnpacker;->msgpack:Lorg/msgpack/MessagePack;

    invoke-direct {v0, v1}, Lorg/msgpack/packer/Unconverter;-><init>(Lorg/msgpack/MessagePack;)V

    iput-object v0, p0, Lorg/msgpack/unpacker/UnpackerIterator;->uc:Lorg/msgpack/packer/Unconverter;

    .line 35
    return-void
.end method


# virtual methods
.method public getException()Ljava/io/IOException;
    .registers 2

    .prologue
    .line 67
    iget-object v0, p0, Lorg/msgpack/unpacker/UnpackerIterator;->exception:Ljava/io/IOException;

    return-object v0
.end method

.method public hasNext()Z
    .registers 6

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 38
    iget-object v3, p0, Lorg/msgpack/unpacker/UnpackerIterator;->uc:Lorg/msgpack/packer/Unconverter;

    invoke-virtual {v3}, Lorg/msgpack/packer/Unconverter;->getResult()Lorg/msgpack/type/Value;

    move-result-object v3

    if-eqz v3, :cond_b

    .line 50
    :cond_a
    :goto_a
    return v1

    .line 42
    :cond_b
    :try_start_b
    iget-object v3, p0, Lorg/msgpack/unpacker/UnpackerIterator;->u:Lorg/msgpack/unpacker/AbstractUnpacker;

    iget-object v4, p0, Lorg/msgpack/unpacker/UnpackerIterator;->uc:Lorg/msgpack/packer/Unconverter;

    invoke-virtual {v3, v4}, Lorg/msgpack/unpacker/AbstractUnpacker;->readValue(Lorg/msgpack/packer/Unconverter;)V
    :try_end_12
    .catch Ljava/io/EOFException; {:try_start_b .. :try_end_12} :catch_1c
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_12} :catch_1f

    .line 50
    iget-object v3, p0, Lorg/msgpack/unpacker/UnpackerIterator;->uc:Lorg/msgpack/packer/Unconverter;

    invoke-virtual {v3}, Lorg/msgpack/packer/Unconverter;->getResult()Lorg/msgpack/type/Value;

    move-result-object v3

    if-nez v3, :cond_a

    move v1, v2

    goto :goto_a

    .line 43
    :catch_1c
    move-exception v0

    .local v0, "ex":Ljava/io/EOFException;
    move v1, v2

    .line 44
    goto :goto_a

    .line 45
    .end local v0    # "ex":Ljava/io/EOFException;
    :catch_1f
    move-exception v0

    .line 47
    .local v0, "ex":Ljava/io/IOException;
    iput-object v0, p0, Lorg/msgpack/unpacker/UnpackerIterator;->exception:Ljava/io/IOException;

    move v1, v2

    .line 48
    goto :goto_a
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 27
    invoke-virtual {p0}, Lorg/msgpack/unpacker/UnpackerIterator;->next()Lorg/msgpack/type/Value;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/msgpack/type/Value;
    .registers 3

    .prologue
    .line 54
    invoke-virtual {p0}, Lorg/msgpack/unpacker/UnpackerIterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_c

    .line 55
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 57
    :cond_c
    iget-object v1, p0, Lorg/msgpack/unpacker/UnpackerIterator;->uc:Lorg/msgpack/packer/Unconverter;

    invoke-virtual {v1}, Lorg/msgpack/packer/Unconverter;->getResult()Lorg/msgpack/type/Value;

    move-result-object v0

    .line 58
    .local v0, "v":Lorg/msgpack/type/Value;
    iget-object v1, p0, Lorg/msgpack/unpacker/UnpackerIterator;->uc:Lorg/msgpack/packer/Unconverter;

    invoke-virtual {v1}, Lorg/msgpack/packer/Unconverter;->resetResult()V

    .line 59
    return-object v0
.end method

.method public remove()V
    .registers 2

    .prologue
    .line 63
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
