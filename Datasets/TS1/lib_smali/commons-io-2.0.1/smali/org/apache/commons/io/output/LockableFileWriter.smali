.class public Lorg/apache/commons/io/output/LockableFileWriter;
.super Ljava/io/Writer;
.source "LockableFileWriter.java"


# static fields
.field private static final LCK:Ljava/lang/String; = ".lck"


# instance fields
.field private final lockFile:Ljava/io/File;

.field private final out:Ljava/io/Writer;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 4
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 114
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/commons/io/output/LockableFileWriter;-><init>(Ljava/io/File;ZLjava/lang/String;)V

    .line 115
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;)V
    .registers 5
    .param p1, "file"    # Ljava/io/File;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 151
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/apache/commons/io/output/LockableFileWriter;-><init>(Ljava/io/File;Ljava/lang/String;ZLjava/lang/String;)V

    .line 152
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;ZLjava/lang/String;)V
    .registers 9
    .param p1, "file"    # Ljava/io/File;
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "append"    # Z
    .param p4, "lockDir"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 166
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    .line 168
    invoke-virtual {p1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object p1

    .line 169
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_14

    .line 170
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/commons/io/FileUtils;->forceMkdir(Ljava/io/File;)V

    .line 172
    :cond_14
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_22

    .line 173
    new-instance v1, Ljava/io/IOException;

    const-string v2, "File specified is a directory"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 177
    :cond_22
    if-nez p4, :cond_2a

    .line 178
    const-string v1, "java.io.tmpdir"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    .line 180
    :cond_2a
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 181
    .local v0, "lockDirFile":Ljava/io/File;
    invoke-static {v0}, Lorg/apache/commons/io/FileUtils;->forceMkdir(Ljava/io/File;)V

    .line 182
    invoke-direct {p0, v0}, Lorg/apache/commons/io/output/LockableFileWriter;->testLockDir(Ljava/io/File;)V

    .line 183
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".lck"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/commons/io/output/LockableFileWriter;->lockFile:Ljava/io/File;

    .line 186
    invoke-direct {p0}, Lorg/apache/commons/io/output/LockableFileWriter;->createLock()V

    .line 189
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/io/output/LockableFileWriter;->initWriter(Ljava/io/File;Ljava/lang/String;Z)Ljava/io/Writer;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/io/output/LockableFileWriter;->out:Ljava/io/Writer;

    .line 190
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Z)V
    .registers 4
    .param p1, "file"    # Ljava/io/File;
    .param p2, "append"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 126
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/io/output/LockableFileWriter;-><init>(Ljava/io/File;ZLjava/lang/String;)V

    .line 127
    return-void
.end method

.method public constructor <init>(Ljava/io/File;ZLjava/lang/String;)V
    .registers 5
    .param p1, "file"    # Ljava/io/File;
    .param p2, "append"    # Z
    .param p3, "lockDir"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 139
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Lorg/apache/commons/io/output/LockableFileWriter;-><init>(Ljava/io/File;Ljava/lang/String;ZLjava/lang/String;)V

    .line 140
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/commons/io/output/LockableFileWriter;-><init>(Ljava/lang/String;ZLjava/lang/String;)V

    .line 78
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 4
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "append"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/io/output/LockableFileWriter;-><init>(Ljava/lang/String;ZLjava/lang/String;)V

    .line 90
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZLjava/lang/String;)V
    .registers 5
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "append"    # Z
    .param p3, "lockDir"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2, p3}, Lorg/apache/commons/io/output/LockableFileWriter;-><init>(Ljava/io/File;ZLjava/lang/String;)V

    .line 103
    return-void
.end method

.method private createLock()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 217
    const-class v1, Lorg/apache/commons/io/output/LockableFileWriter;

    monitor-enter v1

    .line 218
    :try_start_3
    iget-object v0, p0, Lorg/apache/commons/io/output/LockableFileWriter;->lockFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z

    move-result v0

    if-nez v0, :cond_33

    .line 219
    new-instance v0, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Can\'t write file, lock "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/io/output/LockableFileWriter;->lockFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " exists"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 223
    :catchall_30
    move-exception v0

    monitor-exit v1
    :try_end_32
    .catchall {:try_start_3 .. :try_end_32} :catchall_30

    throw v0

    .line 222
    :cond_33
    :try_start_33
    iget-object v0, p0, Lorg/apache/commons/io/output/LockableFileWriter;->lockFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->deleteOnExit()V

    .line 223
    monitor-exit v1
    :try_end_39
    .catchall {:try_start_33 .. :try_end_39} :catchall_30

    .line 224
    return-void
.end method

