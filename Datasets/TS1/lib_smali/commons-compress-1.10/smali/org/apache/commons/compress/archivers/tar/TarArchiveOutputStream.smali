.class public Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;
.super Lorg/apache/commons/compress/archivers/ArchiveOutputStream;
.source "TarArchiveOutputStream.java"


# static fields
.field private static final ASCII:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

.field public static final BIGNUMBER_ERROR:I = 0x0

.field public static final BIGNUMBER_POSIX:I = 0x2

.field public static final BIGNUMBER_STAR:I = 0x1

.field public static final LONGFILE_ERROR:I = 0x0

.field public static final LONGFILE_GNU:I = 0x2

.field public static final LONGFILE_POSIX:I = 0x3

.field public static final LONGFILE_TRUNCATE:I = 0x1


# instance fields
.field private addPaxHeadersForNonAsciiNames:Z

.field private final assemBuf:[B

.field private assemLen:I

.field private bigNumberMode:I

.field private closed:Z

.field private currBytes:J

.field private currName:Ljava/lang/String;

.field private currSize:J

.field final encoding:Ljava/lang/String;

.field private finished:Z

.field private haveUnclosedEntry:Z

.field private longFileMode:I

.field private final out:Ljava/io/OutputStream;

.field private final recordBuf:[B

.field private final recordSize:I

.field private final recordsPerBlock:I

.field private recordsWritten:I

.field private final zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 93
    const-string v0, "ASCII"

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->ASCII:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 101
    const/16 v0, 0x2800

    const/16 v1, 0x200

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;-><init>(Ljava/io/OutputStream;II)V

    .line 102
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;I)V
    .registers 4
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "blockSize"    # I

    .prologue
    .line 120
    const/16 v0, 0x200

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;-><init>(Ljava/io/OutputStream;II)V

    .line 121
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;II)V
    .registers 5
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "blockSize"    # I
    .param p3, "recordSize"    # I

    .prologue
    .line 142
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;-><init>(Ljava/io/OutputStream;IILjava/lang/String;)V

    .line 143
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;IILjava/lang/String;)V
    .registers 7
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "blockSize"    # I
    .param p3, "recordSize"    # I
    .param p4, "encoding"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 154
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/ArchiveOutputStream;-><init>()V

    .line 71
    iput v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->longFileMode:I

    .line 72
    iput v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->bigNumberMode:I

    .line 77
    iput-boolean v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->closed:Z

    .line 80
    iput-boolean v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->haveUnclosedEntry:Z

    .line 83
    iput-boolean v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->finished:Z

    .line 92
    iput-boolean v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->addPaxHeadersForNonAsciiNames:Z

    .line 155
    new-instance v0, Lorg/apache/commons/compress/utils/CountingOutputStream;

    invoke-direct {v0, p1}, Lorg/apache/commons/compress/utils/CountingOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 156
    iput-object p4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->encoding:Ljava/lang/String;

    .line 157
    invoke-static {p4}, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    .line 159
    iput v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemLen:I

    .line 160
    new-array v0, p3, [B

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemBuf:[B

    .line 161
    new-array v0, p3, [B

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordBuf:[B

    .line 162
    iput p3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordSize:I

    .line 163
    div-int v0, p2, p3

    iput v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordsPerBlock:I

    .line 164
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;ILjava/lang/String;)V
    .registers 5
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "blockSize"    # I
    .param p3, "encoding"    # Ljava/lang/String;

    .prologue
    .line 132
    const/16 v0, 0x200

    invoke-direct {p0, p1, p2, v0, p3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;-><init>(Ljava/io/OutputStream;IILjava/lang/String;)V

    .line 133
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Ljava/lang/String;)V
    .registers 5
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "encoding"    # Ljava/lang/String;

    .prologue
    .line 111
    const/16 v0, 0x2800

    const/16 v1, 0x200

    invoke-direct {p0, p1, v0, v1, p2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;-><init>(Ljava/io/OutputStream;IILjava/lang/String;)V

    .line 112
    return-void
.end method

.method private addPaxHeaderForBigNumber(Ljava/util/Map;Ljava/lang/String;JJ)V
    .registers 9
    .param p2, "header"    # Ljava/lang/String;
    .param p3, "value"    # J
    .param p5, "maxValue"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "JJ)V"
        }
    .end annotation

    .prologue
    .line 607
    .local p1, "paxHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-wide/16 v0, 0x0

    cmp-long v0, p3, v0

    if-ltz v0, :cond_a

    cmp-long v0, p3, p5

    if-lez v0, :cond_11

    .line 608
    :cond_a
    invoke-static {p3, p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 610
    :cond_11
    return-void
.end method

.method private addPaxHeadersForBigNumbers(Ljava/util/Map;Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;)V
    .registers 10
    .param p2, "entry"    # Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;",
            ")V"
        }
    .end annotation

    .prologue
    .line 586
    .local p1, "paxHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "size"

    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getSize()J

    move-result-wide v3

    const-wide v5, 0x1ffffffffL

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->addPaxHeaderForBigNumber(Ljava/util/Map;Ljava/lang/String;JJ)V

    .line 588
    const-string v2, "gid"

    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getLongGroupId()J

    move-result-wide v3

    const-wide/32 v5, 0x1fffff

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->addPaxHeaderForBigNumber(Ljava/util/Map;Ljava/lang/String;JJ)V

    .line 590
    const-string v2, "mtime"

    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getModTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    const-wide/16 v3, 0x3e8

    div-long v3, v0, v3

    const-wide v5, 0x1ffffffffL

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->addPaxHeaderForBigNumber(Ljava/util/Map;Ljava/lang/String;JJ)V

    .line 593
    const-string v2, "uid"

    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getLongUserId()J

    move-result-wide v3

    const-wide/32 v5, 0x1fffff

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->addPaxHeaderForBigNumber(Ljava/util/Map;Ljava/lang/String;JJ)V

    .line 596
    const-string v2, "SCHILY.devmajor"

    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getDevMajor()I

    move-result v0

    int-to-long v3, v0

    const-wide/32 v5, 0x1fffff

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->addPaxHeaderForBigNumber(Ljava/util/Map;Ljava/lang/String;JJ)V

    .line 598
    const-string v2, "SCHILY.devminor"

    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getDevMinor()I

    move-result v0

    int-to-long v3, v0

    const-wide/32 v5, 0x1fffff

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->addPaxHeaderForBigNumber(Ljava/util/Map;Ljava/lang/String;JJ)V

    .line 601
    const-string v1, "mode"

    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getMode()I

    move-result v0

    int-to-long v2, v0

    const-wide/32 v4, 0x1fffff

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->failForBigNumber(Ljava/lang/String;JJ)V

    .line 602
    return-void
.end method

.method private failForBigNumber(Ljava/lang/String;JJ)V
    .registers 13
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "value"    # J
    .param p4, "maxValue"    # J

    .prologue
    .line 627
    const-string v6, ""

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->failForBigNumber(Ljava/lang/String;JJLjava/lang/String;)V

    .line 628
    return-void
.end method

.method private failForBigNumber(Ljava/lang/String;JJLjava/lang/String;)V
    .registers 10
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "value"    # J
    .param p4, "maxValue"    # J
    .param p6, "additionalMsg"    # Ljava/lang/String;

    .prologue
    .line 635
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-ltz v0, :cond_a

    cmp-long v0, p2, p4

    if-lez v0, :cond_3b

    .line 636
    :cond_a
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' is too big ( > "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " )."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 640
    :cond_3b
    return-void
.end method

.method private failForBigNumberWithPosixMessage(Ljava/lang/String;JJ)V
    .registers 13
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "value"    # J
    .param p4, "maxValue"    # J

    .prologue
    .line 631
    const-string v6, " Use STAR or POSIX extensions to overcome this limit"

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->failForBigNumber(Ljava/lang/String;JJLjava/lang/String;)V

    .line 632
    return-void
.end method

.method private failForBigNumbers(Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;)V
    .registers 14
    .param p1, "entry"    # Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    .prologue
    const-wide v4, 0x1ffffffffL

    const-wide/32 v10, 0x1fffff

    .line 613
    const-string v1, "entry size"

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getSize()J

    move-result-wide v2

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->failForBigNumber(Ljava/lang/String;JJ)V

    .line 614
    const-string v7, "group id"

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getLongGroupId()J

    move-result-wide v8

    move-object v6, p0

    invoke-direct/range {v6 .. v11}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->failForBigNumberWithPosixMessage(Ljava/lang/String;JJ)V

    .line 615
    const-string v1, "last modification time"

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getModTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    const-wide/16 v6, 0x3e8

    div-long/2addr v2, v6

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->failForBigNumber(Ljava/lang/String;JJ)V

    .line 618
    const-string v7, "user id"

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getLongUserId()J

    move-result-wide v8

    move-object v6, p0

    invoke-direct/range {v6 .. v11}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->failForBigNumber(Ljava/lang/String;JJ)V

    .line 619
    const-string v7, "mode"

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getMode()I

    move-result v0

    int-to-long v8, v0

    move-object v6, p0

    invoke-direct/range {v6 .. v11}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->failForBigNumber(Ljava/lang/String;JJ)V

    .line 620
    const-string v7, "major device number"

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getDevMajor()I

    move-result v0

    int-to-long v8, v0

    move-object v6, p0

    invoke-direct/range {v6 .. v11}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->failForBigNumber(Ljava/lang/String;JJ)V

    .line 622
    const-string v7, "minor device number"

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getDevMinor()I

    move-result v0

    int-to-long v8, v0

    move-object v6, p0

    invoke-direct/range {v6 .. v11}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->failForBigNumber(Ljava/lang/String;JJ)V

    .line 624
    return-void
.end method

.method private handleLongName(Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;BLjava/lang/String;)Z
    .registers 15
    .param p1, "entry"    # Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;
    .param p2, "name"    # Ljava/lang/String;
    .param p4, "paxHeaderName"    # Ljava/lang/String;
    .param p5, "linkType"    # B
    .param p6, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "B",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p3, "paxHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/16 v7, 0x64

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 668
    iget-object v5, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-interface {v5, p2}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 669
    .local v0, "encodedName":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v5

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v6

    sub-int v1, v5, v6

    .line 670
    .local v1, "len":I
    if-lt v1, v7, :cond_48

    .line 672
    iget v5, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->longFileMode:I

    const/4 v6, 0x3

    if-ne v5, v6, :cond_1f

    .line 673
    invoke-interface {p3, p4, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 692
    :goto_1e
    return v3

    .line 675
    :cond_1f
    iget v5, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->longFileMode:I

    const/4 v6, 0x2

    if-ne v5, v6, :cond_4a

    .line 678
    new-instance v2, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    const-string v3, "././@LongLink"

    invoke-direct {v2, v3, p5}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;-><init>(Ljava/lang/String;B)V

    .line 680
    .local v2, "longLinkEntry":Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;
    add-int/lit8 v3, v1, 0x1

    int-to-long v5, v3

    invoke-virtual {v2, v5, v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setSize(J)V

    .line 681
    invoke-direct {p0, p1, v2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->transferModTime(Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;)V

    .line 682
    invoke-virtual {p0, v2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->putArchiveEntry(Lorg/apache/commons/compress/archivers/ArchiveEntry;)V

    .line 683
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v5

    invoke-virtual {p0, v3, v5, v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->write([BII)V

    .line 684
    invoke-virtual {p0, v4}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->write(I)V

    .line 685
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->closeArchiveEntry()V

    .end local v2    # "longLinkEntry":Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;
    :cond_48
    move v3, v4

    .line 692
    goto :goto_1e

    .line 686
    :cond_4a
    iget v5, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->longFileMode:I

    if-eq v5, v3, :cond_48

    .line 687
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\' is too long ( > "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " bytes)"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private padAsNeeded()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 576
    iget v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordsWritten:I

    iget v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordsPerBlock:I

    rem-int v1, v2, v3

    .line 577
    .local v1, "start":I
    if-eqz v1, :cond_13

    .line 578
    move v0, v1

    .local v0, "i":I
    :goto_9
    iget v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordsPerBlock:I

    if-ge v0, v2, :cond_13

    .line 579
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->writeEOFRecord()V

    .line 578
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 582
    .end local v0    # "i":I
    :cond_13
    return-void
.end method

.method private shouldBeReplaced(C)Z
    .registers 3
    .param p1, "c"    # C

    .prologue
    .line 507
    if-eqz p1, :cond_a

    const/16 v0, 0x2f

    if-eq p1, v0, :cond_a

    const/16 v0, 0x5c

    if-ne p1, v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private stripTo7Bits(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 489
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 490
    .local v1, "length":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 491
    .local v2, "result":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    if-ge v0, v1, :cond_25

    .line 492
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    and-int/lit8 v4, v4, 0x7f

    int-to-char v3, v4

    .line 493
    .local v3, "stripped":C
    invoke-direct {p0, v3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->shouldBeReplaced(C)Z

    move-result v4

    if-eqz v4, :cond_21

    .line 494
    const-string v4, "_"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 491
    :goto_1e
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 496
    :cond_21
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1e

    .line 499
    .end local v3    # "stripped":C
    :cond_25
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private transferModTime(Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;)V
    .registers 12
    .param p1, "from"    # Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;
    .param p2, "to"    # Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    .prologue
    const-wide/16 v7, 0x0

    .line 696
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getModTime()Ljava/util/Date;

    move-result-object v0

    .line 697
    .local v0, "fromModTime":Ljava/util/Date;
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    const-wide/16 v5, 0x3e8

    div-long v1, v3, v5

    .line 698
    .local v1, "fromModTimeSeconds":J
    cmp-long v3, v1, v7

    if-ltz v3, :cond_1b

    const-wide v3, 0x1ffffffffL

    cmp-long v3, v1, v3

    if-lez v3, :cond_20

    .line 699
    :cond_1b
    new-instance v0, Ljava/util/Date;

    .end local v0    # "fromModTime":Ljava/util/Date;
    invoke-direct {v0, v7, v8}, Ljava/util/Date;-><init>(J)V

    .line 701
    .restart local v0    # "fromModTime":Ljava/util/Date;
    :cond_20
    invoke-virtual {p2, v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setModTime(Ljava/util/Date;)V

    .line 702
    return-void
.end method

.method private writeEOFRecord()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 517
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordBuf:[B

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([BB)V

    .line 518
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordBuf:[B

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->writeRecord([B)V

    .line 519
    return-void
.end method

.method private writeRecord([B)V
    .registers 5
    .param p1, "record"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 542
    array-length v0, p1

    iget v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordSize:I

    if-eq v0, v1, :cond_31

    .line 543
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "record to write has length \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' which is not the record size of \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 549
    :cond_31
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 550
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordsWritten:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordsWritten:I

    .line 551
    return-void
.end method

.method private writeRecord([BI)V
    .registers 6
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 564
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordSize:I

    add-int/2addr v0, p2

    array-length v1, p1

    if-le v0, v1, :cond_3c

    .line 565
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "record has length \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' with offset \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' which is less than the record size of \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 571
    :cond_3c
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->out:Ljava/io/OutputStream;

    iget v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordSize:I

    invoke-virtual {v0, p1, p2, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 572
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordsWritten:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordsWritten:I

    .line 573
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
    .line 240
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->finished:Z

    if-nez v0, :cond_7

    .line 241
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->finish()V

    .line 244
    :cond_7
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->closed:Z

    if-nez v0, :cond_13

    .line 245
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 246
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->closed:Z

    .line 248
    :cond_13
    return-void
.end method

.method public closeArchiveEntry()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 336
    iget-boolean v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->finished:Z

    if-eqz v1, :cond_d

    .line 337
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Stream has already been finished"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 339
    :cond_d
    iget-boolean v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->haveUnclosedEntry:Z

    if-nez v1, :cond_19

    .line 340
    new-instance v1, Ljava/io/IOException;

    const-string v2, "No current entry to close"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 342
    :cond_19
    iget v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemLen:I

    if-lez v1, :cond_3a

    .line 343
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemLen:I

    .local v0, "i":I
    :goto_1f
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemBuf:[B

    array-length v1, v1

    if-ge v0, v1, :cond_2b

    .line 344
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemBuf:[B

    aput-byte v5, v1, v0

    .line 343
    add-int/lit8 v0, v0, 0x1

    goto :goto_1f

    .line 347
    :cond_2b
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemBuf:[B

    invoke-direct {p0, v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->writeRecord([B)V

    .line 349
    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->currBytes:J

    iget v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemLen:I

    int-to-long v3, v3

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->currBytes:J

    .line 350
    iput v5, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemLen:I

    .line 353
    .end local v0    # "i":I
    :cond_3a
    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->currBytes:J

    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->currSize:J

    cmp-long v1, v1, v3

    if-gez v1, :cond_7b

    .line 354
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "entry \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->currName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' closed at \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->currBytes:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' before the \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->currSize:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' bytes specified in the header were written"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 359
    :cond_7b
    iput-boolean v5, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->haveUnclosedEntry:Z

    .line 360
    return-void
.end method

.method public createArchiveEntry(Ljava/io/File;Ljava/lang/String;)Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .registers 5
    .param p1, "inputFile"    # Ljava/io/File;
    .param p2, "entryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 529
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->finished:Z

    if-eqz v0, :cond_c

    .line 530
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Stream has already been finished"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 532
    :cond_c
    new-instance v0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-direct {v0, p1, p2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public finish()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 220
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->finished:Z

    if-eqz v0, :cond_c

    .line 221
    new-instance v0, Ljava/io/IOException;

    const-string v1, "This archive has already been finished"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 224
    :cond_c
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->haveUnclosedEntry:Z

    if-eqz v0, :cond_18

    .line 225
    new-instance v0, Ljava/io/IOException;

    const-string v1, "This archives contains unclosed entries."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 227
    :cond_18
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->writeEOFRecord()V

    .line 228
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->writeEOFRecord()V

    .line 229
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->padAsNeeded()V

    .line 230
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 231
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->finished:Z

    .line 232
    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 523
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 524
    return-void
.end method

.method public getBytesWritten()J
    .registers 3

    .prologue
    .line 206
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->out:Ljava/io/OutputStream;

    check-cast v0, Lorg/apache/commons/compress/utils/CountingOutputStream;

    invoke-virtual {v0}, Lorg/apache/commons/compress/utils/CountingOutputStream;->getBytesWritten()J

    move-result-wide v0

    return-wide v0
.end method

.method public getCount()I
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 201
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->getBytesWritten()J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method public getRecordSize()I
    .registers 2

    .prologue
    .line 256
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordSize:I

    return v0
.end method

.method public putArchiveEntry(Lorg/apache/commons/compress/archivers/ArchiveEntry;)V
    .registers 15
    .param p1, "archiveEntry"    # Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 274
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->finished:Z

    if-eqz v0, :cond_c

    .line 275
    new-instance v0, Ljava/io/IOException;

    const-string v4, "Stream has already been finished"

    invoke-direct {v0, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    move-object v1, p1

    .line 277
    check-cast v1, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    .line 278
    .local v1, "entry":Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 279
    .local v3, "paxHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v2

    .line 280
    .local v2, "entryName":Ljava/lang/String;
    const-string v4, "path"

    const/16 v5, 0x4c

    const-string v6, "file name"

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->handleLongName(Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;BLjava/lang/String;)Z

    move-result v12

    .line 283
    .local v12, "paxHeaderContainsPath":Z
    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getLinkName()Ljava/lang/String;

    move-result-object v6

    .line 284
    .local v6, "linkName":Ljava/lang/String;
    if-eqz v6, :cond_a8

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_a8

    const-string v8, "linkpath"

    const/16 v9, 0x4b

    const-string v10, "link name"

    move-object v4, p0

    move-object v5, v1

    move-object v7, v3

    invoke-direct/range {v4 .. v10}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->handleLongName(Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;BLjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a8

    const/4 v11, 0x1

    .line 288
    .local v11, "paxHeaderContainsLinkPath":Z
    :goto_3f
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->bigNumberMode:I

    const/4 v4, 0x2

    if-ne v0, v4, :cond_aa

    .line 289
    invoke-direct {p0, v3, v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->addPaxHeadersForBigNumbers(Ljava/util/Map;Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;)V

    .line 294
    :cond_47
    :goto_47
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->addPaxHeadersForNonAsciiNames:Z

    if-eqz v0, :cond_5a

    if-nez v12, :cond_5a

    sget-object v0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->ASCII:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-interface {v0, v2}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->canEncode(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5a

    .line 296
    const-string v0, "path"

    invoke-interface {v3, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    :cond_5a
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->addPaxHeadersForNonAsciiNames:Z

    if-eqz v0, :cond_79

    if-nez v11, :cond_79

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->isLink()Z

    move-result v0

    if-nez v0, :cond_6c

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->isSymbolicLink()Z

    move-result v0

    if-eqz v0, :cond_79

    :cond_6c
    sget-object v0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->ASCII:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-interface {v0, v6}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->canEncode(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_79

    .line 302
    const-string v0, "linkpath"

    invoke-interface {v3, v0, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    :cond_79
    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_82

    .line 306
    invoke-virtual {p0, v1, v2, v3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->writePaxHeaders(Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;Ljava/lang/String;Ljava/util/Map;)V

    .line 309
    :cond_82
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordBuf:[B

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->bigNumberMode:I

    const/4 v7, 0x1

    if-ne v0, v7, :cond_b3

    const/4 v0, 0x1

    :goto_8c
    invoke-virtual {v1, v4, v5, v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->writeEntryHeader([BLorg/apache/commons/compress/archivers/zip/ZipEncoding;Z)V

    .line 311
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordBuf:[B

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->writeRecord([B)V

    .line 313
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->currBytes:J

    .line 315
    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_b5

    .line 316
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->currSize:J

    .line 320
    :goto_a2
    iput-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->currName:Ljava/lang/String;

    .line 321
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->haveUnclosedEntry:Z

    .line 322
    return-void

    .line 284
    .end local v11    # "paxHeaderContainsLinkPath":Z
    :cond_a8
    const/4 v11, 0x0

    goto :goto_3f

    .line 290
    .restart local v11    # "paxHeaderContainsLinkPath":Z
    :cond_aa
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->bigNumberMode:I

    const/4 v4, 0x1

    if-eq v0, v4, :cond_47

    .line 291
    invoke-direct {p0, v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->failForBigNumbers(Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;)V

    goto :goto_47

    .line 309
    :cond_b3
    const/4 v0, 0x0

    goto :goto_8c

    .line 318
    :cond_b5
    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getSize()J

    move-result-wide v4

    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->currSize:J

    goto :goto_a2
.end method

.method public setAddPaxHeadersForNonAsciiNames(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 195
    iput-boolean p1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->addPaxHeadersForNonAsciiNames:Z

    .line 196
    return-void
.end method

.method public setBigNumberMode(I)V
    .registers 2
    .param p1, "bigNumberMode"    # I

    .prologue
    .line 186
    iput p1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->bigNumberMode:I

    .line 187
    return-void
.end method

.method public setLongFileMode(I)V
    .registers 2
    .param p1, "longFileMode"    # I

    .prologue
    .line 174
    iput p1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->longFileMode:I

    .line 175
    return-void
.end method

.method public write([BII)V
    .registers 11
    .param p1, "wBuf"    # [B
    .param p2, "wOffset"    # I
    .param p3, "numToWrite"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 378
    iget-boolean v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->haveUnclosedEntry:Z

    if-nez v2, :cond_d

    .line 379
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "No current tar entry"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 381
    :cond_d
    iget-wide v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->currBytes:J

    int-to-long v4, p3

    add-long/2addr v2, v4

    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->currSize:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_4e

    .line 382
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "request to write \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' bytes exceeds size in header of \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->currSize:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' bytes for entry \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->currName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 396
    :cond_4e
    iget v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemLen:I

    if-lez v2, :cond_83

    .line 397
    iget v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemLen:I

    add-int/2addr v2, p3

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordBuf:[B

    array-length v3, v3

    if-lt v2, v3, :cond_97

    .line 398
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordBuf:[B

    array-length v2, v2

    iget v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemLen:I

    sub-int v0, v2, v3

    .line 400
    .local v0, "aLen":I
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemBuf:[B

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordBuf:[B

    iget v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemLen:I

    invoke-static {v2, v6, v3, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 402
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordBuf:[B

    iget v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemLen:I

    invoke-static {p1, p2, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 404
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordBuf:[B

    invoke-direct {p0, v2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->writeRecord([B)V

    .line 406
    iget-wide v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->currBytes:J

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordBuf:[B

    array-length v4, v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->currBytes:J

    .line 407
    add-int/2addr p2, v0

    .line 408
    sub-int/2addr p3, v0

    .line 409
    iput v6, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemLen:I

    .line 425
    .end local v0    # "aLen":I
    :cond_83
    :goto_83
    if-lez p3, :cond_96

    .line 426
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordBuf:[B

    array-length v2, v2

    if-ge p3, v2, :cond_a6

    .line 427
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemBuf:[B

    iget v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemLen:I

    invoke-static {p1, p2, v2, v3, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 430
    iget v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemLen:I

    add-int/2addr v2, p3

    iput v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemLen:I

    .line 443
    :cond_96
    return-void

    .line 411
    :cond_97
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemBuf:[B

    iget v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemLen:I

    invoke-static {p1, p2, v2, v3, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 414
    add-int/2addr p2, p3

    .line 415
    iget v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemLen:I

    add-int/2addr v2, p3

    iput v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->assemLen:I

    .line 416
    const/4 p3, 0x0

    goto :goto_83

    .line 435
    :cond_a6
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->writeRecord([BI)V

    .line 437
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->recordBuf:[B

    array-length v1, v2

    .line 439
    .local v1, "num":I
    iget-wide v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->currBytes:J

    int-to-long v4, v1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->currBytes:J

    .line 440
    sub-int/2addr p3, v1

    .line 441
    add-int/2addr p2, v1

    .line 442
    goto :goto_83
.end method

.method writePaxHeaders(Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;Ljava/lang/String;Ljava/util/Map;)V
    .registers 17
    .param p1, "entry"    # Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;
    .param p2, "entryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 452
    .local p3, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "./PaxHeaders.X/"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-direct {p0, p2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->stripTo7Bits(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 453
    .local v7, "name":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v11

    const/16 v12, 0x64

    if-lt v11, v12, :cond_26

    .line 454
    const/4 v11, 0x0

    const/16 v12, 0x63

    invoke-virtual {v7, v11, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 456
    :cond_26
    new-instance v8, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    const/16 v11, 0x78

    invoke-direct {v8, v7, v11}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;-><init>(Ljava/lang/String;B)V

    .line 458
    .local v8, "pex":Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;
    invoke-direct {p0, p1, v8}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->transferModTime(Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;)V

    .line 460
    new-instance v10, Ljava/io/StringWriter;

    invoke-direct {v10}, Ljava/io/StringWriter;-><init>()V

    .line 461
    .local v10, "w":Ljava/io/StringWriter;
    invoke-interface/range {p3 .. p3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_3d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_c7

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 462
    .local v2, "h":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 463
    .local v4, "key":Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 464
    .local v9, "value":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v11

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v12

    add-int/2addr v11, v12

    add-int/lit8 v11, v11, 0x3

    add-int/lit8 v5, v11, 0x2

    .line 467
    .local v5, "len":I
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 468
    .local v6, "line":Ljava/lang/String;
    const-string v11, "UTF-8"

    invoke-virtual {v6, v11}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v11

    array-length v0, v11

    .line 469
    .local v0, "actualLength":I
    :goto_90
    if-eq v5, v0, :cond_c2

    .line 475
    move v5, v0

    .line 476
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 477
    const-string v11, "UTF-8"

    invoke-virtual {v6, v11}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v11

    array-length v0, v11

    goto :goto_90

    .line 479
    :cond_c2
    invoke-virtual {v10, v6}, Ljava/io/StringWriter;->write(Ljava/lang/String;)V

    goto/16 :goto_3d

    .line 481
    .end local v0    # "actualLength":I
    .end local v2    # "h":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "len":I
    .end local v6    # "line":Ljava/lang/String;
    .end local v9    # "value":Ljava/lang/String;
    :cond_c7
    invoke-virtual {v10}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v12, "UTF-8"

    invoke-virtual {v11, v12}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 482
    .local v1, "data":[B
    array-length v11, v1

    int-to-long v11, v11

    invoke-virtual {v8, v11, v12}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setSize(J)V

    .line 483
    invoke-virtual {p0, v8}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->putArchiveEntry(Lorg/apache/commons/compress/archivers/ArchiveEntry;)V

    .line 484
    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->write([B)V

    .line 485
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;->closeArchiveEntry()V

    .line 486
    return-void
.end method
