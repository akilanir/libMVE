.class public Lch/qos/logback/core/util/StatusPrinter;
.super Ljava/lang/Object;


# static fields
.field static cachingDateFormat:Lch/qos/logback/core/util/CachingDateFormatter;

.field private static ps:Ljava/io/PrintStream;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    sput-object v0, Lch/qos/logback/core/util/StatusPrinter;->ps:Ljava/io/PrintStream;

    new-instance v0, Lch/qos/logback/core/util/CachingDateFormatter;

    const-string v1, "HH:mm:ss,SSS"

    invoke-direct {v0, v1}, Lch/qos/logback/core/util/CachingDateFormatter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lch/qos/logback/core/util/StatusPrinter;->cachingDateFormat:Lch/qos/logback/core/util/CachingDateFormatter;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static appendThrowable(Ljava/lang/StringBuilder;Ljava/lang/Throwable;)V
    .registers 8

    const/4 v1, 0x0

    invoke-static {p1}, Lch/qos/logback/core/helpers/ThrowableToStringArray;->convert(Ljava/lang/Throwable;)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    move v0, v1

    :goto_7
    if-ge v0, v3, :cond_35

    aget-object v4, v2, v0

    const-string v5, "Caused by: "

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1f

    :goto_13
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lch/qos/logback/core/CoreConstants;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_1f
    invoke-virtual {v4, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v5

    if-eqz v5, :cond_2f

    const-string v5, "\t... "

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_13

    :cond_2f
    const-string v5, "\tat "

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_13

    :cond_35
    return-void
.end method

.method public static buildStr(Ljava/lang/StringBuilder;Ljava/lang/String;Lch/qos/logback/core/status/Status;)V
    .registers 7

    invoke-interface {p2}, Lch/qos/logback/core/status/Status;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_7b

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "+ "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_19
    sget-object v1, Lch/qos/logback/core/util/StatusPrinter;->cachingDateFormat:Lch/qos/logback/core/util/CachingDateFormatter;

    if-eqz v1, :cond_34

    sget-object v1, Lch/qos/logback/core/util/StatusPrinter;->cachingDateFormat:Lch/qos/logback/core/util/CachingDateFormatter;

    invoke-interface {p2}, Lch/qos/logback/core/status/Status;->getDate()Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lch/qos/logback/core/util/CachingDateFormatter;->format(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_34
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lch/qos/logback/core/CoreConstants;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p2}, Lch/qos/logback/core/status/Status;->getThrowable()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_4e

    invoke-interface {p2}, Lch/qos/logback/core/status/Status;->getThrowable()Ljava/lang/Throwable;

    move-result-object v0

    invoke-static {p0, v0}, Lch/qos/logback/core/util/StatusPrinter;->appendThrowable(Ljava/lang/StringBuilder;Ljava/lang/Throwable;)V

    :cond_4e
    invoke-interface {p2}, Lch/qos/logback/core/status/Status;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_8f

    invoke-interface {p2}, Lch/qos/logback/core/status/Status;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_58
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/status/Status;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2, v0}, Lch/qos/logback/core/util/StatusPrinter;->buildStr(Ljava/lang/StringBuilder;Ljava/lang/String;Lch/qos/logback/core/status/Status;)V

    goto :goto_58

    :cond_7b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "|-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_19

    :cond_8f
    return-void
.end method

