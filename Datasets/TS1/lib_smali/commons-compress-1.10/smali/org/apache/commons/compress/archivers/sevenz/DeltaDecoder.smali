.class Lorg/apache/commons/compress/archivers/sevenz/DeltaDecoder;
.super Lorg/apache/commons/compress/archivers/sevenz/CoderBase;
.source "DeltaDecoder.java"


# direct methods
.method constructor <init>()V
    .registers 4

    .prologue
    .line 29
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Ljava/lang/Number;

    aput-object v2, v0, v1

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/sevenz/CoderBase;-><init>([Ljava/lang/Class;)V

    .line 30
    return-void
.end method

.method private getOptionsFromCoder(Lorg/apache/commons/compress/archivers/sevenz/Coder;)I
    .registers 4
    .param p1, "coder"    # Lorg/apache/commons/compress/archivers/sevenz/Coder;

    .prologue
    .line 61
    iget-object v0, p1, Lorg/apache/commons/compress/archivers/sevenz/Coder;->properties:[B

    if-eqz v0, :cond_9

    iget-object v0, p1, Lorg/apache/commons/compress/archivers/sevenz/Coder;->properties:[B

    array-length v0, v0

    if-nez v0, :cond_b

    .line 62
    :cond_9
    const/4 v0, 0x1

    .line 64
    :goto_a
    return v0

    :cond_b
    iget-object v0, p1, Lorg/apache/commons/compress/archivers/sevenz/Coder;->properties:[B

    const/4 v1, 0x0

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v0, v0, 0x1

    goto :goto_a
.end method


# virtual methods
.method decode(Ljava/lang/String;Ljava/io/InputStream;JLorg/apache/commons/compress/archivers/sevenz/Coder;[B)Ljava/io/InputStream;
    .registers 9
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
    .line 35
    new-instance v0, Lorg/tukaani/xz/DeltaOptions;

    invoke-direct {p0, p5}, Lorg/apache/commons/compress/archivers/sevenz/DeltaDecoder;->getOptionsFromCoder(Lorg/apache/commons/compress/archivers/sevenz/Coder;)I

    move-result v1

    invoke-direct {v0, v1}, Lorg/tukaani/xz/DeltaOptions;-><init>(I)V

    invoke-virtual {v0, p2}, Lorg/tukaani/xz/DeltaOptions;->getInputStream(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method encode(Ljava/io/OutputStream;Ljava/lang/Object;)Ljava/io/OutputStream;
    .registers 7
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "options"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    const/4 v2, 0x1

    invoke-static {p2, v2}, Lorg/apache/commons/compress/archivers/sevenz/DeltaDecoder;->numberOptionOrDefault(Ljava/lang/Object;I)I

    move-result v0

    .line 42
    .local v0, "distance":I
    :try_start_5
    new-instance v2, Lorg/tukaani/xz/DeltaOptions;

    invoke-direct {v2, v0}, Lorg/tukaani/xz/DeltaOptions;-><init>(I)V

    new-instance v3, Lorg/tukaani/xz/FinishableWrapperOutputStream;

    invoke-direct {v3, p1}, Lorg/tukaani/xz/FinishableWrapperOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {v2, v3}, Lorg/tukaani/xz/DeltaOptions;->getOutputStream(Lorg/tukaani/xz/FinishableOutputStream;)Lorg/tukaani/xz/FinishableOutputStream;
    :try_end_12
    .catch Lorg/tukaani/xz/UnsupportedOptionsException; {:try_start_5 .. :try_end_12} :catch_14

    move-result-object v2

    return-object v2

    .line 43
    :catch_14
    move-exception v1

    .line 44
    .local v1, "ex":Lorg/tukaani/xz/UnsupportedOptionsException;
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v1}, Lorg/tukaani/xz/UnsupportedOptionsException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method getOptionsAsProperties(Ljava/lang/Object;)[B
    .registers 5
    .param p1, "options"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x1

    .line 50
    new-array v0, v2, [B

    const/4 v1, 0x0

    invoke-static {p1, v2}, Lorg/apache/commons/compress/archivers/sevenz/DeltaDecoder;->numberOptionOrDefault(Ljava/lang/Object;I)I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    return-object v0
.end method

.method getOptionsFromCoder(Lorg/apache/commons/compress/archivers/sevenz/Coder;Ljava/io/InputStream;)Ljava/lang/Object;
    .registers 4
    .param p1, "coder"    # Lorg/apache/commons/compress/archivers/sevenz/Coder;
    .param p2, "in"    # Ljava/io/InputStream;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/sevenz/DeltaDecoder;->getOptionsFromCoder(Lorg/apache/commons/compress/archivers/sevenz/Coder;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
