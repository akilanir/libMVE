.class public Lch/qos/logback/classic/android/SQLiteAppender;
.super Lch/qos/logback/core/UnsynchronizedAppenderBase;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lch/qos/logback/core/UnsynchronizedAppenderBase",
        "<",
        "Lch/qos/logback/classic/spi/ILoggingEvent;",
        ">;"
    }
.end annotation


# static fields
.field private static final ARG0_INDEX:I = 0x7

.field private static final CALLER_CLASS_INDEX:I = 0xc

.field private static final CALLER_FILENAME_INDEX:I = 0xb

.field private static final CALLER_LINE_INDEX:I = 0xe

.field private static final CALLER_METHOD_INDEX:I = 0xd

.field private static final EXCEPTION_EXISTS:S = 0x2s

.field private static final FORMATTED_MESSAGE_INDEX:I = 0x2

.field private static final LEVEL_STRING_INDEX:I = 0x4

.field private static final LOGGER_NAME_INDEX:I = 0x3

.field private static final PROPERTIES_EXIST:S = 0x1s

.field private static final REFERENCE_FLAG_INDEX:I = 0x6

.field private static final THREAD_NAME_INDEX:I = 0x5

.field private static final TIMESTMP_INDEX:I = 0x1


# instance fields
.field private db:Landroid/database/sqlite/SQLiteDatabase;

.field private dbNameResolver:Lch/qos/logback/classic/db/names/DBNameResolver;

.field private insertExceptionSQL:Ljava/lang/String;

.field private insertPropertiesSQL:Ljava/lang/String;

.field private insertSQL:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/UnsynchronizedAppenderBase;-><init>()V

    return-void
.end method

.method private asStringTruncatedTo254(Ljava/lang/Object;)Ljava/lang/String;
    .registers 5

    const/16 v2, 0xfe

    const/4 v0, 0x0

    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_9
    if-eqz v0, :cond_16

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v2, :cond_16

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_16
    if-nez v0, :cond_1a

    const-string v0, ""

    :cond_1a
    return-object v0
.end method

