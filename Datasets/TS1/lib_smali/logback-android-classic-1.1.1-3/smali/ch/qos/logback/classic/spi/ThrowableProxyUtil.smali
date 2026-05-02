.class public Lch/qos/logback/classic/spi/ThrowableProxyUtil;
.super Ljava/lang/Object;


# static fields
.field private static final BUILDER_CAPACITY:I = 0x800

.field public static final REGULAR_EXCEPTION_INDENT:I = 0x1

.field public static final SUPPRESSED_EXCEPTION_INDENT:I = 0x1


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static asString(Lch/qos/logback/classic/spi/IThrowableProxy;)Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x800

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {v0, v1, v2, p0}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->recursiveAppend(Ljava/lang/StringBuilder;Ljava/lang/String;ILch/qos/logback/classic/spi/IThrowableProxy;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static build(Lch/qos/logback/classic/spi/ThrowableProxy;Ljava/lang/Throwable;Lch/qos/logback/classic/spi/ThrowableProxy;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    const/4 v0, -0x1

    if-eqz p2, :cond_f

    invoke-virtual {p2}, Lch/qos/logback/classic/spi/ThrowableProxy;->getStackTraceElementProxyArray()[Lch/qos/logback/classic/spi/StackTraceElementProxy;

    move-result-object v0

    invoke-static {v1, v0}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->findNumberOfCommonFrames([Ljava/lang/StackTraceElement;[Lch/qos/logback/classic/spi/StackTraceElementProxy;)I

    move-result v0

    :cond_f
    iput v0, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->commonFrames:I

    invoke-static {v1}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->steArrayToStepArray([Ljava/lang/StackTraceElement;)[Lch/qos/logback/classic/spi/StackTraceElementProxy;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->stackTraceElementProxyArray:[Lch/qos/logback/classic/spi/StackTraceElementProxy;

    return-void
.end method

.method static findNumberOfCommonFrames([Ljava/lang/StackTraceElement;[Lch/qos/logback/classic/spi/StackTraceElementProxy;)I
    .registers 7

    const/4 v0, 0x0

    if-eqz p1, :cond_5

    if-nez p0, :cond_6

    :cond_5
    return v0

    :cond_6
    array-length v1, p0

    add-int/lit8 v2, v1, -0x1

    array-length v1, p1

    add-int/lit8 v1, v1, -0x1

    :goto_c
    if-ltz v2, :cond_5

    if-ltz v1, :cond_5

    aget-object v3, p0, v2

    aget-object v4, p1, v1

    iget-object v4, v4, Lch/qos/logback/classic/spi/StackTraceElementProxy;->ste:Ljava/lang/StackTraceElement;

    invoke-virtual {v3, v4}, Ljava/lang/StackTraceElement;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v2, v2, -0x1

    add-int/lit8 v1, v1, -0x1

    goto :goto_c
.end method

.method public static indent(Ljava/lang/StringBuilder;I)V
    .registers 4

    const/4 v0, 0x0

    :goto_1
    if-ge v0, p1, :cond_b

    const/16 v1, 0x9

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_b
    return-void
.end method

.method private static recursiveAppend(Ljava/lang/StringBuilder;Ljava/lang/String;ILch/qos/logback/classic/spi/IThrowableProxy;)V
    .registers 10

    if-nez p3, :cond_3

    :goto_2
    return-void

    :cond_3
    invoke-static {p0, p1, p2, p3}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->subjoinFirstLine(Ljava/lang/StringBuilder;Ljava/lang/String;ILch/qos/logback/classic/spi/IThrowableProxy;)V

    sget-object v0, Lch/qos/logback/core/CoreConstants;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0, p2, p3}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->subjoinSTEPArray(Ljava/lang/StringBuilder;ILch/qos/logback/classic/spi/IThrowableProxy;)V

    invoke-interface {p3}, Lch/qos/logback/classic/spi/IThrowableProxy;->getSuppressed()[Lch/qos/logback/classic/spi/IThrowableProxy;

    move-result-object v1

    if-eqz v1, :cond_24

    array-length v2, v1

    const/4 v0, 0x0

    :goto_16
    if-ge v0, v2, :cond_24

    aget-object v3, v1, v0

    const-string v4, "Suppressed: "

    add-int/lit8 v5, p2, 0x1

    invoke-static {p0, v4, v5, v3}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->recursiveAppend(Ljava/lang/StringBuilder;Ljava/lang/String;ILch/qos/logback/classic/spi/IThrowableProxy;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_16

    :cond_24
    const-string v0, "Caused by: "

    invoke-interface {p3}, Lch/qos/logback/classic/spi/IThrowableProxy;->getCause()Lch/qos/logback/classic/spi/IThrowableProxy;

    move-result-object v1

    invoke-static {p0, v0, p2, v1}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->recursiveAppend(Ljava/lang/StringBuilder;Ljava/lang/String;ILch/qos/logback/classic/spi/IThrowableProxy;)V

    goto :goto_2
.end method

.method static steArrayToStepArray([Ljava/lang/StackTraceElement;)[Lch/qos/logback/classic/spi/StackTraceElementProxy;
    .registers 5

    const/4 v0, 0x0

    if-nez p0, :cond_6

    new-array v0, v0, [Lch/qos/logback/classic/spi/StackTraceElementProxy;

    :goto_5
    return-object v0

    :cond_6
    array-length v1, p0

    new-array v1, v1, [Lch/qos/logback/classic/spi/StackTraceElementProxy;

    :goto_9
    array-length v2, v1

    if-ge v0, v2, :cond_18

    new-instance v2, Lch/qos/logback/classic/spi/StackTraceElementProxy;

    aget-object v3, p0, v0

    invoke-direct {v2, v3}, Lch/qos/logback/classic/spi/StackTraceElementProxy;-><init>(Ljava/lang/StackTraceElement;)V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    :cond_18
    move-object v0, v1

    goto :goto_5
.end method

.method private static subjoinExceptionMessage(Ljava/lang/StringBuilder;Lch/qos/logback/classic/spi/IThrowableProxy;)V
    .registers 4

    invoke-interface {p1}, Lch/qos/logback/classic/spi/IThrowableProxy;->getClassName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p1}, Lch/qos/logback/classic/spi/IThrowableProxy;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method public static subjoinFirstLine(Ljava/lang/StringBuilder;Lch/qos/logback/classic/spi/IThrowableProxy;)V
    .registers 3

    invoke-interface {p1}, Lch/qos/logback/classic/spi/IThrowableProxy;->getCommonFrames()I

    move-result v0

    if-lez v0, :cond_b

    const-string v0, "Caused by: "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_b
    invoke-static {p0, p1}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->subjoinExceptionMessage(Ljava/lang/StringBuilder;Lch/qos/logback/classic/spi/IThrowableProxy;)V

    return-void
.end method

.method private static subjoinFirstLine(Ljava/lang/StringBuilder;Ljava/lang/String;ILch/qos/logback/classic/spi/IThrowableProxy;)V
    .registers 5

    add-int/lit8 v0, p2, -0x1

    invoke-static {p0, v0}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->indent(Ljava/lang/StringBuilder;I)V

    if-eqz p1, :cond_a

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_a
    invoke-static {p0, p3}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->subjoinExceptionMessage(Ljava/lang/StringBuilder;Lch/qos/logback/classic/spi/IThrowableProxy;)V

    return-void
.end method

.method public static subjoinFirstLineRootCauseFirst(Ljava/lang/StringBuilder;Lch/qos/logback/classic/spi/IThrowableProxy;)V
    .registers 3

    invoke-interface {p1}, Lch/qos/logback/classic/spi/IThrowableProxy;->getCause()Lch/qos/logback/classic/spi/IThrowableProxy;

    move-result-object v0

    if-eqz v0, :cond_b

    const-string v0, "Wrapped by: "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_b
    invoke-static {p0, p1}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->subjoinExceptionMessage(Ljava/lang/StringBuilder;Lch/qos/logback/classic/spi/IThrowableProxy;)V

    return-void
.end method

.method public static subjoinPackagingData(Ljava/lang/StringBuilder;Lch/qos/logback/classic/spi/StackTraceElementProxy;)V
    .registers 5

    if-eqz p1, :cond_2e

    invoke-virtual {p1}, Lch/qos/logback/classic/spi/StackTraceElementProxy;->getClassPackagingData()Lch/qos/logback/classic/spi/ClassPackagingData;

    move-result-object v0

    if-eqz v0, :cond_2e

    invoke-virtual {v0}, Lch/qos/logback/classic/spi/ClassPackagingData;->isExact()Z

    move-result v1

    if-nez v1, :cond_2f

    const-string v1, " ~["

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_13
    invoke-virtual {v0}, Lch/qos/logback/classic/spi/ClassPackagingData;->getCodeLocation()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x3a

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lch/qos/logback/classic/spi/ClassPackagingData;->getVersion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_2e
    return-void

    :cond_2f
    const-string v1, " ["

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_13
.end method

.method public static subjoinSTEP(Ljava/lang/StringBuilder;Lch/qos/logback/classic/spi/StackTraceElementProxy;)V
    .registers 3

    invoke-virtual {p1}, Lch/qos/logback/classic/spi/StackTraceElementProxy;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0, p1}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->subjoinPackagingData(Ljava/lang/StringBuilder;Lch/qos/logback/classic/spi/StackTraceElementProxy;)V

    return-void
.end method

.method public static subjoinSTEPArray(Ljava/lang/StringBuilder;ILch/qos/logback/classic/spi/IThrowableProxy;)V
    .registers 7

    invoke-interface {p2}, Lch/qos/logback/classic/spi/IThrowableProxy;->getStackTraceElementProxyArray()[Lch/qos/logback/classic/spi/StackTraceElementProxy;

    move-result-object v1

    invoke-interface {p2}, Lch/qos/logback/classic/spi/IThrowableProxy;->getCommonFrames()I

    move-result v2

    const/4 v0, 0x0

    :goto_9
    array-length v3, v1

    sub-int/2addr v3, v2

    if-ge v0, v3, :cond_1d

    aget-object v3, v1, v0

    invoke-static {p0, p1}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->indent(Ljava/lang/StringBuilder;I)V

    invoke-static {p0, v3}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->subjoinSTEP(Ljava/lang/StringBuilder;Lch/qos/logback/classic/spi/StackTraceElementProxy;)V

    sget-object v3, Lch/qos/logback/core/CoreConstants;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    :cond_1d
    if-lez v2, :cond_37

    invoke-static {p0, p1}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->indent(Ljava/lang/StringBuilder;I)V

    const-string v0, "... "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " common frames omitted"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lch/qos/logback/core/CoreConstants;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_37
    return-void
.end method

.method public static subjoinSTEPArray(Ljava/lang/StringBuilder;Lch/qos/logback/classic/spi/IThrowableProxy;)V
    .registers 3

    const/4 v0, 0x1

    invoke-static {p0, v0, p1}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->subjoinSTEPArray(Ljava/lang/StringBuilder;ILch/qos/logback/classic/spi/IThrowableProxy;)V

    return-void
.end method
