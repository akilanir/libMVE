.class public Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;
.super Lorg/apache/commons/compress/archivers/ArchiveOutputStream;
.source "ZipArchiveOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$1;,
        Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;,
        Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;
    }
.end annotation


# static fields
.field static final BUFFER_SIZE:I = 0x200

.field private static final CFH_COMMENT_LENGTH_OFFSET:I = 0x20

.field private static final CFH_COMPRESSED_SIZE_OFFSET:I = 0x14

.field private static final CFH_CRC_OFFSET:I = 0x10

.field private static final CFH_DISK_NUMBER_OFFSET:I = 0x22

.field private static final CFH_EXTERNAL_ATTRIBUTES_OFFSET:I = 0x26

.field private static final CFH_EXTRA_LENGTH_OFFSET:I = 0x1e

.field private static final CFH_FILENAME_LENGTH_OFFSET:I = 0x1c

.field private static final CFH_FILENAME_OFFSET:I = 0x2e

.field private static final CFH_GPB_OFFSET:I = 0x8

.field private static final CFH_INTERNAL_ATTRIBUTES_OFFSET:I = 0x24

.field private static final CFH_LFH_OFFSET:I = 0x2a

.field private static final CFH_METHOD_OFFSET:I = 0xa

.field private static final CFH_ORIGINAL_SIZE_OFFSET:I = 0x18

