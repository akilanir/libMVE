.class public Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;
.super Lorg/apache/commons/compress/compressors/CompressorOutputStream;
.source "Pack200CompressorOutputStream.java"


# instance fields
.field private finished:Z

.field private final originalOutput:Ljava/io/OutputStream;

.field private final properties:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 51
    sget-object v0, Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;->IN_MEMORY:Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;-><init>(Ljava/io/OutputStream;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;)V

    .line 52
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Ljava/util/Map;)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/OutputStream;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    .local p2, "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v0, Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;->IN_MEMORY:Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;-><init>(Ljava/io/OutputStream;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;Ljava/util/Map;)V

    .line 78
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "mode"    # Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;-><init>(Ljava/io/OutputStream;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;Ljava/util/Map;)V

    .line 65
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;Ljava/util/Map;)V
    .registers 5
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "mode"    # Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/OutputStream;",
            "Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    .local p3, "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/CompressorOutputStream;-><init>()V

    .line 38
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->finished:Z

    .line 92
    iput-object p1, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->originalOutput:Ljava/io/OutputStream;

    .line 93
    invoke-virtual {p2}, Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;->newStreamBridge()Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    .line 94
    iput-object p3, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->properties:Ljava/util/Map;

    .line 95
    return-void
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 114
    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->finish()V

    .line 116
    :try_start_3
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    invoke-virtual {v0}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->stop()V
    :try_end_8
    .catchall {:try_start_3 .. :try_end_8} :catchall_e

    .line 118
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->originalOutput:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 120
    return-void

    .line 118
    :catchall_e
    move-exception v0

    iget-object v1, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->originalOutput:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    throw v0
.end method

.method public finish()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 123
    iget-boolean v4, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->finished:Z

    if-nez v4, :cond_30

    .line 124
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->finished:Z

    .line 125
    invoke-static {}, Ljava/util/jar/Pack200;->newPacker()Ljava/util/jar/Pack200$Packer;

    move-result-object v2

    .line 126
    .local v2, "p":Ljava/util/jar/Pack200$Packer;
    iget-object v4, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->properties:Ljava/util/Map;

    if-eqz v4, :cond_18

    .line 127
    invoke-interface {v2}, Ljava/util/jar/Pack200$Packer;->properties()Ljava/util/SortedMap;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->properties:Ljava/util/Map;

    invoke-interface {v4, v5}, Ljava/util/SortedMap;->putAll(Ljava/util/Map;)V

    .line 129
    :cond_18
    const/4 v0, 0x0

    .line 130
    .local v0, "ji":Ljava/util/jar/JarInputStream;
    const/4 v3, 0x0

    .line 132
    .local v3, "success":Z
    :try_start_1a
    new-instance v1, Ljava/util/jar/JarInputStream;

    iget-object v4, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    invoke-virtual {v4}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->getInput()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/util/jar/JarInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_25
    .catchall {:try_start_1a .. :try_end_25} :catchall_31

    .end local v0    # "ji":Ljava/util/jar/JarInputStream;
    .local v1, "ji":Ljava/util/jar/JarInputStream;
    :try_start_25
    iget-object v4, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->originalOutput:Ljava/io/OutputStream;

    invoke-interface {v2, v1, v4}, Ljava/util/jar/Pack200$Packer;->pack(Ljava/util/jar/JarInputStream;Ljava/io/OutputStream;)V
    :try_end_2a
    .catchall {:try_start_25 .. :try_end_2a} :catchall_38

    .line 134
    const/4 v3, 0x1

    .line 136
    if-nez v3, :cond_30

    .line 137
    invoke-static {v1}, Lorg/apache/commons/compress/utils/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 141
    .end local v1    # "ji":Ljava/util/jar/JarInputStream;
    .end local v2    # "p":Ljava/util/jar/Pack200$Packer;
    .end local v3    # "success":Z
    :cond_30
    return-void

    .line 136
    .restart local v0    # "ji":Ljava/util/jar/JarInputStream;
    .restart local v2    # "p":Ljava/util/jar/Pack200$Packer;
    .restart local v3    # "success":Z
    :catchall_31
    move-exception v4

    :goto_32
    if-nez v3, :cond_37

    .line 137
    invoke-static {v0}, Lorg/apache/commons/compress/utils/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    :cond_37
    throw v4

    .line 136
    .end local v0    # "ji":Ljava/util/jar/JarInputStream;
    .restart local v1    # "ji":Ljava/util/jar/JarInputStream;
    :catchall_38
    move-exception v4

    move-object v0, v1

    .end local v1    # "ji":Ljava/util/jar/JarInputStream;
    .restart local v0    # "ji":Ljava/util/jar/JarInputStream;
    goto :goto_32
.end method

.method public write(I)V
    .registers 3
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 99
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    invoke-virtual {v0, p1}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->write(I)V

    .line 100
    return-void
.end method

.method public write([B)V
    .registers 3
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 104
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    invoke-virtual {v0, p1}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->write([B)V

    .line 105
    return-void
.end method

.method public write([BII)V
    .registers 5
    .param p1, "b"    # [B
    .param p2, "from"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 109
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->write([BII)V

    .line 110
    return-void
.end method
