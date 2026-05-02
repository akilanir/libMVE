.class Lorg/msgpack/type/ByteArrayRawValueImpl;
.super Lorg/msgpack/type/AbstractRawValue;
.source "ByteArrayRawValueImpl.java"


# static fields
.field private static final decoderStore:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/nio/charset/CharsetDecoder;",
            ">;"
        }
    .end annotation
.end field

.field private static emptyInstance:Lorg/msgpack/type/ByteArrayRawValueImpl;


# instance fields
.field private bytes:[B


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 31
    new-instance v0, Lorg/msgpack/type/ByteArrayRawValueImpl;

    const/4 v1, 0x0

    new-array v1, v1, [B

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/msgpack/type/ByteArrayRawValueImpl;-><init>([BZ)V

    sput-object v0, Lorg/msgpack/type/ByteArrayRawValueImpl;->emptyInstance:Lorg/msgpack/type/ByteArrayRawValueImpl;

    .line 37
    new-instance v0, Lorg/msgpack/type/ByteArrayRawValueImpl$1;

    invoke-direct {v0}, Lorg/msgpack/type/ByteArrayRawValueImpl$1;-><init>()V

    sput-object v0, Lorg/msgpack/type/ByteArrayRawValueImpl;->decoderStore:Ljava/lang/ThreadLocal;

    return-void
.end method

.method constructor <init>([BII)V
    .registers 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 57
    invoke-direct {p0}, Lorg/msgpack/type/AbstractRawValue;-><init>()V

    .line 59
    new-array v0, p3, [B

    iput-object v0, p0, Lorg/msgpack/type/ByteArrayRawValueImpl;->bytes:[B

    .line 60
    iget-object v0, p0, Lorg/msgpack/type/ByteArrayRawValueImpl;->bytes:[B

    const/4 v1, 0x0

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 61
    return-void
.end method

.method constructor <init>([BZ)V
    .registers 6
    .param p1, "bytes"    # [B
    .param p2, "gift"    # Z

    .prologue
    const/4 v2, 0x0

    .line 48
    invoke-direct {p0}, Lorg/msgpack/type/AbstractRawValue;-><init>()V

    .line 49
    if-eqz p2, :cond_9

    .line 50
    iput-object p1, p0, Lorg/msgpack/type/ByteArrayRawValueImpl;->bytes:[B

    .line 55
    :goto_8
    return-void

    .line 52
    :cond_9
    array-length v0, p1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/msgpack/type/ByteArrayRawValueImpl;->bytes:[B

    .line 53
    iget-object v0, p0, Lorg/msgpack/type/ByteArrayRawValueImpl;->bytes:[B

    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_8
.end method

.method public static getEmptyInstance()Lorg/msgpack/type/RawValue;
    .registers 1

    .prologue
    .line 34
    sget-object v0, Lorg/msgpack/type/ByteArrayRawValueImpl;->emptyInstance:Lorg/msgpack/type/ByteArrayRawValueImpl;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 85
    if-ne p0, p1, :cond_5

    .line 86
    const/4 v1, 0x1

    .line 96
    :cond_4
    :goto_4
    return v1

    .line 88
    :cond_5
    instance-of v2, p1, Lorg/msgpack/type/Value;

    if-eqz v2, :cond_4

    move-object v0, p1

    .line 91
    check-cast v0, Lorg/msgpack/type/Value;

    .line 92
    .local v0, "v":Lorg/msgpack/type/Value;
    invoke-interface {v0}, Lorg/msgpack/type/Value;->isRawValue()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 96
    iget-object v1, p0, Lorg/msgpack/type/ByteArrayRawValueImpl;->bytes:[B

    invoke-interface {v0}, Lorg/msgpack/type/Value;->asRawValue()Lorg/msgpack/type/RawValue;

    move-result-object v2

    invoke-interface {v2}, Lorg/msgpack/type/RawValue;->getByteArray()[B

    move-result-object v2

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    goto :goto_4
.end method

.method public getByteArray()[B
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lorg/msgpack/type/ByteArrayRawValueImpl;->bytes:[B

    return-object v0
.end method

.method public getString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 70
    sget-object v2, Lorg/msgpack/type/ByteArrayRawValueImpl;->decoderStore:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/charset/CharsetDecoder;

    .line 72
    .local v0, "decoder":Ljava/nio/charset/CharsetDecoder;
    :try_start_8
    iget-object v2, p0, Lorg/msgpack/type/ByteArrayRawValueImpl;->bytes:[B

    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;
    :try_end_15
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_8 .. :try_end_15} :catch_17

    move-result-object v2

    return-object v2

    .line 73
    :catch_17
    move-exception v1

    .line 74
    .local v1, "ex":Ljava/nio/charset/CharacterCodingException;
    new-instance v2, Lorg/msgpack/MessageTypeException;

    invoke-direct {v2, v1}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lorg/msgpack/type/ByteArrayRawValueImpl;->bytes:[B

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    return v0
.end method

.method public writeTo(Lorg/msgpack/packer/Packer;)V
    .registers 3
    .param p1, "pk"    # Lorg/msgpack/packer/Packer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 80
    iget-object v0, p0, Lorg/msgpack/type/ByteArrayRawValueImpl;->bytes:[B

    invoke-interface {p1, v0}, Lorg/msgpack/packer/Packer;->write([B)Lorg/msgpack/packer/Packer;

    .line 81
    return-void
.end method
