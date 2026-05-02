.class public final Lorg/apache/commons/compress/utils/IOUtils;
.super Ljava/lang/Object;
.source "IOUtils.java"


# static fields
.field private static final COPY_BUF_SIZE:I = 0x1f58

.field private static final SKIP_BUF:[B

.field private static final SKIP_BUF_SIZE:I = 0x1000


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 38
    const/16 v0, 0x1000

    new-array v0, v0, [B

    sput-object v0, Lorg/apache/commons/compress/utils/IOUtils;->SKIP_BUF:[B

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    return-void
.end method

.method public static closeQuietly(Ljava/io/Closeable;)V
    .registers 2
    .param p0, "c"    # Ljava/io/Closeable;

    .prologue
    .line 199
    if-eqz p0, :cond_5

    .line 201
    :try_start_2
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_6

    .line 205
    :cond_5
    :goto_5
    return-void

    .line 202
    :catch_6
    move-exception v0

    goto :goto_5
.end method

.method public static copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    .registers 4
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    const/16 v0, 0x1f58

    invoke-static {p0, p1, v0}, Lorg/apache/commons/compress/utils/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;I)J

    move-result-wide v0

    return-wide v0
.end method

.method public static copy(Ljava/io/InputStream;Ljava/io/OutputStream;I)J
    .registers 9
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "output"    # Ljava/io/OutputStream;
    .param p2, "buffersize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    new-array v0, p2, [B

    .line 75
    .local v0, "buffer":[B
    const/4 v3, 0x0

    .line 76
    .local v3, "n":I
    const-wide/16 v1, 0x0

    .line 77
    .local v1, "count":J
    :goto_5
    const/4 v4, -0x1

    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    if-eq v4, v3, :cond_13

    .line 78
    const/4 v4, 0x0

    invoke-virtual {p1, v0, v4, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 79
    int-to-long v4, v3

    add-long/2addr v1, v4

    goto :goto_5

    .line 81
    :cond_13
    return-wide v1
.end method

.method public static readFully(Ljava/io/InputStream;[B)I
    .registers 4
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 134
    const/4 v0, 0x0

    array-length v1, p1

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/compress/utils/IOUtils;->readFully(Ljava/io/InputStream;[BII)I

    move-result v0

    return v0
.end method

.method public static readFully(Ljava/io/InputStream;[BII)I
    .registers 8
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "b"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 155
    if-ltz p3, :cond_9

    if-ltz p2, :cond_9

    add-int v2, p3, p2

    array-length v3, p1

    if-le v2, v3, :cond_f

    .line 156
    :cond_9
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v2}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v2

    .line 158
    :cond_f
    const/4 v0, 0x0

    .local v0, "count":I
    const/4 v1, 0x0

    .line 159
    .local v1, "x":I
    :goto_11
    if-eq v0, p3, :cond_1e

    .line 160
    add-int v2, p2, v0

    sub-int v3, p3, v0

    invoke-virtual {p0, p1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 161
    const/4 v2, -0x1

    if-ne v1, v2, :cond_1f

    .line 166
    :cond_1e
    return v0

    .line 164
    :cond_1f
    add-int/2addr v0, v1

    goto :goto_11
.end method

.method public static skip(Ljava/io/InputStream;J)J
    .registers 14
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "numToSkip"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v9, 0x0

    .line 101
    move-wide v0, p1

    .line 102
    .local v0, "available":J
    :goto_3
    cmp-long v5, p1, v9

    if-lez v5, :cond_f

    .line 103
    invoke-virtual {p0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v3

    .line 104
    .local v3, "skipped":J
    cmp-long v5, v3, v9

    if-nez v5, :cond_27

    .line 110
    .end local v3    # "skipped":J
    :cond_f
    :goto_f
    cmp-long v5, p1, v9

    if-lez v5, :cond_24

    .line 111
    sget-object v5, Lorg/apache/commons/compress/utils/IOUtils;->SKIP_BUF:[B

    const/4 v6, 0x0

    const-wide/16 v7, 0x1000

    invoke-static {p1, p2, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v7

    long-to-int v7, v7

    invoke-static {p0, v5, v6, v7}, Lorg/apache/commons/compress/utils/IOUtils;->readFully(Ljava/io/InputStream;[BII)I

    move-result v2

    .line 113
    .local v2, "read":I
    const/4 v5, 0x1

    if-ge v2, v5, :cond_29

    .line 118
    .end local v2    # "read":I
    :cond_24
    sub-long v5, v0, p1

    return-wide v5

    .line 107
    .restart local v3    # "skipped":J
    :cond_27
    sub-long/2addr p1, v3

    .line 108
    goto :goto_3

    .line 116
    .end local v3    # "skipped":J
    .restart local v2    # "read":I
    :cond_29
    int-to-long v5, v2

    sub-long/2addr p1, v5

    .line 117
    goto :goto_f
.end method

.method public static toByteArray(Ljava/io/InputStream;)[B
    .registers 3
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 188
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 189
    .local v0, "output":Ljava/io/ByteArrayOutputStream;
    invoke-static {p0, v0}, Lorg/apache/commons/compress/utils/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    .line 190
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method
