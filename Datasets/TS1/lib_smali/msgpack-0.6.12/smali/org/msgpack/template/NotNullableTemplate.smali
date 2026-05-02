.class public Lorg/msgpack/template/NotNullableTemplate;
.super Lorg/msgpack/template/AbstractTemplate;
.source "NotNullableTemplate.java"


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
.field private tmpl:Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/msgpack/template/Template",
            "<TT;>;"
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
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 12
    .local p0, "this":Lorg/msgpack/template/NotNullableTemplate;, "Lorg/msgpack/template/NotNullableTemplate<TT;>;"
    .local p1, "elementTemplate":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    invoke-direct {p0}, Lorg/msgpack/template/AbstractTemplate;-><init>()V

    .line 13
    iput-object p1, p0, Lorg/msgpack/template/NotNullableTemplate;->tmpl:Lorg/msgpack/template/Template;

    .line 14
    return-void
.end method


# virtual methods
.method public read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
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
    .line 33
    .local p0, "this":Lorg/msgpack/template/NotNullableTemplate;, "Lorg/msgpack/template/NotNullableTemplate<TT;>;"
    .local p2, "to":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lorg/msgpack/template/NotNullableTemplate;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;Z)Ljava/lang/Object;

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
    .line 28
    .local p0, "this":Lorg/msgpack/template/NotNullableTemplate;, "Lorg/msgpack/template/NotNullableTemplate<TT;>;"
    .local p2, "to":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lorg/msgpack/template/NotNullableTemplate;->tmpl:Lorg/msgpack/template/Template;

    invoke-interface {v0, p1, p2, p3}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;)V
    .registers 4
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
    .line 23
    .local p0, "this":Lorg/msgpack/template/NotNullableTemplate;, "Lorg/msgpack/template/NotNullableTemplate<TT;>;"
    .local p2, "v":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lorg/msgpack/template/NotNullableTemplate;->write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;Z)V

    .line 24
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
    .line 18
    .local p0, "this":Lorg/msgpack/template/NotNullableTemplate;, "Lorg/msgpack/template/NotNullableTemplate<TT;>;"
    .local p2, "v":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lorg/msgpack/template/NotNullableTemplate;->tmpl:Lorg/msgpack/template/Template;

    invoke-interface {v0, p1, p2, p3}, Lorg/msgpack/template/Template;->write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;Z)V

    .line 19
    return-void
.end method
