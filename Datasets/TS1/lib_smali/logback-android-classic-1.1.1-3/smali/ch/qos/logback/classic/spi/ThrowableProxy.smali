.class public Lch/qos/logback/classic/spi/ThrowableProxy;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/classic/spi/IThrowableProxy;


# static fields
.field private static final GET_SUPPRESSED_METHOD:Ljava/lang/reflect/Method;

.field private static final NO_SUPPRESSED:[Lch/qos/logback/classic/spi/ThrowableProxy;


# instance fields
.field private calculatedPackageData:Z

.field private cause:Lch/qos/logback/classic/spi/ThrowableProxy;

.field private className:Ljava/lang/String;

.field commonFrames:I

.field private message:Ljava/lang/String;

.field private transient packagingDataCalculator:Lch/qos/logback/classic/spi/PackagingDataCalculator;

.field stackTraceElementProxyArray:[Lch/qos/logback/classic/spi/StackTraceElementProxy;

.field private suppressed:[Lch/qos/logback/classic/spi/ThrowableProxy;

.field private throwable:Ljava/lang/Throwable;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    const/4 v4, 0x0

    const/4 v0, 0x0

    :try_start_2
    const-class v1, Ljava/lang/Throwable;

    const-string v2, "getSuppressed"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_c
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_c} :catch_14

    move-result-object v0

    :goto_d
    sput-object v0, Lch/qos/logback/classic/spi/ThrowableProxy;->GET_SUPPRESSED_METHOD:Ljava/lang/reflect/Method;

    new-array v0, v4, [Lch/qos/logback/classic/spi/ThrowableProxy;

    sput-object v0, Lch/qos/logback/classic/spi/ThrowableProxy;->NO_SUPPRESSED:[Lch/qos/logback/classic/spi/ThrowableProxy;

    return-void

    :catch_14
    move-exception v1

    goto :goto_d
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 7

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lch/qos/logback/classic/spi/ThrowableProxy;->NO_SUPPRESSED:[Lch/qos/logback/classic/spi/ThrowableProxy;

    iput-object v0, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->suppressed:[Lch/qos/logback/classic/spi/ThrowableProxy;

    iput-boolean v1, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->calculatedPackageData:Z

    iput-object p1, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->throwable:Ljava/lang/Throwable;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->className:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->message:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    invoke-static {v0}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->steArrayToStepArray([Ljava/lang/StackTraceElement;)[Lch/qos/logback/classic/spi/StackTraceElementProxy;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->stackTraceElementProxyArray:[Lch/qos/logback/classic/spi/StackTraceElementProxy;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_41

    new-instance v2, Lch/qos/logback/classic/spi/ThrowableProxy;

    invoke-direct {v2, v0}, Lch/qos/logback/classic/spi/ThrowableProxy;-><init>(Ljava/lang/Throwable;)V

    iput-object v2, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->cause:Lch/qos/logback/classic/spi/ThrowableProxy;

    iget-object v2, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->cause:Lch/qos/logback/classic/spi/ThrowableProxy;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    iget-object v3, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->stackTraceElementProxyArray:[Lch/qos/logback/classic/spi/StackTraceElementProxy;

    invoke-static {v0, v3}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->findNumberOfCommonFrames([Ljava/lang/StackTraceElement;[Lch/qos/logback/classic/spi/StackTraceElementProxy;)I

    move-result v0

    iput v0, v2, Lch/qos/logback/classic/spi/ThrowableProxy;->commonFrames:I

    :cond_41
    sget-object v0, Lch/qos/logback/classic/spi/ThrowableProxy;->GET_SUPPRESSED_METHOD:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_82

    :try_start_45
    sget-object v0, Lch/qos/logback/classic/spi/ThrowableProxy;->GET_SUPPRESSED_METHOD:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v2, v0, [Ljava/lang/Throwable;

    if-eqz v2, :cond_82

    check-cast v0, [Ljava/lang/Throwable;

    check-cast v0, [Ljava/lang/Throwable;

    array-length v2, v0

    if-lez v2, :cond_82

    array-length v2, v0

    new-array v2, v2, [Lch/qos/logback/classic/spi/ThrowableProxy;

    iput-object v2, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->suppressed:[Lch/qos/logback/classic/spi/ThrowableProxy;

    :goto_5e
    array-length v2, v0

    if-ge v1, v2, :cond_82

    iget-object v2, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->suppressed:[Lch/qos/logback/classic/spi/ThrowableProxy;

    new-instance v3, Lch/qos/logback/classic/spi/ThrowableProxy;

    aget-object v4, v0, v1

    invoke-direct {v3, v4}, Lch/qos/logback/classic/spi/ThrowableProxy;-><init>(Ljava/lang/Throwable;)V

    aput-object v3, v2, v1

    iget-object v2, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->suppressed:[Lch/qos/logback/classic/spi/ThrowableProxy;

    aget-object v2, v2, v1

    aget-object v3, v0, v1

    invoke-virtual {v3}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v3

    iget-object v4, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->stackTraceElementProxyArray:[Lch/qos/logback/classic/spi/StackTraceElementProxy;

    invoke-static {v3, v4}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->findNumberOfCommonFrames([Ljava/lang/StackTraceElement;[Lch/qos/logback/classic/spi/StackTraceElementProxy;)I

    move-result v3

    iput v3, v2, Lch/qos/logback/classic/spi/ThrowableProxy;->commonFrames:I
    :try_end_7e
    .catch Ljava/lang/IllegalAccessException; {:try_start_45 .. :try_end_7e} :catch_83
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_45 .. :try_end_7e} :catch_81

    add-int/lit8 v1, v1, 0x1

    goto :goto_5e

    :catch_81
    move-exception v0

    :cond_82
    :goto_82
    return-void

    :catch_83
    move-exception v0

    goto :goto_82
.end method


# virtual methods
.method public calculatePackagingData()V
    .registers 3

    iget-boolean v0, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->calculatedPackageData:Z

    if-eqz v0, :cond_5

    :cond_4
    :goto_4
    return-void

    :cond_5
    invoke-virtual {p0}, Lch/qos/logback/classic/spi/ThrowableProxy;->getPackagingDataCalculator()Lch/qos/logback/classic/spi/PackagingDataCalculator;

    move-result-object v0

    if-eqz v0, :cond_4

    const/4 v1, 0x1

    iput-boolean v1, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->calculatedPackageData:Z

    invoke-virtual {v0, p0}, Lch/qos/logback/classic/spi/PackagingDataCalculator;->calculate(Lch/qos/logback/classic/spi/IThrowableProxy;)V

    goto :goto_4
.end method

.method public fullDump()V
    .registers 8

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->stackTraceElementProxyArray:[Lch/qos/logback/classic/spi/StackTraceElementProxy;

    array-length v3, v2

    const/4 v0, 0x0

    :goto_9
    if-ge v0, v3, :cond_25

    aget-object v4, v2, v0

    invoke-virtual {v4}, Lch/qos/logback/classic/spi/StackTraceElementProxy;->toString()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x9

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1, v4}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->subjoinPackagingData(Ljava/lang/StringBuilder;Lch/qos/logback/classic/spi/StackTraceElementProxy;)V

    sget-object v4, Lch/qos/logback/core/CoreConstants;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    :cond_25
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method public getCause()Lch/qos/logback/classic/spi/IThrowableProxy;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->cause:Lch/qos/logback/classic/spi/ThrowableProxy;

    return-object v0
.end method

.method public getClassName()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->className:Ljava/lang/String;

    return-object v0
.end method

.method public getCommonFrames()I
    .registers 2

    iget v0, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->commonFrames:I

    return v0
.end method

.method public getMessage()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getPackagingDataCalculator()Lch/qos/logback/classic/spi/PackagingDataCalculator;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->throwable:Ljava/lang/Throwable;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->packagingDataCalculator:Lch/qos/logback/classic/spi/PackagingDataCalculator;

    if-nez v0, :cond_f

    new-instance v0, Lch/qos/logback/classic/spi/PackagingDataCalculator;

    invoke-direct {v0}, Lch/qos/logback/classic/spi/PackagingDataCalculator;-><init>()V

    iput-object v0, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->packagingDataCalculator:Lch/qos/logback/classic/spi/PackagingDataCalculator;

    :cond_f
    iget-object v0, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->packagingDataCalculator:Lch/qos/logback/classic/spi/PackagingDataCalculator;

    return-object v0
.end method

.method public getStackTraceElementProxyArray()[Lch/qos/logback/classic/spi/StackTraceElementProxy;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->stackTraceElementProxyArray:[Lch/qos/logback/classic/spi/StackTraceElementProxy;

    return-object v0
.end method

.method public getSuppressed()[Lch/qos/logback/classic/spi/IThrowableProxy;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->suppressed:[Lch/qos/logback/classic/spi/ThrowableProxy;

    return-object v0
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/spi/ThrowableProxy;->throwable:Ljava/lang/Throwable;

    return-object v0
.end method
