.class public Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;
.super Ljava/lang/Object;
.source "SevenZFile.java"

# interfaces
.implements Ljava/io/Closeable;


# static fields
.field static final SIGNATURE_HEADER_SIZE:I = 0x20

.field static final sevenZSignature:[B


# instance fields
.field private final archive:Lorg/apache/commons/compress/archivers/sevenz/Archive;

.field private currentEntryIndex:I

.field private currentEntryInputStream:Ljava/io/InputStream;

.field private currentFolderIndex:I

.field private currentFolderInputStream:Ljava/io/InputStream;

.field private file:Ljava/io/RandomAccessFile;

.field private final fileName:Ljava/lang/String;

.field private password:[B


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 79
    const/4 v0, 0x6

    new-array v0, v0, [B

    fill-array-data v0, :array_a

    sput-object v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->sevenZSignature:[B

    return-void

    nop

    :array_a
    .array-data 1
        0x37t
        0x7at
        -0x44t
        -0x51t
        0x27t
        0x1ct
    .end array-data
.end method

.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "filename"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;-><init>(Ljava/io/File;[B)V

    .line 120
    return-void
.end method

.method public constructor <init>(Ljava/io/File;[B)V
    .registers 8
    .param p1, "filename"    # Ljava/io/File;
    .param p2, "password"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, -0x1

    const/4 v1, 0x0

    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput v2, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentEntryIndex:I

    .line 74
    iput v2, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentFolderIndex:I

    .line 75
    iput-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentFolderInputStream:Ljava/io/InputStream;

    .line 76
    iput-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentEntryInputStream:Ljava/io/InputStream;

    .line 93
    const/4 v0, 0x0

    .line 94
    .local v0, "succeeded":Z
    new-instance v1, Ljava/io/RandomAccessFile;

    const-string v2, "r"

    invoke-direct {v1, p1, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->file:Ljava/io/RandomAccessFile;

    .line 95
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->fileName:Ljava/lang/String;

    .line 97
    :try_start_1d
    invoke-direct {p0, p2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readHeaders([B)Lorg/apache/commons/compress/archivers/sevenz/Archive;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->archive:Lorg/apache/commons/compress/archivers/sevenz/Archive;

    .line 98
    if-eqz p2, :cond_3b

    .line 99
    array-length v1, p2

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->password:[B

    .line 100
    const/4 v1, 0x0

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->password:[B

    const/4 v3, 0x0

    array-length v4, p2

    invoke-static {p2, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_32
    .catchall {:try_start_1d .. :try_end_32} :catchall_3f

    .line 104
    :goto_32
    const/4 v0, 0x1

    .line 106
    if-nez v0, :cond_3a

    .line 107
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V

    .line 110
    :cond_3a
    return-void

    .line 102
    :cond_3b
    const/4 v1, 0x0

    :try_start_3c
    iput-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->password:[B
    :try_end_3e
    .catchall {:try_start_3c .. :try_end_3e} :catchall_3f

    goto :goto_32

    .line 106
    :catchall_3f
    move-exception v1

    if-nez v0, :cond_47

    .line 107
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V

    :cond_47
    throw v1
.end method

.method private buildDecoderStack(Lorg/apache/commons/compress/archivers/sevenz/Folder;JILorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;)Ljava/io/InputStream;
    .registers 22
    .param p1, "folder"    # Lorg/apache/commons/compress/archivers/sevenz/Folder;
    .param p2, "folderOffset"    # J
    .param p4, "firstPackStreamIndex"    # I
    .param p5, "entry"    # Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 855
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->file:Ljava/io/RandomAccessFile;

    move-wide/from16 v0, p2

    invoke-virtual {v2, v0, v1}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 856
    new-instance v3, Lorg/apache/commons/compress/archivers/sevenz/BoundedRandomAccessFileInputStream;

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->file:Ljava/io/RandomAccessFile;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->archive:Lorg/apache/commons/compress/archivers/sevenz/Archive;

    iget-object v4, v4, Lorg/apache/commons/compress/archivers/sevenz/Archive;->packSizes:[J

    aget-wide v4, v4, p4

    invoke-direct {v3, v2, v4, v5}, Lorg/apache/commons/compress/archivers/sevenz/BoundedRandomAccessFileInputStream;-><init>(Ljava/io/RandomAccessFile;J)V

    .line 858
    .local v3, "inputStreamStack":Ljava/io/InputStream;
    new-instance v15, Ljava/util/LinkedList;

    invoke-direct {v15}, Ljava/util/LinkedList;-><init>()V

    .line 859
    .local v15, "methods":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;>;"
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/sevenz/Folder;->getOrderedCoders()Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "i$":Ljava/util/Iterator;
    :goto_27
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_74

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/commons/compress/archivers/sevenz/Coder;

    .line 860
    .local v6, "coder":Lorg/apache/commons/compress/archivers/sevenz/Coder;
    iget-wide v4, v6, Lorg/apache/commons/compress/archivers/sevenz/Coder;->numInStreams:J

    const-wide/16 v7, 0x1

    cmp-long v2, v4, v7

    if-nez v2, :cond_43

    iget-wide v4, v6, Lorg/apache/commons/compress/archivers/sevenz/Coder;->numOutStreams:J

    const-wide/16 v7, 0x1

    cmp-long v2, v4, v7

    if-eqz v2, :cond_4b

    .line 861
    :cond_43
    new-instance v2, Ljava/io/IOException;

    const-string v4, "Multi input/output stream coders are not yet supported"

    invoke-direct {v2, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 863
    :cond_4b
    iget-object v2, v6, Lorg/apache/commons/compress/archivers/sevenz/Coder;->decompressionMethodId:[B

    invoke-static {v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->byId([B)Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    move-result-object v14

    .line 864
    .local v14, "method":Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->fileName:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Lorg/apache/commons/compress/archivers/sevenz/Folder;->getUnpackSizeForCoder(Lorg/apache/commons/compress/archivers/sevenz/Coder;)J

    move-result-wide v4

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->password:[B

    invoke-static/range {v2 .. v7}, Lorg/apache/commons/compress/archivers/sevenz/Coders;->addDecoder(Ljava/lang/String;Ljava/io/InputStream;JLorg/apache/commons/compress/archivers/sevenz/Coder;[B)Ljava/io/InputStream;

    move-result-object v3

    .line 866
    new-instance v2, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;

    invoke-static {v14}, Lorg/apache/commons/compress/archivers/sevenz/Coders;->findByMethod(Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;)Lorg/apache/commons/compress/archivers/sevenz/CoderBase;

    move-result-object v4

    invoke-virtual {v4, v6, v3}, Lorg/apache/commons/compress/archivers/sevenz/CoderBase;->getOptionsFromCoder(Lorg/apache/commons/compress/archivers/sevenz/Coder;Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v4

    invoke-direct {v2, v14, v4}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;-><init>(Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;Ljava/lang/Object;)V

    invoke-virtual {v15, v2}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    goto :goto_27

    .line 869
    .end local v6    # "coder":Lorg/apache/commons/compress/archivers/sevenz/Coder;
    .end local v14    # "method":Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;
    :cond_74
    move-object/from16 v0, p5

    invoke-virtual {v0, v15}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setContentMethods(Ljava/lang/Iterable;)V

    .line 870
    move-object/from16 v0, p1

    iget-boolean v2, v0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->hasCrc:Z

    if-eqz v2, :cond_8e

    .line 871
    new-instance v7, Lorg/apache/commons/compress/utils/CRC32VerifyingInputStream;

    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/sevenz/Folder;->getUnpackSize()J

    move-result-wide v9

    move-object/from16 v0, p1

    iget-wide v11, v0, Lorg/apache/commons/compress/archivers/sevenz/Folder;->crc:J

    move-object v8, v3

    invoke-direct/range {v7 .. v12}, Lorg/apache/commons/compress/utils/CRC32VerifyingInputStream;-><init>(Ljava/io/InputStream;JJ)V

    .line 874
    :goto_8d
    return-object v7

    :cond_8e
    move-object v7, v3

    goto :goto_8d
.end method

.method private buildDecodingStream()V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 809
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->archive:Lorg/apache/commons/compress/archivers/sevenz/Archive;

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->streamMap:Lorg/apache/commons/compress/archivers/sevenz/StreamMap;

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/StreamMap;->fileFolderIndex:[I

    iget v6, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentEntryIndex:I

    aget v12, v0, v6

    .line 810
    .local v12, "folderIndex":I
    if-gez v12, :cond_1e

    .line 811
    new-instance v0, Lorg/apache/commons/compress/utils/BoundedInputStream;

    new-instance v6, Ljava/io/ByteArrayInputStream;

    const/4 v8, 0x0

    new-array v8, v8, [B

    invoke-direct {v6, v8}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    const-wide/16 v8, 0x0

    invoke-direct {v0, v6, v8, v9}, Lorg/apache/commons/compress/utils/BoundedInputStream;-><init>(Ljava/io/InputStream;J)V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentEntryInputStream:Ljava/io/InputStream;

    .line 842
    :goto_1d
    return-void

    .line 815
    :cond_1e
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->archive:Lorg/apache/commons/compress/archivers/sevenz/Archive;

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->files:[Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    iget v6, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentEntryIndex:I

    aget-object v5, v0, v6

    .line 816
    .local v5, "file":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    iget v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentFolderIndex:I

    if-ne v0, v12, :cond_5f

    .line 818
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->drainPreviousEntry()V

    .line 819
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->archive:Lorg/apache/commons/compress/archivers/sevenz/Archive;

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->files:[Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    iget v6, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentEntryIndex:I

    add-int/lit8 v6, v6, -0x1

    aget-object v0, v0, v6

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getContentMethods()Ljava/lang/Iterable;

    move-result-object v0

    invoke-virtual {v5, v0}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setContentMethods(Ljava/lang/Iterable;)V

    .line 833
    :goto_3e
    new-instance v7, Lorg/apache/commons/compress/utils/BoundedInputStream;

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentFolderInputStream:Ljava/io/InputStream;

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getSize()J

    move-result-wide v8

    invoke-direct {v7, v0, v8, v9}, Lorg/apache/commons/compress/utils/BoundedInputStream;-><init>(Ljava/io/InputStream;J)V

    .line 835
    .local v7, "fileStream":Ljava/io/InputStream;
    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getHasCrc()Z

    move-result v0

    if-eqz v0, :cond_94

    .line 836
    new-instance v6, Lorg/apache/commons/compress/utils/CRC32VerifyingInputStream;

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getSize()J

    move-result-wide v8

    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getCrcValue()J

    move-result-wide v10

    invoke-direct/range {v6 .. v11}, Lorg/apache/commons/compress/utils/CRC32VerifyingInputStream;-><init>(Ljava/io/InputStream;JJ)V

    iput-object v6, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentEntryInputStream:Ljava/io/InputStream;

    goto :goto_1d

    .line 821
    .end local v7    # "fileStream":Ljava/io/InputStream;
    :cond_5f
    iput v12, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentFolderIndex:I

    .line 822
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentFolderInputStream:Ljava/io/InputStream;

    if-eqz v0, :cond_6d

    .line 823
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentFolderInputStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 824
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentFolderInputStream:Ljava/io/InputStream;

    .line 827
    :cond_6d
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->archive:Lorg/apache/commons/compress/archivers/sevenz/Archive;

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->folders:[Lorg/apache/commons/compress/archivers/sevenz/Folder;

    aget-object v1, v0, v12

    .line 828
    .local v1, "folder":Lorg/apache/commons/compress/archivers/sevenz/Folder;
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->archive:Lorg/apache/commons/compress/archivers/sevenz/Archive;

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->streamMap:Lorg/apache/commons/compress/archivers/sevenz/StreamMap;

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/StreamMap;->folderFirstPackStreamIndex:[I

    aget v4, v0, v12

    .line 829
    .local v4, "firstPackStreamIndex":I
    const-wide/16 v8, 0x20

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->archive:Lorg/apache/commons/compress/archivers/sevenz/Archive;

    iget-wide v10, v0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->packPos:J

    add-long/2addr v8, v10

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->archive:Lorg/apache/commons/compress/archivers/sevenz/Archive;

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->streamMap:Lorg/apache/commons/compress/archivers/sevenz/StreamMap;

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/StreamMap;->packStreamOffsets:[J

    aget-wide v10, v0, v4

    add-long v2, v8, v10

    .local v2, "folderOffset":J
    move-object v0, p0

    .line 831
    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->buildDecoderStack(Lorg/apache/commons/compress/archivers/sevenz/Folder;JILorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;)Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentFolderInputStream:Ljava/io/InputStream;

    goto :goto_3e

    .line 839
    .end local v1    # "folder":Lorg/apache/commons/compress/archivers/sevenz/Folder;
    .end local v2    # "folderOffset":J
    .end local v4    # "firstPackStreamIndex":I
    .restart local v7    # "fileStream":Ljava/io/InputStream;
    :cond_94
    iput-object v7, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentEntryInputStream:Ljava/io/InputStream;

    goto :goto_1d
.end method

.method private calculateStreamMap(Lorg/apache/commons/compress/archivers/sevenz/Archive;)V
    .registers 13
    .param p1, "archive"    # Lorg/apache/commons/compress/archivers/sevenz/Archive;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 756
    new-instance v8, Lorg/apache/commons/compress/archivers/sevenz/StreamMap;

    invoke-direct {v8}, Lorg/apache/commons/compress/archivers/sevenz/StreamMap;-><init>()V

    .line 758
    .local v8, "streamMap":Lorg/apache/commons/compress/archivers/sevenz/StreamMap;
    const/4 v2, 0x0

    .line 759
    .local v2, "nextFolderPackStreamIndex":I
    iget-object v10, p1, Lorg/apache/commons/compress/archivers/sevenz/Archive;->folders:[Lorg/apache/commons/compress/archivers/sevenz/Folder;

    if-eqz v10, :cond_24

    iget-object v10, p1, Lorg/apache/commons/compress/archivers/sevenz/Archive;->folders:[Lorg/apache/commons/compress/archivers/sevenz/Folder;

    array-length v6, v10

    .line 760
    .local v6, "numFolders":I
    :goto_e
    new-array v10, v6, [I

    iput-object v10, v8, Lorg/apache/commons/compress/archivers/sevenz/StreamMap;->folderFirstPackStreamIndex:[I

    .line 761
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_13
    if-ge v0, v6, :cond_26

    .line 762
    iget-object v10, v8, Lorg/apache/commons/compress/archivers/sevenz/StreamMap;->folderFirstPackStreamIndex:[I

    aput v2, v10, v0

    .line 763
    iget-object v10, p1, Lorg/apache/commons/compress/archivers/sevenz/Archive;->folders:[Lorg/apache/commons/compress/archivers/sevenz/Folder;

    aget-object v10, v10, v0

    iget-object v10, v10, Lorg/apache/commons/compress/archivers/sevenz/Folder;->packedStreams:[J

    array-length v10, v10

    add-int/2addr v2, v10

    .line 761
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .end local v0    # "i":I
    .end local v6    # "numFolders":I
    :cond_24
    move v6, v9

    .line 759
    goto :goto_e

    .line 766
    .restart local v0    # "i":I
    .restart local v6    # "numFolders":I
    :cond_26
    const-wide/16 v4, 0x0

    .line 767
    .local v4, "nextPackStreamOffset":J
    iget-object v10, p1, Lorg/apache/commons/compress/archivers/sevenz/Archive;->packSizes:[J

    if-eqz v10, :cond_42

    iget-object v9, p1, Lorg/apache/commons/compress/archivers/sevenz/Archive;->packSizes:[J

    array-length v7, v9

    .line 768
    .local v7, "numPackSizes":I
    :goto_2f
    new-array v9, v7, [J

    iput-object v9, v8, Lorg/apache/commons/compress/archivers/sevenz/StreamMap;->packStreamOffsets:[J

    .line 769
    const/4 v0, 0x0

    :goto_34
    if-ge v0, v7, :cond_44

    .line 770
    iget-object v9, v8, Lorg/apache/commons/compress/archivers/sevenz/StreamMap;->packStreamOffsets:[J

    aput-wide v4, v9, v0

    .line 771
    iget-object v9, p1, Lorg/apache/commons/compress/archivers/sevenz/Archive;->packSizes:[J

    aget-wide v9, v9, v0

    add-long/2addr v4, v9

    .line 769
    add-int/lit8 v0, v0, 0x1

    goto :goto_34

    .end local v7    # "numPackSizes":I
    :cond_42
    move v7, v9

    .line 767
    goto :goto_2f

    .line 774
    .restart local v7    # "numPackSizes":I
    :cond_44
    new-array v9, v6, [I

    iput-object v9, v8, Lorg/apache/commons/compress/archivers/sevenz/StreamMap;->folderFirstFileIndex:[I

    .line 775
    iget-object v9, p1, Lorg/apache/commons/compress/archivers/sevenz/Archive;->files:[Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    array-length v9, v9

    new-array v9, v9, [I

    iput-object v9, v8, Lorg/apache/commons/compress/archivers/sevenz/StreamMap;->fileFolderIndex:[I

    .line 776
    const/4 v1, 0x0

    .line 777
    .local v1, "nextFolderIndex":I
    const/4 v3, 0x0

    .line 778
    .local v3, "nextFolderUnpackStreamIndex":I
    const/4 v0, 0x0

    :goto_52
    iget-object v9, p1, Lorg/apache/commons/compress/archivers/sevenz/Archive;->files:[Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    array-length v9, v9

    if-ge v0, v9, :cond_aa

    .line 779
    iget-object v9, p1, Lorg/apache/commons/compress/archivers/sevenz/Archive;->files:[Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    aget-object v9, v9, v0

    invoke-virtual {v9}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasStream()Z

    move-result v9

    if-nez v9, :cond_6b

    if-nez v3, :cond_6b

    .line 780
    iget-object v9, v8, Lorg/apache/commons/compress/archivers/sevenz/StreamMap;->fileFolderIndex:[I

    const/4 v10, -0x1

    aput v10, v9, v0

    .line 778
    :cond_68
    :goto_68
    add-int/lit8 v0, v0, 0x1

    goto :goto_52

    .line 783
    :cond_6b
    if-nez v3, :cond_8e

    .line 784
    :goto_6d
    iget-object v9, p1, Lorg/apache/commons/compress/archivers/sevenz/Archive;->folders:[Lorg/apache/commons/compress/archivers/sevenz/Folder;

    array-length v9, v9

    if-ge v1, v9, :cond_7e

    .line 785
    iget-object v9, v8, Lorg/apache/commons/compress/archivers/sevenz/StreamMap;->folderFirstFileIndex:[I

    aput v0, v9, v1

    .line 786
    iget-object v9, p1, Lorg/apache/commons/compress/archivers/sevenz/Archive;->folders:[Lorg/apache/commons/compress/archivers/sevenz/Folder;

    aget-object v9, v9, v1

    iget v9, v9, Lorg/apache/commons/compress/archivers/sevenz/Folder;->numUnpackSubStreams:I

    if-lez v9, :cond_8b

    .line 790
    :cond_7e
    iget-object v9, p1, Lorg/apache/commons/compress/archivers/sevenz/Archive;->folders:[Lorg/apache/commons/compress/archivers/sevenz/Folder;

    array-length v9, v9

    if-lt v1, v9, :cond_8e

    .line 791
    new-instance v9, Ljava/io/IOException;

    const-string v10, "Too few folders in archive"

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 784
    :cond_8b
    add-int/lit8 v1, v1, 0x1

    goto :goto_6d

    .line 794
    :cond_8e
    iget-object v9, v8, Lorg/apache/commons/compress/archivers/sevenz/StreamMap;->fileFolderIndex:[I

    aput v1, v9, v0

    .line 795
    iget-object v9, p1, Lorg/apache/commons/compress/archivers/sevenz/Archive;->files:[Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    aget-object v9, v9, v0

    invoke-virtual {v9}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasStream()Z

    move-result v9

    if-eqz v9, :cond_68

    .line 798
    add-int/lit8 v3, v3, 0x1

    .line 799
    iget-object v9, p1, Lorg/apache/commons/compress/archivers/sevenz/Archive;->folders:[Lorg/apache/commons/compress/archivers/sevenz/Folder;

    aget-object v9, v9, v1

    iget v9, v9, Lorg/apache/commons/compress/archivers/sevenz/Folder;->numUnpackSubStreams:I

    if-lt v3, v9, :cond_68

    .line 800
    add-int/lit8 v1, v1, 0x1

    .line 801
    const/4 v3, 0x0

    goto :goto_68

    .line 805
    :cond_aa
    iput-object v8, p1, Lorg/apache/commons/compress/archivers/sevenz/Archive;->streamMap:Lorg/apache/commons/compress/archivers/sevenz/StreamMap;

    .line 806
    return-void
.end method

.method private drainPreviousEntry()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 845
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentEntryInputStream:Ljava/io/InputStream;

    if-eqz v0, :cond_16

    .line 847
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentEntryInputStream:Ljava/io/InputStream;

    const-wide v1, 0x7fffffffffffffffL

    invoke-static {v0, v1, v2}, Lorg/apache/commons/compress/utils/IOUtils;->skip(Ljava/io/InputStream;J)J

    .line 848
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentEntryInputStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 849
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentEntryInputStream:Ljava/io/InputStream;

    .line 851
    :cond_16
    return-void
.end method

.method public static matches([BI)Z
    .registers 6
    .param p0, "signature"    # [B
    .param p1, "length"    # I

    .prologue
    const/4 v1, 0x0

    .line 948
    sget-object v2, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->sevenZSignature:[B

    array-length v2, v2

    if-ge p1, v2, :cond_7

    .line 957
    :cond_6
    :goto_6
    return v1

    .line 952
    :cond_7
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    sget-object v2, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->sevenZSignature:[B

    array-length v2, v2

    if-ge v0, v2, :cond_18

    .line 953
    aget-byte v2, p0, v0

    sget-object v3, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->sevenZSignature:[B

    aget-byte v3, v3, v0

    if-ne v2, v3, :cond_6

    .line 952
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 957
    :cond_18
    const/4 v1, 0x1

    goto :goto_6
.end method

.method private readAllOrBits(Ljava/io/DataInput;I)Ljava/util/BitSet;
    .registers 7
    .param p1, "header"    # Ljava/io/DataInput;
    .param p2, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 564
    invoke-interface {p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 566
    .local v0, "areAllDefined":I
    if-eqz v0, :cond_15

    .line 567
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, p2}, Ljava/util/BitSet;-><init>(I)V

    .line 568
    .local v1, "bits":Ljava/util/BitSet;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_c
    if-ge v2, p2, :cond_19

    .line 569
    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Ljava/util/BitSet;->set(IZ)V

    .line 568
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 572
    .end local v1    # "bits":Ljava/util/BitSet;
    .end local v2    # "i":I
    :cond_15
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readBits(Ljava/io/DataInput;I)Ljava/util/BitSet;

    move-result-object v1

    .line 574
    .restart local v1    # "bits":Ljava/util/BitSet;
    :cond_19
    return-object v1
.end method

.method private readArchiveProperties(Ljava/io/DataInput;)V
    .registers 7
    .param p1, "input"    # Ljava/io/DataInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 255
    invoke-interface {p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 256
    .local v0, "nid":I
    :goto_4
    if-eqz v0, :cond_15

    .line 257
    invoke-static {p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readUint64(Ljava/io/DataInput;)J

    move-result-wide v2

    .line 258
    .local v2, "propertySize":J
    long-to-int v4, v2

    new-array v1, v4, [B

    .line 259
    .local v1, "property":[B
    invoke-interface {p1, v1}, Ljava/io/DataInput;->readFully([B)V

    .line 260
    invoke-interface {p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 261
    goto :goto_4

    .line 262
    .end local v1    # "property":[B
    .end local v2    # "propertySize":J
    :cond_15
    return-void
.end method

.method private readBits(Ljava/io/DataInput;I)Ljava/util/BitSet;
    .registers 8
    .param p1, "header"    # Ljava/io/DataInput;
    .param p2, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 578
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0, p2}, Ljava/util/BitSet;-><init>(I)V

    .line 579
    .local v0, "bits":Ljava/util/BitSet;
    const/4 v3, 0x0

    .line 580
    .local v3, "mask":I
    const/4 v1, 0x0

    .line 581
    .local v1, "cache":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_8
    if-ge v2, p2, :cond_21

    .line 582
    if-nez v3, :cond_12

    .line 583
    const/16 v3, 0x80

    .line 584
    invoke-interface {p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1

    .line 586
    :cond_12
    and-int v4, v1, v3

    if-eqz v4, :cond_1f

    const/4 v4, 0x1

    :goto_17
    invoke-virtual {v0, v2, v4}, Ljava/util/BitSet;->set(IZ)V

    .line 587
    ushr-int/lit8 v3, v3, 0x1

    .line 581
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 586
    :cond_1f
    const/4 v4, 0x0

    goto :goto_17

    .line 589
    :cond_21
    return-object v0
.end method

.method private readEncodedHeader(Ljava/io/DataInputStream;Lorg/apache/commons/compress/archivers/sevenz/Archive;[B)Ljava/io/DataInputStream;
    .registers 24
    .param p1, "header"    # Ljava/io/DataInputStream;
    .param p2, "archive"    # Lorg/apache/commons/compress/archivers/sevenz/Archive;
    .param p3, "password"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 266
    invoke-direct/range {p0 .. p2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readStreamsInfo(Ljava/io/DataInput;Lorg/apache/commons/compress/archivers/sevenz/Archive;)V

    .line 269
    move-object/from16 v0, p2

    iget-object v2, v0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->folders:[Lorg/apache/commons/compress/archivers/sevenz/Folder;

    const/4 v4, 0x0

    aget-object v14, v2, v4

    .line 270
    .local v14, "folder":Lorg/apache/commons/compress/archivers/sevenz/Folder;
    const/4 v13, 0x0

    .line 271
    .local v13, "firstPackStreamIndex":I
    const-wide/16 v4, 0x20

    move-object/from16 v0, p2

    iget-wide v8, v0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->packPos:J

    add-long/2addr v4, v8

    const-wide/16 v8, 0x0

    add-long v15, v4, v8

    .line 274
    .local v15, "folderOffset":J
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->file:Ljava/io/RandomAccessFile;

    move-wide v0, v15

    invoke-virtual {v2, v0, v1}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 275
    new-instance v3, Lorg/apache/commons/compress/archivers/sevenz/BoundedRandomAccessFileInputStream;

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->file:Ljava/io/RandomAccessFile;

    move-object/from16 v0, p2

    iget-object v4, v0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->packSizes:[J

    const/4 v5, 0x0

    aget-wide v4, v4, v5

    invoke-direct {v3, v2, v4, v5}, Lorg/apache/commons/compress/archivers/sevenz/BoundedRandomAccessFileInputStream;-><init>(Ljava/io/RandomAccessFile;J)V

    .line 277
    .local v3, "inputStreamStack":Ljava/io/InputStream;
    invoke-virtual {v14}, Lorg/apache/commons/compress/archivers/sevenz/Folder;->getOrderedCoders()Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v17

    .local v17, "i$":Ljava/util/Iterator;
    :goto_36
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_69

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/commons/compress/archivers/sevenz/Coder;

    .line 278
    .local v6, "coder":Lorg/apache/commons/compress/archivers/sevenz/Coder;
    iget-wide v4, v6, Lorg/apache/commons/compress/archivers/sevenz/Coder;->numInStreams:J

    const-wide/16 v8, 0x1

    cmp-long v2, v4, v8

    if-nez v2, :cond_52

    iget-wide v4, v6, Lorg/apache/commons/compress/archivers/sevenz/Coder;->numOutStreams:J

    const-wide/16 v8, 0x1

    cmp-long v2, v4, v8

    if-eqz v2, :cond_5a

    .line 279
    :cond_52
    new-instance v2, Ljava/io/IOException;

    const-string v4, "Multi input/output stream coders are not yet supported"

    invoke-direct {v2, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 281
    :cond_5a
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->fileName:Ljava/lang/String;

    invoke-virtual {v14, v6}, Lorg/apache/commons/compress/archivers/sevenz/Folder;->getUnpackSizeForCoder(Lorg/apache/commons/compress/archivers/sevenz/Coder;)J

    move-result-wide v4

    move-object/from16 v7, p3

    invoke-static/range {v2 .. v7}, Lorg/apache/commons/compress/archivers/sevenz/Coders;->addDecoder(Ljava/lang/String;Ljava/io/InputStream;JLorg/apache/commons/compress/archivers/sevenz/Coder;[B)Ljava/io/InputStream;

    move-result-object v3

    .line 283
    goto :goto_36

    .line 284
    .end local v6    # "coder":Lorg/apache/commons/compress/archivers/sevenz/Coder;
    :cond_69
    iget-boolean v2, v14, Lorg/apache/commons/compress/archivers/sevenz/Folder;->hasCrc:Z

    if-eqz v2, :cond_7a

    .line 285
    new-instance v7, Lorg/apache/commons/compress/utils/CRC32VerifyingInputStream;

    invoke-virtual {v14}, Lorg/apache/commons/compress/archivers/sevenz/Folder;->getUnpackSize()J

    move-result-wide v9

    iget-wide v11, v14, Lorg/apache/commons/compress/archivers/sevenz/Folder;->crc:J

    move-object v8, v3

    invoke-direct/range {v7 .. v12}, Lorg/apache/commons/compress/utils/CRC32VerifyingInputStream;-><init>(Ljava/io/InputStream;JJ)V

    .end local v3    # "inputStreamStack":Ljava/io/InputStream;
    .local v7, "inputStreamStack":Ljava/io/InputStream;
    move-object v3, v7

    .line 288
    .end local v7    # "inputStreamStack":Ljava/io/InputStream;
    .restart local v3    # "inputStreamStack":Ljava/io/InputStream;
    :cond_7a
    invoke-virtual {v14}, Lorg/apache/commons/compress/archivers/sevenz/Folder;->getUnpackSize()J

    move-result-wide v4

    long-to-int v2, v4

    new-array v0, v2, [B

    move-object/from16 v18, v0

    .line 289
    .local v18, "nextHeader":[B
    new-instance v19, Ljava/io/DataInputStream;

    move-object/from16 v0, v19

    invoke-direct {v0, v3}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 291
    .local v19, "nextHeaderInputStream":Ljava/io/DataInputStream;
    :try_start_8a
    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/io/DataInputStream;->readFully([B)V
    :try_end_91
    .catchall {:try_start_8a .. :try_end_91} :catchall_a1

    .line 293
    invoke-virtual/range {v19 .. v19}, Ljava/io/DataInputStream;->close()V

    .line 295
    new-instance v2, Ljava/io/DataInputStream;

    new-instance v4, Ljava/io/ByteArrayInputStream;

    move-object/from16 v0, v18

    invoke-direct {v4, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v2, v4}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    return-object v2

    .line 293
    :catchall_a1
    move-exception v2

    invoke-virtual/range {v19 .. v19}, Ljava/io/DataInputStream;->close()V

    throw v2
.end method

.method private readFilesInfo(Ljava/io/DataInput;Lorg/apache/commons/compress/archivers/sevenz/Archive;)V
    .registers 29
    .param p1, "header"    # Ljava/io/DataInput;
    .param p2, "archive"    # Lorg/apache/commons/compress/archivers/sevenz/Archive;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 593
    invoke-static/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readUint64(Ljava/io/DataInput;)J

    move-result-wide v16

    .line 594
    .local v16, "numFiles":J
    move-wide/from16 v0, v16

    long-to-int v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    new-array v6, v0, [Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .line 595
    .local v6, "files":[Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_e
    array-length v0, v6

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v7, v0, :cond_1f

    .line 596
    new-instance v22, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    invoke-direct/range {v22 .. v22}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;-><init>()V

    aput-object v22, v6, v7

    .line 595
    add-int/lit8 v7, v7, 0x1

    goto :goto_e

    .line 598
    :cond_1f
    const/4 v10, 0x0

    .line 599
    .local v10, "isEmptyStream":Ljava/util/BitSet;
    const/4 v9, 0x0

    .line 600
    .local v9, "isEmptyFile":Ljava/util/BitSet;
    const/4 v8, 0x0

    .line 602
    .local v8, "isAnti":Ljava/util/BitSet;
    :cond_22
    :goto_22
    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v18

    .line 603
    .local v18, "propertyType":I
    if-nez v18, :cond_97

    .line 732
    const/4 v15, 0x0

    .line 733
    .local v15, "nonEmptyFileCounter":I
    const/4 v4, 0x0

    .line 734
    .local v4, "emptyFileCounter":I
    const/4 v7, 0x0

    :goto_2b
    array-length v0, v6

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v7, v0, :cond_303

    .line 735
    aget-object v23, v6, v7

    if-nez v10, :cond_2b8

    const/16 v22, 0x1

    :goto_38
    move-object/from16 v0, v23

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setHasStream(Z)V

    .line 736
    aget-object v22, v6, v7

    invoke-virtual/range {v22 .. v22}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasStream()Z

    move-result v22

    if-eqz v22, :cond_2c6

    .line 737
    aget-object v22, v6, v7

    const/16 v23, 0x0

    invoke-virtual/range {v22 .. v23}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setDirectory(Z)V

    .line 738
    aget-object v22, v6, v7

    const/16 v23, 0x0

    invoke-virtual/range {v22 .. v23}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setAntiItem(Z)V

    .line 739
    aget-object v22, v6, v7

    move-object/from16 v0, p2

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->subStreamsInfo:Lorg/apache/commons/compress/archivers/sevenz/SubStreamsInfo;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/SubStreamsInfo;->hasCrc:Ljava/util/BitSet;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v15}, Ljava/util/BitSet;->get(I)Z

    move-result v23

    invoke-virtual/range {v22 .. v23}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setHasCrc(Z)V

    .line 740
    aget-object v22, v6, v7

    move-object/from16 v0, p2

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->subStreamsInfo:Lorg/apache/commons/compress/archivers/sevenz/SubStreamsInfo;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/SubStreamsInfo;->crcs:[J

    move-object/from16 v23, v0

    aget-wide v23, v23, v15

    invoke-virtual/range {v22 .. v24}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setCrcValue(J)V

    .line 741
    aget-object v22, v6, v7

    move-object/from16 v0, p2

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->subStreamsInfo:Lorg/apache/commons/compress/archivers/sevenz/SubStreamsInfo;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/SubStreamsInfo;->unpackSizes:[J

    move-object/from16 v23, v0

    aget-wide v23, v23, v15

    invoke-virtual/range {v22 .. v24}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setSize(J)V

    .line 742
    add-int/lit8 v15, v15, 0x1

    .line 734
    :goto_94
    add-int/lit8 v7, v7, 0x1

    goto :goto_2b

    .line 606
    .end local v4    # "emptyFileCounter":I
    .end local v15    # "nonEmptyFileCounter":I
    :cond_97
    invoke-static/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readUint64(Ljava/io/DataInput;)J

    move-result-wide v19

    .line 607
    .local v19, "size":J
    packed-switch v18, :pswitch_data_310

    .line 725
    :pswitch_9e
    move-object/from16 v0, p1

    move-wide/from16 v1, v19

    invoke-static {v0, v1, v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->skipBytesFully(Ljava/io/DataInput;J)J

    move-result-wide v22

    cmp-long v22, v22, v19

    if-gez v22, :cond_22

    .line 726
    new-instance v22, Ljava/io/IOException;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Incomplete property of type "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 609
    :pswitch_c7
    array-length v0, v6

    move/from16 v22, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readBits(Ljava/io/DataInput;I)Ljava/util/BitSet;

    move-result-object v10

    .line 610
    goto/16 :goto_22

    .line 613
    :pswitch_d6
    if-nez v10, :cond_e0

    .line 614
    new-instance v22, Ljava/io/IOException;

    const-string v23, "Header format error: kEmptyStream must appear before kEmptyFile"

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 616
    :cond_e0
    invoke-virtual {v10}, Ljava/util/BitSet;->cardinality()I

    move-result v22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readBits(Ljava/io/DataInput;I)Ljava/util/BitSet;

    move-result-object v9

    .line 617
    goto/16 :goto_22

    .line 620
    :pswitch_f0
    if-nez v10, :cond_fa

    .line 621
    new-instance v22, Ljava/io/IOException;

    const-string v23, "Header format error: kEmptyStream must appear before kAnti"

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 623
    :cond_fa
    invoke-virtual {v10}, Ljava/util/BitSet;->cardinality()I

    move-result v22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readBits(Ljava/io/DataInput;I)Ljava/util/BitSet;

    move-result-object v8

    .line 624
    goto/16 :goto_22

    .line 627
    :pswitch_10a
    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v5

    .line 628
    .local v5, "external":I
    if-eqz v5, :cond_118

    .line 629
    new-instance v22, Ljava/io/IOException;

    const-string v23, "Not implemented"

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 631
    :cond_118
    const-wide/16 v22, 0x1

    sub-long v22, v19, v22

    const-wide/16 v24, 0x1

    and-long v22, v22, v24

    const-wide/16 v24, 0x0

    cmp-long v22, v22, v24

    if-eqz v22, :cond_12e

    .line 632
    new-instance v22, Ljava/io/IOException;

    const-string v23, "File names length invalid"

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 634
    :cond_12e
    const-wide/16 v22, 0x1

    sub-long v22, v19, v22

    move-wide/from16 v0, v22

    long-to-int v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    new-array v11, v0, [B

    .line 635
    .local v11, "names":[B
    move-object/from16 v0, p1

    invoke-interface {v0, v11}, Ljava/io/DataInput;->readFully([B)V

    .line 636
    const/4 v12, 0x0

    .line 637
    .local v12, "nextFile":I
    const/4 v14, 0x0

    .line 638
    .local v14, "nextName":I
    const/4 v7, 0x0

    :goto_143
    array-length v0, v11

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v7, v0, :cond_170

    .line 639
    aget-byte v22, v11, v7

    if-nez v22, :cond_16d

    add-int/lit8 v22, v7, 0x1

    aget-byte v22, v11, v22

    if-nez v22, :cond_16d

    .line 640
    add-int/lit8 v13, v12, 0x1

    .end local v12    # "nextFile":I
    .local v13, "nextFile":I
    aget-object v22, v6, v12

    new-instance v23, Ljava/lang/String;

    sub-int v24, v7, v14

    const-string v25, "UTF-16LE"

    move-object/from16 v0, v23

    move/from16 v1, v24

    move-object/from16 v2, v25

    invoke-direct {v0, v11, v14, v1, v2}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    invoke-virtual/range {v22 .. v23}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setName(Ljava/lang/String;)V

    .line 641
    add-int/lit8 v14, v7, 0x2

    move v12, v13

    .line 638
    .end local v13    # "nextFile":I
    .restart local v12    # "nextFile":I
    :cond_16d
    add-int/lit8 v7, v7, 0x2

    goto :goto_143

    .line 644
    :cond_170
    array-length v0, v11

    move/from16 v22, v0

    move/from16 v0, v22

    if-ne v14, v0, :cond_17e

    array-length v0, v6

    move/from16 v22, v0

    move/from16 v0, v22

    if-eq v12, v0, :cond_22

    .line 645
    :cond_17e
    new-instance v22, Ljava/io/IOException;

    const-string v23, "Error parsing file names"

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 651
    .end local v5    # "external":I
    .end local v11    # "names":[B
    .end local v12    # "nextFile":I
    .end local v14    # "nextName":I
    :pswitch_186
    array-length v0, v6

    move/from16 v22, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readAllOrBits(Ljava/io/DataInput;I)Ljava/util/BitSet;

    move-result-object v21

    .line 652
    .local v21, "timesDefined":Ljava/util/BitSet;
    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v5

    .line 653
    .restart local v5    # "external":I
    if-eqz v5, :cond_1a1

    .line 654
    new-instance v22, Ljava/io/IOException;

    const-string v23, "Unimplemented"

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 656
    :cond_1a1
    const/4 v7, 0x0

    :goto_1a2
    array-length v0, v6

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v7, v0, :cond_22

    .line 657
    aget-object v22, v6, v7

    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Ljava/util/BitSet;->get(I)Z

    move-result v23

    invoke-virtual/range {v22 .. v23}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setHasCreationDate(Z)V

    .line 658
    aget-object v22, v6, v7

    invoke-virtual/range {v22 .. v22}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getHasCreationDate()Z

    move-result v22

    if-eqz v22, :cond_1c9

    .line 659
    aget-object v22, v6, v7

    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readLong()J

    move-result-wide v23

    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->reverseBytes(J)J

    move-result-wide v23

    invoke-virtual/range {v22 .. v24}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setCreationDate(J)V

    .line 656
    :cond_1c9
    add-int/lit8 v7, v7, 0x1

    goto :goto_1a2

    .line 666
    .end local v5    # "external":I
    .end local v21    # "timesDefined":Ljava/util/BitSet;
    :pswitch_1cc
    array-length v0, v6

    move/from16 v22, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readAllOrBits(Ljava/io/DataInput;I)Ljava/util/BitSet;

    move-result-object v21

    .line 667
    .restart local v21    # "timesDefined":Ljava/util/BitSet;
    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v5

    .line 668
    .restart local v5    # "external":I
    if-eqz v5, :cond_1e7

    .line 669
    new-instance v22, Ljava/io/IOException;

    const-string v23, "Unimplemented"

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 671
    :cond_1e7
    const/4 v7, 0x0

    :goto_1e8
    array-length v0, v6

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v7, v0, :cond_22

    .line 672
    aget-object v22, v6, v7

    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Ljava/util/BitSet;->get(I)Z

    move-result v23

    invoke-virtual/range {v22 .. v23}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setHasAccessDate(Z)V

    .line 673
    aget-object v22, v6, v7

    invoke-virtual/range {v22 .. v22}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getHasAccessDate()Z

    move-result v22

    if-eqz v22, :cond_20f

    .line 674
    aget-object v22, v6, v7

    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readLong()J

    move-result-wide v23

    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->reverseBytes(J)J

    move-result-wide v23

    invoke-virtual/range {v22 .. v24}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setAccessDate(J)V

    .line 671
    :cond_20f
    add-int/lit8 v7, v7, 0x1

    goto :goto_1e8

    .line 681
    .end local v5    # "external":I
    .end local v21    # "timesDefined":Ljava/util/BitSet;
    :pswitch_212
    array-length v0, v6

    move/from16 v22, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readAllOrBits(Ljava/io/DataInput;I)Ljava/util/BitSet;

    move-result-object v21

    .line 682
    .restart local v21    # "timesDefined":Ljava/util/BitSet;
    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v5

    .line 683
    .restart local v5    # "external":I
    if-eqz v5, :cond_22d

    .line 684
    new-instance v22, Ljava/io/IOException;

    const-string v23, "Unimplemented"

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 686
    :cond_22d
    const/4 v7, 0x0

    :goto_22e
    array-length v0, v6

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v7, v0, :cond_22

    .line 687
    aget-object v22, v6, v7

    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Ljava/util/BitSet;->get(I)Z

    move-result v23

    invoke-virtual/range {v22 .. v23}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setHasLastModifiedDate(Z)V

    .line 688
    aget-object v22, v6, v7

    invoke-virtual/range {v22 .. v22}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getHasLastModifiedDate()Z

    move-result v22

    if-eqz v22, :cond_255

    .line 689
    aget-object v22, v6, v7

    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readLong()J

    move-result-wide v23

    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->reverseBytes(J)J

    move-result-wide v23

    invoke-virtual/range {v22 .. v24}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setLastModifiedDate(J)V

    .line 686
    :cond_255
    add-int/lit8 v7, v7, 0x1

    goto :goto_22e

    .line 696
    .end local v5    # "external":I
    .end local v21    # "timesDefined":Ljava/util/BitSet;
    :pswitch_258
    array-length v0, v6

    move/from16 v22, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readAllOrBits(Ljava/io/DataInput;I)Ljava/util/BitSet;

    move-result-object v3

    .line 697
    .local v3, "attributesDefined":Ljava/util/BitSet;
    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v5

    .line 698
    .restart local v5    # "external":I
    if-eqz v5, :cond_273

    .line 699
    new-instance v22, Ljava/io/IOException;

    const-string v23, "Unimplemented"

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 701
    :cond_273
    const/4 v7, 0x0

    :goto_274
    array-length v0, v6

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v7, v0, :cond_22

    .line 702
    aget-object v22, v6, v7

    invoke-virtual {v3, v7}, Ljava/util/BitSet;->get(I)Z

    move-result v23

    invoke-virtual/range {v22 .. v23}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setHasWindowsAttributes(Z)V

    .line 703
    aget-object v22, v6, v7

    invoke-virtual/range {v22 .. v22}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getHasWindowsAttributes()Z

    move-result v22

    if-eqz v22, :cond_299

    .line 704
    aget-object v22, v6, v7

    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readInt()I

    move-result v23

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->reverseBytes(I)I

    move-result v23

    invoke-virtual/range {v22 .. v23}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setWindowsAttributes(I)V

    .line 701
    :cond_299
    add-int/lit8 v7, v7, 0x1

    goto :goto_274

    .line 711
    .end local v3    # "attributesDefined":Ljava/util/BitSet;
    .end local v5    # "external":I
    :pswitch_29c
    new-instance v22, Ljava/io/IOException;

    const-string v23, "kStartPos is unsupported, please report"

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 717
    :pswitch_2a4
    move-object/from16 v0, p1

    move-wide/from16 v1, v19

    invoke-static {v0, v1, v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->skipBytesFully(Ljava/io/DataInput;J)J

    move-result-wide v22

    cmp-long v22, v22, v19

    if-gez v22, :cond_22

    .line 718
    new-instance v22, Ljava/io/IOException;

    const-string v23, "Incomplete kDummy property"

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 735
    .end local v19    # "size":J
    .restart local v4    # "emptyFileCounter":I
    .restart local v15    # "nonEmptyFileCounter":I
    :cond_2b8
    invoke-virtual {v10, v7}, Ljava/util/BitSet;->get(I)Z

    move-result v22

    if-nez v22, :cond_2c2

    const/16 v22, 0x1

    goto/16 :goto_38

    :cond_2c2
    const/16 v22, 0x0

    goto/16 :goto_38

    .line 744
    :cond_2c6
    aget-object v23, v6, v7

    if-nez v9, :cond_2f2

    const/16 v22, 0x1

    :goto_2cc
    move-object/from16 v0, v23

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setDirectory(Z)V

    .line 745
    aget-object v23, v6, v7

    if-nez v8, :cond_2fe

    const/16 v22, 0x0

    :goto_2d9
    move-object/from16 v0, v23

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setAntiItem(Z)V

    .line 746
    aget-object v22, v6, v7

    const/16 v23, 0x0

    invoke-virtual/range {v22 .. v23}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setHasCrc(Z)V

    .line 747
    aget-object v22, v6, v7

    const-wide/16 v23, 0x0

    invoke-virtual/range {v22 .. v24}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->setSize(J)V

    .line 748
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_94

    .line 744
    :cond_2f2
    invoke-virtual {v9, v4}, Ljava/util/BitSet;->get(I)Z

    move-result v22

    if-nez v22, :cond_2fb

    const/16 v22, 0x1

    goto :goto_2cc

    :cond_2fb
    const/16 v22, 0x0

    goto :goto_2cc

    .line 745
    :cond_2fe
    invoke-virtual {v8, v4}, Ljava/util/BitSet;->get(I)Z

    move-result v22

    goto :goto_2d9

    .line 751
    :cond_303
    move-object/from16 v0, p2

    iput-object v6, v0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->files:[Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .line 752
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->calculateStreamMap(Lorg/apache/commons/compress/archivers/sevenz/Archive;)V

    .line 753
    return-void

    .line 607
    nop

    :pswitch_data_310
    .packed-switch 0xe
        :pswitch_c7
        :pswitch_d6
        :pswitch_f0
        :pswitch_10a
        :pswitch_186
        :pswitch_1cc
        :pswitch_212
        :pswitch_258
        :pswitch_9e
        :pswitch_9e
        :pswitch_29c
        :pswitch_2a4
    .end packed-switch
.end method

.method private readFolder(Ljava/io/DataInput;)Lorg/apache/commons/compress/archivers/sevenz/Folder;
    .registers 30
    .param p1, "header"    # Ljava/io/DataInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 485
    new-instance v6, Lorg/apache/commons/compress/archivers/sevenz/Folder;

    invoke-direct {v6}, Lorg/apache/commons/compress/archivers/sevenz/Folder;-><init>()V

    .line 487
    .local v6, "folder":Lorg/apache/commons/compress/archivers/sevenz/Folder;
    invoke-static/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readUint64(Ljava/io/DataInput;)J

    move-result-wide v14

    .line 488
    .local v14, "numCoders":J
    long-to-int v0, v14

    move/from16 v25, v0

    move/from16 v0, v25

    new-array v5, v0, [Lorg/apache/commons/compress/archivers/sevenz/Coder;

    .line 489
    .local v5, "coders":[Lorg/apache/commons/compress/archivers/sevenz/Coder;
    const-wide/16 v21, 0x0

    .line 490
    .local v21, "totalInStreams":J
    const-wide/16 v23, 0x0

    .line 491
    .local v23, "totalOutStreams":J
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_15
    array-length v0, v5

    move/from16 v25, v0

    move/from16 v0, v25

    if-ge v8, v0, :cond_d6

    .line 492
    new-instance v25, Lorg/apache/commons/compress/archivers/sevenz/Coder;

    invoke-direct/range {v25 .. v25}, Lorg/apache/commons/compress/archivers/sevenz/Coder;-><init>()V

    aput-object v25, v5, v8

    .line 493
    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v4

    .line 494
    .local v4, "bits":I
    and-int/lit8 v9, v4, 0xf

    .line 495
    .local v9, "idSize":I
    and-int/lit8 v25, v4, 0x10

    if-nez v25, :cond_b1

    const/4 v10, 0x1

    .line 496
    .local v10, "isSimple":Z
    :goto_2e
    and-int/lit8 v25, v4, 0x20

    if-eqz v25, :cond_b4

    const/4 v7, 0x1

    .line 497
    .local v7, "hasAttributes":Z
    :goto_33
    and-int/lit16 v0, v4, 0x80

    move/from16 v25, v0

    if-eqz v25, :cond_b7

    const/4 v11, 0x1

    .line 499
    .local v11, "moreAlternativeMethods":Z
    :goto_3a
    aget-object v25, v5, v8

    new-array v0, v9, [B

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v25

    iput-object v0, v1, Lorg/apache/commons/compress/archivers/sevenz/Coder;->decompressionMethodId:[B

    .line 500
    aget-object v25, v5, v8

    move-object/from16 v0, v25

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/Coder;->decompressionMethodId:[B

    move-object/from16 v25, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-interface {v0, v1}, Ljava/io/DataInput;->readFully([B)V

    .line 501
    if-eqz v10, :cond_b9

    .line 502
    aget-object v25, v5, v8

    const-wide/16 v26, 0x1

    move-wide/from16 v0, v26

    move-object/from16 v2, v25

    iput-wide v0, v2, Lorg/apache/commons/compress/archivers/sevenz/Coder;->numInStreams:J

    .line 503
    aget-object v25, v5, v8

    const-wide/16 v26, 0x1

    move-wide/from16 v0, v26

    move-object/from16 v2, v25

    iput-wide v0, v2, Lorg/apache/commons/compress/archivers/sevenz/Coder;->numOutStreams:J

    .line 508
    :goto_6b
    aget-object v25, v5, v8

    move-object/from16 v0, v25

    iget-wide v0, v0, Lorg/apache/commons/compress/archivers/sevenz/Coder;->numInStreams:J

    move-wide/from16 v25, v0

    add-long v21, v21, v25

    .line 509
    aget-object v25, v5, v8

    move-object/from16 v0, v25

    iget-wide v0, v0, Lorg/apache/commons/compress/archivers/sevenz/Coder;->numOutStreams:J

    move-wide/from16 v25, v0

    add-long v23, v23, v25

    .line 510
    if-eqz v7, :cond_a7

    .line 511
    invoke-static/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readUint64(Ljava/io/DataInput;)J

    move-result-wide v19

    .line 512
    .local v19, "propertiesSize":J
    aget-object v25, v5, v8

    move-wide/from16 v0, v19

    long-to-int v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    new-array v0, v0, [B

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v25

    iput-object v0, v1, Lorg/apache/commons/compress/archivers/sevenz/Coder;->properties:[B

    .line 513
    aget-object v25, v5, v8

    move-object/from16 v0, v25

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/Coder;->properties:[B

    move-object/from16 v25, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-interface {v0, v1}, Ljava/io/DataInput;->readFully([B)V

    .line 516
    .end local v19    # "propertiesSize":J
    :cond_a7
    if-eqz v11, :cond_d2

    .line 517
    new-instance v25, Ljava/io/IOException;

    const-string v26, "Alternative methods are unsupported, please report. The reference implementation doesn\'t support them either."

    invoke-direct/range {v25 .. v26}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v25

    .line 495
    .end local v7    # "hasAttributes":Z
    .end local v10    # "isSimple":Z
    .end local v11    # "moreAlternativeMethods":Z
    :cond_b1
    const/4 v10, 0x0

    goto/16 :goto_2e

    .line 496
    .restart local v10    # "isSimple":Z
    :cond_b4
    const/4 v7, 0x0

    goto/16 :goto_33

    .line 497
    .restart local v7    # "hasAttributes":Z
    :cond_b7
    const/4 v11, 0x0

    goto :goto_3a

    .line 505
    .restart local v11    # "moreAlternativeMethods":Z
    :cond_b9
    aget-object v25, v5, v8

    invoke-static/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readUint64(Ljava/io/DataInput;)J

    move-result-wide v26

    move-wide/from16 v0, v26

    move-object/from16 v2, v25

    iput-wide v0, v2, Lorg/apache/commons/compress/archivers/sevenz/Coder;->numInStreams:J

    .line 506
    aget-object v25, v5, v8

    invoke-static/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readUint64(Ljava/io/DataInput;)J

    move-result-wide v26

    move-wide/from16 v0, v26

    move-object/from16 v2, v25

    iput-wide v0, v2, Lorg/apache/commons/compress/archivers/sevenz/Coder;->numOutStreams:J

    goto :goto_6b

    .line 491
    :cond_d2
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_15

    .line 521
    .end local v4    # "bits":I
    .end local v7    # "hasAttributes":Z
    .end local v9    # "idSize":I
    .end local v10    # "isSimple":Z
    .end local v11    # "moreAlternativeMethods":Z
    :cond_d6
    iput-object v5, v6, Lorg/apache/commons/compress/archivers/sevenz/Folder;->coders:[Lorg/apache/commons/compress/archivers/sevenz/Coder;

    .line 522
    move-wide/from16 v0, v21

    iput-wide v0, v6, Lorg/apache/commons/compress/archivers/sevenz/Folder;->totalInputStreams:J

    .line 523
    move-wide/from16 v0, v23

    iput-wide v0, v6, Lorg/apache/commons/compress/archivers/sevenz/Folder;->totalOutputStreams:J

    .line 525
    const-wide/16 v25, 0x0

    cmp-long v25, v23, v25

    if-nez v25, :cond_ee

    .line 526
    new-instance v25, Ljava/io/IOException;

    const-string v26, "Total output streams can\'t be 0"

    invoke-direct/range {v25 .. v26}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v25

    .line 528
    :cond_ee
    const-wide/16 v25, 0x1

    sub-long v12, v23, v25

    .line 529
    .local v12, "numBindPairs":J
    long-to-int v0, v12

    move/from16 v25, v0

    move/from16 v0, v25

    new-array v3, v0, [Lorg/apache/commons/compress/archivers/sevenz/BindPair;

    .line 530
    .local v3, "bindPairs":[Lorg/apache/commons/compress/archivers/sevenz/BindPair;
    const/4 v8, 0x0

    :goto_fa
    array-length v0, v3

    move/from16 v25, v0

    move/from16 v0, v25

    if-ge v8, v0, :cond_123

    .line 531
    new-instance v25, Lorg/apache/commons/compress/archivers/sevenz/BindPair;

    invoke-direct/range {v25 .. v25}, Lorg/apache/commons/compress/archivers/sevenz/BindPair;-><init>()V

    aput-object v25, v3, v8

    .line 532
    aget-object v25, v3, v8

    invoke-static/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readUint64(Ljava/io/DataInput;)J

    move-result-wide v26

    move-wide/from16 v0, v26

    move-object/from16 v2, v25

    iput-wide v0, v2, Lorg/apache/commons/compress/archivers/sevenz/BindPair;->inIndex:J

    .line 533
    aget-object v25, v3, v8

    invoke-static/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readUint64(Ljava/io/DataInput;)J

    move-result-wide v26

    move-wide/from16 v0, v26

    move-object/from16 v2, v25

    iput-wide v0, v2, Lorg/apache/commons/compress/archivers/sevenz/BindPair;->outIndex:J

    .line 530
    add-int/lit8 v8, v8, 0x1

    goto :goto_fa

    .line 535
    :cond_123
    iput-object v3, v6, Lorg/apache/commons/compress/archivers/sevenz/Folder;->bindPairs:[Lorg/apache/commons/compress/archivers/sevenz/BindPair;

    .line 537
    cmp-long v25, v21, v12

    if-gez v25, :cond_131

    .line 538
    new-instance v25, Ljava/io/IOException;

    const-string v26, "Total input streams can\'t be less than the number of bind pairs"

    invoke-direct/range {v25 .. v26}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v25

    .line 540
    :cond_131
    sub-long v16, v21, v12

    .line 541
    .local v16, "numPackedStreams":J
    move-wide/from16 v0, v16

    long-to-int v0, v0

    move/from16 v25, v0

    move/from16 v0, v25

    new-array v0, v0, [J

    move-object/from16 v18, v0

    .line 542
    .local v18, "packedStreams":[J
    const-wide/16 v25, 0x1

    cmp-long v25, v16, v25

    if-nez v25, :cond_174

    .line 544
    const/4 v8, 0x0

    :goto_145
    move-wide/from16 v0, v21

    long-to-int v0, v0

    move/from16 v25, v0

    move/from16 v0, v25

    if-ge v8, v0, :cond_154

    .line 545
    invoke-virtual {v6, v8}, Lorg/apache/commons/compress/archivers/sevenz/Folder;->findBindPairForInStream(I)I

    move-result v25

    if-gez v25, :cond_165

    .line 549
    :cond_154
    move-wide/from16 v0, v21

    long-to-int v0, v0

    move/from16 v25, v0

    move/from16 v0, v25

    if-ne v8, v0, :cond_168

    .line 550
    new-instance v25, Ljava/io/IOException;

    const-string v26, "Couldn\'t find stream\'s bind pair index"

    invoke-direct/range {v25 .. v26}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v25

    .line 544
    :cond_165
    add-int/lit8 v8, v8, 0x1

    goto :goto_145

    .line 552
    :cond_168
    const/16 v25, 0x0

    int-to-long v0, v8

    move-wide/from16 v26, v0

    aput-wide v26, v18, v25

    .line 558
    :cond_16f
    move-object/from16 v0, v18

    iput-object v0, v6, Lorg/apache/commons/compress/archivers/sevenz/Folder;->packedStreams:[J

    .line 560
    return-object v6

    .line 554
    :cond_174
    const/4 v8, 0x0

    :goto_175
    move-wide/from16 v0, v16

    long-to-int v0, v0

    move/from16 v25, v0

    move/from16 v0, v25

    if-ge v8, v0, :cond_16f

    .line 555
    invoke-static/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readUint64(Ljava/io/DataInput;)J

    move-result-wide v25

    aput-wide v25, v18, v8

    .line 554
    add-int/lit8 v8, v8, 0x1

    goto :goto_175
.end method

.method private readHeader(Ljava/io/DataInput;Lorg/apache/commons/compress/archivers/sevenz/Archive;)V
    .registers 7
    .param p1, "header"    # Ljava/io/DataInput;
    .param p2, "archive"    # Lorg/apache/commons/compress/archivers/sevenz/Archive;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 226
    invoke-interface {p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 228
    .local v0, "nid":I
    const/4 v1, 0x2

    if-ne v0, v1, :cond_e

    .line 229
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readArchiveProperties(Ljava/io/DataInput;)V

    .line 230
    invoke-interface {p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 233
    :cond_e
    const/4 v1, 0x3

    if-ne v0, v1, :cond_19

    .line 234
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Additional streams unsupported"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 238
    :cond_19
    const/4 v1, 0x4

    if-ne v0, v1, :cond_23

    .line 239
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readStreamsInfo(Ljava/io/DataInput;Lorg/apache/commons/compress/archivers/sevenz/Archive;)V

    .line 240
    invoke-interface {p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 243
    :cond_23
    const/4 v1, 0x5

    if-ne v0, v1, :cond_2d

    .line 244
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readFilesInfo(Ljava/io/DataInput;Lorg/apache/commons/compress/archivers/sevenz/Archive;)V

    .line 245
    invoke-interface {p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 248
    :cond_2d
    if-eqz v0, :cond_48

    .line 249
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Badly terminated header, found "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 251
    :cond_48
    return-void
.end method

.method private readHeaders([B)Lorg/apache/commons/compress/archivers/sevenz/Archive;
    .registers 22
    .param p1, "password"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 158
    const/4 v15, 0x6

    new-array v11, v15, [B

    .line 159
    .local v11, "signature":[B
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v15, v11}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 160
    sget-object v15, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->sevenZSignature:[B

    invoke-static {v11, v15}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v15

    if-nez v15, :cond_1a

    .line 161
    new-instance v15, Ljava/io/IOException;

    const-string v16, "Bad 7z signature"

    invoke-direct/range {v15 .. v16}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 164
    :cond_1a
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v15}, Ljava/io/RandomAccessFile;->readByte()B

    move-result v3

    .line 165
    .local v3, "archiveVersionMajor":B
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v15}, Ljava/io/RandomAccessFile;->readByte()B

    move-result v4

    .line 166
    .local v4, "archiveVersionMinor":B
    if-eqz v3, :cond_50

    .line 167
    new-instance v15, Ljava/io/IOException;

    const-string v16, "Unsupported 7z version (%d,%d)"

    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v19

    aput-object v19, v17, v18

    const/16 v18, 0x1

    invoke-static {v4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v19

    aput-object v19, v17, v18

    invoke-static/range {v16 .. v17}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 171
    :cond_50
    const-wide v15, 0xffffffffL

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->file:Ljava/io/RandomAccessFile;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->reverseBytes(I)I

    move-result v17

    move/from16 v0, v17

    int-to-long v0, v0

    move-wide/from16 v17, v0

    and-long v13, v15, v17

    .line 172
    .local v13, "startHeaderCrc":J
    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readStartHeader(J)Lorg/apache/commons/compress/archivers/sevenz/StartHeader;

    move-result-object v12

    .line 174
    .local v12, "startHeader":Lorg/apache/commons/compress/archivers/sevenz/StartHeader;
    iget-wide v15, v12, Lorg/apache/commons/compress/archivers/sevenz/StartHeader;->nextHeaderSize:J

    long-to-int v9, v15

    .line 175
    .local v9, "nextHeaderSizeInt":I
    int-to-long v15, v9

    iget-wide v0, v12, Lorg/apache/commons/compress/archivers/sevenz/StartHeader;->nextHeaderSize:J

    move-wide/from16 v17, v0

    cmp-long v15, v15, v17

    if-eqz v15, :cond_99

    .line 176
    new-instance v15, Ljava/io/IOException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "cannot handle nextHeaderSize "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    iget-wide v0, v12, Lorg/apache/commons/compress/archivers/sevenz/StartHeader;->nextHeaderSize:J

    move-wide/from16 v17, v0

    invoke-virtual/range {v16 .. v18}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 178
    :cond_99
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->file:Ljava/io/RandomAccessFile;

    const-wide/16 v16, 0x20

    iget-wide v0, v12, Lorg/apache/commons/compress/archivers/sevenz/StartHeader;->nextHeaderOffset:J

    move-wide/from16 v18, v0

    add-long v16, v16, v18

    invoke-virtual/range {v15 .. v17}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 179
    new-array v7, v9, [B

    .line 180
    .local v7, "nextHeader":[B
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v15, v7}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 181
    new-instance v6, Ljava/util/zip/CRC32;

    invoke-direct {v6}, Ljava/util/zip/CRC32;-><init>()V

    .line 182
    .local v6, "crc":Ljava/util/zip/CRC32;
    invoke-virtual {v6, v7}, Ljava/util/zip/CRC32;->update([B)V

    .line 183
    iget-wide v15, v12, Lorg/apache/commons/compress/archivers/sevenz/StartHeader;->nextHeaderCrc:J

    invoke-virtual {v6}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v17

    cmp-long v15, v15, v17

    if-eqz v15, :cond_cb

    .line 184
    new-instance v15, Ljava/io/IOException;

    const-string v16, "NextHeader CRC mismatch"

    invoke-direct/range {v15 .. v16}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 187
    :cond_cb
    new-instance v5, Ljava/io/ByteArrayInputStream;

    invoke-direct {v5, v7}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 188
    .local v5, "byteStream":Ljava/io/ByteArrayInputStream;
    new-instance v8, Ljava/io/DataInputStream;

    invoke-direct {v8, v5}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 190
    .local v8, "nextHeaderInputStream":Ljava/io/DataInputStream;
    new-instance v2, Lorg/apache/commons/compress/archivers/sevenz/Archive;

    invoke-direct {v2}, Lorg/apache/commons/compress/archivers/sevenz/Archive;-><init>()V

    .line 191
    .local v2, "archive":Lorg/apache/commons/compress/archivers/sevenz/Archive;
    invoke-virtual {v8}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v10

    .line 192
    .local v10, "nid":I
    const/16 v15, 0x17

    if-ne v10, v15, :cond_f3

    .line 193
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v8, v2, v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readEncodedHeader(Ljava/io/DataInputStream;Lorg/apache/commons/compress/archivers/sevenz/Archive;[B)Ljava/io/DataInputStream;

    move-result-object v8

    .line 196
    new-instance v2, Lorg/apache/commons/compress/archivers/sevenz/Archive;

    .end local v2    # "archive":Lorg/apache/commons/compress/archivers/sevenz/Archive;
    invoke-direct {v2}, Lorg/apache/commons/compress/archivers/sevenz/Archive;-><init>()V

    .line 197
    .restart local v2    # "archive":Lorg/apache/commons/compress/archivers/sevenz/Archive;
    invoke-virtual {v8}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v10

    .line 199
    :cond_f3
    const/4 v15, 0x1

    if-ne v10, v15, :cond_ff

    .line 200
    move-object/from16 v0, p0

    invoke-direct {v0, v8, v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readHeader(Ljava/io/DataInput;Lorg/apache/commons/compress/archivers/sevenz/Archive;)V

    .line 201
    invoke-virtual {v8}, Ljava/io/DataInputStream;->close()V

    .line 205
    return-object v2

    .line 203
    :cond_ff
    new-instance v15, Ljava/io/IOException;

    const-string v16, "Broken or unsupported archive: no Header"

    invoke-direct/range {v15 .. v16}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15
.end method

.method private readPackInfo(Ljava/io/DataInput;Lorg/apache/commons/compress/archivers/sevenz/Archive;)V
    .registers 12
    .param p1, "header"    # Ljava/io/DataInput;
    .param p2, "archive"    # Lorg/apache/commons/compress/archivers/sevenz/Archive;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 325
    invoke-static {p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readUint64(Ljava/io/DataInput;)J

    move-result-wide v4

    iput-wide v4, p2, Lorg/apache/commons/compress/archivers/sevenz/Archive;->packPos:J

    .line 326
    invoke-static {p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readUint64(Ljava/io/DataInput;)J

    move-result-wide v2

    .line 327
    .local v2, "numPackStreams":J
    invoke-interface {p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1

    .line 328
    .local v1, "nid":I
    const/16 v4, 0x9

    if-ne v1, v4, :cond_2c

    .line 329
    long-to-int v4, v2

    new-array v4, v4, [J

    iput-object v4, p2, Lorg/apache/commons/compress/archivers/sevenz/Archive;->packSizes:[J

    .line 330
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_18
    iget-object v4, p2, Lorg/apache/commons/compress/archivers/sevenz/Archive;->packSizes:[J

    array-length v4, v4

    if-ge v0, v4, :cond_28

    .line 331
    iget-object v4, p2, Lorg/apache/commons/compress/archivers/sevenz/Archive;->packSizes:[J

    invoke-static {p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readUint64(Ljava/io/DataInput;)J

    move-result-wide v5

    aput-wide v5, v4, v0

    .line 330
    add-int/lit8 v0, v0, 0x1

    goto :goto_18

    .line 333
    :cond_28
    invoke-interface {p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1

    .line 336
    .end local v0    # "i":I
    :cond_2c
    const/16 v4, 0xa

    if-ne v1, v4, :cond_62

    .line 337
    long-to-int v4, v2

    invoke-direct {p0, p1, v4}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readAllOrBits(Ljava/io/DataInput;I)Ljava/util/BitSet;

    move-result-object v4

    iput-object v4, p2, Lorg/apache/commons/compress/archivers/sevenz/Archive;->packCrcsDefined:Ljava/util/BitSet;

    .line 338
    long-to-int v4, v2

    new-array v4, v4, [J

    iput-object v4, p2, Lorg/apache/commons/compress/archivers/sevenz/Archive;->packCrcs:[J

    .line 339
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_3d
    long-to-int v4, v2

    if-ge v0, v4, :cond_5e

    .line 340
    iget-object v4, p2, Lorg/apache/commons/compress/archivers/sevenz/Archive;->packCrcsDefined:Ljava/util/BitSet;

    invoke-virtual {v4, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v4

    if-eqz v4, :cond_5b

    .line 341
    iget-object v4, p2, Lorg/apache/commons/compress/archivers/sevenz/Archive;->packCrcs:[J

    const-wide v5, 0xffffffffL

    invoke-interface {p1}, Ljava/io/DataInput;->readInt()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->reverseBytes(I)I

    move-result v7

    int-to-long v7, v7

    and-long/2addr v5, v7

    aput-wide v5, v4, v0

    .line 339
    :cond_5b
    add-int/lit8 v0, v0, 0x1

    goto :goto_3d

    .line 345
    :cond_5e
    invoke-interface {p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v1

    .line 348
    .end local v0    # "i":I
    :cond_62
    if-eqz v1, :cond_83

    .line 349
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Badly terminated PackInfo ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 351
    :cond_83
    return-void
.end method

.method private readStartHeader(J)Lorg/apache/commons/compress/archivers/sevenz/StartHeader;
    .registers 12
    .param p1, "startHeaderCrc"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 209
    new-instance v8, Lorg/apache/commons/compress/archivers/sevenz/StartHeader;

    invoke-direct {v8}, Lorg/apache/commons/compress/archivers/sevenz/StartHeader;-><init>()V

    .line 210
    .local v8, "startHeader":Lorg/apache/commons/compress/archivers/sevenz/StartHeader;
    const/4 v6, 0x0

    .line 212
    .local v6, "dataInputStream":Ljava/io/DataInputStream;
    :try_start_6
    new-instance v7, Ljava/io/DataInputStream;

    new-instance v0, Lorg/apache/commons/compress/utils/CRC32VerifyingInputStream;

    new-instance v1, Lorg/apache/commons/compress/archivers/sevenz/BoundedRandomAccessFileInputStream;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->file:Ljava/io/RandomAccessFile;

    const-wide/16 v3, 0x14

    invoke-direct {v1, v2, v3, v4}, Lorg/apache/commons/compress/archivers/sevenz/BoundedRandomAccessFileInputStream;-><init>(Ljava/io/RandomAccessFile;J)V

    const-wide/16 v2, 0x14

    move-wide v4, p1

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/compress/utils/CRC32VerifyingInputStream;-><init>(Ljava/io/InputStream;JJ)V

    invoke-direct {v7, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1c
    .catchall {:try_start_6 .. :try_end_1c} :catchall_47

    .line 214
    .end local v6    # "dataInputStream":Ljava/io/DataInputStream;
    .local v7, "dataInputStream":Ljava/io/DataInputStream;
    :try_start_1c
    invoke-virtual {v7}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->reverseBytes(J)J

    move-result-wide v0

    iput-wide v0, v8, Lorg/apache/commons/compress/archivers/sevenz/StartHeader;->nextHeaderOffset:J

    .line 215
    invoke-virtual {v7}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->reverseBytes(J)J

    move-result-wide v0

    iput-wide v0, v8, Lorg/apache/commons/compress/archivers/sevenz/StartHeader;->nextHeaderSize:J

    .line 216
    const-wide v0, 0xffffffffL

    invoke-virtual {v7}, Ljava/io/DataInputStream;->readInt()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->reverseBytes(I)I

    move-result v2

    int-to-long v2, v2

    and-long/2addr v0, v2

    iput-wide v0, v8, Lorg/apache/commons/compress/archivers/sevenz/StartHeader;->nextHeaderCrc:J
    :try_end_41
    .catchall {:try_start_1c .. :try_end_41} :catchall_4e

    .line 219
    if-eqz v7, :cond_46

    .line 220
    invoke-virtual {v7}, Ljava/io/DataInputStream;->close()V

    :cond_46
    return-object v8

    .line 219
    .end local v7    # "dataInputStream":Ljava/io/DataInputStream;
    .restart local v6    # "dataInputStream":Ljava/io/DataInputStream;
    :catchall_47
    move-exception v0

    :goto_48
    if-eqz v6, :cond_4d

    .line 220
    invoke-virtual {v6}, Ljava/io/DataInputStream;->close()V

    :cond_4d
    throw v0

    .line 219
    .end local v6    # "dataInputStream":Ljava/io/DataInputStream;
    .restart local v7    # "dataInputStream":Ljava/io/DataInputStream;
    :catchall_4e
    move-exception v0

    move-object v6, v7

    .end local v7    # "dataInputStream":Ljava/io/DataInputStream;
    .restart local v6    # "dataInputStream":Ljava/io/DataInputStream;
    goto :goto_48
.end method

.method private readStreamsInfo(Ljava/io/DataInput;Lorg/apache/commons/compress/archivers/sevenz/Archive;)V
    .registers 6
    .param p1, "header"    # Ljava/io/DataInput;
    .param p2, "archive"    # Lorg/apache/commons/compress/archivers/sevenz/Archive;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 299
    invoke-interface {p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 301
    .local v0, "nid":I
    const/4 v1, 0x6

    if-ne v0, v1, :cond_e

    .line 302
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readPackInfo(Ljava/io/DataInput;Lorg/apache/commons/compress/archivers/sevenz/Archive;)V

    .line 303
    invoke-interface {p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 306
    :cond_e
    const/4 v1, 0x7

    if-ne v0, v1, :cond_2d

    .line 307
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readUnpackInfo(Ljava/io/DataInput;Lorg/apache/commons/compress/archivers/sevenz/Archive;)V

    .line 308
    invoke-interface {p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 314
    :goto_18
    const/16 v1, 0x8

    if-ne v0, v1, :cond_23

    .line 315
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readSubStreamsInfo(Ljava/io/DataInput;Lorg/apache/commons/compress/archivers/sevenz/Archive;)V

    .line 316
    invoke-interface {p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 319
    :cond_23
    if-eqz v0, :cond_33

    .line 320
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Badly terminated StreamsInfo"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 311
    :cond_2d
    const/4 v1, 0x0

    new-array v1, v1, [Lorg/apache/commons/compress/archivers/sevenz/Folder;

    iput-object v1, p2, Lorg/apache/commons/compress/archivers/sevenz/Archive;->folders:[Lorg/apache/commons/compress/archivers/sevenz/Folder;

    goto :goto_18

    .line 322
    :cond_33
    return-void
.end method

.method private readSubStreamsInfo(Ljava/io/DataInput;Lorg/apache/commons/compress/archivers/sevenz/Archive;)V
    .registers 30
    .param p1, "header"    # Ljava/io/DataInput;
    .param p2, "archive"    # Lorg/apache/commons/compress/archivers/sevenz/Archive;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 402
    move-object/from16 v0, p2

    iget-object v2, v0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->folders:[Lorg/apache/commons/compress/archivers/sevenz/Folder;

    .local v2, "arr$":[Lorg/apache/commons/compress/archivers/sevenz/Folder;
    array-length v7, v2

    .local v7, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_6
    if-ge v6, v7, :cond_13

    aget-object v3, v2, v6

    .line 403
    .local v3, "folder":Lorg/apache/commons/compress/archivers/sevenz/Folder;
    const/16 v23, 0x1

    move/from16 v0, v23

    iput v0, v3, Lorg/apache/commons/compress/archivers/sevenz/Folder;->numUnpackSubStreams:I

    .line 402
    add-int/lit8 v6, v6, 0x1

    goto :goto_6

    .line 405
    .end local v3    # "folder":Lorg/apache/commons/compress/archivers/sevenz/Folder;
    :cond_13
    move-object/from16 v0, p2

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->folders:[Lorg/apache/commons/compress/archivers/sevenz/Folder;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    array-length v0, v0

    move/from16 v22, v0

    .line 407
    .local v22, "totalUnpackStreams":I
    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v13

    .line 408
    .local v13, "nid":I
    const/16 v23, 0xd

    move/from16 v0, v23

    if-ne v13, v0, :cond_52

    .line 409
    const/16 v22, 0x0

    .line 410
    move-object/from16 v0, p2

    iget-object v2, v0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->folders:[Lorg/apache/commons/compress/archivers/sevenz/Folder;

    array-length v7, v2

    const/4 v6, 0x0

    :goto_30
    if-ge v6, v7, :cond_4e

    aget-object v3, v2, v6

    .line 411
    .restart local v3    # "folder":Lorg/apache/commons/compress/archivers/sevenz/Folder;
    invoke-static/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readUint64(Ljava/io/DataInput;)J

    move-result-wide v15

    .line 412
    .local v15, "numStreams":J
    long-to-int v0, v15

    move/from16 v23, v0

    move/from16 v0, v23

    iput v0, v3, Lorg/apache/commons/compress/archivers/sevenz/Folder;->numUnpackSubStreams:I

    .line 413
    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v23, v0

    add-long v23, v23, v15

    move-wide/from16 v0, v23

    long-to-int v0, v0

    move/from16 v22, v0

    .line 410
    add-int/lit8 v6, v6, 0x1

    goto :goto_30

    .line 415
    .end local v3    # "folder":Lorg/apache/commons/compress/archivers/sevenz/Folder;
    .end local v15    # "numStreams":J
    :cond_4e
    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v13

    .line 418
    :cond_52
    new-instance v19, Lorg/apache/commons/compress/archivers/sevenz/SubStreamsInfo;

    invoke-direct/range {v19 .. v19}, Lorg/apache/commons/compress/archivers/sevenz/SubStreamsInfo;-><init>()V

    .line 419
    .local v19, "subStreamsInfo":Lorg/apache/commons/compress/archivers/sevenz/SubStreamsInfo;
    move/from16 v0, v22

    new-array v0, v0, [J

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v19

    iput-object v0, v1, Lorg/apache/commons/compress/archivers/sevenz/SubStreamsInfo;->unpackSizes:[J

    .line 420
    new-instance v23, Ljava/util/BitSet;

    move-object/from16 v0, v23

    move/from16 v1, v22

    invoke-direct {v0, v1}, Ljava/util/BitSet;-><init>(I)V

    move-object/from16 v0, v23

    move-object/from16 v1, v19

    iput-object v0, v1, Lorg/apache/commons/compress/archivers/sevenz/SubStreamsInfo;->hasCrc:Ljava/util/BitSet;

    .line 421
    move/from16 v0, v22

    new-array v0, v0, [J

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v19

    iput-object v0, v1, Lorg/apache/commons/compress/archivers/sevenz/SubStreamsInfo;->crcs:[J

    .line 423
    const/4 v11, 0x0

    .line 424
    .local v11, "nextUnpackStream":I
    move-object/from16 v0, p2

    iget-object v2, v0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->folders:[Lorg/apache/commons/compress/archivers/sevenz/Folder;

    array-length v7, v2

    const/4 v6, 0x0

    :goto_85
    if-ge v6, v7, :cond_cb

    aget-object v3, v2, v6

    .line 425
    .restart local v3    # "folder":Lorg/apache/commons/compress/archivers/sevenz/Folder;
    iget v0, v3, Lorg/apache/commons/compress/archivers/sevenz/Folder;->numUnpackSubStreams:I

    move/from16 v23, v0

    if-nez v23, :cond_92

    .line 424
    :goto_8f
    add-int/lit8 v6, v6, 0x1

    goto :goto_85

    .line 428
    :cond_92
    const-wide/16 v20, 0x0

    .line 429
    .local v20, "sum":J
    const/16 v23, 0x9

    move/from16 v0, v23

    if-ne v13, v0, :cond_b9

    .line 430
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_9b
    iget v0, v3, Lorg/apache/commons/compress/archivers/sevenz/Folder;->numUnpackSubStreams:I

    move/from16 v23, v0

    add-int/lit8 v23, v23, -0x1

    move/from16 v0, v23

    if-ge v5, v0, :cond_b9

    .line 431
    invoke-static/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readUint64(Ljava/io/DataInput;)J

    move-result-wide v17

    .line 432
    .local v17, "size":J
    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/SubStreamsInfo;->unpackSizes:[J

    move-object/from16 v23, v0

    add-int/lit8 v12, v11, 0x1

    .end local v11    # "nextUnpackStream":I
    .local v12, "nextUnpackStream":I
    aput-wide v17, v23, v11

    .line 433
    add-long v20, v20, v17

    .line 430
    add-int/lit8 v5, v5, 0x1

    move v11, v12

    .end local v12    # "nextUnpackStream":I
    .restart local v11    # "nextUnpackStream":I
    goto :goto_9b

    .line 436
    .end local v5    # "i":I
    .end local v17    # "size":J
    :cond_b9
    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/SubStreamsInfo;->unpackSizes:[J

    move-object/from16 v23, v0

    add-int/lit8 v12, v11, 0x1

    .end local v11    # "nextUnpackStream":I
    .restart local v12    # "nextUnpackStream":I
    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/sevenz/Folder;->getUnpackSize()J

    move-result-wide v24

    sub-long v24, v24, v20

    aput-wide v24, v23, v11

    move v11, v12

    .end local v12    # "nextUnpackStream":I
    .restart local v11    # "nextUnpackStream":I
    goto :goto_8f

    .line 438
    .end local v3    # "folder":Lorg/apache/commons/compress/archivers/sevenz/Folder;
    .end local v20    # "sum":J
    :cond_cb
    const/16 v23, 0x9

    move/from16 v0, v23

    if-ne v13, v0, :cond_d5

    .line 439
    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v13

    .line 442
    :cond_d5
    const/4 v14, 0x0

    .line 443
    .local v14, "numDigests":I
    move-object/from16 v0, p2

    iget-object v2, v0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->folders:[Lorg/apache/commons/compress/archivers/sevenz/Folder;

    array-length v7, v2

    const/4 v6, 0x0

    :goto_dc
    if-ge v6, v7, :cond_fb

    aget-object v3, v2, v6

    .line 444
    .restart local v3    # "folder":Lorg/apache/commons/compress/archivers/sevenz/Folder;
    iget v0, v3, Lorg/apache/commons/compress/archivers/sevenz/Folder;->numUnpackSubStreams:I

    move/from16 v23, v0

    const/16 v24, 0x1

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_f2

    iget-boolean v0, v3, Lorg/apache/commons/compress/archivers/sevenz/Folder;->hasCrc:Z

    move/from16 v23, v0

    if-nez v23, :cond_f8

    .line 445
    :cond_f2
    iget v0, v3, Lorg/apache/commons/compress/archivers/sevenz/Folder;->numUnpackSubStreams:I

    move/from16 v23, v0

    add-int v14, v14, v23

    .line 443
    :cond_f8
    add-int/lit8 v6, v6, 0x1

    goto :goto_dc

    .line 449
    .end local v3    # "folder":Lorg/apache/commons/compress/archivers/sevenz/Folder;
    :cond_fb
    const/16 v23, 0xa

    move/from16 v0, v23

    if-ne v13, v0, :cond_19a

    .line 450
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v14}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readAllOrBits(Ljava/io/DataInput;I)Ljava/util/BitSet;

    move-result-object v4

    .line 451
    .local v4, "hasMissingCrc":Ljava/util/BitSet;
    new-array v8, v14, [J

    .line 452
    .local v8, "missingCrcs":[J
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_10c
    if-ge v5, v14, :cond_12d

    .line 453
    invoke-virtual {v4, v5}, Ljava/util/BitSet;->get(I)Z

    move-result v23

    if-eqz v23, :cond_12a

    .line 454
    const-wide v23, 0xffffffffL

    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readInt()I

    move-result v25

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->reverseBytes(I)I

    move-result v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    and-long v23, v23, v25

    aput-wide v23, v8, v5

    .line 452
    :cond_12a
    add-int/lit8 v5, v5, 0x1

    goto :goto_10c

    .line 457
    :cond_12d
    const/4 v9, 0x0

    .line 458
    .local v9, "nextCrc":I
    const/4 v10, 0x0

    .line 459
    .local v10, "nextMissingCrc":I
    move-object/from16 v0, p2

    iget-object v2, v0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->folders:[Lorg/apache/commons/compress/archivers/sevenz/Folder;

    array-length v7, v2

    const/4 v6, 0x0

    :goto_135
    if-ge v6, v7, :cond_196

    aget-object v3, v2, v6

    .line 460
    .restart local v3    # "folder":Lorg/apache/commons/compress/archivers/sevenz/Folder;
    iget v0, v3, Lorg/apache/commons/compress/archivers/sevenz/Folder;->numUnpackSubStreams:I

    move/from16 v23, v0

    const/16 v24, 0x1

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_16b

    iget-boolean v0, v3, Lorg/apache/commons/compress/archivers/sevenz/Folder;->hasCrc:Z

    move/from16 v23, v0

    if-eqz v23, :cond_16b

    .line 461
    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/SubStreamsInfo;->hasCrc:Ljava/util/BitSet;

    move-object/from16 v23, v0

    const/16 v24, 0x1

    move-object/from16 v0, v23

    move/from16 v1, v24

    invoke-virtual {v0, v9, v1}, Ljava/util/BitSet;->set(IZ)V

    .line 462
    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/SubStreamsInfo;->crcs:[J

    move-object/from16 v23, v0

    iget-wide v0, v3, Lorg/apache/commons/compress/archivers/sevenz/Folder;->crc:J

    move-wide/from16 v24, v0

    aput-wide v24, v23, v9

    .line 463
    add-int/lit8 v9, v9, 0x1

    .line 459
    :cond_168
    add-int/lit8 v6, v6, 0x1

    goto :goto_135

    .line 465
    :cond_16b
    const/4 v5, 0x0

    :goto_16c
    iget v0, v3, Lorg/apache/commons/compress/archivers/sevenz/Folder;->numUnpackSubStreams:I

    move/from16 v23, v0

    move/from16 v0, v23

    if-ge v5, v0, :cond_168

    .line 466
    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/SubStreamsInfo;->hasCrc:Ljava/util/BitSet;

    move-object/from16 v23, v0

    invoke-virtual {v4, v10}, Ljava/util/BitSet;->get(I)Z

    move-result v24

    move-object/from16 v0, v23

    move/from16 v1, v24

    invoke-virtual {v0, v9, v1}, Ljava/util/BitSet;->set(IZ)V

    .line 467
    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/SubStreamsInfo;->crcs:[J

    move-object/from16 v23, v0

    aget-wide v24, v8, v10

    aput-wide v24, v23, v9

    .line 468
    add-int/lit8 v9, v9, 0x1

    .line 469
    add-int/lit8 v10, v10, 0x1

    .line 465
    add-int/lit8 v5, v5, 0x1

    goto :goto_16c

    .line 474
    .end local v3    # "folder":Lorg/apache/commons/compress/archivers/sevenz/Folder;
    :cond_196
    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v13

    .line 477
    .end local v4    # "hasMissingCrc":Ljava/util/BitSet;
    .end local v5    # "i":I
    .end local v8    # "missingCrcs":[J
    .end local v9    # "nextCrc":I
    .end local v10    # "nextMissingCrc":I
    :cond_19a
    if-eqz v13, :cond_1a4

    .line 478
    new-instance v23, Ljava/io/IOException;

    const-string v24, "Badly terminated SubStreamsInfo"

    invoke-direct/range {v23 .. v24}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v23

    .line 481
    :cond_1a4
    move-object/from16 v0, v19

    move-object/from16 v1, p2

    iput-object v0, v1, Lorg/apache/commons/compress/archivers/sevenz/Archive;->subStreamsInfo:Lorg/apache/commons/compress/archivers/sevenz/SubStreamsInfo;

    .line 482
    return-void
.end method

.method private static readUint64(Ljava/io/DataInput;)J
    .registers 13
    .param p0, "in"    # Ljava/io/DataInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 923
    invoke-interface {p0}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v8

    int-to-long v0, v8

    .line 924
    .local v0, "firstByte":J
    const/16 v3, 0x80

    .line 925
    .local v3, "mask":I
    const-wide/16 v6, 0x0

    .line 926
    .local v6, "value":J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_a
    const/16 v8, 0x8

    if-ge v2, v8, :cond_1e

    .line 927
    int-to-long v8, v3

    and-long/2addr v8, v0

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-nez v8, :cond_1f

    .line 928
    add-int/lit8 v8, v3, -0x1

    int-to-long v8, v8

    and-long/2addr v8, v0

    mul-int/lit8 v10, v2, 0x8

    shl-long/2addr v8, v10

    or-long/2addr v6, v8

    .line 934
    .end local v6    # "value":J
    :cond_1e
    return-wide v6

    .line 930
    .restart local v6    # "value":J
    :cond_1f
    invoke-interface {p0}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v8

    int-to-long v4, v8

    .line 931
    .local v4, "nextByte":J
    mul-int/lit8 v8, v2, 0x8

    shl-long v8, v4, v8

    or-long/2addr v6, v8

    .line 932
    ushr-int/lit8 v3, v3, 0x1

    .line 926
    add-int/lit8 v2, v2, 0x1

    goto :goto_a
.end method

.method private readUnpackInfo(Ljava/io/DataInput;Lorg/apache/commons/compress/archivers/sevenz/Archive;)V
    .registers 21
    .param p1, "header"    # Ljava/io/DataInput;
    .param p2, "archive"    # Lorg/apache/commons/compress/archivers/sevenz/Archive;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 354
    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v10

    .line 355
    .local v10, "nid":I
    const/16 v13, 0xb

    if-eq v10, v13, :cond_21

    .line 356
    new-instance v13, Ljava/io/IOException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Expected kFolder, got "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 358
    :cond_21
    invoke-static/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readUint64(Ljava/io/DataInput;)J

    move-result-wide v11

    .line 359
    .local v11, "numFolders":J
    long-to-int v13, v11

    new-array v6, v13, [Lorg/apache/commons/compress/archivers/sevenz/Folder;

    .line 360
    .local v6, "folders":[Lorg/apache/commons/compress/archivers/sevenz/Folder;
    move-object/from16 v0, p2

    iput-object v6, v0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->folders:[Lorg/apache/commons/compress/archivers/sevenz/Folder;

    .line 361
    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v4

    .line 362
    .local v4, "external":I
    if-eqz v4, :cond_3a

    .line 363
    new-instance v13, Ljava/io/IOException;

    const-string v14, "External unsupported"

    invoke-direct {v13, v14}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 365
    :cond_3a
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_3b
    long-to-int v13, v11

    if-ge v7, v13, :cond_47

    .line 366
    invoke-direct/range {p0 .. p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readFolder(Ljava/io/DataInput;)Lorg/apache/commons/compress/archivers/sevenz/Folder;

    move-result-object v13

    aput-object v13, v6, v7

    .line 365
    add-int/lit8 v7, v7, 0x1

    goto :goto_3b

    .line 370
    :cond_47
    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v10

    .line 371
    const/16 v13, 0xc

    if-eq v10, v13, :cond_68

    .line 372
    new-instance v13, Ljava/io/IOException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Expected kCodersUnpackSize, got "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 374
    :cond_68
    move-object v2, v6

    .local v2, "arr$":[Lorg/apache/commons/compress/archivers/sevenz/Folder;
    array-length v9, v2

    .local v9, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_6b
    if-ge v8, v9, :cond_8c

    aget-object v5, v2, v8

    .line 375
    .local v5, "folder":Lorg/apache/commons/compress/archivers/sevenz/Folder;
    iget-wide v13, v5, Lorg/apache/commons/compress/archivers/sevenz/Folder;->totalOutputStreams:J

    long-to-int v13, v13

    new-array v13, v13, [J

    iput-object v13, v5, Lorg/apache/commons/compress/archivers/sevenz/Folder;->unpackSizes:[J

    .line 376
    const/4 v7, 0x0

    :goto_77
    int-to-long v13, v7

    iget-wide v15, v5, Lorg/apache/commons/compress/archivers/sevenz/Folder;->totalOutputStreams:J

    cmp-long v13, v13, v15

    if-gez v13, :cond_89

    .line 377
    iget-object v13, v5, Lorg/apache/commons/compress/archivers/sevenz/Folder;->unpackSizes:[J

    invoke-static/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readUint64(Ljava/io/DataInput;)J

    move-result-wide v14

    aput-wide v14, v13, v7

    .line 376
    add-int/lit8 v7, v7, 0x1

    goto :goto_77

    .line 374
    :cond_89
    add-int/lit8 v8, v8, 0x1

    goto :goto_6b

    .line 381
    .end local v5    # "folder":Lorg/apache/commons/compress/archivers/sevenz/Folder;
    :cond_8c
    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v10

    .line 382
    const/16 v13, 0xa

    if-ne v10, v13, :cond_d1

    .line 383
    long-to-int v13, v11

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v13}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->readAllOrBits(Ljava/io/DataInput;I)Ljava/util/BitSet;

    move-result-object v3

    .line 384
    .local v3, "crcsDefined":Ljava/util/BitSet;
    const/4 v7, 0x0

    :goto_9e
    long-to-int v13, v11

    if-ge v7, v13, :cond_cd

    .line 385
    invoke-virtual {v3, v7}, Ljava/util/BitSet;->get(I)Z

    move-result v13

    if-eqz v13, :cond_c7

    .line 386
    aget-object v13, v6, v7

    const/4 v14, 0x1

    iput-boolean v14, v13, Lorg/apache/commons/compress/archivers/sevenz/Folder;->hasCrc:Z

    .line 387
    aget-object v13, v6, v7

    const-wide v14, 0xffffffffL

    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readInt()I

    move-result v16

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->reverseBytes(I)I

    move-result v16

    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v16, v0

    and-long v14, v14, v16

    iput-wide v14, v13, Lorg/apache/commons/compress/archivers/sevenz/Folder;->crc:J

    .line 384
    :goto_c4
    add-int/lit8 v7, v7, 0x1

    goto :goto_9e

    .line 389
    :cond_c7
    aget-object v13, v6, v7

    const/4 v14, 0x0

    iput-boolean v14, v13, Lorg/apache/commons/compress/archivers/sevenz/Folder;->hasCrc:Z

    goto :goto_c4

    .line 393
    :cond_cd
    invoke-interface/range {p1 .. p1}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v10

    .line 396
    .end local v3    # "crcsDefined":Ljava/util/BitSet;
    :cond_d1
    if-eqz v10, :cond_db

    .line 397
    new-instance v13, Ljava/io/IOException;

    const-string v14, "Badly terminated UnpackInfo"

    invoke-direct {v13, v14}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 399
    :cond_db
    return-void
.end method

.method private static skipBytesFully(Ljava/io/DataInput;J)J
    .registers 13
    .param p0, "input"    # Ljava/io/DataInput;
    .param p1, "bytesToSkip"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/32 v8, 0x7fffffff

    const-wide/16 v4, 0x0

    .line 961
    const-wide/16 v6, 0x1

    cmp-long v6, p1, v6

    if-gez v6, :cond_d

    move-wide v0, v4

    .line 981
    :cond_c
    :goto_c
    return-wide v0

    .line 964
    :cond_d
    const-wide/16 v0, 0x0

    .line 965
    .local v0, "skipped":J
    :goto_f
    cmp-long v6, p1, v8

    if-lez v6, :cond_22

    .line 966
    invoke-static {p0, v8, v9}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->skipBytesFully(Ljava/io/DataInput;J)J

    move-result-wide v2

    .line 967
    .local v2, "skippedNow":J
    cmp-long v6, v2, v4

    if-eqz v6, :cond_c

    .line 970
    add-long/2addr v0, v2

    .line 971
    sub-long/2addr p1, v2

    .line 972
    goto :goto_f

    .line 978
    .local v2, "skippedNow":I
    :cond_1e
    int-to-long v6, v2

    add-long/2addr v0, v6

    .line 979
    int-to-long v6, v2

    sub-long/2addr p1, v6

    .line 973
    .end local v2    # "skippedNow":I
    :cond_22
    cmp-long v6, p1, v4

    if-lez v6, :cond_c

    .line 974
    long-to-int v6, p1

    invoke-interface {p0, v6}, Ljava/io/DataInput;->skipBytes(I)I

    move-result v2

    .line 975
    .restart local v2    # "skippedNow":I
    if-nez v2, :cond_1e

    goto :goto_c
.end method


# virtual methods
.method public close()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 127
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->file:Ljava/io/RandomAccessFile;

    if-eqz v0, :cond_18

    .line 129
    :try_start_6
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V
    :try_end_b
    .catchall {:try_start_6 .. :try_end_b} :catchall_19

    .line 131
    iput-object v2, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->file:Ljava/io/RandomAccessFile;

    .line 132
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->password:[B

    if-eqz v0, :cond_16

    .line 133
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->password:[B

    invoke-static {v0, v3}, Ljava/util/Arrays;->fill([BB)V

    .line 135
    :cond_16
    iput-object v2, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->password:[B

    .line 138
    :cond_18
    return-void

    .line 131
    :catchall_19
    move-exception v0

    iput-object v2, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->file:Ljava/io/RandomAccessFile;

    .line 132
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->password:[B

    if-eqz v1, :cond_25

    .line 133
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->password:[B

    invoke-static {v1, v3}, Ljava/util/Arrays;->fill([BB)V

    .line 135
    :cond_25
    iput-object v2, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->password:[B

    throw v0
.end method

.method public getNextEntry()Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 148
    iget v1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentEntryIndex:I

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->archive:Lorg/apache/commons/compress/archivers/sevenz/Archive;

    iget-object v2, v2, Lorg/apache/commons/compress/archivers/sevenz/Archive;->files:[Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    if-lt v1, v2, :cond_d

    .line 149
    const/4 v0, 0x0

    .line 154
    :goto_c
    return-object v0

    .line 151
    :cond_d
    iget v1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentEntryIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentEntryIndex:I

    .line 152
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->archive:Lorg/apache/commons/compress/archivers/sevenz/Archive;

    iget-object v1, v1, Lorg/apache/commons/compress/archivers/sevenz/Archive;->files:[Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    iget v2, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentEntryIndex:I

    aget-object v0, v1, v2

    .line 153
    .local v0, "entry":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->buildDecodingStream()V

    goto :goto_c
.end method

.method public read()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 886
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentEntryInputStream:Ljava/io/InputStream;

    if-nez v0, :cond_c

    .line 887
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No current 7z entry"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 889
    :cond_c
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentEntryInputStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    return v0
.end method

.method public read([B)I
    .registers 4
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 901
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
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
    .line 915
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentEntryInputStream:Ljava/io/InputStream;

    if-nez v0, :cond_c

    .line 916
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No current 7z entry"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 918
    :cond_c
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->currentEntryInputStream:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    return v0
.end method
