.class public Lorg/tukaani/xz/XZOutputStream;
.super Lorg/tukaani/xz/FinishableOutputStream;


# instance fields
.field private blockEncoder:Lorg/tukaani/xz/BlockOutputStream;

.field private final check:Lorg/tukaani/xz/check/Check;

.field private exception:Ljava/io/IOException;

.field private filters:[Lorg/tukaani/xz/FilterEncoder;

.field private filtersSupportFlushing:Z

.field private finished:Z

.field private final index:Lorg/tukaani/xz/index/IndexEncoder;

.field private out:Ljava/io/OutputStream;

.field private final streamFlags:Lorg/tukaani/xz/common/StreamFlags;

.field private final tempBuf:[B


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;Lorg/tukaani/xz/FilterOptions;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x4

    invoke-direct {p0, p1, p2, v0}, Lorg/tukaani/xz/XZOutputStream;-><init>(Ljava/io/OutputStream;Lorg/tukaani/xz/FilterOptions;I)V

    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Lorg/tukaani/xz/FilterOptions;I)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    new-array v0, v0, [Lorg/tukaani/xz/FilterOptions;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-direct {p0, p1, v0, p3}, Lorg/tukaani/xz/XZOutputStream;-><init>(Ljava/io/OutputStream;[Lorg/tukaani/xz/FilterOptions;I)V

    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;[Lorg/tukaani/xz/FilterOptions;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x4

    invoke-direct {p0, p1, p2, v0}, Lorg/tukaani/xz/XZOutputStream;-><init>(Ljava/io/OutputStream;[Lorg/tukaani/xz/FilterOptions;I)V

    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;[Lorg/tukaani/xz/FilterOptions;I)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    invoke-direct {p0}, Lorg/tukaani/xz/FinishableOutputStream;-><init>()V

    new-instance v0, Lorg/tukaani/xz/common/StreamFlags;

    invoke-direct {v0}, Lorg/tukaani/xz/common/StreamFlags;-><init>()V

    iput-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->streamFlags:Lorg/tukaani/xz/common/StreamFlags;

    new-instance v0, Lorg/tukaani/xz/index/IndexEncoder;

    invoke-direct {v0}, Lorg/tukaani/xz/index/IndexEncoder;-><init>()V

    iput-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->index:Lorg/tukaani/xz/index/IndexEncoder;

    iput-object v1, p0, Lorg/tukaani/xz/XZOutputStream;->blockEncoder:Lorg/tukaani/xz/BlockOutputStream;

    iput-object v1, p0, Lorg/tukaani/xz/XZOutputStream;->exception:Ljava/io/IOException;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/tukaani/xz/XZOutputStream;->finished:Z

    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->tempBuf:[B

    iput-object p1, p0, Lorg/tukaani/xz/XZOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {p0, p2}, Lorg/tukaani/xz/XZOutputStream;->updateFilters([Lorg/tukaani/xz/FilterOptions;)V

    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->streamFlags:Lorg/tukaani/xz/common/StreamFlags;

    iput p3, v0, Lorg/tukaani/xz/common/StreamFlags;->checkType:I

    invoke-static {p3}, Lorg/tukaani/xz/check/Check;->getInstance(I)Lorg/tukaani/xz/check/Check;

    move-result-object v0

    iput-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->check:Lorg/tukaani/xz/check/Check;

    invoke-direct {p0}, Lorg/tukaani/xz/XZOutputStream;->encodeStreamHeader()V

    return-void
.end method

.method private encodeStreamFlags([BI)V
    .registers 5

    const/4 v0, 0x0

    aput-byte v0, p1, p2

    add-int/lit8 v0, p2, 0x1

    iget-object v1, p0, Lorg/tukaani/xz/XZOutputStream;->streamFlags:Lorg/tukaani/xz/common/StreamFlags;

    iget v1, v1, Lorg/tukaani/xz/common/StreamFlags;->checkType:I

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    return-void
.end method

.method private encodeStreamFooter()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v6, 0x4

    const/4 v0, 0x6

    new-array v1, v0, [B

    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->index:Lorg/tukaani/xz/index/IndexEncoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/index/IndexEncoder;->getIndexSize()J

    move-result-wide v2

    const-wide/16 v4, 0x4

    div-long/2addr v2, v4

    const-wide/16 v4, 0x1

    sub-long/2addr v2, v4

    const/4 v0, 0x0

    :goto_11
    if-ge v0, v6, :cond_1e

    mul-int/lit8 v4, v0, 0x8

    ushr-long v4, v2, v4

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_11

    :cond_1e
    invoke-direct {p0, v1, v6}, Lorg/tukaani/xz/XZOutputStream;->encodeStreamFlags([BI)V

    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->out:Ljava/io/OutputStream;

    invoke-static {v0, v1}, Lorg/tukaani/xz/common/EncoderUtil;->writeCRC32(Ljava/io/OutputStream;[B)V

    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->out:Ljava/io/OutputStream;

    sget-object v1, Lorg/tukaani/xz/XZ;->FOOTER_MAGIC:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    return-void
.end method

.method private encodeStreamHeader()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->out:Ljava/io/OutputStream;

    sget-object v1, Lorg/tukaani/xz/XZ;->HEADER_MAGIC:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    const/4 v0, 0x2

    new-array v0, v0, [B

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/tukaani/xz/XZOutputStream;->encodeStreamFlags([BI)V

    iget-object v1, p0, Lorg/tukaani/xz/XZOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    iget-object v1, p0, Lorg/tukaani/xz/XZOutputStream;->out:Ljava/io/OutputStream;

    invoke-static {v1, v0}, Lorg/tukaani/xz/common/EncoderUtil;->writeCRC32(Ljava/io/OutputStream;[B)V

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

    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->out:Ljava/io/OutputStream;

    if-eqz v0, :cond_f

    :try_start_4
    invoke-virtual {p0}, Lorg/tukaani/xz/XZOutputStream;->finish()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_7} :catch_1e

    :goto_7
    :try_start_7
    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_c} :catch_16

    :cond_c
    :goto_c
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->out:Ljava/io/OutputStream;

    :cond_f
    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_20

    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->exception:Ljava/io/IOException;

    throw v0

    :catch_16
    move-exception v0

    iget-object v1, p0, Lorg/tukaani/xz/XZOutputStream;->exception:Ljava/io/IOException;

    if-nez v1, :cond_c

    iput-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->exception:Ljava/io/IOException;

    goto :goto_c

    :catch_1e
    move-exception v0

    goto :goto_7

    :cond_20
    return-void
.end method

.method public endBlock()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_7
    iget-boolean v0, p0, Lorg/tukaani/xz/XZOutputStream;->finished:Z

    if-eqz v0, :cond_13

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream finished or closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_13
    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->blockEncoder:Lorg/tukaani/xz/BlockOutputStream;

    if-eqz v0, :cond_30

    :try_start_17
    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->blockEncoder:Lorg/tukaani/xz/BlockOutputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/BlockOutputStream;->finish()V

    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->index:Lorg/tukaani/xz/index/IndexEncoder;

    iget-object v1, p0, Lorg/tukaani/xz/XZOutputStream;->blockEncoder:Lorg/tukaani/xz/BlockOutputStream;

    invoke-virtual {v1}, Lorg/tukaani/xz/BlockOutputStream;->getUnpaddedSize()J

    move-result-wide v1

    iget-object v3, p0, Lorg/tukaani/xz/XZOutputStream;->blockEncoder:Lorg/tukaani/xz/BlockOutputStream;

    invoke-virtual {v3}, Lorg/tukaani/xz/BlockOutputStream;->getUncompressedSize()J

    move-result-wide v3

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/tukaani/xz/index/IndexEncoder;->add(JJ)V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->blockEncoder:Lorg/tukaani/xz/BlockOutputStream;
    :try_end_30
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_30} :catch_31

    :cond_30
    return-void

    :catch_31
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->exception:Ljava/io/IOException;

    throw v0
.end method

.method public finish()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Lorg/tukaani/xz/XZOutputStream;->finished:Z

    if-nez v0, :cond_14

    invoke-virtual {p0}, Lorg/tukaani/xz/XZOutputStream;->endBlock()V

    :try_start_7
    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->index:Lorg/tukaani/xz/index/IndexEncoder;

    iget-object v1, p0, Lorg/tukaani/xz/XZOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, v1}, Lorg/tukaani/xz/index/IndexEncoder;->encode(Ljava/io/OutputStream;)V

    invoke-direct {p0}, Lorg/tukaani/xz/XZOutputStream;->encodeStreamFooter()V
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_11} :catch_15

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/tukaani/xz/XZOutputStream;->finished:Z

    :cond_14
    return-void

    :catch_15
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->exception:Ljava/io/IOException;

    throw v0
.end method

.method public flush()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_7
    iget-boolean v0, p0, Lorg/tukaani/xz/XZOutputStream;->finished:Z

    if-eqz v0, :cond_13

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream finished or closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_13
    :try_start_13
    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->blockEncoder:Lorg/tukaani/xz/BlockOutputStream;

    if-eqz v0, :cond_2e

    iget-boolean v0, p0, Lorg/tukaani/xz/XZOutputStream;->filtersSupportFlushing:Z

    if-eqz v0, :cond_21

    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->blockEncoder:Lorg/tukaani/xz/BlockOutputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/BlockOutputStream;->flush()V

    :goto_20
    return-void

    :cond_21
    invoke-virtual {p0}, Lorg/tukaani/xz/XZOutputStream;->endBlock()V

    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_29
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_29} :catch_2a

    goto :goto_20

    :catch_2a
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_2e
    :try_start_2e
    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_33} :catch_2a

    goto :goto_20
.end method

.method public updateFilters(Lorg/tukaani/xz/FilterOptions;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/tukaani/xz/XZIOException;
        }
    .end annotation

    const/4 v0, 0x1

    new-array v0, v0, [Lorg/tukaani/xz/FilterOptions;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0}, Lorg/tukaani/xz/XZOutputStream;->updateFilters([Lorg/tukaani/xz/FilterOptions;)V

    return-void
.end method

.method public updateFilters([Lorg/tukaani/xz/FilterOptions;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/tukaani/xz/XZIOException;
        }
    .end annotation

    const/4 v2, 0x1

    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->blockEncoder:Lorg/tukaani/xz/BlockOutputStream;

    if-eqz v0, :cond_d

    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    const-string v1, "Changing filter options in the middle of a XZ Block not implemented"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d
    array-length v0, p1

    if-lt v0, v2, :cond_14

    array-length v0, p1

    const/4 v1, 0x4

    if-le v0, v1, :cond_1c

    :cond_14
    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    const-string v1, "XZ filter chain must be 1-4 filters"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1c
    iput-boolean v2, p0, Lorg/tukaani/xz/XZOutputStream;->filtersSupportFlushing:Z

    array-length v0, p1

    new-array v1, v0, [Lorg/tukaani/xz/FilterEncoder;

    const/4 v0, 0x0

    :goto_22
    array-length v2, p1

    if-ge v0, v2, :cond_3b

    aget-object v2, p1, v0

    invoke-virtual {v2}, Lorg/tukaani/xz/FilterOptions;->getFilterEncoder()Lorg/tukaani/xz/FilterEncoder;

    move-result-object v2

    aput-object v2, v1, v0

    iget-boolean v2, p0, Lorg/tukaani/xz/XZOutputStream;->filtersSupportFlushing:Z

    aget-object v3, v1, v0

    invoke-interface {v3}, Lorg/tukaani/xz/FilterEncoder;->supportsFlushing()Z

    move-result v3

    and-int/2addr v2, v3

    iput-boolean v2, p0, Lorg/tukaani/xz/XZOutputStream;->filtersSupportFlushing:Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_22

    :cond_3b
    invoke-static {v1}, Lorg/tukaani/xz/RawCoder;->validate([Lorg/tukaani/xz/FilterCoder;)V

    iput-object v1, p0, Lorg/tukaani/xz/XZOutputStream;->filters:[Lorg/tukaani/xz/FilterEncoder;

    return-void
.end method

.method public write(I)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v2, 0x0

    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->tempBuf:[B

    int-to-byte v1, p1

    aput-byte v1, v0, v2

    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->tempBuf:[B

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v2, v1}, Lorg/tukaani/xz/XZOutputStream;->write([BII)V

    return-void
.end method

.method public write([BII)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-ltz p2, :cond_d

    if-ltz p3, :cond_d

    add-int v0, p2, p3

    if-ltz v0, :cond_d

    add-int v0, p2, p3

    array-length v1, p1

    if-le v0, v1, :cond_13

    :cond_d
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    :cond_13
    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_1a
    iget-boolean v0, p0, Lorg/tukaani/xz/XZOutputStream;->finished:Z

    if-eqz v0, :cond_26

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream finished or closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_26
    :try_start_26
    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->blockEncoder:Lorg/tukaani/xz/BlockOutputStream;

    if-nez v0, :cond_37

    new-instance v0, Lorg/tukaani/xz/BlockOutputStream;

    iget-object v1, p0, Lorg/tukaani/xz/XZOutputStream;->out:Ljava/io/OutputStream;

    iget-object v2, p0, Lorg/tukaani/xz/XZOutputStream;->filters:[Lorg/tukaani/xz/FilterEncoder;

    iget-object v3, p0, Lorg/tukaani/xz/XZOutputStream;->check:Lorg/tukaani/xz/check/Check;

    invoke-direct {v0, v1, v2, v3}, Lorg/tukaani/xz/BlockOutputStream;-><init>(Ljava/io/OutputStream;[Lorg/tukaani/xz/FilterEncoder;Lorg/tukaani/xz/check/Check;)V

    iput-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->blockEncoder:Lorg/tukaani/xz/BlockOutputStream;

    :cond_37
    iget-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->blockEncoder:Lorg/tukaani/xz/BlockOutputStream;

    invoke-virtual {v0, p1, p2, p3}, Lorg/tukaani/xz/BlockOutputStream;->write([BII)V
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_3c} :catch_3d

    return-void

    :catch_3d
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/XZOutputStream;->exception:Ljava/io/IOException;

    throw v0
.end method
