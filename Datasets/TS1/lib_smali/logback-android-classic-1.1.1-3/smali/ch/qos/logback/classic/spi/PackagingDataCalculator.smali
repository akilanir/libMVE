.class public Lch/qos/logback/classic/spi/PackagingDataCalculator;
.super Ljava/lang/Object;


# static fields
.field static final STEP_ARRAY_TEMPLATE:[Lch/qos/logback/classic/spi/StackTraceElementProxy;


# instance fields
.field cache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lch/qos/logback/classic/spi/ClassPackagingData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x0

    new-array v0, v0, [Lch/qos/logback/classic/spi/StackTraceElementProxy;

    sput-object v0, Lch/qos/logback/classic/spi/PackagingDataCalculator;->STEP_ARRAY_TEMPLATE:[Lch/qos/logback/classic/spi/StackTraceElementProxy;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lch/qos/logback/classic/spi/PackagingDataCalculator;->cache:Ljava/util/HashMap;

    return-void
.end method

.method private bestEffortLoadClass(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;
    .registers 6

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2}, Lch/qos/logback/classic/spi/PackagingDataCalculator;->loadClass(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_8

    :cond_7
    :goto_7
    return-object v0

    :cond_8
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    if-eq v2, p1, :cond_16

    invoke-direct {p0, v2, p2}, Lch/qos/logback/classic/spi/PackagingDataCalculator;->loadClass(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    :cond_16
    if-nez v0, :cond_7

    :try_start_18
    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_1b
    .catch Ljava/lang/ClassNotFoundException; {:try_start_18 .. :try_end_1b} :catch_1d
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_18 .. :try_end_1b} :catch_20
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_1b} :catch_23

    move-result-object v0

    goto :goto_7

    :catch_1d
    move-exception v0

    move-object v0, v1

    goto :goto_7

    :catch_20
    move-exception v0

    move-object v0, v1

    goto :goto_7

    :catch_23
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move-object v0, v1

    goto :goto_7
.end method

.method private computeBySTEP(Lch/qos/logback/classic/spi/StackTraceElementProxy;Ljava/lang/ClassLoader;)Lch/qos/logback/classic/spi/ClassPackagingData;
    .registers 8

    iget-object v0, p1, Lch/qos/logback/classic/spi/StackTraceElementProxy;->ste:Ljava/lang/StackTraceElement;

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lch/qos/logback/classic/spi/PackagingDataCalculator;->cache:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/classic/spi/ClassPackagingData;

    if-eqz v0, :cond_11

    :goto_10
    return-object v0

    :cond_11
    invoke-direct {p0, p2, v1}, Lch/qos/logback/classic/spi/PackagingDataCalculator;->bestEffortLoadClass(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/spi/PackagingDataCalculator;->getImplementationVersion(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/spi/PackagingDataCalculator;->getCodeLocation(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    new-instance v0, Lch/qos/logback/classic/spi/ClassPackagingData;

    const/4 v4, 0x0

    invoke-direct {v0, v3, v2, v4}, Lch/qos/logback/classic/spi/ClassPackagingData;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    iget-object v2, p0, Lch/qos/logback/classic/spi/PackagingDataCalculator;->cache:Ljava/util/HashMap;

    invoke-virtual {v2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_10
.end method

.method private getCodeLocation(Ljava/lang/String;C)Ljava/lang/String;
    .registers 5

    invoke-virtual {p1, p2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    invoke-direct {p0, v0, p1}, Lch/qos/logback/classic/spi/PackagingDataCalculator;->isFolder(ILjava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_17

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :goto_16
    return-object v0

    :cond_17
    if-lez v0, :cond_20

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    :cond_20
    const/4 v0, 0x0

    goto :goto_16
.end method

.method private isFolder(ILjava/lang/String;)Z
    .registers 5

    const/4 v0, -0x1

    if-eq p1, v0, :cond_d

    add-int/lit8 v0, p1, 0x1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-ne v0, v1, :cond_d

    const/4 v0, 0x1

    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method private loadClass(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;
    .registers 5

    const/4 v0, 0x0

    if-nez p1, :cond_4

    :goto_3
    return-object v0

    :cond_4
    :try_start_4
    invoke-virtual {p1, p2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_7
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4 .. :try_end_7} :catch_e
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_4 .. :try_end_7} :catch_10
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_7} :catch_9

    move-result-object v0

    goto :goto_3

    :catch_9
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    :catch_e
    move-exception v1

    goto :goto_3

    :catch_10
    move-exception v1

    goto :goto_3
.end method


# virtual methods
.method public calculate(Lch/qos/logback/classic/spi/IThrowableProxy;)V
    .registers 6

    :goto_0
    if-eqz p1, :cond_24

    invoke-interface {p1}, Lch/qos/logback/classic/spi/IThrowableProxy;->getStackTraceElementProxyArray()[Lch/qos/logback/classic/spi/StackTraceElementProxy;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/spi/PackagingDataCalculator;->populateFrames([Lch/qos/logback/classic/spi/StackTraceElementProxy;)V

    invoke-interface {p1}, Lch/qos/logback/classic/spi/IThrowableProxy;->getSuppressed()[Lch/qos/logback/classic/spi/IThrowableProxy;

    move-result-object v1

    if-eqz v1, :cond_1f

    array-length v2, v1

    const/4 v0, 0x0

    :goto_11
    if-ge v0, v2, :cond_1f

    aget-object v3, v1, v0

    invoke-interface {v3}, Lch/qos/logback/classic/spi/IThrowableProxy;->getStackTraceElementProxyArray()[Lch/qos/logback/classic/spi/StackTraceElementProxy;

    move-result-object v3

    invoke-virtual {p0, v3}, Lch/qos/logback/classic/spi/PackagingDataCalculator;->populateFrames([Lch/qos/logback/classic/spi/StackTraceElementProxy;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_11

    :cond_1f
    invoke-interface {p1}, Lch/qos/logback/classic/spi/IThrowableProxy;->getCause()Lch/qos/logback/classic/spi/IThrowableProxy;

    move-result-object p1

    goto :goto_0

    :cond_24
    return-void
.end method

.method getCodeLocation(Ljava/lang/Class;)Ljava/lang/String;
    .registers 4

    if-eqz p1, :cond_27

    :try_start_2
    invoke-virtual {p1}, Ljava/lang/Class;->getProtectionDomain()Ljava/security/ProtectionDomain;

    move-result-object v0

    invoke-virtual {v0}, Ljava/security/ProtectionDomain;->getCodeSource()Ljava/security/CodeSource;

    move-result-object v0

    if-eqz v0, :cond_27

    invoke-virtual {v0}, Ljava/security/CodeSource;->getLocation()Ljava/net/URL;

    move-result-object v0

    if-eqz v0, :cond_27

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v0, 0x2f

    invoke-direct {p0, v1, v0}, Lch/qos/logback/classic/spi/PackagingDataCalculator;->getCodeLocation(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1f

    :goto_1e
    return-object v0

    :cond_1f
    const/16 v0, 0x5c

    invoke-direct {p0, v1, v0}, Lch/qos/logback/classic/spi/PackagingDataCalculator;->getCodeLocation(Ljava/lang/String;C)Ljava/lang/String;
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_24} :catch_26

    move-result-object v0

    goto :goto_1e

    :catch_26
    move-exception v0

    :cond_27
    const-string v0, "na"

    goto :goto_1e
.end method

.method getImplementationVersion(Ljava/lang/Class;)Ljava/lang/String;
    .registers 3

    if-nez p1, :cond_5

    const-string v0, "na"

    :cond_4
    :goto_4
    return-object v0

    :cond_5
    invoke-virtual {p1}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v0

    if-eqz v0, :cond_14

    invoke-virtual {v0}, Ljava/lang/Package;->getImplementationVersion()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_4

    const-string v0, "na"

    goto :goto_4

    :cond_14
    const-string v0, "na"

    goto :goto_4
.end method

.method populateFrames([Lch/qos/logback/classic/spi/StackTraceElementProxy;)V
    .registers 8

    const/4 v5, 0x0

    new-instance v0, Ljava/lang/Throwable;

    const-string v1, "local stack reference"

    invoke-direct {v0, v1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    invoke-static {v0, p1}, Lch/qos/logback/classic/spi/STEUtil;->findNumberOfCommonFrames([Ljava/lang/StackTraceElement;[Lch/qos/logback/classic/spi/StackTraceElementProxy;)I

    move-result v1

    array-length v0, p1

    sub-int v2, v0, v1

    const/4 v0, 0x0

    :goto_14
    if-ge v0, v1, :cond_24

    add-int v3, v2, v0

    aget-object v3, p1, v3

    invoke-direct {p0, v3, v5}, Lch/qos/logback/classic/spi/PackagingDataCalculator;->computeBySTEP(Lch/qos/logback/classic/spi/StackTraceElementProxy;Ljava/lang/ClassLoader;)Lch/qos/logback/classic/spi/ClassPackagingData;

    move-result-object v4

    invoke-virtual {v3, v4}, Lch/qos/logback/classic/spi/StackTraceElementProxy;->setClassPackagingData(Lch/qos/logback/classic/spi/ClassPackagingData;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    :cond_24
    invoke-virtual {p0, v1, p1, v5}, Lch/qos/logback/classic/spi/PackagingDataCalculator;->populateUncommonFrames(I[Lch/qos/logback/classic/spi/StackTraceElementProxy;Ljava/lang/ClassLoader;)V

    return-void
.end method

.method populateUncommonFrames(I[Lch/qos/logback/classic/spi/StackTraceElementProxy;Ljava/lang/ClassLoader;)V
    .registers 8

    array-length v0, p2

    sub-int v1, v0, p1

    const/4 v0, 0x0

    :goto_4
    if-ge v0, v1, :cond_12

    aget-object v2, p2, v0

    invoke-direct {p0, v2, p3}, Lch/qos/logback/classic/spi/PackagingDataCalculator;->computeBySTEP(Lch/qos/logback/classic/spi/StackTraceElementProxy;Ljava/lang/ClassLoader;)Lch/qos/logback/classic/spi/ClassPackagingData;

    move-result-object v3

    invoke-virtual {v2, v3}, Lch/qos/logback/classic/spi/StackTraceElementProxy;->setClassPackagingData(Lch/qos/logback/classic/spi/ClassPackagingData;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_12
    return-void
.end method
