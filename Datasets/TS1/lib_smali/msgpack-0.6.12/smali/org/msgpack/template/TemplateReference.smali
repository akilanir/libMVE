.class public Lorg/msgpack/template/TemplateReference;
.super Lorg/msgpack/template/AbstractTemplate;
.source "TemplateReference.java"


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
.field private actualTemplate:Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/msgpack/template/Template",
            "<TT;>;"
        }
    .end annotation
.end field

.field private registry:Lorg/msgpack/template/TemplateRegistry;

.field private targetType:Ljava/lang/reflect/Type;


# direct methods
.method public constructor <init>(Lorg/msgpack/template/TemplateRegistry;Ljava/lang/reflect/Type;)V
    .registers 3
    .param p1, "registry"    # Lorg/msgpack/template/TemplateRegistry;
    .param p2, "targetType"    # Ljava/lang/reflect/Type;

    .prologue
    .line 35
    .local p0, "this":Lorg/msgpack/template/TemplateReference;, "Lorg/msgpack/template/TemplateReference<TT;>;"
    invoke-direct {p0}, Lorg/msgpack/template/AbstractTemplate;-><init>()V

    .line 36
    iput-object p1, p0, Lorg/msgpack/template/TemplateReference;->registry:Lorg/msgpack/template/TemplateRegistry;

    .line 37
    iput-object p2, p0, Lorg/msgpack/template/TemplateReference;->targetType:Ljava/lang/reflect/Type;

    .line 38
    return-void
.end method

.method private validateActualTemplate()V
    .registers 3

    .prologue
    .line 42
    .local p0, "this":Lorg/msgpack/template/TemplateReference;, "Lorg/msgpack/template/TemplateReference<TT;>;"
    iget-object v0, p0, Lorg/msgpack/template/TemplateReference;->actualTemplate:Lorg/msgpack/template/Template;

    if-nez v0, :cond_1e

    .line 43
    iget-object v0, p0, Lorg/msgpack/template/TemplateReference;->registry:Lorg/msgpack/template/TemplateRegistry;

    iget-object v0, v0, Lorg/msgpack/template/TemplateRegistry;->cache:Ljava/util/Map;

    iget-object v1, p0, Lorg/msgpack/template/TemplateReference;->targetType:Ljava/lang/reflect/Type;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/msgpack/template/Template;

    iput-object v0, p0, Lorg/msgpack/template/TemplateReference;->actualTemplate:Lorg/msgpack/template/Template;

    .line 44
    iget-object v0, p0, Lorg/msgpack/template/TemplateReference;->actualTemplate:Lorg/msgpack/template/Template;

    if-nez v0, :cond_1e

    .line 45
    new-instance v0, Lorg/msgpack/MessageTypeException;

    const-string v1, "Actual template have not been created"

    invoke-direct {v0, v1}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 49
    :cond_1e
    return-void
.end method


# virtual methods
.method public read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "u"    # Lorg/msgpack/unpacker/Unpacker;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/msgpack/unpacker/Unpacker;",
            "TT;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    .local p0, "this":Lorg/msgpack/template/TemplateReference;, "Lorg/msgpack/template/TemplateReference<TT;>;"
    .local p2, "to":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Lorg/msgpack/template/TemplateReference;->validateActualTemplate()V

    .line 72
    iget-object v0, p0, Lorg/msgpack/template/TemplateReference;->actualTemplate:Lorg/msgpack/template/Template;

    const/4 v1, 0x0

    invoke-interface {v0, p1, p2, v1}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;Z)Ljava/lang/Object;
    .registers 5
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
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 65
    .local p0, "this":Lorg/msgpack/template/TemplateReference;, "Lorg/msgpack/template/TemplateReference<TT;>;"
    .local p2, "to":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Lorg/msgpack/template/TemplateReference;->validateActualTemplate()V

    .line 66
    iget-object v0, p0, Lorg/msgpack/template/TemplateReference;->actualTemplate:Lorg/msgpack/template/Template;

    invoke-interface {v0, p1, p2, p3}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;)V
    .registers 5
    .param p1, "pk"    # Lorg/msgpack/packer/Packer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/msgpack/packer/Packer;",
            "TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "this":Lorg/msgpack/template/TemplateReference;, "Lorg/msgpack/template/TemplateReference<TT;>;"
    .local p2, "v":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Lorg/msgpack/template/TemplateReference;->validateActualTemplate()V

    .line 60
    iget-object v0, p0, Lorg/msgpack/template/TemplateReference;->actualTemplate:Lorg/msgpack/template/Template;

    const/4 v1, 0x0

    invoke-interface {v0, p1, p2, v1}, Lorg/msgpack/template/Template;->write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;Z)V

    .line 61
    return-void
.end method

.method public write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;Z)V
    .registers 5
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
    .line 53
    .local p0, "this":Lorg/msgpack/template/TemplateReference;, "Lorg/msgpack/template/TemplateReference<TT;>;"
    .local p2, "v":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Lorg/msgpack/template/TemplateReference;->validateActualTemplate()V

    .line 54
    iget-object v0, p0, Lorg/msgpack/template/TemplateReference;->actualTemplate:Lorg/msgpack/template/Template;

    invoke-interface {v0, p1, p2, p3}, Lorg/msgpack/template/Template;->write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;Z)V

    .line 55
    return-void
.end method
