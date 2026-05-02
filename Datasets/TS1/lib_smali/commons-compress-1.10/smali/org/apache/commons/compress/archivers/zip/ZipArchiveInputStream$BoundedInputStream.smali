.class Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;
.super Ljava/io/InputStream;
.source "ZipArchiveInputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BoundedInputStream"
.end annotation


# instance fields
.field private final in:Ljava/io/InputStream;

.field private final max:J

.field private pos:J

.field final synthetic this$0:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;


# direct methods
.method public constructor <init>(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;Ljava/io/InputStream;J)V
    .registers 7
    .param p2, "in"    # Ljava/io/InputStream;
    .param p3, "size"    # J

    .prologue
    .line 1048
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->this$0:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 1039
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    .line 1049
    iput-wide p3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->max:J

    .line 1050
    iput-object p2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->in:Ljava/io/InputStream;

    .line 1051
    return-void
.end method


# virtual methods
.method public available()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1098
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->max:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_12

    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    iget-wide v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->max:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_12

    .line 1099
    const/4 v0, 0x0

    .line 1101
    :goto_11
    return v0

    :cond_12
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    goto :goto_11
.end method

.method public read()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1055
    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->max:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-ltz v1, :cond_12

    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->max:J

    cmp-long v1, v1, v3

    if-ltz v1, :cond_12

    .line 1056
    const/4 v0, -0x1

    .line 1062
    :goto_11
    return v0

    .line 1058
    :cond_12
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 1059
    .local v0, "result":I
    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    .line 1060
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->this$0:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;

    const/4 v2, 0x1

    # invokes: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->count(I)V
    invoke-static {v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->access$800(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;I)V

    .line 1061
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->this$0:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->access$900(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-result-object v1

    # operator++ for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->bytesReadFromStream:J
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$708(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;)J

    goto :goto_11
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
    .line 1067
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .registers 14
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x0

    const/4 v3, -0x1

    .line 1072
    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->max:J

    cmp-long v4, v4, v8

    if-ltz v4, :cond_13

    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    iget-wide v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->max:J

    cmp-long v4, v4, v6

    if-ltz v4, :cond_13

    move v0, v3

    .line 1085
    :goto_12
    return v0

    .line 1075
    :cond_13
    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->max:J

    cmp-long v4, v4, v8

    if-ltz v4, :cond_2e

    int-to-long v4, p3

    iget-wide v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->max:J

    iget-wide v8, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    sub-long/2addr v6, v8

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    .line 1076
    .local v1, "maxRead":J
    :goto_23
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->in:Ljava/io/InputStream;

    long-to-int v5, v1

    invoke-virtual {v4, p1, p2, v5}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 1078
    .local v0, "bytesRead":I
    if-ne v0, v3, :cond_30

    move v0, v3

    .line 1079
    goto :goto_12

    .line 1075
    .end local v0    # "bytesRead":I
    .end local v1    # "maxRead":J
    :cond_2e
    int-to-long v1, p3

    goto :goto_23

    .line 1082
    .restart local v0    # "bytesRead":I
    .restart local v1    # "maxRead":J
    :cond_30
    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    int-to-long v5, v0

    add-long/2addr v3, v5

    iput-wide v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    .line 1083
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->this$0:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;

    # invokes: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->count(I)V
    invoke-static {v3, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->access$1000(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;I)V

    .line 1084
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->this$0:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->current:Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;
    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->access$900(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;

    move-result-object v3

    int-to-long v4, v0

    # += operator for: Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->bytesReadFromStream:J
    invoke-static {v3, v4, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;->access$714(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry;J)J

    goto :goto_12
.end method

.method public skip(J)J
    .registers 11
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1090
    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->max:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-ltz v4, :cond_1d

    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->max:J

    iget-wide v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    sub-long/2addr v4, v6

    invoke-static {p1, p2, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    .line 1091
    .local v2, "toSkip":J
    :goto_11
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v4, v2, v3}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    .line 1092
    .local v0, "skippedBytes":J
    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    add-long/2addr v4, v0

    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream;->pos:J

    .line 1093
    return-wide v0

    .end local v0    # "skippedBytes":J
    .end local v2    # "toSkip":J
    :cond_1d
    move-wide v2, p1

    .line 1090
    goto :goto_11
.end method
