.class public Lch/qos/logback/core/FileAppender;
.super Lch/qos/logback/core/OutputStreamAppender;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/OutputStreamAppender",
        "<TE;>;"
    }
.end annotation


# instance fields
.field protected append:Z

.field protected fileName:Ljava/lang/String;

.field private initialized:Z

.field private lazyInit:Z

.field private prudent:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    const/4 v1, 0x0

    invoke-direct {p0}, Lch/qos/logback/core/OutputStreamAppender;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/core/FileAppender;->append:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lch/qos/logback/core/FileAppender;->fileName:Ljava/lang/String;

    iput-boolean v1, p0, Lch/qos/logback/core/FileAppender;->prudent:Z

    iput-boolean v1, p0, Lch/qos/logback/core/FileAppender;->initialized:Z

    iput-boolean v1, p0, Lch/qos/logback/core/FileAppender;->lazyInit:Z

    return-void
.end method

.method private getAbsoluteFilePath(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    invoke-static {}, Lch/qos/logback/core/util/EnvUtil;->isAndroidOS()Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object v0, p0, Lch/qos/logback/core/FileAppender;->context:Lch/qos/logback/core/Context;

    const-string v1, "DATA_DIR"

    invoke-interface {v0, v1}, Lch/qos/logback/core/Context;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lch/qos/logback/core/util/FileUtil;->prefixRelativePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_12
    return-object p1
.end method

.method private safeWrite(Ljava/lang/Object;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/core/FileAppender;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/recovery/ResilientFileOutputStream;

    invoke-virtual {v0}, Lch/qos/logback/core/recovery/ResilientFileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    if-nez v0, :cond_d

    :cond_c
    :goto_c
    return-void

    :cond_d
    const/4 v1, 0x0

    :try_start_e
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->lock()Ljava/nio/channels/FileLock;

    move-result-object v1

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->position()J

    move-result-wide v2

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v4

    cmp-long v2, v4, v2

    if-eqz v2, :cond_21

    invoke-virtual {v0, v4, v5}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    :cond_21
    invoke-super {p0, p1}, Lch/qos/logback/core/OutputStreamAppender;->writeOut(Ljava/lang/Object;)V
    :try_end_24
    .catchall {:try_start_e .. :try_end_24} :catchall_2a

    if-eqz v1, :cond_c

    invoke-virtual {v1}, Ljava/nio/channels/FileLock;->release()V

    goto :goto_c

    :catchall_2a
    move-exception v0

    if-eqz v1, :cond_30

    invoke-virtual {v1}, Ljava/nio/channels/FileLock;->release()V

    :cond_30
    throw v0
.end method


# virtual methods
.method public getFile()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/FileAppender;->fileName:Ljava/lang/String;

    return-object v0
.end method

.method public getLazy()Z
    .registers 2

    iget-boolean v0, p0, Lch/qos/logback/core/FileAppender;->lazyInit:Z

    return v0
.end method

.method public isAppend()Z
    .registers 2

    iget-boolean v0, p0, Lch/qos/logback/core/FileAppender;->append:Z

    return v0
.end method

.method public isPrudent()Z
    .registers 2

    iget-boolean v0, p0, Lch/qos/logback/core/FileAppender;->prudent:Z

    return v0
.end method

.method protected openFile(Ljava/lang/String;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0, p1}, Lch/qos/logback/core/FileAppender;->getAbsoluteFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/FileAppender;->lock:Lch/qos/logback/core/spi/LogbackLock;

    monitor-enter v1

    :try_start_7
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lch/qos/logback/core/util/FileUtil;->isParentDirectoryCreationRequired(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_38

    invoke-static {v2}, Lch/qos/logback/core/util/FileUtil;->createMissingParentDirectories(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_38

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to create parent directories for ["

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "]"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/FileAppender;->addError(Ljava/lang/String;)V

    :cond_38
    new-instance v0, Lch/qos/logback/core/recovery/ResilientFileOutputStream;

    iget-boolean v3, p0, Lch/qos/logback/core/FileAppender;->append:Z

    invoke-direct {v0, v2, v3}, Lch/qos/logback/core/recovery/ResilientFileOutputStream;-><init>(Ljava/io/File;Z)V

    iget-object v2, p0, Lch/qos/logback/core/FileAppender;->context:Lch/qos/logback/core/Context;

    invoke-virtual {v0, v2}, Lch/qos/logback/core/recovery/ResilientFileOutputStream;->setContext(Lch/qos/logback/core/Context;)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/FileAppender;->setOutputStream(Ljava/io/OutputStream;)V

    const/4 v0, 0x1

    monitor-exit v1

    return v0

    :catchall_4a
    move-exception v0

    monitor-exit v1
    :try_end_4c
    .catchall {:try_start_7 .. :try_end_4c} :catchall_4a

    throw v0
.end method

.method public final rawFileProperty()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/FileAppender;->fileName:Ljava/lang/String;

    return-object v0
.end method

.method public setAppend(Z)V
    .registers 2

    iput-boolean p1, p0, Lch/qos/logback/core/FileAppender;->append:Z

    return-void
.end method

.method public setFile(Ljava/lang/String;)V
    .registers 3

    if-nez p1, :cond_6

    const/4 v0, 0x0

    iput-object v0, p0, Lch/qos/logback/core/FileAppender;->fileName:Ljava/lang/String;

    :goto_5
    return-void

    :cond_6
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/FileAppender;->fileName:Ljava/lang/String;

    goto :goto_5
.end method

.method public setLazy(Z)V
    .registers 2

    iput-boolean p1, p0, Lch/qos/logback/core/FileAppender;->lazyInit:Z

    return-void
.end method

.method public setPrudent(Z)V
    .registers 2

    iput-boolean p1, p0, Lch/qos/logback/core/FileAppender;->prudent:Z

    return-void
.end method

.method public start()V
    .registers 6

    const/4 v1, 0x1

    const/4 v0, 0x0

    invoke-virtual {p0}, Lch/qos/logback/core/FileAppender;->getFile()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_7b

    invoke-direct {p0, v2}, Lch/qos/logback/core/FileAppender;->getAbsoluteFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "File property is set to ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lch/qos/logback/core/FileAppender;->addInfo(Ljava/lang/String;)V

    iget-boolean v3, p0, Lch/qos/logback/core/FileAppender;->prudent:Z

    if-eqz v3, :cond_3a

    invoke-virtual {p0}, Lch/qos/logback/core/FileAppender;->isAppend()Z

    move-result v3

    if-nez v3, :cond_3a

    invoke-virtual {p0, v1}, Lch/qos/logback/core/FileAppender;->setAppend(Z)V

    const-string v3, "Setting \"Append\" property to true on account of \"Prudent\" mode"

    invoke-virtual {p0, v3}, Lch/qos/logback/core/FileAppender;->addWarn(Ljava/lang/String;)V

    :cond_3a
    iget-boolean v3, p0, Lch/qos/logback/core/FileAppender;->lazyInit:Z

    if-nez v3, :cond_72

    :try_start_3e
    invoke-virtual {p0, v2}, Lch/qos/logback/core/FileAppender;->openFile(Ljava/lang/String;)Z
    :try_end_41
    .catch Ljava/io/IOException; {:try_start_3e .. :try_end_41} :catch_47

    :goto_41
    if-nez v0, :cond_46

    invoke-super {p0}, Lch/qos/logback/core/OutputStreamAppender;->start()V

    :cond_46
    return-void

    :catch_47
    move-exception v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "openFile("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lch/qos/logback/core/FileAppender;->append:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") failed"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v0}, Lch/qos/logback/core/FileAppender;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    move v0, v1

    goto :goto_41

    :cond_72
    new-instance v1, Lch/qos/logback/core/NOPOutputStream;

    invoke-direct {v1}, Lch/qos/logback/core/NOPOutputStream;-><init>()V

    invoke-virtual {p0, v1}, Lch/qos/logback/core/FileAppender;->setOutputStream(Ljava/io/OutputStream;)V

    goto :goto_41

    :cond_7b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\"File\" property not set for appender named ["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lch/qos/logback/core/FileAppender;->name:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/FileAppender;->addError(Ljava/lang/String;)V

    move v0, v1

    goto :goto_41
.end method

.method protected subAppend(Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    iget-boolean v0, p0, Lch/qos/logback/core/FileAppender;->initialized:Z

    if-nez v0, :cond_12

    iget-boolean v0, p0, Lch/qos/logback/core/FileAppender;->lazyInit:Z

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/core/FileAppender;->initialized:Z

    :try_start_b
    invoke-virtual {p0}, Lch/qos/logback/core/FileAppender;->getFile()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/FileAppender;->openFile(Ljava/lang/String;)Z
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_12} :catch_16

    :cond_12
    :goto_12
    invoke-super {p0, p1}, Lch/qos/logback/core/OutputStreamAppender;->subAppend(Ljava/lang/Object;)V

    return-void

    :catch_16
    move-exception v0

    const/4 v1, 0x0

    iput-boolean v1, p0, Lch/qos/logback/core/FileAppender;->started:Z

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "openFile("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/FileAppender;->fileName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lch/qos/logback/core/FileAppender;->append:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") failed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/FileAppender;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_12
.end method

.method protected writeOut(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Lch/qos/logback/core/FileAppender;->prudent:Z

    if-eqz v0, :cond_8

    invoke-direct {p0, p1}, Lch/qos/logback/core/FileAppender;->safeWrite(Ljava/lang/Object;)V

    :goto_7
    return-void

    :cond_8
    invoke-super {p0, p1}, Lch/qos/logback/core/OutputStreamAppender;->writeOut(Ljava/lang/Object;)V

    goto :goto_7
.end method
