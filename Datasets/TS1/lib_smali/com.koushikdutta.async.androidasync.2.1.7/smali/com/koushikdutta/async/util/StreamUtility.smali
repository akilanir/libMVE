.class public Lcom/koushikdutta/async/util/StreamUtility;
.super Ljava/lang/Object;
.source "StreamUtility.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static varargs closeQuietly([Ljava/io/Closeable;)V
    .registers 6
    .param p0, "closeables"    # [Ljava/io/Closeable;

    .prologue
    .line 102
    if-nez p0, :cond_3

    .line 113
    :cond_2
    return-void

    .line 104
    :cond_3
    move-object v0, p0

    .local v0, "arr$":[Ljava/io/Closeable;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_6
    if-ge v2, v3, :cond_2

    aget-object v1, v0, v2

    .line 105
    .local v1, "closeable":Ljava/io/Closeable;
    if-eqz v1, :cond_f

    .line 107
    :try_start_c
    invoke-interface {v1}, Ljava/io/Closeable;->close()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_f} :catch_12

    .line 104
    :cond_f
    :goto_f
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 108
    :catch_12
    move-exception v4

    goto :goto_f
.end method

.method public static copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 4
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    invoke-static {p0}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/InputStream;)Ljava/nio/channels/ReadableByteChannel;

    move-result-object v0

    .line 41
    .local v0, "inputChannel":Ljava/nio/channels/ReadableByteChannel;
    invoke-static {p1}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/OutputStream;)Ljava/nio/channels/WritableByteChannel;

    move-result-object v1

    .line 43
    .local v1, "outputChannel":Ljava/nio/channels/WritableByteChannel;
    invoke-static {v0, v1}, Lcom/koushikdutta/async/util/StreamUtility;->fastChannelCopy(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/channels/WritableByteChannel;)V

    .line 44
    return-void
.end method

.method public static eat(Ljava/io/InputStream;)V
    .registers 4
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 116
    const/16 v1, 0x400

    new-array v0, v1, [B

    .line 117
    .local v0, "stuff":[B
    :cond_4
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_4

    .line 118
    return-void
.end method

.method public static fastChannelCopy(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/channels/WritableByteChannel;)V
    .registers 5
    .param p0, "src"    # Ljava/nio/channels/ReadableByteChannel;
    .param p1, "dest"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20
    const/16 v1, 0x4000

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 21
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    :goto_6
    invoke-interface {p0, v0}, Ljava/nio/channels/ReadableByteChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_17

    .line 23
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 25
    invoke-interface {p1, v0}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 28
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->compact()Ljava/nio/ByteBuffer;

    goto :goto_6

    .line 31
    :cond_17
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 33
    :goto_1a
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v1

    if-eqz v1, :cond_24

    .line 34
    invoke-interface {p1, v0}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    goto :goto_1a

    .line 36
    :cond_24
    return-void
.end method

.method public static readFile(Ljava/io/File;)Ljava/lang/String;
    .registers 8
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 79
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v3

    long-to-int v3, v3

    new-array v0, v3, [B

    .line 80
    .local v0, "buffer":[B
    const/4 v1, 0x0

    .line 82
    .local v1, "input":Ljava/io/DataInputStream;
    :try_start_a
    new-instance v2, Ljava/io/DataInputStream;

    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v3}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_14
    .catchall {:try_start_a .. :try_end_14} :catchall_24

    .line 83
    .end local v1    # "input":Ljava/io/DataInputStream;
    .local v2, "input":Ljava/io/DataInputStream;
    :try_start_14
    invoke-virtual {v2, v0}, Ljava/io/DataInputStream;->readFully([B)V
    :try_end_17
    .catchall {:try_start_14 .. :try_end_17} :catchall_2d

    .line 85
    new-array v3, v6, [Ljava/io/Closeable;

    aput-object v2, v3, v5

    invoke-static {v3}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 87
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v0}, Ljava/lang/String;-><init>([B)V

    return-object v3

    .line 85
    .end local v2    # "input":Ljava/io/DataInputStream;
    .restart local v1    # "input":Ljava/io/DataInputStream;
    :catchall_24
    move-exception v3

    :goto_25
    new-array v4, v6, [Ljava/io/Closeable;

    aput-object v1, v4, v5

    invoke-static {v4}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    throw v3

    .end local v1    # "input":Ljava/io/DataInputStream;
    .restart local v2    # "input":Ljava/io/DataInputStream;
    :catchall_2d
    move-exception v3

    move-object v1, v2

    .end local v2    # "input":Ljava/io/DataInputStream;
    .restart local v1    # "input":Ljava/io/DataInputStream;
    goto :goto_25
.end method

.method public static readFile(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/koushikdutta/async/util/StreamUtility;->readFile(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static readFileSilent(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 71
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lcom/koushikdutta/async/util/StreamUtility;->readFile(Ljava/io/File;)Ljava/lang/String;
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_8} :catch_a

    move-result-object v1

    .line 74
    :goto_9
    return-object v1

    .line 73
    :catch_a
    move-exception v0

    .line 74
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_9
.end method

.method public static readToEnd(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 3
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    new-instance v0, Ljava/lang/String;

    invoke-static {p0}, Lcom/koushikdutta/async/util/StreamUtility;->readToEndAsArray(Ljava/io/InputStream;)[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    return-object v0
.end method

.method public static readToEndAsArray(Ljava/io/InputStream;)[B
    .registers 6
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    new-instance v1, Ljava/io/DataInputStream;

    invoke-direct {v1, p0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 49
    .local v1, "dis":Ljava/io/DataInputStream;
    const/16 v4, 0x400

    new-array v3, v4, [B

    .line 50
    .local v3, "stuff":[B
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 51
    .local v0, "buff":Ljava/io/ByteArrayOutputStream;
    const/4 v2, 0x0

    .line 52
    .local v2, "read":I
    :goto_f
    invoke-virtual {v1, v3}, Ljava/io/DataInputStream;->read([B)I

    move-result v2

    const/4 v4, -0x1

    if-eq v2, v4, :cond_1b

    .line 54
    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_f

    .line 56
    :cond_1b
    invoke-virtual {v1}, Ljava/io/DataInputStream;->close()V

    .line 57
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    return-object v4
.end method

.method public static writeFile(Ljava/io/File;Ljava/lang/String;)V
    .registers 4
    .param p0, "file"    # Ljava/io/File;
    .param p1, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 92
    new-instance v0, Ljava/io/DataOutputStream;

    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 93
    .local v0, "dout":Ljava/io/DataOutputStream;
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->write([B)V

    .line 94
    invoke-virtual {v0}, Ljava/io/DataOutputStream;->close()V

    .line 95
    return-void
.end method

.method public static writeFile(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p0, "file"    # Ljava/lang/String;
    .param p1, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 98
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p1}, Lcom/koushikdutta/async/util/StreamUtility;->writeFile(Ljava/io/File;Ljava/lang/String;)V

    .line 99
    return-void
.end method
