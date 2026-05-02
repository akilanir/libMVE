.class public Lorg/msgpack/template/MessagePackableTemplate;
.super Lorg/msgpack/template/AbstractTemplate;
.source "MessagePackableTemplate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/msgpack/template/AbstractTemplate",
        "<",
        "Lorg/msgpack/MessagePackable;",
        ">;"
    }
.end annotation


# instance fields
.field private targetClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Lorg/msgpack/template/AbstractTemplate;-><init>()V

    .line 30
    iput-object p1, p0, Lorg/msgpack/template/MessagePackableTemplate;->targetClass:Ljava/lang/Class;

    .line 31
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
    .line 26
    check-cast p2, Lorg/msgpack/MessagePackable;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/MessagePackableTemplate;->read(Lorg/msgpack/unpacker/Unpacker;Lorg/msgpack/MessagePackable;Z)Lorg/msgpack/MessagePackable;

    move-result-object v0

    return-object v0
.end method

.method public read(Lorg/msgpack/unpacker/Unpacker;Lorg/msgpack/MessagePackable;Z)Lorg/msgpack/MessagePackable;
    .registers 6
    .param p1, "u"    # Lorg/msgpack/unpacker/Unpacker;
    .param p2, "to"    # Lorg/msgpack/MessagePackable;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    if-nez p3, :cond_a

    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->trySkipNil()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 48
    const/4 v1, 0x0

    .line 60
    :goto_9
    return-object v1

    .line 50
    :cond_a
    if-nez p2, :cond_14

    .line 52
    :try_start_c
    iget-object v1, p0, Lorg/msgpack/template/MessagePackableTemplate;->targetClass:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object p2

    .end local p2    # "to":Lorg/msgpack/MessagePackable;
    check-cast p2, Lorg/msgpack/MessagePackable;
    :try_end_14
    .catch Ljava/lang/InstantiationException; {:try_start_c .. :try_end_14} :catch_19
    .catch Ljava/lang/IllegalAccessException; {:try_start_c .. :try_end_14} :catch_20

    .line 59
    .restart local p2    # "to":Lorg/msgpack/MessagePackable;
    :cond_14
    invoke-interface {p2, p1}, Lorg/msgpack/MessagePackable;->readFrom(Lorg/msgpack/unpacker/Unpacker;)V

    move-object v1, p2

    .line 60
    goto :goto_9

    .line 53
    .end local p2    # "to":Lorg/msgpack/MessagePackable;
    :catch_19
    move-exception v0

    .line 54
    .local v0, "e":Ljava/lang/InstantiationException;
    new-instance v1, Lorg/msgpack/MessageTypeException;

    invoke-direct {v1, v0}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 55
    .end local v0    # "e":Ljava/lang/InstantiationException;
    :catch_20
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Lorg/msgpack/MessageTypeException;

    invoke-direct {v1, v0}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
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
    .line 26
    check-cast p2, Lorg/msgpack/MessagePackable;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/MessagePackableTemplate;->write(Lorg/msgpack/packer/Packer;Lorg/msgpack/MessagePackable;Z)V

    return-void
.end method

.method public write(Lorg/msgpack/packer/Packer;Lorg/msgpack/MessagePackable;Z)V
    .registers 6
    .param p1, "pk"    # Lorg/msgpack/packer/Packer;
    .param p2, "target"    # Lorg/msgpack/MessagePackable;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 35
    if-nez p2, :cond_10

    .line 36
    if-eqz p3, :cond_c

    .line 37
    new-instance v0, Lorg/msgpack/MessageTypeException;

    const-string v1, "Attempted to write null"

    invoke-direct {v0, v1}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 39
    :cond_c
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeNil()Lorg/msgpack/packer/Packer;

    .line 43
    :goto_f
    return-void

    .line 42
    :cond_10
    invoke-interface {p2, p1}, Lorg/msgpack/MessagePackable;->writeTo(Lorg/msgpack/packer/Packer;)V

    goto :goto_f
.end method
