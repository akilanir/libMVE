.class public abstract Lorg/msgpack/template/AbstractTemplate;
.super Ljava/lang/Object;
.source "AbstractTemplate.java"

# interfaces
.implements Lorg/msgpack/template/Template;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/msgpack/template/Template",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    .local p0, "this":Lorg/msgpack/template/AbstractTemplate;, "Lorg/msgpack/template/AbstractTemplate<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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
    .line 31
    .local p0, "this":Lorg/msgpack/template/AbstractTemplate;, "Lorg/msgpack/template/AbstractTemplate<TT;>;"
    .local p2, "to":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/msgpack/template/AbstractTemplate;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;Z)Ljava/lang/Object;

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
    .line 27
    .local p0, "this":Lorg/msgpack/template/AbstractTemplate;, "Lorg/msgpack/template/AbstractTemplate<TT;>;"
    .local p2, "v":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/msgpack/template/AbstractTemplate;->write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;Z)V

    .line 28
    return-void
.end method
