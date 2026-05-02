.class final Lcom/google/common/io/Files$FileByteSource;
.super Lcom/google/common/io/ByteSource;
.source "Files.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/Files;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FileByteSource"
.end annotation


# instance fields
.field private final file:Ljava/io/File;


# direct methods
.method private constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 121
    invoke-direct {p0}, Lcom/google/common/io/ByteSource;-><init>()V

    .line 122
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    iput-object v0, p0, Lcom/google/common/io/Files$FileByteSource;->file:Ljava/io/File;

    .line 123
    return-void
.end method

.method synthetic constructor <init>(Ljava/io/File;Lcom/google/common/io/Files$1;)V
    .registers 3
    .param p1, "x0"    # Ljava/io/File;
    .param p2, "x1"    # Lcom/google/common/io/Files$1;

    .prologue
    .line 117
    invoke-direct {p0, p1}, Lcom/google/common/io/Files$FileByteSource;-><init>(Ljava/io/File;)V

    return-void
.end method


# virtual methods
.method public openStream()Ljava/io/FileInputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lcom/google/common/io/Files$FileByteSource;->file:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public bridge synthetic openStream()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 117
    invoke-virtual {p0}, Lcom/google/common/io/Files$FileByteSource;->openStream()Ljava/io/FileInputStream;

    move-result-object v0

    return-object v0
.end method

