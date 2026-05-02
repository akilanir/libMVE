.class public Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;
.super Ljava/io/InputStream;
.source "ChecksumVerifyingInputStream.java"


# instance fields
.field private bytesRemaining:J

.field private final checksum:Ljava/util/zip/Checksum;

.field private final expectedChecksum:J

.field private final in:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/util/zip/Checksum;Ljava/io/InputStream;JJ)V
    .registers 7
    .param p1, "checksum"    # Ljava/util/zip/Checksum;
    .param p2, "in"    # Ljava/io/InputStream;
    .param p3, "size"    # J
    .param p5, "expectedChecksum"    # J

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 38
    iput-object p1, p0, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->checksum:Ljava/util/zip/Checksum;

    .line 39
    iput-object p2, p0, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->in:Ljava/io/InputStream;

    .line 40
    iput-wide p5, p0, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->expectedChecksum:J

    .line 41
    iput-wide p3, p0, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->bytesRemaining:J

    .line 42
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
    .line 108
    iget-object v0, p0, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 109
    return-void
.end method

.method public read()I
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v5, 0x0

    .line 52
    iget-wide v1, p0, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->bytesRemaining:J

    cmp-long v1, v1, v5

    if-gtz v1, :cond_a

    .line 53
    const/4 v0, -0x1

    .line 63
    :cond_9
    return v0

    .line 55
    :cond_a
    iget-object v1, p0, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 56
    .local v0, "ret":I
    if-ltz v0, :cond_1e

    .line 57
    iget-object v1, p0, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->checksum:Ljava/util/zip/Checksum;

    invoke-interface {v1, v0}, Ljava/util/zip/Checksum;->update(I)V

    .line 58
    iget-wide v1, p0, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->bytesRemaining:J

    const-wide/16 v3, 0x1

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->bytesRemaining:J

    .line 60
    :cond_1e
    iget-wide v1, p0, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->bytesRemaining:J

    cmp-long v1, v1, v5

    if-nez v1, :cond_9

    iget-wide v1, p0, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->expectedChecksum:J

    iget-object v3, p0, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->checksum:Ljava/util/zip/Checksum;

    invoke-interface {v3}, Ljava/util/zip/Checksum;->getValue()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-eqz v1, :cond_9

    .line 61
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Checksum verification failed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
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
    .line 74
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .registers 9
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    iget-object v1, p0, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 86
    .local v0, "ret":I
    if-ltz v0, :cond_13

    .line 87
    iget-object v1, p0, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->checksum:Ljava/util/zip/Checksum;

    invoke-interface {v1, p1, p2, v0}, Ljava/util/zip/Checksum;->update([BII)V

    .line 88
    iget-wide v1, p0, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->bytesRemaining:J

    int-to-long v3, v0

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->bytesRemaining:J

    .line 90
    :cond_13
    iget-wide v1, p0, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->bytesRemaining:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-gtz v1, :cond_2f

    iget-wide v1, p0, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->expectedChecksum:J

    iget-object v3, p0, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->checksum:Ljava/util/zip/Checksum;

    invoke-interface {v3}, Ljava/util/zip/Checksum;->getValue()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-eqz v1, :cond_2f

    .line 91
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Checksum verification failed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 93
    :cond_2f
    return v0
.end method

.method public skip(J)J
    .registers 5
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 99
    invoke-virtual {p0}, Lorg/apache/commons/compress/utils/ChecksumVerifyingInputStream;->read()I

    move-result v0

    if-ltz v0, :cond_9

    .line 100
    const-wide/16 v0, 0x1

    .line 102
    :goto_8
    return-wide v0

    :cond_9
    const-wide/16 v0, 0x0

    goto :goto_8
.end method
