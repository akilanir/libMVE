.class public Lorg/msgpack/MessagePack;
.super Ljava/lang/Object;
.source "MessagePack.java"


# static fields
.field private static final globalMessagePack:Lorg/msgpack/MessagePack;


# instance fields
.field private registry:Lorg/msgpack/template/TemplateRegistry;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 657
    new-instance v0, Lorg/msgpack/MessagePack;

    invoke-direct {v0}, Lorg/msgpack/MessagePack;-><init>()V

    sput-object v0, Lorg/msgpack/MessagePack;->globalMessagePack:Lorg/msgpack/MessagePack;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Lorg/msgpack/template/TemplateRegistry;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/msgpack/template/TemplateRegistry;-><init>(Lorg/msgpack/template/TemplateRegistry;)V

    iput-object v0, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    .line 61
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/MessagePack;)V
    .registers 4
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    new-instance v0, Lorg/msgpack/template/TemplateRegistry;

    iget-object v1, p1, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-direct {v0, v1}, Lorg/msgpack/template/TemplateRegistry;-><init>(Lorg/msgpack/template/TemplateRegistry;)V

    iput-object v0, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    .line 70
    return-void
.end method

.method protected constructor <init>(Lorg/msgpack/template/TemplateRegistry;)V
    .registers 2
    .param p1, "registry"    # Lorg/msgpack/template/TemplateRegistry;

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput-object p1, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    .line 74
    return-void
.end method

.method public static pack(Ljava/io/OutputStream;Ljava/lang/Object;)V
    .registers 3
    .param p0, "out"    # Ljava/io/OutputStream;
    .param p1, "v"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 682
    sget-object v0, Lorg/msgpack/MessagePack;->globalMessagePack:Lorg/msgpack/MessagePack;

    invoke-virtual {v0, p0, p1}, Lorg/msgpack/MessagePack;->write(Ljava/io/OutputStream;Ljava/lang/Object;)V

    .line 683
    return-void
.end method

.method public static pack(Ljava/io/OutputStream;Ljava/lang/Object;Lorg/msgpack/template/Template;)V
    .registers 4
    .param p0, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/OutputStream;",
            "TT;",
            "Lorg/msgpack/template/Template",
            "<TT;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 712
    .local p1, "v":Ljava/lang/Object;, "TT;"
    .local p2, "template":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    sget-object v0, Lorg/msgpack/MessagePack;->globalMessagePack:Lorg/msgpack/MessagePack;

    invoke-virtual {v0, p0, p1, p2}, Lorg/msgpack/MessagePack;->write(Ljava/io/OutputStream;Ljava/lang/Object;Lorg/msgpack/template/Template;)V

    .line 713
    return-void
.end method

