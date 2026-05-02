.class public Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;
.super Lch/qos/logback/core/rolling/RollingPolicyBase;

# interfaces
.implements Lch/qos/logback/core/rolling/TriggeringPolicy;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/rolling/RollingPolicyBase;",
        "Lch/qos/logback/core/rolling/TriggeringPolicy",
        "<TE;>;"
    }
.end annotation


# static fields
.field static final FNP_NOT_SET:Ljava/lang/String; = "The FileNamePattern option must be set before using TimeBasedRollingPolicy. "

.field static final INFINITE_HISTORY:I


# instance fields
.field private archiveRemover:Lch/qos/logback/core/rolling/helper/ArchiveRemover;

.field cleanHistoryOnStart:Z

.field private compressor:Lch/qos/logback/core/rolling/helper/Compressor;

.field fileNamePatternWCS:Lch/qos/logback/core/rolling/helper/FileNamePattern;

.field future:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation
.end field

.field private maxHistory:I

.field private renameUtil:Lch/qos/logback/core/rolling/helper/RenameUtil;

.field timeBasedFileNamingAndTriggeringPolicy:Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy",
            "<TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    const/4 v1, 0x0

    invoke-direct {p0}, Lch/qos/logback/core/rolling/RollingPolicyBase;-><init>()V

    new-instance v0, Lch/qos/logback/core/rolling/helper/RenameUtil;

    invoke-direct {v0}, Lch/qos/logback/core/rolling/helper/RenameUtil;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->renameUtil:Lch/qos/logback/core/rolling/helper/RenameUtil;

    iput v1, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->maxHistory:I

    iput-boolean v1, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->cleanHistoryOnStart:Z

    return-void
.end method

.method private transformFileNamePattern2ZipEntry(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    invoke-static {p1}, Lch/qos/logback/core/rolling/helper/FileFilterUtil;->slashify(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lch/qos/logback/core/rolling/helper/FileFilterUtil;->afterLastSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private waitForAsynchronousJobToStop()V
    .registers 5

    iget-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->future:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_d

    :try_start_4
    iget-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->future:Ljava/util/concurrent/Future;

    const-wide/16 v1, 0x1e

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v1, v2, v3}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    :try_end_d
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_4 .. :try_end_d} :catch_e
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_d} :catch_15

    :cond_d
    :goto_d
    return-void

    :catch_e
    move-exception v0

    const-string v1, "Timeout while waiting for compression job to finish"

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_d

    :catch_15
    move-exception v0

    const-string v1, "Unexpected exception while waiting for compression job to finish"

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_d
.end method


