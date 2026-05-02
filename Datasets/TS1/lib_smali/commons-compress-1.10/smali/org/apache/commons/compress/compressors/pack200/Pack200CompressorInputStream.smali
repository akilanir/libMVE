.class public Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;
.super Lorg/apache/commons/compress/compressors/CompressorInputStream;
.source "Pack200CompressorInputStream.java"


# static fields
.field private static final CAFE_DOOD:[B

.field private static final SIG_LENGTH:I


# instance fields
.field private final originalInput:Ljava/io/InputStream;

.field private final streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 245
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_e

    sput-object v0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->CAFE_DOOD:[B

    .line 248
    sget-object v0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->CAFE_DOOD:[B

    array-length v0, v0

    sput v0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->SIG_LENGTH:I

    return-void

    .line 245
    :array_e
    .array-data 1
        -0x36t
        -0x2t
        -0x30t
        0xdt
    .end array-data
.end method

.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    sget-object v0, Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;->IN_MEMORY:Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;-><init>(Ljava/io/File;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;)V

    .line 119
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/util/Map;)V
    .registers 4
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
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
    .line 143
    .local p2, "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v0, Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;->IN_MEMORY:Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;-><init>(Ljava/io/File;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;Ljava/util/Map;)V

    .line 144
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;)V
    .registers 4
    .param p1, "f"    # Ljava/io/File;
    .param p2, "mode"    # Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 130
    invoke-direct {p0, v0, p1, p2, v0}, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;-><init>(Ljava/io/InputStream;Ljava/io/File;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;Ljava/util/Map;)V

    .line 131
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;Ljava/util/Map;)V
    .registers 5
    .param p1, "f"    # Ljava/io/File;
    .param p2, "mode"    # Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
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
    .line 157
    .local p3, "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2, p3}, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;-><init>(Ljava/io/InputStream;Ljava/io/File;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;Ljava/util/Map;)V

    .line 158
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 58
    sget-object v0, Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;->IN_MEMORY:Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;-><init>(Ljava/io/InputStream;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;)V

    .line 59
    return-void
.end method

.method private constructor <init>(Ljava/io/InputStream;Ljava/io/File;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;Ljava/util/Map;)V
    .registers 8
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "f"    # Ljava/io/File;
    .param p3, "mode"    # Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Ljava/io/File;",
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
    .line 163
    .local p4, "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/CompressorInputStream;-><init>()V

    .line 164
    iput-object p1, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->originalInput:Ljava/io/InputStream;

    .line 165
    invoke-virtual {p3}, Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;->newStreamBridge()Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    .line 166
    new-instance v0, Ljava/util/jar/JarOutputStream;

    iget-object v2, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    invoke-direct {v0, v2}, Ljava/util/jar/JarOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 167
    .local v0, "jarOut":Ljava/util/jar/JarOutputStream;
    invoke-static {}, Ljava/util/jar/Pack200;->newUnpacker()Ljava/util/jar/Pack200$Unpacker;

    move-result-object v1

    .line 168
    .local v1, "u":Ljava/util/jar/Pack200$Unpacker;
    if-eqz p4, :cond_1f

    .line 169
    invoke-interface {v1}, Ljava/util/jar/Pack200$Unpacker;->properties()Ljava/util/SortedMap;

    move-result-object v2

    invoke-interface {v2, p4}, Ljava/util/SortedMap;->putAll(Ljava/util/Map;)V

    .line 171
    :cond_1f
    if-nez p2, :cond_2d

    .line 172
    new-instance v2, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream$1;

    invoke-direct {v2, p0, p1}, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream$1;-><init>(Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;Ljava/io/InputStream;)V

    invoke-interface {v1, v2, v0}, Ljava/util/jar/Pack200$Unpacker;->unpack(Ljava/io/InputStream;Ljava/util/jar/JarOutputStream;)V

    .line 183
    :goto_29
    invoke-virtual {v0}, Ljava/util/jar/JarOutputStream;->close()V

    .line 184
    return-void

    .line 181
    :cond_2d
    invoke-interface {v1, p2, v0}, Ljava/util/jar/Pack200$Unpacker;->unpack(Ljava/io/File;Ljava/util/jar/JarOutputStream;)V

    goto :goto_29
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/util/Map;)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
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
    .line 90
    .local p2, "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v0, Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;->IN_MEMORY:Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;-><init>(Ljava/io/InputStream;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;Ljava/util/Map;)V

    .line 91
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "mode"    # Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 74
    invoke-direct {p0, p1, v0, p2, v0}, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;-><init>(Ljava/io/InputStream;Ljava/io/File;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;Ljava/util/Map;)V

    .line 75
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;Ljava/util/Map;)V
    .registers 5
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "mode"    # Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
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
    .line 108
    .local p3, "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;-><init>(Ljava/io/InputStream;Ljava/io/File;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;Ljava/util/Map;)V

    .line 109
    return-void
.end method

.method public static matches([BI)Z
    .registers 6
    .param p0, "signature"    # [B
    .param p1, "length"    # I

    .prologue
    const/4 v1, 0x0

    .line 262
    sget v2, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->SIG_LENGTH:I

    if-ge p1, v2, :cond_6

    .line 272
    :cond_5
    :goto_5
    return v1

    .line 266
    :cond_6
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    sget v2, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->SIG_LENGTH:I

    if-ge v0, v2, :cond_16

    .line 267
    aget-byte v2, p0, v0

    sget-object v3, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->CAFE_DOOD:[B

    aget-byte v3, v3, v0

    if-ne v2, v3, :cond_5

    .line 266
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 272
    :cond_16
    const/4 v1, 0x1

    goto :goto_5
.end method


# virtual methods
.method public available()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 203
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    invoke-virtual {v0}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->getInput()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    return v0
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 237
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    invoke-virtual {v0}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->stop()V
    :try_end_5
    .catchall {:try_start_0 .. :try_end_5} :catchall_f

    .line 239
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->originalInput:Ljava/io/InputStream;

    if-eqz v0, :cond_e

    .line 240
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->originalInput:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 243
    :cond_e
    return-void

    .line 239
    :catchall_f
    move-exception v0

    iget-object v1, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->originalInput:Ljava/io/InputStream;

    if-eqz v1, :cond_19

    .line 240
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->originalInput:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    :cond_19
    throw v0
.end method

.method public mark(I)V
    .registers 4
    .param p1, "limit"    # I

    .prologue
    .line 218
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    invoke-virtual {v1}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->getInput()Ljava/io/InputStream;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/io/InputStream;->mark(I)V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_9} :catch_a

    .line 222
    return-void

    .line 219
    :catch_a
    move-exception v0

    .line 220
    .local v0, "ex":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public markSupported()Z
    .registers 3

    .prologue
    .line 209
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    invoke-virtual {v1}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->getInput()Ljava/io/InputStream;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/InputStream;->markSupported()Z
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_9} :catch_b

    move-result v1

    .line 211
    :goto_a
    return v1

    .line 210
    :catch_b
    move-exception v0

    .line 211
    .local v0, "ex":Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public read()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 188
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    invoke-virtual {v0}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->getInput()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    return v0
.end method

.method public read([B)I
    .registers 3
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 193
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    invoke-virtual {v0}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->getInput()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/io/InputStream;->read([B)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .registers 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 198
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    invoke-virtual {v0}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->getInput()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public reset()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 226
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    invoke-virtual {v0}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->getInput()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->reset()V

    .line 227
    return-void
.end method

.method public skip(J)J
    .registers 5
    .param p1, "count"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 231
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    invoke-virtual {v0}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->getInput()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    return-wide v0
.end method