.field static final CFH_SIG:[B

.field private static final CFH_SIG_OFFSET:I = 0x0

.field private static final CFH_TIME_OFFSET:I = 0xc

.field private static final CFH_VERSION_MADE_BY_OFFSET:I = 0x4

.field private static final CFH_VERSION_NEEDED_OFFSET:I = 0x6

.field static final DD_SIG:[B

.field public static final DEFAULT_COMPRESSION:I = -0x1

.field static final DEFAULT_ENCODING:Ljava/lang/String; = "UTF8"

.field public static final DEFLATED:I = 0x8

.field private static final DEFLATER_BLOCK_SIZE:I = 0x2000

.field public static final EFS_FLAG:I = 0x800
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private static final EMPTY:[B

.field static final EOCD_SIG:[B

.field private static final LFH_COMPRESSED_SIZE_OFFSET:I = 0x12

.field private static final LFH_CRC_OFFSET:I = 0xe

.field private static final LFH_EXTRA_LENGTH_OFFSET:I = 0x1c

.field private static final LFH_FILENAME_LENGTH_OFFSET:I = 0x1a

.field private static final LFH_FILENAME_OFFSET:I = 0x1e

.field private static final LFH_GPB_OFFSET:I = 0x6

.field private static final LFH_METHOD_OFFSET:I = 0x8

.field private static final LFH_ORIGINAL_SIZE_OFFSET:I = 0x16

.field static final LFH_SIG:[B

.field private static final LFH_SIG_OFFSET:I = 0x0

.field private static final LFH_TIME_OFFSET:I = 0xa

.field private static final LFH_VERSION_NEEDED_OFFSET:I = 0x4

.field private static final LZERO:[B

.field private static final ONE:[B

.field public static final STORED:I

.field private static final ZERO:[B

.field static final ZIP64_EOCD_LOC_SIG:[B

.field static final ZIP64_EOCD_SIG:[B


# instance fields
.field private final calendarInstance:Ljava/util/Calendar;

.field private cdLength:J

.field private cdOffset:J

.field private comment:Ljava/lang/String;

.field private final copyBuffer:[B

.field private createUnicodeExtraFields:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

.field protected final def:Ljava/util/zip/Deflater;

.field private encoding:Ljava/lang/String;

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

.field private entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

.field private fallbackToUTF8:Z

.field protected finished:Z

.field private hasCompressionLevelChanged:Z

.field private hasUsedZip64:Z

.field private level:I

.field private method:I

.field private final offsets:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final out:Ljava/io/OutputStream;

.field private final raf:Ljava/io/RandomAccessFile;

.field private final streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

.field private useUTF8Flag:Z

.field private zip64Mode:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

.field private zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 151
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->EMPTY:[B

    .line 200
    const/4 v0, 0x2

    new-array v0, v0, [B

    fill-array-data v0, :array_52

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->ZERO:[B

    .line 205
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_58

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->LZERO:[B

    .line 207
    const-wide/16 v0, 0x1

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes(J)[B

    move-result-object v0

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->ONE:[B

    .line 963
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/ZipLong;->LFH_SIG:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes()[B

    move-result-object v0

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->LFH_SIG:[B

    .line 967
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/ZipLong;->DD_SIG:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes()[B

    move-result-object v0

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->DD_SIG:[B

    .line 971
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/ZipLong;->CFH_SIG:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes()[B

    move-result-object v0

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->CFH_SIG:[B

    .line 975
    const-wide/32 v0, 0x6054b50

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes(J)[B

    move-result-object v0

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->EOCD_SIG:[B

    .line 979
    const-wide/32 v0, 0x6064b50

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes(J)[B

    move-result-object v0

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->ZIP64_EOCD_SIG:[B

    .line 983
    const-wide/32 v0, 0x7064b50

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes(J)[B

    move-result-object v0

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->ZIP64_EOCD_LOC_SIG:[B

    return-void

    .line 200
    nop

    :array_52
    .array-data 1
        0x0t
        0x0t
    .end array-data

    .line 205
    nop

    :array_58
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method public constructor <init>(Ljava/io/File;)V
    .registers 11
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const-wide/16 v6, 0x0

    const/4 v5, 0x0

    .line 291
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/ArchiveOutputStream;-><init>()V

    .line 112
    iput-boolean v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->finished:Z

    .line 161
    const-string v4, ""

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->comment:Ljava/lang/String;

    .line 166
    const/4 v4, -0x1

    iput v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->level:I

    .line 172
    iput-boolean v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->hasCompressionLevelChanged:Z

    .line 177
    const/16 v4, 0x8

    iput v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->method:I

    .line 182
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entries:Ljava/util/List;

    .line 190
    iput-wide v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->cdOffset:J

    .line 195
    iput-wide v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->cdLength:J

    .line 212
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->offsets:Ljava/util/Map;

    .line 222
    const-string v4, "UTF8"

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->encoding:Ljava/lang/String;

    .line 230
    const-string v4, "UTF8"

    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    .line 250
    iput-boolean v8, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->useUTF8Flag:Z

    .line 255
    iput-boolean v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->fallbackToUTF8:Z

    .line 260
    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;->NEVER:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->createUnicodeExtraFields:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    .line 267
    iput-boolean v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->hasUsedZip64:Z

    .line 269
    sget-object v4, Lorg/apache/commons/compress/archivers/zip/Zip64Mode;->AsNeeded:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    .line 271
    const v4, 0x8000

    new-array v4, v4, [B

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->copyBuffer:[B

    .line 272
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->calendarInstance:Ljava/util/Calendar;

    .line 292
    const/4 v3, 0x0

    .line 293
    .local v3, "o":Ljava/io/OutputStream;
    const/4 v0, 0x0

    .line 295
    .local v0, "_raf":Ljava/io/RandomAccessFile;
    :try_start_51
    new-instance v1, Ljava/io/RandomAccessFile;

    const-string v4, "rw"

    invoke-direct {v1, p1, v4}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_58
    .catch Ljava/io/IOException; {:try_start_51 .. :try_end_58} :catch_74

    .line 296
    .end local v0    # "_raf":Ljava/io/RandomAccessFile;
    .local v1, "_raf":Ljava/io/RandomAccessFile;
    const-wide/16 v4, 0x0

    :try_start_5a
    invoke-virtual {v1, v4, v5}, Ljava/io/RandomAccessFile;->setLength(J)V
    :try_end_5d
    .catch Ljava/io/IOException; {:try_start_5a .. :try_end_5d} :catch_7f

    move-object v0, v1

    .line 302
    .end local v1    # "_raf":Ljava/io/RandomAccessFile;
    .restart local v0    # "_raf":Ljava/io/RandomAccessFile;
    :goto_5e
    new-instance v4, Ljava/util/zip/Deflater;

    iget v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->level:I

    invoke-direct {v4, v5, v8}, Ljava/util/zip/Deflater;-><init>(IZ)V

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->def:Ljava/util/zip/Deflater;

    .line 303
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->def:Ljava/util/zip/Deflater;

    invoke-static {v0, v4}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->create(Ljava/io/DataOutput;Ljava/util/zip/Deflater;)Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    .line 304
    iput-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 305
    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->raf:Ljava/io/RandomAccessFile;

    .line 306
    return-void

    .line 297
    :catch_74
    move-exception v2

    .line 298
    .local v2, "e":Ljava/io/IOException;
    :goto_75
    invoke-static {v0}, Lorg/apache/commons/compress/utils/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 299
    const/4 v0, 0x0

    .line 300
    new-instance v3, Ljava/io/FileOutputStream;

    .end local v3    # "o":Ljava/io/OutputStream;
    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .restart local v3    # "o":Ljava/io/OutputStream;
    goto :goto_5e

    .line 297
    .end local v0    # "_raf":Ljava/io/RandomAccessFile;
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v1    # "_raf":Ljava/io/RandomAccessFile;
    :catch_7f
    move-exception v2

    move-object v0, v1

    .end local v1    # "_raf":Ljava/io/RandomAccessFile;
    .restart local v0    # "_raf":Ljava/io/RandomAccessFile;
    goto :goto_75
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 7
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    const-wide/16 v3, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 278
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/ArchiveOutputStream;-><init>()V

    .line 112
    iput-boolean v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->finished:Z

    .line 161
    const-string v0, ""

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->comment:Ljava/lang/String;

    .line 166
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->level:I

    .line 172
    iput-boolean v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->hasCompressionLevelChanged:Z

    .line 177
    const/16 v0, 0x8

    iput v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->method:I

    .line 182
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entries:Ljava/util/List;

    .line 190
    iput-wide v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->cdOffset:J

    .line 195
    iput-wide v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->cdLength:J

    .line 212
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->offsets:Ljava/util/Map;

    .line 222
    const-string v0, "UTF8"

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->encoding:Ljava/lang/String;

    .line 230
    const-string v0, "UTF8"

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    .line 250
    iput-boolean v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->useUTF8Flag:Z

    .line 255
    iput-boolean v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->fallbackToUTF8:Z

    .line 260
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;->NEVER:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->createUnicodeExtraFields:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    .line 267
    iput-boolean v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->hasUsedZip64:Z

    .line 269
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/Zip64Mode;->AsNeeded:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    .line 271
    const v0, 0x8000

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->copyBuffer:[B

    .line 272
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->calendarInstance:Ljava/util/Calendar;

    .line 279
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 280
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->raf:Ljava/io/RandomAccessFile;

    .line 281
    new-instance v0, Ljava/util/zip/Deflater;

    iget v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->level:I

    invoke-direct {v0, v1, v2}, Ljava/util/zip/Deflater;-><init>(IZ)V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->def:Ljava/util/zip/Deflater;

    .line 282
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->def:Ljava/util/zip/Deflater;

    invoke-static {p1, v0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->create(Ljava/io/OutputStream;Ljava/util/zip/Deflater;)Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    .line 283
    return-void
.end method

.method private addUnicodeExtraFields(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;ZLjava/nio/ByteBuffer;)V
    .registers 13
    .param p1, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .param p2, "encodable"    # Z
    .param p3, "name"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1094
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->createUnicodeExtraFields:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;->ALWAYS:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    if-eq v3, v4, :cond_8

    if-nez p2, :cond_25

    .line 1096
    :cond_8
    new-instance v3, Lorg/apache/commons/compress/archivers/zip/UnicodePathExtraField;

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v5

    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v6

    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->limit()I

    move-result v7

    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->position()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-direct {v3, v4, v5, v6, v7}, Lorg/apache/commons/compress/archivers/zip/UnicodePathExtraField;-><init>(Ljava/lang/String;[BII)V

    invoke-virtual {p1, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->addExtraField(Lorg/apache/commons/compress/archivers/zip/ZipExtraField;)V

    .line 1103
    :cond_25
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getComment()Ljava/lang/String;

    move-result-object v0

    .line 1104
    .local v0, "comm":Ljava/lang/String;
    if-eqz v0, :cond_62

    const-string v3, ""

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_62

    .line 1106
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-interface {v3, v0}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->canEncode(Ljava/lang/String;)Z

    move-result v2

    .line 1108
    .local v2, "commentEncodable":Z
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->createUnicodeExtraFields:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;->ALWAYS:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    if-eq v3, v4, :cond_41

    if-nez v2, :cond_62

    .line 1110
    :cond_41
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->getEntryEncoding(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    move-result-object v3

    invoke-interface {v3, v0}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 1111
    .local v1, "commentB":Ljava/nio/ByteBuffer;
    new-instance v3, Lorg/apache/commons/compress/archivers/zip/UnicodeCommentExtraField;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v5

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v6

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-direct {v3, v0, v4, v5, v6}, Lorg/apache/commons/compress/archivers/zip/UnicodeCommentExtraField;-><init>(Ljava/lang/String;[BII)V

    invoke-virtual {p1, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->addExtraField(Lorg/apache/commons/compress/archivers/zip/ZipExtraField;)V

    .line 1119
    .end local v1    # "commentB":Ljava/nio/ByteBuffer;
    .end local v2    # "commentEncodable":Z
    :cond_62
    return-void
.end method

.method private checkIfNeedsZip64(Lorg/apache/commons/compress/archivers/zip/Zip64Mode;)Z
    .registers 5
    .param p1, "effectiveMode"    # Lorg/apache/commons/compress/archivers/zip/Zip64Mode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    .line 630
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    invoke-direct {p0, v1, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->isZip64Required(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/compress/archivers/zip/Zip64Mode;)Z

    move-result v0

    .line 631
    .local v0, "actuallyNeedsZip64":Z
    if-eqz v0, :cond_20

    sget-object v1, Lorg/apache/commons/compress/archivers/zip/Zip64Mode;->Never:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    if-ne p1, v1, :cond_20

    .line 632
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/Zip64RequiredException;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/Zip64RequiredException;->getEntryTooBigMessage(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/commons/compress/archivers/zip/Zip64RequiredException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 634
    :cond_20
    return v0
.end method

.method private closeCopiedEntry(Z)V
    .registers 7
    .param p1, "phased"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 510
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->preClose()V

    .line 511
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v3

    # setter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->bytesRead:J
    invoke-static {v2, v3, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$102(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;J)J

    .line 512
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->getEffectiveZip64Mode(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    move-result-object v1

    .line 513
    .local v1, "effectiveMode":Lorg/apache/commons/compress/archivers/zip/Zip64Mode;
    invoke-direct {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->checkIfNeedsZip64(Lorg/apache/commons/compress/archivers/zip/Zip64Mode;)Z

    move-result v0

    .line 514
    .local v0, "actuallyNeedsZip64":Z
    invoke-direct {p0, v0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->closeEntry(ZZ)V

    .line 515
    return-void
.end method

.method private closeEntry(ZZ)V
    .registers 4
    .param p1, "actuallyNeedsZip64"    # Z
    .param p2, "phased"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 518
    if-nez p2, :cond_9

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-eqz v0, :cond_9

    .line 519
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->rewriteSizesAndCrc(Z)V

    .line 522
    :cond_9
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeDataDescriptor(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V

    .line 523
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 524
    return-void
.end method

.method private copyFromZipInputStream(Ljava/io/InputStream;)V
    .registers 6
    .param p1, "src"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 914
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    if-nez v1, :cond_c

    .line 915
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "No current entry"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 917
    :cond_c
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->checkRequestedFeatures(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V

    .line 918
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    const/4 v2, 0x1

    # setter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->hasWritten:Z
    invoke-static {v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$302(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;Z)Z

    .line 920
    :goto_1b
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->copyBuffer:[B

    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    move-result v0

    .local v0, "length":I
    if-ltz v0, :cond_2f

    .line 922
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->copyBuffer:[B

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->writeCounted([BII)V

    .line 923
    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->count(I)V

    goto :goto_1b

    .line 925
    :cond_2f
    return-void
.end method

.method private createCentralFileHeader(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)[B
    .registers 10
    .param p1, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide v6, 0xffffffffL

    .line 1156
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->offsets:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    .line 1157
    .local v3, "lfhOffset":J
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->hasZip64Extra(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v0

    if-nez v0, :cond_2b

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v0

    cmp-long v0, v0, v6

    if-gez v0, :cond_2b

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v0

    cmp-long v0, v0, v6

    if-gez v0, :cond_2b

    cmp-long v0, v3, v6

    if-ltz v0, :cond_3c

    :cond_2b
    const/4 v5, 0x1

    .line 1162
    .local v5, "needsZip64Extra":Z
    :goto_2c
    if-eqz v5, :cond_3e

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    sget-object v1, Lorg/apache/commons/compress/archivers/zip/Zip64Mode;->Never:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    if-ne v0, v1, :cond_3e

    .line 1166
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/Zip64RequiredException;

    const-string v1, "archive\'s size exceeds the limit of 4GByte."

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/zip/Zip64RequiredException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1157
    .end local v5    # "needsZip64Extra":Z
    :cond_3c
    const/4 v5, 0x0

    goto :goto_2c

    .line 1171
    .restart local v5    # "needsZip64Extra":Z
    :cond_3e
    invoke-direct {p0, p1, v3, v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->handleZip64Extra(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;JZ)V

    .line 1173
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->getName(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Ljava/nio/ByteBuffer;

    move-result-object v2

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->createCentralFileHeader(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Ljava/nio/ByteBuffer;JZ)[B

    move-result-object v0

    return-object v0
.end method

.method private createCentralFileHeader(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Ljava/nio/ByteBuffer;JZ)[B
    .registers 23
    .param p1, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .param p2, "name"    # Ljava/nio/ByteBuffer;
    .param p3, "lfhOffset"    # J
    .param p5, "needsZip64Extra"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1185
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCentralDirectoryExtra()[B

    move-result-object v8

    .line 1188
    .local v8, "extra":[B
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getComment()Ljava/lang/String;

    move-result-object v3

    .line 1189
    .local v3, "comm":Ljava/lang/String;
    if-nez v3, :cond_c

    .line 1190
    const-string v3, ""

    .line 1193
    :cond_c
    invoke-direct/range {p0 .. p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->getEntryEncoding(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    move-result-object v13

    invoke-interface {v13, v3}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 1194
    .local v4, "commentB":Ljava/nio/ByteBuffer;
    invoke-virtual/range {p2 .. p2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v13

    invoke-virtual/range {p2 .. p2}, Ljava/nio/ByteBuffer;->position()I

    move-result v14

    sub-int v11, v13, v14

    .line 1195
    .local v11, "nameLen":I
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->limit()I

    move-result v13

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v14

    sub-int v5, v13, v14

    .line 1196
    .local v5, "commentLen":I
    add-int/lit8 v13, v11, 0x2e

    array-length v14, v8

    add-int/2addr v13, v14

    add-int v10, v13, v5

    .line 1197
    .local v10, "len":I
    new-array v2, v10, [B

    .line 1199
    .local v2, "buf":[B
    sget-object v13, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->CFH_SIG:[B

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x4

    move/from16 v0, v16

    invoke-static {v13, v14, v2, v15, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1203
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getPlatform()I

    move-result v13

    shl-int/lit8 v14, v13, 0x8

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->hasUsedZip64:Z

    if-nez v13, :cond_124

    const/16 v13, 0x14

    :goto_49
    or-int/2addr v13, v14

    const/4 v14, 0x4

    invoke-static {v13, v2, v14}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 1206
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v12

    .line 1207
    .local v12, "zipMethod":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->canEncode(Ljava/lang/String;)Z

    move-result v7

    .line 1208
    .local v7, "encodable":Z
    move-object/from16 v0, p0

    move/from16 v1, p5

    invoke-direct {v0, v12, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->versionNeededToExtract(IZ)I

    move-result v13

    const/4 v14, 0x6

    invoke-static {v13, v2, v14}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 1209
    if-nez v7, :cond_128

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->fallbackToUTF8:Z

    if-eqz v13, :cond_128

    const/4 v13, 0x1

    :goto_73
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->getGeneralPurposeBits(IZ)Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    move-result-object v13

    const/16 v14, 0x8

    invoke-virtual {v13, v2, v14}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->encode([BI)V

    .line 1212
    const/16 v13, 0xa

    invoke-static {v12, v2, v13}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 1216
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->calendarInstance:Ljava/util/Calendar;

    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getTime()J

    move-result-wide v14

    const/16 v16, 0xc

    move/from16 v0, v16

    invoke-static {v13, v14, v15, v2, v0}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->toDosTime(Ljava/util/Calendar;J[BI)V

    .line 1221
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCrc()J

    move-result-wide v13

    const/16 v15, 0x10

    invoke-static {v13, v14, v2, v15}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->putLong(J[BI)V

    .line 1222
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v13

    const-wide v15, 0xffffffffL

    cmp-long v13, v13, v15

    if-gez v13, :cond_b5

    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v13

    const-wide v15, 0xffffffffL

    cmp-long v13, v13, v15

    if-ltz v13, :cond_12b

    .line 1224
    :cond_b5
    sget-object v13, Lorg/apache/commons/compress/archivers/zip/ZipLong;->ZIP64_MAGIC:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    const/16 v14, 0x14

    invoke-virtual {v13, v2, v14}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->putLong([BI)V

    .line 1225
    sget-object v13, Lorg/apache/commons/compress/archivers/zip/ZipLong;->ZIP64_MAGIC:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    const/16 v14, 0x18

    invoke-virtual {v13, v2, v14}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->putLong([BI)V

    .line 1231
    :goto_c3
    const/16 v13, 0x1c

    invoke-static {v11, v2, v13}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 1234
    array-length v13, v8

    const/16 v14, 0x1e

    invoke-static {v13, v2, v14}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 1236
    const/16 v13, 0x20

    invoke-static {v5, v2, v13}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 1239
    sget-object v13, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->ZERO:[B

    const/4 v14, 0x0

    const/16 v15, 0x22

    const/16 v16, 0x2

    move/from16 v0, v16

    invoke-static {v13, v14, v2, v15, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1242
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getInternalAttributes()I

    move-result v13

    const/16 v14, 0x24

    invoke-static {v13, v2, v14}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 1245
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getExternalAttributes()J

    move-result-wide v13

    const/16 v15, 0x26

    invoke-static {v13, v14, v2, v15}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->putLong(J[BI)V

    .line 1248
    const-wide v13, 0xffffffffL

    move-wide/from16 v0, p3

    invoke-static {v0, v1, v13, v14}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v13

    const/16 v15, 0x2a

    invoke-static {v13, v14, v2, v15}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->putLong(J[BI)V

    .line 1251
    invoke-virtual/range {p2 .. p2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v13

    invoke-virtual/range {p2 .. p2}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v14

    const/16 v15, 0x2e

    invoke-static {v13, v14, v2, v15, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1253
    add-int/lit8 v9, v11, 0x2e

    .line 1254
    .local v9, "extraStart":I
    const/4 v13, 0x0

    array-length v14, v8

    invoke-static {v8, v13, v2, v9, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1256
    array-length v13, v8

    add-int v6, v9, v13

    .line 1259
    .local v6, "commentStart":I
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v13

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v14

    invoke-static {v13, v14, v2, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1260
    return-object v2

    .line 1203
    .end local v6    # "commentStart":I
    .end local v7    # "encodable":Z
    .end local v9    # "extraStart":I
    .end local v12    # "zipMethod":I
    :cond_124
    const/16 v13, 0x2d

    goto/16 :goto_49

    .line 1209
    .restart local v7    # "encodable":Z
    .restart local v12    # "zipMethod":I
    :cond_128
    const/4 v13, 0x0

    goto/16 :goto_73

    .line 1227
    :cond_12b
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v13

    const/16 v15, 0x14

    invoke-static {v13, v14, v2, v15}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->putLong(J[BI)V

    .line 1228
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v13

    const/16 v15, 0x18

    invoke-static {v13, v14, v2, v15}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->putLong(J[BI)V

    goto :goto_c3
.end method

.method private createLocalFileHeader(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Ljava/nio/ByteBuffer;ZZ)[B
    .registers 15
    .param p1, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .param p2, "name"    # Ljava/nio/ByteBuffer;
    .param p3, "encodable"    # Z
    .param p4, "phased"    # Z

    .prologue
    .line 1021
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getLocalFileDataExtra()[B

    move-result-object v1

    .line 1022
    .local v1, "extra":[B
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v6

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->position()I

    move-result v7

    sub-int v4, v6, v7

    .line 1023
    .local v4, "nameLen":I
    add-int/lit8 v6, v4, 0x1e

    array-length v7, v1

    add-int v3, v6, v7

    .line 1024
    .local v3, "len":I
    new-array v0, v3, [B

    .line 1026
    .local v0, "buf":[B
    sget-object v6, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->LFH_SIG:[B

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x4

    invoke-static {v6, v7, v0, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1029
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v5

    .line 1031
    .local v5, "zipMethod":I
    if-eqz p4, :cond_9b

    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v6}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    invoke-direct {p0, v6, v7}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->isZip64Required(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/compress/archivers/zip/Zip64Mode;)Z

    move-result v6

    if-nez v6, :cond_9b

    .line 1032
    const/16 v6, 0xa

    const/4 v7, 0x4

    invoke-static {v6, v0, v7}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 1037
    :goto_37
    if-nez p3, :cond_a8

    iget-boolean v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->fallbackToUTF8:Z

    if-eqz v6, :cond_a8

    const/4 v6, 0x1

    :goto_3e
    invoke-direct {p0, v5, v6}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->getGeneralPurposeBits(IZ)Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    move-result-object v2

    .line 1038
    .local v2, "generalPurposeBit":Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;
    const/4 v6, 0x6

    invoke-virtual {v2, v0, v6}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->encode([BI)V

    .line 1041
    const/16 v6, 0x8

    invoke-static {v5, v0, v6}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 1043
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->calendarInstance:Ljava/util/Calendar;

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getTime()J

    move-result-wide v7

    const/16 v9, 0xa

    invoke-static {v6, v7, v8, v0, v9}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->toDosTime(Ljava/util/Calendar;J[BI)V

    .line 1046
    if-eqz p4, :cond_aa

    .line 1047
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCrc()J

    move-result-wide v6

    const/16 v8, 0xe

    invoke-static {v6, v7, v0, v8}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->putLong(J[BI)V

    .line 1056
    :goto_61
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v6}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v6

    invoke-direct {p0, v6}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->hasZip64Extra(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v6

    if-eqz v6, :cond_c6

    .line 1060
    sget-object v6, Lorg/apache/commons/compress/archivers/zip/ZipLong;->ZIP64_MAGIC:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    const/16 v7, 0x12

    invoke-virtual {v6, v0, v7}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->putLong([BI)V

    .line 1061
    sget-object v6, Lorg/apache/commons/compress/archivers/zip/ZipLong;->ZIP64_MAGIC:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    const/16 v7, 0x16

    invoke-virtual {v6, v0, v7}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->putLong([BI)V

    .line 1073
    :goto_7b
    const/16 v6, 0x1a

    invoke-static {v4, v0, v6}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 1076
    array-length v6, v1

    const/16 v7, 0x1c

    invoke-static {v6, v0, v7}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 1079
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v6

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v7

    const/16 v8, 0x1e

    invoke-static {v6, v7, v0, v8, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1081
    const/4 v6, 0x0

    add-int/lit8 v7, v4, 0x1e

    array-length v8, v1

    invoke-static {v1, v6, v0, v7, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1082
    return-object v0

    .line 1034
    .end local v2    # "generalPurposeBit":Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;
    :cond_9b
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->hasZip64Extra(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v6

    invoke-direct {p0, v5, v6}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->versionNeededToExtract(IZ)I

    move-result v6

    const/4 v7, 0x4

    invoke-static {v6, v0, v7}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->putShort(I[BI)V

    goto :goto_37

    .line 1037
    :cond_a8
    const/4 v6, 0x0

    goto :goto_3e

    .line 1048
    .restart local v2    # "generalPurposeBit":Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;
    :cond_aa
    const/16 v6, 0x8

    if-eq v5, v6, :cond_b2

    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-eqz v6, :cond_bc

    .line 1049
    :cond_b2
    sget-object v6, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->LZERO:[B

    const/4 v7, 0x0

    const/16 v8, 0xe

    const/4 v9, 0x4

    invoke-static {v6, v7, v0, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_61

    .line 1051
    :cond_bc
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCrc()J

    move-result-wide v6

    const/16 v8, 0xe

    invoke-static {v6, v7, v0, v8}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->putLong(J[BI)V

    goto :goto_61

    .line 1062
    :cond_c6
    if-eqz p4, :cond_db

    .line 1063
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v6

    const/16 v8, 0x12

    invoke-static {v6, v7, v0, v8}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->putLong(J[BI)V

    .line 1064
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v6

    const/16 v8, 0x16

    invoke-static {v6, v7, v0, v8}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->putLong(J[BI)V

    goto :goto_7b

    .line 1065
    :cond_db
    const/16 v6, 0x8

    if-eq v5, v6, :cond_e3

    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-eqz v6, :cond_f6

    .line 1066
    :cond_e3
    sget-object v6, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->LZERO:[B

    const/4 v7, 0x0

    const/16 v8, 0x12

    const/4 v9, 0x4

    invoke-static {v6, v7, v0, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1067
    sget-object v6, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->LZERO:[B

    const/4 v7, 0x0

    const/16 v8, 0x16

    const/4 v9, 0x4

    invoke-static {v6, v7, v0, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_7b

    .line 1069
    :cond_f6
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v6

    const/16 v8, 0x12

    invoke-static {v6, v7, v0, v8}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->putLong(J[BI)V

    .line 1070
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v6

    const/16 v8, 0x16

    invoke-static {v6, v7, v0, v8}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->putLong(J[BI)V

    goto/16 :goto_7b
.end method

.method private flushDeflater()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 574
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_13

    .line 575
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->flushDeflater()V

    .line 577
    :cond_13
    return-void
.end method

.method private getEffectiveZip64Mode(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/compress/archivers/zip/Zip64Mode;
    .registers 6
    .param p1, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .prologue
    .line 1517
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    sget-object v1, Lorg/apache/commons/compress/archivers/zip/Zip64Mode;->AsNeeded:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    if-ne v0, v1, :cond_1c

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-nez v0, :cond_1c

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_1c

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1f

    .line 1521
    :cond_1c
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    .line 1523
    :goto_1e
    return-object v0

    :cond_1f
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/Zip64Mode;->Never:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    goto :goto_1e
.end method

.method private getEntryEncoding(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/compress/archivers/zip/ZipEncoding;
    .registers 5
    .param p1, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .prologue
    .line 1527
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->canEncode(Ljava/lang/String;)Z

    move-result v0

    .line 1528
    .local v0, "encodable":Z
    if-nez v0, :cond_13

    iget-boolean v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->fallbackToUTF8:Z

    if-eqz v1, :cond_13

    sget-object v1, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->UTF8_ZIP_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    :goto_12
    return-object v1

    :cond_13
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    goto :goto_12
.end method

.method private getGeneralPurposeBits(IZ)Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;
    .registers 6
    .param p1, "zipMethod"    # I
    .param p2, "utfFallback"    # Z

    .prologue
    const/4 v2, 0x1

    .line 1421
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    invoke-direct {v0}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;-><init>()V

    .line 1422
    .local v0, "b":Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;
    iget-boolean v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->useUTF8Flag:Z

    if-nez v1, :cond_c

    if-eqz p2, :cond_1a

    :cond_c
    move v1, v2

    :goto_d
    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->useUTF8ForNames(Z)V

    .line 1423
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->isDeflatedToOutputStream(I)Z

    move-result v1

    if-eqz v1, :cond_19

    .line 1424
    invoke-virtual {v0, v2}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->useDataDescriptor(Z)V

    .line 1426
    :cond_19
    return-object v0

    .line 1422
    :cond_1a
    const/4 v1, 0x0

    goto :goto_d
.end method

.method private getName(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Ljava/nio/ByteBuffer;
    .registers 4
    .param p1, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1533
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->getEntryEncoding(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method private getZip64Extra(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;
    .registers 6
    .param p1, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .prologue
    const/4 v2, 0x1

    .line 1473
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    if-eqz v1, :cond_f

    .line 1474
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    iget-boolean v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->hasUsedZip64:Z

    if-nez v1, :cond_24

    move v1, v2

    :goto_c
    # setter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->causedUseOfZip64:Z
    invoke-static {v3, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$502(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;Z)Z

    .line 1476
    :cond_f
    iput-boolean v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->hasUsedZip64:Z

    .line 1477
    sget-object v1, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->HEADER_ID:Lorg/apache/commons/compress/archivers/zip/ZipShort;

    invoke-virtual {p1, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getExtraField(Lorg/apache/commons/compress/archivers/zip/ZipShort;)Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;

    .line 1481
    .local v0, "z64":Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;
    if-nez v0, :cond_20

    .line 1488
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;

    .end local v0    # "z64":Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;
    invoke-direct {v0}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;-><init>()V

    .line 1492
    .restart local v0    # "z64":Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;
    :cond_20
    invoke-virtual {p1, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->addAsFirstExtraField(Lorg/apache/commons/compress/archivers/zip/ZipExtraField;)V

    .line 1494
    return-object v0

    .line 1474
    .end local v0    # "z64":Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;
    :cond_24
    const/4 v1, 0x0

    goto :goto_c
.end method

.method private handleSizesAndCrc(JJLorg/apache/commons/compress/archivers/zip/Zip64Mode;)Z
    .registers 10
    .param p1, "bytesWritten"    # J
    .param p3, "crc"    # J
    .param p5, "effectiveMode"    # Lorg/apache/commons/compress/archivers/zip/Zip64Mode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    .line 588
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_34

    .line 593
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->bytesRead:J
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    .line 594
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setCompressedSize(J)V

    .line 595
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    invoke-virtual {v0, p3, p4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setCrc(J)V

    .line 619
    :cond_2f
    :goto_2f
    invoke-direct {p0, p5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->checkIfNeedsZip64(Lorg/apache/commons/compress/archivers/zip/Zip64Mode;)Z

    move-result v0

    return v0

    .line 597
    :cond_34
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-nez v0, :cond_de

    .line 598
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCrc()J

    move-result-wide v0

    cmp-long v0, v0, p3

    if-eqz v0, :cond_8f

    .line 599
    new-instance v0, Ljava/util/zip/ZipException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bad CRC checksum for entry "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCrc()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " instead of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p3, p4}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 606
    :cond_8f
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v0

    cmp-long v0, v0, p1

    if-eqz v0, :cond_2f

    .line 607
    new-instance v0, Ljava/util/zip/ZipException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bad size for entry "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " instead of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 614
    :cond_de
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    .line 615
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setCompressedSize(J)V

    .line 616
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    invoke-virtual {v0, p3, p4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setCrc(J)V

    goto/16 :goto_2f
.end method

.method private handleZip64Extra(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;JZ)V
    .registers 11
    .param p1, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .param p2, "lfhOffset"    # J
    .param p4, "needsZip64Extra"    # Z

    .prologue
    const/4 v3, 0x0

    const-wide v4, 0xffffffffL

    .line 1269
    if-eqz p4, :cond_43

    .line 1270
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->getZip64Extra(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;

    move-result-object v0

    .line 1271
    .local v0, "z64":Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v1

    cmp-long v1, v1, v4

    if-gez v1, :cond_1c

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v1

    cmp-long v1, v1, v4

    if-ltz v1, :cond_44

    .line 1273
    :cond_1c
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;-><init>(J)V

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->setCompressedSize(Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;)V

    .line 1274
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;-><init>(J)V

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->setSize(Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;)V

    .line 1280
    :goto_34
    cmp-long v1, p2, v4

    if-ltz v1, :cond_40

    .line 1281
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    invoke-direct {v1, p2, p3}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;-><init>(J)V

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->setRelativeHeaderOffset(Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;)V

    .line 1283
    :cond_40
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setExtra()V

    .line 1285
    .end local v0    # "z64":Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;
    :cond_43
    return-void

    .line 1277
    .restart local v0    # "z64":Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;
    :cond_44
    invoke-virtual {v0, v3}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->setCompressedSize(Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;)V

    .line 1278
    invoke-virtual {v0, v3}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->setSize(Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;)V

    goto :goto_34
.end method

.method private hasZip64Extra(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z
    .registers 3
    .param p1, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .prologue
    .line 1504
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->HEADER_ID:Lorg/apache/commons/compress/archivers/zip/ZipShort;

    invoke-virtual {p1, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getExtraField(Lorg/apache/commons/compress/archivers/zip/ZipShort;)Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private isDeflatedToOutputStream(I)Z
    .registers 3
    .param p1, "zipMethod"    # I

    .prologue
    .line 1441
    const/16 v0, 0x8

    if-ne p1, v0, :cond_a

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private isTooLageForZip32(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z
    .registers 6
    .param p1, "zipArchiveEntry"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .prologue
    const-wide v2, 0xffffffffL

    .line 642
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-gez v0, :cond_15

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_17

    :cond_15
    const/4 v0, 0x1

    :goto_16
    return v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method

.method private isZip64Required(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/compress/archivers/zip/Zip64Mode;)Z
    .registers 4
    .param p1, "entry1"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .param p2, "requestedMode"    # Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    .prologue
    .line 638
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/Zip64Mode;->Always:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    if-eq p2, v0, :cond_a

    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->isTooLageForZip32(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

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

.method private preClose()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 527
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->finished:Z

    if-eqz v0, :cond_d

    .line 528
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Stream has already been finished"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 531
    :cond_d
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    if-nez v0, :cond_19

    .line 532
    new-instance v0, Ljava/io/IOException;

    const-string v1, "No current entry to close"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 535
    :cond_19
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->hasWritten:Z
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Z

    move-result v0

    if-nez v0, :cond_26

    .line 536
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->EMPTY:[B

    invoke-virtual {p0, v0, v1, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->write([BII)V

    .line 538
    :cond_26
    return-void
.end method

.method private putArchiveEntry(Lorg/apache/commons/compress/archivers/ArchiveEntry;Z)V
    .registers 11
    .param p1, "archiveEntry"    # Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .param p2, "phased"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 722
    iget-boolean v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->finished:Z

    if-eqz v4, :cond_c

    .line 723
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Stream has already been finished"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 726
    :cond_c
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    if-eqz v4, :cond_13

    .line 727
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->closeArchiveEntry()V

    .line 730
    :cond_13
    new-instance v5, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    move-object v4, p1

    check-cast v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    const/4 v6, 0x0

    invoke-direct {v5, v4, v6}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;-><init>(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$1;)V

    iput-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .line 731
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entries:Ljava/util/List;

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 733
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->setDefaults(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V

    .line 735
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->getEffectiveZip64Mode(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    move-result-object v1

    .line 736
    .local v1, "effectiveMode":Lorg/apache/commons/compress/archivers/zip/Zip64Mode;
    invoke-direct {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->validateSizeInformation(Lorg/apache/commons/compress/archivers/zip/Zip64Mode;)V

    .line 738
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-direct {p0, v4, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->shouldAddZip64Extra(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/compress/archivers/zip/Zip64Mode;)Z

    move-result v4

    if-eqz v4, :cond_88

    .line 740
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->getZip64Extra(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;

    move-result-object v3

    .line 744
    .local v3, "z64":Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;
    sget-object v2, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->ZERO:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .line 745
    .local v2, "size":Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->ZERO:Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .line 746
    .local v0, "compressedSize":Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;
    if-eqz p2, :cond_aa

    .line 747
    new-instance v2, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .end local v2    # "size":Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v4

    invoke-direct {v2, v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;-><init>(J)V

    .line 748
    .restart local v2    # "size":Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .end local v0    # "compressedSize":Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v4

    invoke-direct {v0, v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;-><init>(J)V

    .line 755
    .restart local v0    # "compressedSize":Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;
    :cond_79
    :goto_79
    invoke-virtual {v3, v2}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->setSize(Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;)V

    .line 756
    invoke-virtual {v3, v0}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->setCompressedSize(Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;)V

    .line 757
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setExtra()V

    .line 760
    .end local v0    # "compressedSize":Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;
    .end local v2    # "size":Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;
    .end local v3    # "z64":Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;
    :cond_88
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v4

    const/16 v5, 0x8

    if-ne v4, v5, :cond_a4

    iget-boolean v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->hasCompressionLevelChanged:Z

    if-eqz v4, :cond_a4

    .line 761
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->def:Ljava/util/zip/Deflater;

    iget v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->level:I

    invoke-virtual {v4, v5}, Ljava/util/zip/Deflater;->setLevel(I)V

    .line 762
    const/4 v4, 0x0

    iput-boolean v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->hasCompressionLevelChanged:Z

    .line 764
    :cond_a4
    check-cast p1, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .end local p1    # "archiveEntry":Lorg/apache/commons/compress/archivers/ArchiveEntry;
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeLocalFileHeader(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Z)V

    .line 765
    return-void

    .line 749
    .restart local v0    # "compressedSize":Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;
    .restart local v2    # "size":Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;
    .restart local v3    # "z64":Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;
    .restart local p1    # "archiveEntry":Lorg/apache/commons/compress/archivers/ArchiveEntry;
    :cond_aa
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v4

    if-nez v4, :cond_79

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-eqz v4, :cond_79

    .line 752
    new-instance v2, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    .end local v2    # "size":Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v4

    invoke-direct {v2, v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;-><init>(J)V

    .line 753
    .restart local v2    # "size":Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;
    move-object v0, v2

    goto :goto_79
.end method

.method private rewriteSizesAndCrc(Z)V
    .registers 13
    .param p1, "actuallyNeedsZip64"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v9, 0x4

    .line 652
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v4}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v2

    .line 654
    .local v2, "save":J
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->raf:Ljava/io/RandomAccessFile;

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->localDataStart:J
    invoke-static {v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$400(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 655
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCrc()J

    move-result-wide v4

    invoke-static {v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes(J)[B

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 656
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->hasZip64Extra(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v4

    if-eqz v4, :cond_32

    if-nez p1, :cond_e6

    .line 657
    :cond_32
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v4

    invoke-static {v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes(J)[B

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 658
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v4

    invoke-static {v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes(J)[B

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 664
    :goto_54
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->hasZip64Extra(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v4

    if-eqz v4, :cond_e0

    .line 665
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->getName(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 666
    .local v0, "name":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    sub-int v1, v4, v5

    .line 668
    .local v1, "nameLen":I
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->raf:Ljava/io/RandomAccessFile;

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->localDataStart:J
    invoke-static {v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$400(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)J

    move-result-wide v5

    const-wide/16 v7, 0xc

    add-long/2addr v5, v7

    add-long/2addr v5, v9

    int-to-long v7, v1

    add-long/2addr v5, v7

    add-long/2addr v5, v9

    invoke-virtual {v4, v5, v6}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 672
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v4

    invoke-static {v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getBytes(J)[B

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 673
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v4

    invoke-static {v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getBytes(J)[B

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 675
    if-nez p1, :cond_e0

    .line 678
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->raf:Ljava/io/RandomAccessFile;

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->localDataStart:J
    invoke-static {v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$400(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)J

    move-result-wide v5

    const-wide/16 v7, 0xa

    sub-long/2addr v5, v7

    invoke-virtual {v4, v5, v6}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 679
    const/16 v4, 0xa

    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getBytes(I)[B

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 683
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    sget-object v5, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->HEADER_ID:Lorg/apache/commons/compress/archivers/zip/ZipShort;

    invoke-virtual {v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->removeExtraField(Lorg/apache/commons/compress/archivers/zip/ZipShort;)V

    .line 685
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setExtra()V

    .line 689
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->causedUseOfZip64:Z
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$500(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Z

    move-result v4

    if-eqz v4, :cond_e0

    .line 690
    const/4 v4, 0x0

    iput-boolean v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->hasUsedZip64:Z

    .line 694
    .end local v0    # "name":Ljava/nio/ByteBuffer;
    .end local v1    # "nameLen":I
    :cond_e0
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v4, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 695
    return-void

    .line 660
    :cond_e6
    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipLong;->ZIP64_MAGIC:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes()[B

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 661
    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipLong;->ZIP64_MAGIC:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes()[B

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    goto/16 :goto_54
.end method

.method private setDefaults(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V
    .registers 6
    .param p1, "entry"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .prologue
    .line 772
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_c

    .line 773
    iget v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->method:I

    invoke-virtual {p1, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setMethod(I)V

    .line 776
    :cond_c
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getTime()J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_1d

    .line 777
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setTime(J)V

    .line 779
    :cond_1d
    return-void
.end method

.method private shouldAddZip64Extra(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/compress/archivers/zip/Zip64Mode;)Z
    .registers 7
    .param p1, "entry"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .param p2, "mode"    # Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    .prologue
    const-wide v2, 0xffffffffL

    .line 826
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/Zip64Mode;->Always:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    if-eq p2, v0, :cond_2b

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-gez v0, :cond_2b

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-gez v0, :cond_2b

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_2d

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-eqz v0, :cond_2d

    sget-object v0, Lorg/apache/commons/compress/archivers/zip/Zip64Mode;->Never:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    if-eq p2, v0, :cond_2d

    :cond_2b
    const/4 v0, 0x1

    :goto_2c
    return v0

    :cond_2d
    const/4 v0, 0x0

    goto :goto_2c
.end method

.method private validateSizeInformation(Lorg/apache/commons/compress/archivers/zip/Zip64Mode;)V
    .registers 8
    .param p1, "effectiveMode"    # Lorg/apache/commons/compress/archivers/zip/Zip64Mode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    const-wide v4, 0xffffffffL

    const-wide/16 v2, -0x1

    .line 790
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v0

    if-nez v0, :cond_56

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-nez v0, :cond_56

    .line 791
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-nez v0, :cond_2d

    .line 792
    new-instance v0, Ljava/util/zip/ZipException;

    const-string v1, "uncompressed size is required for STORED method when not writing to a file"

    invoke-direct {v0, v1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 796
    :cond_2d
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCrc()J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-nez v0, :cond_43

    .line 797
    new-instance v0, Ljava/util/zip/ZipException;

    const-string v1, "crc checksum is required for STORED method when not writing to a file"

    invoke-direct {v0, v1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 800
    :cond_43
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setCompressedSize(J)V

    .line 803
    :cond_56
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v0

    cmp-long v0, v0, v4

    if-gez v0, :cond_72

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v0

    cmp-long v0, v0, v4

    if-ltz v0, :cond_86

    :cond_72
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/Zip64Mode;->Never:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    if-ne p1, v0, :cond_86

    .line 806
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/Zip64RequiredException;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/Zip64RequiredException;->getEntryTooBigMessage(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/zip/Zip64RequiredException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 809
    :cond_86
    return-void
.end method

.method private versionNeededToExtract(IZ)I
    .registers 4
    .param p1, "zipMethod"    # I
    .param p2, "zip64"    # Z

    .prologue
    .line 1430
    if-eqz p2, :cond_5

    .line 1431
    const/16 v0, 0x2d

    .line 1435
    :goto_4
    return v0

    :cond_5
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->isDeflatedToOutputStream(I)Z

    move-result v0

    if-eqz v0, :cond_e

    const/16 v0, 0x14

    goto :goto_4

    :cond_e
    const/16 v0, 0xa

    goto :goto_4
.end method

.method private writeCentralDirectoryInChunks()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 463
    const/16 v0, 0x3e8

    .line 464
    .local v0, "NUM_PER_WRITE":I
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    const v5, 0x11170

    invoke-direct {v1, v5}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 465
    .local v1, "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    const/4 v2, 0x0

    .line 466
    .local v2, "count":I
    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entries:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_11
    :goto_11
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_34

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .line 467
    .local v4, "ze":Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-direct {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->createCentralFileHeader(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)[B

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 468
    add-int/lit8 v2, v2, 0x1

    if-le v2, v0, :cond_11

    .line 469
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    invoke-direct {p0, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 470
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 471
    const/4 v2, 0x0

    goto :goto_11

    .line 474
    .end local v4    # "ze":Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    :cond_34
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    invoke-direct {p0, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 475
    return-void
.end method

.method private writeCounted([B)V
    .registers 3
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 910
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    invoke-virtual {v0, p1}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->writeCounted([B)V

    .line 911
    return-void
.end method

.method private writeLocalFileHeader(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Z)V
    .registers 11
    .param p1, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .param p2, "phased"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1003
    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->canEncode(Ljava/lang/String;)Z

    move-result v0

    .line 1004
    .local v0, "encodable":Z
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->getName(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 1006
    .local v4, "name":Ljava/nio/ByteBuffer;
    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->createUnicodeExtraFields:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    sget-object v6, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;->NEVER:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    if-eq v5, v6, :cond_17

    .line 1007
    invoke-direct {p0, p1, v0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->addUnicodeExtraFields(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;ZLjava/nio/ByteBuffer;)V

    .line 1010
    :cond_17
    invoke-direct {p0, p1, v4, v0, p2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->createLocalFileHeader(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Ljava/nio/ByteBuffer;ZZ)[B

    move-result-object v1

    .line 1011
    .local v1, "localHeader":[B
    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->getTotalBytesWritten()J

    move-result-wide v2

    .line 1012
    .local v2, "localHeaderStart":J
    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->offsets:Ljava/util/Map;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v5, p1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1013
    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    const-wide/16 v6, 0xe

    add-long/2addr v6, v2

    # setter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->localDataStart:J
    invoke-static {v5, v6, v7}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$402(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;J)J

    .line 1014
    invoke-direct {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 1015
    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    invoke-virtual {v6}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->getTotalBytesWritten()J

    move-result-wide v6

    # setter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->dataStart:J
    invoke-static {v5, v6, v7}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$002(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;J)J

    .line 1016
    return-void
.end method


# virtual methods
.method public addRawArchiveEntry(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Ljava/io/InputStream;)V
    .registers 9
    .param p1, "entry"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .param p2, "rawStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v4, -0x1

    .line 555
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    invoke-direct {v0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;-><init>(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V

    .line 556
    .local v0, "ae":Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->hasZip64Extra(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 560
    sget-object v2, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->HEADER_ID:Lorg/apache/commons/compress/archivers/zip/ZipShort;

    invoke-virtual {v0, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->removeExtraField(Lorg/apache/commons/compress/archivers/zip/ZipShort;)V

    .line 562
    :cond_12
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCrc()J

    move-result-wide v2

    cmp-long v2, v2, v4

    if-eqz v2, :cond_35

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v2

    cmp-long v2, v2, v4

    if-eqz v2, :cond_35

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v2

    cmp-long v2, v2, v4

    if-eqz v2, :cond_35

    const/4 v1, 0x1

    .line 565
    .local v1, "is2PhaseSource":Z
    :goto_2b
    invoke-direct {p0, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->putArchiveEntry(Lorg/apache/commons/compress/archivers/ArchiveEntry;Z)V

    .line 566
    invoke-direct {p0, p2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->copyFromZipInputStream(Ljava/io/InputStream;)V

    .line 567
    invoke-direct {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->closeCopiedEntry(Z)V

    .line 568
    return-void

    .line 562
    .end local v1    # "is2PhaseSource":Z
    :cond_35
    const/4 v1, 0x0

    goto :goto_2b
.end method

.method public canWriteEntryData(Lorg/apache/commons/compress/archivers/ArchiveEntry;)Z
    .registers 6
    .param p1, "ae"    # Lorg/apache/commons/compress/archivers/ArchiveEntry;

    .prologue
    const/4 v1, 0x0

    .line 878
    instance-of v2, p1, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    if-eqz v2, :cond_27

    move-object v0, p1

    .line 879
    check-cast v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .line 880
    .local v0, "zae":Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v2

    sget-object v3, Lorg/apache/commons/compress/archivers/zip/ZipMethod;->IMPLODING:Lorg/apache/commons/compress/archivers/zip/ZipMethod;

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/zip/ZipMethod;->getCode()I

    move-result v3

    if-eq v2, v3, :cond_27

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v2

    sget-object v3, Lorg/apache/commons/compress/archivers/zip/ZipMethod;->UNSHRINKING:Lorg/apache/commons/compress/archivers/zip/ZipMethod;

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/zip/ZipMethod;->getCode()I

    move-result v3

    if-eq v2, v3, :cond_27

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->canHandleEntryData(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v2

    if-eqz v2, :cond_27

    const/4 v1, 0x1

    .line 884
    .end local v0    # "zae":Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    :cond_27
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
    .line 938
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->finished:Z

    if-nez v0, :cond_7

    .line 939
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->finish()V

    .line 941
    :cond_7
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->destroy()V

    .line 942
    return-void
.end method

.method public closeArchiveEntry()V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 486
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->preClose()V

    .line 488
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->flushDeflater()V

    .line 490
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->getTotalBytesWritten()J

    move-result-wide v7

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->dataStart:J
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$000(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)J

    move-result-wide v9

    sub-long v1, v7, v9

    .line 491
    .local v1, "bytesWritten":J
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->getCrc32()J

    move-result-wide v3

    .line 492
    .local v3, "realCrc":J
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    iget-object v7, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    invoke-virtual {v7}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->getBytesRead()J

    move-result-wide v7

    # setter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->bytesRead:J
    invoke-static {v0, v7, v8}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$102(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;J)J

    .line 493
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->getEffectiveZip64Mode(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    move-result-object v5

    .local v5, "effectiveMode":Lorg/apache/commons/compress/archivers/zip/Zip64Mode;
    move-object v0, p0

    .line 494
    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->handleSizesAndCrc(JJLorg/apache/commons/compress/archivers/zip/Zip64Mode;)Z

    move-result v6

    .line 495
    .local v6, "actuallyNeedsZip64":Z
    const/4 v0, 0x0

    invoke-direct {p0, v6, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->closeEntry(ZZ)V

    .line 496
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->reset()V

    .line 497
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
    .line 1459
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->finished:Z

    if-eqz v0, :cond_c

    .line 1460
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Stream has already been finished"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1462
    :cond_c
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    invoke-direct {v0, p1, p2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method protected final deflate()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 990
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->deflate()V

    .line 991
    return-void
.end method

.method destroy()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1544
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-eqz v0, :cond_9

    .line 1545
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 1547
    :cond_9
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    if-eqz v0, :cond_12

    .line 1548
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 1550
    :cond_12
    return-void
.end method

.method public finish()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 442
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->finished:Z

    if-eqz v0, :cond_c

    .line 443
    new-instance v0, Ljava/io/IOException;

    const-string v1, "This archive has already been finished"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 446
    :cond_c
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    if-eqz v0, :cond_18

    .line 447
    new-instance v0, Ljava/io/IOException;

    const-string v1, "This archive contains unclosed entries."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 450
    :cond_18
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->getTotalBytesWritten()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->cdOffset:J

    .line 451
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeCentralDirectoryInChunks()V

    .line 453
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->getTotalBytesWritten()J

    move-result-wide v0

    iget-wide v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->cdOffset:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->cdLength:J

    .line 454
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeZip64CentralDirectory()V

    .line 455
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeCentralDirectoryEnd()V

    .line 456
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->offsets:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 457
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 458
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->close()V

    .line 459
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->finished:Z

    .line 460
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
    .line 952
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    if-eqz v0, :cond_9

    .line 953
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 955
    :cond_9
    return-void
.end method

.method public getEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 344
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method public isSeekable()Z
    .registers 2

    .prologue
    .line 318
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public putArchiveEntry(Lorg/apache/commons/compress/archivers/ArchiveEntry;)V
    .registers 3
    .param p1, "archiveEntry"    # Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 706
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->putArchiveEntry(Lorg/apache/commons/compress/archivers/ArchiveEntry;Z)V

    .line 707
    return-void
.end method

.method public setComment(Ljava/lang/String;)V
    .registers 2
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 838
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->comment:Ljava/lang/String;

    .line 839
    return-void
.end method

.method public setCreateUnicodeExtraFields(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;)V
    .registers 2
    .param p1, "b"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    .prologue
    .line 368
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->createUnicodeExtraFields:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$UnicodeExtraFieldPolicy;

    .line 369
    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .registers 3
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 331
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->encoding:Ljava/lang/String;

    .line 332
    invoke-static {p1}, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    .line 333
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->useUTF8Flag:Z

    if-eqz v0, :cond_15

    invoke-static {p1}, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->isUTF8(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_15

    .line 334
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->useUTF8Flag:Z

    .line 336
    :cond_15
    return-void
.end method

.method public setFallbackToUTF8(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 382
    iput-boolean p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->fallbackToUTF8:Z

    .line 383
    return-void
.end method

.method public setLevel(I)V
    .registers 5
    .param p1, "level"    # I

    .prologue
    .line 850
    const/4 v0, -0x1

    if-lt p1, v0, :cond_7

    const/16 v0, 0x9

    if-le p1, v0, :cond_20

    .line 852
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid compression level: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 855
    :cond_20
    iget v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->level:I

    if-eq v0, p1, :cond_2a

    const/4 v0, 0x1

    :goto_25
    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->hasCompressionLevelChanged:Z

    .line 856
    iput p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->level:I

    .line 857
    return-void

    .line 855
    :cond_2a
    const/4 v0, 0x0

    goto :goto_25
.end method

.method public setMethod(I)V
    .registers 2
    .param p1, "method"    # I

    .prologue
    .line 866
    iput p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->method:I

    .line 867
    return-void
.end method

.method public setUseLanguageEncodingFlag(Z)V
    .registers 3
    .param p1, "b"    # Z

    .prologue
    .line 357
    if-eqz p1, :cond_e

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->encoding:Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->isUTF8(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_b
    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->useUTF8Flag:Z

    .line 358
    return-void

    .line 357
    :cond_e
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public setUseZip64(Lorg/apache/commons/compress/archivers/zip/Zip64Mode;)V
    .registers 2
    .param p1, "mode"    # Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    .prologue
    .line 431
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    .line 432
    return-void
.end method

.method public write([BII)V
    .registers 8
    .param p1, "b"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 896
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    if-nez v2, :cond_c

    .line 897
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "No current entry"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 899
    :cond_c
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->checkRequestedFeatures(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V

    .line 900
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v3

    invoke-virtual {v2, p1, p2, p3, v3}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->write([BIII)J

    move-result-wide v0

    .line 901
    .local v0, "writtenThisTime":J
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->count(J)V

    .line 902
    return-void
.end method

.method protected writeCentralDirectoryEnd()V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const v8, 0xffff

    const-wide v6, 0xffffffffL

    .line 1295
    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->EOCD_SIG:[B

    invoke-direct {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 1298
    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->ZERO:[B

    invoke-direct {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 1299
    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->ZERO:[B

    invoke-direct {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 1302
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entries:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 1303
    .local v3, "numberOfEntries":I
    if-le v3, v8, :cond_2d

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    sget-object v5, Lorg/apache/commons/compress/archivers/zip/Zip64Mode;->Never:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    if-ne v4, v5, :cond_2d

    .line 1305
    new-instance v4, Lorg/apache/commons/compress/archivers/zip/Zip64RequiredException;

    const-string v5, "archive contains more than 65535 entries."

    invoke-direct {v4, v5}, Lorg/apache/commons/compress/archivers/zip/Zip64RequiredException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1308
    :cond_2d
    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->cdOffset:J

    cmp-long v4, v4, v6

    if-lez v4, :cond_41

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    sget-object v5, Lorg/apache/commons/compress/archivers/zip/Zip64Mode;->Never:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    if-ne v4, v5, :cond_41

    .line 1309
    new-instance v4, Lorg/apache/commons/compress/archivers/zip/Zip64RequiredException;

    const-string v5, "archive\'s size exceeds the limit of 4GByte."

    invoke-direct {v4, v5}, Lorg/apache/commons/compress/archivers/zip/Zip64RequiredException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1313
    :cond_41
    invoke-static {v3, v8}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getBytes(I)[B

    move-result-object v2

    .line 1315
    .local v2, "num":[B
    invoke-direct {p0, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 1316
    invoke-direct {p0, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 1319
    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->cdLength:J

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    invoke-static {v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes(J)[B

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 1320
    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->cdOffset:J

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    invoke-static {v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes(J)[B

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 1323
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->comment:Ljava/lang/String;

    invoke-interface {v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 1324
    .local v0, "data":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    sub-int v1, v4, v5

    .line 1325
    .local v1, "dataLen":I
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getBytes(I)[B

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 1326
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v5

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v6

    invoke-virtual {v4, v5, v6, v1}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->writeCounted([BII)V

    .line 1327
    return-void
.end method

.method protected writeCentralFileHeader(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V
    .registers 3
    .param p1, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1150
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->createCentralFileHeader(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)[B

    move-result-object v0

    .line 1151
    .local v0, "centralFileHeader":[B
    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 1152
    return-void
.end method

.method protected writeDataDescriptor(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V
    .registers 4
    .param p1, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1127
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_c

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->raf:Ljava/io/RandomAccessFile;

    if-eqz v0, :cond_d

    .line 1139
    :cond_c
    :goto_c
    return-void

    .line 1130
    :cond_d
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->DD_SIG:[B

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 1131
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCrc()J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes(J)[B

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 1132
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->hasZip64Extra(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v0

    if-nez v0, :cond_3a

    .line 1133
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes(J)[B

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 1134
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes(J)[B

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    goto :goto_c

    .line 1136
    :cond_3a
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getBytes(J)[B

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    .line 1137
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getBytes(J)[B

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeCounted([B)V

    goto :goto_c
.end method

.method protected writeLocalFileHeader(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V
    .registers 3
    .param p1, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 999
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeLocalFileHeader(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Z)V

    .line 1000
    return-void
.end method

.method protected final writeOut([B)V
    .registers 5
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1403
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    const/4 v1, 0x0

    array-length v2, p1

    invoke-virtual {v0, p1, v1, v2}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->writeOut([BII)V

    .line 1404
    return-void
.end method

.method protected final writeOut([BII)V
    .registers 5
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1416
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->writeOut([BII)V

    .line 1417
    return-void
.end method

.method protected writeZip64CentralDirectory()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide v6, 0xffffffffL

    const/16 v5, 0x2d

    .line 1336
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->zip64Mode:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    sget-object v4, Lorg/apache/commons/compress/archivers/zip/Zip64Mode;->Never:Lorg/apache/commons/compress/archivers/zip/Zip64Mode;

    if-ne v3, v4, :cond_e

    .line 1395
    :cond_d
    :goto_d
    return-void

    .line 1340
    :cond_e
    iget-boolean v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->hasUsedZip64:Z

    if-nez v3, :cond_2c

    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->cdOffset:J

    cmp-long v3, v3, v6

    if-gez v3, :cond_29

    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->cdLength:J

    cmp-long v3, v3, v6

    if-gez v3, :cond_29

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entries:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    const v4, 0xffff

    if-lt v3, v4, :cond_2c

    .line 1344
    :cond_29
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->hasUsedZip64:Z

    .line 1347
    :cond_2c
    iget-boolean v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->hasUsedZip64:Z

    if-eqz v3, :cond_d

    .line 1351
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->getTotalBytesWritten()J

    move-result-wide v1

    .line 1353
    .local v1, "offset":J
    sget-object v3, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->ZIP64_EOCD_SIG:[B

    invoke-virtual {p0, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 1356
    const-wide/16 v3, 0x2c

    invoke-static {v3, v4}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getBytes(J)[B

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 1368
    invoke-static {v5}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getBytes(I)[B

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 1369
    invoke-static {v5}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getBytes(I)[B

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 1372
    sget-object v3, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->LZERO:[B

    invoke-virtual {p0, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 1373
    sget-object v3, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->LZERO:[B

    invoke-virtual {p0, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 1376
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->entries:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    int-to-long v3, v3

    invoke-static {v3, v4}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getBytes(J)[B

    move-result-object v0

    .line 1377
    .local v0, "num":[B
    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 1378
    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 1381
    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->cdLength:J

    invoke-static {v3, v4}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getBytes(J)[B

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 1382
    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->cdOffset:J

    invoke-static {v3, v4}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getBytes(J)[B

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 1387
    sget-object v3, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->ZIP64_EOCD_LOC_SIG:[B

    invoke-virtual {p0, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 1390
    sget-object v3, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->LZERO:[B

    invoke-virtual {p0, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 1392
    invoke-static {v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getBytes(J)[B

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    .line 1394
    sget-object v3, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->ONE:[B

    invoke-virtual {p0, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->writeOut([B)V

    goto/16 :goto_d
.end method
