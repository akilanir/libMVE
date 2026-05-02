.class public Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;
.super Lorg/apache/commons/compress/archivers/ArchiveInputStream;
.source "TarArchiveInputStream.java"


# static fields
.field private static final SMALL_BUFFER_SIZE:I = 0x100


# instance fields
.field private final SMALL_BUF:[B

.field private final blockSize:I

.field private currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

.field final encoding:Ljava/lang/String;

.field private entryOffset:J

.field private entrySize:J

.field private hasHitEOF:Z

.field private final is:Ljava/io/InputStream;

.field private final recordSize:I

.field private final zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 4
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    .line 86
    const/16 v0, 0x2800

    const/16 v1, 0x200

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;II)V

    .line 87
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .registers 4
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "blockSize"    # I

    .prologue
    .line 106
    const/16 v0, 0x200

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;II)V

    .line 107
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;II)V
    .registers 5
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "blockSize"    # I
    .param p3, "recordSize"    # I

    .prologue
    .line 128
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;IILjava/lang/String;)V

    .line 129
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;IILjava/lang/String;)V
    .registers 6
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "blockSize"    # I
    .param p3, "recordSize"    # I
    .param p4, "encoding"    # Ljava/lang/String;

    .prologue
    .line 140
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/ArchiveInputStream;-><init>()V

    .line 52
    const/16 v0, 0x100

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->SMALL_BUF:[B

    .line 141
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->is:Ljava/io/InputStream;

    .line 142
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->hasHitEOF:Z

    .line 143
    iput-object p4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->encoding:Ljava/lang/String;

    .line 144
    invoke-static {p4}, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    .line 145
    iput p3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->recordSize:I

    .line 146
    iput p2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->blockSize:I

    .line 147
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;ILjava/lang/String;)V
    .registers 5
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "blockSize"    # I
    .param p3, "encoding"    # Ljava/lang/String;

    .prologue
    .line 118
    const/16 v0, 0x200

    invoke-direct {p0, p1, p2, v0, p3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;IILjava/lang/String;)V

    .line 119
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;)V
    .registers 5
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "encoding"    # Ljava/lang/String;

    .prologue
    .line 96
    const/16 v0, 0x2800

    const/16 v1, 0x200

    invoke-direct {p0, p1, v0, v1, p2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;IILjava/lang/String;)V

    .line 98
    return-void
.end method

