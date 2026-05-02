.class public Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;
.super Ljava/lang/Object;
.source "ScatterZipOutputStream.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream$CompressedEntry;
    }
.end annotation


# instance fields
.field private final backingStore:Lorg/apache/commons/compress/parallel/ScatterGatherBackingStore;

.field private final items:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream$CompressedEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;


# direct methods
.method public constructor <init>(Lorg/apache/commons/compress/parallel/ScatterGatherBackingStore;Lorg/apache/commons/compress/archivers/zip/StreamCompressor;)V
    .registers 4
    .param p1, "backingStore"    # Lorg/apache/commons/compress/parallel/ScatterGatherBackingStore;
    .param p2, "streamCompressor"    # Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;->items:Ljava/util/Queue;

    .line 84
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;->backingStore:Lorg/apache/commons/compress/parallel/ScatterGatherBackingStore;

    .line 85
    iput-object p2, p0, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    .line 86
    return-void
.end method

.method public static fileBased(Ljava/io/File;)Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;
    .registers 2
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 139
    const/4 v0, -0x1

    invoke-static {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;->fileBased(Ljava/io/File;I)Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;

    move-result-object v0

    return-object v0
.end method

.method public static fileBased(Ljava/io/File;I)Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;
    .registers 5
    .param p0, "file"    # Ljava/io/File;
    .param p1, "compressionLevel"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 151
    new-instance v0, Lorg/apache/commons/compress/parallel/FileBasedScatterGatherBackingStore;

    invoke-direct {v0, p0}, Lorg/apache/commons/compress/parallel/FileBasedScatterGatherBackingStore;-><init>(Ljava/io/File;)V

    .line 152
    .local v0, "bs":Lorg/apache/commons/compress/parallel/ScatterGatherBackingStore;
    invoke-static {p1, v0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->create(ILorg/apache/commons/compress/parallel/ScatterGatherBackingStore;)Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    move-result-object v1

    .line 153
    .local v1, "sc":Lorg/apache/commons/compress/archivers/zip/StreamCompressor;
    new-instance v2, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;

    invoke-direct {v2, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;-><init>(Lorg/apache/commons/compress/parallel/ScatterGatherBackingStore;Lorg/apache/commons/compress/archivers/zip/StreamCompressor;)V

    return-object v2
.end method


# virtual methods
.method public addArchiveEntry(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntryRequest;)V
    .registers 12
    .param p1, "zipArchiveEntryRequest"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntryRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntryRequest;->getPayloadStream()Ljava/io/InputStream;

    move-result-object v8

    .line 97
    .local v8, "payloadStream":Ljava/io/InputStream;
    :try_start_4
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntryRequest;->getMethod()I

    move-result v1

    invoke-virtual {v0, v8, v1}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->deflate(Ljava/io/InputStream;I)V
    :try_end_d
    .catchall {:try_start_4 .. :try_end_d} :catchall_2e

    .line 99
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V

    .line 101
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;->items:Ljava/util/Queue;

    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream$CompressedEntry;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->getCrc32()J

    move-result-wide v2

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->getBytesWrittenForLastEntry()J

    move-result-wide v4

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;->streamCompressor:Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->getBytesRead()J

    move-result-wide v6

    move-object v1, p1

    invoke-direct/range {v0 .. v7}, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream$CompressedEntry;-><init>(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntryRequest;JJJ)V

    invoke-interface {v9, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 103
    return-void

    .line 99
    :catchall_2e
    move-exception v0

    invoke-virtual {v8}, Ljava/io/InputStream;->close()V

    throw v0
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;->backingStore:Lorg/apache/commons/compress/parallel/ScatterGatherBackingStore;

    invoke-interface {v0}, Lorg/apache/commons/compress/parallel/ScatterGatherBackingStore;->close()V

    .line 129
    return-void
.end method

.method public writeTo(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;)V
    .registers 8
    .param p1, "target"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;->backingStore:Lorg/apache/commons/compress/parallel/ScatterGatherBackingStore;

    invoke-interface {v4}, Lorg/apache/commons/compress/parallel/ScatterGatherBackingStore;->closeForWriting()V

    .line 113
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;->backingStore:Lorg/apache/commons/compress/parallel/ScatterGatherBackingStore;

    invoke-interface {v4}, Lorg/apache/commons/compress/parallel/ScatterGatherBackingStore;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 114
    .local v1, "data":Ljava/io/InputStream;
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;->items:Ljava/util/Queue;

    invoke-interface {v4}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream$CompressedEntry;

    .line 115
    .local v0, "compressedEntry":Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream$CompressedEntry;
    new-instance v3, Lorg/apache/commons/compress/utils/BoundedInputStream;

    iget-wide v4, v0, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream$CompressedEntry;->compressedSize:J

    invoke-direct {v3, v1, v4, v5}, Lorg/apache/commons/compress/utils/BoundedInputStream;-><init>(Ljava/io/InputStream;J)V

    .line 116
    .local v3, "rawStream":Lorg/apache/commons/compress/utils/BoundedInputStream;
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream$CompressedEntry;->transferToArchiveEntry()Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    move-result-object v4

    invoke-virtual {p1, v4, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->addRawArchiveEntry(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Ljava/io/InputStream;)V

    .line 117
    invoke-virtual {v3}, Lorg/apache/commons/compress/utils/BoundedInputStream;->close()V

    goto :goto_11

    .line 119
    .end local v0    # "compressedEntry":Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream$CompressedEntry;
    .end local v3    # "rawStream":Lorg/apache/commons/compress/utils/BoundedInputStream;
    :cond_2f
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 120
    return-void
.end method