.method public read()[B
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v13, -0x1

    .line 140
    iget-object v11, p0, Lcom/google/common/io/Files$FileByteSource;->file:Ljava/io/File;

    invoke-virtual {v11}, Ljava/io/File;->length()J

    move-result-wide v9

    .line 143
    .local v9, "size":J
    const-wide/16 v11, 0x0

    cmp-long v11, v9, v11

    if-nez v11, :cond_12

    .line 144
    invoke-super {p0}, Lcom/google/common/io/ByteSource;->read()[B

    move-result-object v1

    .line 196
    :goto_11
    return-object v1

    .line 149
    :cond_12
    const-wide/32 v11, 0x7fffffff

    cmp-long v11, v9, v11

    if-lez v11, :cond_38

    .line 151
    new-instance v11, Ljava/lang/OutOfMemoryError;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "file is too large to fit in a byte array: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " bytes"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/OutOfMemoryError;-><init>(Ljava/lang/String;)V

    throw v11

    .line 156
    :cond_38
    long-to-int v11, v9

    new-array v1, v11, [B

    .line 158
    .local v1, "bytes":[B
    invoke-static {}, Lcom/google/common/io/Closer;->create()Lcom/google/common/io/Closer;

    move-result-object v2

    .line 160
    .local v2, "closer":Lcom/google/common/io/Closer;
    :try_start_3f
    invoke-virtual {p0}, Lcom/google/common/io/Files$FileByteSource;->openStream()Ljava/io/FileInputStream;

    move-result-object v11

    invoke-virtual {v2, v11}, Lcom/google/common/io/Closer;->register(Ljava/io/Closeable;)Ljava/io/Closeable;

    move-result-object v4

    check-cast v4, Ljava/io/InputStream;

    .line 161
    .local v4, "in":Ljava/io/InputStream;
    const/4 v5, 0x0

    .line 162
    .local v5, "off":I
    const/4 v7, 0x0

    .line 166
    .local v7, "read":I
    :goto_4b
    int-to-long v11, v5

    cmp-long v11, v11, v9

    if-gez v11, :cond_5a

    long-to-int v11, v9

    sub-int/2addr v11, v5

    invoke-virtual {v4, v1, v5, v11}, Ljava/io/InputStream;->read([BII)I

    move-result v7

    if-eq v7, v13, :cond_5a

    .line 167
    add-int/2addr v5, v7

    goto :goto_4b

    .line 170
    :cond_5a
    int-to-long v11, v5

    cmp-long v11, v11, v9

    if-gez v11, :cond_67

    .line 172
    invoke-static {v1, v5}, Ljava/util/Arrays;->copyOf([BI)[B
    :try_end_62
    .catch Ljava/lang/Throwable; {:try_start_3f .. :try_end_62} :catch_95
    .catchall {:try_start_3f .. :try_end_62} :catchall_9b

    move-result-object v1

    .line 196
    .end local v1    # "bytes":[B
    invoke-virtual {v2}, Lcom/google/common/io/Closer;->close()V

    goto :goto_11

    .line 177
    .restart local v1    # "bytes":[B
    :cond_67
    :try_start_67
    invoke-virtual {v4}, Ljava/io/InputStream;->read()I
    :try_end_6a
    .catch Ljava/lang/Throwable; {:try_start_67 .. :try_end_6a} :catch_95
    .catchall {:try_start_67 .. :try_end_6a} :catchall_9b

    move-result v0

    .line 178
    .local v0, "b":I
    if-ne v0, v13, :cond_71

    .line 196
    invoke-virtual {v2}, Lcom/google/common/io/Closer;->close()V

    goto :goto_11

    .line 184
    :cond_71
    :try_start_71
    new-instance v6, Lcom/google/common/io/Files$InternalByteArrayOutputStream;

    const/4 v11, 0x0

    invoke-direct {v6, v11}, Lcom/google/common/io/Files$InternalByteArrayOutputStream;-><init>(Lcom/google/common/io/Files$1;)V

    .line 186
    .local v6, "out":Lcom/google/common/io/Files$InternalByteArrayOutputStream;
    invoke-virtual {v6, v0}, Lcom/google/common/io/Files$InternalByteArrayOutputStream;->write(I)V

    .line 187
    invoke-static {v4, v6}, Lcom/google/common/io/ByteStreams;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    .line 189
    array-length v11, v1

    invoke-virtual {v6}, Lcom/google/common/io/Files$InternalByteArrayOutputStream;->size()I

    move-result v12

    add-int/2addr v11, v12

    new-array v8, v11, [B

    .line 190
    .local v8, "result":[B
    const/4 v11, 0x0

    const/4 v12, 0x0

    array-length v13, v1

    invoke-static {v1, v11, v8, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 191
    array-length v11, v1

    invoke-virtual {v6, v8, v11}, Lcom/google/common/io/Files$InternalByteArrayOutputStream;->writeTo([BI)V
    :try_end_8f
    .catch Ljava/lang/Throwable; {:try_start_71 .. :try_end_8f} :catch_95
    .catchall {:try_start_71 .. :try_end_8f} :catchall_9b

    .line 196
    invoke-virtual {v2}, Lcom/google/common/io/Closer;->close()V

    move-object v1, v8

    goto/16 :goto_11

    .line 193
    .end local v0    # "b":I
    .end local v4    # "in":Ljava/io/InputStream;
    .end local v5    # "off":I
    .end local v6    # "out":Lcom/google/common/io/Files$InternalByteArrayOutputStream;
    .end local v7    # "read":I
    .end local v8    # "result":[B
    :catch_95
    move-exception v3

    .line 194
    .local v3, "e":Ljava/lang/Throwable;
    :try_start_96
    invoke-virtual {v2, v3}, Lcom/google/common/io/Closer;->rethrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v11

    throw v11
    :try_end_9b
    .catchall {:try_start_96 .. :try_end_9b} :catchall_9b

    .line 196
    .end local v3    # "e":Ljava/lang/Throwable;
    :catchall_9b
    move-exception v11

    invoke-virtual {v2}, Lcom/google/common/io/Closer;->close()V

    throw v11
.end method

.method public size()J
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    iget-object v0, p0, Lcom/google/common/io/Files$FileByteSource;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-nez v0, :cond_14

    .line 133
    new-instance v0, Ljava/io/FileNotFoundException;

    iget-object v1, p0, Lcom/google/common/io/Files$FileByteSource;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 135
    :cond_14
    iget-object v0, p0, Lcom/google/common/io/Files$FileByteSource;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 202
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Files.asByteSource("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/common/io/Files$FileByteSource;->file:Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
