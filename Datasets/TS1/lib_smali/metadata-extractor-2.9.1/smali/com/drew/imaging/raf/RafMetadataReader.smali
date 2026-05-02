.class public Lcom/drew/imaging/raf/RafMetadataReader;
.super Ljava/lang/Object;
.source "RafMetadataReader.java"


# direct methods
.method private constructor <init>()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "Not intended for instantiation"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static readMetadata(Ljava/io/InputStream;)Lcom/drew/metadata/Metadata;
    .registers 9
    .param p0, "inputStream"    # Ljava/io/InputStream;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/drew/imaging/jpeg/JpegProcessingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x200

    const/4 v7, -0x1

    .line 42
    invoke-virtual {p0}, Ljava/io/InputStream;->markSupported()Z

    move-result v5

    if-nez v5, :cond_11

    .line 43
    new-instance v5, Ljava/io/IOException;

    const-string v6, "Stream must support mark/reset"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 45
    :cond_11
    invoke-virtual {p0, v6}, Ljava/io/InputStream;->mark(I)V

    .line 47
    new-array v3, v6, [B

    .line 48
    .local v3, "data":[B
    invoke-virtual {p0, v3}, Ljava/io/InputStream;->read([B)I

    move-result v0

    .line 50
    .local v0, "bytesRead":I
    if-ne v0, v7, :cond_24

    .line 51
    new-instance v5, Ljava/io/IOException;

    const-string v6, "Stream is empty"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 53
    :cond_24
    invoke-virtual {p0}, Ljava/io/InputStream;->reset()V

    .line 55
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_28
    add-int/lit8 v5, v0, -0x2

    if-ge v4, v5, :cond_53

    .line 57
    aget-byte v5, v3, v4

    if-ne v5, v7, :cond_50

    add-int/lit8 v5, v4, 0x1

    aget-byte v5, v3, v5

    const/16 v6, -0x28

    if-ne v5, v6, :cond_50

    add-int/lit8 v5, v4, 0x2

    aget-byte v5, v3, v5

    if-ne v5, v7, :cond_50

    .line 58
    int-to-long v5, v4

    invoke-virtual {p0, v5, v6}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v1

    .line 59
    .local v1, "bytesSkipped":J
    int-to-long v5, v4

    cmp-long v5, v1, v5

    if-eqz v5, :cond_53

    .line 60
    new-instance v5, Ljava/io/IOException;

    const-string v6, "Skipping stream bytes failed"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 55
    .end local v1    # "bytesSkipped":J
    :cond_50
    add-int/lit8 v4, v4, 0x1

    goto :goto_28

    .line 65
    :cond_53
    invoke-static {p0}, Lcom/drew/imaging/jpeg/JpegMetadataReader;->readMetadata(Ljava/io/InputStream;)Lcom/drew/metadata/Metadata;

    move-result-object v5

    return-object v5
.end method
