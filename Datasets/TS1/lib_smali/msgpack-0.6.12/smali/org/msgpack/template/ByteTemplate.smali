.class public Lorg/msgpack/template/ByteTemplate;
.super Lorg/msgpack/template/AbstractTemplate;
.source "ByteTemplate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/msgpack/template/AbstractTemplate",
        "<",
        "Ljava/lang/Byte;",
        ">;"
    }
.end annotation


# static fields
.field static final instance:Lorg/msgpack/template/ByteTemplate;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 52
    new-instance v0, Lorg/msgpack/template/ByteTemplate;

    invoke-direct {v0}, Lorg/msgpack/template/ByteTemplate;-><init>()V

    sput-object v0, Lorg/msgpack/template/ByteTemplate;->instance:Lorg/msgpack/template/ByteTemplate;

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

.method public static getInstance()Lorg/msgpack/template/ByteTemplate;
    .registers 1

    .prologue
    .line 49
    sget-object v0, Lorg/msgpack/template/ByteTemplate;->instance:Lorg/msgpack/template/ByteTemplate;

    return-object v0
.end method


# virtual methods
.method public read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Byte;Z)Ljava/lang/Byte;
    .registers 5
    .param p1, "u"    # Lorg/msgpack/unpacker/Unpacker;
    .param p2, "to"    # Ljava/lang/Byte;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    if-nez p3, :cond_a

    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->trySkipNil()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 43
    const/4 v0, 0x0

    .line 45
    :goto_9
    return-object v0

    :cond_a
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readByte()B

    move-result v0

    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

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
    check-cast p2, Ljava/lang/Byte;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/ByteTemplate;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Byte;Z)Ljava/lang/Byte;

    move-result-object v0

    return-object v0
.end method

.method public write(Lorg/msgpack/packer/Packer;Ljava/lang/Byte;Z)V
    .registers 6
    .param p1, "pk"    # Lorg/msgpack/packer/Packer;
    .param p2, "target"    # Ljava/lang/Byte;
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
    invoke-virtual {p2}, Ljava/lang/Byte;->byteValue()B

    move-result v0

    invoke-interface {p1, v0}, Lorg/msgpack/packer/Packer;->write(B)Lorg/msgpack/packer/Packer;

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
    check-cast p2, Ljava/lang/Byte;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/ByteTemplate;->write(Lorg/msgpack/packer/Packer;Ljava/lang/Byte;Z)V

    return-void
.end method
