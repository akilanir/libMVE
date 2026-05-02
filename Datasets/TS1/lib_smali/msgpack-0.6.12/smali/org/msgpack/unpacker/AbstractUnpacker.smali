.class public abstract Lorg/msgpack/unpacker/AbstractUnpacker;
.super Ljava/lang/Object;
.source "AbstractUnpacker.java"

# interfaces
.implements Lorg/msgpack/unpacker/Unpacker;


# instance fields
.field protected arraySizeLimit:I

.field protected mapSizeLimit:I

.field protected msgpack:Lorg/msgpack/MessagePack;

.field protected rawSizeLimit:I


# direct methods
.method protected constructor <init>(Lorg/msgpack/MessagePack;)V
    .registers 3
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const/high16 v0, 0x8000000

    iput v0, p0, Lorg/msgpack/unpacker/AbstractUnpacker;->rawSizeLimit:I

    .line 32
    const/high16 v0, 0x400000

    iput v0, p0, Lorg/msgpack/unpacker/AbstractUnpacker;->arraySizeLimit:I

    .line 34
    const/high16 v0, 0x200000

    iput v0, p0, Lorg/msgpack/unpacker/AbstractUnpacker;->mapSizeLimit:I

    .line 37
    iput-object p1, p0, Lorg/msgpack/unpacker/AbstractUnpacker;->msgpack:Lorg/msgpack/MessagePack;

    .line 38
    return-void
.end method


# virtual methods
.method public getReadByteCount()I
    .registers 3

    .prologue
    .line 107
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .registers 2

    .prologue
    .line 27
    invoke-virtual {p0}, Lorg/msgpack/unpacker/AbstractUnpacker;->iterator()Lorg/msgpack/unpacker/UnpackerIterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator()Lorg/msgpack/unpacker/UnpackerIterator;
    .registers 2

    .prologue
    .line 57
    new-instance v0, Lorg/msgpack/unpacker/UnpackerIterator;

    invoke-direct {v0, p0}, Lorg/msgpack/unpacker/UnpackerIterator;-><init>(Lorg/msgpack/unpacker/AbstractUnpacker;)V

    return-object v0
.end method

.method public read(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v1, 0x0

    .line 73
    invoke-virtual {p0}, Lorg/msgpack/unpacker/AbstractUnpacker;->tryReadNil()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 77
    :goto_7
    return-object v1

    .line 76
    :cond_8
    iget-object v2, p0, Lorg/msgpack/unpacker/AbstractUnpacker;->msgpack:Lorg/msgpack/MessagePack;

    invoke-virtual {v2, p1}, Lorg/msgpack/MessagePack;->lookup(Ljava/lang/Class;)Lorg/msgpack/template/Template;

    move-result-object v0

    .line 77
    .local v0, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    invoke-interface {v0, p0, v1}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_7
.end method

.method public read(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 83
    .local p1, "to":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0}, Lorg/msgpack/unpacker/AbstractUnpacker;->tryReadNil()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 84
    const/4 v1, 0x0

    .line 87
    :goto_7
    return-object v1

    .line 86
    :cond_8
    iget-object v1, p0, Lorg/msgpack/unpacker/AbstractUnpacker;->msgpack:Lorg/msgpack/MessagePack;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/msgpack/MessagePack;->lookup(Ljava/lang/Class;)Lorg/msgpack/template/Template;

    move-result-object v0

    .line 87
    .local v0, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    invoke-interface {v0, p0, p1}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_7
.end method

.method public read(Ljava/lang/Object;Lorg/msgpack/template/Template;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lorg/msgpack/template/Template",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    .local p1, "to":Ljava/lang/Object;, "TT;"
    .local p2, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    invoke-virtual {p0}, Lorg/msgpack/unpacker/AbstractUnpacker;->tryReadNil()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 101
    const/4 v0, 0x0

    .line 103
    :goto_7
    return-object v0

    :cond_8
    invoke-interface {p2, p0, p1}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_7
.end method

.method public read(Lorg/msgpack/template/Template;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/msgpack/template/Template",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p1, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    const/4 v0, 0x0

    .line 92
    invoke-virtual {p0}, Lorg/msgpack/unpacker/AbstractUnpacker;->tryReadNil()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 95
    :goto_7
    return-object v0

    :cond_8
    invoke-interface {p1, p0, v0}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_7
.end method

.method public readArrayEnd()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/msgpack/unpacker/AbstractUnpacker;->readArrayEnd(Z)V

    .line 48
    return-void
.end method

.method public readByteBuffer()Ljava/nio/ByteBuffer;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    invoke-virtual {p0}, Lorg/msgpack/unpacker/AbstractUnpacker;->readByteArray()[B

    move-result-object v0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public readMapEnd()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/msgpack/unpacker/AbstractUnpacker;->readMapEnd(Z)V

    .line 53
    return-void
.end method

.method public readValue()Lorg/msgpack/type/Value;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    new-instance v0, Lorg/msgpack/packer/Unconverter;

    iget-object v1, p0, Lorg/msgpack/unpacker/AbstractUnpacker;->msgpack:Lorg/msgpack/MessagePack;

    invoke-direct {v0, v1}, Lorg/msgpack/packer/Unconverter;-><init>(Lorg/msgpack/MessagePack;)V

    .line 65
    .local v0, "uc":Lorg/msgpack/packer/Unconverter;
    invoke-virtual {p0, v0}, Lorg/msgpack/unpacker/AbstractUnpacker;->readValue(Lorg/msgpack/packer/Unconverter;)V

    .line 66
    invoke-virtual {v0}, Lorg/msgpack/packer/Unconverter;->getResult()Lorg/msgpack/type/Value;

    move-result-object v1

    return-object v1
.end method

.method protected abstract readValue(Lorg/msgpack/packer/Unconverter;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public resetReadByteCount()V
    .registers 3

    .prologue
    .line 111
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setArraySizeLimit(I)V
    .registers 3
    .param p1, "size"    # I

    .prologue
    const/16 v0, 0x10

    .line 123
    if-ge p1, v0, :cond_7

    .line 124
    iput v0, p0, Lorg/msgpack/unpacker/AbstractUnpacker;->arraySizeLimit:I

    .line 128
    :goto_6
    return-void

    .line 126
    :cond_7
    iput p1, p0, Lorg/msgpack/unpacker/AbstractUnpacker;->arraySizeLimit:I

    goto :goto_6
.end method

.method public setMapSizeLimit(I)V
    .registers 3
    .param p1, "size"    # I

    .prologue
    const/16 v0, 0x10

    .line 131
    if-ge p1, v0, :cond_7

    .line 132
    iput v0, p0, Lorg/msgpack/unpacker/AbstractUnpacker;->mapSizeLimit:I

    .line 136
    :goto_6
    return-void

    .line 134
    :cond_7
    iput p1, p0, Lorg/msgpack/unpacker/AbstractUnpacker;->mapSizeLimit:I

    goto :goto_6
.end method

.method public setRawSizeLimit(I)V
    .registers 3
    .param p1, "size"    # I

    .prologue
    const/16 v0, 0x20

    .line 115
    if-ge p1, v0, :cond_7

    .line 116
    iput v0, p0, Lorg/msgpack/unpacker/AbstractUnpacker;->rawSizeLimit:I

    .line 120
    :goto_6
    return-void

    .line 118
    :cond_7
    iput p1, p0, Lorg/msgpack/unpacker/AbstractUnpacker;->rawSizeLimit:I

    goto :goto_6
.end method

.method protected abstract tryReadNil()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
