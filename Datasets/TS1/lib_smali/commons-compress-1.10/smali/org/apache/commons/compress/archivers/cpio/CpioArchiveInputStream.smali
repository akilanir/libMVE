.class public Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;
.super Lorg/apache/commons/compress/archivers/ArchiveInputStream;
.source "CpioArchiveInputStream.java"

# interfaces
.implements Lorg/apache/commons/compress/archivers/cpio/CpioConstants;


# instance fields
.field private final FOUR_BYTES_BUF:[B

.field private final SIX_BYTES_BUF:[B

.field private final TWO_BYTES_BUF:[B

.field private final blockSize:I

.field private closed:Z

.field private crc:J

.field final encoding:Ljava/lang/String;

.field private entry:Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

.field private entryBytesRead:J

.field private entryEOF:Z

.field private final in:Ljava/io/InputStream;

.field private final tmpbuf:[B

.field private final zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 108
    const/16 v0, 0x200

    const-string v1, "US-ASCII"

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;-><init>(Ljava/io/InputStream;ILjava/lang/String;)V

    .line 109
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "blockSize"    # I

    .prologue
    .line 138
    const-string v0, "US-ASCII"

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;-><init>(Ljava/io/InputStream;ILjava/lang/String;)V

    .line 139
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;ILjava/lang/String;)V
    .registers 7
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "blockSize"    # I
    .param p3, "encoding"    # Ljava/lang/String;

    .prologue
    const-wide/16 v1, 0x0

    const/4 v0, 0x0

    .line 153
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/ArchiveInputStream;-><init>()V

    .line 70
    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->closed:Z

    .line 74
    iput-wide v1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entryBytesRead:J

    .line 76
    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entryEOF:Z

    .line 78
    const/16 v0, 0x1000

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->tmpbuf:[B

    .line 80
    iput-wide v1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->crc:J

    .line 85
    const/4 v0, 0x2

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->TWO_BYTES_BUF:[B

    .line 86
    const/4 v0, 0x4

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->FOUR_BYTES_BUF:[B

    .line 87
    const/4 v0, 0x6

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->SIX_BYTES_BUF:[B

    .line 154
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->in:Ljava/io/InputStream;

    .line 155
    iput p2, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->blockSize:I

    .line 156
    iput-object p3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->encoding:Ljava/lang/String;

    .line 157
    invoke-static {p3}, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    .line 158
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "encoding"    # Ljava/lang/String;

    .prologue
    .line 123
    const/16 v0, 0x200

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;-><init>(Ljava/io/InputStream;ILjava/lang/String;)V

    .line 124
    return-void
.end method

.method private closeEntry()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/32 v2, 0x7fffffff

    .line 206
    :cond_3
    invoke-virtual {p0, v2, v3}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->skip(J)J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_3

    .line 209
    return-void
.end method

.method private ensureOpen()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 218
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->closed:Z

    if-eqz v0, :cond_c

    .line 219
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Stream closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 221
    :cond_c
    return-void
.end method

.method public static matches([BI)Z
    .registers 9
    .param p0, "signature"    # [B
    .param p1, "length"    # I

    .prologue
    const/16 v6, 0x37

    const/16 v5, 0x30

    const/4 v4, 0x5

    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 527
    const/4 v2, 0x6

    if-ge p1, v2, :cond_b

    .line 567
    :cond_a
    :goto_a
    return v0

    .line 532
    :cond_b
    aget-byte v2, p0, v0

    const/16 v3, 0x71

    if-ne v2, v3, :cond_1b

    aget-byte v2, p0, v1

    and-int/lit16 v2, v2, 0xff

    const/16 v3, 0xc7

    if-ne v2, v3, :cond_1b

    move v0, v1

    .line 533
    goto :goto_a

    .line 535
    :cond_1b
    aget-byte v2, p0, v1

    const/16 v3, 0x71

    if-ne v2, v3, :cond_2b

    aget-byte v2, p0, v0

    and-int/lit16 v2, v2, 0xff

    const/16 v3, 0xc7

    if-ne v2, v3, :cond_2b

    move v0, v1

    .line 536
    goto :goto_a

    .line 541
    :cond_2b
    aget-byte v2, p0, v0

    if-ne v2, v5, :cond_a

    .line 544
    aget-byte v2, p0, v1

    if-ne v2, v6, :cond_a

    .line 547
    const/4 v2, 0x2

    aget-byte v2, p0, v2

    if-ne v2, v5, :cond_a

    .line 550
    const/4 v2, 0x3

    aget-byte v2, p0, v2

    if-ne v2, v6, :cond_a

    .line 553
    const/4 v2, 0x4

    aget-byte v2, p0, v2

    if-ne v2, v5, :cond_a

    .line 557
    aget-byte v2, p0, v4

    const/16 v3, 0x31

    if-ne v2, v3, :cond_4a

    move v0, v1

    .line 558
    goto :goto_a

    .line 560
    :cond_4a
    aget-byte v2, p0, v4

    const/16 v3, 0x32

    if-ne v2, v3, :cond_52

    move v0, v1

    .line 561
    goto :goto_a

    .line 563
    :cond_52
    aget-byte v2, p0, v4

    if-ne v2, v6, :cond_a

    move v0, v1

    .line 564
    goto :goto_a
.end method

.method private readAsciiLong(II)J
    .registers 6
    .param p1, "length"    # I
    .param p2, "radix"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 354
    new-array v0, p1, [B

    .line 355
    .local v0, "tmpBuffer":[B
    const/4 v1, 0x0

    array-length v2, v0

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readFully([BII)I

    .line 356
    invoke-static {v0}, Lorg/apache/commons/compress/utils/ArchiveUtils;->toAsciiString([B)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v1

    return-wide v1
.end method

.method private readBinaryLong(IZ)J
    .registers 6
    .param p1, "length"    # I
    .param p2, "swapHalfWord"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 347
    new-array v0, p1, [B

    .line 348
    .local v0, "tmp":[B
    const/4 v1, 0x0

    array-length v2, v0

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readFully([BII)I

    .line 349
    invoke-static {v0, p2}, Lorg/apache/commons/compress/archivers/cpio/CpioUtil;->byteArray2long([BZ)J

    move-result-wide v1

    return-wide v1
.end method

.method private readCString(I)Ljava/lang/String;
    .registers 5
    .param p1, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 448
    add-int/lit8 v1, p1, -0x1

    new-array v0, v1, [B

    .line 449
    .local v0, "tmpBuffer":[B
    const/4 v1, 0x0

    array-length v2, v0

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readFully([BII)I

    .line 450
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    .line 451
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-interface {v1, v0}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->decode([B)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private final readFully([BII)I
    .registers 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 337
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->in:Ljava/io/InputStream;

    invoke-static {v1, p1, p2, p3}, Lorg/apache/commons/compress/utils/IOUtils;->readFully(Ljava/io/InputStream;[BII)I

    move-result v0

    .line 338
    .local v0, "count":I
    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->count(I)V

    .line 339
    if-ge v0, p3, :cond_11

    .line 340
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 342
    :cond_11
    return v0
.end method

.method private readNewEntry(Z)Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;
    .registers 14
    .param p1, "hasCrc"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v10, 0x0

    const/16 v9, 0x10

    const/16 v8, 0x8

    .line 362
    if-eqz p1, :cond_ad

    .line 363
    new-instance v5, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    const/4 v6, 0x2

    invoke-direct {v5, v6}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;-><init>(S)V

    .line 368
    .local v5, "ret":Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;
    :goto_e
    invoke-direct {p0, v8, v9}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setInode(J)V

    .line 369
    invoke-direct {p0, v8, v9}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v0

    .line 370
    .local v0, "mode":J
    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioUtil;->fileType(J)J

    move-result-wide v6

    cmp-long v6, v6, v10

    if-eqz v6, :cond_24

    .line 371
    invoke-virtual {v5, v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setMode(J)V

    .line 373
    :cond_24
    invoke-direct {p0, v8, v9}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setUID(J)V

    .line 374
    invoke-direct {p0, v8, v9}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setGID(J)V

    .line 375
    invoke-direct {p0, v8, v9}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setNumberOfLinks(J)V

    .line 376
    invoke-direct {p0, v8, v9}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setTime(J)V

    .line 377
    invoke-direct {p0, v8, v9}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setSize(J)V

    .line 378
    invoke-direct {p0, v8, v9}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setDeviceMaj(J)V

    .line 379
    invoke-direct {p0, v8, v9}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setDeviceMin(J)V

    .line 380
    invoke-direct {p0, v8, v9}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setRemoteDeviceMaj(J)V

    .line 381
    invoke-direct {p0, v8, v9}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setRemoteDeviceMin(J)V

    .line 382
    invoke-direct {p0, v8, v9}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v3

    .line 383
    .local v3, "namesize":J
    invoke-direct {p0, v8, v9}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setChksum(J)V

    .line 384
    long-to-int v6, v3

    invoke-direct {p0, v6}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readCString(I)Ljava/lang/String;

    move-result-object v2

    .line 385
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v5, v2}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setName(Ljava/lang/String;)V

    .line 386
    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioUtil;->fileType(J)J

    move-result-wide v6

    cmp-long v6, v6, v10

    if-nez v6, :cond_b5

    const-string v6, "TRAILER!!!"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_b5

    .line 387
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Mode 0 only allowed in the trailer. Found entry name: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " Occured at byte: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->getBytesRead()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 365
    .end local v0    # "mode":J
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "namesize":J
    .end local v5    # "ret":Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;
    :cond_ad
    new-instance v5, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    const/4 v6, 0x1

    invoke-direct {v5, v6}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;-><init>(S)V

    .restart local v5    # "ret":Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;
    goto/16 :goto_e

    .line 389
    .restart local v0    # "mode":J
    .restart local v2    # "name":Ljava/lang/String;
    .restart local v3    # "namesize":J
    :cond_b5
    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->getHeaderPadCount()I

    move-result v6

    invoke-direct {p0, v6}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->skip(I)V

    .line 391
    return-object v5
.end method

.method private readOldAsciiEntry()Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v11, 0x0

    const/16 v10, 0xb

    const/4 v9, 0x6

    const/16 v8, 0x8

    .line 395
    new-instance v5, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    const/4 v6, 0x4

    invoke-direct {v5, v6}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;-><init>(S)V

    .line 397
    .local v5, "ret":Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;
    invoke-direct {p0, v9, v8}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setDevice(J)V

    .line 398
    invoke-direct {p0, v9, v8}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setInode(J)V

    .line 399
    invoke-direct {p0, v9, v8}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v0

    .line 400
    .local v0, "mode":J
    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioUtil;->fileType(J)J

    move-result-wide v6

    cmp-long v6, v6, v11

    if-eqz v6, :cond_2a

    .line 401
    invoke-virtual {v5, v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setMode(J)V

    .line 403
    :cond_2a
    invoke-direct {p0, v9, v8}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setUID(J)V

    .line 404
    invoke-direct {p0, v9, v8}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setGID(J)V

    .line 405
    invoke-direct {p0, v9, v8}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setNumberOfLinks(J)V

    .line 406
    invoke-direct {p0, v9, v8}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setRemoteDevice(J)V

    .line 407
    invoke-direct {p0, v10, v8}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setTime(J)V

    .line 408
    invoke-direct {p0, v9, v8}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v3

    .line 409
    .local v3, "namesize":J
    invoke-direct {p0, v10, v8}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readAsciiLong(II)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setSize(J)V

    .line 410
    long-to-int v6, v3

    invoke-direct {p0, v6}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readCString(I)Ljava/lang/String;

    move-result-object v2

    .line 411
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v5, v2}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setName(Ljava/lang/String;)V

    .line 412
    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioUtil;->fileType(J)J

    move-result-wide v6

    cmp-long v6, v6, v11

    if-nez v6, :cond_97

    const-string v6, "TRAILER!!!"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_97

    .line 413
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Mode 0 only allowed in the trailer. Found entry: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " Occured at byte: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->getBytesRead()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 416
    :cond_97
    return-object v5
.end method

.method private readOldBinaryEntry(Z)Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;
    .registers 14
    .param p1, "swapHalfWord"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v10, 0x0

    const/4 v9, 0x4

    const/4 v8, 0x2

    .line 421
    new-instance v5, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    const/16 v6, 0x8

    invoke-direct {v5, v6}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;-><init>(S)V

    .line 423
    .local v5, "ret":Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;
    invoke-direct {p0, v8, p1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readBinaryLong(IZ)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setDevice(J)V

    .line 424
    invoke-direct {p0, v8, p1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readBinaryLong(IZ)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setInode(J)V

    .line 425
    invoke-direct {p0, v8, p1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readBinaryLong(IZ)J

    move-result-wide v0

    .line 426
    .local v0, "mode":J
    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioUtil;->fileType(J)J

    move-result-wide v6

    cmp-long v6, v6, v10

    if-eqz v6, :cond_28

    .line 427
    invoke-virtual {v5, v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setMode(J)V

    .line 429
    :cond_28
    invoke-direct {p0, v8, p1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readBinaryLong(IZ)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setUID(J)V

    .line 430
    invoke-direct {p0, v8, p1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readBinaryLong(IZ)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setGID(J)V

    .line 431
    invoke-direct {p0, v8, p1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readBinaryLong(IZ)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setNumberOfLinks(J)V

    .line 432
    invoke-direct {p0, v8, p1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readBinaryLong(IZ)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setRemoteDevice(J)V

    .line 433
    invoke-direct {p0, v9, p1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readBinaryLong(IZ)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setTime(J)V

    .line 434
    invoke-direct {p0, v8, p1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readBinaryLong(IZ)J

    move-result-wide v3

    .line 435
    .local v3, "namesize":J
    invoke-direct {p0, v9, p1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readBinaryLong(IZ)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setSize(J)V

    .line 436
    long-to-int v6, v3

    invoke-direct {p0, v6}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readCString(I)Ljava/lang/String;

    move-result-object v2

    .line 437
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v5, v2}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setName(Ljava/lang/String;)V

    .line 438
    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioUtil;->fileType(J)J

    move-result-wide v6

    cmp-long v6, v6, v10

    if-nez v6, :cond_95

    const-string v6, "TRAILER!!!"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_95

    .line 439
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Mode 0 only allowed in the trailer. Found entry: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "Occured at byte: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->getBytesRead()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 441
    :cond_95
    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->getHeaderPadCount()I

    move-result v6

    invoke-direct {p0, v6}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->skip(I)V

    .line 443
    return-object v5
.end method

.method private skip(I)V
    .registers 4
    .param p1, "bytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 274
    if-lez p1, :cond_8

    .line 275
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->FOUR_BYTES_BUF:[B

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readFully([BII)I

    .line 277
    :cond_8
    return-void
.end method

.method private skipRemainderOfLastBlock()V
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x0

    .line 498
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->getBytesRead()J

    move-result-wide v8

    iget v10, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->blockSize:I

    int-to-long v10, v10

    rem-long v0, v8, v10

    .line 499
    .local v0, "readFromLastBlock":J
    cmp-long v8, v0, v6

    if-nez v8, :cond_21

    move-wide v2, v6

    .line 501
    .local v2, "remainingBytes":J
    :goto_10
    cmp-long v8, v2, v6

    if-lez v8, :cond_20

    .line 502
    iget v8, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->blockSize:I

    int-to-long v8, v8

    sub-long/2addr v8, v0

    invoke-virtual {p0, v8, v9}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->skip(J)J

    move-result-wide v4

    .line 503
    .local v4, "skipped":J
    cmp-long v8, v4, v6

    if-gtz v8, :cond_27

    .line 508
    .end local v4    # "skipped":J
    :cond_20
    return-void

    .line 499
    .end local v2    # "remainingBytes":J
    :cond_21
    iget v8, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->blockSize:I

    int-to-long v8, v8

    sub-long v2, v8, v0

    goto :goto_10

    .line 506
    .restart local v2    # "remainingBytes":J
    .restart local v4    # "skipped":J
    :cond_27
    sub-long/2addr v2, v4

    .line 507
    goto :goto_10
.end method


# virtual methods
.method public available()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 174
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->ensureOpen()V

    .line 175
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entryEOF:Z

    if-eqz v0, :cond_9

    .line 176
    const/4 v0, 0x0

    .line 178
    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x1

    goto :goto_8
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 189
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->closed:Z

    if-nez v0, :cond_c

    .line 190
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 191
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->closed:Z

    .line 193
    :cond_c
    return-void
.end method

.method public getNextCPIOEntry()Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x71c7

    const-wide/16 v6, 0x0

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 233
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->ensureOpen()V

    .line 234
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entry:Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    if-eqz v1, :cond_10

    .line 235
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->closeEntry()V

    .line 237
    :cond_10
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->TWO_BYTES_BUF:[B

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->TWO_BYTES_BUF:[B

    array-length v2, v2

    invoke-direct {p0, v1, v4, v2}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readFully([BII)I

    .line 238
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->TWO_BYTES_BUF:[B

    invoke-static {v1, v4}, Lorg/apache/commons/compress/archivers/cpio/CpioUtil;->byteArray2long([BZ)J

    move-result-wide v1

    cmp-long v1, v1, v8

    if-nez v1, :cond_43

    .line 239
    invoke-direct {p0, v4}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readOldBinaryEntry(Z)Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entry:Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    .line 260
    :goto_28
    iput-wide v6, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entryBytesRead:J

    .line 261
    iput-boolean v4, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entryEOF:Z

    .line 262
    iput-wide v6, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->crc:J

    .line 264
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entry:Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "TRAILER!!!"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c3

    .line 265
    iput-boolean v5, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entryEOF:Z

    .line 266
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->skipRemainderOfLastBlock()V

    .line 267
    const/4 v1, 0x0

    .line 269
    :goto_42
    return-object v1

    .line 240
    :cond_43
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->TWO_BYTES_BUF:[B

    invoke-static {v1, v5}, Lorg/apache/commons/compress/archivers/cpio/CpioUtil;->byteArray2long([BZ)J

    move-result-wide v1

    cmp-long v1, v1, v8

    if-nez v1, :cond_54

    .line 242
    invoke-direct {p0, v5}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readOldBinaryEntry(Z)Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entry:Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    goto :goto_28

    .line 244
    :cond_54
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->TWO_BYTES_BUF:[B

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->SIX_BYTES_BUF:[B

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->TWO_BYTES_BUF:[B

    array-length v3, v3

    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 246
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->SIX_BYTES_BUF:[B

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->TWO_BYTES_BUF:[B

    array-length v2, v2

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->FOUR_BYTES_BUF:[B

    array-length v3, v3

    invoke-direct {p0, v1, v2, v3}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readFully([BII)I

    .line 248
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->SIX_BYTES_BUF:[B

    invoke-static {v1}, Lorg/apache/commons/compress/utils/ArchiveUtils;->toAsciiString([B)Ljava/lang/String;

    move-result-object v0

    .line 249
    .local v0, "magicString":Ljava/lang/String;
    const-string v1, "070701"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7e

    .line 250
    invoke-direct {p0, v4}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readNewEntry(Z)Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entry:Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    goto :goto_28

    .line 251
    :cond_7e
    const-string v1, "070702"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8d

    .line 252
    invoke-direct {p0, v5}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readNewEntry(Z)Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entry:Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    goto :goto_28

    .line 253
    :cond_8d
    const-string v1, "070707"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9c

    .line 254
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readOldAsciiEntry()Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entry:Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    goto :goto_28

    .line 256
    :cond_9c
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown magic ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]. Occured at byte: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->getBytesRead()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 269
    .end local v0    # "magicString":Ljava/lang/String;
    :cond_c3
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entry:Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    goto/16 :goto_42
.end method

.method public getNextEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 491
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->getNextCPIOEntry()Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    move-result-object v0

    return-object v0
.end method

.method public read([BII)I
    .registers 14
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x2

    const/4 v2, -0x1

    .line 298
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->ensureOpen()V

    .line 299
    if-ltz p2, :cond_d

    if-ltz p3, :cond_d

    array-length v3, p1

    sub-int/2addr v3, p3

    if-le p2, v3, :cond_13

    .line 300
    :cond_d
    new-instance v3, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v3}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v3

    .line 301
    :cond_13
    if-nez p3, :cond_17

    .line 302
    const/4 v2, 0x0

    .line 332
    :cond_16
    :goto_16
    return v2

    .line 305
    :cond_17
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entry:Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    if-eqz v3, :cond_16

    iget-boolean v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entryEOF:Z

    if-nez v3, :cond_16

    .line 308
    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entryBytesRead:J

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entry:Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->getSize()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-nez v3, :cond_68

    .line 309
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entry:Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->getDataPadCount()I

    move-result v3

    invoke-direct {p0, v3}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->skip(I)V

    .line 310
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entryEOF:Z

    .line 311
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entry:Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->getFormat()S

    move-result v3

    if-ne v3, v9, :cond_16

    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->crc:J

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entry:Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->getChksum()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-eqz v3, :cond_16

    .line 313
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "CRC Error. Occured at byte: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->getBytesRead()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 318
    :cond_68
    int-to-long v3, p3

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entry:Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->getSize()J

    move-result-wide v5

    iget-wide v7, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entryBytesRead:J

    sub-long/2addr v5, v7

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int v1, v3

    .line 320
    .local v1, "tmplength":I
    if-ltz v1, :cond_16

    .line 324
    invoke-direct {p0, p1, p2, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->readFully([BII)I

    move-result v2

    .line 325
    .local v2, "tmpread":I
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entry:Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->getFormat()S

    move-result v3

    if-ne v3, v9, :cond_95

    .line 326
    const/4 v0, 0x0

    .local v0, "pos":I
    :goto_86
    if-ge v0, v2, :cond_95

    .line 327
    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->crc:J

    aget-byte v5, p1, v0

    and-int/lit16 v5, v5, 0xff

    int-to-long v5, v5

    add-long/2addr v3, v5

    iput-wide v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->crc:J

    .line 326
    add-int/lit8 v0, v0, 0x1

    goto :goto_86

    .line 330
    .end local v0    # "pos":I
    :cond_95
    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entryBytesRead:J

    int-to-long v5, v2

    add-long/2addr v3, v5

    iput-wide v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entryBytesRead:J

    goto/16 :goto_16
.end method

.method public skip(J)J
    .registers 8
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 467
    const-wide/16 v3, 0x0

    cmp-long v3, p1, v3

    if-gez v3, :cond_e

    .line 468
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "negative skip length"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 470
    :cond_e
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->ensureOpen()V

    .line 471
    const-wide/32 v3, 0x7fffffff

    invoke-static {p1, p2, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int v1, v3

    .line 472
    .local v1, "max":I
    const/4 v2, 0x0

    .line 474
    .local v2, "total":I
    :goto_1a
    if-ge v2, v1, :cond_33

    .line 475
    sub-int v0, v1, v2

    .line 476
    .local v0, "len":I
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->tmpbuf:[B

    array-length v3, v3

    if-le v0, v3, :cond_26

    .line 477
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->tmpbuf:[B

    array-length v0, v3

    .line 479
    :cond_26
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->tmpbuf:[B

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4, v0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->read([BII)I

    move-result v0

    .line 480
    const/4 v3, -0x1

    if-ne v0, v3, :cond_35

    .line 481
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->entryEOF:Z

    .line 486
    .end local v0    # "len":I
    :cond_33
    int-to-long v3, v2

    return-wide v3

    .line 484
    .restart local v0    # "len":I
    :cond_35
    add-int/2addr v2, v0

    .line 485
    goto :goto_1a
.end method
