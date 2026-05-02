.class public Lorg/apache/commons/compress/utils/BoundedInputStream;
.super Ljava/io/InputStream;
.source "BoundedInputStream.java"


# instance fields
.field private bytesRemaining:J

.field private final in:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;J)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "size"    # J

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 39
    iput-object p1, p0, Lorg/apache/commons/compress/utils/BoundedInputStream;->in:Ljava/io/InputStream;

    .line 40
    iput-wide p2, p0, Lorg/apache/commons/compress/utils/BoundedInputStream;->bytesRemaining:J

    .line 41
    return-void
.end method


# virtual methods
.method public close()V
    .registers 1

    .prologue
    .line 73
    return-void
.end method

.method public read()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    iget-wide v0, p0, Lorg/apache/commons/compress/utils/BoundedInputStream;->bytesRemaining:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_16

    .line 46
    iget-wide v0, p0, Lorg/apache/commons/compress/utils/BoundedInputStream;->bytesRemaining:J

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/commons/compress/utils/BoundedInputStream;->bytesRemaining:J

    .line 47
    iget-object v0, p0, Lorg/apache/commons/compress/utils/BoundedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 49
    :goto_15
    return v0

    :cond_16
    const/4 v0, -0x1

    goto :goto_15
.end method

.method public read([BII)I
    .registers 10
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    iget-wide v2, p0, Lorg/apache/commons/compress/utils/BoundedInputStream;->bytesRemaining:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_a

    .line 56
    const/4 v0, -0x1

    .line 66
    :cond_9
    :goto_9
    return v0

    .line 58
    :cond_a
    move v1, p3

    .line 59
    .local v1, "bytesToRead":I
    int-to-long v2, v1

    iget-wide v4, p0, Lorg/apache/commons/compress/utils/BoundedInputStream;->bytesRemaining:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_15

    .line 60
    iget-wide v2, p0, Lorg/apache/commons/compress/utils/BoundedInputStream;->bytesRemaining:J

    long-to-int v1, v2

    .line 62
    :cond_15
    iget-object v2, p0, Lorg/apache/commons/compress/utils/BoundedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 63
    .local v0, "bytesRead":I
    if-ltz v0, :cond_9

    .line 64
    iget-wide v2, p0, Lorg/apache/commons/compress/utils/BoundedInputStream;->bytesRemaining:J

    int-to-long v4, v0

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lorg/apache/commons/compress/utils/BoundedInputStream;->bytesRemaining:J

    goto :goto_9
.end method
