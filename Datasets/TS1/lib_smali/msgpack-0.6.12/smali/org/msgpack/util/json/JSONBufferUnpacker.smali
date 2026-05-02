.class public Lorg/msgpack/util/json/JSONBufferUnpacker;
.super Lorg/msgpack/util/json/JSONUnpacker;
.source "JSONBufferUnpacker.java"

# interfaces
.implements Lorg/msgpack/unpacker/BufferUnpacker;


# static fields
.field private static final DEFAULT_BUFFER_SIZE:I = 0x200


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 31
    const/16 v0, 0x200

    invoke-direct {p0, v0}, Lorg/msgpack/util/json/JSONBufferUnpacker;-><init>(I)V

    .line 32
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "bufferSize"    # I

    .prologue
    .line 35
    new-instance v0, Lorg/msgpack/MessagePack;

    invoke-direct {v0}, Lorg/msgpack/MessagePack;-><init>()V

    invoke-direct {p0, v0, p1}, Lorg/msgpack/util/json/JSONBufferUnpacker;-><init>(Lorg/msgpack/MessagePack;I)V

    .line 36
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/MessagePack;)V
    .registers 3
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;

    .prologue
    .line 39
    const/16 v0, 0x200

    invoke-direct {p0, p1, v0}, Lorg/msgpack/util/json/JSONBufferUnpacker;-><init>(Lorg/msgpack/MessagePack;I)V

    .line 40
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/MessagePack;I)V
    .registers 4
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;
    .param p2, "bufferSize"    # I

    .prologue
    .line 43
    invoke-static {}, Lorg/msgpack/util/json/JSONBufferUnpacker;->newEmptyReader()Ljava/io/Reader;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/msgpack/util/json/JSONUnpacker;-><init>(Lorg/msgpack/MessagePack;Ljava/io/Reader;)V

    .line 44
    return-void
.end method

