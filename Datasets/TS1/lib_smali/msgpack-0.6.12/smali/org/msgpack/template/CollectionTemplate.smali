.class public Lorg/msgpack/template/CollectionTemplate;
.super Lorg/msgpack/template/AbstractTemplate;
.source "CollectionTemplate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/msgpack/template/AbstractTemplate",
        "<",
        "Ljava/util/Collection",
        "<TE;>;>;"
    }
.end annotation


# instance fields
.field private elementTemplate:Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/msgpack/template/Template",
            "<TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/msgpack/template/Template;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/msgpack/template/Template",
            "<TE;>;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, "this":Lorg/msgpack/template/CollectionTemplate;, "Lorg/msgpack/template/CollectionTemplate<TE;>;"
    .local p1, "elementTemplate":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TE;>;"
    invoke-direct {p0}, Lorg/msgpack/template/AbstractTemplate;-><init>()V

    .line 31
    iput-object p1, p0, Lorg/msgpack/template/CollectionTemplate;->elementTemplate:Lorg/msgpack/template/Template;

    .line 32
    return-void
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
    .line 27
    .local p0, "this":Lorg/msgpack/template/CollectionTemplate;, "Lorg/msgpack/template/CollectionTemplate<TE;>;"
    check-cast p2, Ljava/util/Collection;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/CollectionTemplate;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/util/Collection;Z)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public read(Lorg/msgpack/unpacker/Unpacker;Ljava/util/Collection;Z)Ljava/util/Collection;
    .registers 9
    .param p1, "u"    # Lorg/msgpack/unpacker/Unpacker;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/msgpack/unpacker/Unpacker;",
            "Ljava/util/Collection",
            "<TE;>;Z)",
            "Ljava/util/Collection",
            "<TE;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/msgpack/template/CollectionTemplate;, "Lorg/msgpack/template/CollectionTemplate<TE;>;"
    .local p2, "to":Ljava/util/Collection;, "Ljava/util/Collection<TE;>;"
    const/4 v3, 0x0

    .line 53
    if-nez p3, :cond_a

    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->trySkipNil()Z

    move-result v4

    if-eqz v4, :cond_a

    .line 67
    :goto_9
    return-object v3

    .line 56
    :cond_a
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readArrayBegin()I

    move-result v2

    .line 57
    .local v2, "n":I
    if-nez p2, :cond_24

    .line 58
    new-instance p2, Ljava/util/LinkedList;

    .end local p2    # "to":Ljava/util/Collection;, "Ljava/util/Collection<TE;>;"
    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    .line 62
    .restart local p2    # "to":Ljava/util/Collection;, "Ljava/util/Collection<TE;>;"
    :goto_15
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_16
    if-ge v1, v2, :cond_28

    .line 63
    iget-object v4, p0, Lorg/msgpack/template/CollectionTemplate;->elementTemplate:Lorg/msgpack/template/Template;

    invoke-interface {v4, p1, v3}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 64
    .local v0, "e":Ljava/lang/Object;, "TE;"
    invoke-interface {p2, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 62
    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    .line 60
    .end local v0    # "e":Ljava/lang/Object;, "TE;"
    .end local v1    # "i":I
    :cond_24
    invoke-interface {p2}, Ljava/util/Collection;->clear()V

    goto :goto_15

    .line 66
    .restart local v1    # "i":I
    :cond_28
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readArrayEnd()V

    move-object v3, p2

    .line 67
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
    .line 27
    .local p0, "this":Lorg/msgpack/template/CollectionTemplate;, "Lorg/msgpack/template/CollectionTemplate<TE;>;"
    check-cast p2, Ljava/util/Collection;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/CollectionTemplate;->write(Lorg/msgpack/packer/Packer;Ljava/util/Collection;Z)V

    return-void
.end method

.method public write(Lorg/msgpack/packer/Packer;Ljava/util/Collection;Z)V
    .registers 9
    .param p1, "pk"    # Lorg/msgpack/packer/Packer;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/msgpack/packer/Packer;",
            "Ljava/util/Collection",
            "<TE;>;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    .local p0, "this":Lorg/msgpack/template/CollectionTemplate;, "Lorg/msgpack/template/CollectionTemplate<TE;>;"
    .local p2, "target":Ljava/util/Collection;, "Ljava/util/Collection<TE;>;"
    if-nez p2, :cond_10

    .line 37
    if-eqz p3, :cond_c

    .line 38
    new-instance v3, Lorg/msgpack/MessageTypeException;

    const-string v4, "Attempted to write null"

    invoke-direct {v3, v4}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 40
    :cond_c
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeNil()Lorg/msgpack/packer/Packer;

    .line 49
    :goto_f
    return-void

    .line 43
    :cond_10
    move-object v0, p2

    .line 44
    .local v0, "col":Ljava/util/Collection;, "Ljava/util/Collection<TE;>;"
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v3

    invoke-interface {p1, v3}, Lorg/msgpack/packer/Packer;->writeArrayBegin(I)Lorg/msgpack/packer/Packer;

    .line 45
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 46
    .local v1, "e":Ljava/lang/Object;, "TE;"
    iget-object v3, p0, Lorg/msgpack/template/CollectionTemplate;->elementTemplate:Lorg/msgpack/template/Template;

    invoke-interface {v3, p1, v1}, Lorg/msgpack/template/Template;->write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;)V

    goto :goto_1c

    .line 48
    .end local v1    # "e":Ljava/lang/Object;, "TE;"
    :cond_2c
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeArrayEnd()Lorg/msgpack/packer/Packer;

    goto :goto_f
.end method
