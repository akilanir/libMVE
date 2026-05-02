.class public Lorg/apache/commons/io/output/DeferredFileOutputStream;
.super Lorg/apache/commons/io/output/ThresholdingOutputStream;
.source "DeferredFileOutputStream.java"


# instance fields
.field private closed:Z

.field private currentOutputStream:Ljava/io/OutputStream;

.field private memoryOutputStream:Lorg/apache/commons/io/output/ByteArrayOutputStream;

.field private outputFile:Ljava/io/File;


# direct methods
.method public constructor <init>(ILjava/io/File;)V
    .registers 4
    .param p1, "threshold"    # I
    .param p2, "outputFile"    # Ljava/io/File;

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lorg/apache/commons/io/output/ThresholdingOutputStream;-><init>(I)V

    .line 74
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/io/output/DeferredFileOutputStream;->closed:Z

    .line 89
    iput-object p2, p0, Lorg/apache/commons/io/output/DeferredFileOutputStream;->outputFile:Ljava/io/File;

    .line 91
    new-instance v0, Lorg/apache/commons/io/output/ByteArrayOutputStream;

    invoke-direct {v0}, Lorg/apache/commons/io/output/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/io/output/DeferredFileOutputStream;->memoryOutputStream:Lorg/apache/commons/io/output/ByteArrayOutputStream;

    .line 92
    iget-object v0, p0, Lorg/apache/commons/io/output/DeferredFileOutputStream;->memoryOutputStream:Lorg/apache/commons/io/output/ByteArrayOutputStream;

    iput-object v0, p0, Lorg/apache/commons/io/output/DeferredFileOutputStream;->currentOutputStream:Ljava/io/OutputStream;

    .line 93
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
    .line 184
    invoke-super {p0}, Lorg/apache/commons/io/output/ThresholdingOutputStream;->close()V

    .line 185
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/io/output/DeferredFileOutputStream;->closed:Z

    .line 186
    return-void
.end method

.method public getData()[B
    .registers 2

    .prologue
    .line 156
    iget-object v0, p0, Lorg/apache/commons/io/output/DeferredFileOutputStream;->memoryOutputStream:Lorg/apache/commons/io/output/ByteArrayOutputStream;

    if-eqz v0, :cond_b

    .line 158
    iget-object v0, p0, Lorg/apache/commons/io/output/DeferredFileOutputStream;->memoryOutputStream:Lorg/apache/commons/io/output/ByteArrayOutputStream;

    invoke-virtual {v0}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 160
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getFile()Ljava/io/File;
    .registers 2

    .prologue
    .line 173
    iget-object v0, p0, Lorg/apache/commons/io/output/DeferredFileOutputStream;->outputFile:Ljava/io/File;

    return-object v0
.end method

.method protected getStream()Ljava/io/OutputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 109
    iget-object v0, p0, Lorg/apache/commons/io/output/DeferredFileOutputStream;->currentOutputStream:Ljava/io/OutputStream;

    return-object v0
.end method

.method public isInMemory()Z
    .registers 2

    .prologue
    .line 142
    invoke-virtual {p0}, Lorg/apache/commons/io/output/DeferredFileOutputStream;->isThresholdExceeded()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method protected thresholdReached()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 123
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v1, p0, Lorg/apache/commons/io/output/DeferredFileOutputStream;->outputFile:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 124
    .local v0, "fos":Ljava/io/FileOutputStream;
    iget-object v1, p0, Lorg/apache/commons/io/output/DeferredFileOutputStream;->memoryOutputStream:Lorg/apache/commons/io/output/ByteArrayOutputStream;

    invoke-virtual {v1, v0}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->writeTo(Ljava/io/OutputStream;)V

    .line 125
    iput-object v0, p0, Lorg/apache/commons/io/output/DeferredFileOutputStream;->currentOutputStream:Ljava/io/OutputStream;

    .line 126
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/commons/io/output/DeferredFileOutputStream;->memoryOutputStream:Lorg/apache/commons/io/output/ByteArrayOutputStream;

    .line 127
    return-void
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 5
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 201
    iget-boolean v1, p0, Lorg/apache/commons/io/output/DeferredFileOutputStream;->closed:Z

    if-nez v1, :cond_c

    .line 203
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Stream not closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 206
    :cond_c
    invoke-virtual {p0}, Lorg/apache/commons/io/output/DeferredFileOutputStream;->isInMemory()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 208
    iget-object v1, p0, Lorg/apache/commons/io/output/DeferredFileOutputStream;->memoryOutputStream:Lorg/apache/commons/io/output/ByteArrayOutputStream;

    invoke-virtual {v1, p1}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->writeTo(Ljava/io/OutputStream;)V

    .line 219
    :goto_17
    return-void

    .line 212
    :cond_18
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lorg/apache/commons/io/output/DeferredFileOutputStream;->outputFile:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 214
    .local v0, "fis":Ljava/io/FileInputStream;
    :try_start_1f
    invoke-static {v0, p1}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I
    :try_end_22
    .catchall {:try_start_1f .. :try_end_22} :catchall_26

    .line 216
    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    goto :goto_17

    :catchall_26
    move-exception v1

    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    throw v1
.end method
