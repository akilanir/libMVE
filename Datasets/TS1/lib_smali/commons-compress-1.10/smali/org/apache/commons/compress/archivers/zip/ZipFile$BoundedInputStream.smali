.class Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;
.super Ljava/io/InputStream;
.source "ZipFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/compress/archivers/zip/ZipFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BoundedInputStream"
.end annotation


# instance fields
.field private addDummyByte:Z

.field private loc:J

.field private remaining:J

.field final synthetic this$0:Lorg/apache/commons/compress/archivers/zip/ZipFile;


# direct methods
.method constructor <init>(Lorg/apache/commons/compress/archivers/zip/ZipFile;JJ)V
    .registers 7
    .param p2, "start"    # J
    .param p4, "remaining"    # J

    .prologue
    .line 993
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/commons/compress/archivers/zip/ZipFile;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 991
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->addDummyByte:Z

    .line 994
    iput-wide p4, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->remaining:J

    .line 995
    iput-wide p2, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->loc:J

    .line 996
    return-void
.end method


# virtual methods
.method addDummy()V
    .registers 2

    .prologue
    .line 1048
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->addDummyByte:Z

    .line 1049
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
    const-wide/16 v5, 0x1

    const/4 v0, 0x0

    .line 1000
    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->remaining:J

    sub-long v3, v1, v5

    iput-wide v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->remaining:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-gtz v1, :cond_18

    .line 1001
    iget-boolean v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->addDummyByte:Z

    if-eqz v1, :cond_16

    .line 1002
    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->addDummyByte:Z

    .line 1009
    :goto_15
    return v0

    .line 1005
    :cond_16
    const/4 v0, -0x1

    goto :goto_15

    .line 1007
    :cond_18
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/commons/compress/archivers/zip/ZipFile;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->access$600(Lorg/apache/commons/compress/archivers/zip/ZipFile;)Ljava/io/RandomAccessFile;

    move-result-object v1

    monitor-enter v1

    .line 1008
    :try_start_1f
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/commons/compress/archivers/zip/ZipFile;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->access$600(Lorg/apache/commons/compress/archivers/zip/ZipFile;)Ljava/io/RandomAccessFile;

    move-result-object v0

    iget-wide v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->loc:J

    add-long v4, v2, v5

    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->loc:J

    invoke-virtual {v0, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 1009
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/commons/compress/archivers/zip/ZipFile;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->access$600(Lorg/apache/commons/compress/archivers/zip/ZipFile;)Ljava/io/RandomAccessFile;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->read()I

    move-result v0

    monitor-exit v1

    goto :goto_15

    .line 1010
    :catchall_3a
    move-exception v0

    monitor-exit v1
    :try_end_3c
    .catchall {:try_start_1f .. :try_end_3c} :catchall_3a

    throw v0
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
    const/4 v0, 0x0

    .line 1015
    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->remaining:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-gtz v1, :cond_15

    .line 1016
    iget-boolean v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->addDummyByte:Z

    if-eqz v1, :cond_13

    .line 1017
    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->addDummyByte:Z

    .line 1018
    aput-byte v0, p1, p2

    .line 1019
    const/4 v0, 0x1

    .line 1040
    :cond_12
    :goto_12
    return v0

    .line 1021
    :cond_13
    const/4 v0, -0x1

    goto :goto_12

    .line 1024
    :cond_15
    if-lez p3, :cond_12

    .line 1028
    int-to-long v1, p3

    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->remaining:J

    cmp-long v1, v1, v3

    if-lez v1, :cond_21

    .line 1029
    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->remaining:J

    long-to-int p3, v1

    .line 1031
    :cond_21
    const/4 v0, -0x1

    .line 1032
    .local v0, "ret":I
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/commons/compress/archivers/zip/ZipFile;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->access$600(Lorg/apache/commons/compress/archivers/zip/ZipFile;)Ljava/io/RandomAccessFile;

    move-result-object v2

    monitor-enter v2

    .line 1033
    :try_start_29
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/commons/compress/archivers/zip/ZipFile;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->access$600(Lorg/apache/commons/compress/archivers/zip/ZipFile;)Ljava/io/RandomAccessFile;

    move-result-object v1

    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->loc:J

    invoke-virtual {v1, v3, v4}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 1034
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/commons/compress/archivers/zip/ZipFile;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipFile;->archive:Ljava/io/RandomAccessFile;
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->access$600(Lorg/apache/commons/compress/archivers/zip/ZipFile;)Ljava/io/RandomAccessFile;

    move-result-object v1

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result v0

    .line 1035
    monitor-exit v2
    :try_end_3f
    .catchall {:try_start_29 .. :try_end_3f} :catchall_4e

    .line 1036
    if-lez v0, :cond_12

    .line 1037
    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->loc:J

    int-to-long v3, v0

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->loc:J

    .line 1038
    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->remaining:J

    int-to-long v3, v0

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream;->remaining:J

    goto :goto_12

    .line 1035
    :catchall_4e
    move-exception v1

    :try_start_4f
    monitor-exit v2
    :try_end_50
    .catchall {:try_start_4f .. :try_end_50} :catchall_4e

    throw v1
.end method