.method public static pack(Ljava/lang/Object;)[B
    .registers 2
    .param p0, "v"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 669
    sget-object v0, Lorg/msgpack/MessagePack;->globalMessagePack:Lorg/msgpack/MessagePack;

    invoke-virtual {v0, p0}, Lorg/msgpack/MessagePack;->write(Ljava/lang/Object;)[B

    move-result-object v0

    return-object v0
.end method

.method public static pack(Ljava/lang/Object;Lorg/msgpack/template/Template;)[B
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lorg/msgpack/template/Template",
            "<TT;>;)[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 696
    .local p0, "v":Ljava/lang/Object;, "TT;"
    .local p1, "template":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    sget-object v0, Lorg/msgpack/MessagePack;->globalMessagePack:Lorg/msgpack/MessagePack;

    invoke-virtual {v0, p0, p1}, Lorg/msgpack/MessagePack;->write(Ljava/lang/Object;Lorg/msgpack/template/Template;)[B

    move-result-object v0

    return-object v0
.end method

.method public static unpack(Ljava/io/InputStream;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 821
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    sget-object v0, Lorg/msgpack/MessagePack;->globalMessagePack:Lorg/msgpack/MessagePack;

    invoke-virtual {v0, p0, p1}, Lorg/msgpack/MessagePack;->read(Ljava/io/InputStream;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static unpack(Ljava/io/InputStream;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "TT;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 835
    .local p1, "to":Ljava/lang/Object;, "TT;"
    sget-object v0, Lorg/msgpack/MessagePack;->globalMessagePack:Lorg/msgpack/MessagePack;

    invoke-virtual {v0, p0, p1}, Lorg/msgpack/MessagePack;->read(Ljava/io/InputStream;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static unpack(Ljava/io/InputStream;Lorg/msgpack/template/Template;)Ljava/lang/Object;
    .registers 4
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "Lorg/msgpack/template/Template",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/msgpack/MessageTypeException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 791
    .local p1, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    new-instance v0, Lorg/msgpack/unpacker/MessagePackUnpacker;

    sget-object v1, Lorg/msgpack/MessagePack;->globalMessagePack:Lorg/msgpack/MessagePack;

    invoke-direct {v0, v1, p0}, Lorg/msgpack/unpacker/MessagePackUnpacker;-><init>(Lorg/msgpack/MessagePack;Ljava/io/InputStream;)V

    const/4 v1, 0x0

    invoke-interface {p1, v0, v1}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static unpack(Ljava/io/InputStream;Lorg/msgpack/template/Template;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "Lorg/msgpack/template/Template",
            "<TT;>;TT;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/msgpack/MessageTypeException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 806
    .local p1, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .local p2, "to":Ljava/lang/Object;, "TT;"
    new-instance v0, Lorg/msgpack/unpacker/MessagePackUnpacker;

    sget-object v1, Lorg/msgpack/MessagePack;->globalMessagePack:Lorg/msgpack/MessagePack;

    invoke-direct {v0, v1, p0}, Lorg/msgpack/unpacker/MessagePackUnpacker;-><init>(Lorg/msgpack/MessagePack;Ljava/io/InputStream;)V

    invoke-interface {p1, v0, p2}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static unpack([BLjava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .param p0, "bytes"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([B",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 751
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    sget-object v0, Lorg/msgpack/MessagePack;->globalMessagePack:Lorg/msgpack/MessagePack;

    invoke-virtual {v0, p0, p1}, Lorg/msgpack/MessagePack;->read([BLjava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static unpack([BLjava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p0, "bytes"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([BTT;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 764
    .local p1, "to":Ljava/lang/Object;, "TT;"
    sget-object v0, Lorg/msgpack/MessagePack;->globalMessagePack:Lorg/msgpack/MessagePack;

    invoke-virtual {v0, p0, p1}, Lorg/msgpack/MessagePack;->read([BLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static unpack([BLorg/msgpack/template/Template;)Ljava/lang/Object;
    .registers 5
    .param p0, "bytes"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([B",
            "Lorg/msgpack/template/Template",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 730
    .local p1, "template":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    new-instance v1, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;

    sget-object v2, Lorg/msgpack/MessagePack;->globalMessagePack:Lorg/msgpack/MessagePack;

    invoke-direct {v1, v2}, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;-><init>(Lorg/msgpack/MessagePack;)V

    invoke-virtual {v1, p0}, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->wrap([B)Lorg/msgpack/unpacker/MessagePackBufferUnpacker;

    move-result-object v0

    .line 731
    .local v0, "u":Lorg/msgpack/unpacker/BufferUnpacker;
    const/4 v1, 0x0

    invoke-interface {p1, v0, v1}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static unpack([BLorg/msgpack/template/Template;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p0, "bytes"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([B",
            "Lorg/msgpack/template/Template",
            "<TT;>;TT;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 736
    .local p1, "template":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .local p2, "to":Ljava/lang/Object;, "TT;"
    new-instance v1, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;

    sget-object v2, Lorg/msgpack/MessagePack;->globalMessagePack:Lorg/msgpack/MessagePack;

    invoke-direct {v1, v2}, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;-><init>(Lorg/msgpack/MessagePack;)V

    invoke-virtual {v1, p0}, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->wrap([B)Lorg/msgpack/unpacker/MessagePackBufferUnpacker;

    move-result-object v0

    .line 737
    .local v0, "u":Lorg/msgpack/unpacker/BufferUnpacker;
    invoke-interface {p1, v0, p2}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static unpack(Ljava/io/InputStream;)Lorg/msgpack/type/Value;
    .registers 2
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 777
    sget-object v0, Lorg/msgpack/MessagePack;->globalMessagePack:Lorg/msgpack/MessagePack;

    invoke-virtual {v0, p0}, Lorg/msgpack/MessagePack;->read(Ljava/io/InputStream;)Lorg/msgpack/type/Value;

    move-result-object v0

    return-object v0
.end method

.method public static unpack([B)Lorg/msgpack/type/Value;
    .registers 2
    .param p0, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 725
    sget-object v0, Lorg/msgpack/MessagePack;->globalMessagePack:Lorg/msgpack/MessagePack;

    invoke-virtual {v0, p0}, Lorg/msgpack/MessagePack;->read([B)Lorg/msgpack/type/Value;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public convert(Lorg/msgpack/type/Value;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 6
    .param p1, "v"    # Lorg/msgpack/type/Value;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/msgpack/type/Value;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 556
    .local p2, "c":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v1, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {v1, p2}, Lorg/msgpack/template/TemplateRegistry;->lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v0

    .line 557
    .local v0, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    new-instance v1, Lorg/msgpack/unpacker/Converter;

    invoke-direct {v1, p0, p1}, Lorg/msgpack/unpacker/Converter;-><init>(Lorg/msgpack/MessagePack;Lorg/msgpack/type/Value;)V

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public convert(Lorg/msgpack/type/Value;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "v"    # Lorg/msgpack/type/Value;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/msgpack/type/Value;",
            "TT;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 541
    .local p2, "to":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/msgpack/template/TemplateRegistry;->lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v0

    .line 542
    .local v0, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    new-instance v1, Lorg/msgpack/unpacker/Converter;

    invoke-direct {v1, p0, p1}, Lorg/msgpack/unpacker/Converter;-><init>(Lorg/msgpack/MessagePack;Lorg/msgpack/type/Value;)V

    invoke-interface {v0, v1, p2}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public convert(Lorg/msgpack/type/Value;Lorg/msgpack/template/Template;)Ljava/lang/Object;
    .registers 5
    .param p1, "v"    # Lorg/msgpack/type/Value;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/msgpack/type/Value;",
            "Lorg/msgpack/template/Template",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 570
    .local p2, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    new-instance v0, Lorg/msgpack/unpacker/Converter;

    invoke-direct {v0, p0, p1}, Lorg/msgpack/unpacker/Converter;-><init>(Lorg/msgpack/MessagePack;Lorg/msgpack/type/Value;)V

    const/4 v1, 0x0

    invoke-interface {p2, v0, v1}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public createBufferPacker()Lorg/msgpack/packer/BufferPacker;
    .registers 2

    .prologue
    .line 105
    new-instance v0, Lorg/msgpack/packer/MessagePackBufferPacker;

    invoke-direct {v0, p0}, Lorg/msgpack/packer/MessagePackBufferPacker;-><init>(Lorg/msgpack/MessagePack;)V

    return-object v0
.end method

.method public createBufferPacker(I)Lorg/msgpack/packer/BufferPacker;
    .registers 3
    .param p1, "bufferSize"    # I

    .prologue
    .line 117
    new-instance v0, Lorg/msgpack/packer/MessagePackBufferPacker;

    invoke-direct {v0, p0, p1}, Lorg/msgpack/packer/MessagePackBufferPacker;-><init>(Lorg/msgpack/MessagePack;I)V

    return-object v0
.end method

.method public createBufferUnpacker()Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 2

    .prologue
    .line 140
    new-instance v0, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;

    invoke-direct {v0, p0}, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;-><init>(Lorg/msgpack/MessagePack;)V

    return-object v0
.end method

.method public createBufferUnpacker(Ljava/nio/ByteBuffer;)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 3
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 177
    invoke-virtual {p0}, Lorg/msgpack/MessagePack;->createBufferUnpacker()Lorg/msgpack/unpacker/BufferUnpacker;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/msgpack/unpacker/BufferUnpacker;->wrap(Ljava/nio/ByteBuffer;)Lorg/msgpack/unpacker/BufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public createBufferUnpacker([B)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 3
    .param p1, "bytes"    # [B

    .prologue
    .line 152
    invoke-virtual {p0}, Lorg/msgpack/MessagePack;->createBufferUnpacker()Lorg/msgpack/unpacker/BufferUnpacker;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/msgpack/unpacker/BufferUnpacker;->wrap([B)Lorg/msgpack/unpacker/BufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public createBufferUnpacker([BII)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 5
    .param p1, "bytes"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 165
    invoke-virtual {p0}, Lorg/msgpack/MessagePack;->createBufferUnpacker()Lorg/msgpack/unpacker/BufferUnpacker;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lorg/msgpack/unpacker/BufferUnpacker;->wrap([BII)Lorg/msgpack/unpacker/BufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public createPacker(Ljava/io/OutputStream;)Lorg/msgpack/packer/Packer;
    .registers 3
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 95
    new-instance v0, Lorg/msgpack/packer/MessagePackPacker;

    invoke-direct {v0, p0, p1}, Lorg/msgpack/packer/MessagePackPacker;-><init>(Lorg/msgpack/MessagePack;Ljava/io/OutputStream;)V

    return-object v0
.end method

.method public createUnpacker(Ljava/io/InputStream;)Lorg/msgpack/unpacker/Unpacker;
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 130
    new-instance v0, Lorg/msgpack/unpacker/MessagePackUnpacker;

    invoke-direct {v0, p0, p1}, Lorg/msgpack/unpacker/MessagePackUnpacker;-><init>(Lorg/msgpack/MessagePack;Ljava/io/InputStream;)V

    return-object v0
.end method

.method public lookup(Ljava/lang/Class;)Lorg/msgpack/template/Template;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lorg/msgpack/template/Template",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 650
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {v0, p1}, Lorg/msgpack/template/TemplateRegistry;->lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v0

    return-object v0
.end method

.method public lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;
    .registers 3
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lorg/msgpack/template/Template",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 654
    iget-object v0, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {v0, p1}, Lorg/msgpack/template/TemplateRegistry;->lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v0

    return-object v0
.end method

.method public read(Ljava/io/InputStream;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 5
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 510
    .local p2, "c":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v1, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {v1, p2}, Lorg/msgpack/template/TemplateRegistry;->lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v0

    .line 511
    .local v0, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lorg/msgpack/MessagePack;->read(Ljava/io/InputStream;Ljava/lang/Object;Lorg/msgpack/template/Template;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public read(Ljava/io/InputStream;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "TT;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 481
    .local p2, "v":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/msgpack/template/TemplateRegistry;->lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v0

    .line 482
    .local v0, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    invoke-virtual {p0, p1, p2, v0}, Lorg/msgpack/MessagePack;->read(Ljava/io/InputStream;Ljava/lang/Object;Lorg/msgpack/template/Template;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public read(Ljava/io/InputStream;Ljava/lang/Object;Lorg/msgpack/template/Template;)Ljava/lang/Object;
    .registers 6
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "TT;",
            "Lorg/msgpack/template/Template",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 526
    .local p2, "v":Ljava/lang/Object;, "TT;"
    .local p3, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    invoke-virtual {p0, p1}, Lorg/msgpack/MessagePack;->createUnpacker(Ljava/io/InputStream;)Lorg/msgpack/unpacker/Unpacker;

    move-result-object v0

    .line 527
    .local v0, "u":Lorg/msgpack/unpacker/Unpacker;
    invoke-interface {p3, v0, p2}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public read(Ljava/io/InputStream;Lorg/msgpack/template/Template;)Ljava/lang/Object;
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "Lorg/msgpack/template/Template",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 496
    .local p2, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lorg/msgpack/MessagePack;->read(Ljava/io/InputStream;Ljava/lang/Object;Lorg/msgpack/template/Template;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public read(Ljava/nio/ByteBuffer;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 5
    .param p1, "b"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/nio/ByteBuffer;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 449
    .local p2, "c":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v1, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {v1, p2}, Lorg/msgpack/template/TemplateRegistry;->lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v0

    .line 450
    .local v0, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lorg/msgpack/MessagePack;->read(Ljava/nio/ByteBuffer;Ljava/lang/Object;Lorg/msgpack/template/Template;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public read(Ljava/nio/ByteBuffer;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "b"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/nio/ByteBuffer;",
            "TT;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 420
    .local p2, "v":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/msgpack/template/TemplateRegistry;->lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v0

    .line 421
    .local v0, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    invoke-virtual {p0, p1, p2, v0}, Lorg/msgpack/MessagePack;->read(Ljava/nio/ByteBuffer;Ljava/lang/Object;Lorg/msgpack/template/Template;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public read(Ljava/nio/ByteBuffer;Ljava/lang/Object;Lorg/msgpack/template/Template;)Ljava/lang/Object;
    .registers 6
    .param p1, "b"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/nio/ByteBuffer;",
            "TT;",
            "Lorg/msgpack/template/Template",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 465
    .local p2, "v":Ljava/lang/Object;, "TT;"
    .local p3, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    invoke-virtual {p0, p1}, Lorg/msgpack/MessagePack;->createBufferUnpacker(Ljava/nio/ByteBuffer;)Lorg/msgpack/unpacker/BufferUnpacker;

    move-result-object v0

    .line 466
    .local v0, "u":Lorg/msgpack/unpacker/BufferUnpacker;
    invoke-interface {p3, v0, p2}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public read(Ljava/nio/ByteBuffer;Lorg/msgpack/template/Template;)Ljava/lang/Object;
    .registers 4
    .param p1, "b"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/nio/ByteBuffer;",
            "Lorg/msgpack/template/Template",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 435
    .local p2, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lorg/msgpack/MessagePack;->read(Ljava/nio/ByteBuffer;Ljava/lang/Object;Lorg/msgpack/template/Template;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public read([BIILjava/lang/Class;)Ljava/lang/Object;
    .registers 8
    .param p1, "bytes"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([BII",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 403
    .local p4, "c":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v2, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {v2, p4}, Lorg/msgpack/template/TemplateRegistry;->lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v0

    .line 404
    .local v0, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/MessagePack;->createBufferUnpacker([BII)Lorg/msgpack/unpacker/BufferUnpacker;

    move-result-object v1

    .line 405
    .local v1, "u":Lorg/msgpack/unpacker/BufferUnpacker;
    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public read([BLjava/lang/Class;)Ljava/lang/Object;
    .registers 5
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([B",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 370
    .local p2, "c":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v1, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {v1, p2}, Lorg/msgpack/template/TemplateRegistry;->lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v0

    .line 371
    .local v0, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lorg/msgpack/MessagePack;->read([BLjava/lang/Object;Lorg/msgpack/template/Template;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public read([BLjava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([BTT;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 339
    .local p2, "v":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/msgpack/template/TemplateRegistry;->lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v0

    .line 340
    .local v0, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    invoke-virtual {p0, p1, p2, v0}, Lorg/msgpack/MessagePack;->read([BLjava/lang/Object;Lorg/msgpack/template/Template;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public read([BLjava/lang/Object;Lorg/msgpack/template/Template;)Ljava/lang/Object;
    .registers 6
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([BTT;",
            "Lorg/msgpack/template/Template",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 387
    .local p2, "v":Ljava/lang/Object;, "TT;"
    .local p3, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    invoke-virtual {p0, p1}, Lorg/msgpack/MessagePack;->createBufferUnpacker([B)Lorg/msgpack/unpacker/BufferUnpacker;

    move-result-object v0

    .line 388
    .local v0, "u":Lorg/msgpack/unpacker/BufferUnpacker;
    invoke-interface {p3, v0, p2}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public read([BLorg/msgpack/template/Template;)Ljava/lang/Object;
    .registers 4
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([B",
            "Lorg/msgpack/template/Template",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 355
    .local p2, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lorg/msgpack/MessagePack;->read([BLjava/lang/Object;Lorg/msgpack/template/Template;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public read(Ljava/io/InputStream;)Lorg/msgpack/type/Value;
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 324
    invoke-virtual {p0, p1}, Lorg/msgpack/MessagePack;->createUnpacker(Ljava/io/InputStream;)Lorg/msgpack/unpacker/Unpacker;

    move-result-object v0

    invoke-interface {v0}, Lorg/msgpack/unpacker/Unpacker;->readValue()Lorg/msgpack/type/Value;

    move-result-object v0

    return-object v0
.end method

.method public read(Ljava/nio/ByteBuffer;)Lorg/msgpack/type/Value;
    .registers 3
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 311
    invoke-virtual {p0, p1}, Lorg/msgpack/MessagePack;->createBufferUnpacker(Ljava/nio/ByteBuffer;)Lorg/msgpack/unpacker/BufferUnpacker;

    move-result-object v0

    invoke-interface {v0}, Lorg/msgpack/unpacker/BufferUnpacker;->readValue()Lorg/msgpack/type/Value;

    move-result-object v0

    return-object v0
.end method

.method public read([B)Lorg/msgpack/type/Value;
    .registers 4
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 283
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/msgpack/MessagePack;->read([BII)Lorg/msgpack/type/Value;

    move-result-object v0

    return-object v0
.end method

.method public read([BII)Lorg/msgpack/type/Value;
    .registers 5
    .param p1, "bytes"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 297
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/MessagePack;->createBufferUnpacker([BII)Lorg/msgpack/unpacker/BufferUnpacker;

    move-result-object v0

    invoke-interface {v0}, Lorg/msgpack/unpacker/BufferUnpacker;->readValue()Lorg/msgpack/type/Value;

    move-result-object v0

    return-object v0
.end method

.method public register(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 602
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {v0, p1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/Class;)V

    .line 603
    return-void
.end method

.method public register(Ljava/lang/Class;Lorg/msgpack/template/Template;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lorg/msgpack/template/Template",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 615
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "template":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    iget-object v0, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {v0, p1, p2}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 616
    return-void
.end method

.method public setClassLoader(Ljava/lang/ClassLoader;)V
    .registers 3
    .param p1, "cl"    # Ljava/lang/ClassLoader;

    .prologue
    .line 82
    iget-object v0, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {v0, p1}, Lorg/msgpack/template/TemplateRegistry;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 83
    return-void
.end method

.method public unconvert(Ljava/lang/Object;)Lorg/msgpack/type/Value;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lorg/msgpack/type/Value;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 582
    .local p1, "v":Ljava/lang/Object;, "TT;"
    new-instance v0, Lorg/msgpack/packer/Unconverter;

    invoke-direct {v0, p0}, Lorg/msgpack/packer/Unconverter;-><init>(Lorg/msgpack/MessagePack;)V

    .line 583
    .local v0, "pk":Lorg/msgpack/packer/Unconverter;
    if-nez p1, :cond_f

    .line 584
    invoke-virtual {v0}, Lorg/msgpack/packer/Unconverter;->writeNil()Lorg/msgpack/packer/Packer;

    .line 590
    :goto_a
    invoke-virtual {v0}, Lorg/msgpack/packer/Unconverter;->getResult()Lorg/msgpack/type/Value;

    move-result-object v2

    return-object v2

    .line 587
    :cond_f
    iget-object v2, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/msgpack/template/TemplateRegistry;->lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v1

    .line 588
    .local v1, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    invoke-interface {v1, v0, p1}, Lorg/msgpack/template/Template;->write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;)V

    goto :goto_a
.end method

.method public unregister()V
    .registers 2

    .prologue
    .line 637
    iget-object v0, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {v0}, Lorg/msgpack/template/TemplateRegistry;->unregister()V

    .line 638
    return-void
.end method

.method public unregister(Ljava/lang/Class;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 627
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {v0, p1}, Lorg/msgpack/template/TemplateRegistry;->unregister(Ljava/lang/reflect/Type;)Z

    move-result v0

    return v0
.end method

.method public write(Ljava/io/OutputStream;Ljava/lang/Object;)V
    .registers 7
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/OutputStream;",
            "TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 228
    .local p2, "v":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p1}, Lorg/msgpack/MessagePack;->createPacker(Ljava/io/OutputStream;)Lorg/msgpack/packer/Packer;

    move-result-object v0

    .line 229
    .local v0, "pk":Lorg/msgpack/packer/Packer;
    if-nez p2, :cond_a

    .line 230
    invoke-interface {v0}, Lorg/msgpack/packer/Packer;->writeNil()Lorg/msgpack/packer/Packer;

    .line 236
    :goto_9
    return-void

    .line 233
    :cond_a
    iget-object v2, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/msgpack/template/TemplateRegistry;->lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v1

    .line 234
    .local v1, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    invoke-interface {v1, v0, p2}, Lorg/msgpack/template/Template;->write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;)V

    goto :goto_9
.end method

.method public write(Ljava/io/OutputStream;Ljava/lang/Object;Lorg/msgpack/template/Template;)V
    .registers 5
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/OutputStream;",
            "TT;",
            "Lorg/msgpack/template/Template",
            "<TT;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 252
    .local p2, "v":Ljava/lang/Object;, "TT;"
    .local p3, "template":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    invoke-virtual {p0, p1}, Lorg/msgpack/MessagePack;->createPacker(Ljava/io/OutputStream;)Lorg/msgpack/packer/Packer;

    move-result-object v0

    .line 253
    .local v0, "pk":Lorg/msgpack/packer/Packer;
    invoke-interface {p3, v0, p2}, Lorg/msgpack/template/Template;->write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;)V

    .line 254
    return-void
.end method

.method public write(Ljava/lang/Object;)[B
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    .local p1, "v":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0}, Lorg/msgpack/MessagePack;->createBufferPacker()Lorg/msgpack/packer/BufferPacker;

    move-result-object v0

    .line 191
    .local v0, "pk":Lorg/msgpack/packer/BufferPacker;
    if-nez p1, :cond_e

    .line 192
    invoke-interface {v0}, Lorg/msgpack/packer/BufferPacker;->writeNil()Lorg/msgpack/packer/Packer;

    .line 198
    :goto_9
    invoke-interface {v0}, Lorg/msgpack/packer/BufferPacker;->toByteArray()[B

    move-result-object v2

    return-object v2

    .line 195
    :cond_e
    iget-object v2, p0, Lorg/msgpack/MessagePack;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/msgpack/template/TemplateRegistry;->lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v1

    .line 196
    .local v1, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    invoke-interface {v1, v0, p1}, Lorg/msgpack/template/Template;->write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;)V

    goto :goto_9
.end method

.method public write(Ljava/lang/Object;Lorg/msgpack/template/Template;)[B
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lorg/msgpack/template/Template",
            "<TT;>;)[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 212
    .local p1, "v":Ljava/lang/Object;, "TT;"
    .local p2, "template":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    invoke-virtual {p0}, Lorg/msgpack/MessagePack;->createBufferPacker()Lorg/msgpack/packer/BufferPacker;

    move-result-object v0

    .line 213
    .local v0, "pk":Lorg/msgpack/packer/BufferPacker;
    invoke-interface {p2, v0, p1}, Lorg/msgpack/template/Template;->write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;)V

    .line 214
    invoke-interface {v0}, Lorg/msgpack/packer/BufferPacker;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method public write(Lorg/msgpack/type/Value;)[B
    .registers 4
    .param p1, "v"    # Lorg/msgpack/type/Value;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 267
    invoke-virtual {p0}, Lorg/msgpack/MessagePack;->createBufferPacker()Lorg/msgpack/packer/BufferPacker;

    move-result-object v0

    .line 268
    .local v0, "pk":Lorg/msgpack/packer/BufferPacker;
    invoke-interface {v0, p1}, Lorg/msgpack/packer/BufferPacker;->write(Lorg/msgpack/type/Value;)Lorg/msgpack/packer/Packer;

    .line 269
    invoke-interface {v0}, Lorg/msgpack/packer/BufferPacker;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method