.method private static newEmptyReader()Ljava/io/Reader;
    .registers 3

    .prologue
    .line 119
    new-instance v0, Ljava/io/InputStreamReader;

    new-instance v1, Ljava/io/ByteArrayInputStream;

    const/4 v2, 0x0

    new-array v2, v2, [B

    invoke-direct {v1, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    return-object v0
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 114
    invoke-virtual {p0}, Lorg/msgpack/util/json/JSONBufferUnpacker;->reset()V

    .line 115
    invoke-static {}, Lorg/msgpack/util/json/JSONBufferUnpacker;->newEmptyReader()Ljava/io/Reader;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/util/json/JSONBufferUnpacker;->in:Ljava/io/Reader;

    .line 116
    return-void
.end method

.method public copyReferencedBuffer()V
    .registers 3

    .prologue
    .line 108
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "JSONBufferUnpacker doesn\'t support copyReferencedBuffer()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic feed(Ljava/nio/ByteBuffer;)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 3
    .param p1, "x0"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 27
    invoke-virtual {p0, p1}, Lorg/msgpack/util/json/JSONBufferUnpacker;->feed(Ljava/nio/ByteBuffer;)Lorg/msgpack/util/json/JSONBufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic feed(Ljava/nio/ByteBuffer;Z)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 4
    .param p1, "x0"    # Ljava/nio/ByteBuffer;
    .param p2, "x1"    # Z

    .prologue
    .line 27
    invoke-virtual {p0, p1, p2}, Lorg/msgpack/util/json/JSONBufferUnpacker;->feed(Ljava/nio/ByteBuffer;Z)Lorg/msgpack/util/json/JSONBufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic feed([B)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 3
    .param p1, "x0"    # [B

    .prologue
    .line 27
    invoke-virtual {p0, p1}, Lorg/msgpack/util/json/JSONBufferUnpacker;->feed([B)Lorg/msgpack/util/json/JSONBufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic feed([BII)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 5
    .param p1, "x0"    # [B
    .param p2, "x1"    # I
    .param p3, "x2"    # I

    .prologue
    .line 27
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/util/json/JSONBufferUnpacker;->feed([BII)Lorg/msgpack/util/json/JSONBufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic feed([BIIZ)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 6
    .param p1, "x0"    # [B
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # Z

    .prologue
    .line 27
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/msgpack/util/json/JSONBufferUnpacker;->feed([BIIZ)Lorg/msgpack/util/json/JSONBufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic feed([BZ)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 4
    .param p1, "x0"    # [B
    .param p2, "x1"    # Z

    .prologue
    .line 27
    invoke-virtual {p0, p1, p2}, Lorg/msgpack/util/json/JSONBufferUnpacker;->feed([BZ)Lorg/msgpack/util/json/JSONBufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public feed(Ljava/nio/ByteBuffer;)Lorg/msgpack/util/json/JSONBufferUnpacker;
    .registers 4
    .param p1, "buf"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 90
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "JSONBufferUnpacker doesn\'t support feed()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public feed(Ljava/nio/ByteBuffer;Z)Lorg/msgpack/util/json/JSONBufferUnpacker;
    .registers 5
    .param p1, "buf"    # Ljava/nio/ByteBuffer;
    .param p2, "reference"    # Z

    .prologue
    .line 96
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "JSONBufferUnpacker doesn\'t support feed()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public feed([B)Lorg/msgpack/util/json/JSONBufferUnpacker;
    .registers 4
    .param p1, "b"    # [B

    .prologue
    .line 66
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "JSONBufferUnpacker doesn\'t support feed()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public feed([BII)Lorg/msgpack/util/json/JSONBufferUnpacker;
    .registers 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 78
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "JSONBufferUnpacker doesn\'t support feed()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public feed([BIIZ)Lorg/msgpack/util/json/JSONBufferUnpacker;
    .registers 7
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .param p4, "reference"    # Z

    .prologue
    .line 84
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "JSONBufferUnpacker doesn\'t support feed()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public feed([BZ)Lorg/msgpack/util/json/JSONBufferUnpacker;
    .registers 5
    .param p1, "b"    # [B
    .param p2, "reference"    # Z

    .prologue
    .line 72
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "JSONBufferUnpacker doesn\'t support feed()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getBufferSize()I
    .registers 3

    .prologue
    .line 102
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "JSONBufferUnpacker doesn\'t support getBufferSize()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic wrap(Ljava/nio/ByteBuffer;)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 3
    .param p1, "x0"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 27
    invoke-virtual {p0, p1}, Lorg/msgpack/util/json/JSONBufferUnpacker;->wrap(Ljava/nio/ByteBuffer;)Lorg/msgpack/util/json/JSONBufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic wrap([B)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 3
    .param p1, "x0"    # [B

    .prologue
    .line 27
    invoke-virtual {p0, p1}, Lorg/msgpack/util/json/JSONBufferUnpacker;->wrap([B)Lorg/msgpack/util/json/JSONBufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic wrap([BII)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 5
    .param p1, "x0"    # [B
    .param p2, "x1"    # I
    .param p3, "x2"    # I

    .prologue
    .line 27
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/util/json/JSONBufferUnpacker;->wrap([BII)Lorg/msgpack/util/json/JSONBufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public wrap(Ljava/nio/ByteBuffer;)Lorg/msgpack/util/json/JSONBufferUnpacker;
    .registers 4
    .param p1, "buf"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 60
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "JSONBufferUnpacker doesn\'t support wrap(ByteBuffer buf)"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public wrap([B)Lorg/msgpack/util/json/JSONBufferUnpacker;
    .registers 4
    .param p1, "b"    # [B

    .prologue
    .line 48
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/msgpack/util/json/JSONBufferUnpacker;->wrap([BII)Lorg/msgpack/util/json/JSONBufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public wrap([BII)Lorg/msgpack/util/json/JSONBufferUnpacker;
    .registers 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 53
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1, p2, p3}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    .line 54
    .local v0, "in":Ljava/io/ByteArrayInputStream;
    new-instance v1, Ljava/io/InputStreamReader;

    invoke-direct {v1, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    iput-object v1, p0, Lorg/msgpack/util/json/JSONBufferUnpacker;->in:Ljava/io/Reader;

    .line 55
    return-object p0
.end method