# virtual methods
.method asyncCompress(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/concurrent/Future;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/rolling/RolloverFailure;
        }
    .end annotation

    new-instance v0, Lch/qos/logback/core/rolling/helper/AsynchronousCompressor;

    iget-object v1, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->compressor:Lch/qos/logback/core/rolling/helper/Compressor;

    invoke-direct {v0, v1}, Lch/qos/logback/core/rolling/helper/AsynchronousCompressor;-><init>(Lch/qos/logback/core/rolling/helper/Compressor;)V

    invoke-virtual {v0, p1, p2, p3}, Lch/qos/logback/core/rolling/helper/AsynchronousCompressor;->compressAsynchronously(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0
.end method

.method public getActiveFileName()Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->getParentsRawFileProperty()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_7

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->timeBasedFileNamingAndTriggeringPolicy:Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;

    invoke-interface {v0}, Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;->getCurrentPeriodsFileNameWithoutCompressionSuffix()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public getMaxHistory()I
    .registers 2

    iget v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->maxHistory:I

    return v0
.end method

.method public getTimeBasedFileNamingAndTriggeringPolicy()Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy",
            "<TE;>;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->timeBasedFileNamingAndTriggeringPolicy:Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;

    return-object v0
.end method

.method public isCleanHistoryOnStart()Z
    .registers 2

    iget-boolean v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->cleanHistoryOnStart:Z

    return v0
.end method

.method public isTriggeringEvent(Ljava/io/File;Ljava/lang/Object;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "TE;)Z"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->timeBasedFileNamingAndTriggeringPolicy:Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;

    invoke-interface {v0, p1, p2}, Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;->isTriggeringEvent(Ljava/io/File;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method renamedRawAndAsyncCompress(Ljava/lang/String;Ljava/lang/String;)Ljava/util/concurrent/Future;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/rolling/RolloverFailure;
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->getParentsRawFileProperty()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".tmp"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->renameUtil:Lch/qos/logback/core/rolling/helper/RenameUtil;

    invoke-virtual {v2, v0, v1}, Lch/qos/logback/core/rolling/helper/RenameUtil;->rename(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v1, p1, p2}, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->asyncCompress(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0
.end method

.method public rollover()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/rolling/RolloverFailure;
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->timeBasedFileNamingAndTriggeringPolicy:Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;

    invoke-interface {v0}, Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;->getElapsedPeriodsFileName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lch/qos/logback/core/rolling/helper/FileFilterUtil;->afterLastSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->compressionMode:Lch/qos/logback/core/rolling/helper/CompressionMode;

    sget-object v3, Lch/qos/logback/core/rolling/helper/CompressionMode;->NONE:Lch/qos/logback/core/rolling/helper/CompressionMode;

    if-ne v2, v3, :cond_34

    invoke-virtual {p0}, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->getParentsRawFileProperty()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1f

    iget-object v1, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->renameUtil:Lch/qos/logback/core/rolling/helper/RenameUtil;

    invoke-virtual {p0}, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->getParentsRawFileProperty()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lch/qos/logback/core/rolling/helper/RenameUtil;->rename(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1f
    :goto_1f
    iget-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->archiveRemover:Lch/qos/logback/core/rolling/helper/ArchiveRemover;

    if-eqz v0, :cond_33

    iget-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->archiveRemover:Lch/qos/logback/core/rolling/helper/ArchiveRemover;

    new-instance v1, Ljava/util/Date;

    iget-object v2, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->timeBasedFileNamingAndTriggeringPolicy:Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;

    invoke-interface {v2}, Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;->getCurrentTime()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-interface {v0, v1}, Lch/qos/logback/core/rolling/helper/ArchiveRemover;->clean(Ljava/util/Date;)V

    :cond_33
    return-void

    :cond_34
    invoke-virtual {p0}, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->getParentsRawFileProperty()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_41

    invoke-virtual {p0, v0, v0, v1}, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->asyncCompress(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->future:Ljava/util/concurrent/Future;

    goto :goto_1f

    :cond_41
    invoke-virtual {p0, v0, v1}, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->renamedRawAndAsyncCompress(Ljava/lang/String;Ljava/lang/String;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->future:Ljava/util/concurrent/Future;

    goto :goto_1f
.end method

.method public setCleanHistoryOnStart(Z)V
    .registers 2

    iput-boolean p1, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->cleanHistoryOnStart:Z

    return-void
.end method

.method public setMaxHistory(I)V
    .registers 2

    iput p1, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->maxHistory:I

    return-void
.end method

.method public setTimeBasedFileNamingAndTriggeringPolicy(Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy",
            "<TE;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->timeBasedFileNamingAndTriggeringPolicy:Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;

    return-void
.end method

.method public start()V
    .registers 5

    iget-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->renameUtil:Lch/qos/logback/core/rolling/helper/RenameUtil;

    iget-object v1, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->context:Lch/qos/logback/core/Context;

    invoke-virtual {v0, v1}, Lch/qos/logback/core/rolling/helper/RenameUtil;->setContext(Lch/qos/logback/core/Context;)V

    iget-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->fileNamePatternStr:Ljava/lang/String;

    if-eqz v0, :cond_b9

    new-instance v0, Lch/qos/logback/core/rolling/helper/FileNamePattern;

    iget-object v1, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->fileNamePatternStr:Ljava/lang/String;

    iget-object v2, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->context:Lch/qos/logback/core/Context;

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/rolling/helper/FileNamePattern;-><init>(Ljava/lang/String;Lch/qos/logback/core/Context;)V

    iput-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->fileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    invoke-virtual {p0}, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->determineCompressionMode()V

    new-instance v0, Lch/qos/logback/core/rolling/helper/Compressor;

    iget-object v1, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->compressionMode:Lch/qos/logback/core/rolling/helper/CompressionMode;

    invoke-direct {v0, v1}, Lch/qos/logback/core/rolling/helper/Compressor;-><init>(Lch/qos/logback/core/rolling/helper/CompressionMode;)V

    iput-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->compressor:Lch/qos/logback/core/rolling/helper/Compressor;

    iget-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->compressor:Lch/qos/logback/core/rolling/helper/Compressor;

    iget-object v1, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->context:Lch/qos/logback/core/Context;

    invoke-virtual {v0, v1}, Lch/qos/logback/core/rolling/helper/Compressor;->setContext(Lch/qos/logback/core/Context;)V

    new-instance v0, Lch/qos/logback/core/rolling/helper/FileNamePattern;

    iget-object v1, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->fileNamePatternStr:Ljava/lang/String;

    iget-object v2, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->compressionMode:Lch/qos/logback/core/rolling/helper/CompressionMode;

    invoke-static {v1, v2}, Lch/qos/logback/core/rolling/helper/Compressor;->computeFileNameStr_WCS(Ljava/lang/String;Lch/qos/logback/core/rolling/helper/CompressionMode;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->context:Lch/qos/logback/core/Context;

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/rolling/helper/FileNamePattern;-><init>(Ljava/lang/String;Lch/qos/logback/core/Context;)V

    iput-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->fileNamePatternWCS:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Will use the pattern "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->fileNamePatternWCS:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " for the active file"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->addInfo(Ljava/lang/String;)V

    iget-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->compressionMode:Lch/qos/logback/core/rolling/helper/CompressionMode;

    sget-object v1, Lch/qos/logback/core/rolling/helper/CompressionMode;->ZIP:Lch/qos/logback/core/rolling/helper/CompressionMode;

    if-ne v0, v1, :cond_6d

    iget-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->fileNamePatternStr:Ljava/lang/String;

    invoke-direct {p0, v0}, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->transformFileNamePattern2ZipEntry(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lch/qos/logback/core/rolling/helper/FileNamePattern;

    iget-object v2, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->context:Lch/qos/logback/core/Context;

    invoke-direct {v1, v0, v2}, Lch/qos/logback/core/rolling/helper/FileNamePattern;-><init>(Ljava/lang/String;Lch/qos/logback/core/Context;)V

    iput-object v1, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->zipEntryFileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    :cond_6d
    iget-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->timeBasedFileNamingAndTriggeringPolicy:Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;

    if-nez v0, :cond_78

    new-instance v0, Lch/qos/logback/core/rolling/DefaultTimeBasedFileNamingAndTriggeringPolicy;

    invoke-direct {v0}, Lch/qos/logback/core/rolling/DefaultTimeBasedFileNamingAndTriggeringPolicy;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->timeBasedFileNamingAndTriggeringPolicy:Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;

    :cond_78
    iget-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->timeBasedFileNamingAndTriggeringPolicy:Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;

    iget-object v1, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->context:Lch/qos/logback/core/Context;

    invoke-interface {v0, v1}, Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;->setContext(Lch/qos/logback/core/Context;)V

    iget-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->timeBasedFileNamingAndTriggeringPolicy:Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;

    invoke-interface {v0, p0}, Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;->setTimeBasedRollingPolicy(Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;)V

    iget-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->timeBasedFileNamingAndTriggeringPolicy:Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;

    invoke-interface {v0}, Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;->start()V

    iget v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->maxHistory:I

    if-eqz v0, :cond_b5

    iget-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->timeBasedFileNamingAndTriggeringPolicy:Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;

    invoke-interface {v0}, Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;->getArchiveRemover()Lch/qos/logback/core/rolling/helper/ArchiveRemover;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->archiveRemover:Lch/qos/logback/core/rolling/helper/ArchiveRemover;

    iget-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->archiveRemover:Lch/qos/logback/core/rolling/helper/ArchiveRemover;

    iget v1, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->maxHistory:I

    invoke-interface {v0, v1}, Lch/qos/logback/core/rolling/helper/ArchiveRemover;->setMaxHistory(I)V

    iget-boolean v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->cleanHistoryOnStart:Z

    if-eqz v0, :cond_b5

    const-string v0, "Cleaning on start up"

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->addInfo(Ljava/lang/String;)V

    iget-object v0, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->archiveRemover:Lch/qos/logback/core/rolling/helper/ArchiveRemover;

    new-instance v1, Ljava/util/Date;

    iget-object v2, p0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->timeBasedFileNamingAndTriggeringPolicy:Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;

    invoke-interface {v2}, Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy;->getCurrentTime()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-interface {v0, v1}, Lch/qos/logback/core/rolling/helper/ArchiveRemover;->clean(Ljava/util/Date;)V

    :cond_b5
    invoke-super {p0}, Lch/qos/logback/core/rolling/RollingPolicyBase;->start()V

    return-void

    :cond_b9
    const-string v0, "The FileNamePattern option must be set before using TimeBasedRollingPolicy. "

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->addWarn(Ljava/lang/String;)V

    const-string v0, "See also http://logback.qos.ch/codes.html#tbr_fnp_not_set"

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->addWarn(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The FileNamePattern option must be set before using TimeBasedRollingPolicy. See also http://logback.qos.ch/codes.html#tbr_fnp_not_set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public stop()V
    .registers 2

    invoke-virtual {p0}, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->isStarted()Z

    move-result v0

    if-nez v0, :cond_7

    :goto_6
    return-void

    :cond_7
    invoke-direct {p0}, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->waitForAsynchronousJobToStop()V

    invoke-super {p0}, Lch/qos/logback/core/rolling/RollingPolicyBase;->stop()V

    goto :goto_6
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    const-string v0, "c.q.l.core.rolling.TimeBasedRollingPolicy"

    return-object v0
.end method