.method private initWriter(Ljava/io/File;Ljava/lang/String;Z)Ljava/io/Writer;
    .registers 11
    .param p1, "file"    # Ljava/io/File;
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "append"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 237
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    .line 238
    .local v1, "fileExistedAlready":Z
    const/4 v2, 0x0

    .line 239
    .local v2, "stream":Ljava/io/OutputStream;
    const/4 v4, 0x0

    .line 241
    .local v4, "writer":Ljava/io/Writer;
    if-nez p2, :cond_13

    .line 242
    :try_start_8
    new-instance v5, Ljava/io/FileWriter;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, p3}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;Z)V

    .end local v4    # "writer":Ljava/io/Writer;
    .local v5, "writer":Ljava/io/Writer;
    move-object v4, v5

    .line 264
    .end local v5    # "writer":Ljava/io/Writer;
    .restart local v4    # "writer":Ljava/io/Writer;
    :goto_12
    return-object v4

    .line 244
    :cond_13
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6, p3}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_1c} :catch_24
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_1c} :catch_36

    .line 245
    .end local v2    # "stream":Ljava/io/OutputStream;
    .local v3, "stream":Ljava/io/OutputStream;
    :try_start_1c
    new-instance v5, Ljava/io/OutputStreamWriter;

    invoke-direct {v5, v3, p2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_21
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_21} :catch_4b
    .catch Ljava/lang/RuntimeException; {:try_start_1c .. :try_end_21} :catch_48

    .end local v4    # "writer":Ljava/io/Writer;
    .restart local v5    # "writer":Ljava/io/Writer;
    move-object v4, v5

    .end local v5    # "writer":Ljava/io/Writer;
    .restart local v4    # "writer":Ljava/io/Writer;
    move-object v2, v3

    .end local v3    # "stream":Ljava/io/OutputStream;
    .restart local v2    # "stream":Ljava/io/OutputStream;
    goto :goto_12

    .line 247
    :catch_24
    move-exception v0

    .line 248
    .local v0, "ex":Ljava/io/IOException;
    :goto_25
    invoke-static {v4}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/Writer;)V

    .line 249
    invoke-static {v2}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    .line 250
    iget-object v6, p0, Lorg/apache/commons/io/output/LockableFileWriter;->lockFile:Ljava/io/File;

    invoke-static {v6}, Lorg/apache/commons/io/FileUtils;->deleteQuietly(Ljava/io/File;)Z

    .line 251
    if-nez v1, :cond_35

    .line 252
    invoke-static {p1}, Lorg/apache/commons/io/FileUtils;->deleteQuietly(Ljava/io/File;)Z

    .line 254
    :cond_35
    throw v0

    .line 255
    .end local v0    # "ex":Ljava/io/IOException;
    :catch_36
    move-exception v0

    .line 256
    .local v0, "ex":Ljava/lang/RuntimeException;
    :goto_37
    invoke-static {v4}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/Writer;)V

    .line 257
    invoke-static {v2}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    .line 258
    iget-object v6, p0, Lorg/apache/commons/io/output/LockableFileWriter;->lockFile:Ljava/io/File;

    invoke-static {v6}, Lorg/apache/commons/io/FileUtils;->deleteQuietly(Ljava/io/File;)Z

    .line 259
    if-nez v1, :cond_47

    .line 260
    invoke-static {p1}, Lorg/apache/commons/io/FileUtils;->deleteQuietly(Ljava/io/File;)Z

    .line 262
    :cond_47
    throw v0

    .line 255
    .end local v0    # "ex":Ljava/lang/RuntimeException;
    .end local v2    # "stream":Ljava/io/OutputStream;
    .restart local v3    # "stream":Ljava/io/OutputStream;
    :catch_48
    move-exception v0

    move-object v2, v3

    .end local v3    # "stream":Ljava/io/OutputStream;
    .restart local v2    # "stream":Ljava/io/OutputStream;
    goto :goto_37

    .line 247
    .end local v2    # "stream":Ljava/io/OutputStream;
    .restart local v3    # "stream":Ljava/io/OutputStream;
    :catch_4b
    move-exception v0

    move-object v2, v3

    .end local v3    # "stream":Ljava/io/OutputStream;
    .restart local v2    # "stream":Ljava/io/OutputStream;
    goto :goto_25
.end method

.method private testLockDir(Ljava/io/File;)V
    .registers 5
    .param p1, "lockDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 201
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_23

    .line 202
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not find lockDir: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 205
    :cond_23
    invoke-virtual {p1}, Ljava/io/File;->canWrite()Z

    move-result v0

    if-nez v0, :cond_46

    .line 206
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not write to lockDir: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 209
    :cond_46
    return-void
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 276
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/io/output/LockableFileWriter;->out:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->close()V
    :try_end_5
    .catchall {:try_start_0 .. :try_end_5} :catchall_b

    .line 278
    iget-object v0, p0, Lorg/apache/commons/io/output/LockableFileWriter;->lockFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 280
    return-void

    .line 278
    :catchall_b
    move-exception v0

    iget-object v1, p0, Lorg/apache/commons/io/output/LockableFileWriter;->lockFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    throw v0
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 343
    iget-object v0, p0, Lorg/apache/commons/io/output/LockableFileWriter;->out:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 344
    return-void
.end method

.method public write(I)V
    .registers 3
    .param p1, "idx"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 290
    iget-object v0, p0, Lorg/apache/commons/io/output/LockableFileWriter;->out:Ljava/io/Writer;

    invoke-virtual {v0, p1}, Ljava/io/Writer;->write(I)V

    .line 291
    return-void
.end method

.method public write(Ljava/lang/String;)V
    .registers 3
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 322
    iget-object v0, p0, Lorg/apache/commons/io/output/LockableFileWriter;->out:Ljava/io/Writer;

    invoke-virtual {v0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 323
    return-void
.end method

.method public write(Ljava/lang/String;II)V
    .registers 5
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "st"    # I
    .param p3, "end"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 334
    iget-object v0, p0, Lorg/apache/commons/io/output/LockableFileWriter;->out:Ljava/io/Writer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/Writer;->write(Ljava/lang/String;II)V

    .line 335
    return-void
.end method

.method public write([C)V
    .registers 3
    .param p1, "chr"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 300
    iget-object v0, p0, Lorg/apache/commons/io/output/LockableFileWriter;->out:Ljava/io/Writer;

    invoke-virtual {v0, p1}, Ljava/io/Writer;->write([C)V

    .line 301
    return-void
.end method

.method public write([CII)V
    .registers 5
    .param p1, "chr"    # [C
    .param p2, "st"    # I
    .param p3, "end"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 312
    iget-object v0, p0, Lorg/apache/commons/io/output/LockableFileWriter;->out:Ljava/io/Writer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/Writer;->write([CII)V

    .line 313
    return-void
.end method
