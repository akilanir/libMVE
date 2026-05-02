.class public Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;
.super Lorg/apache/commons/compress/archivers/ArchiveInputStream;
.source "ZipArchiveInputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$1;,
        Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;,
        Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;
    }
.end annotation


# static fields
.field private static final CFH:[B

.field private static final CFH_LEN:I = 0x2e

.field private static final DD:[B

.field private static final LFH:[B

.field private static final LFH_LEN:I = 0x1e

.field private static final TWO_EXP_32:J = 0x100000000L


# instance fields
.field private final LFH_BUF:[B

.field private final SHORT_BUF:[B

.field private final SKIP_BUF:[B

.field private final TWO_DWORD_BUF:[B

.field private final WORD_BUF:[B

.field private allowStoredEntriesWithDataDescriptor:Z

.field private final buf:Ljava/nio/ByteBuffer;

.field private closed:Z

.field private current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

.field final encoding:Ljava/lang/String;

.field private entriesRead:I

.field private hitCentralDirectory:Z

.field private final in:Ljava/io/InputStream;

.field private final inf:Ljava/util/zip/Inflater;

.field private lastStoredEntry:Ljava/io/ByteArrayInputStream;

.field private final useUnicodeExtraFields:Z

.field private final zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 798
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/ZipLong;->LFH_SIG:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes()[B

    move-result-object v0

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH:[B

    .line 799
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/ZipLong;->CFH_SIG:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes()[B

    move-result-object v0

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->CFH:[B

    .line 800
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/ZipLong;->DD_SIG:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes()[B

    move-result-object v0

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->DD:[B

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "inputStream"    # Ljava/io/InputStream;

    .prologue
    .line 166
    const-string v0, "UTF8"

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 167
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;)V
    .registers 4
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "encoding"    # Ljava/lang/String;

    .prologue
    .line 177
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;Z)V

    .line 178
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;Z)V
    .registers 5
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "useUnicodeExtraFields"    # Z

    .prologue
    .line 189
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;ZZ)V

    .line 190
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;ZZ)V
    .registers 9
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "useUnicodeExtraFields"    # Z
    .param p4, "allowStoredEntriesWithDataDescriptor"    # Z

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 206
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/ArchiveInputStream;-><init>()V

    .line 90
    new-instance v0, Ljava/util/zip/Inflater;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/zip/Inflater;-><init>(Z)V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    .line 93
    const/16 v0, 0x200

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    .line 96
    iput-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 99
    iput-boolean v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->closed:Z

    .line 102
    iput-boolean v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->hitCentralDirectory:Z

    .line 109
    iput-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->lastStoredEntry:Ljava/io/ByteArrayInputStream;

    .line 112
    iput-boolean v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->allowStoredEntriesWithDataDescriptor:Z

    .line 153
    const/16 v0, 0x1e

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH_BUF:[B

    .line 154
    const/16 v0, 0x400

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->SKIP_BUF:[B

    .line 155
    const/4 v0, 0x2

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->SHORT_BUF:[B

    .line 156
    const/4 v0, 0x4

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->WORD_BUF:[B

    .line 157
    const/16 v0, 0x10

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->TWO_DWORD_BUF:[B

    .line 159
    iput v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->entriesRead:I

    .line 207
    iput-object p2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->encoding:Ljava/lang/String;

    .line 208
    invoke-static {p2}, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    .line 209
    iput-boolean p3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->useUnicodeExtraFields:Z

    .line 210
    new-instance v0, Ljava/io/PushbackInputStream;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    invoke-direct {v0, p1, v1}, Ljava/io/PushbackInputStream;-><init>(Ljava/io/InputStream;I)V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    .line 211
    iput-boolean p4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->allowStoredEntriesWithDataDescriptor:Z

    .line 214
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 215
    return-void
.end method

.method static synthetic access$1000(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;I)V
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;
    .param p1, "x1"    # I

    .prologue
    .line 75
    invoke-virtual {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->count(I)V

    return-void
.end method

.method static synthetic access$800(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;I)V
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;
    .param p1, "x1"    # I

    .prologue
    .line 75
    invoke-virtual {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->count(I)V

    return-void
.end method

.method static synthetic access$900(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;

    .prologue
    .line 75
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    return-object v0
.end method

.method private bufferContainsSignature(Ljava/io/ByteArrayOutputStream;III)Z
    .registers 14
    .param p1, "bos"    # Ljava/io/ByteArrayOutputStream;
    .param p2, "offset"    # I
    .param p3, "lastRead"    # I
    .param p4, "expectedDDLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x3

    const/4 v6, 0x2

    .line 813
    const/4 v0, 0x0

    .line 814
    .local v0, "done":Z
    const/4 v2, 0x0

    .line 815
    .local v2, "readTooMuch":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    if-nez v0, :cond_b3

    add-int/lit8 v3, p3, -0x4

    if-ge v1, v3, :cond_b3

    .line 816
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    aget-byte v3, v3, v1

    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH:[B

    aget-byte v4, v4, v8

    if-ne v3, v4, :cond_89

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    add-int/lit8 v4, v1, 0x1

    aget-byte v3, v3, v4

    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH:[B

    const/4 v5, 0x1

    aget-byte v4, v4, v5

    if-ne v3, v4, :cond_89

    .line 817
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    add-int/lit8 v4, v1, 0x2

    aget-byte v3, v3, v4

    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH:[B

    aget-byte v4, v4, v6

    if-ne v3, v4, :cond_4b

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    add-int/lit8 v4, v1, 0x3

    aget-byte v3, v3, v4

    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH:[B

    aget-byte v4, v4, v7

    if-eq v3, v4, :cond_69

    :cond_4b
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    aget-byte v3, v3, v1

    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->CFH:[B

    aget-byte v4, v4, v6

    if-ne v3, v4, :cond_8d

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    add-int/lit8 v4, v1, 0x3

    aget-byte v3, v3, v4

    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->CFH:[B

    aget-byte v4, v4, v7

    if-ne v3, v4, :cond_8d

    .line 820
    :cond_69
    add-int v3, p2, p3

    sub-int/2addr v3, v1

    sub-int v2, v3, p4

    .line 821
    const/4 v0, 0x1

    .line 828
    :cond_6f
    :goto_6f
    if-eqz v0, :cond_89

    .line 833
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    add-int v4, p2, p3

    sub-int/2addr v4, v2

    invoke-direct {p0, v3, v4, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->pushback([BII)V

    .line 834
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    invoke-virtual {p1, v3, v8, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 835
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readDataDescriptor()V

    .line 815
    :cond_89
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_6

    .line 823
    :cond_8d
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    add-int/lit8 v4, v1, 0x2

    aget-byte v3, v3, v4

    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->DD:[B

    aget-byte v4, v4, v6

    if-ne v3, v4, :cond_6f

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    add-int/lit8 v4, v1, 0x3

    aget-byte v3, v3, v4

    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->DD:[B

    aget-byte v4, v4, v7

    if-ne v3, v4, :cond_6f

    .line 825
    add-int v3, p2, p3

    sub-int v2, v3, v1

    .line 826
    const/4 v0, 0x1

    goto :goto_6f

    .line 839
    :cond_b3
    return v0
.end method

.method private cacheBytesRead(Ljava/io/ByteArrayOutputStream;III)I
    .registers 10
    .param p1, "bos"    # Ljava/io/ByteArrayOutputStream;
    .param p2, "offset"    # I
    .param p3, "lastRead"    # I
    .param p4, "expecteDDLen"    # I

    .prologue
    const/4 v4, 0x0

    .line 852
    add-int v1, p2, p3

    sub-int/2addr v1, p4

    add-int/lit8 v0, v1, -0x3

    .line 853
    .local v0, "cacheable":I
    if-lez v0, :cond_25

    .line 854
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    invoke-virtual {p1, v1, v4, v0}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 855
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    add-int/lit8 v3, p4, 0x3

    invoke-static {v1, v0, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 856
    add-int/lit8 p2, p4, 0x3

    .line 860
    :goto_24
    return p2

    .line 858
    :cond_25
    add-int/2addr p2, p3

    goto :goto_24
.end method

.method private static checksig([B[B)Z
    .registers 5
    .param p0, "signature"    # [B
    .param p1, "expected"    # [B

    .prologue
    .line 576
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_f

    .line 577
    aget-byte v1, p0, v0

    aget-byte v2, p1, v0

    if-eq v1, v2, :cond_c

    .line 578
    const/4 v1, 0x0

    .line 581
    :goto_b
    return v1

    .line 576
    :cond_c
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 581
    :cond_f
    const/4 v1, 0x1

    goto :goto_b
.end method

.method private closeEntry()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 603
    iget-boolean v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->closed:Z

    if-eqz v3, :cond_d

    .line 604
    new-instance v3, Ljava/io/IOException;

    const-string v4, "The stream is closed"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 606
    :cond_d
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    if-nez v3, :cond_12

    .line 638
    :goto_11
    return-void

    .line 611
    :cond_12
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->bytesReadFromStream:J
    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$700(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    move-result-wide v3

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v5

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-gtz v3, :cond_53

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->hasDataDescriptor:Z
    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Z

    move-result v3

    if-nez v3, :cond_53

    .line 613
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->drainCurrentEntryData()V

    .line 630
    :cond_31
    :goto_31
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->lastStoredEntry:Ljava/io/ByteArrayInputStream;

    if-nez v3, :cond_40

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->hasDataDescriptor:Z
    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Z

    move-result v3

    if-eqz v3, :cond_40

    .line 631
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readDataDescriptor()V

    .line 634
    :cond_40
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v3}, Ljava/util/zip/Inflater;->reset()V

    .line 635
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/nio/Buffer;->flip()Ljava/nio/Buffer;

    .line 636
    iput-object v7, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 637
    iput-object v7, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->lastStoredEntry:Ljava/io/ByteArrayInputStream;

    goto :goto_11

    .line 615
    :cond_53
    const-wide v3, 0x7fffffffffffffffL

    invoke-virtual {p0, v3, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->skip(J)J

    .line 617
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v3

    const/16 v4, 0x8

    if-ne v3, v4, :cond_88

    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->getBytesInflated()J

    move-result-wide v1

    .line 622
    .local v1, "inB":J
    :goto_6d
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->bytesReadFromStream:J
    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$700(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    move-result-wide v3

    sub-long/2addr v3, v1

    long-to-int v0, v3

    .line 625
    .local v0, "diff":I
    if-lez v0, :cond_31

    .line 626
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    sub-int/2addr v4, v0

    invoke-direct {p0, v3, v4, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->pushback([BII)V

    goto :goto_31

    .line 617
    .end local v0    # "diff":I
    .end local v1    # "inB":J
    :cond_88
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->bytesRead:J
    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$600(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    move-result-wide v1

    goto :goto_6d
.end method

.method private drainCurrentEntryData()V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v9, 0x0

    .line 645
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v4

    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->bytesReadFromStream:J
    invoke-static {v6}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$700(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    move-result-wide v6

    sub-long v2, v4, v6

    .line 646
    .local v2, "remaining":J
    :goto_14
    cmp-long v4, v2, v9

    if-lez v4, :cond_5e

    .line 647
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v5

    const/4 v6, 0x0

    iget-object v7, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v7

    int-to-long v7, v7

    invoke-static {v7, v8, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v7

    long-to-int v7, v7

    invoke-virtual {v4, v5, v6, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    int-to-long v0, v4

    .line 648
    .local v0, "n":J
    cmp-long v4, v0, v9

    if-gez v4, :cond_59

    .line 649
    new-instance v4, Ljava/io/EOFException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Truncated ZIP entry: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v6}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 651
    :cond_59
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->count(J)V

    .line 652
    sub-long/2addr v2, v0

    .line 654
    goto :goto_14

    .line 655
    .end local v0    # "n":J
    :cond_5e
    return-void
.end method

.method private fill()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 683
    iget-boolean v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->closed:Z

    if-eqz v1, :cond_c

    .line 684
    new-instance v1, Ljava/io/IOException;

    const-string v2, "The stream is closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 686
    :cond_c
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/InputStream;->read([B)I

    move-result v0

    .line 687
    .local v0, "length":I
    if-lez v0, :cond_3a

    .line 688
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 689
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->count(I)V

    .line 690
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    const/4 v3, 0x0

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    invoke-virtual {v1, v2, v3, v4}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 692
    :cond_3a
    return v0
.end method

.method private findEocdRecord()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, -0x1

    .line 906
    const/4 v0, -0x1

    .line 907
    .local v0, "currentByte":I
    const/4 v1, 0x0

    .line 908
    .local v1, "skipReadCall":Z
    :cond_3
    :goto_3
    if-nez v1, :cond_b

    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readOneByte()I

    move-result v0

    if-le v0, v4, :cond_1f

    .line 909
    :cond_b
    const/4 v1, 0x0

    .line 910
    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->isFirstByteOfEocdSig(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 913
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readOneByte()I

    move-result v0

    .line 914
    sget-object v2, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->EOCD_SIG:[B

    const/4 v3, 0x1

    aget-byte v2, v2, v3

    if-eq v0, v2, :cond_25

    .line 915
    if-ne v0, v4, :cond_20

    .line 936
    :cond_1f
    return-void

    .line 918
    :cond_20
    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->isFirstByteOfEocdSig(I)Z

    move-result v1

    .line 919
    goto :goto_3

    .line 921
    :cond_25
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readOneByte()I

    move-result v0

    .line 922
    sget-object v2, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->EOCD_SIG:[B

    const/4 v3, 0x2

    aget-byte v2, v2, v3

    if-eq v0, v2, :cond_37

    .line 923
    if-eq v0, v4, :cond_1f

    .line 926
    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->isFirstByteOfEocdSig(I)Z

    move-result v1

    .line 927
    goto :goto_3

    .line 929
    :cond_37
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readOneByte()I

    move-result v0

    .line 930
    if-eq v0, v4, :cond_1f

    sget-object v2, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->EOCD_SIG:[B

    const/4 v3, 0x3

    aget-byte v2, v2, v3

    if-eq v0, v2, :cond_1f

    .line 934
    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->isFirstByteOfEocdSig(I)Z

    move-result v1

    goto :goto_3
.end method

.method private getBytesInflated()J
    .registers 9

    .prologue
    const-wide v6, 0x100000000L

    .line 673
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v2}, Ljava/util/zip/Inflater;->getBytesRead()J

    move-result-wide v0

    .line 674
    .local v0, "inB":J
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->bytesReadFromStream:J
    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$700(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    move-result-wide v2

    cmp-long v2, v2, v6

    if-ltz v2, :cond_23

    .line 675
    :goto_15
    add-long v2, v0, v6

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->bytesReadFromStream:J
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$700(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-gtz v2, :cond_23

    .line 676
    add-long/2addr v0, v6

    goto :goto_15

    .line 679
    :cond_23
    return-wide v0
.end method

.method private isFirstByteOfEocdSig(I)Z
    .registers 4
    .param p1, "b"    # I

    .prologue
    const/4 v0, 0x0

    .line 977
    sget-object v1, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->EOCD_SIG:[B

    aget-byte v1, v1, v0

    if-ne p1, v1, :cond_8

    const/4 v0, 0x1

    :cond_8
    return v0
.end method

.method public static matches([BI)Z
    .registers 4
    .param p0, "signature"    # [B
    .param p1, "length"    # I

    .prologue
    const/4 v0, 0x0

    .line 565
    sget-object v1, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->LFH_SIG:[B

    array-length v1, v1

    if-ge p1, v1, :cond_7

    .line 569
    :cond_6
    :goto_6
    return v0

    :cond_7
    sget-object v1, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->LFH_SIG:[B

    invoke-static {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->checksig([B[B)Z

    move-result v1

    if-nez v1, :cond_2b

    sget-object v1, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->EOCD_SIG:[B

    invoke-static {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->checksig([B[B)Z

    move-result v1

    if-nez v1, :cond_2b

    sget-object v1, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->DD_SIG:[B

    invoke-static {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->checksig([B[B)Z

    move-result v1

    if-nez v1, :cond_2b

    sget-object v1, Lorg/apache/commons/compress/archivers/zip/ZipLong;->SINGLE_SEGMENT_SPLIT_MARKER:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes()[B

    move-result-object v1

    invoke-static {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->checksig([B[B)Z

    move-result v1

    if-eqz v1, :cond_6

    :cond_2b
    const/4 v0, 0x1

    goto :goto_6
.end method

.method private processZip64Extra(Lorg/apache/commons/compress/archivers/zip/ZipLong;Lorg/apache/commons/compress/archivers/zip/ZipLong;)V
    .registers 7
    .param p1, "size"    # Lorg/apache/commons/compress/archivers/zip/ZipLong;
    .param p2, "cSize"    # Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .prologue
    .line 350
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    sget-object v2, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->HEADER_ID:Lorg/apache/commons/compress/archivers/zip/ZipShort;

    invoke-virtual {v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getExtraField(Lorg/apache/commons/compress/archivers/zip/ZipShort;)Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;

    .line 353
    .local v0, "z64":Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    if-eqz v0, :cond_53

    const/4 v1, 0x1

    :goto_13
    # setter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->usesZip64:Z
    invoke-static {v2, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$402(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;Z)Z

    .line 354
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->hasDataDescriptor:Z
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Z

    move-result v1

    if-nez v1, :cond_52

    .line 355
    if-eqz v0, :cond_55

    sget-object v1, Lorg/apache/commons/compress/archivers/zip/ZipLong;->ZIP64_MAGIC:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {p2, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_30

    sget-object v1, Lorg/apache/commons/compress/archivers/zip/ZipLong;->ZIP64_MAGIC:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {p1, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_55

    .line 357
    :cond_30
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->getCompressedSize()Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getLongValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setCompressedSize(J)V

    .line 358
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField;->getSize()Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getLongValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    .line 364
    :cond_52
    :goto_52
    return-void

    .line 353
    :cond_53
    const/4 v1, 0x0

    goto :goto_13

    .line 360
    :cond_55
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setCompressedSize(J)V

    .line 361
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    goto :goto_52
.end method

.method private pushback([BII)V
    .registers 6
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 864
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    check-cast v0, Ljava/io/PushbackInputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/PushbackInputStream;->unread([BII)V

    .line 865
    int-to-long v0, p3

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->pushedBackBytes(J)V

    .line 866
    return-void
.end method

.method private readDataDescriptor()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x8

    .line 704
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->WORD_BUF:[B

    invoke-direct {p0, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readFully([B)V

    .line 705
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->WORD_BUF:[B

    invoke-direct {v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>([B)V

    .line 706
    .local v1, "val":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    sget-object v2, Lorg/apache/commons/compress/archivers/zip/ZipLong;->DD_SIG:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v2, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_22

    .line 708
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->WORD_BUF:[B

    invoke-direct {p0, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readFully([B)V

    .line 709
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .end local v1    # "val":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->WORD_BUF:[B

    invoke-direct {v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>([B)V

    .line 711
    .restart local v1    # "val":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    :cond_22
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v2

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setCrc(J)V

    .line 724
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->TWO_DWORD_BUF:[B

    invoke-direct {p0, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readFully([B)V

    .line 725
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->TWO_DWORD_BUF:[B

    invoke-direct {v0, v2, v5}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>([BI)V

    .line 726
    .local v0, "potentialSig":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    sget-object v2, Lorg/apache/commons/compress/archivers/zip/ZipLong;->CFH_SIG:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v0, v2}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4b

    sget-object v2, Lorg/apache/commons/compress/archivers/zip/ZipLong;->LFH_SIG:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v0, v2}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_70

    .line 727
    :cond_4b
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->TWO_DWORD_BUF:[B

    invoke-direct {p0, v2, v5, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->pushback([BII)V

    .line 728
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->TWO_DWORD_BUF:[B

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue([B)J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setCompressedSize(J)V

    .line 729
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->TWO_DWORD_BUF:[B

    const/4 v4, 0x4

    invoke-static {v3, v4}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue([BI)J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    .line 734
    :goto_6f
    return-void

    .line 731
    :cond_70
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->TWO_DWORD_BUF:[B

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getLongValue([B)J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setCompressedSize(J)V

    .line 732
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->TWO_DWORD_BUF:[B

    invoke-static {v3, v5}, Lorg/apache/commons/compress/archivers/zip/ZipEightByteInteger;->getLongValue([BI)J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    goto :goto_6f
.end method

.method private readDeflated([BII)I
    .registers 7
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 473
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readFromInflater([BII)I

    move-result v0

    .line 474
    .local v0, "read":I
    if-gtz v0, :cond_10

    .line 475
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v2}, Ljava/util/zip/Inflater;->finished()Z

    move-result v2

    if-eqz v2, :cond_11

    move v0, v1

    .line 485
    .end local v0    # "read":I
    :cond_10
    return v0

    .line 477
    .restart local v0    # "read":I
    :cond_11
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v2}, Ljava/util/zip/Inflater;->needsDictionary()Z

    move-result v2

    if-eqz v2, :cond_21

    .line 478
    new-instance v1, Ljava/util/zip/ZipException;

    const-string v2, "This archive needs a preset dictionary which is not supported by Commons Compress."

    invoke-direct {v1, v2}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 481
    :cond_21
    if-ne v0, v1, :cond_10

    .line 482
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Truncated ZIP file"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private readFirstLocalFileHeader([B)V
    .registers 8
    .param p1, "lfh"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x1a

    const/4 v4, 0x0

    const/4 v3, 0x4

    .line 328
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readFully([B)V

    .line 329
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-direct {v1, p1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>([B)V

    .line 330
    .local v1, "sig":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    sget-object v2, Lorg/apache/commons/compress/archivers/zip/ZipLong;->DD_SIG:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 331
    new-instance v2, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;

    sget-object v3, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;->SPLITTING:Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;

    invoke-direct {v2, v3}, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;-><init>(Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;)V

    throw v2

    .line 334
    :cond_1c
    sget-object v2, Lorg/apache/commons/compress/archivers/zip/ZipLong;->SINGLE_SEGMENT_SPLIT_MARKER:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2f

    .line 337
    new-array v0, v3, [B

    .line 338
    .local v0, "missedLfhBytes":[B
    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readFully([B)V

    .line 339
    invoke-static {p1, v3, p1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 340
    invoke-static {v0, v4, p1, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 342
    .end local v0    # "missedLfhBytes":[B
    :cond_2f
    return-void
.end method

.method private readFromInflater([BII)I
    .registers 11
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    .line 493
    const/4 v2, 0x0

    .line 495
    .local v2, "read":I
    :cond_2
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v4}, Ljava/util/zip/Inflater;->needsInput()Z

    move-result v4

    if-eqz v4, :cond_1c

    .line 496
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->fill()I

    move-result v1

    .line 497
    .local v1, "l":I
    if-lez v1, :cond_2e

    .line 498
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->limit()I

    move-result v5

    int-to-long v5, v5

    # += operator for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->bytesReadFromStream:J
    invoke-static {v4, v5, v6}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$714(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;J)J

    .line 506
    .end local v1    # "l":I
    :cond_1c
    :try_start_1c
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v4, p1, p2, p3}, Ljava/util/zip/Inflater;->inflate([BII)I
    :try_end_21
    .catch Ljava/util/zip/DataFormatException; {:try_start_1c .. :try_end_21} :catch_31

    move-result v2

    .line 510
    if-nez v2, :cond_2c

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v4}, Ljava/util/zip/Inflater;->needsInput()Z

    move-result v4

    if-nez v4, :cond_2

    :cond_2c
    move v3, v2

    .line 511
    :goto_2d
    return v3

    .line 499
    .restart local v1    # "l":I
    :cond_2e
    if-ne v1, v3, :cond_2c

    goto :goto_2d

    .line 507
    .end local v1    # "l":I
    :catch_31
    move-exception v0

    .line 508
    .local v0, "e":Ljava/util/zip/DataFormatException;
    new-instance v3, Ljava/util/zip/ZipException;

    invoke-virtual {v0}, Ljava/util/zip/DataFormatException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/util/zip/ZipException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v3

    check-cast v3, Ljava/io/IOException;

    throw v3
.end method

.method private readFully([B)V
    .registers 4
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 696
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    invoke-static {v1, p1}, Lorg/apache/commons/compress/utils/IOUtils;->readFully(Ljava/io/InputStream;[B)I

    move-result v0

    .line 697
    .local v0, "count":I
    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->count(I)V

    .line 698
    array-length v1, p1

    if-ge v0, v1, :cond_12

    .line 699
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 701
    :cond_12
    return-void
.end method

.method private readOneByte()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 969
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 970
    .local v0, "b":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_d

    .line 971
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->count(I)V

    .line 973
    :cond_d
    return v0
.end method

.method private readStored([BII)I
    .registers 12
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    .line 435
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->hasDataDescriptor:Z
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Z

    move-result v4

    if-eqz v4, :cond_17

    .line 436
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->lastStoredEntry:Ljava/io/ByteArrayInputStream;

    if-nez v4, :cond_10

    .line 437
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readStoredEntry()V

    .line 439
    :cond_10
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->lastStoredEntry:Ljava/io/ByteArrayInputStream;

    invoke-virtual {v4, p1, p2, p3}, Ljava/io/ByteArrayInputStream;->read([BII)I

    move-result v3

    .line 466
    :cond_16
    :goto_16
    return v3

    .line 442
    :cond_17
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v0

    .line 443
    .local v0, "csize":J
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->bytesRead:J
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$600(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    move-result-wide v4

    cmp-long v4, v4, v0

    if-gez v4, :cond_16

    .line 447
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->limit()I

    move-result v5

    if-lt v4, v5, :cond_5b

    .line 448
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 449
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .line 450
    .local v2, "l":I
    if-eq v2, v3, :cond_16

    .line 453
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v4, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 455
    invoke-virtual {p0, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->count(I)V

    .line 456
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    int-to-long v5, v2

    # += operator for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->bytesReadFromStream:J
    invoke-static {v4, v5, v6}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$714(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;J)J

    .line 459
    .end local v2    # "l":I
    :cond_5b
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    invoke-static {v4, p3}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 460
    .local v3, "toRead":I
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->bytesRead:J
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$600(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    move-result-wide v4

    sub-long v4, v0, v4

    int-to-long v6, v3

    cmp-long v4, v4, v6

    if-gez v4, :cond_7b

    .line 462
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->bytesRead:J
    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$600(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    move-result-wide v4

    sub-long v4, v0, v4

    long-to-int v3, v4

    .line 464
    :cond_7b
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v4, p1, p2, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 465
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    int-to-long v5, v3

    # += operator for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->bytesRead:J
    invoke-static {v4, v5, v6}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$614(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;J)J

    goto :goto_16
.end method

.method private readStoredEntry()V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 768
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 769
    .local v1, "bos":Ljava/io/ByteArrayOutputStream;
    const/4 v4, 0x0

    .line 770
    .local v4, "off":I
    const/4 v3, 0x0

    .line 773
    .local v3, "done":Z
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->usesZip64:Z
    invoke-static {v6}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$400(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Z

    move-result v6

    if-eqz v6, :cond_2b

    const/16 v2, 0x14

    .line 775
    .local v2, "ddLen":I
    :cond_11
    :goto_11
    if-nez v3, :cond_40

    .line 776
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    iget-object v7, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v7

    rsub-int v8, v4, 0x200

    invoke-virtual {v6, v7, v4, v8}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    .line 777
    .local v5, "r":I
    if-gtz v5, :cond_2e

    .line 780
    new-instance v6, Ljava/io/IOException;

    const-string v7, "Truncated ZIP file"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 773
    .end local v2    # "ddLen":I
    .end local v5    # "r":I
    :cond_2b
    const/16 v2, 0xc

    goto :goto_11

    .line 782
    .restart local v2    # "ddLen":I
    .restart local v5    # "r":I
    :cond_2e
    add-int v6, v5, v4

    const/4 v7, 0x4

    if-ge v6, v7, :cond_35

    .line 784
    add-int/2addr v4, v5

    .line 785
    goto :goto_11

    .line 788
    :cond_35
    invoke-direct {p0, v1, v4, v5, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->bufferContainsSignature(Ljava/io/ByteArrayOutputStream;III)Z

    move-result v3

    .line 789
    if-nez v3, :cond_11

    .line 790
    invoke-direct {p0, v1, v4, v5, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->cacheBytesRead(Ljava/io/ByteArrayOutputStream;III)I

    move-result v4

    goto :goto_11

    .line 794
    .end local v5    # "r":I
    :cond_40
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 795
    .local v0, "b":[B
    new-instance v6, Ljava/io/ByteArrayInputStream;

    invoke-direct {v6, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    iput-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->lastStoredEntry:Ljava/io/ByteArrayInputStream;

    .line 796
    return-void
.end method

.method private realSkip(J)V
    .registers 13
    .param p1, "value"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 946
    const-wide/16 v5, 0x0

    cmp-long v5, p1, v5

    if-ltz v5, :cond_2f

    .line 947
    const-wide/16 v2, 0x0

    .line 948
    .local v2, "skipped":J
    :goto_8
    cmp-long v5, v2, p1

    if-gez v5, :cond_23

    .line 949
    sub-long v0, p1, v2

    .line 950
    .local v0, "rem":J
    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->SKIP_BUF:[B

    const/4 v7, 0x0

    iget-object v8, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->SKIP_BUF:[B

    array-length v8, v8

    int-to-long v8, v8

    cmp-long v8, v8, v0

    if-lez v8, :cond_24

    .end local v0    # "rem":J
    :goto_1b
    long-to-int v8, v0

    invoke-virtual {v5, v6, v7, v8}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    .line 951
    .local v4, "x":I
    const/4 v5, -0x1

    if-ne v4, v5, :cond_29

    .line 957
    .end local v4    # "x":I
    :cond_23
    return-void

    .line 950
    .restart local v0    # "rem":J
    :cond_24
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->SKIP_BUF:[B

    array-length v8, v8

    int-to-long v0, v8

    goto :goto_1b

    .line 954
    .end local v0    # "rem":J
    .restart local v4    # "x":I
    :cond_29
    invoke-virtual {p0, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->count(I)V

    .line 955
    int-to-long v5, v4

    add-long/2addr v2, v5

    .line 956
    goto :goto_8

    .line 959
    .end local v2    # "skipped":J
    .end local v4    # "x":I
    :cond_2f
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-direct {v5}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v5
.end method

.method private skipRemainderOfArchive()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 893
    iget v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->entriesRead:I

    mul-int/lit8 v0, v0, 0x2e

    add-int/lit8 v0, v0, -0x1e

    int-to-long v0, v0

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->realSkip(J)V

    .line 894
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->findEocdRecord()V

    .line 895
    const-wide/16 v0, 0x10

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->realSkip(J)V

    .line 896
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->SHORT_BUF:[B

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readFully([B)V

    .line 898
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->SHORT_BUF:[B

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue([B)I

    move-result v0

    int-to-long v0, v0

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->realSkip(J)V

    .line 899
    return-void
.end method

.method private supportsDataDescriptorFor(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z
    .registers 4
    .param p1, "entry"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .prologue
    .line 744
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getGeneralPurposeBit()Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->usesDataDescriptor()Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->allowStoredEntriesWithDataDescriptor:Z

    if-eqz v0, :cond_14

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v0

    if-eqz v0, :cond_1c

    :cond_14
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_1e

    :cond_1c
    const/4 v0, 0x1

    :goto_1d
    return v0

    :cond_1e
    const/4 v0, 0x0

    goto :goto_1d
.end method


# virtual methods
.method public canReadEntryData(Lorg/apache/commons/compress/archivers/ArchiveEntry;)Z
    .registers 5
    .param p1, "ae"    # Lorg/apache/commons/compress/archivers/ArchiveEntry;

    .prologue
    const/4 v1, 0x0

    .line 380
    instance-of v2, p1, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    if-eqz v2, :cond_15

    move-object v0, p1

    .line 381
    check-cast v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .line 382
    .local v0, "ze":Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->canHandleEntryData(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v2

    if-eqz v2, :cond_15

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->supportsDataDescriptorFor(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v2

    if-eqz v2, :cond_15

    const/4 v1, 0x1

    .line 386
    .end local v0    # "ze":Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    :cond_15
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
    .line 516
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->closed:Z

    if-nez v0, :cond_11

    .line 517
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->closed:Z

    .line 518
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 519
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->end()V

    .line 521
    :cond_11
    return-void
.end method

.method public getNextEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 368
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->getNextZipEntry()Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v0

    return-object v0
.end method

.method public getNextZipEntry()Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .registers 30
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 218
    const/4 v12, 0x1

    .line 219
    .local v12, "firstEntry":Z
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->closed:Z

    move/from16 v21, v0

    if-nez v21, :cond_11

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->hitCentralDirectory:Z

    move/from16 v21, v0

    if-eqz v21, :cond_14

    .line 220
    :cond_11
    const/16 v21, 0x0

    .line 319
    :goto_13
    return-object v21

    .line 222
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v21, v0

    if-eqz v21, :cond_20

    .line 223
    invoke-direct/range {p0 .. p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->closeEntry()V

    .line 224
    const/4 v12, 0x0

    .line 228
    :cond_20
    if-eqz v12, :cond_70

    .line 233
    :try_start_22
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH_BUF:[B

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readFirstLocalFileHeader([B)V
    :try_end_2f
    .catch Ljava/io/EOFException; {:try_start_22 .. :try_end_2f} :catch_7e

    .line 241
    :goto_2f
    new-instance v16, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH_BUF:[B

    move-object/from16 v21, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>([B)V

    .line 242
    .local v16, "sig":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    sget-object v21, Lorg/apache/commons/compress/archivers/zip/ZipLong;->CFH_SIG:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_56

    sget-object v21, Lorg/apache/commons/compress/archivers/zip/ZipLong;->AED_SIG:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_61

    .line 243
    :cond_56
    const/16 v21, 0x1

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->hitCentralDirectory:Z

    .line 244
    invoke-direct/range {p0 .. p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->skipRemainderOfArchive()V

    .line 246
    :cond_61
    sget-object v21, Lorg/apache/commons/compress/archivers/zip/ZipLong;->LFH_SIG:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_82

    .line 247
    const/16 v21, 0x0

    goto :goto_13

    .line 235
    .end local v16    # "sig":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    :cond_70
    :try_start_70
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH_BUF:[B

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readFully([B)V
    :try_end_7d
    .catch Ljava/io/EOFException; {:try_start_70 .. :try_end_7d} :catch_7e

    goto :goto_2f

    .line 237
    :catch_7e
    move-exception v6

    .line 238
    .local v6, "e":Ljava/io/EOFException;
    const/16 v21, 0x0

    goto :goto_13

    .line 250
    .end local v6    # "e":Ljava/io/EOFException;
    .restart local v16    # "sig":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    :cond_82
    const/4 v15, 0x4

    .line 251
    .local v15, "off":I
    new-instance v21, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    const/16 v22, 0x0

    invoke-direct/range {v21 .. v22}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;-><init>(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$1;)V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    .line 253
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH_BUF:[B

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-static {v0, v15}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue([BI)I

    move-result v20

    .line 254
    .local v20, "versionMadeBy":I
    add-int/lit8 v15, v15, 0x2

    .line 255
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v21, v0

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static/range {v21 .. v21}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v21

    shr-int/lit8 v22, v20, 0x8

    and-int/lit8 v22, v22, 0xf

    invoke-virtual/range {v21 .. v22}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setPlatform(I)V

    .line 257
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH_BUF:[B

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-static {v0, v15}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->parse([BI)Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    move-result-object v13

    .line 258
    .local v13, "gpFlag":Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;
    invoke-virtual {v13}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->usesUTF8ForNames()Z

    move-result v14

    .line 259
    .local v14, "hasUTF8Flag":Z
    if-eqz v14, :cond_252

    sget-object v7, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->UTF8_ZIP_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    .line 260
    .local v7, "entryEncoding":Lorg/apache/commons/compress/archivers/zip/ZipEncoding;
    :goto_c3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v21, v0

    invoke-virtual {v13}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->usesDataDescriptor()Z

    move-result v22

    # setter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->hasDataDescriptor:Z
    invoke-static/range {v21 .. v22}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$202(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;Z)Z

    .line 261
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v21, v0

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static/range {v21 .. v21}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v13}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setGeneralPurposeBit(Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;)V

    .line 263
    add-int/lit8 v15, v15, 0x2

    .line 265
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v21, v0

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static/range {v21 .. v21}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH_BUF:[B

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-static {v0, v15}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue([BI)I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setMethod(I)V

    .line 266
    add-int/lit8 v15, v15, 0x2

    .line 268
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH_BUF:[B

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-static {v0, v15}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue([BI)J

    move-result-wide v21

    invoke-static/range {v21 .. v22}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->dosToJavaTime(J)J

    move-result-wide v18

    .line 269
    .local v18, "time":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v21, v0

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static/range {v21 .. v21}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v21

    move-object/from16 v0, v21

    move-wide/from16 v1, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setTime(J)V

    .line 270
    add-int/lit8 v15, v15, 0x4

    .line 272
    const/16 v17, 0x0

    .local v17, "size":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    const/4 v5, 0x0

    .line 273
    .local v5, "cSize":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v21, v0

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->hasDataDescriptor:Z
    invoke-static/range {v21 .. v21}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Z

    move-result v21

    if-nez v21, :cond_258

    .line 274
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v21, v0

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static/range {v21 .. v21}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH_BUF:[B

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-static {v0, v15}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue([BI)J

    move-result-wide v22

    invoke-virtual/range {v21 .. v23}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setCrc(J)V

    .line 275
    add-int/lit8 v15, v15, 0x4

    .line 277
    new-instance v5, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .end local v5    # "cSize":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH_BUF:[B

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-direct {v5, v0, v15}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>([BI)V

    .line 278
    .restart local v5    # "cSize":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    add-int/lit8 v15, v15, 0x4

    .line 280
    new-instance v17, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .end local v17    # "size":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH_BUF:[B

    move-object/from16 v21, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v15}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>([BI)V

    .line 281
    .restart local v17    # "size":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    add-int/lit8 v15, v15, 0x4

    .line 286
    :goto_169
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH_BUF:[B

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-static {v0, v15}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue([BI)I

    move-result v11

    .line 288
    .local v11, "fileNameLen":I
    add-int/lit8 v15, v15, 0x2

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->LFH_BUF:[B

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-static {v0, v15}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue([BI)I

    move-result v9

    .line 291
    .local v9, "extraLen":I
    add-int/lit8 v15, v15, 0x2

    .line 293
    new-array v10, v11, [B

    .line 294
    .local v10, "fileName":[B
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readFully([B)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v21, v0

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static/range {v21 .. v21}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v21

    invoke-interface {v7, v10}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->decode([B)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v0, v1, v10}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setName(Ljava/lang/String;[B)V

    .line 297
    new-array v8, v9, [B

    .line 298
    .local v8, "extraData":[B
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readFully([B)V

    .line 299
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v21, v0

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static/range {v21 .. v21}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v8}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setExtra([B)V

    .line 301
    if-nez v14, :cond_1d4

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->useUnicodeExtraFields:Z

    move/from16 v21, v0

    if-eqz v21, :cond_1d4

    .line 302
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v21, v0

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static/range {v21 .. v21}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v21

    const/16 v22, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-static {v0, v10, v1}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->setNameAndCommentFromExtraFields(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;[B[B)V

    .line 305
    :cond_1d4
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->processZip64Extra(Lorg/apache/commons/compress/archivers/zip/ZipLong;Lorg/apache/commons/compress/archivers/zip/ZipLong;)V

    .line 307
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v21, v0

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static/range {v21 .. v21}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v21

    const-wide/16 v23, -0x1

    cmp-long v21, v21, v23

    if-eqz v21, :cond_238

    .line 308
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v21, v0

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static/range {v21 .. v21}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v21

    sget-object v22, Lorg/apache/commons/compress/archivers/zip/ZipMethod;->UNSHRINKING:Lorg/apache/commons/compress/archivers/zip/ZipMethod;

    invoke-virtual/range {v22 .. v22}, Lorg/apache/commons/compress/archivers/zip/ZipMethod;->getCode()I

    move-result v22

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_25c

    .line 309
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v21, v0

    new-instance v22, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;

    new-instance v23, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v25, v0

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static/range {v25 .. v25}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v25

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move-object/from16 v2, v24

    move-wide/from16 v3, v25

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;-><init>(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;Ljava/io/InputStream;J)V

    invoke-direct/range {v22 .. v23}, Lorg/apache/commons/compress/archivers/zip/UnshrinkingInputStream;-><init>(Ljava/io/InputStream;)V

    # setter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->in:Ljava/io/InputStream;
    invoke-static/range {v21 .. v22}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$302(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;Ljava/io/InputStream;)Ljava/io/InputStream;

    .line 318
    :cond_238
    :goto_238
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->entriesRead:I

    move/from16 v21, v0

    add-int/lit8 v21, v21, 0x1

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->entriesRead:I

    .line 319
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v21, v0

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static/range {v21 .. v21}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v21

    goto/16 :goto_13

    .line 259
    .end local v5    # "cSize":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    .end local v7    # "entryEncoding":Lorg/apache/commons/compress/archivers/zip/ZipEncoding;
    .end local v8    # "extraData":[B
    .end local v9    # "extraLen":I
    .end local v10    # "fileName":[B
    .end local v11    # "fileNameLen":I
    .end local v17    # "size":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    .end local v18    # "time":J
    :cond_252
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->zipEncoding:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    goto/16 :goto_c3

    .line 283
    .restart local v5    # "cSize":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    .restart local v7    # "entryEncoding":Lorg/apache/commons/compress/archivers/zip/ZipEncoding;
    .restart local v17    # "size":Lorg/apache/commons/compress/archivers/zip/ZipLong;
    .restart local v18    # "time":J
    :cond_258
    add-int/lit8 v15, v15, 0xc

    goto/16 :goto_169

    .line 310
    .restart local v8    # "extraData":[B
    .restart local v9    # "extraLen":I
    .restart local v10    # "fileName":[B
    .restart local v11    # "fileNameLen":I
    :cond_25c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v21, v0

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static/range {v21 .. v21}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v21

    sget-object v22, Lorg/apache/commons/compress/archivers/zip/ZipMethod;->IMPLODING:Lorg/apache/commons/compress/archivers/zip/ZipMethod;

    invoke-virtual/range {v22 .. v22}, Lorg/apache/commons/compress/archivers/zip/ZipMethod;->getCode()I

    move-result v22

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_238

    .line 311
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v21, v0

    new-instance v22, Lorg/apache/commons/compress/archivers/zip/ExplodingInputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v23, v0

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static/range {v23 .. v23}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getGeneralPurposeBit()Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->getSlidingDictionarySize()I

    move-result v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v24, v0

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static/range {v24 .. v24}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getGeneralPurposeBit()Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->getNumberOfShannonFanoTrees()I

    move-result v24

    new-instance v25, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->in:Ljava/io/InputStream;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-object/from16 v27, v0

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static/range {v27 .. v27}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v27

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    move-object/from16 v2, v26

    move-wide/from16 v3, v27

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;-><init>(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;Ljava/io/InputStream;J)V

    invoke-direct/range {v22 .. v25}, Lorg/apache/commons/compress/archivers/zip/ExplodingInputStream;-><init>(IILjava/io/InputStream;)V

    # setter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->in:Ljava/io/InputStream;
    invoke-static/range {v21 .. v22}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$302(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;Ljava/io/InputStream;)Ljava/io/InputStream;

    goto/16 :goto_238
.end method

.method public read([BII)I
    .registers 8
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 391
    iget-boolean v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->closed:Z

    if-eqz v1, :cond_c

    .line 392
    new-instance v1, Ljava/io/IOException;

    const-string v2, "The stream is closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 395
    :cond_c
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    if-nez v1, :cond_12

    .line 396
    const/4 v0, -0x1

    .line 427
    :cond_11
    :goto_11
    return v0

    .line 400
    :cond_12
    array-length v1, p1

    if-gt p2, v1, :cond_1d

    if-ltz p3, :cond_1d

    if-ltz p2, :cond_1d

    array-length v1, p1

    sub-int/2addr v1, p2

    if-ge v1, p3, :cond_23

    .line 401
    :cond_1d
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v1

    .line 404
    :cond_23
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->checkRequestedFeatures(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V

    .line 405
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->supportsDataDescriptorFor(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v1

    if-nez v1, :cond_46

    .line 406
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;

    sget-object v2, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;->DATA_DESCRIPTOR:Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;-><init>(Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V

    throw v1

    .line 411
    :cond_46
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v1

    if-nez v1, :cond_62

    .line 412
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readStored([BII)I

    move-result v0

    .line 423
    .local v0, "read":I
    :goto_56
    if-ltz v0, :cond_11

    .line 424
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->crc:Ljava/util/zip/CRC32;
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$500(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Ljava/util/zip/CRC32;

    move-result-object v1

    invoke-virtual {v1, p1, p2, v0}, Ljava/util/zip/CRC32;->update([BII)V

    goto :goto_11

    .line 413
    .end local v0    # "read":I
    :cond_62
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v1

    const/16 v2, 0x8

    if-ne v1, v2, :cond_75

    .line 414
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->readDeflated([BII)I

    move-result v0

    .restart local v0    # "read":I
    goto :goto_56

    .line 415
    .end local v0    # "read":I
    :cond_75
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v1

    sget-object v2, Lorg/apache/commons/compress/archivers/zip/ZipMethod;->UNSHRINKING:Lorg/apache/commons/compress/archivers/zip/ZipMethod;

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipMethod;->getCode()I

    move-result v2

    if-eq v1, v2, :cond_99

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v1

    sget-object v2, Lorg/apache/commons/compress/archivers/zip/ZipMethod;->IMPLODING:Lorg/apache/commons/compress/archivers/zip/ZipMethod;

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipMethod;->getCode()I

    move-result v2

    if-ne v1, v2, :cond_a4

    .line 417
    :cond_99
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->in:Ljava/io/InputStream;
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Ljava/io/InputStream;

    move-result-object v1

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .restart local v0    # "read":I
    goto :goto_56

    .line 419
    .end local v0    # "read":I
    :cond_a4
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v2

    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/ZipMethod;->getMethodByCode(I)Lorg/apache/commons/compress/archivers/zip/ZipMethod;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;-><init>(Lorg/apache/commons/compress/archivers/zip/ZipMethod;Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V

    throw v1
.end method

.method public skip(J)J
    .registers 12
    .param p1, "value"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 540
    const-wide/16 v5, 0x0

    cmp-long v5, p1, v5

    if-ltz v5, :cond_2a

    .line 541
    const-wide/16 v2, 0x0

    .line 542
    .local v2, "skipped":J
    :goto_8
    cmp-long v5, v2, p1

    if-gez v5, :cond_21

    .line 543
    sub-long v0, p1, v2

    .line 544
    .local v0, "rem":J
    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->SKIP_BUF:[B

    const/4 v6, 0x0

    iget-object v7, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->SKIP_BUF:[B

    array-length v7, v7

    int-to-long v7, v7

    cmp-long v7, v7, v0

    if-lez v7, :cond_22

    .end local v0    # "rem":J
    :goto_19
    long-to-int v7, v0

    invoke-virtual {p0, v5, v6, v7}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->read([BII)I

    move-result v4

    .line 545
    .local v4, "x":I
    const/4 v5, -0x1

    if-ne v4, v5, :cond_27

    .line 550
    .end local v4    # "x":I
    :cond_21
    return-wide v2

    .line 544
    .restart local v0    # "rem":J
    :cond_22
    iget-object v7, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->SKIP_BUF:[B

    array-length v7, v7

    int-to-long v0, v7

    goto :goto_19

    .line 548
    .end local v0    # "rem":J
    .restart local v4    # "x":I
    :cond_27
    int-to-long v5, v4

    add-long/2addr v2, v5

    .line 549
    goto :goto_8

    .line 552
    .end local v2    # "skipped":J
    .end local v4    # "x":I
    :cond_2a
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-direct {v5}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v5
.end method
