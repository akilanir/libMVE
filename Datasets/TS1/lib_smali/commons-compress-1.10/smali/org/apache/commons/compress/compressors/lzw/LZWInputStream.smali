.class public abstract Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;
.super Lorg/apache/commons/compress/compressors/CompressorInputStream;
.source "LZWInputStream.java"


# static fields
.field protected static final DEFAULT_CODE_SIZE:I = 0x9

.field protected static final UNUSED_PREFIX:I = -0x1


# instance fields
.field private characters:[B

.field private clearCode:I

.field private codeSize:I

.field protected final in:Lorg/apache/commons/compress/utils/BitInputStream;

.field private final oneByte:[B

.field private outputStack:[B

.field private outputStackLocation:I

.field private prefixes:[I

.field private previousCode:I

.field private previousCodeFirstChar:B

.field private tableSize:I


# direct methods
.method protected constructor <init>(Ljava/io/InputStream;Ljava/nio/ByteOrder;)V
    .registers 5
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "byteOrder"    # Ljava/nio/ByteOrder;

    .prologue
    const/4 v1, -0x1

    .line 53
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/CompressorInputStream;-><init>()V

    .line 40
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->oneByte:[B

    .line 43
    iput v1, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->clearCode:I

    .line 44
    const/16 v0, 0x9

    iput v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->codeSize:I

    .line 46
    iput v1, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->previousCode:I

    .line 54
    new-instance v0, Lorg/apache/commons/compress/utils/BitInputStream;

    invoke-direct {v0, p1, p2}, Lorg/apache/commons/compress/utils/BitInputStream;-><init>(Ljava/io/InputStream;Ljava/nio/ByteOrder;)V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->in:Lorg/apache/commons/compress/utils/BitInputStream;

    .line 55
    return-void
.end method

.method private readFromStack([BII)I
    .registers 8
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 175
    iget-object v2, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->outputStack:[B

    array-length v2, v2

    iget v3, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->outputStackLocation:I

    sub-int v1, v2, v3

    .line 176
    .local v1, "remainingInStack":I
    if-lez v1, :cond_1a

    .line 177
    invoke-static {v1, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 178
    .local v0, "maxLength":I
    iget-object v2, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->outputStack:[B

    iget v3, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->outputStackLocation:I

    invoke-static {v2, v3, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 179
    iget v2, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->outputStackLocation:I

    add-int/2addr v2, v0

    iput v2, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->outputStackLocation:I

    .line 182
    .end local v0    # "maxLength":I
    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method


# virtual methods
.method protected abstract addEntry(IB)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected addEntry(IBI)I
    .registers 6
    .param p1, "previousCode"    # I
    .param p2, "character"    # B
    .param p3, "maxTableSize"    # I

    .prologue
    .line 138
    iget v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->tableSize:I

    if-ge v0, p3, :cond_17

    .line 139
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->prefixes:[I

    iget v1, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->tableSize:I

    aput p1, v0, v1

    .line 140
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->characters:[B

    iget v1, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->tableSize:I

    aput-byte p2, v0, v1

    .line 141
    iget v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->tableSize:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->tableSize:I

    .line 143
    :goto_16
    return v0

    :cond_17
    const/4 v0, -0x1

    goto :goto_16
.end method

.method protected addRepeatOfPreviousCode()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 150
    iget v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->previousCode:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_d

    .line 152
    new-instance v0, Ljava/io/IOException;

    const-string v1, "The first code can\'t be a reference to its preceding code"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 154
    :cond_d
    iget v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->previousCode:I

    iget-byte v1, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->previousCodeFirstChar:B

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->addEntry(IB)I

    move-result v0

    return v0
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->in:Lorg/apache/commons/compress/utils/BitInputStream;

    invoke-virtual {v0}, Lorg/apache/commons/compress/utils/BitInputStream;->close()V

    .line 60
    return-void
.end method

.method protected abstract decompressNextSymbol()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected expandCodeToOutputStack(IZ)I
    .registers 7
    .param p1, "code"    # I
    .param p2, "addedUnfinishedEntry"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 163
    move v0, p1

    .local v0, "entry":I
    :goto_1
    if-ltz v0, :cond_16

    .line 164
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->outputStack:[B

    iget v2, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->outputStackLocation:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->outputStackLocation:I

    iget-object v3, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->characters:[B

    aget-byte v3, v3, v0

    aput-byte v3, v1, v2

    .line 163
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->prefixes:[I

    aget v0, v1, v0

    goto :goto_1

    .line 166
    :cond_16
    iget v1, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->previousCode:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_28

    if-nez p2, :cond_28

    .line 167
    iget v1, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->previousCode:I

    iget-object v2, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->outputStack:[B

    iget v3, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->outputStackLocation:I

    aget-byte v2, v2, v3

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->addEntry(IB)I

    .line 169
    :cond_28
    iput p1, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->previousCode:I

    .line 170
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->outputStack:[B

    iget v2, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->outputStackLocation:I

    aget-byte v1, v1, v2

    iput-byte v1, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->previousCodeFirstChar:B

    .line 171
    iget v1, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->outputStackLocation:I

    return v1
.end method

.method protected getClearCode()I
    .registers 2

    .prologue
    .line 218
    iget v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->clearCode:I

    return v0
.end method

.method protected getCodeSize()I
    .registers 2

    .prologue
    .line 186
    iget v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->codeSize:I

    return v0
.end method

.method protected getPrefix(I)I
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 206
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->prefixes:[I

    aget v0, v0, p1

    return v0
.end method

.method protected getPrefixesLength()I
    .registers 2

    .prologue
    .line 214
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->prefixes:[I

    array-length v0, v0

    return v0
.end method

.method protected getTableSize()I
    .registers 2

    .prologue
    .line 222
    iget v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->tableSize:I

    return v0
.end method

.method protected incrementCodeSize()V
    .registers 2

    .prologue
    .line 198
    iget v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->codeSize:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->codeSize:I

    .line 199
    return-void
.end method

.method protected initializeTables(I)V
    .registers 7
    .param p1, "maxCodeSize"    # I

    .prologue
    .line 111
    const/4 v3, 0x1

    shl-int v2, v3, p1

    .line 112
    .local v2, "maxTableSize":I
    new-array v3, v2, [I

    iput-object v3, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->prefixes:[I

    .line 113
    new-array v3, v2, [B

    iput-object v3, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->characters:[B

    .line 114
    new-array v3, v2, [B

    iput-object v3, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->outputStack:[B

    .line 115
    iput v2, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->outputStackLocation:I

    .line 116
    const/16 v1, 0x100

    .line 117
    .local v1, "max":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_14
    const/16 v3, 0x100

    if-ge v0, v3, :cond_25

    .line 118
    iget-object v3, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->prefixes:[I

    const/4 v4, -0x1

    aput v4, v3, v0

    .line 119
    iget-object v3, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->characters:[B

    int-to-byte v4, v0

    aput-byte v4, v3, v0

    .line 117
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    .line 121
    :cond_25
    return-void
.end method

.method public read()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->oneByte:[B

    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->read([B)I

    move-result v0

    .line 65
    .local v0, "ret":I
    if-gez v0, :cond_9

    .line 68
    .end local v0    # "ret":I
    :goto_8
    return v0

    .restart local v0    # "ret":I
    :cond_9
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->oneByte:[B

    const/4 v2, 0x0

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    goto :goto_8
.end method

.method public read([BII)I
    .registers 8
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->readFromStack([BII)I

    move-result v0

    .line 74
    .local v0, "bytesRead":I
    :goto_4
    sub-int v2, p3, v0

    if-lez v2, :cond_20

    .line 75
    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->decompressNextSymbol()I

    move-result v1

    .line 76
    .local v1, "result":I
    if-gez v1, :cond_16

    .line 77
    if-lez v0, :cond_14

    .line 78
    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->count(I)V

    .line 86
    .end local v0    # "bytesRead":I
    .end local v1    # "result":I
    :goto_13
    return v0

    .restart local v0    # "bytesRead":I
    .restart local v1    # "result":I
    :cond_14
    move v0, v1

    .line 81
    goto :goto_13

    .line 83
    :cond_16
    add-int v2, p2, v0

    sub-int v3, p3, v0

    invoke-direct {p0, p1, v2, v3}, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->readFromStack([BII)I

    move-result v2

    add-int/2addr v0, v2

    .line 84
    goto :goto_4

    .line 85
    .end local v1    # "result":I
    :cond_20
    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->count(I)V

    goto :goto_13
.end method

.method protected readNextCode()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    iget v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->codeSize:I

    const/16 v1, 0x1f

    if-le v0, v1, :cond_e

    .line 128
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "code size must not be bigger than 31"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 130
    :cond_e
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->in:Lorg/apache/commons/compress/utils/BitInputStream;

    iget v1, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->codeSize:I

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/utils/BitInputStream;->readBits(I)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method protected resetCodeSize()V
    .registers 2

    .prologue
    .line 190
    const/16 v0, 0x9

    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->setCodeSize(I)V

    .line 191
    return-void
.end method

.method protected resetPreviousCode()V
    .registers 2

    .prologue
    .line 202
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->previousCode:I

    .line 203
    return-void
.end method

.method protected setClearCode(I)V
    .registers 4
    .param p1, "codeSize"    # I

    .prologue
    .line 104
    const/4 v0, 0x1

    add-int/lit8 v1, p1, -0x1

    shl-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->clearCode:I

    .line 105
    return-void
.end method

.method protected setCodeSize(I)V
    .registers 2
    .param p1, "cs"    # I

    .prologue
    .line 194
    iput p1, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->codeSize:I

    .line 195
    return-void
.end method

.method protected setPrefix(II)V
    .registers 4
    .param p1, "offset"    # I
    .param p2, "value"    # I

    .prologue
    .line 210
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->prefixes:[I

    aput p2, v0, p1

    .line 211
    return-void
.end method

.method protected setTableSize(I)V
    .registers 2
    .param p1, "newSize"    # I

    .prologue
    .line 226
    iput p1, p0, Lorg/apache/commons/compress/compressors/lzw/LZWInputStream;->tableSize:I

    .line 227
    return-void
.end method
