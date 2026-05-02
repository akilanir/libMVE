.class public Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;
.super Ljava/lang/Object;
.source "SevenZOutputFile.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile$OutputStreamWrapper;
    }
.end annotation


# instance fields
.field private additionalCountingStreams:[Lorg/apache/commons/compress/utils/CountingOutputStream;

.field private final additionalSizes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;",
            "[J>;"
        }
    .end annotation
.end field

.field private final compressedCrc32:Ljava/util/zip/CRC32;

.field private contentMethods:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;",
            ">;"
        }
    .end annotation
.end field

.field private final crc32:Ljava/util/zip/CRC32;

.field private currentOutputStream:Lorg/apache/commons/compress/utils/CountingOutputStream;

.field private final file:Ljava/io/RandomAccessFile;

.field private fileBytesWritten:J

.field private final files:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;",
            ">;"
        }
    .end annotation
.end field

.field private finished:Z

.field private numNonEmptyStreams:I


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 5
    .param p1, "filename"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    .line 48
    iput v2, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->numNonEmptyStreams:I

    .line 49
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->crc32:Ljava/util/zip/CRC32;

    .line 50
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->compressedCrc32:Ljava/util/zip/CRC32;

    .line 51
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->fileBytesWritten:J

    .line 52
    iput-boolean v2, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->finished:Z

    .line 55
    new-instance v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;

    sget-object v1, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->LZMA2:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;-><init>(Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;)V

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->contentMethods:Ljava/lang/Iterable;

    .line 57
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->additionalSizes:Ljava/util/Map;

    .line 66
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v1, "rw"

    invoke-direct {v0, p1, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->file:Ljava/io/RandomAccessFile;

    .line 67
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->file:Ljava/io/RandomAccessFile;

    const-wide/16 v1, 0x20

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 68
    return-void
.end method

.method static synthetic access$100(Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;)Ljava/util/zip/CRC32;
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;

    .prologue
    .line 45
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->crc32:Ljava/util/zip/CRC32;

    return-object v0
.end method

.method static synthetic access$200(Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;)Ljava/io/RandomAccessFile;
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;

    .prologue
    .line 45
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->file:Ljava/io/RandomAccessFile;

    return-object v0
.end method

.method static synthetic access$300(Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;)Ljava/util/zip/CRC32;
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;

    .prologue
    .line 45
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->compressedCrc32:Ljava/util/zip/CRC32;

    return-object v0
.end method

.method static synthetic access$408(Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;)J
    .registers 5
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;

    .prologue
    .line 45
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->fileBytesWritten:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->fileBytesWritten:J

    return-wide v0
.end method

.method static synthetic access$414(Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;J)J
    .registers 5
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;
    .param p1, "x1"    # J

    .prologue
    .line 45
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->fileBytesWritten:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->fileBytesWritten:J

    return-wide v0
.end method

.method private getContentMethods(Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;)Ljava/lang/Iterable;
    .registers 3
    .param p1, "entry"    # Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;",
            ")",
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;",
            ">;"
        }
    .end annotation

    .prologue
    .line 319
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getContentMethods()Ljava/lang/Iterable;

    move-result-object v0

    .line 320
    .local v0, "ms":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;>;"
    if-nez v0, :cond_8

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->contentMethods:Ljava/lang/Iterable;

    .end local v0    # "ms":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;>;"
    :cond_8
    return-object v0
.end method

.method private getCurrentOutputStream()Ljava/io/OutputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 270
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->currentOutputStream:Lorg/apache/commons/compress/utils/CountingOutputStream;

    if-nez v0, :cond_a

    .line 271
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->setupFileOutputStream()Lorg/apache/commons/compress/utils/CountingOutputStream;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->currentOutputStream:Lorg/apache/commons/compress/utils/CountingOutputStream;

    .line 273
    :cond_a
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->currentOutputStream:Lorg/apache/commons/compress/utils/CountingOutputStream;

    return-object v0
.end method

.method private static reverse(Ljava/lang/Iterable;)Ljava/lang/Iterable;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<TT;>;)",
            "Ljava/lang/Iterable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 732
    .local p0, "i":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TT;>;"
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 733
    .local v1, "l":Ljava/util/LinkedList;, "Ljava/util/LinkedList<TT;>;"
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_17

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 734
    .local v2, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    goto :goto_9

    .line 736
    .end local v2    # "t":Ljava/lang/Object;, "TT;"
    :cond_17
    return-object v1
.end method

