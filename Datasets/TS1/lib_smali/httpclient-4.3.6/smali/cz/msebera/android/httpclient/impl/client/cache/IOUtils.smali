.class Lcz/msebera/android/httpclient/impl/client/cache/IOUtils;
.super Ljava/lang/Object;
.source "IOUtils.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static closeSilently(Ljava/io/Closeable;)V
    .registers 2
    .param p0, "closable"    # Ljava/io/Closeable;

    .prologue
    .line 65
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 68
    :goto_3
    return-void

    .line 66
    :catch_4
    move-exception v0

    goto :goto_3
.end method

.method static consume(Lcz/msebera/android/httpclient/HttpEntity;)V
    .registers 3
    .param p0, "entity"    # Lcz/msebera/android/httpclient/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    if-nez p0, :cond_3

    .line 53
    :cond_2
    :goto_2
    return-void

    .line 47
    :cond_3
    invoke-interface {p0}, Lcz/msebera/android/httpclient/HttpEntity;->isStreaming()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 48
    invoke-interface {p0}, Lcz/msebera/android/httpclient/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    .line 49
    .local v0, "instream":Ljava/io/InputStream;
    if-eqz v0, :cond_2

    .line 50
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    goto :goto_2
.end method

.method static copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 5
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    const/16 v2, 0x800

    new-array v0, v2, [B

    .line 58
    .local v0, "buf":[B
    :goto_4
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "len":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_10

    .line 59
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_4

    .line 61
    :cond_10
    return-void
.end method

.method static copyAndClose(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 3
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    :try_start_0
    invoke-static {p0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 73
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 74
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_9} :catch_a

    .line 81
    return-void

    .line 75
    :catch_a
    move-exception v0

    .line 76
    .local v0, "ex":Ljava/io/IOException;
    invoke-static {p0}, Lcz/msebera/android/httpclient/impl/client/cache/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 77
    invoke-static {p1}, Lcz/msebera/android/httpclient/impl/client/cache/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 79
    throw v0
.end method

.method static copyFile(Ljava/io/File;Ljava/io/File;)V
    .registers 11
    .param p0, "in"    # Ljava/io/File;
    .param p1, "out"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    new-instance v7, Ljava/io/RandomAccessFile;

    const-string v1, "r"

    invoke-direct {v7, p0, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 85
    .local v7, "f1":Ljava/io/RandomAccessFile;
    new-instance v8, Ljava/io/RandomAccessFile;

    const-string v1, "rw"

    invoke-direct {v8, p1, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 87
    .local v8, "f2":Ljava/io/RandomAccessFile;
    :try_start_e
    invoke-virtual {v7}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    .line 88
    .local v0, "c1":Ljava/nio/channels/FileChannel;
    invoke-virtual {v8}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_15} :catch_34

    move-result-object v5

    .line 90
    .local v5, "c2":Ljava/nio/channels/FileChannel;
    const-wide/16 v1, 0x0

    :try_start_18
    invoke-virtual {v7}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v3

    invoke-virtual/range {v0 .. v5}, Ljava/nio/channels/FileChannel;->transferTo(JJLjava/nio/channels/WritableByteChannel;)J

    .line 91
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    .line 92
    invoke-virtual {v5}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_25} :catch_2c

    .line 99
    :try_start_25
    invoke-virtual {v7}, Ljava/io/RandomAccessFile;->close()V

    .line 100
    invoke-virtual {v8}, Ljava/io/RandomAccessFile;->close()V

    .line 107
    return-void

    .line 93
    :catch_2c
    move-exception v6

    .line 94
    .local v6, "ex":Ljava/io/IOException;
    invoke-static {v0}, Lcz/msebera/android/httpclient/impl/client/cache/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 95
    invoke-static {v5}, Lcz/msebera/android/httpclient/impl/client/cache/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 97
    throw v6
    :try_end_34
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_34} :catch_34

    .line 101
    .end local v0    # "c1":Ljava/nio/channels/FileChannel;
    .end local v5    # "c2":Ljava/nio/channels/FileChannel;
    .end local v6    # "ex":Ljava/io/IOException;
    :catch_34
    move-exception v6

    .line 102
    .restart local v6    # "ex":Ljava/io/IOException;
    invoke-static {v7}, Lcz/msebera/android/httpclient/impl/client/cache/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 103
    invoke-static {v8}, Lcz/msebera/android/httpclient/impl/client/cache/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 105
    throw v6
.end method
