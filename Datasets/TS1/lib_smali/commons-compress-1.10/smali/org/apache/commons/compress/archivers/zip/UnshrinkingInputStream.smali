.class Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;
.super Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;
.source "UnshrinkingInputStream.java"


# static fields
.field private static final MAX_CODE_SIZE:I = 0xd

.field private static final MAX_TABLE_SIZE:I = 0x2000


# instance fields
.field private final isUsed:[Z


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 5
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 38
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-direct {p0, p1, v1}, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;-><init>(Ljava/io/InputStream;Ljava/nio/ByteOrder;)V

    .line 39
    const/16 v1, 0x9

    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->setClearCode(I)V

    .line 40
    const/16 v1, 0xd

    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->initializeTables(I)V

    .line 41
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->getPrefixesLength()I

    move-result v1

    new-array v1, v1, [Z

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->isUsed:[Z

    .line 42
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_18
    const/16 v1, 0x100

    if-ge v0, v1, :cond_24

    .line 43
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->isUsed:[Z

    const/4 v2, 0x1

    aput-boolean v2, v1, v0

    .line 42
    add-int/lit8 v0, v0, 0x1

    goto :goto_18

    .line 45
    :cond_24
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->getClearCode()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->setTableSize(I)V

    .line 46
    return-void
.end method

.method private partialClear()V
    .registers 6

    .prologue
    const/4 v4, -0x1

    .line 63
    const/16 v2, 0x2000

    new-array v1, v2, [Z

    .line 64
    .local v1, "isParent":[Z
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->isUsed:[Z

    array-length v2, v2

    if-ge v0, v2, :cond_21

    .line 65
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->isUsed:[Z

    aget-boolean v2, v2, v0

    if-eqz v2, :cond_1e

    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->getPrefix(I)I

    move-result v2

    if-eq v2, v4, :cond_1e

    .line 66
    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->getPrefix(I)I

    move-result v2

    const/4 v3, 0x1

    aput-boolean v3, v1, v2

    .line 64
    :cond_1e
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 69
    :cond_21
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->getClearCode()I

    move-result v2

    add-int/lit8 v0, v2, 0x1

    :goto_27
    array-length v2, v1

    if-ge v0, v2, :cond_39

    .line 70
    aget-boolean v2, v1, v0

    if-nez v2, :cond_36

    .line 71
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->isUsed:[Z

    const/4 v3, 0x0

    aput-boolean v3, v2, v0

    .line 72
    invoke-virtual {p0, v0, v4}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->setPrefix(II)V

    .line 69
    :cond_36
    add-int/lit8 v0, v0, 0x1

    goto :goto_27

    .line 75
    :cond_39
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
    const/16 v3, 0x2000

    .line 50
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->getTableSize()I

    move-result v1

    .line 51
    .local v1, "tableSize":I
    :goto_6
    if-ge v1, v3, :cond_11

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->isUsed:[Z

    aget-boolean v2, v2, v1

    if-eqz v2, :cond_11

    .line 52
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 54
    :cond_11
    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->setTableSize(I)V

    .line 55
    invoke-virtual {p0, p1, p2, v3}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->addEntry(IBI)I

    move-result v0

    .line 56
    .local v0, "idx":I
    if-ltz v0, :cond_1f

    .line 57
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->isUsed:[Z

    const/4 v3, 0x1

    aput-boolean v3, v2, v0

    .line 59
    :cond_1f
    return v0
.end method

.method protected decompressNextSymbol()I
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->readNextCode()I

    move-result v1

    .line 92
    .local v1, "code":I
    if-gez v1, :cond_8

    .line 93
    const/4 v4, -0x1

    .line 118
    :goto_7
    return v4

    .line 94
    :cond_8
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->getClearCode()I

    move-result v4

    if-ne v1, v4, :cond_5d

    .line 95
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->readNextCode()I

    move-result v3

    .line 96
    .local v3, "subCode":I
    if-gez v3, :cond_1c

    .line 97
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Unexpected EOF;"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 98
    :cond_1c
    const/4 v4, 0x1

    if-ne v3, v4, :cond_34

    .line 99
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->getCodeSize()I

    move-result v4

    const/16 v5, 0xd

    if-ge v4, v5, :cond_2c

    .line 100
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->incrementCodeSize()V

    .line 110
    :goto_2a
    const/4 v4, 0x0

    goto :goto_7

    .line 102
    :cond_2c
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Attempt to increase code size beyond maximum"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 104
    :cond_34
    const/4 v4, 0x2

    if-ne v3, v4, :cond_44

    .line 105
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->partialClear()V

    .line 106
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->getClearCode()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {p0, v4}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->setTableSize(I)V

    goto :goto_2a

    .line 108
    :cond_44
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid clear code subcode "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 112
    .end local v3    # "subCode":I
    :cond_5d
    const/4 v0, 0x0

    .line 113
    .local v0, "addedUnfinishedEntry":Z
    move v2, v1

    .line 114
    .local v2, "effectiveCode":I
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->isUsed:[Z

    aget-boolean v4, v4, v1

    if-nez v4, :cond_6a

    .line 115
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->addRepeatOfPreviousCode()I

    move-result v2

    .line 116
    const/4 v0, 0x1

    .line 118
    :cond_6a
    invoke-virtual {p0, v2, v0}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;->expandCodeToOutputStack(IZ)I

    move-result v4

    goto :goto_7
.end method
