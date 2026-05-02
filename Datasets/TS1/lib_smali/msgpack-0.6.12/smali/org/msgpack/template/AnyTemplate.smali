.class public Lorg/msgpack/template/AnyTemplate;
.super Lorg/msgpack/template/AbstractTemplate;
.source "AnyTemplate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/msgpack/template/AbstractTemplate",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private registry:Lorg/msgpack/template/TemplateRegistry;


# direct methods
.method public constructor <init>(Lorg/msgpack/template/TemplateRegistry;)V
    .registers 2
    .param p1, "registry"    # Lorg/msgpack/template/TemplateRegistry;

    .prologue
    .line 30
    .local p0, "this":Lorg/msgpack/template/AnyTemplate;, "Lorg/msgpack/template/AnyTemplate<TT;>;"
    invoke-direct {p0}, Lorg/msgpack/template/AbstractTemplate;-><init>()V

    .line 31
    iput-object p1, p0, Lorg/msgpack/template/AnyTemplate;->registry:Lorg/msgpack/template/TemplateRegistry;

    .line 32
    return-void
.end method


# virtual methods
.method public read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;Z)Ljava/lang/Object;
    .registers 7
    .param p1, "u"    # Lorg/msgpack/unpacker/Unpacker;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/msgpack/unpacker/Unpacker;",
            "TT;Z)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/msgpack/MessageTypeException;
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "this":Lorg/msgpack/template/AnyTemplate;, "Lorg/msgpack/template/AnyTemplate<TT;>;"
    .local p2, "to":Ljava/lang/Object;, "TT;"
    if-nez p3, :cond_a

    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->trySkipNil()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 49
    const/4 v0, 0x0

    .line 58
    :cond_9
    return-object v0

    .line 51
    :cond_a
    if-nez p2, :cond_14

    .line 52
    new-instance v1, Lorg/msgpack/MessageTypeException;

    const-string v2, "convert into unknown type is invalid"

    invoke-direct {v1, v2}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 54
    :cond_14
    invoke-interface {p1, p2}, Lorg/msgpack/unpacker/Unpacker;->read(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 55
    .local v0, "o":Ljava/lang/Object;, "TT;"
    if-eqz p3, :cond_9

    if-nez v0, :cond_9

    .line 56
    new-instance v1, Lorg/msgpack/MessageTypeException;

    const-string v2, "Unexpected nil value"

    invoke-direct {v1, v2}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;Z)V
    .registers 6
    .param p1, "pk"    # Lorg/msgpack/packer/Packer;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/msgpack/packer/Packer;",
            "TT;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    .local p0, "this":Lorg/msgpack/template/AnyTemplate;, "Lorg/msgpack/template/AnyTemplate<TT;>;"
    .local p2, "target":Ljava/lang/Object;, "TT;"
    if-nez p2, :cond_10

    .line 37
    if-eqz p3, :cond_c

    .line 38
    new-instance v0, Lorg/msgpack/MessageTypeException;

    const-string v1, "Attempted to write null"

    invoke-direct {v0, v1}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 40
    :cond_c
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeNil()Lorg/msgpack/packer/Packer;

    .line 44
    :goto_f
    return-void

    .line 42
    :cond_10
    iget-object v0, p0, Lorg/msgpack/template/AnyTemplate;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/msgpack/template/TemplateRegistry;->lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lorg/msgpack/template/Template;->write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;)V

    goto :goto_f
.end method