.method private bindCallerData(Landroid/database/sqlite/SQLiteStatement;[Ljava/lang/StackTraceElement;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    if-eqz p2, :cond_32

    array-length v0, p2

    if-lez v0, :cond_32

    const/4 v0, 0x0

    aget-object v0, p2, v0

    if-eqz v0, :cond_32

    const/16 v1, 0xb

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    const/16 v1, 0xc

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    const/16 v1, 0xd

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    const/16 v1, 0xe

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    :cond_32
    return-void
.end method

.method private bindLoggingEvent(Landroid/database/sqlite/SQLiteStatement;Lch/qos/logback/classic/spi/ILoggingEvent;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    const/4 v0, 0x1

    invoke-interface {p2}, Lch/qos/logback/classic/spi/ILoggingEvent;->getTimeStamp()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    const/4 v0, 0x2

    invoke-interface {p2}, Lch/qos/logback/classic/spi/ILoggingEvent;->getFormattedMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    const/4 v0, 0x3

    invoke-interface {p2}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLoggerName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    const/4 v0, 0x4

    invoke-interface {p2}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLevel()Lch/qos/logback/classic/Level;

    move-result-object v1

    invoke-virtual {v1}, Lch/qos/logback/classic/Level;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    const/4 v0, 0x5

    invoke-interface {p2}, Lch/qos/logback/classic/spi/ILoggingEvent;->getThreadName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    const/4 v0, 0x6

    invoke-static {p2}, Lch/qos/logback/classic/android/SQLiteAppender;->computeReferenceMask(Lch/qos/logback/classic/spi/ILoggingEvent;)S

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    return-void
.end method

.method private bindLoggingEventArguments(Landroid/database/sqlite/SQLiteStatement;[Ljava/lang/Object;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    const/4 v1, 0x0

    if-eqz p2, :cond_17

    array-length v0, p2

    :goto_4
    if-ge v1, v0, :cond_19

    const/4 v2, 0x4

    if-ge v1, v2, :cond_19

    add-int/lit8 v2, v1, 0x7

    aget-object v3, p2, v1

    invoke-direct {p0, v3}, Lch/qos/logback/classic/android/SQLiteAppender;->asStringTruncatedTo254(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_17
    move v0, v1

    goto :goto_4

    :cond_19
    return-void
.end method

.method private static computeReferenceMask(Lch/qos/logback/classic/spi/ILoggingEvent;)S
    .registers 4

    const/4 v1, 0x0

    invoke-interface {p0}, Lch/qos/logback/classic/spi/ILoggingEvent;->getMDCPropertyMap()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_3a

    invoke-interface {p0}, Lch/qos/logback/classic/spi/ILoggingEvent;->getMDCPropertyMap()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    :goto_13
    invoke-interface {p0}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLoggerContextVO()Lch/qos/logback/classic/spi/LoggerContextVO;

    move-result-object v2

    invoke-virtual {v2}, Lch/qos/logback/classic/spi/LoggerContextVO;->getPropertyMap()Ljava/util/Map;

    move-result-object v2

    if-eqz v2, :cond_38

    invoke-interface {p0}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLoggerContextVO()Lch/qos/logback/classic/spi/LoggerContextVO;

    move-result-object v2

    invoke-virtual {v2}, Lch/qos/logback/classic/spi/LoggerContextVO;->getPropertyMap()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    :goto_29
    if-gtz v0, :cond_2d

    if-lez v2, :cond_2e

    :cond_2d
    const/4 v1, 0x1

    :cond_2e
    invoke-interface {p0}, Lch/qos/logback/classic/spi/ILoggingEvent;->getThrowableProxy()Lch/qos/logback/classic/spi/IThrowableProxy;

    move-result-object v0

    if-eqz v0, :cond_37

    or-int/lit8 v0, v1, 0x2

    int-to-short v1, v0

    :cond_37
    return v1

    :cond_38
    move v2, v1

    goto :goto_29

    :cond_3a
    move v0, v1

    goto :goto_13
.end method

.method private insertException(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;SJ)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    const/4 v0, 0x1

    invoke-virtual {p1, v0, p4, p5}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    const/4 v0, 0x2

    int-to-long v1, p3

    invoke-virtual {p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    const/4 v0, 0x3

    invoke-virtual {p1, v0, p2}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteStatement;->executeInsert()J

    return-void
.end method

.method private insertProperties(Ljava/util/Map;J)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;J)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_46

    iget-object v0, p0, Lch/qos/logback/classic/android/SQLiteAppender;->db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v1, p0, Lch/qos/logback/classic/android/SQLiteAppender;->insertPropertiesSQL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v2

    :try_start_e
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_16
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_43

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    const/4 v1, 0x1

    invoke-virtual {v2, v1, p2, p3}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    const/4 v4, 0x2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v4, v1}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    const/4 v1, 0x3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v1, v0}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->executeInsert()J
    :try_end_3d
    .catchall {:try_start_e .. :try_end_3d} :catchall_3e

    goto :goto_16

    :catchall_3e
    move-exception v0

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->close()V

    throw v0

    :cond_43
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_46
    return-void
.end method

.method private insertThrowable(Lch/qos/logback/classic/spi/IThrowableProxy;J)V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    const/4 v7, 0x0

    iget-object v0, p0, Lch/qos/logback/classic/android/SQLiteAppender;->db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v1, p0, Lch/qos/logback/classic/android/SQLiteAppender;->insertExceptionSQL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    move v3, v7

    :goto_a
    if-eqz p1, :cond_7c

    :try_start_c
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v0, p1}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->subjoinFirstLine(Ljava/lang/StringBuilder;Lch/qos/logback/classic/spi/IThrowableProxy;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v0, v3, 0x1

    int-to-short v6, v0

    move-object v0, p0

    move-wide v4, p2

    invoke-direct/range {v0 .. v5}, Lch/qos/logback/classic/android/SQLiteAppender;->insertException(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;SJ)V

    invoke-interface {p1}, Lch/qos/logback/classic/spi/IThrowableProxy;->getCommonFrames()I

    move-result v9

    invoke-interface {p1}, Lch/qos/logback/classic/spi/IThrowableProxy;->getStackTraceElementProxyArray()[Lch/qos/logback/classic/spi/StackTraceElementProxy;

    move-result-object v10

    move v3, v6

    move v6, v7

    :goto_2a
    array-length v0, v10

    sub-int/2addr v0, v9

    if-ge v6, v0, :cond_4e

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v2, 0x9

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    aget-object v2, v10, v6

    invoke-static {v0, v2}, Lch/qos/logback/classic/spi/ThrowableProxyUtil;->subjoinSTEP(Ljava/lang/StringBuilder;Lch/qos/logback/classic/spi/StackTraceElementProxy;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v0, v3, 0x1

    int-to-short v8, v0

    move-object v0, p0

    move-wide v4, p2

    invoke-direct/range {v0 .. v5}, Lch/qos/logback/classic/android/SQLiteAppender;->insertException(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;SJ)V

    add-int/lit8 v0, v6, 0x1

    move v6, v0

    move v3, v8

    goto :goto_2a

    :cond_4e
    if-lez v9, :cond_77

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v2, 0x9

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "... "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " common frames omitted"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v0, v3, 0x1

    int-to-short v6, v0

    move-object v0, p0

    move-wide v4, p2

    invoke-direct/range {v0 .. v5}, Lch/qos/logback/classic/android/SQLiteAppender;->insertException(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/String;SJ)V

    move v3, v6

    :cond_77
    invoke-interface {p1}, Lch/qos/logback/classic/spi/IThrowableProxy;->getCause()Lch/qos/logback/classic/spi/IThrowableProxy;
    :try_end_7a
    .catchall {:try_start_c .. :try_end_7a} :catchall_80

    move-result-object p1

    goto :goto_a

    :cond_7c
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    return-void

    :catchall_80
    move-exception v0

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    throw v0
.end method

.method private mergePropertyMaps(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/util/Map;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/classic/spi/ILoggingEvent;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLoggerContextVO()Lch/qos/logback/classic/spi/LoggerContextVO;

    move-result-object v1

    invoke-virtual {v1}, Lch/qos/logback/classic/spi/LoggerContextVO;->getPropertyMap()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_12

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    :cond_12
    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getMDCPropertyMap()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_1b

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    :cond_1b
    return-object v0
.end method

.method private secondarySubAppend(Lch/qos/logback/classic/spi/ILoggingEvent;J)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    invoke-direct {p0, p1}, Lch/qos/logback/classic/android/SQLiteAppender;->mergePropertyMaps(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3}, Lch/qos/logback/classic/android/SQLiteAppender;->insertProperties(Ljava/util/Map;J)V

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getThrowableProxy()Lch/qos/logback/classic/spi/IThrowableProxy;

    move-result-object v0

    if-eqz v0, :cond_14

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getThrowableProxy()Lch/qos/logback/classic/spi/IThrowableProxy;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3}, Lch/qos/logback/classic/android/SQLiteAppender;->insertThrowable(Lch/qos/logback/classic/spi/IThrowableProxy;J)V

    :cond_14
    return-void
.end method

.method private subAppend(Lch/qos/logback/classic/spi/ILoggingEvent;Landroid/database/sqlite/SQLiteStatement;)J
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    invoke-direct {p0, p2, p1}, Lch/qos/logback/classic/android/SQLiteAppender;->bindLoggingEvent(Landroid/database/sqlite/SQLiteStatement;Lch/qos/logback/classic/spi/ILoggingEvent;)V

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getArgumentArray()[Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, p2, v0}, Lch/qos/logback/classic/android/SQLiteAppender;->bindLoggingEventArguments(Landroid/database/sqlite/SQLiteStatement;[Ljava/lang/Object;)V

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getCallerData()[Ljava/lang/StackTraceElement;

    move-result-object v0

    invoke-direct {p0, p2, v0}, Lch/qos/logback/classic/android/SQLiteAppender;->bindCallerData(Landroid/database/sqlite/SQLiteStatement;[Ljava/lang/StackTraceElement;)V

    const-wide/16 v0, -0x1

    :try_start_13
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteStatement;->executeInsert()J
    :try_end_16
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_13 .. :try_end_16} :catch_18

    move-result-wide v0

    :goto_17
    return-wide v0

    :catch_18
    move-exception v2

    const-string v3, "Failed to insert loggingEvent"

    invoke-virtual {p0, v3, v2}, Lch/qos/logback/classic/android/SQLiteAppender;->addWarn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_17
.end method


# virtual methods
.method public append(Lch/qos/logback/classic/spi/ILoggingEvent;)V
    .registers 8

    invoke-virtual {p0}, Lch/qos/logback/classic/android/SQLiteAppender;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_35

    :try_start_6
    iget-object v0, p0, Lch/qos/logback/classic/android/SQLiteAppender;->db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v1, p0, Lch/qos/logback/classic/android/SQLiteAppender;->insertSQL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;
    :try_end_d
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_d} :catch_48

    move-result-object v1

    :try_start_e
    iget-object v0, p0, Lch/qos/logback/classic/android/SQLiteAppender;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    invoke-direct {p0, p1, v1}, Lch/qos/logback/classic/android/SQLiteAppender;->subAppend(Lch/qos/logback/classic/spi/ILoggingEvent;Landroid/database/sqlite/SQLiteStatement;)J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v0, v2, v4

    if-eqz v0, :cond_25

    invoke-direct {p0, p1, v2, v3}, Lch/qos/logback/classic/android/SQLiteAppender;->secondarySubAppend(Lch/qos/logback/classic/spi/ILoggingEvent;J)V

    iget-object v0, p0, Lch/qos/logback/classic/android/SQLiteAppender;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_25
    .catchall {:try_start_e .. :try_end_25} :catchall_36

    :cond_25
    :try_start_25
    iget-object v0, p0, Lch/qos/logback/classic/android/SQLiteAppender;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v0

    if-eqz v0, :cond_32

    iget-object v0, p0, Lch/qos/logback/classic/android/SQLiteAppender;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    :cond_32
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    :cond_35
    :goto_35
    return-void

    :catchall_36
    move-exception v0

    iget-object v2, p0, Lch/qos/logback/classic/android/SQLiteAppender;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v2

    if-eqz v2, :cond_44

    iget-object v2, p0, Lch/qos/logback/classic/android/SQLiteAppender;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    :cond_44
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->close()V

    throw v0
    :try_end_48
    .catch Ljava/lang/Throwable; {:try_start_25 .. :try_end_48} :catch_48

    :catch_48
    move-exception v0

    const-string v1, "Cannot append event"

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/classic/android/SQLiteAppender;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_35
.end method

.method public bridge synthetic append(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lch/qos/logback/classic/spi/ILoggingEvent;

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/android/SQLiteAppender;->append(Lch/qos/logback/classic/spi/ILoggingEvent;)V

    return-void
.end method

.method protected finalize()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/classic/android/SQLiteAppender;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    return-void
.end method

.method public setDbNameResolver(Lch/qos/logback/classic/db/names/DBNameResolver;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/classic/android/SQLiteAppender;->dbNameResolver:Lch/qos/logback/classic/db/names/DBNameResolver;

    return-void
.end method

.method public start()V
    .registers 6

    const/4 v2, 0x0

    const/4 v0, 0x1

    const/4 v1, 0x0

    iput-boolean v1, p0, Lch/qos/logback/classic/android/SQLiteAppender;->started:Z

    invoke-virtual {p0}, Lch/qos/logback/classic/android/SQLiteAppender;->getContext()Lch/qos/logback/core/Context;

    move-result-object v3

    if-eqz v3, :cond_15

    invoke-virtual {p0}, Lch/qos/logback/classic/android/SQLiteAppender;->getContext()Lch/qos/logback/core/Context;

    move-result-object v2

    const-string v3, "PACKAGE_NAME"

    invoke-interface {v2, v3}, Lch/qos/logback/core/Context;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_15
    if-eqz v2, :cond_1d

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_23

    :cond_1d
    const-string v0, "Cannot create database without package name"

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/android/SQLiteAppender;->addError(Ljava/lang/String;)V

    :cond_22
    :goto_22
    return-void

    :cond_23
    :try_start_23
    new-instance v3, Ljava/io/File;

    invoke-static {v2}, Lch/qos/logback/core/android/CommonPathUtil;->getDatabaseDirectoryPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "logback.db"

    invoke-direct {v3, v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    iput-object v2, p0, Lch/qos/logback/classic/android/SQLiteAppender;->db:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_40
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_23 .. :try_end_40} :catch_94

    :goto_40
    if-eqz v0, :cond_22

    iget-object v0, p0, Lch/qos/logback/classic/android/SQLiteAppender;->dbNameResolver:Lch/qos/logback/classic/db/names/DBNameResolver;

    if-nez v0, :cond_4d

    new-instance v0, Lch/qos/logback/classic/db/names/DefaultDBNameResolver;

    invoke-direct {v0}, Lch/qos/logback/classic/db/names/DefaultDBNameResolver;-><init>()V

    iput-object v0, p0, Lch/qos/logback/classic/android/SQLiteAppender;->dbNameResolver:Lch/qos/logback/classic/db/names/DBNameResolver;

    :cond_4d
    iget-object v0, p0, Lch/qos/logback/classic/android/SQLiteAppender;->dbNameResolver:Lch/qos/logback/classic/db/names/DBNameResolver;

    invoke-static {v0}, Lch/qos/logback/classic/db/SQLBuilder;->buildInsertExceptionSQL(Lch/qos/logback/classic/db/names/DBNameResolver;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/classic/android/SQLiteAppender;->insertExceptionSQL:Ljava/lang/String;

    iget-object v0, p0, Lch/qos/logback/classic/android/SQLiteAppender;->dbNameResolver:Lch/qos/logback/classic/db/names/DBNameResolver;

    invoke-static {v0}, Lch/qos/logback/classic/db/SQLBuilder;->buildInsertPropertiesSQL(Lch/qos/logback/classic/db/names/DBNameResolver;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/classic/android/SQLiteAppender;->insertPropertiesSQL:Ljava/lang/String;

    iget-object v0, p0, Lch/qos/logback/classic/android/SQLiteAppender;->dbNameResolver:Lch/qos/logback/classic/db/names/DBNameResolver;

    invoke-static {v0}, Lch/qos/logback/classic/db/SQLBuilder;->buildInsertSQL(Lch/qos/logback/classic/db/names/DBNameResolver;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/classic/android/SQLiteAppender;->insertSQL:Ljava/lang/String;

    :try_start_65
    iget-object v0, p0, Lch/qos/logback/classic/android/SQLiteAppender;->db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v1, p0, Lch/qos/logback/classic/android/SQLiteAppender;->dbNameResolver:Lch/qos/logback/classic/db/names/DBNameResolver;

    invoke-static {v1}, Lch/qos/logback/classic/db/SQLBuilder;->buildCreateLoggingEventTableSQL(Lch/qos/logback/classic/db/names/DBNameResolver;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lch/qos/logback/classic/android/SQLiteAppender;->db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v1, p0, Lch/qos/logback/classic/android/SQLiteAppender;->dbNameResolver:Lch/qos/logback/classic/db/names/DBNameResolver;

    invoke-static {v1}, Lch/qos/logback/classic/db/SQLBuilder;->buildCreatePropertyTableSQL(Lch/qos/logback/classic/db/names/DBNameResolver;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object v0, p0, Lch/qos/logback/classic/android/SQLiteAppender;->db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v1, p0, Lch/qos/logback/classic/android/SQLiteAppender;->dbNameResolver:Lch/qos/logback/classic/db/names/DBNameResolver;

    invoke-static {v1}, Lch/qos/logback/classic/db/SQLBuilder;->buildCreateExceptionTableSQL(Lch/qos/logback/classic/db/names/DBNameResolver;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    invoke-super {p0}, Lch/qos/logback/core/UnsynchronizedAppenderBase;->start()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/classic/android/SQLiteAppender;->started:Z
    :try_end_8c
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_65 .. :try_end_8c} :catch_8d

    goto :goto_22

    :catch_8d
    move-exception v0

    const-string v1, "Cannot create database tables"

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/classic/android/SQLiteAppender;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_22

    :catch_94
    move-exception v0

    const-string v2, "Cannot open database"

    invoke-virtual {p0, v2, v0}, Lch/qos/logback/classic/android/SQLiteAppender;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    move v0, v1

    goto :goto_40
.end method

.method public stop()V
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/android/SQLiteAppender;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    return-void
.end method
