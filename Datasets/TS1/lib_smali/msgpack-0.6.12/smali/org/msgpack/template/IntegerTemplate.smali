.class public Lorg/msgpack/template/IntegerTemplate;
.super Lorg/msgpack/template/AbstractTemplate;
.source "IntegerTemplate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/msgpack/template/AbstractTemplate",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# static fields
.field static final instance:Lorg/msgpack/template/IntegerTemplate;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 53
    new-instance v0, Lorg/msgpack/template/IntegerTemplate;

    invoke-direct {v0}, Lorg/msgpack/template/IntegerTemplate;-><init>()V

    sput-object v0, Lorg/msgpack/template/IntegerTemplate;->instance:Lorg/msgpack/template/IntegerTemplate;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/msgpack/template/AbstractTemplate;-><init>()V

    .line 27
    return-void
.end method

.method public static getInstance()Lorg/msgpack/template/IntegerTemplate;
    .registers 1

    .prologue
    .line 50
    sget-object v0, Lorg/msgpack/template/IntegerTemplate;->instance:Lorg/msgpack/template/IntegerTemplate;

    return-object v0
.end method


# virtual methods
.method public read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Integer;Z)Ljava/lang/Integer;
    .registers 5
    .param p1, "u"    # Lorg/msgpack/unpacker/Unpacker;
    .param p2, "to"    # Ljava/lang/Integer;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    if-nez p3, :cond_a

    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->trySkipNil()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 44
    const/4 v0, 0x0

    .line 46
    :goto_9
    return-object v0

    :cond_a
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_9
.end method

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
    .line 25
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/IntegerTemplate;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Integer;Z)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public write(Lorg/msgpack/packer/Packer;Ljava/lang/Integer;Z)V
    .registers 6
    .param p1, "pk"    # Lorg/msgpack/packer/Packer;
    .param p2, "target"    # Ljava/lang/Integer;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 31
    if-nez p2, :cond_10

    .line 32
    if-eqz p3, :cond_c

    .line 33
    new-instance v0, Lorg/msgpack/MessageTypeException;

    const-string v1, "Attempted to write null"

    invoke-direct {v0, v1}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 35
    :cond_c
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeNil()Lorg/msgpack/packer/Packer;

    .line 39
    :goto_f
    return-void

    .line 38
    :cond_10
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Lorg/msgpack/packer/Packer;->write(I)Lorg/msgpack/packer/Packer;

    goto :goto_f
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
    .line 25
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/IntegerTemplate;->write(Lorg/msgpack/packer/Packer;Ljava/lang/Integer;Z)V

    return-void
.end method
