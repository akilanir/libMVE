.class public Lcom/koushikdutta/async/ZipDataSink;
.super Lcom/koushikdutta/async/FilteredDataSink;
.source "ZipDataSink.java"


# instance fields
.field bout:Ljava/io/ByteArrayOutputStream;

.field zop:Ljava/util/zip/ZipOutputStream;


# direct methods
.method public constructor <init>(Lcom/koushikdutta/async/DataSink;)V
    .registers 4
    .param p1, "sink"    # Lcom/koushikdutta/async/DataSink;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/FilteredDataSink;-><init>(Lcom/koushikdutta/async/DataSink;)V

    .line 16
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/ZipDataSink;->bout:Ljava/io/ByteArrayOutputStream;

    .line 17
    new-instance v0, Ljava/util/zip/ZipOutputStream;

    iget-object v1, p0, Lcom/koushikdutta/async/ZipDataSink;->bout:Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0, v1}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lcom/koushikdutta/async/ZipDataSink;->zop:Ljava/util/zip/ZipOutputStream;

    .line 14
    return-void
.end method


# virtual methods
.method public closeEntry()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 24
    iget-object v0, p0, Lcom/koushikdutta/async/ZipDataSink;->zop:Ljava/util/zip/ZipOutputStream;

    invoke-virtual {v0}, Ljava/util/zip/ZipOutputStream;->closeEntry()V

    .line 25
    return-void
.end method

.method public end()V
    .registers 3

    .prologue
    .line 36
    :try_start_0
    iget-object v1, p0, Lcom/koushikdutta/async/ZipDataSink;->zop:Ljava/util/zip/ZipOutputStream;

    invoke-virtual {v1}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_17

    .line 42
    const v1, 0x7fffffff

    invoke-virtual {p0, v1}, Lcom/koushikdutta/async/ZipDataSink;->setMaxBuffer(I)V

    .line 43
    new-instance v1, Lcom/koushikdutta/async/ByteBufferList;

    invoke-direct {v1}, Lcom/koushikdutta/async/ByteBufferList;-><init>()V

    invoke-virtual {p0, v1}, Lcom/koushikdutta/async/ZipDataSink;->write(Lcom/koushikdutta/async/ByteBufferList;)V

    .line 44
    invoke-super {p0}, Lcom/koushikdutta/async/FilteredDataSink;->end()V

    .line 45
    :goto_16
    return-void

    .line 38
    :catch_17
    move-exception v0

    .line 39
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/ZipDataSink;->report(Ljava/lang/Exception;)V

    goto :goto_16
.end method

.method public filter(Lcom/koushikdutta/async/ByteBufferList;)Lcom/koushikdutta/async/ByteBufferList;
    .registers 6
    .param p1, "bb"    # Lcom/koushikdutta/async/ByteBufferList;

    .prologue
    .line 50
    if-eqz p1, :cond_20

    .line 51
    :goto_2
    :try_start_2
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->size()I

    move-result v3

    if-lez v3, :cond_20

    .line 52
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->remove()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 53
    .local v0, "b":Ljava/nio/ByteBuffer;
    iget-object v3, p0, Lcom/koushikdutta/async/ZipDataSink;->zop:Ljava/util/zip/ZipOutputStream;

    invoke-static {v3, v0}, Lcom/koushikdutta/async/ByteBufferList;->writeOutputStream(Ljava/io/OutputStream;Ljava/nio/ByteBuffer;)V

    .line 54
    invoke-static {v0}, Lcom/koushikdutta/async/ByteBufferList;->reclaim(Ljava/nio/ByteBuffer;)V
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_14} :catch_15
    .catchall {:try_start_2 .. :try_end_14} :catchall_36

    goto :goto_2

    .line 61
    .end local v0    # "b":Ljava/nio/ByteBuffer;
    :catch_15
    move-exception v1

    .line 62
    .local v1, "e":Ljava/io/IOException;
    :try_start_16
    invoke-virtual {p0, v1}, Lcom/koushikdutta/async/ZipDataSink;->report(Ljava/lang/Exception;)V
    :try_end_19
    .catchall {:try_start_16 .. :try_end_19} :catchall_36

    .line 63
    const/4 v2, 0x0

    .line 66
    if-eqz p1, :cond_1f

    .line 67
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->recycle()V

    .end local v1    # "e":Ljava/io/IOException;
    :cond_1f
    :goto_1f
    return-object v2

    .line 57
    :cond_20
    :try_start_20
    new-instance v2, Lcom/koushikdutta/async/ByteBufferList;

    iget-object v3, p0, Lcom/koushikdutta/async/ZipDataSink;->bout:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/koushikdutta/async/ByteBufferList;-><init>([B)V

    .line 58
    .local v2, "ret":Lcom/koushikdutta/async/ByteBufferList;
    iget-object v3, p0, Lcom/koushikdutta/async/ZipDataSink;->bout:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->reset()V
    :try_end_30
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_30} :catch_15
    .catchall {:try_start_20 .. :try_end_30} :catchall_36

    .line 66
    if-eqz p1, :cond_1f

    .line 67
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->recycle()V

    goto :goto_1f

    .line 66
    .end local v2    # "ret":Lcom/koushikdutta/async/ByteBufferList;
    :catchall_36
    move-exception v3

    if-eqz p1, :cond_3c

    .line 67
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->recycle()V

    :cond_3c
    throw v3
.end method

.method public putNextEntry(Ljava/util/zip/ZipEntry;)V
    .registers 3
    .param p1, "ze"    # Ljava/util/zip/ZipEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20
    iget-object v0, p0, Lcom/koushikdutta/async/ZipDataSink;->zop:Ljava/util/zip/ZipOutputStream;

    invoke-virtual {v0, p1}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 21
    return-void
.end method

.method protected report(Ljava/lang/Exception;)V
    .registers 3
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 28
    invoke-virtual {p0}, Lcom/koushikdutta/async/ZipDataSink;->getClosedCallback()Lcom/koushikdutta/async/callback/CompletedCallback;

    move-result-object v0

    .line 29
    .local v0, "closed":Lcom/koushikdutta/async/callback/CompletedCallback;
    if-eqz v0, :cond_9

    .line 30
    invoke-interface {v0, p1}, Lcom/koushikdutta/async/callback/CompletedCallback;->onCompleted(Ljava/lang/Exception;)V

    .line 31
    :cond_9
    return-void
.end method
