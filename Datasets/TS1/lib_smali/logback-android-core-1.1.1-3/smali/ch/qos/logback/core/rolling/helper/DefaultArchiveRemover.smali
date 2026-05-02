.class public abstract Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;
.super Lch/qos/logback/core/spi/ContextAwareBase;

# interfaces
.implements Lch/qos/logback/core/rolling/helper/ArchiveRemover;


# static fields
.field protected static final INACTIVITY_TOLERANCE_IN_MILLIS:J = 0x149970000L

.field static final MAX_VALUE_FOR_INACTIVITY_PERIODS:I = 0x150

.field protected static final UNINITIALIZED:J = -0x1L


# instance fields
.field final fileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

.field lastHeartBeat:J

.field final parentClean:Z

.field periodOffsetForDeletionTarget:I

.field final rc:Lch/qos/logback/core/rolling/helper/RollingCalendar;


# direct methods
.method public constructor <init>(Lch/qos/logback/core/rolling/helper/FileNamePattern;Lch/qos/logback/core/rolling/helper/RollingCalendar;)V
    .registers 5

    invoke-direct {p0}, Lch/qos/logback/core/spi/ContextAwareBase;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;->lastHeartBeat:J

    iput-object p1, p0, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;->fileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    iput-object p2, p0, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;->rc:Lch/qos/logback/core/rolling/helper/RollingCalendar;

    invoke-virtual {p0, p1}, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;->computeParentCleaningFlag(Lch/qos/logback/core/rolling/helper/FileNamePattern;)Z

    move-result v0

    iput-boolean v0, p0, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;->parentClean:Z

    return-void
.end method

.method private removeFolderIfEmpty(Ljava/io/File;I)V
    .registers 5

    const/4 v0, 0x3

    if-lt p2, v0, :cond_4

    :cond_3
    :goto_3
    return-void

    :cond_4
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {p1}, Lch/qos/logback/core/rolling/helper/FileFilterUtil;->isEmptyDirectory(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "deleting folder ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;->addInfo(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    add-int/lit8 v1, p2, 0x1

    invoke-direct {p0, v0, v1}, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;->removeFolderIfEmpty(Ljava/io/File;I)V

    goto :goto_3
.end method


# virtual methods
.method public clean(Ljava/util/Date;)V
    .registers 5

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;->computeElapsedPeriodsSinceLastClean(J)I

    move-result v2

    iput-wide v0, p0, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;->lastHeartBeat:J

    const/4 v0, 0x1

    if-le v2, v0, :cond_23

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "periodsElapsed = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;->addInfo(Ljava/lang/String;)V

    :cond_23
    const/4 v0, 0x0

    :goto_24
    if-ge v0, v2, :cond_2f

    iget v1, p0, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;->periodOffsetForDeletionTarget:I

    sub-int/2addr v1, v0

    invoke-virtual {p0, p1, v1}, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;->cleanByPeriodOffset(Ljava/util/Date;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_24

    :cond_2f
    return-void
.end method

.method abstract cleanByPeriodOffset(Ljava/util/Date;I)V
.end method

.method computeElapsedPeriodsSinceLastClean(J)I
    .registers 11

    const-wide/16 v0, 0x150

    const-wide/16 v2, 0x1

    iget-wide v4, p0, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;->lastHeartBeat:J

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-nez v4, :cond_23

    const-string v2, "first clean up after appender initialization"

    invoke-virtual {p0, v2}, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;->addInfo(Ljava/lang/String;)V

    iget-object v2, p0, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;->rc:Lch/qos/logback/core/rolling/helper/RollingCalendar;

    const-wide v3, 0x149970000L

    add-long/2addr v3, p1

    invoke-virtual {v2, p1, p2, v3, v4}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->periodsElapsed(JJ)J

    move-result-wide v2

    cmp-long v4, v2, v0

    if-lez v4, :cond_47

    :cond_21
    :goto_21
    long-to-int v0, v0

    return v0

    :cond_23
    iget-object v0, p0, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;->rc:Lch/qos/logback/core/rolling/helper/RollingCalendar;

    iget-wide v4, p0, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;->lastHeartBeat:J

    invoke-virtual {v0, v4, v5, p1, p2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->periodsElapsed(JJ)J

    move-result-wide v0

    cmp-long v4, v0, v2

    if-gez v4, :cond_21

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unexpected periodsElapsed value "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;->addWarn(Ljava/lang/String;)V

    move-wide v0, v2

    goto :goto_21

    :cond_47
    move-wide v0, v2

    goto :goto_21
.end method

.method computeParentCleaningFlag(Lch/qos/logback/core/rolling/helper/FileNamePattern;)Z
    .registers 7

    const/16 v4, 0x2f

    const/4 v0, 0x1

    const/4 v3, -0x1

    invoke-virtual {p1}, Lch/qos/logback/core/rolling/helper/FileNamePattern;->getPrimaryDateTokenConverter()Lch/qos/logback/core/rolling/helper/DateTokenConverter;

    move-result-object v1

    invoke-virtual {v1}, Lch/qos/logback/core/rolling/helper/DateTokenConverter;->getDatePattern()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v3, :cond_13

    :cond_12
    :goto_12
    return v0

    :cond_13
    iget-object v1, p1, Lch/qos/logback/core/rolling/helper/FileNamePattern;->headTokenConverter:Lch/qos/logback/core/pattern/Converter;

    :goto_15
    if-eqz v1, :cond_1b

    instance-of v2, v1, Lch/qos/logback/core/rolling/helper/DateTokenConverter;

    if-eqz v2, :cond_31

    :cond_1b
    :goto_1b
    if-eqz v1, :cond_36

    instance-of v2, v1, Lch/qos/logback/core/pattern/LiteralConverter;

    if-eqz v2, :cond_2c

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lch/qos/logback/core/pattern/Converter;->convert(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-ne v2, v3, :cond_12

    :cond_2c
    invoke-virtual {v1}, Lch/qos/logback/core/pattern/Converter;->getNext()Lch/qos/logback/core/pattern/Converter;

    move-result-object v1

    goto :goto_1b

    :cond_31
    invoke-virtual {v1}, Lch/qos/logback/core/pattern/Converter;->getNext()Lch/qos/logback/core/pattern/Converter;

    move-result-object v1

    goto :goto_15

    :cond_36
    const/4 v0, 0x0

    goto :goto_12
.end method

.method removeFolderIfEmpty(Ljava/io/File;)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;->removeFolderIfEmpty(Ljava/io/File;I)V

    return-void
.end method

.method public setMaxHistory(I)V
    .registers 3

    neg-int v0, p1

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;->periodOffsetForDeletionTarget:I

    return-void
.end method
