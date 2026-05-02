.class public Lorg/tukaani/xz/LZMA2InputStream;
.super Ljava/io/InputStream;


# static fields
.field private static final COMPRESSED_SIZE_MAX:I = 0x10000

.field public static final DICT_SIZE_MAX:I = 0x7ffffff0

.field public static final DICT_SIZE_MIN:I = 0x1000


# instance fields
.field private endReached:Z

.field private exception:Ljava/io/IOException;

.field private in:Ljava/io/DataInputStream;

.field private isLZMAChunk:Z

.field private final lz:Lorg/tukaani/xz/lz/LZDecoder;

.field private lzma:Lorg/tukaani/xz/lzma/LZMADecoder;

.field private needDictReset:Z

.field private needProps:Z

.field private final rc:Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;

.field private final tempBuf:[B

.field private uncompressedSize:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;I)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/tukaani/xz/LZMA2InputStream;-><init>(Ljava/io/InputStream;I[B)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I[B)V
    .registers 8

    const/4 v3, 0x1

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    new-instance v0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;

    const/high16 v1, 0x10000

    invoke-direct {v0, v1}, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;-><init>(I)V

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2InputStream;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;

    iput v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->uncompressedSize:I

    iput-boolean v3, p0, Lorg/tukaani/xz/LZMA2InputStream;->needDictReset:Z

    iput-boolean v3, p0, Lorg/tukaani/xz/LZMA2InputStream;->needProps:Z

    iput-boolean v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->endReached:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2InputStream;->exception:Ljava/io/IOException;

    new-array v0, v3, [B

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2InputStream;->tempBuf:[B

    if-nez p1, :cond_25

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_25
    new-instance v0, Ljava/io/DataInputStream;

    invoke-direct {v0, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2InputStream;->in:Ljava/io/DataInputStream;

    new-instance v0, Lorg/tukaani/xz/lz/LZDecoder;

    invoke-static {p2}, Lorg/tukaani/xz/LZMA2InputStream;->getDictSize(I)I

    move-result v1

    invoke-direct {v0, v1, p3}, Lorg/tukaani/xz/lz/LZDecoder;-><init>(I[B)V

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2InputStream;->lz:Lorg/tukaani/xz/lz/LZDecoder;

    if-eqz p3, :cond_3e

    array-length v0, p3

    if-lez v0, :cond_3e

    iput-boolean v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->needDictReset:Z

    :cond_3e
    return-void
.end method

.method private decodeChunkHeader()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v3, 0x0

    const/4 v2, 0x1

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2InputStream;->in:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v0

    if-nez v0, :cond_d

    iput-boolean v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->endReached:Z

    :goto_c
    return-void

    :cond_d
    const/16 v1, 0xe0

    if-ge v0, v1, :cond_13

    if-ne v0, v2, :cond_4e

    :cond_13
    iput-boolean v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->needProps:Z

    iput-boolean v3, p0, Lorg/tukaani/xz/LZMA2InputStream;->needDictReset:Z

    iget-object v1, p0, Lorg/tukaani/xz/LZMA2InputStream;->lz:Lorg/tukaani/xz/lz/LZDecoder;

    invoke-virtual {v1}, Lorg/tukaani/xz/lz/LZDecoder;->reset()V

    :cond_1c
    const/16 v1, 0x80

    if-lt v0, v1, :cond_6c

    iput-boolean v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->isLZMAChunk:Z

    and-int/lit8 v1, v0, 0x1f

    shl-int/lit8 v1, v1, 0x10

    iput v1, p0, Lorg/tukaani/xz/LZMA2InputStream;->uncompressedSize:I

    iget v1, p0, Lorg/tukaani/xz/LZMA2InputStream;->uncompressedSize:I

    iget-object v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->in:Ljava/io/DataInputStream;

    invoke-virtual {v2}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    add-int/2addr v1, v2

    iput v1, p0, Lorg/tukaani/xz/LZMA2InputStream;->uncompressedSize:I

    iget-object v1, p0, Lorg/tukaani/xz/LZMA2InputStream;->in:Ljava/io/DataInputStream;

    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    const/16 v2, 0xc0

    if-lt v0, v2, :cond_58

    iput-boolean v3, p0, Lorg/tukaani/xz/LZMA2InputStream;->needProps:Z

    invoke-direct {p0}, Lorg/tukaani/xz/LZMA2InputStream;->decodeProps()V

    :cond_46
    :goto_46
    iget-object v0, p0, Lorg/tukaani/xz/LZMA2InputStream;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;

    iget-object v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->in:Ljava/io/DataInputStream;

    invoke-virtual {v0, v2, v1}, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->prepareInputBuffer(Ljava/io/DataInputStream;I)V

    goto :goto_c

    :cond_4e
    iget-boolean v1, p0, Lorg/tukaani/xz/LZMA2InputStream;->needDictReset:Z

    if-eqz v1, :cond_1c

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0

    :cond_58
    iget-boolean v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->needProps:Z

    if-eqz v2, :cond_62

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0

    :cond_62
    const/16 v2, 0xa0

    if-lt v0, v2, :cond_46

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2InputStream;->lzma:Lorg/tukaani/xz/lzma/LZMADecoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/lzma/LZMADecoder;->reset()V

    goto :goto_46

    :cond_6c
    const/4 v1, 0x2

    if-le v0, v1, :cond_75

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0

    :cond_75
    iput-boolean v3, p0, Lorg/tukaani/xz/LZMA2InputStream;->isLZMAChunk:Z

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2InputStream;->in:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/tukaani/xz/LZMA2InputStream;->uncompressedSize:I

    goto :goto_c
.end method

.method private decodeProps()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2InputStream;->in:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v0

    const/16 v1, 0xe0

    if-le v0, v1, :cond_10

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0

    :cond_10
    div-int/lit8 v5, v0, 0x2d

    mul-int/lit8 v1, v5, 0x9

    mul-int/lit8 v1, v1, 0x5

    sub-int/2addr v0, v1

    div-int/lit8 v4, v0, 0x9

    mul-int/lit8 v1, v4, 0x9

    sub-int v3, v0, v1

    add-int v0, v3, v4

    const/4 v1, 0x4

    if-le v0, v1, :cond_28

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0

    :cond_28
    new-instance v0, Lorg/tukaani/xz/lzma/LZMADecoder;

    iget-object v1, p0, Lorg/tukaani/xz/LZMA2InputStream;->lz:Lorg/tukaani/xz/lz/LZDecoder;

    iget-object v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;

    invoke-direct/range {v0 .. v5}, Lorg/tukaani/xz/lzma/LZMADecoder;-><init>(Lorg/tukaani/xz/lz/LZDecoder;Lorg/tukaani/xz/rangecoder/RangeDecoder;III)V

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2InputStream;->lzma:Lorg/tukaani/xz/lzma/LZMADecoder;

    return-void
.end method

.method private static getDictSize(I)I
    .registers 4

    const/16 v0, 0x1000

    if-lt p0, v0, :cond_9

    const v0, 0x7ffffff0

    if-le p0, v0, :cond_22

    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unsupported dictionary size "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_22
    add-int/lit8 v0, p0, 0xf

    and-int/lit8 v0, v0, -0x10

    return v0
.end method

.method public static getMemoryUsage(I)I
    .registers 2

    invoke-static {p0}, Lorg/tukaani/xz/LZMA2InputStream;->getDictSize(I)I

    move-result v0

    div-int/lit16 v0, v0, 0x400

    add-int/lit8 v0, v0, 0x68

    return v0
.end method


# virtual methods
.method public available()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2InputStream;->in:Ljava/io/DataInputStream;

    if-nez v0, :cond_c

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    iget-object v0, p0, Lorg/tukaani/xz/LZMA2InputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2InputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_13
    iget v0, p0, Lorg/tukaani/xz/LZMA2InputStream;->uncompressedSize:I

    return v0
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2InputStream;->in:Ljava/io/DataInputStream;

    if-eqz v0, :cond_c

    :try_start_5
    iget-object v0, p0, Lorg/tukaani/xz/LZMA2InputStream;->in:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->close()V
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_d

    iput-object v1, p0, Lorg/tukaani/xz/LZMA2InputStream;->in:Ljava/io/DataInputStream;

    :cond_c
    return-void

    :catchall_d
    move-exception v0

    iput-object v1, p0, Lorg/tukaani/xz/LZMA2InputStream;->in:Ljava/io/DataInputStream;

    throw v0
.end method

.method public read()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v3, 0x0

    const/4 v0, -0x1

    iget-object v1, p0, Lorg/tukaani/xz/LZMA2InputStream;->tempBuf:[B

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v3, v2}, Lorg/tukaani/xz/LZMA2InputStream;->read([BII)I

    move-result v1

    if-ne v1, v0, :cond_c

    :goto_b
    return v0

    :cond_c
    iget-object v0, p0, Lorg/tukaani/xz/LZMA2InputStream;->tempBuf:[B

    aget-byte v0, v0, v3

    and-int/lit16 v0, v0, 0xff

    goto :goto_b
.end method

.method public read([BII)I
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    const/4 v0, -0x1

    if-ltz p2, :cond_f

    if-ltz p3, :cond_f

    add-int v2, p2, p3

    if-ltz v2, :cond_f

    add-int v2, p2, p3

    array-length v3, p1

    if-le v2, v3, :cond_15

    :cond_f
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    :cond_15
    if-nez p3, :cond_19

    move v0, v1

    :cond_18
    :goto_18
    return v0

    :cond_19
    iget-object v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->in:Ljava/io/DataInputStream;

    if-nez v2, :cond_25

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_25
    iget-object v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->exception:Ljava/io/IOException;

    if-eqz v2, :cond_2c

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2InputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_2c
    iget-boolean v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->endReached:Z

    if-nez v2, :cond_18

    :cond_30
    if-lez p3, :cond_97

    :try_start_32
    iget v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->uncompressedSize:I

    if-nez v2, :cond_41

    invoke-direct {p0}, Lorg/tukaani/xz/LZMA2InputStream;->decodeChunkHeader()V

    iget-boolean v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->endReached:Z

    if-eqz v2, :cond_41

    if-eqz v1, :cond_18

    move v0, v1

    goto :goto_18

    :cond_41
    iget v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->uncompressedSize:I

    invoke-static {v2, p3}, Ljava/lang/Math;->min(II)I

    move-result v2

    iget-boolean v3, p0, Lorg/tukaani/xz/LZMA2InputStream;->isLZMAChunk:Z

    if-nez v3, :cond_7f

    iget-object v3, p0, Lorg/tukaani/xz/LZMA2InputStream;->lz:Lorg/tukaani/xz/lz/LZDecoder;

    iget-object v4, p0, Lorg/tukaani/xz/LZMA2InputStream;->in:Ljava/io/DataInputStream;

    invoke-virtual {v3, v4, v2}, Lorg/tukaani/xz/lz/LZDecoder;->copyUncompressed(Ljava/io/DataInputStream;I)V

    :cond_52
    iget-object v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->lz:Lorg/tukaani/xz/lz/LZDecoder;

    invoke-virtual {v2, p1, p2}, Lorg/tukaani/xz/lz/LZDecoder;->flush([BI)I

    move-result v2

    add-int/2addr p2, v2

    sub-int/2addr p3, v2

    add-int/2addr v1, v2

    iget v3, p0, Lorg/tukaani/xz/LZMA2InputStream;->uncompressedSize:I

    sub-int v2, v3, v2

    iput v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->uncompressedSize:I

    iget v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->uncompressedSize:I

    if-nez v2, :cond_30

    iget-object v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;

    invoke-virtual {v2}, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->isFinished()Z

    move-result v2

    if-eqz v2, :cond_75

    iget-object v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->lz:Lorg/tukaani/xz/lz/LZDecoder;

    invoke-virtual {v2}, Lorg/tukaani/xz/lz/LZDecoder;->hasPending()Z

    move-result v2

    if-eqz v2, :cond_30

    :cond_75
    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0
    :try_end_7b
    .catch Ljava/io/IOException; {:try_start_32 .. :try_end_7b} :catch_7b

    :catch_7b
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2InputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_7f
    :try_start_7f
    iget-object v3, p0, Lorg/tukaani/xz/LZMA2InputStream;->lz:Lorg/tukaani/xz/lz/LZDecoder;

    invoke-virtual {v3, v2}, Lorg/tukaani/xz/lz/LZDecoder;->setLimit(I)V

    iget-object v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->lzma:Lorg/tukaani/xz/lzma/LZMADecoder;

    invoke-virtual {v2}, Lorg/tukaani/xz/lzma/LZMADecoder;->decode()V

    iget-object v2, p0, Lorg/tukaani/xz/LZMA2InputStream;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;

    invoke-virtual {v2}, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->isInBufferOK()Z

    move-result v2

    if-nez v2, :cond_52

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0
    :try_end_97
    .catch Ljava/io/IOException; {:try_start_7f .. :try_end_97} :catch_7b

    :cond_97
    move v0, v1

    goto :goto_18
.end method
