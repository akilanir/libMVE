.class public Lorg/apache/commons/compress/archivers/zip/ZipFile;
.super Ljava/lang/Object;
.source "ZipFile.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/compress/archivers/zip/ZipFile$3;,
        Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;,
        Lorg/apache/commons/compress/archivers/zip/ZipFile$NameAndComment;,
        Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;,
        Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;
    }
.end annotation


# static fields
.field static final BYTE_SHIFT:I = 0x8

.field private static final CFD_LOCATOR_OFFSET:I = 0x10

.field private static final CFH_LEN:I = 0x2a

.field private static final CFH_SIG:J

.field private static final HASH_SIZE:I = 0x1fd

.field private static final LFH_OFFSET_FOR_FILENAME_LENGTH:J = 0x1aL

.field private static final MAX_EOCD_SIZE:I = 0x10015

.field static final MIN_EOCD_SIZE:I = 0x16

.field static final NIBLET_MASK:I = 0xf

.field private static final POS_0:I = 0x0

.field private static final POS_1:I = 0x1

.field private static final POS_2:I = 0x2

.field private static final POS_3:I = 0x3

.field private static final ZIP64_EOCDL_LENGTH:I = 0x14

.field private static final ZIP64_EOCDL_LOCATOR_OFFSET:I = 0x8

.field private static final ZIP64_EOCD_CFD_LOCATOR_OFFSET:I = 0x30


