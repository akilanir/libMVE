.class public Lorg/tukaani/xz/LZMAInputStream;
.super Ljava/io/InputStream;


# static fields
.field static final $assertionsDisabled:Z

.field public static final DICT_SIZE_MAX:I = 0x7ffffff0

.field static class$org$tukaani$xz$LZMAInputStream:Ljava/lang/Class;


# instance fields
.field private endReached:Z

.field private exception:Ljava/io/IOException;

.field private in:Ljava/io/InputStream;

.field private lz:Lorg/tukaani/xz/lz/LZDecoder;

.field private lzma:Lorg/tukaani/xz/lzma/LZMADecoder;

.field private rc:Lorg/tukaani/xz/rangecoder/RangeDecoderFromStream;

.field private remainingSize:J

.field private final tempBuf:[B


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lorg/tukaani/xz/LZMAInputStream;->class$org$tukaani$xz$LZMAInputStream:Ljava/lang/Class;

    if-nez v0, :cond_16

    const-string v0, "org.tukaani.xz.LZMAInputStream"

    invoke-static {v0}, Lorg/tukaani/xz/LZMAInputStream;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/tukaani/xz/LZMAInputStream;->class$org$tukaani$xz$LZMAInputStream:Ljava/lang/Class;

    :goto_c
    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_19

    const/4 v0, 0x1

    :goto_13
    sput-boolean v0, Lorg/tukaani/xz/LZMAInputStream;->$assertionsDisabled:Z

    return-void

    :cond_16
    sget-object v0, Lorg/tukaani/xz/LZMAInputStream;->class$org$tukaani$xz$LZMAInputStream:Ljava/lang/Class;

    goto :goto_c

    :cond_19
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, -0x1

    invoke-direct {p0, p1, v0}, Lorg/tukaani/xz/LZMAInputStream;-><init>(Ljava/io/InputStream;I)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v6, 0x0

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    iput-boolean v0, p0, Lorg/tukaani/xz/LZMAInputStream;->endReached:Z

    const/4 v1, 0x1

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/tukaani/xz/LZMAInputStream;->tempBuf:[B

    iput-object v6, p0, Lorg/tukaani/xz/LZMAInputStream;->exception:Ljava/io/IOException;

    new-instance v7, Ljava/io/DataInputStream;

    invoke-direct {v7, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v7}, Ljava/io/DataInputStream;->readByte()B

    move-result v4

    move v1, v0

    move v5, v0

    :goto_19
    const/4 v2, 0x4

    if-ge v1, v2, :cond_27

    invoke-virtual {v7}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v2

    mul-int/lit8 v3, v1, 0x8

    shl-int/2addr v2, v3

    or-int/2addr v5, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    :cond_27
    const-wide/16 v2, 0x0

    :goto_29
    const/16 v1, 0x8

    if-ge v0, v1, :cond_39

    invoke-virtual {v7}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v1

    int-to-long v8, v1

    mul-int/lit8 v1, v0, 0x8

    shl-long/2addr v8, v1

    or-long/2addr v2, v8

    add-int/lit8 v0, v0, 0x1

    goto :goto_29

    :cond_39
    invoke-static {v5, v4}, Lorg/tukaani/xz/LZMAInputStream;->getMemoryUsage(IB)I

    move-result v0

    const/4 v1, -0x1

    if-eq p2, v1, :cond_48

    if-le v0, p2, :cond_48

    new-instance v1, Lorg/tukaani/xz/MemoryLimitException;

    invoke-direct {v1, v0, p2}, Lorg/tukaani/xz/MemoryLimitException;-><init>(II)V

    throw v1

    :cond_48
    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lorg/tukaani/xz/LZMAInputStream;->initialize(Ljava/io/InputStream;JBI[B)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;JBI)V
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v6, 0x0

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/tukaani/xz/LZMAInputStream;->endReached:Z

    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/LZMAInputStream;->tempBuf:[B

    iput-object v6, p0, Lorg/tukaani/xz/LZMAInputStream;->exception:Ljava/io/IOException;

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v6}, Lorg/tukaani/xz/LZMAInputStream;->initialize(Ljava/io/InputStream;JBI[B)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;JBI[B)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/tukaani/xz/LZMAInputStream;->endReached:Z

    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/LZMAInputStream;->tempBuf:[B

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/LZMAInputStream;->exception:Ljava/io/IOException;

    invoke-direct/range {p0 .. p6}, Lorg/tukaani/xz/LZMAInputStream;->initialize(Ljava/io/InputStream;JBI[B)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;JIIII[B)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/tukaani/xz/LZMAInputStream;->endReached:Z

    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/LZMAInputStream;->tempBuf:[B

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/LZMAInputStream;->exception:Ljava/io/IOException;

    invoke-direct/range {p0 .. p8}, Lorg/tukaani/xz/LZMAInputStream;->initialize(Ljava/io/InputStream;JIIII[B)V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 3

    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    return-object v0

    :catch_5
    move-exception v0

    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v0

    throw v0
.end method

.method private static getDictSize(I)I
    .registers 3

    const/16 v0, 0x1000

    if-ltz p0, :cond_9

    const v1, 0x7ffffff0

    if-le p0, v1, :cond_11

    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "LZMA dictionary is too big for this implementation"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_11
    if-ge p0, v0, :cond_14

    move p0, v0

    :cond_14
    add-int/lit8 v0, p0, 0xf

    and-int/lit8 v0, v0, -0x10

    return v0
.end method

.method public static getMemoryUsage(IB)I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/tukaani/xz/UnsupportedOptionsException;,
            Lorg/tukaani/xz/CorruptedInputException;
        }
    .end annotation

    if-ltz p0, :cond_7

    const v0, 0x7ffffff0

    if-le p0, v0, :cond_f

    :cond_7
    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    const-string v1, "LZMA dictionary is too big for this implementation"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_f
    and-int/lit16 v0, p1, 0xff

    const/16 v1, 0xe0

    if-le v0, v1, :cond_1d

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    const-string v1, "Invalid LZMA properties byte"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1d
    rem-int/lit8 v0, v0, 0x2d

    div-int/lit8 v1, v0, 0x9

    mul-int/lit8 v2, v1, 0x9

    sub-int/2addr v0, v2

    invoke-static {p0, v0, v1}, Lorg/tukaani/xz/LZMAInputStream;->getMemoryUsage(III)I

    move-result v0

    return v0
.end method

.method public static getMemoryUsage(III)I
    .registers 6

    if-ltz p1, :cond_b

    const/16 v0, 0x8

    if-gt p1, v0, :cond_b

    if-ltz p2, :cond_b

    const/4 v0, 0x4

    if-le p2, v0, :cond_13

    :cond_b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid lc or lp"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_13
    invoke-static {p0}, Lorg/tukaani/xz/LZMAInputStream;->getDictSize(I)I

    move-result v0

    div-int/lit16 v0, v0, 0x400

    add-int/lit8 v0, v0, 0xa

    const/16 v1, 0x600

    add-int v2, p1, p2

    shl-int/2addr v1, v2

    div-int/lit16 v1, v1, 0x400

    add-int/2addr v0, v1

    return v0
.end method

.method private initialize(Ljava/io/InputStream;JBI[B)V
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, -0x1

    cmp-long v0, p2, v0

    if-gez v0, :cond_e

    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    const-string v1, "Uncompressed size is too big"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    and-int/lit16 v0, p4, 0xff

    const/16 v1, 0xe0

    if-le v0, v1, :cond_1c

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    const-string v1, "Invalid LZMA properties byte"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1c
    div-int/lit8 v6, v0, 0x2d

    mul-int/lit8 v1, v6, 0x9

    mul-int/lit8 v1, v1, 0x5

    sub-int/2addr v0, v1

    div-int/lit8 v5, v0, 0x9

    mul-int/lit8 v1, v5, 0x9

    sub-int v4, v0, v1

    if-ltz p5, :cond_30

    const v0, 0x7ffffff0

    if-le p5, v0, :cond_38

    :cond_30
    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    const-string v1, "LZMA dictionary is too big for this implementation"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_38
    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move v7, p5

    move-object v8, p6

    invoke-direct/range {v0 .. v8}, Lorg/tukaani/xz/LZMAInputStream;->initialize(Ljava/io/InputStream;JIIII[B)V

    return-void
.end method

.method private initialize(Ljava/io/InputStream;JIIII[B)V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v2, 0x4

    const-wide/16 v0, -0x1

    cmp-long v0, p2, v0

    if-ltz v0, :cond_15

    if-ltz p4, :cond_15

    const/16 v0, 0x8

    if-gt p4, v0, :cond_15

    if-ltz p5, :cond_15

    if-gt p5, v2, :cond_15

    if-ltz p6, :cond_15

    if-le p6, v2, :cond_1b

    :cond_15
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :cond_1b
    iput-object p1, p0, Lorg/tukaani/xz/LZMAInputStream;->in:Ljava/io/InputStream;

    invoke-static {p7}, Lorg/tukaani/xz/LZMAInputStream;->getDictSize(I)I

    move-result v0

    const-wide/16 v1, 0x0

    cmp-long v1, p2, v1

    if-ltz v1, :cond_31

    int-to-long v1, v0

    cmp-long v1, v1, p2

    if-lez v1, :cond_31

    long-to-int v0, p2

    invoke-static {v0}, Lorg/tukaani/xz/LZMAInputStream;->getDictSize(I)I

    move-result v0

    :cond_31
    new-instance v1, Lorg/tukaani/xz/lz/LZDecoder;

    invoke-static {v0}, Lorg/tukaani/xz/LZMAInputStream;->getDictSize(I)I

    move-result v0

    invoke-direct {v1, v0, p8}, Lorg/tukaani/xz/lz/LZDecoder;-><init>(I[B)V

    iput-object v1, p0, Lorg/tukaani/xz/LZMAInputStream;->lz:Lorg/tukaani/xz/lz/LZDecoder;

    new-instance v0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromStream;

    invoke-direct {v0, p1}, Lorg/tukaani/xz/rangecoder/RangeDecoderFromStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lorg/tukaani/xz/LZMAInputStream;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoderFromStream;

    new-instance v0, Lorg/tukaani/xz/lzma/LZMADecoder;

    iget-object v1, p0, Lorg/tukaani/xz/LZMAInputStream;->lz:Lorg/tukaani/xz/lz/LZDecoder;

    iget-object v2, p0, Lorg/tukaani/xz/LZMAInputStream;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoderFromStream;

    move v3, p4

    move v4, p5

    move v5, p6

    invoke-direct/range {v0 .. v5}, Lorg/tukaani/xz/lzma/LZMADecoder;-><init>(Lorg/tukaani/xz/lz/LZDecoder;Lorg/tukaani/xz/rangecoder/RangeDecoder;III)V

    iput-object v0, p0, Lorg/tukaani/xz/LZMAInputStream;->lzma:Lorg/tukaani/xz/lzma/LZMADecoder;

    iput-wide p2, p0, Lorg/tukaani/xz/LZMAInputStream;->remainingSize:J

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

    const/4 v1, 0x0

    iget-object v0, p0, Lorg/tukaani/xz/LZMAInputStream;->in:Ljava/io/InputStream;

    if-eqz v0, :cond_c

    :try_start_5
    iget-object v0, p0, Lorg/tukaani/xz/LZMAInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_d

    iput-object v1, p0, Lorg/tukaani/xz/LZMAInputStream;->in:Ljava/io/InputStream;

    :cond_c
    return-void

    :catchall_d
    move-exception v0

    iput-object v1, p0, Lorg/tukaani/xz/LZMAInputStream;->in:Ljava/io/InputStream;

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

    iget-object v1, p0, Lorg/tukaani/xz/LZMAInputStream;->tempBuf:[B

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v3, v2}, Lorg/tukaani/xz/LZMAInputStream;->read([BII)I

    move-result v1

    if-ne v1, v0, :cond_c

    :goto_b
    return v0

    :cond_c
    iget-object v0, p0, Lorg/tukaani/xz/LZMAInputStream;->tempBuf:[B

    aget-byte v0, v0, v3

    and-int/lit16 v0, v0, 0xff

    goto :goto_b
.end method

.method public read([BII)I
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    const/4 v0, -0x1

    const-wide/16 v8, 0x0

    if-ltz p2, :cond_11

    if-ltz p3, :cond_11

    add-int v2, p2, p3

    if-ltz v2, :cond_11

    add-int v2, p2, p3

    array-length v3, p1

    if-le v2, v3, :cond_17

    :cond_11
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    :cond_17
    if-nez p3, :cond_1b

    move v0, v1

    :cond_1a
    :goto_1a
    return v0

    :cond_1b
    iget-object v2, p0, Lorg/tukaani/xz/LZMAInputStream;->in:Ljava/io/InputStream;

    if-nez v2, :cond_27

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_27
    iget-object v2, p0, Lorg/tukaani/xz/LZMAInputStream;->exception:Ljava/io/IOException;

    if-eqz v2, :cond_2e

    iget-object v0, p0, Lorg/tukaani/xz/LZMAInputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_2e
    iget-boolean v2, p0, Lorg/tukaani/xz/LZMAInputStream;->endReached:Z

    if-nez v2, :cond_1a

    move v3, p3

    :cond_33
    if-lez v3, :cond_bb

    :try_start_35
    iget-wide v4, p0, Lorg/tukaani/xz/LZMAInputStream;->remainingSize:J

    cmp-long v2, v4, v8

    if-ltz v2, :cond_be

    iget-wide v4, p0, Lorg/tukaani/xz/LZMAInputStream;->remainingSize:J

    int-to-long v6, v3

    cmp-long v2, v4, v6

    if-gez v2, :cond_be

    iget-wide v4, p0, Lorg/tukaani/xz/LZMAInputStream;->remainingSize:J

    long-to-int v2, v4

    :goto_45
    iget-object v4, p0, Lorg/tukaani/xz/LZMAInputStream;->lz:Lorg/tukaani/xz/lz/LZDecoder;

    invoke-virtual {v4, v2}, Lorg/tukaani/xz/lz/LZDecoder;->setLimit(I)V
    :try_end_4a
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_4a} :catch_74

    :try_start_4a
    iget-object v2, p0, Lorg/tukaani/xz/LZMAInputStream;->lzma:Lorg/tukaani/xz/lzma/LZMADecoder;

    invoke-virtual {v2}, Lorg/tukaani/xz/lzma/LZMADecoder;->decode()V
    :try_end_4f
    .catch Lorg/tukaani/xz/CorruptedInputException; {:try_start_4a .. :try_end_4f} :catch_78
    .catch Ljava/io/IOException; {:try_start_4a .. :try_end_4f} :catch_74

    :goto_4f
    :try_start_4f
    iget-object v2, p0, Lorg/tukaani/xz/LZMAInputStream;->lz:Lorg/tukaani/xz/lz/LZDecoder;

    invoke-virtual {v2, p1, p2}, Lorg/tukaani/xz/lz/LZDecoder;->flush([BI)I

    move-result v2

    add-int/2addr p2, v2

    sub-int/2addr v3, v2

    add-int/2addr v1, v2

    iget-wide v4, p0, Lorg/tukaani/xz/LZMAInputStream;->remainingSize:J

    cmp-long v4, v4, v8

    if-ltz v4, :cond_9c

    iget-wide v4, p0, Lorg/tukaani/xz/LZMAInputStream;->remainingSize:J

    int-to-long v6, v2

    sub-long/2addr v4, v6

    iput-wide v4, p0, Lorg/tukaani/xz/LZMAInputStream;->remainingSize:J

    sget-boolean v2, Lorg/tukaani/xz/LZMAInputStream;->$assertionsDisabled:Z

    if-nez v2, :cond_93

    iget-wide v4, p0, Lorg/tukaani/xz/LZMAInputStream;->remainingSize:J

    cmp-long v2, v4, v8

    if-gez v2, :cond_93

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_74
    .catch Ljava/io/IOException; {:try_start_4f .. :try_end_74} :catch_74

    :catch_74
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/LZMAInputStream;->exception:Ljava/io/IOException;

    throw v0

    :catch_78
    move-exception v2

    :try_start_79
    iget-wide v4, p0, Lorg/tukaani/xz/LZMAInputStream;->remainingSize:J

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-nez v4, :cond_89

    iget-object v4, p0, Lorg/tukaani/xz/LZMAInputStream;->lzma:Lorg/tukaani/xz/lzma/LZMADecoder;

    invoke-virtual {v4}, Lorg/tukaani/xz/lzma/LZMADecoder;->endMarkerDetected()Z

    move-result v4

    if-nez v4, :cond_8a

    :cond_89
    throw v2

    :cond_8a
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/tukaani/xz/LZMAInputStream;->endReached:Z

    iget-object v2, p0, Lorg/tukaani/xz/LZMAInputStream;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoderFromStream;

    invoke-virtual {v2}, Lorg/tukaani/xz/rangecoder/RangeDecoderFromStream;->normalize()V

    goto :goto_4f

    :cond_93
    iget-wide v4, p0, Lorg/tukaani/xz/LZMAInputStream;->remainingSize:J

    cmp-long v2, v4, v8

    if-nez v2, :cond_9c

    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/tukaani/xz/LZMAInputStream;->endReached:Z

    :cond_9c
    iget-boolean v2, p0, Lorg/tukaani/xz/LZMAInputStream;->endReached:Z

    if-eqz v2, :cond_33

    iget-object v2, p0, Lorg/tukaani/xz/LZMAInputStream;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoderFromStream;

    invoke-virtual {v2}, Lorg/tukaani/xz/rangecoder/RangeDecoderFromStream;->isFinished()Z

    move-result v2

    if-eqz v2, :cond_b0

    iget-object v2, p0, Lorg/tukaani/xz/LZMAInputStream;->lz:Lorg/tukaani/xz/lz/LZDecoder;

    invoke-virtual {v2}, Lorg/tukaani/xz/lz/LZDecoder;->hasPending()Z

    move-result v2

    if-eqz v2, :cond_b6

    :cond_b0
    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0
    :try_end_b6
    .catch Ljava/io/IOException; {:try_start_79 .. :try_end_b6} :catch_74

    :cond_b6
    if-eqz v1, :cond_1a

    move v0, v1

    goto/16 :goto_1a

    :cond_bb
    move v0, v1

    goto/16 :goto_1a

    :cond_be
    move v2, v3

    goto :goto_45
.end method