.method private applyPaxHeadersToCurrentEntry(Ljava/util/Map;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 493
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_8
    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_cf

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 494
    .local v0, "ent":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 495
    .local v2, "key":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 496
    .local v3, "val":Ljava/lang/String;
    const-string v4, "path"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2e

    .line 497
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v4, v3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setName(Ljava/lang/String;)V

    goto :goto_8

    .line 498
    :cond_2e
    const-string v4, "linkpath"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3c

    .line 499
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v4, v3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setLinkName(Ljava/lang/String;)V

    goto :goto_8

    .line 500
    :cond_3c
    const-string v4, "gid"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4e

    .line 501
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setGroupId(J)V

    goto :goto_8

    .line 502
    :cond_4e
    const-string v4, "gname"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5c

    .line 503
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v4, v3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setGroupName(Ljava/lang/String;)V

    goto :goto_8

    .line 504
    :cond_5c
    const-string v4, "uid"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6e

    .line 505
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setUserId(J)V

    goto :goto_8

    .line 506
    :cond_6e
    const-string v4, "uname"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7c

    .line 507
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v4, v3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setUserName(Ljava/lang/String;)V

    goto :goto_8

    .line 508
    :cond_7c
    const-string v4, "size"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8f

    .line 509
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setSize(J)V

    goto/16 :goto_8

    .line 510
    :cond_8f
    const-string v4, "mtime"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a9

    .line 511
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v5

    const-wide v7, 0x408f400000000000L    # 1000.0

    mul-double/2addr v5, v7

    double-to-long v5, v5

    invoke-virtual {v4, v5, v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setModTime(J)V

    goto/16 :goto_8

    .line 512
    :cond_a9
    const-string v4, "SCHILY.devminor"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_bc

    .line 513
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setDevMinor(I)V

    goto/16 :goto_8

    .line 514
    :cond_bc
    const-string v4, "SCHILY.devmajor"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 515
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setDevMajor(I)V

    goto/16 :goto_8

    .line 518
    .end local v0    # "ent":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "val":Ljava/lang/String;
    :cond_cf
    return-void
.end method

.method private consumeRemainderOfLastBlock()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 670
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->getBytesRead()J

    move-result-wide v4

    iget v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->blockSize:I

    int-to-long v6, v6

    rem-long v0, v4, v6

    .line 671
    .local v0, "bytesReadOfLastBlock":J
    const-wide/16 v4, 0x0

    cmp-long v4, v0, v4

    if-lez v4, :cond_1c

    .line 672
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->is:Ljava/io/InputStream;

    iget v5, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->blockSize:I

    int-to-long v5, v5

    sub-long/2addr v5, v0

    invoke-static {v4, v5, v6}, Lorg/apache/commons/compress/utils/IOUtils;->skip(Ljava/io/InputStream;J)J

    move-result-wide v2

    .line 673
    .local v2, "skipped":J
    invoke-virtual {p0, v2, v3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->count(J)V

    .line 675
    .end local v2    # "skipped":J
    :cond_1c
    return-void
.end method

.method private getRecord()[B
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 388
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->readRecord()[B

    move-result-object v0

    .line 389
    .local v0, "headerBuf":[B
    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->isEOFRecord([B)Z

    move-result v1

    iput-boolean v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->hasHitEOF:Z

    .line 390
    iget-boolean v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->hasHitEOF:Z

    if-eqz v1, :cond_17

    if-eqz v0, :cond_17

    .line 391
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->tryToConsumeSecondEOFRecord()V

    .line 392
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->consumeRemainderOfLastBlock()V

    .line 393
    const/4 v0, 0x0

    .line 395
    :cond_17
    return-object v0
.end method

.method public static matches([BI)Z
    .registers 8
    .param p0, "signature"    # [B
    .param p1, "length"    # I

    .prologue
    const/16 v5, 0x101

    const/4 v4, 0x6

    const/4 v0, 0x1

    const/16 v3, 0x107

    const/4 v2, 0x2

    .line 687
    const/16 v1, 0x109

    if-ge p1, v1, :cond_d

    .line 688
    const/4 v0, 0x0

    .line 721
    :cond_c
    :goto_c
    return v0

    .line 691
    :cond_d
    const-string v1, "ustar\u0000"

    invoke-static {v1, p0, v5, v4}, Lorg/apache/commons/compress/utils/ArchiveUtils;->matchAsciiBuffer(Ljava/lang/String;[BII)Z

    move-result v1

    if-eqz v1, :cond_1d

    const-string v1, "00"

    invoke-static {v1, p0, v3, v2}, Lorg/apache/commons/compress/utils/ArchiveUtils;->matchAsciiBuffer(Ljava/lang/String;[BII)Z

    move-result v1

    if-nez v1, :cond_c

    .line 699
    :cond_1d
    const-string v1, "ustar "

    invoke-static {v1, p0, v5, v4}, Lorg/apache/commons/compress/utils/ArchiveUtils;->matchAsciiBuffer(Ljava/lang/String;[BII)Z

    move-result v1

    if-eqz v1, :cond_35

    const-string v1, " \u0000"

    invoke-static {v1, p0, v3, v2}, Lorg/apache/commons/compress/utils/ArchiveUtils;->matchAsciiBuffer(Ljava/lang/String;[BII)Z

    move-result v1

    if-nez v1, :cond_c

    const-string v1, "0\u0000"

    invoke-static {v1, p0, v3, v2}, Lorg/apache/commons/compress/utils/ArchiveUtils;->matchAsciiBuffer(Ljava/lang/String;[BII)Z

    move-result v1

    if-nez v1, :cond_c

    .line 713
    :cond_35
    const-string v1, "ustar\u0000"

    invoke-static {v1, p0, v5, v4}, Lorg/apache/commons/compress/utils/ArchiveUtils;->matchAsciiBuffer(Ljava/lang/String;[BII)Z

    move-result v1

    if-eqz v1, :cond_45

    const-string v1, "\u0000\u0000"

    invoke-static {v1, p0, v3, v2}, Lorg/apache/commons/compress/utils/ArchiveUtils;->matchAsciiBuffer(Ljava/lang/String;[BII)Z

    move-result v1

    if-nez v1, :cond_c

    .line 721
    :cond_45
    const/4 v0, 0x0

    goto :goto_c
.end method

.method private paxHeaders()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 429
    invoke-virtual {p0, p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->parsePaxHeaders(Ljava/io/InputStream;)Ljava/util/Map;

    move-result-object v0

    .line 430
    .local v0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->getNextEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;

    .line 431
    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->applyPaxHeadersToCurrentEntry(Ljava/util/Map;)V

    .line 432
    return-void
.end method

.method private readGNUSparse()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 533
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->isExtended()Z

    move-result v2

    if-eqz v2, :cond_11

    .line 536
    :cond_8
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->getRecord()[B

    move-result-object v1

    .line 537
    .local v1, "headerBuf":[B
    if-nez v1, :cond_12

    .line 538
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    .line 547
    .end local v1    # "headerBuf":[B
    :cond_11
    :goto_11
    return-void

    .line 541
    .restart local v1    # "headerBuf":[B
    :cond_12
    new-instance v0, Lorg/apache/commons/compress/archivers/tar/TarArchiveSparseEntry;

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveSparseEntry;-><init>([B)V

    .line 545
    .local v0, "entry":Lorg/apache/commons/compress/archivers/tar/TarArchiveSparseEntry;
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveSparseEntry;->isExtended()Z

    move-result v2

    if-nez v2, :cond_8

    goto :goto_11
.end method

.method private skipRecordPadding()V
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v10, 0x0

    .line 332
    iget-wide v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entrySize:J

    cmp-long v6, v6, v10

    if-lez v6, :cond_2d

    iget-wide v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entrySize:J

    iget v8, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->recordSize:I

    int-to-long v8, v8

    rem-long/2addr v6, v8

    cmp-long v6, v6, v10

    if-eqz v6, :cond_2d

    .line 333
    iget-wide v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entrySize:J

    iget v8, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->recordSize:I

    int-to-long v8, v8

    div-long/2addr v6, v8

    const-wide/16 v8, 0x1

    add-long v0, v6, v8

    .line 334
    .local v0, "numRecords":J
    iget v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->recordSize:I

    int-to-long v6, v6

    mul-long/2addr v6, v0

    iget-wide v8, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entrySize:J

    sub-long v2, v6, v8

    .line 335
    .local v2, "padding":J
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->is:Ljava/io/InputStream;

    invoke-static {v6, v2, v3}, Lorg/apache/commons/compress/utils/IOUtils;->skip(Ljava/io/InputStream;J)J

    move-result-wide v4

    .line 336
    .local v4, "skipped":J
    invoke-virtual {p0, v4, v5}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->count(J)V

    .line 338
    .end local v0    # "numRecords":J
    .end local v2    # "padding":J
    .end local v4    # "skipped":J
    :cond_2d
    return-void
.end method

.method private tryToConsumeSecondEOFRecord()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 572
    const/4 v1, 0x1

    .line 573
    .local v1, "shouldReset":Z
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->is:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->markSupported()Z

    move-result v0

    .line 574
    .local v0, "marked":Z
    if-eqz v0, :cond_10

    .line 575
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->is:Ljava/io/InputStream;

    iget v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->recordSize:I

    invoke-virtual {v2, v3}, Ljava/io/InputStream;->mark(I)V

    .line 578
    :cond_10
    :try_start_10
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->readRecord()[B

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->isEOFRecord([B)Z
    :try_end_17
    .catchall {:try_start_10 .. :try_end_17} :catchall_2d

    move-result v2

    if-nez v2, :cond_2b

    const/4 v1, 0x1

    .line 580
    :goto_1b
    if-eqz v1, :cond_2a

    if-eqz v0, :cond_2a

    .line 581
    iget v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->recordSize:I

    int-to-long v2, v2

    invoke-virtual {p0, v2, v3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->pushedBackBytes(J)V

    .line 582
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->is:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->reset()V

    .line 585
    :cond_2a
    return-void

    .line 578
    :cond_2b
    const/4 v1, 0x0

    goto :goto_1b

    .line 580
    :catchall_2d
    move-exception v2

    if-eqz v1, :cond_3d

    if-eqz v0, :cond_3d

    .line 581
    iget v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->recordSize:I

    int-to-long v3, v3

    invoke-virtual {p0, v3, v4}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->pushedBackBytes(J)V

    .line 582
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->is:Ljava/io/InputStream;

    invoke-virtual {v3}, Ljava/io/InputStream;->reset()V

    :cond_3d
    throw v2
.end method


# virtual methods
.method public available()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 181
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entrySize:J

    iget-wide v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entryOffset:J

    sub-long/2addr v0, v2

    const-wide/32 v2, 0x7fffffff

    cmp-long v0, v0, v2

    if-lez v0, :cond_10

    .line 182
    const v0, 0x7fffffff

    .line 184
    :goto_f
    return v0

    :cond_10
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entrySize:J

    iget-wide v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entryOffset:J

    sub-long/2addr v0, v2

    long-to-int v0, v0

    goto :goto_f
.end method

.method public canReadEntryData(Lorg/apache/commons/compress/archivers/ArchiveEntry;)Z
    .registers 5
    .param p1, "ae"    # Lorg/apache/commons/compress/archivers/ArchiveEntry;

    .prologue
    const/4 v1, 0x0

    .line 636
    instance-of v2, p1, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    if-eqz v2, :cond_f

    move-object v0, p1

    .line 637
    check-cast v0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    .line 638
    .local v0, "te":Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->isGNUSparse()Z

    move-result v2

    if-nez v2, :cond_f

    const/4 v1, 0x1

    .line 640
    .end local v0    # "te":Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;
    :cond_f
    return v1
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 155
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->is:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 156
    return-void
.end method

.method public getCurrentEntry()Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;
    .registers 2

    .prologue
    .line 649
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    return-object v0
.end method

.method protected getLongNameData()[B
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 348
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 349
    .local v2, "longName":Ljava/io/ByteArrayOutputStream;
    const/4 v1, 0x0

    .line 350
    .local v1, "length":I
    :goto_7
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->SMALL_BUF:[B

    invoke-virtual {p0, v4}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->read([B)I

    move-result v1

    if-ltz v1, :cond_15

    .line 351
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->SMALL_BUF:[B

    invoke-virtual {v2, v4, v5, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_7

    .line 353
    :cond_15
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->getNextEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;

    .line 354
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    if-nez v4, :cond_1e

    .line 357
    const/4 v3, 0x0

    .line 370
    :cond_1d
    :goto_1d
    return-object v3

    .line 359
    :cond_1e
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    .line 361
    .local v3, "longNameData":[B
    array-length v1, v3

    .line 362
    :goto_23
    if-lez v1, :cond_2e

    add-int/lit8 v4, v1, -0x1

    aget-byte v4, v3, v4

    if-nez v4, :cond_2e

    .line 363
    add-int/lit8 v1, v1, -0x1

    goto :goto_23

    .line 365
    :cond_2e
    array-length v4, v3

    if-eq v1, v4, :cond_1d

    .line 366
    new-array v0, v1, [B

    .line 367
    .local v0, "l":[B
    invoke-static {v3, v5, v0, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 368
    move-object v3, v0

    goto :goto_1d
.end method

.method public getNextEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 558
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->getNextTarEntry()Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    move-result-object v0

    return-object v0
.end method

.method public getNextTarEntry()Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 257
    iget-boolean v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->hasHitEOF:Z

    if-eqz v6, :cond_6

    .line 324
    :cond_5
    :goto_5
    return-object v5

    .line 261
    :cond_6
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    if-eqz v6, :cond_15

    .line 263
    const-wide v6, 0x7fffffffffffffffL

    invoke-static {p0, v6, v7}, Lorg/apache/commons/compress/utils/IOUtils;->skip(Ljava/io/InputStream;J)J

    .line 266
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->skipRecordPadding()V

    .line 269
    :cond_15
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->getRecord()[B

    move-result-object v1

    .line 271
    .local v1, "headerBuf":[B
    if-nez v1, :cond_1e

    .line 273
    iput-object v5, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    goto :goto_5

    .line 278
    :cond_1e
    :try_start_1e
    new-instance v6, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    iget-object v7, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-direct {v6, v1, v7}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;-><init>([BLorg/apache/commons/compress/archivers/zip/ZipEncoding;)V

    iput-object v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;
    :try_end_27
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1e .. :try_end_27} :catch_86

    .line 285
    const-wide/16 v6, 0x0

    iput-wide v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entryOffset:J

    .line 286
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getSize()J

    move-result-wide v6

    iput-wide v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entrySize:J

    .line 288
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->isGNULongLinkEntry()Z

    move-result v6

    if-eqz v6, :cond_4c

    .line 289
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->getLongNameData()[B

    move-result-object v3

    .line 290
    .local v3, "longLinkData":[B
    if-eqz v3, :cond_5

    .line 296
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    iget-object v7, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-interface {v7, v3}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->decode([B)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setLinkName(Ljava/lang/String;)V

    .line 299
    .end local v3    # "longLinkData":[B
    :cond_4c
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->isGNULongNameEntry()Z

    move-result v6

    if-eqz v6, :cond_65

    .line 300
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->getLongNameData()[B

    move-result-object v4

    .line 301
    .local v4, "longNameData":[B
    if-eqz v4, :cond_5

    .line 307
    iget-object v5, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    iget-object v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-interface {v6, v4}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->decode([B)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setName(Ljava/lang/String;)V

    .line 310
    .end local v4    # "longNameData":[B
    :cond_65
    iget-object v5, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->isPaxHeader()Z

    move-result v5

    if-eqz v5, :cond_70

    .line 311
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->paxHeaders()V

    .line 314
    :cond_70
    iget-object v5, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->isGNUSparse()Z

    move-result v5

    if-eqz v5, :cond_7b

    .line 315
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->readGNUSparse()V

    .line 322
    :cond_7b
    iget-object v5, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getSize()J

    move-result-wide v5

    iput-wide v5, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entrySize:J

    .line 324
    iget-object v5, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    goto :goto_5

    .line 279
    :catch_86
    move-exception v0

    .line 280
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/io/IOException;

    const-string v5, "Error detected parsing the header"

    invoke-direct {v2, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 281
    .local v2, "ioe":Ljava/io/IOException;
    invoke-virtual {v2, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 282
    throw v2
.end method

.method public getRecordSize()I
    .registers 2

    .prologue
    .line 164
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->recordSize:I

    return v0
.end method

.method protected final isAtEOF()Z
    .registers 2

    .prologue
    .line 657
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->hasHitEOF:Z

    return v0
.end method

.method protected isEOFRecord([B)Z
    .registers 3
    .param p1, "record"    # [B

    .prologue
    .line 406
    if-eqz p1, :cond_a

    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->recordSize:I

    invoke-static {p1, v0}, Lorg/apache/commons/compress/utils/ArchiveUtils;->isArrayZero([BI)Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public mark(I)V
    .registers 2
    .param p1, "markLimit"    # I

    .prologue
    .line 234
    return-void
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 224
    const/4 v0, 0x0

    return v0
.end method

.method parsePaxHeaders(Ljava/io/InputStream;)Ljava/util/Map;
    .registers 16
    .param p1, "i"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v13, -0x1

    .line 435
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 439
    .local v3, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_6
    const/4 v5, 0x0

    .line 440
    .local v5, "len":I
    const/4 v6, 0x0

    .line 441
    .local v6, "read":I
    :goto_8
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v0

    .local v0, "ch":I
    if-eq v0, v13, :cond_65

    .line 442
    add-int/lit8 v6, v6, 0x1

    .line 443
    const/16 v10, 0x20

    if-ne v0, v10, :cond_6d

    .line 445
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 446
    .local v1, "coll":Ljava/io/ByteArrayOutputStream;
    :goto_19
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v0

    if-eq v0, v13, :cond_65

    .line 447
    add-int/lit8 v6, v6, 0x1

    .line 448
    const/16 v10, 0x3d

    if-ne v0, v10, :cond_68

    .line 449
    const-string v10, "UTF-8"

    invoke-virtual {v1, v10}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 451
    .local v4, "keyword":Ljava/lang/String;
    sub-int v8, v5, v6

    .line 452
    .local v8, "restLen":I
    new-array v7, v8, [B

    .line 453
    .local v7, "rest":[B
    invoke-static {p1, v7}, Lorg/apache/commons/compress/utils/IOUtils;->readFully(Ljava/io/InputStream;[B)I

    move-result v2

    .line 454
    .local v2, "got":I
    if-eq v2, v8, :cond_58

    .line 455
    new-instance v10, Ljava/io/IOException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Failed to read Paxheader. Expected "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " bytes, read "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 462
    :cond_58
    new-instance v9, Ljava/lang/String;

    const/4 v10, 0x0

    add-int/lit8 v11, v8, -0x1

    const-string v12, "UTF-8"

    invoke-direct {v9, v7, v10, v11, v12}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 464
    .local v9, "value":Ljava/lang/String;
    invoke-interface {v3, v4, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 474
    .end local v1    # "coll":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "got":I
    .end local v4    # "keyword":Ljava/lang/String;
    .end local v7    # "rest":[B
    .end local v8    # "restLen":I
    .end local v9    # "value":Ljava/lang/String;
    :cond_65
    if-ne v0, v13, :cond_6

    .line 478
    return-object v3

    .line 467
    .restart local v1    # "coll":Ljava/io/ByteArrayOutputStream;
    :cond_68
    int-to-byte v10, v0

    invoke-virtual {v1, v10}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_19

    .line 471
    .end local v1    # "coll":Ljava/io/ByteArrayOutputStream;
    :cond_6d
    mul-int/lit8 v5, v5, 0xa

    .line 472
    add-int/lit8 v10, v0, -0x30

    add-int/2addr v5, v10

    goto :goto_8
.end method

.method public read([BII)I
    .registers 10
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "numToRead"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 602
    const/4 v0, 0x0

    .line 604
    .local v0, "totalRead":I
    iget-boolean v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->hasHitEOF:Z

    if-nez v2, :cond_e

    iget-wide v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entryOffset:J

    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entrySize:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_f

    .line 626
    :cond_e
    :goto_e
    return v1

    .line 608
    :cond_f
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    if-nez v2, :cond_1b

    .line 609
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "No current tar entry"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 612
    :cond_1b
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->available()I

    move-result v2

    invoke-static {p3, v2}, Ljava/lang/Math;->min(II)I

    move-result p3

    .line 614
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->is:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 616
    if-ne v0, v1, :cond_3a

    .line 617
    if-lez p3, :cond_35

    .line 618
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Truncated TAR archive"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 620
    :cond_35
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->hasHitEOF:Z

    :goto_38
    move v1, v0

    .line 626
    goto :goto_e

    .line 622
    :cond_3a
    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->count(I)V

    .line 623
    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entryOffset:J

    int-to-long v3, v0

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entryOffset:J

    goto :goto_38
.end method

.method protected readRecord()[B
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 417
    iget v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->recordSize:I

    new-array v1, v2, [B

    .line 419
    .local v1, "record":[B
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->is:Ljava/io/InputStream;

    invoke-static {v2, v1}, Lorg/apache/commons/compress/utils/IOUtils;->readFully(Ljava/io/InputStream;[B)I

    move-result v0

    .line 420
    .local v0, "readNow":I
    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->count(I)V

    .line 421
    iget v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->recordSize:I

    if-eq v0, v2, :cond_12

    .line 422
    const/4 v1, 0x0

    .line 425
    .end local v1    # "record":[B
    :cond_12
    return-object v1
.end method

.method public declared-synchronized reset()V
    .registers 1

    .prologue
    .line 241
    monitor-enter p0

    monitor-exit p0

    return-void
.end method

.method protected final setAtEOF(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 661
    iput-boolean p1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->hasHitEOF:Z

    .line 662
    return-void
.end method

.method protected final setCurrentEntry(Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;)V
    .registers 2
    .param p1, "e"    # Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    .prologue
    .line 653
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->currEntry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    .line 654
    return-void
.end method

.method public skip(J)J
    .registers 11
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v2, 0x0

    .line 206
    cmp-long v4, p1, v2

    if-gtz v4, :cond_7

    .line 214
    :goto_6
    return-wide v2

    .line 210
    :cond_7
    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entrySize:J

    iget-wide v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entryOffset:J

    sub-long v0, v4, v6

    .line 211
    .local v0, "available":J
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->is:Ljava/io/InputStream;

    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v2

    .line 212
    .local v2, "skipped":J
    invoke-virtual {p0, v2, v3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->count(J)V

    .line 213
    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entryOffset:J

    add-long/2addr v4, v2

    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->entryOffset:J

    goto :goto_6
.end method
