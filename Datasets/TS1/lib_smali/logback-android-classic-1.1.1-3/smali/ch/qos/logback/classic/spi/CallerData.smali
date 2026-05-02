.class public Lch/qos/logback/classic/spi/CallerData;
.super Ljava/lang/Object;


# static fields
.field public static final CALLER_DATA_NA:Ljava/lang/String;

.field public static final EMPTY_CALLER_DATA_ARRAY:[Ljava/lang/StackTraceElement;

.field public static final LINE_NA:I = -0x1

.field private static final LOG4J_CATEGORY:Ljava/lang/String; = "org.apache.log4j.Category"

.field public static final NA:Ljava/lang/String; = "?"

.field private static final SLF4J_BOUNDARY:Ljava/lang/String; = "org.slf4j.Logger"


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "?#?:?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lch/qos/logback/core/CoreConstants;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lch/qos/logback/classic/spi/CallerData;->CALLER_DATA_NA:Ljava/lang/String;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/StackTraceElement;

    sput-object v0, Lch/qos/logback/classic/spi/CallerData;->EMPTY_CALLER_DATA_ARRAY:[Ljava/lang/StackTraceElement;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static extract(Ljava/lang/Throwable;Ljava/lang/String;ILjava/util/List;)[Ljava/lang/StackTraceElement;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)[",
            "Ljava/lang/StackTraceElement;"
        }
    .end annotation

    const/4 v1, 0x0

    const/4 v3, -0x1

    if-nez p0, :cond_6

    const/4 v0, 0x0

    :cond_5
    :goto_5
    return-object v0

    :cond_6
    invoke-virtual {p0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v4

    move v0, v1

    move v2, v3

    :goto_c
    array-length v5, v4

    if-ge v0, v5, :cond_22

    aget-object v5, v4, v0

    invoke-virtual {v5}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p1, p3}, Lch/qos/logback/classic/spi/CallerData;->isInFrameworkSpace(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z

    move-result v5

    if-eqz v5, :cond_20

    add-int/lit8 v2, v0, 0x1

    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    :cond_20
    if-eq v2, v3, :cond_1d

    :cond_22
    if-ne v2, v3, :cond_27

    sget-object v0, Lch/qos/logback/classic/spi/CallerData;->EMPTY_CALLER_DATA_ARRAY:[Ljava/lang/StackTraceElement;

    goto :goto_5

    :cond_27
    array-length v0, v4

    sub-int/2addr v0, v2

    if-ge p2, v0, :cond_38

    :goto_2b
    new-array v0, p2, [Ljava/lang/StackTraceElement;

    :goto_2d
    if-ge v1, p2, :cond_5

    add-int v3, v2, v1

    aget-object v3, v4, v3

    aput-object v3, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2d

    :cond_38
    move p2, v0

    goto :goto_2b
.end method

.method static isInFrameworkSpace(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    const-string v0, "org.apache.log4j.Category"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    const-string v0, "org.slf4j.Logger"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1c

    invoke-static {p0, p2}, Lch/qos/logback/classic/spi/CallerData;->isInFrameworkSpaceList(Ljava/lang/String;Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_1e

    :cond_1c
    const/4 v0, 0x1

    :goto_1d
    return v0

    :cond_1e
    const/4 v0, 0x0

    goto :goto_1d
.end method

.method private static isInFrameworkSpaceList(Ljava/lang/String;Ljava/util/List;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    const/4 v1, 0x0

    if-nez p1, :cond_5

    move v0, v1

    :goto_4
    return v0

    :cond_5
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    const/4 v0, 0x1

    goto :goto_4

    :cond_1d
    move v0, v1

    goto :goto_4
.end method

.method public static naInstance()Ljava/lang/StackTraceElement;
    .registers 5

    new-instance v0, Ljava/lang/StackTraceElement;

    const-string v1, "?"

    const-string v2, "?"

    const-string v3, "?"

    const/4 v4, -0x1

    invoke-direct {v0, v1, v2, v3, v4}, Ljava/lang/StackTraceElement;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0
.end method
