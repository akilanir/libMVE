.class public Lorg/msgpack/template/ObjectArrayTemplate;
.super Lorg/msgpack/template/AbstractTemplate;
.source "ObjectArrayTemplate.java"


# instance fields
.field protected componentClass:Ljava/lang/Class;

.field protected componentTemplate:Lorg/msgpack/template/Template;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lorg/msgpack/template/Template;)V
    .registers 3
    .param p1, "componentClass"    # Ljava/lang/Class;
    .param p2, "componentTemplate"    # Lorg/msgpack/template/Template;

    .prologue
    .line 16
    invoke-direct {p0}, Lorg/msgpack/template/AbstractTemplate;-><init>()V

    .line 17
    iput-object p1, p0, Lorg/msgpack/template/ObjectArrayTemplate;->componentClass:Ljava/lang/Class;

    .line 18
    iput-object p2, p0, Lorg/msgpack/template/ObjectArrayTemplate;->componentTemplate:Lorg/msgpack/template/Template;

    .line 19
    return-void
.end method


# virtual methods
.method public read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;Z)Ljava/lang/Object;
    .registers 9
    .param p1, "unpacker"    # Lorg/msgpack/unpacker/Unpacker;
    .param p2, "to"    # Ljava/lang/Object;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 48
    if-nez p3, :cond_b

    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->trySkipNil()Z

    move-result v3

    if-eqz v3, :cond_b

    move-object v0, v4

    .line 58
    :goto_a
    return-object v0

    .line 52
    :cond_b
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readArrayBegin()I

    move-result v2

    .line 53
    .local v2, "length":I
    iget-object v3, p0, Lorg/msgpack/template/ObjectArrayTemplate;->componentClass:Ljava/lang/Class;

    invoke-static {v3, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Object;

    move-object v0, v3

    check-cast v0, [Ljava/lang/Object;

    .line 54
    .local v0, "array":[Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1b
    if-ge v1, v2, :cond_28

    .line 55
    iget-object v3, p0, Lorg/msgpack/template/ObjectArrayTemplate;->componentTemplate:Lorg/msgpack/template/Template;

    invoke-interface {v3, p1, v4, p3}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v0, v1

    .line 54
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    .line 57
    :cond_28
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readArrayEnd()V

    goto :goto_a
.end method

.method public write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;Z)V
    .registers 9
    .param p1, "packer"    # Lorg/msgpack/packer/Packer;
    .param p2, "v"    # Ljava/lang/Object;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 24
    if-nez p2, :cond_10

    .line 25
    if-eqz p3, :cond_c

    .line 26
    new-instance v3, Lorg/msgpack/MessageTypeException;

    const-string v4, "Attempted to write null"

    invoke-direct {v3, v4}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 28
    :cond_c
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeNil()Lorg/msgpack/packer/Packer;

    .line 43
    .end local p2    # "v":Ljava/lang/Object;
    :goto_f
    return-void

    .line 31
    .restart local p2    # "v":Ljava/lang/Object;
    :cond_10
    instance-of v3, p2, [Ljava/lang/Object;

    if-eqz v3, :cond_24

    iget-object v3, p0, Lorg/msgpack/template/ObjectArrayTemplate;->componentClass:Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_2a

    .line 33
    :cond_24
    new-instance v3, Lorg/msgpack/MessageTypeException;

    invoke-direct {v3}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v3

    .line 36
    :cond_2a
    check-cast p2, [Ljava/lang/Object;

    .end local p2    # "v":Ljava/lang/Object;
    move-object v0, p2

    check-cast v0, [Ljava/lang/Object;

    .line 37
    .local v0, "array":[Ljava/lang/Object;
    array-length v2, v0

    .line 38
    .local v2, "length":I
    invoke-interface {p1, v2}, Lorg/msgpack/packer/Packer;->writeArrayBegin(I)Lorg/msgpack/packer/Packer;

    .line 39
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_34
    if-ge v1, v2, :cond_40

    .line 40
    iget-object v3, p0, Lorg/msgpack/template/ObjectArrayTemplate;->componentTemplate:Lorg/msgpack/template/Template;

    aget-object v4, v0, v1

    invoke-interface {v3, p1, v4, p3}, Lorg/msgpack/template/Template;->write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;Z)V

    .line 39
    add-int/lit8 v1, v1, 0x1

    goto :goto_34

    .line 42
    :cond_40
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeArrayEnd()Lorg/msgpack/packer/Packer;

    goto :goto_f
.end method
