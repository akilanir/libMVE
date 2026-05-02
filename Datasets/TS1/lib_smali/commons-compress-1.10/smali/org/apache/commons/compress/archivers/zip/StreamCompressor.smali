.class public abstract Lorg/apache/commons/compress/archivers/zip/StreamCompressor;
.super Ljava/lang/Object;
.source "StreamCompressor.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/compress/archivers/zip/StreamCompressor$DataOutputCompressor;,
        Lorg/apache/commons/compress/archivers/zip/StreamCompressor$OutputStreamCompressor;,
        Lorg/apache/commons/compress/archivers/zip/StreamCompressor$ScatterGatherBackingStoreCompressor;
    }
.end annotation


# static fields
.field private static final DEFLATER_BLOCK_SIZE:I = 0x2000

.field private static final bufferSize:I = 0x1000


# instance fields
.field private final crc:Ljava/util/zip/CRC32;

.field private final def:Ljava/util/zip/Deflater;

.field private final outputBuffer:[B

.field private final readerBuf:[B

.field private sourcePayloadLength:J

.field private totalWrittenToOutputStream:J

.field private writtenToOutputStreamForLastEntry:J


# direct methods
.method constructor <init>(Ljava/util/zip/Deflater;)V
    .registers 6
    .param p1, "deflater"    # Ljava/util/zip/Deflater;

    .prologue
    const/16 v3, 0x1000

    const-wide/16 v1, 0x0

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->crc:Ljava/util/zip/CRC32;

    .line 52
    iput-wide v1, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->writtenToOutputStreamForLastEntry:J

    .line 53
    iput-wide v1, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->sourcePayloadLength:J

    .line 54
    iput-wide v1, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->totalWrittenToOutputStream:J

    .line 57
    new-array v0, v3, [B

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->outputBuffer:[B

    .line 58
    new-array v0, v3, [B

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->readerBuf:[B

    .line 61
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->def:Ljava/util/zip/Deflater;

    .line 62
    return-void
.end method

.method public static create(ILorg/apache/commons/compress/parallel/ScatterGatherBackingStore;)Lorg/apache/commons/compress/archivers/zip/StreamCompressor;
    .registers 4
    .param p0, "compressionLevel"    # I
    .param p1, "bs"    # Lorg/apache/commons/compress/parallel/ScatterGatherBackingStore;

    .prologue
    .line 104
    new-instance v0, Ljava/util/zip/Deflater;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Ljava/util/zip/Deflater;-><init>(IZ)V

    .line 105
    .local v0, "deflater":Ljava/util/zip/Deflater;
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/StreamCompressor$ScatterGatherBackingStoreCompressor;

    invoke-direct {v1, v0, p1}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor$ScatterGatherBackingStoreCompressor;-><init>(Ljava/util/zip/Deflater;Lorg/apache/commons/compress/parallel/ScatterGatherBackingStore;)V

    return-object v1
.end method

.method static create(Ljava/io/DataOutput;Ljava/util/zip/Deflater;)Lorg/apache/commons/compress/archivers/zip/StreamCompressor;
    .registers 3
    .param p0, "os"    # Ljava/io/DataOutput;
    .param p1, "deflater"    # Ljava/util/zip/Deflater;

    .prologue
    .line 93
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor$DataOutputCompressor;

    invoke-direct {v0, p1, p0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor$DataOutputCompressor;-><init>(Ljava/util/zip/Deflater;Ljava/io/DataOutput;)V

    return-object v0
.end method

.method static create(Ljava/io/OutputStream;)Lorg/apache/commons/compress/archivers/zip/StreamCompressor;
    .registers 4
    .param p0, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 82
    new-instance v0, Ljava/util/zip/Deflater;

    const/4 v1, -0x1

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Ljava/util/zip/Deflater;-><init>(IZ)V

    invoke-static {p0, v0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->create(Ljava/io/OutputStream;Ljava/util/zip/Deflater;)Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    move-result-object v0

    return-object v0
.end method

.method static create(Ljava/io/OutputStream;Ljava/util/zip/Deflater;)Lorg/apache/commons/compress/archivers/zip/StreamCompressor;
    .registers 3
    .param p0, "os"    # Ljava/io/OutputStream;
    .param p1, "deflater"    # Ljava/util/zip/Deflater;

    .prologue
    .line 72
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor$OutputStreamCompressor;

    invoke-direct {v0, p1, p0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor$OutputStreamCompressor;-><init>(Ljava/util/zip/Deflater;Ljava/io/OutputStream;)V

    return-object v0
.end method

.method public static create(Lorg/apache/commons/compress/parallel/ScatterGatherBackingStore;)Lorg/apache/commons/compress/archivers/zip/StreamCompressor;
    .registers 2
    .param p0, "bs"    # Lorg/apache/commons/compress/parallel/ScatterGatherBackingStore;

    .prologue
    .line 115
    const/4 v0, -0x1

    invoke-static {v0, p0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->create(ILorg/apache/commons/compress/parallel/ScatterGatherBackingStore;)Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    move-result-object v0

    return-object v0
.end method

.method private deflateUntilInputIsNeeded()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 240
    :goto_0
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->needsInput()Z

    move-result v0

    if-nez v0, :cond_c

    .line 241
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->deflate()V

    goto :goto_0

    .line 243
    :cond_c
    return-void
.end method

.method private writeDeflated([BII)V
    .registers 10
    .param p1, "b"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x2000

    .line 219
    if-lez p3, :cond_16

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v3}, Ljava/util/zip/Deflater;->finished()Z

    move-result v3

    if-nez v3, :cond_16

    .line 220
    if-gt p3, v5, :cond_17

    .line 221
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v3, p1, p2, p3}, Ljava/util/zip/Deflater;->setInput([BII)V

    .line 222
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->deflateUntilInputIsNeeded()V

    .line 237
    :cond_16
    :goto_16
    return-void

    .line 224
    :cond_17
    div-int/lit16 v1, p3, 0x2000

    .line 225
    .local v1, "fullblocks":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1a
    if-ge v2, v1, :cond_2a

    .line 226
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->def:Ljava/util/zip/Deflater;

    mul-int/lit16 v4, v2, 0x2000

    add-int/2addr v4, p2

    invoke-virtual {v3, p1, v4, v5}, Ljava/util/zip/Deflater;->setInput([BII)V

    .line 228
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->deflateUntilInputIsNeeded()V

    .line 225
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 230
    :cond_2a
    mul-int/lit16 v0, v1, 0x2000

    .line 231
    .local v0, "done":I
    if-ge v0, p3, :cond_16

    .line 232
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->def:Ljava/util/zip/Deflater;

    add-int v4, p2, v0

    sub-int v5, p3, v0

    invoke-virtual {v3, p1, v4, v5}, Ljava/util/zip/Deflater;->setInput([BII)V

    .line 233
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->deflateUntilInputIsNeeded()V

    goto :goto_16
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
    .line 207
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->end()V

    .line 208
    return-void
.end method

.method deflate()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 246
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->def:Ljava/util/zip/Deflater;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->outputBuffer:[B

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->outputBuffer:[B

    array-length v3, v3

    invoke-virtual {v1, v2, v4, v3}, Ljava/util/zip/Deflater;->deflate([BII)I

    move-result v0

    .line 247
    .local v0, "len":I
    if-lez v0, :cond_13

    .line 248
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->outputBuffer:[B

    invoke-virtual {p0, v1, v4, v0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->writeCounted([BII)V

    .line 250
    :cond_13
    return-void
.end method

.method public deflate(Ljava/io/InputStream;I)V
    .registers 7
    .param p1, "source"    # Ljava/io/InputStream;
    .param p2, "method"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 165
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->reset()V

    .line 168
    :goto_4
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->readerBuf:[B

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->readerBuf:[B

    array-length v2, v2

    invoke-virtual {p1, v1, v3, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .local v0, "length":I
    if-ltz v0, :cond_15

    .line 169
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->readerBuf:[B

    invoke-virtual {p0, v1, v3, v0, p2}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->write([BIII)J

    goto :goto_4

    .line 171
    :cond_15
    const/16 v1, 0x8

    if-ne p2, v1, :cond_1c

    .line 172
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->flushDeflater()V

    .line 174
    :cond_1c
    return-void
.end method

.method flushDeflater()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 211
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->finish()V

    .line 212
    :goto_5
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->finished()Z

    move-result v0

    if-nez v0, :cond_11

    .line 213
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->deflate()V

    goto :goto_5

    .line 215
    :cond_11
    return-void
.end method

.method public getBytesRead()J
    .registers 3

    .prologue
    .line 134
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->sourcePayloadLength:J

    return-wide v0
.end method

.method public getBytesWrittenForLastEntry()J
    .registers 3

    .prologue
    .line 143
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->writtenToOutputStreamForLastEntry:J

    return-wide v0
.end method

.method public getCrc32()J
    .registers 3

    .prologue
    .line 125
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public getTotalBytesWritten()J
    .registers 3

    .prologue
    .line 152
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->totalWrittenToOutputStream:J

    return-wide v0
.end method

.method reset()V
    .registers 4

    .prologue
    const-wide/16 v1, 0x0

    .line 200
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->reset()V

    .line 201
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->reset()V

    .line 202
    iput-wide v1, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->sourcePayloadLength:J

    .line 203
    iput-wide v1, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->writtenToOutputStreamForLastEntry:J

    .line 204
    return-void
.end method

.method write([BIII)J
    .registers 11
    .param p1, "b"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .param p4, "method"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 187
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->writtenToOutputStreamForLastEntry:J

    .line 188
    .local v0, "current":J
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v2, p1, p2, p3}, Ljava/util/zip/CRC32;->update([BII)V

    .line 189
    const/16 v2, 0x8

    if-ne p4, v2, :cond_18

    .line 190
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->writeDeflated([BII)V

    .line 194
    :goto_e
    iget-wide v2, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->sourcePayloadLength:J

    int-to-long v4, p3

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->sourcePayloadLength:J

    .line 195
    iget-wide v2, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->writtenToOutputStreamForLastEntry:J

    sub-long/2addr v2, v0

    return-wide v2

    .line 192
    :cond_18
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->writeCounted([BII)V

    goto :goto_e
.end method

.method public writeCounted([B)V
    .registers 4
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 253
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->writeCounted([BII)V

    .line 254
    return-void
.end method

.method public writeCounted([BII)V
    .registers 8
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 257
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->writeOut([BII)V

    .line 258
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->writtenToOutputStreamForLastEntry:J

    int-to-long v2, p3

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->writtenToOutputStreamForLastEntry:J

    .line 259
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->totalWrittenToOutputStream:J

    int-to-long v2, p3

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->totalWrittenToOutputStream:J

    .line 260
    return-void
.end method

.method protected abstract writeOut([BII)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
