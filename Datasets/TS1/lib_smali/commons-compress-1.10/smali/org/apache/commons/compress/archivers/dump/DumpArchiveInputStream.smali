.class public Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;
.super Lorg/apache/commons/compress/archivers/ArchiveInputStream;
.source "DumpArchiveInputStream.java"


# instance fields
.field private active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

.field private blockBuffer:[B

.field final encoding:Ljava/lang/String;

.field private entryOffset:J

.field private entrySize:J

.field private filepos:J

.field private hasHitEOF:Z

.field private isClosed:Z

.field private final names:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/apache/commons/compress/archivers/dump/Dirent;",
            ">;"
        }
    .end annotation
.end field

.field private final pending:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;",
            ">;"
        }
    .end annotation
.end field

.field private queue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;",
            ">;"
        }
    .end annotation
.end field

.field protected raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

.field private final readBuf:[B

.field private readIdx:I

.field private recordOffset:I

.field private summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

.field private final zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/compress/archivers/ArchiveException;
        }
    .end annotation

    .prologue
    .line 90
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 91
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;)V
    .registers 10
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/compress/archivers/ArchiveException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x2

    .line 103
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/ArchiveInputStream;-><init>()V

    .line 59
    const/16 v3, 0x400

    new-array v3, v3, [B

    iput-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBuf:[B

    .line 66
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->names:Ljava/util/Map;

    .line 69
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->pending:Ljava/util/Map;

    .line 104
    new-instance v3, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-direct {v3, p1}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    .line 105
    const/4 v3, 0x0

    iput-boolean v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->hasHitEOF:Z

    .line 106
    iput-object p2, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->encoding:Ljava/lang/String;

    .line 107
    invoke-static {p2}, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    .line 111
    :try_start_2a
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readRecord()[B

    move-result-object v1

    .line 113
    .local v1, "headerBytes":[B
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->verify([B)Z

    move-result v3

    if-nez v3, :cond_47

    .line 114
    new-instance v3, Lorg/apache/commons/compress/archivers/dump/UnrecognizedFormatException;

    invoke-direct {v3}, Lorg/apache/commons/compress/archivers/dump/UnrecognizedFormatException;-><init>()V

    throw v3
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_3c} :catch_3c

    .line 129
    .end local v1    # "headerBytes":[B
    :catch_3c
    move-exception v0

    .line 130
    .local v0, "ex":Ljava/io/IOException;
    new-instance v3, Lorg/apache/commons/compress/archivers/ArchiveException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/apache/commons/compress/archivers/ArchiveException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3

    .line 118
    .end local v0    # "ex":Ljava/io/IOException;
    .restart local v1    # "headerBytes":[B
    :cond_47
    :try_start_47
    new-instance v3, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-direct {v3, v1, v4}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;-><init>([BLorg/apache/commons/compress/archivers/zip/ZipEncoding;)V

    iput-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    .line 121
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->getNTRec()I

    move-result v4

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->isCompressed()Z

    move-result v5

    invoke-virtual {v3, v4, v5}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->resetBlockSize(IZ)V

    .line 124
    const/16 v3, 0x1000

    new-array v3, v3, [B

    iput-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->blockBuffer:[B

    .line 127
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readCLRI()V

    .line 128
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBITS()V
    :try_end_6d
    .catch Ljava/io/IOException; {:try_start_47 .. :try_end_6d} :catch_3c

    .line 134
    new-instance v2, Lorg/apache/commons/compress/archivers/dump/Dirent;

    const/4 v3, 0x4

    const-string v4, "."

    invoke-direct {v2, v6, v6, v3, v4}, Lorg/apache/commons/compress/archivers/dump/Dirent;-><init>(IIILjava/lang/String;)V

    .line 135
    .local v2, "root":Lorg/apache/commons/compress/archivers/dump/Dirent;
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->names:Ljava/util/Map;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    new-instance v3, Ljava/util/PriorityQueue;

    const/16 v4, 0xa

    new-instance v5, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream$1;

    invoke-direct {v5, p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream$1;-><init>(Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;)V

    invoke-direct {v3, v4, v5}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    iput-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->queue:Ljava/util/Queue;

    .line 149
    return-void
.end method

.method private getPath(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;)Ljava/lang/String;
    .registers 8
    .param p1, "entry"    # Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    .prologue
    .line 417
    new-instance v1, Ljava/util/Stack;

    invoke-direct {v1}, Ljava/util/Stack;-><init>()V

    .line 418
    .local v1, "elements":Ljava/util/Stack;, "Ljava/util/Stack<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 420
    .local v0, "dirent":Lorg/apache/commons/compress/archivers/dump/Dirent;
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getIno()I

    move-result v2

    .line 421
    .local v2, "i":I
    :goto_a
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->names:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2e

    .line 422
    invoke-virtual {v1}, Ljava/util/Stack;->clear()V

    .line 435
    :cond_19
    invoke-virtual {v1}, Ljava/util/Stack;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_50

    .line 436
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->pending:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getIno()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 438
    const/4 v4, 0x0

    .line 449
    :goto_2d
    return-object v4

    .line 426
    :cond_2e
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->names:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "dirent":Lorg/apache/commons/compress/archivers/dump/Dirent;
    check-cast v0, Lorg/apache/commons/compress/archivers/dump/Dirent;

    .line 427
    .restart local v0    # "dirent":Lorg/apache/commons/compress/archivers/dump/Dirent;
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/Dirent;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 429
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/Dirent;->getIno()I

    move-result v4

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/Dirent;->getParentIno()I

    move-result v5

    if-eq v4, v5, :cond_19

    .line 420
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/Dirent;->getParentIno()I

    move-result v2

    goto :goto_a

    .line 442
    :cond_50
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 444
    .local v3, "sb":Ljava/lang/StringBuilder;
    :goto_5b
    invoke-virtual {v1}, Ljava/util/Stack;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_70

    .line 445
    const/16 v4, 0x2f

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 446
    invoke-virtual {v1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_5b

    .line 449
    :cond_70
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_2d
.end method

.method public static matches([BI)Z
    .registers 5
    .param p0, "buffer"    # [B
    .param p1, "length"    # I

    .prologue
    const/4 v0, 0x0

    .line 546
    const/16 v1, 0x20

    if-ge p1, v1, :cond_6

    .line 556
    :cond_5
    :goto_5
    return v0

    .line 551
    :cond_6
    const/16 v1, 0x400

    if-lt p1, v1, :cond_f

    .line 552
    invoke-static {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->verify([B)Z

    move-result v0

    goto :goto_5

    .line 556
    :cond_f
    const v1, 0xea6c

    const/16 v2, 0x18

    invoke-static {p0, v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v2

    if-ne v1, v2, :cond_5

    const/4 v0, 0x1

    goto :goto_5
.end method

.method private readBITS()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 198
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readRecord()[B

    move-result-object v0

    .line 200
    .local v0, "buffer":[B
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->verify([B)Z

    move-result v1

    if-nez v1, :cond_12

    .line 201
    new-instance v1, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;

    invoke-direct {v1}, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;-><init>()V

    throw v1

    .line 204
    :cond_12
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->parse([B)Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    .line 206
    sget-object v1, Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;->BITS:Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderType()Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    move-result-object v2

    if-eq v1, v2, :cond_28

    .line 207
    new-instance v1, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;

    invoke-direct {v1}, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;-><init>()V

    throw v1

    .line 211
    :cond_28
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderCount()I

    move-result v2

    mul-int/lit16 v2, v2, 0x400

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->skip(J)J

    move-result-wide v1

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-nez v1, :cond_43

    .line 213
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 215
    :cond_43
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderCount()I

    move-result v1

    iput v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    .line 216
    return-void
.end method

.method private readCLRI()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 174
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readRecord()[B

    move-result-object v0

    .line 176
    .local v0, "buffer":[B
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->verify([B)Z

    move-result v1

    if-nez v1, :cond_12

    .line 177
    new-instance v1, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;

    invoke-direct {v1}, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;-><init>()V

    throw v1

    .line 180
    :cond_12
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->parse([B)Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    .line 182
    sget-object v1, Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;->CLRI:Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderType()Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    move-result-object v2

    if-eq v1, v2, :cond_28

    .line 183
    new-instance v1, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;

    invoke-direct {v1}, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;-><init>()V

    throw v1

    .line 187
    :cond_28
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderCount()I

    move-result v2

    mul-int/lit16 v2, v2, 0x400

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->skip(J)J

    move-result-wide v1

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-nez v1, :cond_43

    .line 189
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 191
    :cond_43
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderCount()I

    move-result v1

    iput v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    .line 192
    return-void
.end method

.method private readDirectoryEntry(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;)V
    .registers 25
    .param p1, "entry"    # Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 325
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getEntrySize()J

    move-result-wide v15

    .line 326
    .local v15, "size":J
    const/4 v7, 0x1

    .line 328
    .local v7, "first":Z
    :goto_5
    if-nez v7, :cond_13

    sget-object v18, Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;->ADDR:Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderType()Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_1c6

    .line 331
    :cond_13
    if-nez v7, :cond_1e

    .line 332
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readRecord()[B

    .line 335
    :cond_1e
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->names:Ljava/util/Map;

    move-object/from16 v18, v0

    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getIno()I

    move-result v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    invoke-interface/range {v18 .. v19}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_55

    sget-object v18, Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;->INODE:Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderType()Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_55

    .line 337
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->pending:Ljava/util/Map;

    move-object/from16 v18, v0

    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getIno()I

    move-result v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, p1

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 340
    :cond_55
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderCount()I

    move-result v18

    move/from16 v0, v18

    mul-int/lit16 v4, v0, 0x400

    .line 342
    .local v4, "datalen":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->blockBuffer:[B

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v0, v4, :cond_76

    .line 343
    new-array v0, v4, [B

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->blockBuffer:[B

    .line 346
    :cond_76
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->blockBuffer:[B

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2, v4}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->read([BII)I

    move-result v18

    move/from16 v0, v18

    if-eq v0, v4, :cond_98

    .line 347
    new-instance v18, Ljava/io/EOFException;

    invoke-direct/range {v18 .. v18}, Ljava/io/EOFException;-><init>()V

    throw v18

    .line 350
    :cond_98
    const/4 v14, 0x0

    .line 352
    .local v14, "reclen":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_9a
    add-int/lit8 v18, v4, -0x8

    move/from16 v0, v18

    if-ge v8, v0, :cond_1a5

    int-to-long v0, v8

    move-wide/from16 v18, v0

    const-wide/16 v20, 0x8

    sub-long v20, v15, v20

    cmp-long v18, v18, v20

    if-gez v18, :cond_1a5

    .line 354
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->blockBuffer:[B

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-static {v0, v8}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v10

    .line 355
    .local v10, "ino":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->blockBuffer:[B

    move-object/from16 v18, v0

    add-int/lit8 v19, v8, 0x4

    invoke-static/range {v18 .. v19}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert16([BI)I

    move-result v14

    .line 357
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->blockBuffer:[B

    move-object/from16 v18, v0

    add-int/lit8 v19, v8, 0x6

    aget-byte v17, v18, v19

    .line 359
    .local v17, "type":B
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->blockBuffer:[B

    move-object/from16 v19, v0

    add-int/lit8 v20, v8, 0x8

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->blockBuffer:[B

    move-object/from16 v21, v0

    add-int/lit8 v22, v8, 0x7

    aget-byte v21, v21, v22

    invoke-static/range {v18 .. v21}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->decode(Lorg/apache/commons/compress/archivers/zip/ZipEncoding;[BII)Ljava/lang/String;

    move-result-object v11

    .line 361
    .local v11, "name":Ljava/lang/String;
    const-string v18, "."

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_fd

    const-string v18, ".."

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_ff

    .line 353
    :cond_fd
    add-int/2addr v8, v14

    goto :goto_9a

    .line 366
    :cond_ff
    new-instance v3, Lorg/apache/commons/compress/archivers/dump/Dirent;

    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getIno()I

    move-result v18

    move/from16 v0, v18

    move/from16 v1, v17

    invoke-direct {v3, v10, v0, v1, v11}, Lorg/apache/commons/compress/archivers/dump/Dirent;-><init>(IIILjava/lang/String;)V

    .line 375
    .local v3, "d":Lorg/apache/commons/compress/archivers/dump/Dirent;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->names:Ljava/util/Map;

    move-object/from16 v18, v0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 378
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->pending:Ljava/util/Map;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :cond_12b
    :goto_12b
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_17d

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 379
    .local v6, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->getPath(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;)Ljava/lang/String;

    move-result-object v12

    .line 381
    .local v12, "path":Ljava/lang/String;
    if-eqz v12, :cond_12b

    .line 382
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setName(Ljava/lang/String;)V

    .line 383
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->names:Ljava/util/Map;

    move-object/from16 v19, v0

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v20

    invoke-interface/range {v19 .. v20}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/apache/commons/compress/archivers/dump/Dirent;

    invoke-virtual/range {v19 .. v19}, Lorg/apache/commons/compress/archivers/dump/Dirent;->getName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setSimpleName(Ljava/lang/String;)V

    .line 385
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->queue:Ljava/util/Queue;

    move-object/from16 v18, v0

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v19

    invoke-interface/range {v18 .. v19}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto :goto_12b

    .line 391
    .end local v6    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;>;"
    .end local v12    # "path":Ljava/lang/String;
    :cond_17d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->queue:Ljava/util/Queue;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_187
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_fd

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    .line 392
    .local v5, "e":Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->pending:Ljava/util/Map;

    move-object/from16 v18, v0

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getIno()I

    move-result v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    invoke-interface/range {v18 .. v19}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_187

    .line 396
    .end local v3    # "d":Lorg/apache/commons/compress/archivers/dump/Dirent;
    .end local v5    # "e":Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
    .end local v9    # "i$":Ljava/util/Iterator;
    .end local v10    # "ino":I
    .end local v11    # "name":Ljava/lang/String;
    .end local v17    # "type":B
    :cond_1a5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->peek()[B

    move-result-object v13

    .line 398
    .local v13, "peekBytes":[B
    invoke-static {v13}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->verify([B)Z

    move-result v18

    if-nez v18, :cond_1bb

    .line 399
    new-instance v18, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;

    invoke-direct/range {v18 .. v18}, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;-><init>()V

    throw v18

    .line 402
    :cond_1bb
    invoke-static {v13}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->parse([B)Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-result-object p1

    .line 403
    const/4 v7, 0x0

    .line 404
    const-wide/16 v18, 0x400

    sub-long v15, v15, v18

    .line 405
    goto/16 :goto_5

    .line 406
    .end local v4    # "datalen":I
    .end local v8    # "i":I
    .end local v13    # "peekBytes":[B
    .end local v14    # "reclen":I
    :cond_1c6
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 530
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->isClosed:Z

    if-nez v0, :cond_c

    .line 531
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->isClosed:Z

    .line 532
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->close()V

    .line 534
    :cond_c
    return-void
.end method

.method public getBytesRead()J
    .registers 3

    .prologue
    .line 159
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->getBytesRead()J

    move-result-wide v0

    return-wide v0
.end method

.method public getCount()I
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 154
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->getBytesRead()J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method public getNextDumpEntry()Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 224
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->getNextEntry()Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getNextEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->getNextEntry()Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-result-object v0

    return-object v0
.end method

.method public getNextEntry()Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v10, -0x1

    const/4 v3, 0x0

    const/4 v9, 0x0

    const-wide/16 v7, 0x0

    .line 229
    const/4 v0, 0x0

    .line 230
    .local v0, "entry":Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
    const/4 v2, 0x0

    .line 233
    .local v2, "path":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->queue:Ljava/util/Queue;

    invoke-interface {v4}, Ljava/util/Queue;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3e

    .line 234
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->queue:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    .line 317
    :cond_18
    :goto_18
    return-object v3

    .line 289
    .local v1, "headerBytes":[B
    :cond_19
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    .line 291
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_ea

    .line 292
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-direct {p0, v4}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readDirectoryEntry(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;)V

    .line 295
    iput-wide v7, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entryOffset:J

    .line 296
    iput-wide v7, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entrySize:J

    .line 297
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderCount()I

    move-result v4

    iput v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    .line 304
    :goto_32
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBuf:[B

    array-length v4, v4

    iput v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->recordOffset:I

    .line 306
    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->getPath(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;)Ljava/lang/String;

    move-result-object v2

    .line 308
    if-nez v2, :cond_3e

    .line 309
    const/4 v0, 0x0

    .line 237
    .end local v1    # "headerBytes":[B
    :cond_3e
    if-nez v0, :cond_f8

    .line 238
    iget-boolean v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->hasHitEOF:Z

    if-nez v4, :cond_18

    .line 246
    :cond_44
    iget v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderCount()I

    move-result v5

    if-ge v4, v5, :cond_6e

    .line 247
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    iget v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    invoke-virtual {v4, v5}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->isSparseRecord(I)Z

    move-result v4

    if-nez v4, :cond_44

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    const-wide/16 v5, 0x400

    invoke-virtual {v4, v5, v6}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->skip(J)J

    move-result-wide v4

    cmp-long v4, v4, v10

    if-nez v4, :cond_44

    .line 249
    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3

    .line 253
    :cond_6e
    iput v9, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    .line 254
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->getBytesRead()J

    move-result-wide v4

    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->filepos:J

    .line 256
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readRecord()[B

    move-result-object v1

    .line 258
    .restart local v1    # "headerBytes":[B
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->verify([B)Z

    move-result v4

    if-nez v4, :cond_8a

    .line 259
    new-instance v3, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;

    invoke-direct {v3}, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;-><init>()V

    throw v3

    .line 262
    :cond_8a
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->parse([B)Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    .line 265
    :goto_90
    sget-object v4, Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;->ADDR:Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderType()Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    move-result-object v5

    if-ne v4, v5, :cond_db

    .line 266
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderCount()I

    move-result v5

    iget-object v6, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderHoles()I

    move-result v6

    sub-int/2addr v5, v6

    mul-int/lit16 v5, v5, 0x400

    int-to-long v5, v5

    invoke-virtual {v4, v5, v6}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->skip(J)J

    move-result-wide v4

    cmp-long v4, v4, v10

    if-nez v4, :cond_ba

    .line 269
    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3

    .line 272
    :cond_ba
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->getBytesRead()J

    move-result-wide v4

    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->filepos:J

    .line 273
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readRecord()[B

    move-result-object v1

    .line 275
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->verify([B)Z

    move-result v4

    if-nez v4, :cond_d4

    .line 276
    new-instance v3, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;

    invoke-direct {v3}, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;-><init>()V

    throw v3

    .line 279
    :cond_d4
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->parse([B)Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    goto :goto_90

    .line 283
    :cond_db
    sget-object v4, Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;->END:Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getHeaderType()Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    move-result-object v5

    if-ne v4, v5, :cond_19

    .line 284
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->hasHitEOF:Z

    goto/16 :goto_18

    .line 299
    :cond_ea
    iput-wide v7, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entryOffset:J

    .line 300
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getEntrySize()J

    move-result-wide v4

    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entrySize:J

    .line 301
    iput v9, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    goto/16 :goto_32

    .line 313
    .end local v1    # "headerBytes":[B
    :cond_f8
    invoke-virtual {v0, v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setName(Ljava/lang/String;)V

    .line 314
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->names:Ljava/util/Map;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getIno()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/compress/archivers/dump/Dirent;

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/dump/Dirent;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setSimpleName(Ljava/lang/String;)V

    .line 315
    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->filepos:J

    invoke-virtual {v0, v3, v4}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setOffset(J)V

    move-object v3, v0

    .line 317
    goto/16 :goto_18
.end method

.method public getSummary()Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;
    .registers 2

    .prologue
    .line 167
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    return-object v0
.end method

.method public read([BII)I
    .registers 13
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 467
    const/4 v3, 0x0

    .line 469
    .local v3, "totalRead":I
    iget-boolean v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->hasHitEOF:Z

    if-nez v4, :cond_12

    iget-boolean v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->isClosed:Z

    if-nez v4, :cond_12

    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entryOffset:J

    iget-wide v6, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entrySize:J

    cmp-long v4, v4, v6

    if-ltz v4, :cond_14

    .line 470
    :cond_12
    const/4 v4, -0x1

    .line 522
    :goto_13
    return v4

    .line 473
    :cond_14
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    if-nez v4, :cond_20

    .line 474
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "No current dump entry"

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 477
    :cond_20
    int-to-long v4, p3

    iget-wide v6, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entryOffset:J

    add-long/2addr v4, v6

    iget-wide v6, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entrySize:J

    cmp-long v4, v4, v6

    if-lez v4, :cond_30

    .line 478
    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entrySize:J

    iget-wide v6, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entryOffset:J

    sub-long/2addr v4, v6

    long-to-int p3, v4

    .line 481
    :cond_30
    :goto_30
    if-lez p3, :cond_a8

    .line 482
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBuf:[B

    array-length v4, v4

    iget v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->recordOffset:I

    sub-int/2addr v4, v5

    if-le p3, v4, :cond_72

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBuf:[B

    array-length v4, v4

    iget v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->recordOffset:I

    sub-int v2, v4, v5

    .line 486
    .local v2, "sz":I
    :goto_41
    iget v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->recordOffset:I

    add-int/2addr v4, v2

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBuf:[B

    array-length v5, v5

    if-gt v4, v5, :cond_58

    .line 487
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBuf:[B

    iget v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->recordOffset:I

    invoke-static {v4, v5, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 488
    add-int/2addr v3, v2

    .line 489
    iget v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->recordOffset:I

    add-int/2addr v4, v2

    iput v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->recordOffset:I

    .line 490
    sub-int/2addr p3, v2

    .line 491
    add-int/2addr p2, v2

    .line 495
    :cond_58
    if-lez p3, :cond_30

    .line 496
    iget v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    const/16 v5, 0x200

    if-lt v4, v5, :cond_7c

    .line 497
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readRecord()[B

    move-result-object v0

    .line 499
    .local v0, "headerBytes":[B
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->verify([B)Z

    move-result v4

    if-nez v4, :cond_74

    .line 500
    new-instance v4, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;

    invoke-direct {v4}, Lorg/apache/commons/compress/archivers/dump/InvalidFormatException;-><init>()V

    throw v4

    .end local v0    # "headerBytes":[B
    .end local v2    # "sz":I
    :cond_72
    move v2, p3

    .line 482
    goto :goto_41

    .line 503
    .restart local v0    # "headerBytes":[B
    .restart local v2    # "sz":I
    :cond_74
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->parse([B)Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    .line 504
    iput v8, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    .line 507
    .end local v0    # "headerBytes":[B
    :cond_7c
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->active:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    iget v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readIdx:I

    invoke-virtual {v4, v5}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->isSparseRecord(I)Z

    move-result v4

    if-nez v4, :cond_a0

    .line 508
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->raw:Lorg/apache/commons/compress/archivers/dump/TapeInputStream;

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBuf:[B

    iget-object v6, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBuf:[B

    array-length v6, v6

    invoke-virtual {v4, v5, v8, v6}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->read([BII)I

    move-result v1

    .line 509
    .local v1, "r":I
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBuf:[B

    array-length v4, v4

    if-eq v1, v4, :cond_a5

    .line 510
    new-instance v4, Ljava/io/EOFException;

    invoke-direct {v4}, Ljava/io/EOFException;-><init>()V

    throw v4

    .line 513
    .end local v1    # "r":I
    :cond_a0
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->readBuf:[B

    invoke-static {v4, v8}, Ljava/util/Arrays;->fill([BB)V

    .line 516
    :cond_a5
    iput v8, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->recordOffset:I

    goto :goto_30

    .line 520
    .end local v2    # "sz":I
    :cond_a8
    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entryOffset:J

    int-to-long v6, v3

    add-long/2addr v4, v6

    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->entryOffset:J

    move v4, v3

    .line 522
    goto/16 :goto_13
.end method
