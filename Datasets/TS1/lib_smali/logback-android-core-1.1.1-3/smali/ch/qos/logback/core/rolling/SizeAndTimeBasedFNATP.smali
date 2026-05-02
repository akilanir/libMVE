.class public Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;
.super Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicyBase;


# annotations
.annotation runtime Lch/qos/logback/core/joran/spi/NoAutoStart;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicyBase",
        "<TE;>;"
    }
.end annotation


# instance fields
.field currentPeriodsCounter:I

.field private invocationCounter:I

.field private invocationMask:I

.field maxFileSize:Lch/qos/logback/core/util/FileSize;

.field maxFileSizeAsString:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicyBase;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->currentPeriodsCounter:I

    const/4 v0, 0x1

    iput v0, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->invocationMask:I

    return-void
.end method

.method private getFileNameIncludingCompressionSuffix(Ljava/util/Date;I)Ljava/lang/String;
    .registers 7

    iget-object v0, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->tbrp:Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;

    iget-object v0, v0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->fileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->dateInCurrentPeriod:Ljava/util/Date;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lch/qos/logback/core/rolling/helper/FileNamePattern;->convertMultipleArguments([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method computeCurrentPeriodsHighestCounterValue(Ljava/lang/String;)V
    .registers 4

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->getCurrentPeriodsFileNameWithoutCompressionSuffix()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-static {v0, p1}, Lch/qos/logback/core/rolling/helper/FileFilterUtil;->filesInFolderMatchingStemRegex(Ljava/io/File;Ljava/lang/String;)[Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_16

    array-length v1, v0

    if-nez v1, :cond_1a

    :cond_16
    const/4 v0, 0x0

    iput v0, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->currentPeriodsCounter:I

    :cond_19
    :goto_19
    return-void

    :cond_1a
    invoke-static {v0, p1}, Lch/qos/logback/core/rolling/helper/FileFilterUtil;->findHighestCounter([Ljava/io/File;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->currentPeriodsCounter:I

    iget-object v0, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->tbrp:Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;

    invoke-virtual {v0}, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->getParentsRawFileProperty()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_30

    iget-object v0, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->tbrp:Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;

    iget-object v0, v0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->compressionMode:Lch/qos/logback/core/rolling/helper/CompressionMode;

    sget-object v1, Lch/qos/logback/core/rolling/helper/CompressionMode;->NONE:Lch/qos/logback/core/rolling/helper/CompressionMode;

    if-eq v0, v1, :cond_19

    :cond_30
    iget v0, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->currentPeriodsCounter:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->currentPeriodsCounter:I

    goto :goto_19
.end method

.method protected createArchiveRemover()Lch/qos/logback/core/rolling/helper/ArchiveRemover;
    .registers 4

    new-instance v0, Lch/qos/logback/core/rolling/helper/SizeAndTimeBasedArchiveRemover;

    iget-object v1, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->tbrp:Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;

    iget-object v1, v1, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->fileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    iget-object v2, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->rc:Lch/qos/logback/core/rolling/helper/RollingCalendar;

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/rolling/helper/SizeAndTimeBasedArchiveRemover;-><init>(Lch/qos/logback/core/rolling/helper/FileNamePattern;Lch/qos/logback/core/rolling/helper/RollingCalendar;)V

    return-object v0
.end method

.method public getCurrentPeriodsFileNameWithoutCompressionSuffix()Ljava/lang/String;
    .registers 5

    iget-object v0, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->tbrp:Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;

    iget-object v0, v0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->fileNamePatternWCS:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->dateInCurrentPeriod:Ljava/util/Date;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->currentPeriodsCounter:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lch/qos/logback/core/rolling/helper/FileNamePattern;->convertMultipleArguments([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMaxFileSize()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->maxFileSizeAsString:Ljava/lang/String;

    return-object v0
.end method

.method public isTriggeringEvent(Ljava/io/File;Ljava/lang/Object;)Z
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "TE;)Z"
        }
    .end annotation

    const/4 v6, 0x2

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0}, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->getCurrentTime()J

    move-result-wide v2

    iget-wide v4, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->nextCheck:J

    cmp-long v4, v2, v4

    if-ltz v4, :cond_2e

    iget-object v4, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->dateInCurrentPeriod:Ljava/util/Date;

    iget-object v5, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->tbrp:Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;

    iget-object v5, v5, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->fileNamePatternWCS:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v4, v6, v1

    iget v4, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->currentPeriodsCounter:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v6, v0

    invoke-virtual {v5, v6}, Lch/qos/logback/core/rolling/helper/FileNamePattern;->convertMultipleArguments([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->elapsedPeriodsFileName:Ljava/lang/String;

    iput v1, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->currentPeriodsCounter:I

    invoke-virtual {p0, v2, v3}, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->setDateInCurrentPeriod(J)V

    invoke-virtual {p0}, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->computeNextCheck()V

    :goto_2d
    return v0

    :cond_2e
    iget v2, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->invocationCounter:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->invocationCounter:I

    iget v3, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->invocationMask:I

    and-int/2addr v2, v3

    iget v3, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->invocationMask:I

    if-eq v2, v3, :cond_3d

    move v0, v1

    goto :goto_2d

    :cond_3d
    iget v2, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->invocationMask:I

    const/16 v3, 0xf

    if-ge v2, v3, :cond_4b

    iget v2, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->invocationMask:I

    shl-int/lit8 v2, v2, 0x1

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->invocationMask:I

    :cond_4b
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v2

    iget-object v4, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->maxFileSize:Lch/qos/logback/core/util/FileSize;

    invoke-virtual {v4}, Lch/qos/logback/core/util/FileSize;->getSize()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-ltz v2, :cond_78

    iget-object v2, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->tbrp:Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;

    iget-object v2, v2, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->fileNamePatternWCS:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->dateInCurrentPeriod:Ljava/util/Date;

    aput-object v4, v3, v1

    iget v1, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->currentPeriodsCounter:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v3, v0

    invoke-virtual {v2, v3}, Lch/qos/logback/core/rolling/helper/FileNamePattern;->convertMultipleArguments([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->elapsedPeriodsFileName:Ljava/lang/String;

    iget v1, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->currentPeriodsCounter:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->currentPeriodsCounter:I

    goto :goto_2d

    :cond_78
    move v0, v1

    goto :goto_2d
.end method

.method public setMaxFileSize(Ljava/lang/String;)V
    .registers 3

    iput-object p1, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->maxFileSizeAsString:Ljava/lang/String;

    invoke-static {p1}, Lch/qos/logback/core/util/FileSize;->valueOf(Ljava/lang/String;)Lch/qos/logback/core/util/FileSize;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->maxFileSize:Lch/qos/logback/core/util/FileSize;

    return-void
.end method

.method public start()V
    .registers 3

    invoke-super {p0}, Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicyBase;->start()V

    invoke-virtual {p0}, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->createArchiveRemover()Lch/qos/logback/core/rolling/helper/ArchiveRemover;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->archiveRemover:Lch/qos/logback/core/rolling/helper/ArchiveRemover;

    iget-object v0, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->archiveRemover:Lch/qos/logback/core/rolling/helper/ArchiveRemover;

    iget-object v1, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->context:Lch/qos/logback/core/Context;

    invoke-interface {v0, v1}, Lch/qos/logback/core/rolling/helper/ArchiveRemover;->setContext(Lch/qos/logback/core/Context;)V

    iget-object v0, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->tbrp:Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;

    iget-object v0, v0, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->fileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    iget-object v1, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->dateInCurrentPeriod:Ljava/util/Date;

    invoke-virtual {v0, v1}, Lch/qos/logback/core/rolling/helper/FileNamePattern;->toRegexForFixedDate(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lch/qos/logback/core/rolling/helper/FileFilterUtil;->afterLastSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->computeCurrentPeriodsHighestCounterValue(Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/core/rolling/SizeAndTimeBasedFNATP;->started:Z

    return-void
.end method