.method private static buildStrFromStatusList(Ljava/lang/StringBuilder;Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/status/Status;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_3

    :cond_2
    return-void

    :cond_3
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/status/Status;

    const-string v2, ""

    invoke-static {p0, v2, v0}, Lch/qos/logback/core/util/StatusPrinter;->buildStr(Ljava/lang/StringBuilder;Ljava/lang/String;Lch/qos/logback/core/status/Status;)V

    goto :goto_7
.end method

.method public static print(Lch/qos/logback/core/Context;)V
    .registers 3

    const-wide/16 v0, 0x0

    invoke-static {p0, v0, v1}, Lch/qos/logback/core/util/StatusPrinter;->print(Lch/qos/logback/core/Context;J)V

    return-void
.end method

.method public static print(Lch/qos/logback/core/Context;J)V
    .registers 6

    if-nez p0, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Context argument cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    invoke-interface {p0}, Lch/qos/logback/core/Context;->getStatusManager()Lch/qos/logback/core/status/StatusManager;

    move-result-object v0

    if-nez v0, :cond_33

    sget-object v0, Lch/qos/logback/core/util/StatusPrinter;->ps:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "WARN: Context named \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p0}, Lch/qos/logback/core/Context;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\" has no status manager"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    :goto_32
    return-void

    :cond_33
    invoke-static {v0, p1, p2}, Lch/qos/logback/core/util/StatusPrinter;->print(Lch/qos/logback/core/status/StatusManager;J)V

    goto :goto_32
.end method

.method public static print(Lch/qos/logback/core/status/StatusManager;)V
    .registers 3

    const-wide/16 v0, 0x0

    invoke-static {p0, v0, v1}, Lch/qos/logback/core/util/StatusPrinter;->print(Lch/qos/logback/core/status/StatusManager;J)V

    return-void
.end method

.method public static print(Lch/qos/logback/core/status/StatusManager;J)V
    .registers 5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p0}, Lch/qos/logback/core/status/StatusManager;->getCopyOfStatusList()Ljava/util/List;

    move-result-object v1

    invoke-static {v1, p1, p2}, Lch/qos/logback/core/status/StatusUtil;->filterStatusListByTimeThreshold(Ljava/util/List;J)Ljava/util/List;

    move-result-object v1

    invoke-static {v0, v1}, Lch/qos/logback/core/util/StatusPrinter;->buildStrFromStatusList(Ljava/lang/StringBuilder;Ljava/util/List;)V

    sget-object v1, Lch/qos/logback/core/util/StatusPrinter;->ps:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method public static print(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/status/Status;",
            ">;)V"
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v0, p0}, Lch/qos/logback/core/util/StatusPrinter;->buildStrFromStatusList(Ljava/lang/StringBuilder;Ljava/util/List;)V

    sget-object v1, Lch/qos/logback/core/util/StatusPrinter;->ps:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method public static printIfErrorsOccured(Lch/qos/logback/core/Context;)V
    .registers 5

    if-nez p0, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Context argument cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    invoke-interface {p0}, Lch/qos/logback/core/Context;->getStatusManager()Lch/qos/logback/core/status/StatusManager;

    move-result-object v0

    if-nez v0, :cond_33

    sget-object v0, Lch/qos/logback/core/util/StatusPrinter;->ps:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "WARN: Context named \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p0}, Lch/qos/logback/core/Context;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\" has no status manager"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    :cond_32
    :goto_32
    return-void

    :cond_33
    new-instance v1, Lch/qos/logback/core/status/StatusUtil;

    invoke-direct {v1, p0}, Lch/qos/logback/core/status/StatusUtil;-><init>(Lch/qos/logback/core/Context;)V

    const-wide/16 v2, 0x0

    invoke-virtual {v1, v2, v3}, Lch/qos/logback/core/status/StatusUtil;->getHighestLevel(J)I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_32

    invoke-static {v0}, Lch/qos/logback/core/util/StatusPrinter;->print(Lch/qos/logback/core/status/StatusManager;)V

    goto :goto_32
.end method

.method public static printInCaseOfErrorsOrWarnings(Lch/qos/logback/core/Context;)V
    .registers 3

    const-wide/16 v0, 0x0

    invoke-static {p0, v0, v1}, Lch/qos/logback/core/util/StatusPrinter;->printInCaseOfErrorsOrWarnings(Lch/qos/logback/core/Context;J)V

    return-void
.end method

.method public static printInCaseOfErrorsOrWarnings(Lch/qos/logback/core/Context;J)V
    .registers 6

    if-nez p0, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Context argument cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    invoke-interface {p0}, Lch/qos/logback/core/Context;->getStatusManager()Lch/qos/logback/core/status/StatusManager;

    move-result-object v0

    if-nez v0, :cond_33

    sget-object v0, Lch/qos/logback/core/util/StatusPrinter;->ps:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "WARN: Context named \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p0}, Lch/qos/logback/core/Context;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\" has no status manager"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    :cond_32
    :goto_32
    return-void

    :cond_33
    new-instance v1, Lch/qos/logback/core/status/StatusUtil;

    invoke-direct {v1, p0}, Lch/qos/logback/core/status/StatusUtil;-><init>(Lch/qos/logback/core/Context;)V

    invoke-virtual {v1, p1, p2}, Lch/qos/logback/core/status/StatusUtil;->getHighestLevel(J)I

    move-result v1

    const/4 v2, 0x1

    if-lt v1, v2, :cond_32

    invoke-static {v0, p1, p2}, Lch/qos/logback/core/util/StatusPrinter;->print(Lch/qos/logback/core/status/StatusManager;J)V

    goto :goto_32
.end method

.method public static setPrintStream(Ljava/io/PrintStream;)V
    .registers 1

    sput-object p0, Lch/qos/logback/core/util/StatusPrinter;->ps:Ljava/io/PrintStream;

    return-void
.end method