# instance fields
.field private final CFH_BUF:[B

.field private final DWORD_BUF:[B

.field private final OFFSET_COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final SHORT_BUF:[B

.field private final WORD_BUF:[B

.field private final archive:Ljava/io/RandomAccessFile;

.field private final archiveName:Ljava/lang/String;

.field private volatile closed:Z

.field private final encoding:Ljava/lang/String;

.field private final entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final nameMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/LinkedList",
            "<",
            "Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;",
            ">;>;"
        }
    .end annotation
.end field

.field private final useUnicodeExtraFields:Z

.field private final zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 503
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->CFH_SIG:[B

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue([B)J

    move-result-wide v0

    sput-wide v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->CFH_SIG:J

    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 153
    const-string v0, "UTF8"

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/archivers/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 154
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;)V
    .registers 4
    .param p1, "f"    # Ljava/io/File;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 192
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/compress/archivers/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;Z)V

    .line 193
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;Z)V
    .registers 10
    .param p1, "f"    # Ljava/io/File;
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "useUnicodeExtraFields"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->entries:Ljava/util/List;

    .line 97
    new-instance v4, Ljava/util/HashMap;

    const/16 v5, 0x1fd

    invoke-direct {v4, v5}, Ljava/util/HashMap;-><init>(I)V

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->nameMap:Ljava/util/Map;

    .line 137
    iput-boolean v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->closed:Z

    .line 140
    const/16 v4, 0x8

    new-array v4, v4, [B

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->DWORD_BUF:[B

    .line 141
    const/4 v4, 0x4

    new-array v4, v4, [B

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->WORD_BUF:[B

    .line 142
    const/16 v4, 0x2a

    new-array v4, v4, [B

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->CFH_BUF:[B

    .line 143
    const/4 v4, 0x2

    new-array v4, v4, [B

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->SHORT_BUF:[B

    .line 1069
    new-instance v4, Lorg/apache/commons/compress/archivers/zip/ZipFile$2;

    invoke-direct {v4, p0}, Lorg/apache/commons/compress/archivers/zip/ZipFile$2;-><init>(Lorg/apache/commons/compress/archivers/zip/ZipFile;)V

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->OFFSET_COMPARATOR:Ljava/util/Comparator;

    .line 209
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archiveName:Ljava/lang/String;

    .line 210
    iput-object p2, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->encoding:Ljava/lang/String;

    .line 211
    invoke-static {p2}, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    .line 212
    iput-boolean p3, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->useUnicodeExtraFields:Z

    .line 213
    new-instance v4, Ljava/io/RandomAccessFile;

    const-string v5, "r"

    invoke-direct {v4, p1, v5}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    .line 214
    const/4 v1, 0x0

    .line 216
    .local v1, "success":Z
    :try_start_4e
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->populateFromCentralDirectory()Ljava/util/Map;

    move-result-object v0

    .line 218
    .local v0, "entriesWithoutUTF8Flag":Ljava/util/Map;, "Ljava/util/Map<Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/compress/archivers/zip/ZipFile$NameAndComment;>;"
    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->resolveLocalFileHeaderData(Ljava/util/Map;)V
    :try_end_55
    .catchall {:try_start_4e .. :try_end_55} :catchall_64

    .line 219
    const/4 v1, 0x1

    .line 221
    if-nez v1, :cond_62

    :goto_58
    iput-boolean v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->closed:Z

    .line 222
    if-nez v1, :cond_61

    .line 223
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-static {v2}, Lorg/apache/commons/compress/utils/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 226
    :cond_61
    return-void

    :cond_62
    move v2, v3

    .line 221
    goto :goto_58

    .end local v0    # "entriesWithoutUTF8Flag":Ljava/util/Map;, "Ljava/util/Map<Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/compress/archivers/zip/ZipFile$NameAndComment;>;"
    :catchall_64
    move-exception v4

    if-nez v1, :cond_71

    :goto_67
    iput-boolean v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->closed:Z

    .line 222
    if-nez v1, :cond_70

    .line 223
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-static {v2}, Lorg/apache/commons/compress/utils/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    :cond_70
    throw v4

    :cond_71
    move v2, v3

    .line 221
    goto :goto_67
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const-string v1, "UTF8"

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 165
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 178
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-direct {p0, v0, p2, v1}, Lorg/apache/commons/compress/archivers/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;Z)V

    .line 179
    return-void
.end method

.method static synthetic access$600(Lorg/apache/commons/compress/archivers/zip/ZipFile;)Ljava/io/RandomAccessFile;
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipFile;

    .prologue
    .line 78
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    return-object v0
.end method

.method public static closeQuietly(Lorg/apache/commons/compress/archivers/zip/ZipFile;)V
    .registers 1
    .param p0, "zipfile"    # Lorg/apache/commons/compress/archivers/zip/ZipFile;

    .prologue
    .line 256
    invoke-static {p0}, Lorg/apache/commons/compress/utils/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 257
    return-void
.end method

.method private getRawInputStream(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Ljava/io/InputStream;
    .registers 9
    .param p1, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .prologue
    .line 360
    instance-of v0, p1, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;

    if-nez v0, :cond_6

    .line 361
    const/4 v0, 0x0

    .line 365
    :goto_5
    return-object v0

    :cond_6
    move-object v0, p1

    .line 363
    check-cast v0, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;->getOffsetEntry()Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;

    move-result-object v6

    .line 364
    .local v6, "offsetEntry":Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;
    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;->dataOffset:J
    invoke-static {v6}, Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;->access$000(Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;)J

    move-result-wide v2

    .line 365
    .local v2, "start":J
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v4

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;-><init>(Lorg/apache/commons/compress/archivers/zip/ZipFile;JJ)V

    goto :goto_5
.end method

.method private populateFromCentralDirectory()Ljava/util/Map;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;",
            "Lorg/apache/commons/compress/archivers/zip/ZipFile$NameAndComment;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 519
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 522
    .local v0, "noUTF8Flag":Ljava/util/HashMap;, "Ljava/util/HashMap<Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/compress/archivers/zip/ZipFile$NameAndComment;>;"
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->positionAtCentralDirectory()V

    .line 524
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->WORD_BUF:[B

    invoke-virtual {v3, v4}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 525
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->WORD_BUF:[B

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue([B)J

    move-result-wide v1

    .line 527
    .local v1, "sig":J
    sget-wide v3, Lorg/apache/commons/compress/archivers/zip/ZipFile;->CFH_SIG:J

    cmp-long v3, v1, v3

    if-eqz v3, :cond_29

    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->startsWithLocalFileHeader()Z

    move-result v3

    if-eqz v3, :cond_29

    .line 528
    new-instance v3, Ljava/io/IOException;

    const-string v4, "central directory is empty, can\'t expand corrupt archive."

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 532
    :cond_29
    :goto_29
    sget-wide v3, Lorg/apache/commons/compress/archivers/zip/ZipFile;->CFH_SIG:J

    cmp-long v3, v1, v3

    if-nez v3, :cond_40

    .line 533
    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->readCentralDirectoryEntry(Ljava/util/Map;)V

    .line 534
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->WORD_BUF:[B

    invoke-virtual {v3, v4}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 535
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->WORD_BUF:[B

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue([B)J

    move-result-wide v1

    goto :goto_29

    .line 537
    :cond_40
    return-object v0
.end method

.method private positionAtCentralDirectory()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v5, 0x14

    .line 777
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->positionAtEndOfCentralDirectoryRecord()V

    .line 778
    const/4 v0, 0x0

    .line 779
    .local v0, "found":Z
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v2

    cmp-long v2, v2, v5

    if-lez v2, :cond_3b

    const/4 v1, 0x1

    .line 781
    .local v1, "searchedForZip64EOCD":Z
    :goto_11
    if-eqz v1, :cond_2e

    .line 782
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v3

    sub-long/2addr v3, v5

    invoke-virtual {v2, v3, v4}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 783
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->WORD_BUF:[B

    invoke-virtual {v2, v3}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 784
    sget-object v2, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->ZIP64_EOCD_LOC_SIG:[B

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->WORD_BUF:[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    .line 787
    :cond_2e
    if-nez v0, :cond_3d

    .line 789
    if-eqz v1, :cond_37

    .line 790
    const/16 v2, 0x10

    invoke-direct {p0, v2}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->skipBytes(I)V

    .line 792
    :cond_37
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->positionAtCentralDirectory32()V

    .line 796
    :goto_3a
    return-void

    .line 779
    .end local v1    # "searchedForZip64EOCD":Z
    :cond_3b
    const/4 v1, 0x0

    goto :goto_11

    .line 794
    .restart local v1    # "searchedForZip64EOCD":Z
    :cond_3d
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->positionAtCentralDirectory64()V

    goto :goto_3a
.end method

.method private positionAtCentralDirectory32()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 833
    const/16 v0, 0x10

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->skipBytes(I)V

    .line 834
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->WORD_BUF:[B

    invoke-virtual {v0, v1}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 835
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->WORD_BUF:[B

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue([B)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 836
    return-void
.end method

.method private positionAtCentralDirectory64()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 809
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->skipBytes(I)V

    .line 811
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->DWORD_BUF:[B

    invoke-virtual {v0, v1}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 812
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->DWORD_BUF:[B

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getLongValue([B)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 813
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->WORD_BUF:[B

    invoke-virtual {v0, v1}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 814
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->WORD_BUF:[B

    sget-object v1, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->ZIP64_EOCD_SIG:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_2f

    .line 815
    new-instance v0, Ljava/util/zip/ZipException;

    const-string v1, "archive\'s ZIP64 end of central directory locator is corrupt."

    invoke-direct {v0, v1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 818
    :cond_2f
    const/16 v0, 0x2c

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->skipBytes(I)V

    .line 820
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->DWORD_BUF:[B

    invoke-virtual {v0, v1}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 821
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->DWORD_BUF:[B

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getLongValue([B)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 822
    return-void
.end method

.method private positionAtEndOfCentralDirectoryRecord()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 844
    const-wide/16 v1, 0x16

    const-wide/32 v3, 0x10015

    sget-object v5, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->EOCD_SIG:[B

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->tryToLocateSignature(JJ[B)Z

    move-result v6

    .line 846
    .local v6, "found":Z
    if-nez v6, :cond_16

    .line 847
    new-instance v0, Ljava/util/zip/ZipException;

    const-string v1, "archive is not a ZIP archive"

    invoke-direct {v0, v1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 849
    :cond_16
    return-void
.end method

.method private readCentralDirectoryEntry(Ljava/util/Map;)V
    .registers 23
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;",
            "Lorg/apache/commons/compress/archivers/zip/ZipFile$NameAndComment;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 552
    .local p1, "noUTF8Flag":Ljava/util/Map;, "Ljava/util/Map<Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/compress/archivers/zip/ZipFile$NameAndComment;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->CFH_BUF:[B

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 553
    const/4 v13, 0x0

    .line 554
    .local v13, "off":I
    new-instance v14, Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;

    const/16 v19, 0x0

    move-object/from16 v0, v19

    invoke-direct {v14, v0}, Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;-><init>(Lorg/apache/commons/compress/archivers/zip/ZipFile$1;)V

    .line 555
    .local v14, "offset":Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;
    new-instance v18, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;

    move-object/from16 v0, v18

    invoke-direct {v0, v14}, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;-><init>(Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;)V

    .line 557
    .local v18, "ze":Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->CFH_BUF:[B

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-static {v0, v13}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue([BI)I

    move-result v17

    .line 558
    .local v17, "versionMadeBy":I
    add-int/lit8 v13, v13, 0x2

    .line 559
    shr-int/lit8 v19, v17, 0x8

    and-int/lit8 v19, v19, 0xf

    invoke-virtual/range {v18 .. v19}, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;->setPlatform(I)V

    .line 561
    add-int/lit8 v13, v13, 0x2

    .line 563
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->CFH_BUF:[B

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-static {v0, v13}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->parse([BI)Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    move-result-object v11

    .line 564
    .local v11, "gpFlag":Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;
    invoke-virtual {v11}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->usesUTF8ForNames()Z

    move-result v12

    .line 565
    .local v12, "hasUTF8Flag":Z
    if-eqz v12, :cond_18a

    sget-object v7, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->UTF8_ZIP_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    .line 567
    .local v7, "entryEncoding":Lorg/apache/commons/compress/archivers/zip/ZipEncoding;
    :goto_4b
    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;->setGeneralPurposeBit(Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;)V

    .line 569
    add-int/lit8 v13, v13, 0x2

    .line 571
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->CFH_BUF:[B

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-static {v0, v13}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue([BI)I

    move-result v19

    invoke-virtual/range {v18 .. v19}, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;->setMethod(I)V

    .line 572
    add-int/lit8 v13, v13, 0x2

    .line 574
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->CFH_BUF:[B

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-static {v0, v13}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue([BI)J

    move-result-wide v19

    invoke-static/range {v19 .. v20}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->dosToJavaTime(J)J

    move-result-wide v15

    .line 575
    .local v15, "time":J
    move-object/from16 v0, v18

    move-wide v1, v15

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;->setTime(J)V

    .line 576
    add-int/lit8 v13, v13, 0x4

    .line 578
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->CFH_BUF:[B

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-static {v0, v13}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue([BI)J

    move-result-wide v19

    invoke-virtual/range {v18 .. v20}, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;->setCrc(J)V

    .line 579
    add-int/lit8 v13, v13, 0x4

    .line 581
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->CFH_BUF:[B

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-static {v0, v13}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue([BI)J

    move-result-wide v19

    invoke-virtual/range {v18 .. v20}, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;->setCompressedSize(J)V

    .line 582
    add-int/lit8 v13, v13, 0x4

    .line 584
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->CFH_BUF:[B

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-static {v0, v13}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue([BI)J

    move-result-wide v19

    invoke-virtual/range {v18 .. v20}, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;->setSize(J)V

    .line 585
    add-int/lit8 v13, v13, 0x4

    .line 587
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->CFH_BUF:[B

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-static {v0, v13}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue([BI)I

    move-result v10

    .line 588
    .local v10, "fileNameLen":I
    add-int/lit8 v13, v13, 0x2

    .line 590
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->CFH_BUF:[B

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-static {v0, v13}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue([BI)I

    move-result v8

    .line 591
    .local v8, "extraLen":I
    add-int/lit8 v13, v13, 0x2

    .line 593
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->CFH_BUF:[B

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-static {v0, v13}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue([BI)I

    move-result v5

    .line 594
    .local v5, "commentLen":I
    add-int/lit8 v13, v13, 0x2

    .line 596
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->CFH_BUF:[B

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-static {v0, v13}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue([BI)I

    move-result v6

    .line 597
    .local v6, "diskStart":I
    add-int/lit8 v13, v13, 0x2

    .line 599
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->CFH_BUF:[B

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-static {v0, v13}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue([BI)I

    move-result v19

    invoke-virtual/range {v18 .. v19}, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;->setInternalAttributes(I)V

    .line 600
    add-int/lit8 v13, v13, 0x2

    .line 602
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->CFH_BUF:[B

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-static {v0, v13}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue([BI)J

    move-result-wide v19

    invoke-virtual/range {v18 .. v20}, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;->setExternalAttributes(J)V

    .line 603
    add-int/lit8 v13, v13, 0x4

    .line 605
    new-array v9, v10, [B

    .line 606
    .local v9, "fileName":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 607
    invoke-interface {v7, v9}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->decode([B)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v9}, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;->setName(Ljava/lang/String;[B)V

    .line 610
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->CFH_BUF:[B

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-static {v0, v13}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue([BI)J

    move-result-wide v19

    move-wide/from16 v0, v19

    # setter for: Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;->headerOffset:J
    invoke-static {v14, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;->access$202(Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;J)J

    .line 612
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->entries:Ljava/util/List;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 614
    new-array v3, v8, [B

    .line 615
    .local v3, "cdExtraData":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 616
    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;->setCentralDirectoryExtra([B)V

    .line 618
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v14, v6}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->setSizesAndOffsetFromZip64Extra(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;I)V

    .line 620
    new-array v4, v5, [B

    .line 621
    .local v4, "comment":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 622
    invoke-interface {v7, v4}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->decode([B)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;->setComment(Ljava/lang/String;)V

    .line 624
    if-nez v12, :cond_189

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->useUnicodeExtraFields:Z

    move/from16 v19, v0

    if-eqz v19, :cond_189

    .line 625
    new-instance v19, Lorg/apache/commons/compress/archivers/zip/ZipFile$NameAndComment;

    const/16 v20, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v0, v9, v4, v1}, Lorg/apache/commons/compress/archivers/zip/ZipFile$NameAndComment;-><init>([B[BLorg/apache/commons/compress/archivers/zip/ZipFile$1;)V

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 627
    :cond_189
    return-void

    .line 565
    .end local v3    # "cdExtraData":[B
    .end local v4    # "comment":[B
    .end local v5    # "commentLen":I
    .end local v6    # "diskStart":I
    .end local v7    # "entryEncoding":Lorg/apache/commons/compress/archivers/zip/ZipEncoding;
    .end local v8    # "extraLen":I
    .end local v9    # "fileName":[B
    .end local v10    # "fileNameLen":I
    .end local v15    # "time":J
    :cond_18a
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    goto/16 :goto_4b
.end method

.method private resolveLocalFileHeaderData(Ljava/util/Map;)V
    .registers 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;",
            "Lorg/apache/commons/compress/archivers/zip/ZipFile$NameAndComment;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 931
    .local p1, "entriesWithoutUTF8Flag":Ljava/util/Map;, "Ljava/util/Map<Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/compress/archivers/zip/ZipFile$NameAndComment;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->entries:Ljava/util/List;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_ee

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .local v15, "zipArchiveEntry":Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    move-object v14, v15

    .line 934
    check-cast v14, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;

    .line 935
    .local v14, "ze":Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;
    invoke-virtual {v14}, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;->getOffsetEntry()Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;

    move-result-object v12

    .line 936
    .local v12, "offsetEntry":Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;
    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;->headerOffset:J
    invoke-static {v12}, Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;)J

    move-result-wide v10

    .line 937
    .local v10, "offset":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    move-object/from16 v16, v0

    const-wide/16 v17, 0x1a

    add-long v17, v17, v10

    invoke-virtual/range {v16 .. v18}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 938
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->SHORT_BUF:[B

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 939
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->SHORT_BUF:[B

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue([B)I

    move-result v4

    .line 940
    .local v4, "fileNameLen":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->SHORT_BUF:[B

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 941
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->SHORT_BUF:[B

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue([B)I

    move-result v3

    .line 942
    .local v3, "extraFieldLen":I
    move v6, v4

    .line 943
    .local v6, "lenToSkip":I
    :goto_61
    if-lez v6, :cond_7b

    .line 944
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Ljava/io/RandomAccessFile;->skipBytes(I)I

    move-result v13

    .line 945
    .local v13, "skipped":I
    if-gtz v13, :cond_79

    .line 946
    new-instance v16, Ljava/io/IOException;

    const-string v17, "failed to skip file name in local file header"

    invoke-direct/range {v16 .. v17}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 949
    :cond_79
    sub-int/2addr v6, v13

    .line 950
    goto :goto_61

    .line 951
    .end local v13    # "skipped":I
    :cond_7b
    new-array v7, v3, [B

    .line 952
    .local v7, "localExtraData":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 953
    invoke-virtual {v14, v7}, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;->setExtra([B)V

    .line 954
    const-wide/16 v16, 0x1a

    add-long v16, v16, v10

    const-wide/16 v18, 0x2

    add-long v16, v16, v18

    const-wide/16 v18, 0x2

    add-long v16, v16, v18

    int-to-long v0, v4

    move-wide/from16 v18, v0

    add-long v16, v16, v18

    int-to-long v0, v3

    move-wide/from16 v18, v0

    add-long v16, v16, v18

    move-wide/from16 v0, v16

    # setter for: Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;->dataOffset:J
    invoke-static {v12, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;->access$002(Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;J)J

    .line 957
    move-object/from16 v0, p1

    invoke-interface {v0, v14}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_c5

    .line 958
    move-object/from16 v0, p1

    invoke-interface {v0, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/apache/commons/compress/archivers/zip/ZipFile$NameAndComment;

    .line 959
    .local v9, "nc":Lorg/apache/commons/compress/archivers/zip/ZipFile$NameAndComment;
    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipFile$NameAndComment;->name:[B
    invoke-static {v9}, Lorg/apache/commons/compress/archivers/zip/ZipFile$NameAndComment;->access$400(Lorg/apache/commons/compress/archivers/zip/ZipFile$NameAndComment;)[B

    move-result-object v16

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipFile$NameAndComment;->comment:[B
    invoke-static {v9}, Lorg/apache/commons/compress/archivers/zip/ZipFile$NameAndComment;->access$500(Lorg/apache/commons/compress/archivers/zip/ZipFile$NameAndComment;)[B

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v14, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->setNameAndCommentFromExtraFields(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;[B[B)V

    .line 963
    .end local v9    # "nc":Lorg/apache/commons/compress/archivers/zip/ZipFile$NameAndComment;
    :cond_c5
    invoke-virtual {v14}, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;->getName()Ljava/lang/String;

    move-result-object v8

    .line 964
    .local v8, "name":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->nameMap:Ljava/util/Map;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-interface {v0, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/LinkedList;

    .line 965
    .local v2, "entriesOfThatName":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;>;"
    if-nez v2, :cond_e9

    .line 966
    new-instance v2, Ljava/util/LinkedList;

    .end local v2    # "entriesOfThatName":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;>;"
    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 967
    .restart local v2    # "entriesOfThatName":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->nameMap:Ljava/util/Map;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-interface {v0, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 969
    :cond_e9
    invoke-virtual {v2, v14}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    goto/16 :goto_a

    .line 971
    .end local v2    # "entriesOfThatName":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;>;"
    .end local v3    # "extraFieldLen":I
    .end local v4    # "fileNameLen":I
    .end local v6    # "lenToSkip":I
    .end local v7    # "localExtraData":[B
    .end local v8    # "name":Ljava/lang/String;
    .end local v10    # "offset":J
    .end local v12    # "offsetEntry":Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;
    .end local v14    # "ze":Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;
    .end local v15    # "zipArchiveEntry":Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    :cond_ee
    return-void
.end method

.method private setSizesAndOffsetFromZip64Extra(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;I)V
    .registers 14
    .param p1, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .param p2, "offset"    # Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;
    .param p3, "diskStart"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide v8, 0xffffffffL

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 645
    sget-object v6, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->HEADER_ID:Lorg/apache/commons/compress/archivers/zip/ZipShort;

    invoke-virtual {p1, v6}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getExtraField(Lorg/apache/commons/compress/archivers/zip/ZipShort;)Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;

    .line 648
    .local v3, "z64":Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;
    if-eqz v3, :cond_5b

    .line 649
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v6

    cmp-long v6, v6, v8

    if-nez v6, :cond_5c

    move v2, v4

    .line 650
    .local v2, "hasUncompressedSize":Z
    :goto_1a
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v6

    cmp-long v6, v6, v8

    if-nez v6, :cond_5e

    move v0, v4

    .line 651
    .local v0, "hasCompressedSize":Z
    :goto_23
    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;->headerOffset:J
    invoke-static {p2}, Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;)J

    move-result-wide v6

    cmp-long v6, v6, v8

    if-nez v6, :cond_60

    move v1, v4

    .line 653
    .local v1, "hasRelativeHeaderOffset":Z
    :goto_2c
    const v6, 0xffff

    if-ne p3, v6, :cond_62

    :goto_31
    invoke-virtual {v3, v2, v0, v1, v4}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->reparseCentralDirectoryData(ZZZZ)V

    .line 658
    if-eqz v2, :cond_64

    .line 659
    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->getSize()Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getLongValue()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    .line 664
    :cond_41
    :goto_41
    if-eqz v0, :cond_73

    .line 665
    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->getCompressedSize()Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getLongValue()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setCompressedSize(J)V

    .line 670
    :cond_4e
    :goto_4e
    if-eqz v1, :cond_5b

    .line 671
    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->getRelativeHeaderOffset()Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getLongValue()J

    move-result-wide v4

    # setter for: Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;->headerOffset:J
    invoke-static {p2, v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;->access$202(Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;J)J

    .line 675
    .end local v0    # "hasCompressedSize":Z
    .end local v1    # "hasRelativeHeaderOffset":Z
    .end local v2    # "hasUncompressedSize":Z
    :cond_5b
    return-void

    :cond_5c
    move v2, v5

    .line 649
    goto :goto_1a

    .restart local v2    # "hasUncompressedSize":Z
    :cond_5e
    move v0, v5

    .line 650
    goto :goto_23

    .restart local v0    # "hasCompressedSize":Z
    :cond_60
    move v1, v5

    .line 651
    goto :goto_2c

    .restart local v1    # "hasRelativeHeaderOffset":Z
    :cond_62
    move v4, v5

    .line 653
    goto :goto_31

    .line 660
    :cond_64
    if-eqz v0, :cond_41

    .line 661
    new-instance v4, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v5

    invoke-direct {v4, v5, v6}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;-><init>(J)V

    invoke-virtual {v3, v4}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->setSize(Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;)V

    goto :goto_41

    .line 666
    :cond_73
    if-eqz v2, :cond_4e

    .line 667
    new-instance v4, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v5

    invoke-direct {v4, v5, v6}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;-><init>(J)V

    invoke-virtual {v3, v4}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->setCompressedSize(Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;)V

    goto :goto_4e
.end method

.method private skipBytes(I)V
    .registers 6
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 896
    const/4 v1, 0x0

    .line 897
    .local v1, "totalSkipped":I
    :goto_1
    if-ge v1, p1, :cond_15

    .line 898
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    sub-int v3, p1, v1

    invoke-virtual {v2, v3}, Ljava/io/RandomAccessFile;->skipBytes(I)I

    move-result v0

    .line 899
    .local v0, "skippedNow":I
    if-gtz v0, :cond_13

    .line 900
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 902
    :cond_13
    add-int/2addr v1, v0

    .line 903
    goto :goto_1

    .line 904
    .end local v0    # "skippedNow":I
    :cond_15
    return-void
.end method

.method private startsWithLocalFileHeader()Z
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 978
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 979
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->WORD_BUF:[B

    invoke-virtual {v0, v1}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 980
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->WORD_BUF:[B

    sget-object v1, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->LFH_SIG:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    return v0
.end method

.method private tryToLocateSignature(JJ[B)Z
    .registers 16
    .param p1, "minDistanceFromEnd"    # J
    .param p3, "maxDistanceFromEnd"    # J
    .param p5, "sig"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x0

    .line 859
    const/4 v1, 0x0

    .line 860
    .local v1, "found":Z
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v6}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v6

    sub-long v2, v6, p1

    .line 861
    .local v2, "off":J
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v6}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v6

    sub-long/2addr v6, p3

    invoke-static {v8, v9, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    .line 863
    .local v4, "stopSearching":J
    cmp-long v6, v2, v8

    if-ltz v6, :cond_2c

    .line 864
    :goto_1a
    cmp-long v6, v2, v4

    if-ltz v6, :cond_2c

    .line 865
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v6, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 866
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v6}, Ljava/io/RandomAccessFile;->read()I

    move-result v0

    .line 867
    .local v0, "curr":I
    const/4 v6, -0x1

    if-ne v0, v6, :cond_34

    .line 885
    .end local v0    # "curr":I
    :cond_2c
    :goto_2c
    if-eqz v1, :cond_33

    .line 886
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v6, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 888
    :cond_33
    return v1

    .line 870
    .restart local v0    # "curr":I
    :cond_34
    const/4 v6, 0x0

    aget-byte v6, p5, v6

    if-ne v0, v6, :cond_5c

    .line 871
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v6}, Ljava/io/RandomAccessFile;->read()I

    move-result v0

    .line 872
    const/4 v6, 0x1

    aget-byte v6, p5, v6

    if-ne v0, v6, :cond_5c

    .line 873
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v6}, Ljava/io/RandomAccessFile;->read()I

    move-result v0

    .line 874
    const/4 v6, 0x2

    aget-byte v6, p5, v6

    if-ne v0, v6, :cond_5c

    .line 875
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v6}, Ljava/io/RandomAccessFile;->read()I

    move-result v0

    .line 876
    const/4 v6, 0x3

    aget-byte v6, p5, v6

    if-ne v0, v6, :cond_5c

    .line 877
    const/4 v1, 0x1

    .line 878
    goto :goto_2c

    .line 864
    :cond_5c
    const-wide/16 v6, 0x1

    sub-long/2addr v2, v6

    goto :goto_1a
.end method


# virtual methods
.method public canReadEntryData(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z
    .registers 3
    .param p1, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .prologue
    .line 347
    invoke-static {p1}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->canHandleEntryData(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

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
    .line 245
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->closed:Z

    .line 247
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 248
    return-void
.end method

.method public copyRawEntries(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntryPredicate;)V
    .registers 6
    .param p1, "target"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;
    .param p2, "predicate"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntryPredicate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 380
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->getEntriesInPhysicalOrder()Ljava/util/Enumeration;

    move-result-object v1

    .line 381
    .local v1, "src":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;>;"
    :cond_4
    :goto_4
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 382
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .line 383
    .local v0, "entry":Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-interface {p2, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntryPredicate;->test(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 384
    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->getRawInputStream(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Ljava/io/InputStream;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->addRawArchiveEntry(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Ljava/io/InputStream;)V

    goto :goto_4

    .line 387
    .end local v0    # "entry":Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    :cond_1e
    return-void
.end method

.method protected finalize()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 471
    :try_start_0
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->closed:Z

    if-nez v0, :cond_21

    .line 472
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cleaning up unclosed ZipFile for archive "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->archiveName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 474
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->close()V
    :try_end_21
    .catchall {:try_start_0 .. :try_end_21} :catchall_25

    .line 477
    :cond_21
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 479
    return-void

    .line 477
    :catchall_25
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method public getEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 234
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method public getEntries(Ljava/lang/String;)Ljava/lang/Iterable;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 314
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->nameMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 315
    .local v0, "entriesOfThatName":Ljava/util/List;, "Ljava/util/List<Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;>;"
    if-eqz v0, :cond_b

    .end local v0    # "entriesOfThatName":Ljava/util/List;, "Ljava/util/List<Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;>;"
    :goto_a
    return-object v0

    .restart local v0    # "entriesOfThatName":Ljava/util/List;, "Ljava/util/List<Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;>;"
    :cond_b
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_a
.end method

.method public getEntries()Ljava/util/Enumeration;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Enumeration",
            "<",
            "Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 268
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->entries:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getEntriesInPhysicalOrder(Ljava/lang/String;)Ljava/lang/Iterable;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 329
    const/4 v1, 0x0

    new-array v0, v1, [Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .line 330
    .local v0, "entriesOfThatName":[Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->nameMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 331
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->nameMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "entriesOfThatName":[Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    check-cast v0, [Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .line 332
    .restart local v0    # "entriesOfThatName":[Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->OFFSET_COMPARATOR:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 334
    :cond_1e
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public getEntriesInPhysicalOrder()Ljava/util/Enumeration;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Enumeration",
            "<",
            "Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 282
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->entries:Ljava/util/List;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .line 283
    .local v0, "allEntries":[Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->OFFSET_COMPARATOR:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 284
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    move-result-object v1

    return-object v1
.end method

.method public getEntry(Ljava/lang/String;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 300
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->nameMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/LinkedList;

    .line 301
    .local v0, "entriesOfThatName":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;>;"
    if-eqz v0, :cond_11

    invoke-virtual {v0}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    :goto_10
    return-object v1

    :cond_11
    const/4 v1, 0x0

    goto :goto_10
.end method

.method public getInputStream(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Ljava/io/InputStream;
    .registers 11
    .param p1, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    .line 399
    instance-of v1, p1, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;

    if-nez v1, :cond_6

    .line 400
    const/4 v0, 0x0

    .line 419
    :goto_5
    :pswitch_5
    return-object v0

    :cond_6
    move-object v1, p1

    .line 403
    check-cast v1, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/ZipFile$Entry;->getOffsetEntry()Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;

    move-result-object v7

    .line 404
    .local v7, "offsetEntry":Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;
    invoke-static {p1}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->checkRequestedFeatures(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V

    .line 405
    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;->dataOffset:J
    invoke-static {v7}, Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;->access$000(Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;)J

    move-result-wide v2

    .line 406
    .local v2, "start":J
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v4

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;-><init>(Lorg/apache/commons/compress/archivers/zip/ZipFile;JJ)V

    .line 408
    .local v0, "bis":Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;
    sget-object v1, Lorg/apache/commons/compress/archivers/zip/ZipFile$3;->$SwitchMap$org$apache$commons$compress$archivers$zip$ZipMethod:[I

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v4

    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipMethod;->getMethodByCode(I)Lorg/apache/commons/compress/archivers/zip/ZipMethod;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipMethod;->ordinal()I

    move-result v4

    aget v1, v1, v4

    packed-switch v1, :pswitch_data_82

    .line 427
    new-instance v1, Ljava/util/zip/ZipException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Found unsupported compression method "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 412
    :pswitch_4e
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;

    invoke-direct {v1, v0}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;-><init>(Ljava/io/InputStream;)V

    move-object v0, v1

    goto :goto_5

    .line 414
    :pswitch_55
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/ExplodingInputStream;

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getGeneralPurposeBit()Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->getSlidingDictionarySize()I

    move-result v4

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getGeneralPurposeBit()Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    move-result-object v5

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->getNumberOfShannonFanoTrees()I

    move-result v5

    new-instance v8, Ljava/io/BufferedInputStream;

    invoke-direct {v8, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v4, v5, v8}, Lorg/apache/commons/compress/archivers/zip/ExplodingInputStream;-><init>(IILjava/io/InputStream;)V

    move-object v0, v1

    goto :goto_5

    .line 417
    :pswitch_71
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->addDummy()V

    .line 418
    new-instance v6, Ljava/util/zip/Inflater;

    const/4 v1, 0x1

    invoke-direct {v6, v1}, Ljava/util/zip/Inflater;-><init>(Z)V

    .line 419
    .local v6, "inflater":Ljava/util/zip/Inflater;
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/ZipFile$1;

    invoke-direct {v1, p0, v0, v6, v6}, Lorg/apache/commons/compress/archivers/zip/ZipFile$1;-><init>(Lorg/apache/commons/compress/archivers/zip/ZipFile;Ljava/io/InputStream;Ljava/util/zip/Inflater;Ljava/util/zip/Inflater;)V

    move-object v0, v1

    goto :goto_5

    .line 408
    nop

    :pswitch_data_82
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4e
        :pswitch_55
        :pswitch_71
    .end packed-switch
.end method

.method public getUnixSymlink(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Ljava/lang/String;
    .registers 5
    .param p1, "entry"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 447
    if-eqz p1, :cond_24

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->isUnixSymlink()Z

    move-result v2

    if-eqz v2, :cond_24

    .line 448
    const/4 v0, 0x0

    .line 450
    .local v0, "in":Ljava/io/InputStream;
    :try_start_9
    invoke-virtual {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->getInputStream(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Ljava/io/InputStream;

    move-result-object v0

    .line 451
    invoke-static {v0}, Lorg/apache/commons/compress/utils/IOUtils;->toByteArray(Ljava/io/InputStream;)[B

    move-result-object v1

    .line 452
    .local v1, "symlinkBytes":[B
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-interface {v2, v1}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->decode([B)Ljava/lang/String;
    :try_end_16
    .catchall {:try_start_9 .. :try_end_16} :catchall_1d

    move-result-object v2

    .line 454
    if-eqz v0, :cond_1c

    .line 455
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 459
    .end local v0    # "in":Ljava/io/InputStream;
    .end local v1    # "symlinkBytes":[B
    :cond_1c
    :goto_1c
    return-object v2

    .line 454
    .restart local v0    # "in":Ljava/io/InputStream;
    :catchall_1d
    move-exception v2

    if-eqz v0, :cond_23

    .line 455
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    :cond_23
    throw v2

    .line 459
    .end local v0    # "in":Ljava/io/InputStream;
    :cond_24
    const/4 v2, 0x0

    goto :goto_1c
.end method
