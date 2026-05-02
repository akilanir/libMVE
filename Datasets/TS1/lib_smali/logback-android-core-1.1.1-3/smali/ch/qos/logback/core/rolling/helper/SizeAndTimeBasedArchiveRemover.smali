.class public Lch/qos/logback/core/rolling/helper/SizeAndTimeBasedArchiveRemover;
.super Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;


# direct methods
.method public constructor <init>(Lch/qos/logback/core/rolling/helper/FileNamePattern;Lch/qos/logback/core/rolling/helper/RollingCalendar;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lch/qos/logback/core/rolling/helper/DefaultArchiveRemover;-><init>(Lch/qos/logback/core/rolling/helper/FileNamePattern;Lch/qos/logback/core/rolling/helper/RollingCalendar;)V

    return-void
.end method


# virtual methods
.method public cleanByPeriodOffset(Ljava/util/Date;I)V
    .registers 10

    const/4 v0, 0x0

    iget-object v1, p0, Lch/qos/logback/core/rolling/helper/SizeAndTimeBasedArchiveRemover;->rc:Lch/qos/logback/core/rolling/helper/RollingCalendar;

    invoke-virtual {v1, p1, p2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->getRelativeDate(Ljava/util/Date;I)Ljava/util/Date;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/rolling/helper/SizeAndTimeBasedArchiveRemover;->fileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    invoke-virtual {v2, v1}, Lch/qos/logback/core/rolling/helper/FileNamePattern;->toRegexForFixedDate(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lch/qos/logback/core/rolling/helper/FileFilterUtil;->afterLastSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/io/File;

    iget-object v4, p0, Lch/qos/logback/core/rolling/helper/SizeAndTimeBasedArchiveRemover;->fileNamePattern:Lch/qos/logback/core/rolling/helper/FileNamePattern;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v1, v5, v0

    const/4 v1, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-virtual {v4, v5}, Lch/qos/logback/core/rolling/helper/FileNamePattern;->convertMultipleArguments([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    invoke-static {v1, v2}, Lch/qos/logback/core/rolling/helper/FileFilterUtil;->filesInFolderMatchingStemRegex(Ljava/io/File;Ljava/lang/String;)[Ljava/io/File;

    move-result-object v2

    array-length v3, v2

    :goto_39
    if-ge v0, v3, :cond_43

    aget-object v4, v2, v0

    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_39

    :cond_43
    iget-boolean v0, p0, Lch/qos/logback/core/rolling/helper/SizeAndTimeBasedArchiveRemover;->parentClean:Z

    if-eqz v0, :cond_4a

    invoke-virtual {p0, v1}, Lch/qos/logback/core/rolling/helper/SizeAndTimeBasedArchiveRemover;->removeFolderIfEmpty(Ljava/io/File;)V

    :cond_4a
    return-void
.end method
