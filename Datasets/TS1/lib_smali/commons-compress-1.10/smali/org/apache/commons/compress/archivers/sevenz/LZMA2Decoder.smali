.class Lorg/apache/commons/compress/archivers/sevenz/LZMA2Decoder;
.super Lorg/apache/commons/compress/archivers/sevenz/CoderBase;
.source "LZMA2Decoder.java"


# direct methods
.method constructor <init>()V
    .registers 4

    .prologue
    .line 31
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Lorg/tukaani/xz/LZMA2Options;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-class v2, Ljava/lang/Number;

    aput-object v2, v0, v1

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/sevenz/CoderBase;-><init>([Ljava/lang/Class;)V

    .line 32
    return-void
.end method

.method private getDictSize(Ljava/lang/Object;)I
    .registers 3
    .param p1, "opts"    # Ljava/lang/Object;

    .prologue
    .line 69
    instance-of v0, p1, Lorg/tukaani/xz/LZMA2Options;

    if-eqz v0, :cond_b

    .line 70
    check-cast p1, Lorg/tukaani/xz/LZMA2Options;

    .end local p1    # "opts":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/tukaani/xz/LZMA2Options;->getDictSize()I

    move-result v0

    .line 72
    :goto_a
    return v0

    .restart local p1    # "opts":Ljava/lang/Object;
    :cond_b
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/sevenz/LZMA2Decoder;->numberOptionOrDefault(Ljava/lang/Object;)I

    move-result v0

    goto :goto_a
.end method

.method private getDictionarySize(Lorg/apache/commons/compress/archivers/sevenz/Coder;)I
    .registers 6
    .param p1, "coder"    # Lorg/apache/commons/compress/archivers/sevenz/Coder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x28

    .line 76
    iget-object v1, p1, Lorg/apache/commons/compress/archivers/sevenz/Coder;->properties:[B

    const/4 v2, 0x0

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 77
    .local v0, "dictionarySizeBits":I
    and-int/lit8 v1, v0, -0x40

    if-eqz v1, :cond_15

    .line 78
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Unsupported LZMA2 property bits"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 80
    :cond_15
    if-le v0, v3, :cond_1f

    .line 81
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Dictionary larger than 4GiB maximum size"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 83
    :cond_1f
    if-ne v0, v3, :cond_23

    .line 84
    const/4 v1, -0x1

    .line 86
    :goto_22
    return v1

    :cond_23
    and-int/lit8 v1, v0, 0x1

    or-int/lit8 v1, v1, 0x2

    div-int/lit8 v2, v0, 0x2

    add-int/lit8 v2, v2, 0xb

    shl-int/2addr v1, v2

    goto :goto_22
.end method

.method private getOptions(Ljava/lang/Object;)Lorg/tukaani/xz/LZMA2Options;
    .registers 4
    .param p1, "opts"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    instance-of v1, p1, Lorg/tukaani/xz/LZMA2Options;

    if-eqz v1, :cond_7

    .line 91
    check-cast p1, Lorg/tukaani/xz/LZMA2Options;

    .line 95
    .end local p1    # "opts":Ljava/lang/Object;
    :goto_6
    return-object p1

    .line 93
    .restart local p1    # "opts":Ljava/lang/Object;
    :cond_7
    new-instance v0, Lorg/tukaani/xz/LZMA2Options;

    invoke-direct {v0}, Lorg/tukaani/xz/LZMA2Options;-><init>()V

    .line 94
    .local v0, "options":Lorg/tukaani/xz/LZMA2Options;
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/sevenz/LZMA2Decoder;->numberOptionOrDefault(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/tukaani/xz/LZMA2Options;->setDictSize(I)V

    move-object p1, v0

    .line 95
    goto :goto_6
.end method

.method private numberOptionOrDefault(Ljava/lang/Object;)I
    .registers 3
    .param p1, "opts"    # Ljava/lang/Object;

    .prologue
    .line 99
    const/high16 v0, 0x800000

    invoke-static {p1, v0}, Lorg/apache/commons/compress/archivers/sevenz/LZMA2Decoder;->numberOptionOrDefault(Ljava/lang/Object;I)I

    move-result v0

    return v0
.end method


# virtual methods
.method decode(Ljava/lang/String;Ljava/io/InputStream;JLorg/apache/commons/compress/archivers/sevenz/Coder;[B)Ljava/io/InputStream;
    .registers 11
    .param p1, "archiveName"    # Ljava/lang/String;
    .param p2, "in"    # Ljava/io/InputStream;
    .param p3, "uncompressedLength"    # J
    .param p5, "coder"    # Lorg/apache/commons/compress/archivers/sevenz/Coder;
    .param p6, "password"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 38
    :try_start_0
    invoke-direct {p0, p5}, Lorg/apache/commons/compress/archivers/sevenz/LZMA2Decoder;->getDictionarySize(Lorg/apache/commons/compress/archivers/sevenz/Coder;)I

    move-result v0

    .line 39
    .local v0, "dictionarySize":I
    new-instance v2, Lorg/tukaani/xz/LZMA2InputStream;

    invoke-direct {v2, p2, v0}, Lorg/tukaani/xz/LZMA2InputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_9} :catch_a

    return-object v2

    .line 40
    .end local v0    # "dictionarySize":I
    :catch_a
    move-exception v1

    .line 41
    .local v1, "ex":Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method encode(Ljava/io/OutputStream;Ljava/lang/Object;)Ljava/io/OutputStream;
    .registers 6
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "opts"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    invoke-direct {p0, p2}, Lorg/apache/commons/compress/archivers/sevenz/LZMA2Decoder;->getOptions(Ljava/lang/Object;)Lorg/tukaani/xz/LZMA2Options;

    move-result-object v0

    .line 49
    .local v0, "options":Lorg/tukaani/xz/LZMA2Options;
    new-instance v1, Lorg/tukaani/xz/FinishableWrapperOutputStream;

    invoke-direct {v1, p1}, Lorg/tukaani/xz/FinishableWrapperOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 50
    .local v1, "wrapped":Lorg/tukaani/xz/FinishableOutputStream;
    invoke-virtual {v0, v1}, Lorg/tukaani/xz/LZMA2Options;->getOutputStream(Lorg/tukaani/xz/FinishableOutputStream;)Lorg/tukaani/xz/FinishableOutputStream;

    move-result-object v2

    return-object v2
.end method

.method getOptionsAsProperties(Ljava/lang/Object;)[B
    .registers 8
    .param p1, "opts"    # Ljava/lang/Object;

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/sevenz/LZMA2Decoder;->getDictSize(Ljava/lang/Object;)I

    move-result v0

    .line 56
    .local v0, "dictSize":I
    invoke-static {v0}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    move-result v1

    .line 57
    .local v1, "lead":I
    rsub-int/lit8 v3, v1, 0x1e

    ushr-int v3, v0, v3

    add-int/lit8 v2, v3, -0x2

    .line 58
    .local v2, "secondBit":I
    const/4 v3, 0x1

    new-array v3, v3, [B

    const/4 v4, 0x0

    rsub-int/lit8 v5, v1, 0x13

    mul-int/lit8 v5, v5, 0x2

    add-int/2addr v5, v2

    int-to-byte v5, v5

    aput-byte v5, v3, v4

    return-object v3
.end method

.method getOptionsFromCoder(Lorg/apache/commons/compress/archivers/sevenz/Coder;Ljava/io/InputStream;)Ljava/lang/Object;
    .registers 4
    .param p1, "coder"    # Lorg/apache/commons/compress/archivers/sevenz/Coder;
    .param p2, "in"    # Ljava/io/InputStream;

    .prologue
    .line 65
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/sevenz/LZMA2Decoder;->getDictionarySize(Lorg/apache/commons/compress/archivers/sevenz/Coder;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
