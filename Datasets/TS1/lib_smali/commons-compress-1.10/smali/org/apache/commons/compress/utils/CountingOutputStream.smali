.class public Lorg/apache/commons/compress/utils/CountingOutputStream;
.super Ljava/io/FilterOutputStream;
.source "CountingOutputStream.java"


# instance fields
.field private bytesWritten:J


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 31
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/commons/compress/utils/CountingOutputStream;->bytesWritten:J

    .line 35
    return-void
.end method


# virtual methods
.method protected count(J)V
    .registers 5
    .param p1, "written"    # J

    .prologue
    .line 59
    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-eqz v0, :cond_b

    .line 60
    iget-wide v0, p0, Lorg/apache/commons/compress/utils/CountingOutputStream;->bytesWritten:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lorg/apache/commons/compress/utils/CountingOutputStream;->bytesWritten:J

    .line 62
    :cond_b
    return-void
.end method

.method public getBytesWritten()J
    .registers 3

    .prologue
    .line 69
    iget-wide v0, p0, Lorg/apache/commons/compress/utils/CountingOutputStream;->bytesWritten:J

    return-wide v0
.end method

.method public write(I)V
    .registers 4
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    iget-object v0, p0, Lorg/apache/commons/compress/utils/CountingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 40
    const-wide/16 v0, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/compress/utils/CountingOutputStream;->count(J)V

    .line 41
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
    .line 44
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/compress/utils/CountingOutputStream;->write([BII)V

    .line 45
    return-void
.end method

.method public write([BII)V
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
    .line 48
    iget-object v0, p0, Lorg/apache/commons/compress/utils/CountingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 49
    int-to-long v0, p3

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/compress/utils/CountingOutputStream;->count(J)V

    .line 50
    return-void
.end method
