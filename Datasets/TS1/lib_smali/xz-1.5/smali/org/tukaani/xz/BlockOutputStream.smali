.class Lorg/tukaani/xz/BlockOutputStream;
.super Lorg/tukaani/xz/FinishableOutputStream;


# instance fields
.field private final check:Lorg/tukaani/xz/check/Check;

.field private final compressedSizeLimit:J

.field private filterChain:Lorg/tukaani/xz/FinishableOutputStream;

.field private final headerSize:I

.field private final out:Ljava/io/OutputStream;

.field private final outCounted:Lorg/tukaani/xz/CountingOutputStream;

.field private final tempBuf:[B

.field private uncompressedSize:J


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;[Lorg/tukaani/xz/FilterEncoder;Lorg/tukaani/xz/check/Check;)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    invoke-direct {p0}, Lorg/tukaani/xz/FinishableOutputStream;-><init>()V

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lorg/tukaani/xz/BlockOutputStream;->uncompressedSize:J

    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/BlockOutputStream;->tempBuf:[B

    iput-object p1, p0, Lorg/tukaani/xz/BlockOutputStream;->out:Ljava/io/OutputStream;

    iput-object p3, p0, Lorg/tukaani/xz/BlockOutputStream;->check:Lorg/tukaani/xz/check/Check;

    new-instance v0, Lorg/tukaani/xz/CountingOutputStream;

    invoke-direct {v0, p1}, Lorg/tukaani/xz/CountingOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lorg/tukaani/xz/BlockOutputStream;->outCounted:Lorg/tukaani/xz/CountingOutputStream;

    iget-object v0, p0, Lorg/tukaani/xz/BlockOutputStream;->outCounted:Lorg/tukaani/xz/CountingOutputStream;

    iput-object v0, p0, Lorg/tukaani/xz/BlockOutputStream;->filterChain:Lorg/tukaani/xz/FinishableOutputStream;

    array-length v0, p2

    add-int/lit8 v0, v0, -0x1

    :goto_1f
    if-ltz v0, :cond_2e

    aget-object v2, p2, v0

    iget-object v3, p0, Lorg/tukaani/xz/BlockOutputStream;->filterChain:Lorg/tukaani/xz/FinishableOutputStream;

    invoke-interface {v2, v3}, Lorg/tukaani/xz/FilterEncoder;->getOutputStream(Lorg/tukaani/xz/FinishableOutputStream;)Lorg/tukaani/xz/FinishableOutputStream;

    move-result-object v2

    iput-object v2, p0, Lorg/tukaani/xz/BlockOutputStream;->filterChain:Lorg/tukaani/xz/FinishableOutputStream;

    add-int/lit8 v0, v0, -0x1

    goto :goto_1f

    :cond_2e
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-virtual {v2, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    array-length v0, p2

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v2, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    move v0, v1

    :goto_3d
    array-length v3, p2

    if-ge v0, v3, :cond_5a

    aget-object v3, p2, v0

    invoke-interface {v3}, Lorg/tukaani/xz/FilterEncoder;->getFilterID()J

    move-result-wide v3

    invoke-static {v2, v3, v4}, Lorg/tukaani/xz/common/EncoderUtil;->encodeVLI(Ljava/io/OutputStream;J)V

    aget-object v3, p2, v0

    invoke-interface {v3}, Lorg/tukaani/xz/FilterEncoder;->getFilterProps()[B

    move-result-object v3

    array-length v4, v3

    int-to-long v4, v4

    invoke-static {v2, v4, v5}, Lorg/tukaani/xz/common/EncoderUtil;->encodeVLI(Ljava/io/OutputStream;J)V

    invoke-virtual {v2, v3}, Ljava/io/ByteArrayOutputStream;->write([B)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_3d

    :cond_5a
    :goto_5a
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v0

    and-int/lit8 v0, v0, 0x3

    if-eqz v0, :cond_66

    invoke-virtual {v2, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_5a

    :cond_66
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    array-length v2, v0

    add-int/lit8 v2, v2, 0x4

    iput v2, p0, Lorg/tukaani/xz/BlockOutputStream;->headerSize:I

    iget v2, p0, Lorg/tukaani/xz/BlockOutputStream;->headerSize:I

    const/16 v3, 0x400

    if-le v2, v3, :cond_7b

    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    invoke-direct {v0}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>()V

    throw v0

    :cond_7b
    array-length v2, v0

    div-int/lit8 v2, v2, 0x4

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    invoke-static {p1, v0}, Lorg/tukaani/xz/common/EncoderUtil;->writeCRC32(Ljava/io/OutputStream;[B)V

    const-wide v0, 0x7ffffffffffffffcL

    iget v2, p0, Lorg/tukaani/xz/BlockOutputStream;->headerSize:I

    int-to-long v2, v2

    sub-long/2addr v0, v2

    invoke-virtual {p3}, Lorg/tukaani/xz/check/Check;->getSize()I

    move-result v2

    int-to-long v2, v2

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lorg/tukaani/xz/BlockOutputStream;->compressedSizeLimit:J

    return-void
.end method

.method private validate()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v4, 0x0

    iget-object v0, p0, Lorg/tukaani/xz/BlockOutputStream;->outCounted:Lorg/tukaani/xz/CountingOutputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/CountingOutputStream;->getSize()J

    move-result-wide v0

    cmp-long v2, v0, v4

    if-ltz v2, :cond_18

    iget-wide v2, p0, Lorg/tukaani/xz/BlockOutputStream;->compressedSizeLimit:J

    cmp-long v0, v0, v2

    if-gtz v0, :cond_18

    iget-wide v0, p0, Lorg/tukaani/xz/BlockOutputStream;->uncompressedSize:J

    cmp-long v0, v0, v4

    if-gez v0, :cond_20

    :cond_18
    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "XZ Stream has grown too big"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_20
    return-void
.end method


# virtual methods
.method public finish()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/BlockOutputStream;->filterChain:Lorg/tukaani/xz/FinishableOutputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/FinishableOutputStream;->finish()V

    invoke-direct {p0}, Lorg/tukaani/xz/BlockOutputStream;->validate()V

    iget-object v0, p0, Lorg/tukaani/xz/BlockOutputStream;->outCounted:Lorg/tukaani/xz/CountingOutputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/CountingOutputStream;->getSize()J

    move-result-wide v0

    :goto_e
    const-wide/16 v2, 0x3

    and-long/2addr v2, v0

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_21

    iget-object v2, p0, Lorg/tukaani/xz/BlockOutputStream;->out:Ljava/io/OutputStream;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/io/OutputStream;->write(I)V

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    goto :goto_e

    :cond_21
    iget-object v0, p0, Lorg/tukaani/xz/BlockOutputStream;->out:Ljava/io/OutputStream;

    iget-object v1, p0, Lorg/tukaani/xz/BlockOutputStream;->check:Lorg/tukaani/xz/check/Check;

    invoke-virtual {v1}, Lorg/tukaani/xz/check/Check;->finish()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/BlockOutputStream;->filterChain:Lorg/tukaani/xz/FinishableOutputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/FinishableOutputStream;->flush()V

    invoke-direct {p0}, Lorg/tukaani/xz/BlockOutputStream;->validate()V

    return-void
.end method

.method public getUncompressedSize()J
    .registers 3

    iget-wide v0, p0, Lorg/tukaani/xz/BlockOutputStream;->uncompressedSize:J

    return-wide v0
.end method

.method public getUnpaddedSize()J
    .registers 5

    iget v0, p0, Lorg/tukaani/xz/BlockOutputStream;->headerSize:I

    int-to-long v0, v0

    iget-object v2, p0, Lorg/tukaani/xz/BlockOutputStream;->outCounted:Lorg/tukaani/xz/CountingOutputStream;

    invoke-virtual {v2}, Lorg/tukaani/xz/CountingOutputStream;->getSize()J

    move-result-wide v2

    add-long/2addr v0, v2

    iget-object v2, p0, Lorg/tukaani/xz/BlockOutputStream;->check:Lorg/tukaani/xz/check/Check;

    invoke-virtual {v2}, Lorg/tukaani/xz/check/Check;->getSize()I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public write(I)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v2, 0x0

    iget-object v0, p0, Lorg/tukaani/xz/BlockOutputStream;->tempBuf:[B

    int-to-byte v1, p1

    aput-byte v1, v0, v2

    iget-object v0, p0, Lorg/tukaani/xz/BlockOutputStream;->tempBuf:[B

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v2, v1}, Lorg/tukaani/xz/BlockOutputStream;->write([BII)V

    return-void
.end method

.method public write([BII)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/BlockOutputStream;->filterChain:Lorg/tukaani/xz/FinishableOutputStream;

    invoke-virtual {v0, p1, p2, p3}, Lorg/tukaani/xz/FinishableOutputStream;->write([BII)V

    iget-object v0, p0, Lorg/tukaani/xz/BlockOutputStream;->check:Lorg/tukaani/xz/check/Check;

    invoke-virtual {v0, p1, p2, p3}, Lorg/tukaani/xz/check/Check;->update([BII)V

    iget-wide v0, p0, Lorg/tukaani/xz/BlockOutputStream;->uncompressedSize:J

    int-to-long v2, p3

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/tukaani/xz/BlockOutputStream;->uncompressedSize:J

    invoke-direct {p0}, Lorg/tukaani/xz/BlockOutputStream;->validate()V

    return-void
.end method
