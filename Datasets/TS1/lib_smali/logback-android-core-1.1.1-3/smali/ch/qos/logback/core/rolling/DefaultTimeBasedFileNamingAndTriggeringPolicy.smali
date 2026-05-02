.class public Lch/qos/logback/core/rolling/DefaultTimeBasedFileNamingAndTriggeringPolicy;
.super Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicyBase;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicyBase",
        "<TE;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicyBase;-><init>()V

    return-void
.end method


# virtual methods
.method public isTriggeringEvent(Ljava/io/File;Ljava/lang/Object;)Z
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "TE;)Z"
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/core/rolling/DefaultTimeBasedFileNamingAndTriggeringPolicy;->getCurrentTime()J

    move-result-wide v0

    iget-wide v2, p0, Lch/qos/logback/core/rolling/DefaultTimeBasedFileNamingAndTriggeringPolicy;->nextCheck:J

    cmp-long v2, v0, v2

    if-ltz v2, :cond_34

    iget-object v2, p0, Lch/qos/logback/core/rolling/DefaultTimeBasedFileNamingAndTriggeringPolicy;->dateInCurrentPeriod:Ljava/util/Date;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Elapsed period: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lch/qos/logback/core/rolling/DefaultTimeBasedFileNamingAndTriggeringPolicy;->addInfo(Ljava/lang/String;)V

    iget-object v3, p0, Lch/qos/logback/core/rolling/DefaultTimeBasedFileNamingAndTriggeringPolicy;->tbrp:Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;

    iget-object v3, v3, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->fileNamePatternWCS:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    invoke-virtual {v3, v2}, Lch/qos/logback/core/rolling/helper/FileNamePattern;->convert(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lch/qos/logback/core/rolling/DefaultTimeBasedFileNamingAndTriggeringPolicy;->elapsedPeriodsFileName:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lch/qos/logback/core/rolling/DefaultTimeBasedFileNamingAndTriggeringPolicy;->setDateInCurrentPeriod(J)V

    invoke-virtual {p0}, Lch/qos/logback/core/rolling/DefaultTimeBasedFileNamingAndTriggeringPolicy;->computeNextCheck()V

    const/4 v0, 0x1

    :goto_33
    return v0

    :cond_34
    const/4 v0, 0x0

    goto :goto_33
.end method

.method public start()V
    .registers 4

    invoke-super {p0}, Lch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicyBase;->start()V

    new-instance v0, Lch/qos/logback/core/rolling/helper/TimeBasedArchiveRemover;

    iget-object v1, p0, Lch/qos/logback/core/rolling/DefaultTimeBasedFileNamingAndTriggeringPolicy;->tbrp:Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;

    iget-object v1, v1, Lch/qos/logback/core/rolling/TimeBasedRollingPolicy;->fileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    iget-object v2, p0, Lch/qos/logback/core/rolling/DefaultTimeBasedFileNamingAndTriggeringPolicy;->rc:Lch/qos/logback/core/rolling/helper/RollingCalendar;

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/rolling/helper/TimeBasedArchiveRemover;-><init>(Lch/qos/logback/core/rolling/helper/FileNamePattern;Lch/qos/logback/core/rolling/helper/RollingCalendar;)V

    iput-object v0, p0, Lch/qos/logback/core/rolling/DefaultTimeBasedFileNamingAndTriggeringPolicy;->archiveRemover:Lch/qos/logback/core/rolling/helper/ArchiveRemover;

    iget-object v0, p0, Lch/qos/logback/core/rolling/DefaultTimeBasedFileNamingAndTriggeringPolicy;->archiveRemover:Lch/qos/logback/core/rolling/helper/ArchiveRemover;

    iget-object v1, p0, Lch/qos/logback/core/rolling/DefaultTimeBasedFileNamingAndTriggeringPolicy;->context:Lch/qos/logback/core/Context;

    invoke-interface {v0, v1}, Lch/qos/logback/core/rolling/helper/ArchiveRemover;->setContext(Lch/qos/logback/core/Context;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/core/rolling/DefaultTimeBasedFileNamingAndTriggeringPolicy;->started:Z

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    const-string v0, "c.q.l.core.rolling.DefaultTimeBasedFileNamingAndTriggeringPolicy"

    return-object v0
.end method
