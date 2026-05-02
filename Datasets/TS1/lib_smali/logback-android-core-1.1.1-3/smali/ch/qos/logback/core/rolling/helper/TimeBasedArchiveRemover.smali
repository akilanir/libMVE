.class public Lch/qos/logback/core/rolling/helper/TimeBasedArchiveRemover;
.super Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;


# direct methods
.method public constructor <init>(Lch/qos/logback/core/rolling/helper/FileNamePattern;Lch/qos/logback/core/rolling/helper/RollingCalendar;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;-><init>(Lch/qos/logback/core/rolling/helper/FileNamePattern;Lch/qos/logback/core/rolling/helper/RollingCalendar;)V

    return-void
.end method


# virtual methods
.method protected cleanByPeriodOffset(Ljava/util/Date;I)V
    .registers 6

    iget-object v0, p0, Lch/qos/logback/core/rolling/helper/TimeBasedArchiveRemover;->rc:Lch/qos/logback/core/rolling/helper/RollingCalendar;

    invoke-virtual {v0, p1, p2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->getRelativeDate(Ljava/util/Date;I)Ljava/util/Date;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/rolling/helper/TimeBasedArchiveRemover;->fileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    invoke-virtual {v1, v0}, Lch/qos/logback/core/rolling/helper/FileNamePattern;->convert(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_41

    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_41

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "deleting "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/helper/TimeBasedArchiveRemover;->addInfo(Ljava/lang/String;)V

    iget-boolean v0, p0, Lch/qos/logback/core/rolling/helper/TimeBasedArchiveRemover;->parentClean:Z

    if-eqz v0, :cond_41

    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/helper/TimeBasedArchiveRemover;->removeFolderIfEmpty(Ljava/io/File;)V

    :cond_41
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    const-string v0, "c.q.l.core.rolling.helper.TimeBasedArchiveRemover"

    return-object v0
.end method
