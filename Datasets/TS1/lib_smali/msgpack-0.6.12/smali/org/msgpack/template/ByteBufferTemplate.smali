.class public Lorg/msgpack/template/ByteBufferTemplate;
.super Lorg/msgpack/template/AbstractTemplate;
.source "ByteBufferTemplate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/msgpack/template/AbstractTemplate",
        "<",
        "Ljava/nio/ByteBuffer;",
        ">;"
    }
.end annotation


# static fields
.field static final instance:Lorg/msgpack/template/ByteBufferTemplate;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 55
    new-instance v0, Lorg/msgpack/template/ByteBufferTemplate;

    invoke-direct {v0}, Lorg/msgpack/template/ByteBufferTemplate;-><init>()V

    sput-object v0, Lorg/msgpack/template/ByteBufferTemplate;->instance:Lorg/msgpack/template/ByteBufferTemplate;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/msgpack/template/AbstractTemplate;-><init>()V

    .line 29
    return-void
.end method

.method public static getInstance()Lorg/msgpack/template/ByteBufferTemplate;
    .registers 1

    .prologue
    .line 52
    sget-object v0, Lorg/msgpack/template/ByteBufferTemplate;->instance:Lorg/msgpack/template/ByteBufferTemplate;

    return-object v0
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
    check-cast p2, Ljava/nio/ByteBuffer;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/ByteBufferTemplate;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/nio/ByteBuffer;Z)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public read(Lorg/msgpack/unpacker/Unpacker;Ljava/nio/ByteBuffer;Z)Ljava/nio/ByteBuffer;
    .registers 5
    .param p1, "u"    # Lorg/msgpack/unpacker/Unpacker;
    .param p2, "to"    # Ljava/nio/ByteBuffer;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    if-nez p3, :cond_a

    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->trySkipNil()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 46
    const/4 v0, 0x0

    .line 48
    :goto_9
    return-object v0

    :cond_a
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

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
    check-cast p2, Ljava/nio/ByteBuffer;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/ByteBufferTemplate;->write(Lorg/msgpack/packer/Packer;Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public write(Lorg/msgpack/packer/Packer;Ljava/nio/ByteBuffer;Z)V
    .registers 6
    .param p1, "pk"    # Lorg/msgpack/packer/Packer;
    .param p2, "target"    # Ljava/nio/ByteBuffer;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 33
    if-nez p2, :cond_10

    .line 34
    if-eqz p3, :cond_c

    .line 35
    new-instance v0, Lorg/msgpack/MessageTypeException;

    const-string v1, "Attempted to write null"

    invoke-direct {v0, v1}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 37
    :cond_c
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeNil()Lorg/msgpack/packer/Packer;

    .line 41
    :goto_f
    return-void

    .line 40
    :cond_10
    invoke-interface {p1, p2}, Lorg/msgpack/packer/Packer;->write(Ljava/nio/ByteBuffer;)Lorg/msgpack/packer/Packer;

    goto :goto_f
.end method
