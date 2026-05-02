.class public Lorg/tukaani/xz/SingleXZInputStream;
.super Ljava/io/InputStream;


# instance fields
.field private blockDecoder:Lorg/tukaani/xz/BlockInputStream;

.field private check:Lorg/tukaani/xz/check/Check;

.field private endReached:Z

.field private exception:Ljava/io/IOException;

.field private in:Ljava/io/InputStream;

.field private final indexHash:Lorg/tukaani/xz/index/IndexHash;

.field private memoryLimit:I

.field private streamHeaderFlags:Lorg/tukaani/xz/common/StreamFlags;

.field private final tempBuf:[B


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    iput-object v1, p0, Lorg/tukaani/xz/SingleXZInputStream;->blockDecoder:Lorg/tukaani/xz/BlockInputStream;

    new-instance v0, Lorg/tukaani/xz/index/IndexHash;

    invoke-direct {v0}, Lorg/tukaani/xz/index/IndexHash;-><init>()V

    iput-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->indexHash:Lorg/tukaani/xz/index/IndexHash;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->endReached:Z

    iput-object v1, p0, Lorg/tukaani/xz/SingleXZInputStream;->exception:Ljava/io/IOException;

    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->tempBuf:[B

    const/4 v0, -0x1

    invoke-direct {p0, p1, v0}, Lorg/tukaani/xz/SingleXZInputStream;->initialize(Ljava/io/InputStream;I)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    iput-object v1, p0, Lorg/tukaani/xz/SingleXZInputStream;->blockDecoder:Lorg/tukaani/xz/BlockInputStream;

    new-instance v0, Lorg/tukaani/xz/index/IndexHash;

    invoke-direct {v0}, Lorg/tukaani/xz/index/IndexHash;-><init>()V

    iput-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->indexHash:Lorg/tukaani/xz/index/IndexHash;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->endReached:Z

    iput-object v1, p0, Lorg/tukaani/xz/SingleXZInputStream;->exception:Ljava/io/IOException;

    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->tempBuf:[B

    invoke-direct {p0, p1, p2}, Lorg/tukaani/xz/SingleXZInputStream;->initialize(Ljava/io/InputStream;I)V

    return-void
.end method

.method constructor <init>(Ljava/io/InputStream;I[B)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    iput-object v1, p0, Lorg/tukaani/xz/SingleXZInputStream;->blockDecoder:Lorg/tukaani/xz/BlockInputStream;

    new-instance v0, Lorg/tukaani/xz/index/IndexHash;

    invoke-direct {v0}, Lorg/tukaani/xz/index/IndexHash;-><init>()V

    iput-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->indexHash:Lorg/tukaani/xz/index/IndexHash;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->endReached:Z

    iput-object v1, p0, Lorg/tukaani/xz/SingleXZInputStream;->exception:Ljava/io/IOException;

    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->tempBuf:[B

    invoke-direct {p0, p1, p2, p3}, Lorg/tukaani/xz/SingleXZInputStream;->initialize(Ljava/io/InputStream;I[B)V

    return-void
.end method

.method private initialize(Ljava/io/InputStream;I)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xc

    new-array v0, v0, [B

    new-instance v1, Ljava/io/DataInputStream;

    invoke-direct {v1, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v1, v0}, Ljava/io/DataInputStream;->readFully([B)V

    invoke-direct {p0, p1, p2, v0}, Lorg/tukaani/xz/SingleXZInputStream;->initialize(Ljava/io/InputStream;I[B)V

    return-void
.end method

.method private initialize(Ljava/io/InputStream;I[B)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iput-object p1, p0, Lorg/tukaani/xz/SingleXZInputStream;->in:Ljava/io/InputStream;

    iput p2, p0, Lorg/tukaani/xz/SingleXZInputStream;->memoryLimit:I

    invoke-static {p3}, Lorg/tukaani/xz/common/DecoderUtil;->decodeStreamHeader([B)Lorg/tukaani/xz/common/StreamFlags;

    move-result-object v0

    iput-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->streamHeaderFlags:Lorg/tukaani/xz/common/StreamFlags;

    iget-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->streamHeaderFlags:Lorg/tukaani/xz/common/StreamFlags;

    iget v0, v0, Lorg/tukaani/xz/common/StreamFlags;->checkType:I

    invoke-static {v0}, Lorg/tukaani/xz/check/Check;->getInstance(I)Lorg/tukaani/xz/check/Check;

    move-result-object v0

    iput-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->check:Lorg/tukaani/xz/check/Check;

    return-void
.end method

.method private validateStreamFooter()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xc

    new-array v0, v0, [B

    new-instance v1, Ljava/io/DataInputStream;

    iget-object v2, p0, Lorg/tukaani/xz/SingleXZInputStream;->in:Ljava/io/InputStream;

    invoke-direct {v1, v2}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v1, v0}, Ljava/io/DataInputStream;->readFully([B)V

    invoke-static {v0}, Lorg/tukaani/xz/common/DecoderUtil;->decodeStreamFooter([B)Lorg/tukaani/xz/common/StreamFlags;

    move-result-object v0

    iget-object v1, p0, Lorg/tukaani/xz/SingleXZInputStream;->streamHeaderFlags:Lorg/tukaani/xz/common/StreamFlags;

    invoke-static {v1, v0}, Lorg/tukaani/xz/common/DecoderUtil;->areStreamFlagsEqual(Lorg/tukaani/xz/common/StreamFlags;Lorg/tukaani/xz/common/StreamFlags;)Z

    move-result v1

    if-eqz v1, :cond_26

    iget-object v1, p0, Lorg/tukaani/xz/SingleXZInputStream;->indexHash:Lorg/tukaani/xz/index/IndexHash;

    invoke-virtual {v1}, Lorg/tukaani/xz/index/IndexHash;->getIndexSize()J

    move-result-wide v1

    iget-wide v3, v0, Lorg/tukaani/xz/common/StreamFlags;->backwardSize:J

    cmp-long v0, v1, v3

    if-eqz v0, :cond_2e

    :cond_26
    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    const-string v1, "XZ Stream Footer does not match Stream Header"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2e
    return-void
.end method


# virtual methods
.method public available()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->in:Ljava/io/InputStream;

    if-nez v0, :cond_c

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    iget-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_13
    iget-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->blockDecoder:Lorg/tukaani/xz/BlockInputStream;

    if-nez v0, :cond_19

    const/4 v0, 0x0

    :goto_18
    return v0

    :cond_19
    iget-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->blockDecoder:Lorg/tukaani/xz/BlockInputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/BlockInputStream;->available()I

    move-result v0

    goto :goto_18
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->in:Ljava/io/InputStream;

    if-eqz v0, :cond_c

    :try_start_5
    iget-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_d

    iput-object v1, p0, Lorg/tukaani/xz/SingleXZInputStream;->in:Ljava/io/InputStream;

    :cond_c
    return-void

    :catchall_d
    move-exception v0

    iput-object v1, p0, Lorg/tukaani/xz/SingleXZInputStream;->in:Ljava/io/InputStream;

    throw v0
.end method

.method public getCheckName()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->check:Lorg/tukaani/xz/check/Check;

    invoke-virtual {v0}, Lorg/tukaani/xz/check/Check;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCheckType()I
    .registers 2

    iget-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->streamHeaderFlags:Lorg/tukaani/xz/common/StreamFlags;

    iget v0, v0, Lorg/tukaani/xz/common/StreamFlags;->checkType:I

    return v0
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

    iget-object v1, p0, Lorg/tukaani/xz/SingleXZInputStream;->tempBuf:[B

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v3, v2}, Lorg/tukaani/xz/SingleXZInputStream;->read([BII)I

    move-result v1

    if-ne v1, v0, :cond_c

    :goto_b
    return v0

    :cond_c
    iget-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->tempBuf:[B

    aget-byte v0, v0, v3

    and-int/lit16 v0, v0, 0xff

    goto :goto_b
.end method

.method public read([BII)I
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v9, -0x1

    if-ltz p2, :cond_f

    if-ltz p3, :cond_f

    add-int v1, p2, p3

    if-ltz v1, :cond_f

    add-int v1, p2, p3

    array-length v2, p1

    if-le v1, v2, :cond_15

    :cond_f
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    :cond_15
    if-nez p3, :cond_19

    move v9, v0

    :cond_18
    :goto_18
    return v9

    :cond_19
    iget-object v1, p0, Lorg/tukaani/xz/SingleXZInputStream;->in:Ljava/io/InputStream;

    if-nez v1, :cond_25

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_25
    iget-object v1, p0, Lorg/tukaani/xz/SingleXZInputStream;->exception:Ljava/io/IOException;

    if-eqz v1, :cond_2c

    iget-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_2c
    iget-boolean v1, p0, Lorg/tukaani/xz/SingleXZInputStream;->endReached:Z

    if-nez v1, :cond_18

    move v8, v0

    move v10, p3

    move v11, p2

    :goto_33
    if-lez v10, :cond_8e

    :try_start_35
    iget-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->blockDecoder:Lorg/tukaani/xz/BlockInputStream;
    :try_end_37
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_37} :catch_88

    if-nez v0, :cond_4a

    :try_start_39
    new-instance v0, Lorg/tukaani/xz/BlockInputStream;

    iget-object v1, p0, Lorg/tukaani/xz/SingleXZInputStream;->in:Ljava/io/InputStream;

    iget-object v2, p0, Lorg/tukaani/xz/SingleXZInputStream;->check:Lorg/tukaani/xz/check/Check;

    iget v3, p0, Lorg/tukaani/xz/SingleXZInputStream;->memoryLimit:I

    const-wide/16 v4, -0x1

    const-wide/16 v6, -0x1

    invoke-direct/range {v0 .. v7}, Lorg/tukaani/xz/BlockInputStream;-><init>(Ljava/io/InputStream;Lorg/tukaani/xz/check/Check;IJJ)V

    iput-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->blockDecoder:Lorg/tukaani/xz/BlockInputStream;
    :try_end_4a
    .catch Lorg/tukaani/xz/IndexIndicatorException; {:try_start_39 .. :try_end_4a} :catch_5a
    .catch Ljava/io/IOException; {:try_start_39 .. :try_end_4a} :catch_88

    :cond_4a
    :try_start_4a
    iget-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->blockDecoder:Lorg/tukaani/xz/BlockInputStream;

    invoke-virtual {v0, p1, v11, v10}, Lorg/tukaani/xz/BlockInputStream;->read([BII)I

    move-result v0

    if-lez v0, :cond_6f

    add-int/2addr v8, v0

    add-int v1, v11, v0

    sub-int v0, v10, v0

    :goto_57
    move v10, v0

    move v11, v1

    goto :goto_33

    :catch_5a
    move-exception v0

    iget-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->indexHash:Lorg/tukaani/xz/index/IndexHash;

    iget-object v1, p0, Lorg/tukaani/xz/SingleXZInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0, v1}, Lorg/tukaani/xz/index/IndexHash;->validate(Ljava/io/InputStream;)V

    invoke-direct {p0}, Lorg/tukaani/xz/SingleXZInputStream;->validateStreamFooter()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->endReached:Z

    if-lez v8, :cond_6d

    move v0, v8

    :goto_6b
    move v9, v0

    goto :goto_18

    :cond_6d
    move v0, v9

    goto :goto_6b

    :cond_6f
    if-ne v0, v9, :cond_85

    iget-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->indexHash:Lorg/tukaani/xz/index/IndexHash;

    iget-object v1, p0, Lorg/tukaani/xz/SingleXZInputStream;->blockDecoder:Lorg/tukaani/xz/BlockInputStream;

    invoke-virtual {v1}, Lorg/tukaani/xz/BlockInputStream;->getUnpaddedSize()J

    move-result-wide v1

    iget-object v3, p0, Lorg/tukaani/xz/SingleXZInputStream;->blockDecoder:Lorg/tukaani/xz/BlockInputStream;

    invoke-virtual {v3}, Lorg/tukaani/xz/BlockInputStream;->getUncompressedSize()J

    move-result-wide v3

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/tukaani/xz/index/IndexHash;->add(JJ)V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->blockDecoder:Lorg/tukaani/xz/BlockInputStream;
    :try_end_85
    .catch Ljava/io/IOException; {:try_start_4a .. :try_end_85} :catch_88

    :cond_85
    move v0, v10

    move v1, v11

    goto :goto_57

    :catch_88
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/SingleXZInputStream;->exception:Ljava/io/IOException;

    if-nez v8, :cond_8e

    throw v0

    :cond_8e
    move v9, v8

    goto :goto_18
.end method
