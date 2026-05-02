.class public Lorg/msgpack/template/ListTemplate;
.super Lorg/msgpack/template/AbstractTemplate;
.source "ListTemplate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/msgpack/template/AbstractTemplate",
        "<",
        "Ljava/util/List",
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
    .local p0, "this":Lorg/msgpack/template/ListTemplate;, "Lorg/msgpack/template/ListTemplate<TE;>;"
    .local p1, "elementTemplate":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TE;>;"
    invoke-direct {p0}, Lorg/msgpack/template/AbstractTemplate;-><init>()V

    .line 31
    iput-object p1, p0, Lorg/msgpack/template/ListTemplate;->elementTemplate:Lorg/msgpack/template/Template;

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
    .local p0, "this":Lorg/msgpack/template/ListTemplate;, "Lorg/msgpack/template/ListTemplate<TE;>;"
    check-cast p2, Ljava/util/List;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/ListTemplate;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/util/List;Z)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public read(Lorg/msgpack/unpacker/Unpacker;Ljava/util/List;Z)Ljava/util/List;
    .registers 9
    .param p1, "u"    # Lorg/msgpack/unpacker/Unpacker;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/msgpack/unpacker/Unpacker;",
            "Ljava/util/List",
            "<TE;>;Z)",
            "Ljava/util/List",
            "<TE;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/msgpack/template/ListTemplate;, "Lorg/msgpack/template/ListTemplate<TE;>;"
    .local p2, "to":Ljava/util/List;, "Ljava/util/List<TE;>;"
    const/4 v3, 0x0

    .line 56
    if-nez p3, :cond_a

    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->trySkipNil()Z

    move-result v4

    if-eqz v4, :cond_a

    .line 70
    :goto_9
    return-object v3

    .line 59
    :cond_a
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readArrayBegin()I

    move-result v2

    .line 60
    .local v2, "n":I
    if-nez p2, :cond_24

    .line 61
    new-instance p2, Ljava/util/ArrayList;

    .end local p2    # "to":Ljava/util/List;, "Ljava/util/List<TE;>;"
    invoke-direct {p2, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 65
    .restart local p2    # "to":Ljava/util/List;, "Ljava/util/List<TE;>;"
    :goto_15
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_16
    if-ge v1, v2, :cond_28

    .line 66
    iget-object v4, p0, Lorg/msgpack/template/ListTemplate;->elementTemplate:Lorg/msgpack/template/Template;

    invoke-interface {v4, p1, v3}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 67
    .local v0, "e":Ljava/lang/Object;, "TE;"
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    .line 63
    .end local v0    # "e":Ljava/lang/Object;, "TE;"
    .end local v1    # "i":I
    :cond_24
    invoke-interface {p2}, Ljava/util/List;->clear()V

    goto :goto_15

    .line 69
    .restart local v1    # "i":I
    :cond_28
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readArrayEnd()V

    move-object v3, p2

    .line 70
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
    .local p0, "this":Lorg/msgpack/template/ListTemplate;, "Lorg/msgpack/template/ListTemplate<TE;>;"
    check-cast p2, Ljava/util/List;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/ListTemplate;->write(Lorg/msgpack/packer/Packer;Ljava/util/List;Z)V

    return-void
.end method

.method public write(Lorg/msgpack/packer/Packer;Ljava/util/List;Z)V
    .registers 9
    .param p1, "pk"    # Lorg/msgpack/packer/Packer;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/msgpack/packer/Packer;",
            "Ljava/util/List",
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
    .local p0, "this":Lorg/msgpack/template/ListTemplate;, "Lorg/msgpack/template/ListTemplate<TE;>;"
    .local p2, "target":Ljava/util/List;, "Ljava/util/List<TE;>;"
    instance-of v2, p2, Ljava/util/List;

    if-nez v2, :cond_31

    .line 37
    if-nez p2, :cond_14

    .line 38
    if-eqz p3, :cond_10

    .line 39
    new-instance v2, Lorg/msgpack/MessageTypeException;

    const-string v3, "Attempted to write null"

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 41
    :cond_10
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeNil()Lorg/msgpack/packer/Packer;

    .line 52
    :goto_13
    return-void

    .line 44
    :cond_14
    new-instance v2, Lorg/msgpack/MessageTypeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Target is not a List but "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 47
    :cond_31
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {p1, v2}, Lorg/msgpack/packer/Packer;->writeArrayBegin(I)Lorg/msgpack/packer/Packer;

    .line 48
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_3c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 49
    .local v0, "e":Ljava/lang/Object;, "TE;"
    iget-object v2, p0, Lorg/msgpack/template/ListTemplate;->elementTemplate:Lorg/msgpack/template/Template;

    invoke-interface {v2, p1, v0}, Lorg/msgpack/template/Template;->write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;)V

    goto :goto_3c

    .line 51
    .end local v0    # "e":Ljava/lang/Object;, "TE;"
    :cond_4c
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeArrayEnd()Lorg/msgpack/packer/Packer;

    goto :goto_13
.end method
