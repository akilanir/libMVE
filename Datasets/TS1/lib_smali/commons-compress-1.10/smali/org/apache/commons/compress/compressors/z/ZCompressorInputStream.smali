.class public Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;
.super Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;
.source "ZCompressorInputStream.java"


# static fields
.field private static final BLOCK_MODE_MASK:I = 0x80

.field private static final MAGIC_1:I = 0x1f

.field private static final MAGIC_2:I = 0x9d

.field private static final MAX_CODE_SIZE_MASK:I = 0x1f


# instance fields
.field private final blockMode:Z

.field private final maxCodeSize:I

.field private totalCodesRead:J


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 8
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x8

    .line 42
    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-direct {p0, p1, v3}, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;-><init>(Ljava/io/InputStream;Ljava/nio/ByteOrder;)V

    .line 39
    const-wide/16 v3, 0x0

    iput-wide v3, p0, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->totalCodesRead:J

    .line 43
    iget-object v3, p0, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->in:Lorg/apache/commons/compress/utils/BitInputStream;

    invoke-virtual {v3, v5}, Lorg/apache/commons/compress/utils/BitInputStream;->readBits(I)J

    move-result-wide v3

    long-to-int v0, v3

    .line 44
    .local v0, "firstByte":I
    iget-object v3, p0, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->in:Lorg/apache/commons/compress/utils/BitInputStream;

    invoke-virtual {v3, v5}, Lorg/apache/commons/compress/utils/BitInputStream;->readBits(I)J

    move-result-wide v3

    long-to-int v1, v3

    .line 45
    .local v1, "secondByte":I
    iget-object v3, p0, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->in:Lorg/apache/commons/compress/utils/BitInputStream;

    invoke-virtual {v3, v5}, Lorg/apache/commons/compress/utils/BitInputStream;->readBits(I)J

    move-result-wide v3

    long-to-int v2, v3

    .line 46
    .local v2, "thirdByte":I
    const/16 v3, 0x1f

    if-ne v0, v3, :cond_2a

    const/16 v3, 0x9d

    if-ne v1, v3, :cond_2a

    if-gez v2, :cond_32

    .line 47
    :cond_2a
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Input is not in .Z format"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 49
    :cond_32
    and-int/lit16 v3, v2, 0x80

    if-eqz v3, :cond_4f

    const/4 v3, 0x1

    :goto_37
    iput-boolean v3, p0, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->blockMode:Z

    .line 50
    and-int/lit8 v3, v2, 0x1f

    iput v3, p0, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->maxCodeSize:I

    .line 51
    iget-boolean v3, p0, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->blockMode:Z

    if-eqz v3, :cond_46

    .line 52
    const/16 v3, 0x9

    invoke-virtual {p0, v3}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->setClearCode(I)V

    .line 54
    :cond_46
    iget v3, p0, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->maxCodeSize:I

    invoke-virtual {p0, v3}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->initializeTables(I)V

    .line 55
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->clearEntries()V

    .line 56
    return-void

    .line 49
    :cond_4f
    const/4 v3, 0x0

    goto :goto_37
.end method

.method private clearEntries()V
    .registers 2

    .prologue
    .line 59
    iget-boolean v0, p0, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->blockMode:Z

    if-eqz v0, :cond_b

    const/4 v0, 0x1

    :goto_5
    add-int/lit16 v0, v0, 0x100

    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->setTableSize(I)V

    .line 60
    return-void

    .line 59
    :cond_b
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static matches([BI)Z
    .registers 6
    .param p0, "signature"    # [B
    .param p1, "length"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 163
    const/4 v2, 0x3

    if-le p1, v2, :cond_12

    aget-byte v2, p0, v1

    const/16 v3, 0x1f

    if-ne v2, v3, :cond_12

    aget-byte v2, p0, v0

    const/16 v3, -0x63

    if-ne v2, v3, :cond_12

    :goto_11
    return v0

    :cond_12
    move v0, v1

    goto :goto_11
.end method

.method private reAlignReading()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x8

    .line 82
    iget-wide v4, p0, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->totalCodesRead:J

    rem-long/2addr v4, v6

    sub-long v0, v6, v4

    .line 83
    .local v0, "codeReadsToThrowAway":J
    cmp-long v4, v0, v6

    if-nez v4, :cond_d

    .line 84
    const-wide/16 v0, 0x0

    .line 86
    :cond_d
    const-wide/16 v2, 0x0

    .local v2, "i":J
    :goto_f
    cmp-long v4, v2, v0

    if-gez v4, :cond_1a

    .line 87
    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->readNextCode()I

    .line 86
    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    goto :goto_f

    .line 89
    :cond_1a
    iget-object v4, p0, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->in:Lorg/apache/commons/compress/utils/BitInputStream;

    invoke-virtual {v4}, Lorg/apache/commons/compress/utils/BitInputStream;->clearBitCache()V

    .line 90
    return-void
.end method


# virtual methods
.method protected addEntry(IB)I
    .registers 7
    .param p1, "previousCode"    # I
    .param p2, "character"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    const/4 v2, 0x1

    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->getCodeSize()I

    move-result v3

    shl-int v0, v2, v3

    .line 101
    .local v0, "maxTableSize":I
    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->addEntry(IBI)I

    move-result v1

    .line 102
    .local v1, "r":I
    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->getTableSize()I

    move-result v2

    if-ne v2, v0, :cond_1f

    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->getCodeSize()I

    move-result v2

    iget v3, p0, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->maxCodeSize:I

    if-ge v2, v3, :cond_1f

    .line 103
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->reAlignReading()V

    .line 104
    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->incrementCodeSize()V

    .line 106
    :cond_1f
    return v1
.end method

.method protected decompressNextSymbol()I
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 129
    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->readNextCode()I

    move-result v1

    .line 130
    .local v1, "code":I
    if-gez v1, :cond_9

    .line 131
    const/4 v2, -0x1

    .line 146
    :goto_8
    return v2

    .line 132
    :cond_9
    iget-boolean v3, p0, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->blockMode:Z

    if-eqz v3, :cond_20

    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->getClearCode()I

    move-result v3

    if-ne v1, v3, :cond_20

    .line 133
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->clearEntries()V

    .line 134
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->reAlignReading()V

    .line 135
    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->resetCodeSize()V

    .line 136
    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->resetPreviousCode()V

    goto :goto_8

    .line 139
    :cond_20
    const/4 v0, 0x0

    .line 140
    .local v0, "addedUnfinishedEntry":Z
    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->getTableSize()I

    move-result v3

    if-ne v1, v3, :cond_30

    .line 141
    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->addRepeatOfPreviousCode()I

    .line 142
    const/4 v0, 0x1

    .line 146
    :cond_2b
    invoke-virtual {p0, v1, v0}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->expandCodeToOutputStack(IZ)I

    move-result v2

    goto :goto_8

    .line 143
    :cond_30
    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->getTableSize()I

    move-result v3

    if-le v1, v3, :cond_2b

    .line 144
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Invalid %d bit code 0x%x"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->getCodeSize()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v2

    const/4 v2, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method protected readNextCode()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    invoke-super {p0}, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->readNextCode()I

    move-result v0

    .line 71
    .local v0, "code":I
    if-ltz v0, :cond_d

    .line 72
    iget-wide v1, p0, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->totalCodesRead:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->totalCodesRead:J

    .line 74
    :cond_d
    return v0
.end method
