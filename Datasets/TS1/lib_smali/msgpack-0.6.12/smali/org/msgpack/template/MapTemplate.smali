.class public Lorg/msgpack/template/MapTemplate;
.super Lorg/msgpack/template/AbstractTemplate;
.source "MapTemplate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/msgpack/template/AbstractTemplate",
        "<",
        "Ljava/util/Map",
        "<TK;TV;>;>;"
    }
.end annotation


# instance fields
.field private keyTemplate:Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/msgpack/template/Template",
            "<TK;>;"
        }
    .end annotation
.end field

.field private valueTemplate:Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/msgpack/template/Template",
            "<TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/msgpack/template/Template;Lorg/msgpack/template/Template;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/msgpack/template/Template",
            "<TK;>;",
            "Lorg/msgpack/template/Template",
            "<TV;>;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p0, "this":Lorg/msgpack/template/MapTemplate;, "Lorg/msgpack/template/MapTemplate<TK;TV;>;"
    .local p1, "keyTemplate":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TK;>;"
    .local p2, "valueTemplate":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TV;>;"
    invoke-direct {p0}, Lorg/msgpack/template/AbstractTemplate;-><init>()V

    .line 32
    iput-object p1, p0, Lorg/msgpack/template/MapTemplate;->keyTemplate:Lorg/msgpack/template/Template;

    .line 33
    iput-object p2, p0, Lorg/msgpack/template/MapTemplate;->valueTemplate:Lorg/msgpack/template/Template;

    .line 34
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
    .local p0, "this":Lorg/msgpack/template/MapTemplate;, "Lorg/msgpack/template/MapTemplate<TK;TV;>;"
    check-cast p2, Ljava/util/Map;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/MapTemplate;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/util/Map;Z)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public read(Lorg/msgpack/unpacker/Unpacker;Ljava/util/Map;Z)Ljava/util/Map;
    .registers 11
    .param p1, "u"    # Lorg/msgpack/unpacker/Unpacker;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/msgpack/unpacker/Unpacker;",
            "Ljava/util/Map",
            "<TK;TV;>;Z)",
            "Ljava/util/Map",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/msgpack/template/MapTemplate;, "Lorg/msgpack/template/MapTemplate<TK;TV;>;"
    .local p2, "to":Ljava/util/Map;, "Ljava/util/Map<TK;TV;>;"
    const/4 v5, 0x0

    .line 59
    if-nez p3, :cond_b

    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->trySkipNil()Z

    move-result v6

    if-eqz v6, :cond_b

    move-object v2, v5

    .line 76
    :goto_a
    return-object v2

    .line 62
    :cond_b
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readMapBegin()I

    move-result v3

    .line 64
    .local v3, "n":I
    if-eqz p2, :cond_2a

    .line 65
    move-object v2, p2

    .line 66
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<TK;TV;>;"
    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 70
    :goto_15
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_16
    if-ge v0, v3, :cond_30

    .line 71
    iget-object v6, p0, Lorg/msgpack/template/MapTemplate;->keyTemplate:Lorg/msgpack/template/Template;

    invoke-interface {v6, p1, v5}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 72
    .local v1, "key":Ljava/lang/Object;, "TK;"
    iget-object v6, p0, Lorg/msgpack/template/MapTemplate;->valueTemplate:Lorg/msgpack/template/Template;

    invoke-interface {v6, p1, v5}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 73
    .local v4, "value":Ljava/lang/Object;, "TV;"
    invoke-interface {v2, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    add-int/lit8 v0, v0, 0x1

    goto :goto_16

    .line 68
    .end local v0    # "i":I
    .end local v1    # "key":Ljava/lang/Object;, "TK;"
    .end local v2    # "map":Ljava/util/Map;, "Ljava/util/Map<TK;TV;>;"
    .end local v4    # "value":Ljava/lang/Object;, "TV;"
    :cond_2a
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2, v3}, Ljava/util/HashMap;-><init>(I)V

    .restart local v2    # "map":Ljava/util/Map;, "Ljava/util/Map<TK;TV;>;"
    goto :goto_15

    .line 75
    .restart local v0    # "i":I
    :cond_30
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readMapEnd()V

    goto :goto_a
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
    .local p0, "this":Lorg/msgpack/template/MapTemplate;, "Lorg/msgpack/template/MapTemplate<TK;TV;>;"
    check-cast p2, Ljava/util/Map;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/MapTemplate;->write(Lorg/msgpack/packer/Packer;Ljava/util/Map;Z)V

    return-void
.end method

.method public write(Lorg/msgpack/packer/Packer;Ljava/util/Map;Z)V
    .registers 10
    .param p1, "pk"    # Lorg/msgpack/packer/Packer;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/msgpack/packer/Packer;",
            "Ljava/util/Map",
            "<TK;TV;>;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 38
    .local p0, "this":Lorg/msgpack/template/MapTemplate;, "Lorg/msgpack/template/MapTemplate<TK;TV;>;"
    .local p2, "target":Ljava/util/Map;, "Ljava/util/Map<TK;TV;>;"
    instance-of v3, p2, Ljava/util/Map;

    if-nez v3, :cond_31

    .line 39
    if-nez p2, :cond_14

    .line 40
    if-eqz p3, :cond_10

    .line 41
    new-instance v3, Lorg/msgpack/MessageTypeException;

    const-string v4, "Attempted to write null"

    invoke-direct {v3, v4}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 43
    :cond_10
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeNil()Lorg/msgpack/packer/Packer;

    .line 55
    :goto_13
    return-void

    .line 46
    :cond_14
    new-instance v3, Lorg/msgpack/MessageTypeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Target is not a Map but "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 48
    :cond_31
    move-object v1, p2

    .line 49
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<TK;TV;>;"
    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v3

    invoke-interface {p1, v3}, Lorg/msgpack/packer/Packer;->writeMapBegin(I)Lorg/msgpack/packer/Packer;

    .line 50
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_41
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_60

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 51
    .local v2, "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    iget-object v3, p0, Lorg/msgpack/template/MapTemplate;->keyTemplate:Lorg/msgpack/template/Template;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, p1, v4}, Lorg/msgpack/template/Template;->write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;)V

    .line 52
    iget-object v3, p0, Lorg/msgpack/template/MapTemplate;->valueTemplate:Lorg/msgpack/template/Template;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, p1, v4}, Lorg/msgpack/template/Template;->write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;)V

    goto :goto_41

    .line 54
    .end local v2    # "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    :cond_60
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeMapEnd()Lorg/msgpack/packer/Packer;

    goto :goto_13
.end method