.method private setupFileOutputStream()Lorg/apache/commons/compress/utils/CountingOutputStream;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 277
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_10

    .line 278
    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v7, "No current 7z entry"

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 281
    :cond_10
    new-instance v5, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile$OutputStreamWrapper;

    const/4 v6, 0x0

    invoke-direct {v5, p0, v6}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile$OutputStreamWrapper;-><init>(Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile$1;)V

    .line 282
    .local v5, "out":Ljava/io/OutputStream;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 283
    .local v4, "moreStreams":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/commons/compress/utils/CountingOutputStream;>;"
    const/4 v1, 0x1

    .line 284
    .local v1, "first":Z
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    iget-object v7, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    invoke-direct {p0, v6}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->getContentMethods(Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;)Ljava/lang/Iterable;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_34
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_59

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;

    .line 285
    .local v3, "m":Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;
    if-nez v1, :cond_4b

    .line 286
    new-instance v0, Lorg/apache/commons/compress/utils/CountingOutputStream;

    invoke-direct {v0, v5}, Lorg/apache/commons/compress/utils/CountingOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 287
    .local v0, "cos":Lorg/apache/commons/compress/utils/CountingOutputStream;
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 288
    move-object v5, v0

    .line 290
    .end local v0    # "cos":Lorg/apache/commons/compress/utils/CountingOutputStream;
    :cond_4b
    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;->getMethod()Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    move-result-object v6

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;->getOptions()Ljava/lang/Object;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lorg/apache/commons/compress/archivers/sevenz/Coders;->addEncoder(Ljava/io/OutputStream;Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;Ljava/lang/Object;)Ljava/io/OutputStream;

    move-result-object v5

    .line 291
    const/4 v1, 0x0

    .line 292
    goto :goto_34

    .line 293
    .end local v3    # "m":Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;
    :cond_59
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_6d

    .line 294
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    new-array v6, v6, [Lorg/apache/commons/compress/utils/CountingOutputStream;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Lorg/apache/commons/compress/utils/CountingOutputStream;

    iput-object v6, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->additionalCountingStreams:[Lorg/apache/commons/compress/utils/CountingOutputStream;

    .line 296
    :cond_6d
    new-instance v6, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile$1;

    invoke-direct {v6, p0, v5}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile$1;-><init>(Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;Ljava/io/OutputStream;)V

    return-object v6
.end method

.method private writeBits(Ljava/io/DataOutput;Ljava/util/BitSet;I)V
    .registers 8
    .param p1, "header"    # Ljava/io/DataOutput;
    .param p2, "bits"    # Ljava/util/BitSet;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 716
    const/4 v0, 0x0

    .line 717
    .local v0, "cache":I
    const/4 v2, 0x7

    .line 718
    .local v2, "shift":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    if-ge v1, p3, :cond_1c

    .line 719
    invoke-virtual {p2, v1}, Ljava/util/BitSet;->get(I)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/4 v3, 0x1

    :goto_c
    shl-int/2addr v3, v2

    or-int/2addr v0, v3

    .line 720
    add-int/lit8 v2, v2, -0x1

    if-gez v2, :cond_17

    .line 721
    invoke-interface {p1, v0}, Ljava/io/DataOutput;->write(I)V

    .line 722
    const/4 v2, 0x7

    .line 723
    const/4 v0, 0x0

    .line 718
    :cond_17
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 719
    :cond_1a
    const/4 v3, 0x0

    goto :goto_c

    .line 726
    :cond_1c
    const/4 v3, 0x7

    if-eq v2, v3, :cond_22

    .line 727
    invoke-interface {p1, v0}, Ljava/io/DataOutput;->write(I)V

    .line 729
    :cond_22
    return-void
.end method

.method private writeFileATimes(Ljava/io/DataOutput;)V
    .registers 12
    .param p1, "header"    # Ljava/io/DataOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 590
    const/4 v6, 0x0

    .line 591
    .local v6, "numAccessDates":I
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_8
    :goto_8
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1d

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .line 592
    .local v3, "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getHasAccessDate()Z

    move-result v8

    if-eqz v8, :cond_8

    .line 593
    add-int/lit8 v6, v6, 0x1

    goto :goto_8

    .line 596
    .end local v3    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    :cond_1d
    if-lez v6, :cond_a7

    .line 597
    const/16 v8, 0x13

    invoke-interface {p1, v8}, Ljava/io/DataOutput;->write(I)V

    .line 599
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 600
    .local v1, "baos":Ljava/io/ByteArrayOutputStream;
    new-instance v7, Ljava/io/DataOutputStream;

    invoke-direct {v7, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 601
    .local v7, "out":Ljava/io/DataOutputStream;
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-eq v6, v8, :cond_93

    .line 602
    invoke-virtual {v7, v9}, Ljava/io/DataOutputStream;->write(I)V

    .line 603
    new-instance v0, Ljava/util/BitSet;

    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-direct {v0, v8}, Ljava/util/BitSet;-><init>(I)V

    .line 604
    .local v0, "aTimes":Ljava/util/BitSet;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_45
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v4, v8, :cond_5f

    .line 605
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    invoke-virtual {v8}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getHasAccessDate()Z

    move-result v8

    invoke-virtual {v0, v4, v8}, Ljava/util/BitSet;->set(IZ)V

    .line 604
    add-int/lit8 v4, v4, 0x1

    goto :goto_45

    .line 607
    :cond_5f
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-direct {p0, v7, v0, v8}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeBits(Ljava/io/DataOutput;Ljava/util/BitSet;I)V

    .line 611
    .end local v0    # "aTimes":Ljava/util/BitSet;
    .end local v4    # "i":I
    :goto_68
    invoke-virtual {v7, v9}, Ljava/io/DataOutputStream;->write(I)V

    .line 612
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_71
    :goto_71
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_98

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .line 613
    .restart local v3    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getHasAccessDate()Z

    move-result v8

    if-eqz v8, :cond_71

    .line 614
    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getAccessDate()Ljava/util/Date;

    move-result-object v8

    invoke-static {v8}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->javaTimeToNtfsTime(Ljava/util/Date;)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->reverseBytes(J)J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/io/DataOutputStream;->writeLong(J)V

    goto :goto_71

    .line 609
    .end local v3    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    :cond_93
    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Ljava/io/DataOutputStream;->write(I)V

    goto :goto_68

    .line 618
    :cond_98
    invoke-virtual {v7}, Ljava/io/DataOutputStream;->flush()V

    .line 619
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    .line 620
    .local v2, "contents":[B
    array-length v8, v2

    int-to-long v8, v8

    invoke-direct {p0, p1, v8, v9}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeUint64(Ljava/io/DataOutput;J)V

    .line 621
    invoke-interface {p1, v2}, Ljava/io/DataOutput;->write([B)V

    .line 623
    .end local v1    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "contents":[B
    .end local v7    # "out":Ljava/io/DataOutputStream;
    :cond_a7
    return-void
.end method

.method private writeFileAntiItems(Ljava/io/DataOutput;)V
    .registers 14
    .param p1, "header"    # Ljava/io/DataOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 515
    const/4 v6, 0x0

    .line 516
    .local v6, "hasAntiItems":Z
    new-instance v2, Ljava/util/BitSet;

    const/4 v10, 0x0

    invoke-direct {v2, v10}, Ljava/util/BitSet;-><init>(I)V

    .line 517
    .local v2, "antiItems":Ljava/util/BitSet;
    const/4 v0, 0x0

    .line 518
    .local v0, "antiItemCounter":I
    iget-object v10, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :cond_e
    :goto_e
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_2c

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .line 519
    .local v5, "file1":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasStream()Z

    move-result v10

    if-nez v10, :cond_e

    .line 520
    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->isAntiItem()Z

    move-result v8

    .line 521
    .local v8, "isAnti":Z
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "antiItemCounter":I
    .local v1, "antiItemCounter":I
    invoke-virtual {v2, v0, v8}, Ljava/util/BitSet;->set(IZ)V

    .line 522
    or-int/2addr v6, v8

    move v0, v1

    .end local v1    # "antiItemCounter":I
    .restart local v0    # "antiItemCounter":I
    goto :goto_e

    .line 525
    .end local v5    # "file1":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    .end local v8    # "isAnti":Z
    :cond_2c
    if-eqz v6, :cond_4f

    .line 526
    const/16 v10, 0x10

    invoke-interface {p1, v10}, Ljava/io/DataOutput;->write(I)V

    .line 527
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 528
    .local v3, "baos":Ljava/io/ByteArrayOutputStream;
    new-instance v9, Ljava/io/DataOutputStream;

    invoke-direct {v9, v3}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 529
    .local v9, "out":Ljava/io/DataOutputStream;
    invoke-direct {p0, v9, v2, v0}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeBits(Ljava/io/DataOutput;Ljava/util/BitSet;I)V

    .line 530
    invoke-virtual {v9}, Ljava/io/DataOutputStream;->flush()V

    .line 531
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    .line 532
    .local v4, "contents":[B
    array-length v10, v4

    int-to-long v10, v10

    invoke-direct {p0, p1, v10, v11}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeUint64(Ljava/io/DataOutput;J)V

    .line 533
    invoke-interface {p1, v4}, Ljava/io/DataOutput;->write([B)V

    .line 535
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v4    # "contents":[B
    .end local v9    # "out":Ljava/io/DataOutputStream;
    :cond_4f
    return-void
.end method

.method private writeFileCTimes(Ljava/io/DataOutput;)V
    .registers 12
    .param p1, "header"    # Ljava/io/DataOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 554
    const/4 v6, 0x0

    .line 555
    .local v6, "numCreationDates":I
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_8
    :goto_8
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1d

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .line 556
    .local v3, "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getHasCreationDate()Z

    move-result v8

    if-eqz v8, :cond_8

    .line 557
    add-int/lit8 v6, v6, 0x1

    goto :goto_8

    .line 560
    .end local v3    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    :cond_1d
    if-lez v6, :cond_a7

    .line 561
    const/16 v8, 0x12

    invoke-interface {p1, v8}, Ljava/io/DataOutput;->write(I)V

    .line 563
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 564
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    new-instance v7, Ljava/io/DataOutputStream;

    invoke-direct {v7, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 565
    .local v7, "out":Ljava/io/DataOutputStream;
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-eq v6, v8, :cond_93

    .line 566
    invoke-virtual {v7, v9}, Ljava/io/DataOutputStream;->write(I)V

    .line 567
    new-instance v1, Ljava/util/BitSet;

    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-direct {v1, v8}, Ljava/util/BitSet;-><init>(I)V

    .line 568
    .local v1, "cTimes":Ljava/util/BitSet;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_45
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v4, v8, :cond_5f

    .line 569
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    invoke-virtual {v8}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getHasCreationDate()Z

    move-result v8

    invoke-virtual {v1, v4, v8}, Ljava/util/BitSet;->set(IZ)V

    .line 568
    add-int/lit8 v4, v4, 0x1

    goto :goto_45

    .line 571
    :cond_5f
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-direct {p0, v7, v1, v8}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeBits(Ljava/io/DataOutput;Ljava/util/BitSet;I)V

    .line 575
    .end local v1    # "cTimes":Ljava/util/BitSet;
    .end local v4    # "i":I
    :goto_68
    invoke-virtual {v7, v9}, Ljava/io/DataOutputStream;->write(I)V

    .line 576
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_71
    :goto_71
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_98

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .line 577
    .restart local v3    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getHasCreationDate()Z

    move-result v8

    if-eqz v8, :cond_71

    .line 578
    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getCreationDate()Ljava/util/Date;

    move-result-object v8

    invoke-static {v8}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->javaTimeToNtfsTime(Ljava/util/Date;)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->reverseBytes(J)J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/io/DataOutputStream;->writeLong(J)V

    goto :goto_71

    .line 573
    .end local v3    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    :cond_93
    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Ljava/io/DataOutputStream;->write(I)V

    goto :goto_68

    .line 582
    :cond_98
    invoke-virtual {v7}, Ljava/io/DataOutputStream;->flush()V

    .line 583
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    .line 584
    .local v2, "contents":[B
    array-length v8, v2

    int-to-long v8, v8

    invoke-direct {p0, p1, v8, v9}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeUint64(Ljava/io/DataOutput;J)V

    .line 585
    invoke-interface {p1, v2}, Ljava/io/DataOutput;->write([B)V

    .line 587
    .end local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "contents":[B
    .end local v7    # "out":Ljava/io/DataOutputStream;
    :cond_a7
    return-void
.end method

.method private writeFileEmptyFiles(Ljava/io/DataOutput;)V
    .registers 15
    .param p1, "header"    # Ljava/io/DataOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    const/4 v12, 0x0

    .line 492
    const/4 v6, 0x0

    .line 493
    .local v6, "hasEmptyFiles":Z
    const/4 v3, 0x0

    .line 494
    .local v3, "emptyStreamCounter":I
    new-instance v2, Ljava/util/BitSet;

    invoke-direct {v2, v12}, Ljava/util/BitSet;-><init>(I)V

    .line 495
    .local v2, "emptyFiles":Ljava/util/BitSet;
    iget-object v10, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :cond_f
    :goto_f
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_37

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .line 496
    .local v5, "file1":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasStream()Z

    move-result v10

    if-nez v10, :cond_f

    .line 497
    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->isDirectory()Z

    move-result v8

    .line 498
    .local v8, "isDir":Z
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "emptyStreamCounter":I
    .local v4, "emptyStreamCounter":I
    if-nez v8, :cond_33

    move v10, v11

    :goto_2a
    invoke-virtual {v2, v3, v10}, Ljava/util/BitSet;->set(IZ)V

    .line 499
    if-nez v8, :cond_35

    move v10, v11

    :goto_30
    or-int/2addr v6, v10

    move v3, v4

    .end local v4    # "emptyStreamCounter":I
    .restart local v3    # "emptyStreamCounter":I
    goto :goto_f

    .end local v3    # "emptyStreamCounter":I
    .restart local v4    # "emptyStreamCounter":I
    :cond_33
    move v10, v12

    .line 498
    goto :goto_2a

    :cond_35
    move v10, v12

    .line 499
    goto :goto_30

    .line 502
    .end local v4    # "emptyStreamCounter":I
    .end local v5    # "file1":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    .end local v8    # "isDir":Z
    .restart local v3    # "emptyStreamCounter":I
    :cond_37
    if-eqz v6, :cond_5a

    .line 503
    const/16 v10, 0xf

    invoke-interface {p1, v10}, Ljava/io/DataOutput;->write(I)V

    .line 504
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 505
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    new-instance v9, Ljava/io/DataOutputStream;

    invoke-direct {v9, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 506
    .local v9, "out":Ljava/io/DataOutputStream;
    invoke-direct {p0, v9, v2, v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeBits(Ljava/io/DataOutput;Ljava/util/BitSet;I)V

    .line 507
    invoke-virtual {v9}, Ljava/io/DataOutputStream;->flush()V

    .line 508
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 509
    .local v1, "contents":[B
    array-length v10, v1

    int-to-long v10, v10

    invoke-direct {p0, p1, v10, v11}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeUint64(Ljava/io/DataOutput;J)V

    .line 510
    invoke-interface {p1, v1}, Ljava/io/DataOutput;->write([B)V

    .line 512
    .end local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "contents":[B
    .end local v9    # "out":Ljava/io/DataOutputStream;
    :cond_5a
    return-void
.end method

.method private writeFileEmptyStreams(Ljava/io/DataOutput;)V
    .registers 12
    .param p1, "header"    # Ljava/io/DataOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 468
    const/4 v4, 0x0

    .line 469
    .local v4, "hasEmptyStreams":Z
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_7
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1a

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .line 470
    .local v3, "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasStream()Z

    move-result v8

    if-nez v8, :cond_7

    .line 471
    const/4 v4, 0x1

    .line 475
    .end local v3    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    :cond_1a
    if-eqz v4, :cond_6e

    .line 476
    const/16 v8, 0xe

    invoke-interface {p1, v8}, Ljava/io/DataOutput;->write(I)V

    .line 477
    new-instance v2, Ljava/util/BitSet;

    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-direct {v2, v8}, Ljava/util/BitSet;-><init>(I)V

    .line 478
    .local v2, "emptyStreams":Ljava/util/BitSet;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2d
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v5, v8, :cond_4c

    .line 479
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    invoke-virtual {v8}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasStream()Z

    move-result v8

    if-nez v8, :cond_4a

    const/4 v8, 0x1

    :goto_44
    invoke-virtual {v2, v5, v8}, Ljava/util/BitSet;->set(IZ)V

    .line 478
    add-int/lit8 v5, v5, 0x1

    goto :goto_2d

    .line 479
    :cond_4a
    const/4 v8, 0x0

    goto :goto_44

    .line 481
    :cond_4c
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 482
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    new-instance v7, Ljava/io/DataOutputStream;

    invoke-direct {v7, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 483
    .local v7, "out":Ljava/io/DataOutputStream;
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-direct {p0, v7, v2, v8}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeBits(Ljava/io/DataOutput;Ljava/util/BitSet;I)V

    .line 484
    invoke-virtual {v7}, Ljava/io/DataOutputStream;->flush()V

    .line 485
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 486
    .local v1, "contents":[B
    array-length v8, v1

    int-to-long v8, v8

    invoke-direct {p0, p1, v8, v9}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeUint64(Ljava/io/DataOutput;J)V

    .line 487
    invoke-interface {p1, v1}, Ljava/io/DataOutput;->write([B)V

    .line 489
    .end local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "contents":[B
    .end local v2    # "emptyStreams":Ljava/util/BitSet;
    .end local v5    # "i":I
    .end local v7    # "out":Ljava/io/DataOutputStream;
    :cond_6e
    return-void
.end method

.method private writeFileMTimes(Ljava/io/DataOutput;)V
    .registers 12
    .param p1, "header"    # Ljava/io/DataOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 626
    const/4 v6, 0x0

    .line 627
    .local v6, "numLastModifiedDates":I
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_8
    :goto_8
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1d

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .line 628
    .local v2, "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getHasLastModifiedDate()Z

    move-result v8

    if-eqz v8, :cond_8

    .line 629
    add-int/lit8 v6, v6, 0x1

    goto :goto_8

    .line 632
    .end local v2    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    :cond_1d
    if-lez v6, :cond_a7

    .line 633
    const/16 v8, 0x14

    invoke-interface {p1, v8}, Ljava/io/DataOutput;->write(I)V

    .line 635
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 636
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    new-instance v7, Ljava/io/DataOutputStream;

    invoke-direct {v7, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 637
    .local v7, "out":Ljava/io/DataOutputStream;
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-eq v6, v8, :cond_93

    .line 638
    invoke-virtual {v7, v9}, Ljava/io/DataOutputStream;->write(I)V

    .line 639
    new-instance v5, Ljava/util/BitSet;

    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-direct {v5, v8}, Ljava/util/BitSet;-><init>(I)V

    .line 640
    .local v5, "mTimes":Ljava/util/BitSet;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_45
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v3, v8, :cond_5f

    .line 641
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    invoke-virtual {v8}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getHasLastModifiedDate()Z

    move-result v8

    invoke-virtual {v5, v3, v8}, Ljava/util/BitSet;->set(IZ)V

    .line 640
    add-int/lit8 v3, v3, 0x1

    goto :goto_45

    .line 643
    :cond_5f
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-direct {p0, v7, v5, v8}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeBits(Ljava/io/DataOutput;Ljava/util/BitSet;I)V

    .line 647
    .end local v3    # "i":I
    .end local v5    # "mTimes":Ljava/util/BitSet;
    :goto_68
    invoke-virtual {v7, v9}, Ljava/io/DataOutputStream;->write(I)V

    .line 648
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_71
    :goto_71
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_98

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .line 649
    .restart local v2    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getHasLastModifiedDate()Z

    move-result v8

    if-eqz v8, :cond_71

    .line 650
    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getLastModifiedDate()Ljava/util/Date;

    move-result-object v8

    invoke-static {v8}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->javaTimeToNtfsTime(Ljava/util/Date;)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->reverseBytes(J)J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/io/DataOutputStream;->writeLong(J)V

    goto :goto_71

    .line 645
    .end local v2    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    :cond_93
    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Ljava/io/DataOutputStream;->write(I)V

    goto :goto_68

    .line 654
    :cond_98
    invoke-virtual {v7}, Ljava/io/DataOutputStream;->flush()V

    .line 655
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 656
    .local v1, "contents":[B
    array-length v8, v1

    int-to-long v8, v8

    invoke-direct {p0, p1, v8, v9}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeUint64(Ljava/io/DataOutput;J)V

    .line 657
    invoke-interface {p1, v1}, Ljava/io/DataOutput;->write([B)V

    .line 659
    .end local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "contents":[B
    .end local v7    # "out":Ljava/io/DataOutputStream;
    :cond_a7
    return-void
.end method

.method private writeFileNames(Ljava/io/DataOutput;)V
    .registers 10
    .param p1, "header"    # Ljava/io/DataOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 538
    const/16 v5, 0x11

    invoke-interface {p1, v5}, Ljava/io/DataOutput;->write(I)V

    .line 540
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 541
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    new-instance v4, Ljava/io/DataOutputStream;

    invoke-direct {v4, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 542
    .local v4, "out":Ljava/io/DataOutputStream;
    invoke-virtual {v4, v7}, Ljava/io/DataOutputStream;->write(I)V

    .line 543
    iget-object v5, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_19
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_36

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .line 544
    .local v2, "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-16LE"

    invoke-virtual {v5, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/DataOutputStream;->write([B)V

    .line 545
    invoke-virtual {v4, v7}, Ljava/io/DataOutputStream;->writeShort(I)V

    goto :goto_19

    .line 547
    .end local v2    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    :cond_36
    invoke-virtual {v4}, Ljava/io/DataOutputStream;->flush()V

    .line 548
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 549
    .local v1, "contents":[B
    array-length v5, v1

    int-to-long v5, v5

    invoke-direct {p0, p1, v5, v6}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeUint64(Ljava/io/DataOutput;J)V

    .line 550
    invoke-interface {p1, v1}, Ljava/io/DataOutput;->write([B)V

    .line 551
    return-void
.end method

.method private writeFileWindowsAttributes(Ljava/io/DataOutput;)V
    .registers 12
    .param p1, "header"    # Ljava/io/DataOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 662
    const/4 v6, 0x0

    .line 663
    .local v6, "numWindowsAttributes":I
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_8
    :goto_8
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1d

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .line 664
    .local v3, "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getHasWindowsAttributes()Z

    move-result v8

    if-eqz v8, :cond_8

    .line 665
    add-int/lit8 v6, v6, 0x1

    goto :goto_8

    .line 668
    .end local v3    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    :cond_1d
    if-lez v6, :cond_a3

    .line 669
    const/16 v8, 0x15

    invoke-interface {p1, v8}, Ljava/io/DataOutput;->write(I)V

    .line 671
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 672
    .local v1, "baos":Ljava/io/ByteArrayOutputStream;
    new-instance v7, Ljava/io/DataOutputStream;

    invoke-direct {v7, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 673
    .local v7, "out":Ljava/io/DataOutputStream;
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-eq v6, v8, :cond_8f

    .line 674
    invoke-virtual {v7, v9}, Ljava/io/DataOutputStream;->write(I)V

    .line 675
    new-instance v0, Ljava/util/BitSet;

    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-direct {v0, v8}, Ljava/util/BitSet;-><init>(I)V

    .line 676
    .local v0, "attributes":Ljava/util/BitSet;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_45
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v4, v8, :cond_5f

    .line 677
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    invoke-virtual {v8}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getHasWindowsAttributes()Z

    move-result v8

    invoke-virtual {v0, v4, v8}, Ljava/util/BitSet;->set(IZ)V

    .line 676
    add-int/lit8 v4, v4, 0x1

    goto :goto_45

    .line 679
    :cond_5f
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-direct {p0, v7, v0, v8}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeBits(Ljava/io/DataOutput;Ljava/util/BitSet;I)V

    .line 683
    .end local v0    # "attributes":Ljava/util/BitSet;
    .end local v4    # "i":I
    :goto_68
    invoke-virtual {v7, v9}, Ljava/io/DataOutputStream;->write(I)V

    .line 684
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_71
    :goto_71
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_94

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .line 685
    .restart local v3    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getHasWindowsAttributes()Z

    move-result v8

    if-eqz v8, :cond_71

    .line 686
    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getWindowsAttributes()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->reverseBytes(I)I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/io/DataOutputStream;->writeInt(I)V

    goto :goto_71

    .line 681
    .end local v3    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    :cond_8f
    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Ljava/io/DataOutputStream;->write(I)V

    goto :goto_68

    .line 689
    :cond_94
    invoke-virtual {v7}, Ljava/io/DataOutputStream;->flush()V

    .line 690
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    .line 691
    .local v2, "contents":[B
    array-length v8, v2

    int-to-long v8, v8

    invoke-direct {p0, p1, v8, v9}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeUint64(Ljava/io/DataOutput;J)V

    .line 692
    invoke-interface {p1, v2}, Ljava/io/DataOutput;->write([B)V

    .line 694
    .end local v1    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "contents":[B
    .end local v7    # "out":Ljava/io/DataOutputStream;
    :cond_a3
    return-void
.end method

.method private writeFilesInfo(Ljava/io/DataOutput;)V
    .registers 4
    .param p1, "header"    # Ljava/io/DataOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 452
    const/4 v0, 0x5

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->write(I)V

    .line 454
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    int-to-long v0, v0

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeUint64(Ljava/io/DataOutput;J)V

    .line 456
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeFileEmptyStreams(Ljava/io/DataOutput;)V

    .line 457
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeFileEmptyFiles(Ljava/io/DataOutput;)V

    .line 458
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeFileAntiItems(Ljava/io/DataOutput;)V

    .line 459
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeFileNames(Ljava/io/DataOutput;)V

    .line 460
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeFileCTimes(Ljava/io/DataOutput;)V

    .line 461
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeFileATimes(Ljava/io/DataOutput;)V

    .line 462
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeFileMTimes(Ljava/io/DataOutput;)V

    .line 463
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeFileWindowsAttributes(Ljava/io/DataOutput;)V

    .line 464
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->write(I)V

    .line 465
    return-void
.end method

.method private writeFolder(Ljava/io/DataOutput;Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;)V
    .registers 10
    .param p1, "header"    # Ljava/io/DataOutput;
    .param p2, "entry"    # Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 404
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 405
    .local v0, "bos":Ljava/io/ByteArrayOutputStream;
    const/4 v4, 0x0

    .line 406
    .local v4, "numCoders":I
    invoke-direct {p0, p2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->getContentMethods(Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;)Ljava/lang/Iterable;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_20

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;

    .line 407
    .local v3, "m":Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;
    add-int/lit8 v4, v4, 0x1

    .line 408
    invoke-direct {p0, v3, v0}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeSingleCodec(Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;Ljava/io/OutputStream;)V

    goto :goto_e

    .line 411
    .end local v3    # "m":Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;
    :cond_20
    int-to-long v5, v4

    invoke-direct {p0, p1, v5, v6}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeUint64(Ljava/io/DataOutput;J)V

    .line 412
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    invoke-interface {p1, v5}, Ljava/io/DataOutput;->write([B)V

    .line 413
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2c
    add-int/lit8 v5, v4, -0x1

    if-ge v1, v5, :cond_3d

    .line 414
    add-int/lit8 v5, v1, 0x1

    int-to-long v5, v5

    invoke-direct {p0, p1, v5, v6}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeUint64(Ljava/io/DataOutput;J)V

    .line 415
    int-to-long v5, v1

    invoke-direct {p0, p1, v5, v6}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeUint64(Ljava/io/DataOutput;J)V

    .line 413
    add-int/lit8 v1, v1, 0x1

    goto :goto_2c

    .line 417
    :cond_3d
    return-void
.end method

.method private writeHeader(Ljava/io/DataOutput;)V
    .registers 3
    .param p1, "header"    # Ljava/io/DataOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 324
    const/4 v0, 0x1

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->write(I)V

    .line 326
    const/4 v0, 0x4

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->write(I)V

    .line 327
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeStreamsInfo(Ljava/io/DataOutput;)V

    .line 328
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeFilesInfo(Ljava/io/DataOutput;)V

    .line 329
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->write(I)V

    .line 330
    return-void
.end method

.method private writePackInfo(Ljava/io/DataOutput;)V
    .registers 8
    .param p1, "header"    # Ljava/io/DataOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 344
    const/4 v2, 0x6

    invoke-interface {p1, v2}, Ljava/io/DataOutput;->write(I)V

    .line 346
    const-wide/16 v2, 0x0

    invoke-direct {p0, p1, v2, v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeUint64(Ljava/io/DataOutput;J)V

    .line 347
    const-wide v2, 0xffffffffL

    iget v4, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->numNonEmptyStreams:I

    int-to-long v4, v4

    and-long/2addr v2, v4

    invoke-direct {p0, p1, v2, v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeUint64(Ljava/io/DataOutput;J)V

    .line 349
    const/16 v2, 0x9

    invoke-interface {p1, v2}, Ljava/io/DataOutput;->write(I)V

    .line 350
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_20
    :goto_20
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .line 351
    .local v0, "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasStream()Z

    move-result v2

    if-eqz v2, :cond_20

    .line 352
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getCompressedSize()J

    move-result-wide v2

    invoke-direct {p0, p1, v2, v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeUint64(Ljava/io/DataOutput;J)V

    goto :goto_20

    .line 356
    .end local v0    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    :cond_3a
    const/16 v2, 0xa

    invoke-interface {p1, v2}, Ljava/io/DataOutput;->write(I)V

    .line 357
    const/4 v2, 0x1

    invoke-interface {p1, v2}, Ljava/io/DataOutput;->write(I)V

    .line 358
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_49
    :goto_49
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_68

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .line 359
    .restart local v0    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasStream()Z

    move-result v2

    if-eqz v2, :cond_49

    .line 360
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getCompressedCrcValue()J

    move-result-wide v2

    long-to-int v2, v2

    invoke-static {v2}, Ljava/lang/Integer;->reverseBytes(I)I

    move-result v2

    invoke-interface {p1, v2}, Ljava/io/DataOutput;->writeInt(I)V

    goto :goto_49

    .line 364
    .end local v0    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    :cond_68
    const/4 v2, 0x0

    invoke-interface {p1, v2}, Ljava/io/DataOutput;->write(I)V

    .line 365
    return-void
.end method

.method private writeSingleCodec(Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;Ljava/io/OutputStream;)V
    .registers 8
    .param p1, "m"    # Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;
    .param p2, "bos"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 420
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;->getMethod()Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->getId()[B

    move-result-object v1

    .line 421
    .local v1, "id":[B
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;->getMethod()Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/commons/compress/archivers/sevenz/Coders;->findByMethod(Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;)Lorg/apache/commons/compress/archivers/sevenz/CoderBase;

    move-result-object v3

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;->getOptions()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/commons/compress/archivers/sevenz/CoderBase;->getOptionsAsProperties(Ljava/lang/Object;)[B

    move-result-object v2

    .line 424
    .local v2, "properties":[B
    array-length v0, v1

    .line 425
    .local v0, "codecFlags":I
    array-length v3, v2

    if-lez v3, :cond_1e

    .line 426
    or-int/lit8 v0, v0, 0x20

    .line 428
    :cond_1e
    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V

    .line 429
    invoke-virtual {p2, v1}, Ljava/io/OutputStream;->write([B)V

    .line 431
    array-length v3, v2

    if-lez v3, :cond_2e

    .line 432
    array-length v3, v2

    invoke-virtual {p2, v3}, Ljava/io/OutputStream;->write(I)V

    .line 433
    invoke-virtual {p2, v2}, Ljava/io/OutputStream;->write([B)V

    .line 435
    :cond_2e
    return-void
.end method

.method private writeStreamsInfo(Ljava/io/DataOutput;)V
    .registers 3
    .param p1, "header"    # Ljava/io/DataOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 333
    iget v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->numNonEmptyStreams:I

    if-lez v0, :cond_a

    .line 334
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writePackInfo(Ljava/io/DataOutput;)V

    .line 335
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeUnpackInfo(Ljava/io/DataOutput;)V

    .line 338
    :cond_a
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeSubStreamsInfo(Ljava/io/DataOutput;)V

    .line 340
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->write(I)V

    .line 341
    return-void
.end method

.method private writeSubStreamsInfo(Ljava/io/DataOutput;)V
    .registers 3
    .param p1, "header"    # Ljava/io/DataOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 438
    const/16 v0, 0x8

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->write(I)V

    .line 448
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->write(I)V

    .line 449
    return-void
.end method

.method private writeUint64(Ljava/io/DataOutput;J)V
    .registers 12
    .param p1, "header"    # Ljava/io/DataOutput;
    .param p2, "value"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x8

    .line 697
    const/4 v0, 0x0

    .line 698
    .local v0, "firstByte":I
    const/16 v2, 0x80

    .line 700
    .local v2, "mask":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    if-ge v1, v7, :cond_1a

    .line 701
    const-wide/16 v3, 0x1

    add-int/lit8 v5, v1, 0x1

    mul-int/lit8 v5, v5, 0x7

    shl-long/2addr v3, v5

    cmp-long v3, p2, v3

    if-gez v3, :cond_2a

    .line 702
    int-to-long v3, v0

    mul-int/lit8 v5, v1, 0x8

    ushr-long v5, p2, v5

    or-long/2addr v3, v5

    long-to-int v0, v3

    .line 708
    :cond_1a
    invoke-interface {p1, v0}, Ljava/io/DataOutput;->write(I)V

    .line 709
    :goto_1d
    if-lez v1, :cond_30

    .line 710
    const-wide/16 v3, 0xff

    and-long/2addr v3, p2

    long-to-int v3, v3

    invoke-interface {p1, v3}, Ljava/io/DataOutput;->write(I)V

    .line 711
    ushr-long/2addr p2, v7

    .line 709
    add-int/lit8 v1, v1, -0x1

    goto :goto_1d

    .line 705
    :cond_2a
    or-int/2addr v0, v2

    .line 706
    ushr-int/lit8 v2, v2, 0x1

    .line 700
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 713
    :cond_30
    return-void
.end method

.method private writeUnpackInfo(Ljava/io/DataOutput;)V
    .registers 13
    .param p1, "header"    # Ljava/io/DataOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 368
    const/4 v8, 0x7

    invoke-interface {p1, v8}, Ljava/io/DataOutput;->write(I)V

    .line 370
    const/16 v8, 0xb

    invoke-interface {p1, v8}, Ljava/io/DataOutput;->write(I)V

    .line 371
    iget v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->numNonEmptyStreams:I

    int-to-long v8, v8

    invoke-direct {p0, p1, v8, v9}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeUint64(Ljava/io/DataOutput;J)V

    .line 372
    invoke-interface {p1, v10}, Ljava/io/DataOutput;->write(I)V

    .line 373
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_19
    :goto_19
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .line 374
    .local v1, "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasStream()Z

    move-result v8

    if-eqz v8, :cond_19

    .line 375
    invoke-direct {p0, p1, v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeFolder(Ljava/io/DataOutput;Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;)V

    goto :goto_19

    .line 379
    .end local v1    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    :cond_2f
    const/16 v8, 0xc

    invoke-interface {p1, v8}, Ljava/io/DataOutput;->write(I)V

    .line 380
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_3a
    :goto_3a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_6b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .line 381
    .restart local v1    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasStream()Z

    move-result v8

    if-eqz v8, :cond_3a

    .line 382
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->additionalSizes:Ljava/util/Map;

    invoke-interface {v8, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [J

    .line 383
    .local v5, "moreSizes":[J
    if-eqz v5, :cond_63

    .line 384
    move-object v0, v5

    .local v0, "arr$":[J
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_59
    if-ge v3, v4, :cond_63

    aget-wide v6, v0, v3

    .line 385
    .local v6, "s":J
    invoke-direct {p0, p1, v6, v7}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeUint64(Ljava/io/DataOutput;J)V

    .line 384
    add-int/lit8 v3, v3, 0x1

    goto :goto_59

    .line 388
    .end local v0    # "arr$":[J
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v6    # "s":J
    :cond_63
    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getSize()J

    move-result-wide v8

    invoke-direct {p0, p1, v8, v9}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeUint64(Ljava/io/DataOutput;J)V

    goto :goto_3a

    .line 392
    .end local v1    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    .end local v5    # "moreSizes":[J
    :cond_6b
    const/16 v8, 0xa

    invoke-interface {p1, v8}, Ljava/io/DataOutput;->write(I)V

    .line 393
    const/4 v8, 0x1

    invoke-interface {p1, v8}, Ljava/io/DataOutput;->write(I)V

    .line 394
    iget-object v8, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_7a
    :goto_7a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_99

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .line 395
    .restart local v1    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasStream()Z

    move-result v8

    if-eqz v8, :cond_7a

    .line 396
    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getCrcValue()J

    move-result-wide v8

    long-to-int v8, v8

    invoke-static {v8}, Ljava/lang/Integer;->reverseBytes(I)I

    move-result v8

    invoke-interface {p1, v8}, Ljava/io/DataOutput;->writeInt(I)V

    goto :goto_7a

    .line 400
    .end local v1    # "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    :cond_99
    invoke-interface {p1, v10}, Ljava/io/DataOutput;->write(I)V

    .line 401
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
    .line 110
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->finished:Z

    if-nez v0, :cond_7

    .line 111
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->finish()V

    .line 113
    :cond_7
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 114
    return-void
.end method

.method public closeArchiveEntry()V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    const/4 v7, 0x0

    const-wide/16 v5, 0x0

    .line 153
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->currentOutputStream:Lorg/apache/commons/compress/utils/CountingOutputStream;

    if-eqz v3, :cond_13

    .line 154
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->currentOutputStream:Lorg/apache/commons/compress/utils/CountingOutputStream;

    invoke-virtual {v3}, Lorg/apache/commons/compress/utils/CountingOutputStream;->flush()V

    .line 155
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->currentOutputStream:Lorg/apache/commons/compress/utils/CountingOutputStream;

    invoke-virtual {v3}, Lorg/apache/commons/compress/utils/CountingOutputStream;->close()V

    .line 158
    :cond_13
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .line 159
    .local v0, "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->fileBytesWritten:J

    cmp-long v3, v3, v5

    if-lez v3, :cond_87

    .line 160
    invoke-virtual {v0, v8}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setHasStream(Z)V

    .line 161
    iget v3, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->numNonEmptyStreams:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->numNonEmptyStreams:I

    .line 162
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->currentOutputStream:Lorg/apache/commons/compress/utils/CountingOutputStream;

    invoke-virtual {v3}, Lorg/apache/commons/compress/utils/CountingOutputStream;->getBytesWritten()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setSize(J)V

    .line 163
    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->fileBytesWritten:J

    invoke-virtual {v0, v3, v4}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setCompressedSize(J)V

    .line 164
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->crc32:Ljava/util/zip/CRC32;

    invoke-virtual {v3}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setCrcValue(J)V

    .line 165
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->compressedCrc32:Ljava/util/zip/CRC32;

    invoke-virtual {v3}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setCompressedCrcValue(J)V

    .line 166
    invoke-virtual {v0, v8}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setHasCrc(Z)V

    .line 167
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->additionalCountingStreams:[Lorg/apache/commons/compress/utils/CountingOutputStream;

    if-eqz v3, :cond_76

    .line 168
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->additionalCountingStreams:[Lorg/apache/commons/compress/utils/CountingOutputStream;

    array-length v3, v3

    new-array v2, v3, [J

    .line 169
    .local v2, "sizes":[J
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5f
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->additionalCountingStreams:[Lorg/apache/commons/compress/utils/CountingOutputStream;

    array-length v3, v3

    if-ge v1, v3, :cond_71

    .line 170
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->additionalCountingStreams:[Lorg/apache/commons/compress/utils/CountingOutputStream;

    aget-object v3, v3, v1

    invoke-virtual {v3}, Lorg/apache/commons/compress/utils/CountingOutputStream;->getBytesWritten()J

    move-result-wide v3

    aput-wide v3, v2, v1

    .line 169
    add-int/lit8 v1, v1, 0x1

    goto :goto_5f

    .line 172
    :cond_71
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->additionalSizes:Ljava/util/Map;

    invoke-interface {v3, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    .end local v1    # "i":I
    .end local v2    # "sizes":[J
    :cond_76
    :goto_76
    iput-object v9, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->currentOutputStream:Lorg/apache/commons/compress/utils/CountingOutputStream;

    .line 181
    iput-object v9, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->additionalCountingStreams:[Lorg/apache/commons/compress/utils/CountingOutputStream;

    .line 182
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->crc32:Ljava/util/zip/CRC32;

    invoke-virtual {v3}, Ljava/util/zip/CRC32;->reset()V

    .line 183
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->compressedCrc32:Ljava/util/zip/CRC32;

    invoke-virtual {v3}, Ljava/util/zip/CRC32;->reset()V

    .line 184
    iput-wide v5, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->fileBytesWritten:J

    .line 185
    return-void

    .line 175
    :cond_87
    invoke-virtual {v0, v7}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setHasStream(Z)V

    .line 176
    invoke-virtual {v0, v5, v6}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setSize(J)V

    .line 177
    invoke-virtual {v0, v5, v6}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setCompressedSize(J)V

    .line 178
    invoke-virtual {v0, v7}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setHasCrc(Z)V

    goto :goto_76
.end method

.method public createArchiveEntry(Ljava/io/File;Ljava/lang/String;)Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    .registers 7
    .param p1, "inputFile"    # Ljava/io/File;
    .param p2, "entryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    new-instance v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    invoke-direct {v0}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;-><init>()V

    .line 128
    .local v0, "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setDirectory(Z)V

    .line 129
    invoke-virtual {v0, p2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setName(Ljava/lang/String;)V

    .line 130
    new-instance v1, Ljava/util/Date;

    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setLastModifiedDate(Ljava/util/Date;)V

    .line 131
    return-object v0
.end method

.method public finish()V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 224
    iget-boolean v9, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->finished:Z

    if-eqz v9, :cond_c

    .line 225
    new-instance v9, Ljava/io/IOException;

    const-string v10, "This archive has already been finished"

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 227
    :cond_c
    const/4 v9, 0x1

    iput-boolean v9, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->finished:Z

    .line 229
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v9}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v4

    .line 231
    .local v4, "headerPosition":J
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 232
    .local v2, "headerBaos":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v2}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 234
    .local v1, "header":Ljava/io/DataOutputStream;
    invoke-direct {p0, v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->writeHeader(Ljava/io/DataOutput;)V

    .line 235
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V

    .line 236
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    .line 237
    .local v3, "headerBytes":[B
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v9, v3}, Ljava/io/RandomAccessFile;->write([B)V

    .line 239
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    .line 242
    .local v0, "crc32":Ljava/util/zip/CRC32;
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->file:Ljava/io/RandomAccessFile;

    const-wide/16 v10, 0x0

    invoke-virtual {v9, v10, v11}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 243
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->file:Ljava/io/RandomAccessFile;

    sget-object v10, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->sevenZSignature:[B

    invoke-virtual {v9, v10}, Ljava/io/RandomAccessFile;->write([B)V

    .line 245
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->file:Ljava/io/RandomAccessFile;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Ljava/io/RandomAccessFile;->write(I)V

    .line 246
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->file:Ljava/io/RandomAccessFile;

    const/4 v10, 0x2

    invoke-virtual {v9, v10}, Ljava/io/RandomAccessFile;->write(I)V

    .line 249
    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 250
    .local v6, "startHeaderBaos":Ljava/io/ByteArrayOutputStream;
    new-instance v8, Ljava/io/DataOutputStream;

    invoke-direct {v8, v6}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 251
    .local v8, "startHeaderStream":Ljava/io/DataOutputStream;
    const-wide/16 v9, 0x20

    sub-long v9, v4, v9

    invoke-static {v9, v10}, Ljava/lang/Long;->reverseBytes(J)J

    move-result-wide v9

    invoke-virtual {v8, v9, v10}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 252
    const-wide v9, 0xffffffffL

    array-length v11, v3

    int-to-long v11, v11

    and-long/2addr v9, v11

    invoke-static {v9, v10}, Ljava/lang/Long;->reverseBytes(J)J

    move-result-wide v9

    invoke-virtual {v8, v9, v10}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 253
    invoke-virtual {v0}, Ljava/util/zip/CRC32;->reset()V

    .line 254
    invoke-virtual {v0, v3}, Ljava/util/zip/CRC32;->update([B)V

    .line 255
    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v9

    long-to-int v9, v9

    invoke-static {v9}, Ljava/lang/Integer;->reverseBytes(I)I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 256
    invoke-virtual {v8}, Ljava/io/DataOutputStream;->flush()V

    .line 257
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v7

    .line 258
    .local v7, "startHeaderBytes":[B
    invoke-virtual {v0}, Ljava/util/zip/CRC32;->reset()V

    .line 259
    invoke-virtual {v0, v7}, Ljava/util/zip/CRC32;->update([B)V

    .line 260
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v10

    long-to-int v10, v10

    invoke-static {v10}, Ljava/lang/Integer;->reverseBytes(I)I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/io/RandomAccessFile;->writeInt(I)V

    .line 261
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v9, v7}, Ljava/io/RandomAccessFile;->write([B)V

    .line 262
    return-void
.end method

.method public putArchiveEntry(Lorg/apache/commons/compress/archivers/ArchiveEntry;)V
    .registers 4
    .param p1, "archiveEntry"    # Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 144
    move-object v0, p1

    check-cast v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .line 145
    .local v0, "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->files:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 146
    return-void
.end method

.method public setContentCompression(Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;)V
    .registers 3
    .param p1, "method"    # Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    .prologue
    .line 83
    new-instance v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;

    invoke-direct {v0, p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;-><init>(Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;)V

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->setContentMethods(Ljava/lang/Iterable;)V

    .line 84
    return-void
.end method

.method public setContentMethods(Ljava/lang/Iterable;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 101
    .local p1, "methods":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;>;"
    invoke-static {p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->reverse(Ljava/lang/Iterable;)Ljava/lang/Iterable;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->contentMethods:Ljava/lang/Iterable;

    .line 102
    return-void
.end method

.method public write(I)V
    .registers 3
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 193
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->getCurrentOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 194
    return-void
.end method

.method public write([B)V
    .registers 4
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 202
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->write([BII)V

    .line 203
    return-void
.end method

.method public write([BII)V
    .registers 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 213
    if-lez p3, :cond_9

    .line 214
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/sevenz/SevenZOutputFile;->getCurrentOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 216
    :cond_9
    return-void
.end method
