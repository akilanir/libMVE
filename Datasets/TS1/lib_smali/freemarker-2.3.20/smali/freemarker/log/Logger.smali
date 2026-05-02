.class public abstract Lfreemarker/log/Logger;
.super Ljava/lang/Object;
.source "Logger.java"


# static fields
.field private static final LIBINIT:[Ljava/lang/String;

.field public static final LIBRARY_AUTO:I = -0x1

.field public static final LIBRARY_AVALON:I = 0x2

.field public static final LIBRARY_COMMONS:I = 0x4

.field public static final LIBRARY_JAVA:I = 0x1

.field public static final LIBRARY_LOG4J:I = 0x3

.field public static final LIBRARY_NONE:I = 0x0

.field public static final LIBRARY_SLF4J:I = 0x5

.field private static categoryPrefix:Ljava/lang/String;

.field static class$freemarker$log$Logger:Ljava/lang/Class;

.field private static factory:Lfreemarker/log/LoggerFactory;

.field private static logLibrary:I

.field private static final loggers:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 125
    const/16 v0, 0xc

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "freemarker.log.Logger"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "_Null"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "java.util.logging.Logger"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "_JDK14"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "org.apache.log.Logger"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "_Avalon"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "org.apache.log4j.Logger"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "_Log4J"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "org.apache.commons.logging.Log"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "CommonsLogging"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "org.slf4j.Logger"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "SLF4J"

    aput-object v2, v0, v1

    sput-object v0, Lfreemarker/log/Logger;->LIBINIT:[Ljava/lang/String;

    .line 138
    const-string v0, ""

    sput-object v0, Lfreemarker/log/Logger;->categoryPrefix:Ljava/lang/String;

    .line 140
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lfreemarker/log/Logger;->loggers:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 157
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static createFactory()Lfreemarker/log/LoggerFactory;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 295
    sget v1, Lfreemarker/log/Logger;->logLibrary:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_29

    .line 297
    sget-object v1, Lfreemarker/log/Logger;->LIBINIT:[Ljava/lang/String;

    array-length v1, v1

    div-int/lit8 v1, v1, 0x2

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_c
    if-lez v0, :cond_1c

    .line 300
    const/4 v1, 0x5

    if-eq v0, v1, :cond_14

    const/4 v1, 0x4

    if-ne v0, v1, :cond_17

    .line 297
    :cond_14
    :goto_14
    add-int/lit8 v0, v0, -0x1

    goto :goto_c

    .line 304
    :cond_17
    :try_start_17
    invoke-static {v0}, Lfreemarker/log/Logger;->createFactory(I)Lfreemarker/log/LoggerFactory;
    :try_end_1a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_17 .. :try_end_1a} :catch_30

    move-result-object v1

    .line 316
    .end local v0    # "i":I
    :goto_1b
    return-object v1

    .line 311
    .restart local v0    # "i":I
    :cond_1c
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v2, "*** WARNING: FreeMarker logging suppressed."

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 312
    new-instance v1, Lfreemarker/log/_NullLoggerFactory;

    invoke-direct {v1}, Lfreemarker/log/_NullLoggerFactory;-><init>()V

    goto :goto_1b

    .line 316
    .end local v0    # "i":I
    :cond_29
    sget v1, Lfreemarker/log/Logger;->logLibrary:I

    invoke-static {v1}, Lfreemarker/log/Logger;->createFactory(I)Lfreemarker/log/LoggerFactory;

    move-result-object v1

    goto :goto_1b

    .line 306
    .restart local v0    # "i":I
    :catch_30
    move-exception v1

    goto :goto_14
.end method

.method private static createFactory(I)Lfreemarker/log/LoggerFactory;
    .registers 6
    .param p0, "library"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 324
    sget-object v3, Lfreemarker/log/Logger;->LIBINIT:[Ljava/lang/String;

    mul-int/lit8 v4, p0, 0x2

    aget-object v2, v3, v4

    .line 325
    .local v2, "loggerClassName":Ljava/lang/String;
    sget-object v3, Lfreemarker/log/Logger;->LIBINIT:[Ljava/lang/String;

    mul-int/lit8 v4, p0, 0x2

    add-int/lit8 v4, v4, 0x1

    aget-object v1, v3, v4

    .line 329
    .local v1, "factoryType":Ljava/lang/String;
    :try_start_e
    invoke-static {v2}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 330
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "freemarker.log."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "LoggerFactory"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfreemarker/log/LoggerFactory;
    :try_end_34
    .catch Ljava/lang/IllegalAccessException; {:try_start_e .. :try_end_34} :catch_35
    .catch Ljava/lang/InstantiationException; {:try_start_e .. :try_end_34} :catch_40

    return-object v3

    .line 332
    :catch_35
    move-exception v0

    .line 335
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v3, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v3

    .line 337
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_40
    move-exception v0

    .line 340
    .local v0, "e":Ljava/lang/InstantiationException;
    new-instance v3, Ljava/lang/InstantiationError;

    invoke-virtual {v0}, Ljava/lang/InstantiationException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/InstantiationError;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public static getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;
    .registers 6
    .param p0, "category"    # Ljava/lang/String;

    .prologue
    .line 261
    sget-object v2, Lfreemarker/log/Logger;->factory:Lfreemarker/log/LoggerFactory;

    if-nez v2, :cond_1a

    .line 262
    sget-object v2, Lfreemarker/log/Logger;->class$freemarker$log$Logger:Ljava/lang/Class;

    if-nez v2, :cond_47

    const-string v2, "freemarker.log.Logger"

    invoke-static {v2}, Lfreemarker/log/Logger;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/log/Logger;->class$freemarker$log$Logger:Ljava/lang/Class;

    :goto_10
    monitor-enter v2

    .line 263
    :try_start_11
    sget-object v3, Lfreemarker/log/Logger;->factory:Lfreemarker/log/LoggerFactory;
    :try_end_13
    .catchall {:try_start_11 .. :try_end_13} :catchall_55

    if-nez v3, :cond_19

    .line 266
    const/4 v3, -0x1

    :try_start_16
    invoke-static {v3}, Lfreemarker/log/Logger;->selectLoggerLibrary(I)V
    :try_end_19
    .catch Ljava/lang/ClassNotFoundException; {:try_start_16 .. :try_end_19} :catch_4a
    .catchall {:try_start_16 .. :try_end_19} :catchall_55

    .line 274
    :cond_19
    :try_start_19
    monitor-exit v2
    :try_end_1a
    .catchall {:try_start_19 .. :try_end_1a} :catchall_55

    .line 277
    :cond_1a
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    sget-object v3, Lfreemarker/log/Logger;->categoryPrefix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 279
    sget-object v3, Lfreemarker/log/Logger;->loggers:Ljava/util/Map;

    monitor-enter v3

    .line 281
    :try_start_30
    sget-object v2, Lfreemarker/log/Logger;->loggers:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/log/Logger;

    .line 282
    .local v1, "logger":Lfreemarker/log/Logger;
    if-nez v1, :cond_45

    .line 284
    sget-object v2, Lfreemarker/log/Logger;->factory:Lfreemarker/log/LoggerFactory;

    invoke-interface {v2, p0}, Lfreemarker/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v1

    .line 285
    sget-object v2, Lfreemarker/log/Logger;->loggers:Ljava/util/Map;

    invoke-interface {v2, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    :cond_45
    monitor-exit v3
    :try_end_46
    .catchall {:try_start_30 .. :try_end_46} :catchall_58

    return-object v1

    .line 262
    .end local v1    # "logger":Lfreemarker/log/Logger;
    :cond_47
    sget-object v2, Lfreemarker/log/Logger;->class$freemarker$log$Logger:Ljava/lang/Class;

    goto :goto_10

    .line 268
    :catch_4a
    move-exception v0

    .line 271
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    :try_start_4b
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 274
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :catchall_55
    move-exception v3

    monitor-exit v2
    :try_end_57
    .catchall {:try_start_4b .. :try_end_57} :catchall_55

    throw v3

    .line 288
    :catchall_58
    move-exception v2

    :try_start_59
    monitor-exit v3
    :try_end_5a
    .catchall {:try_start_59 .. :try_end_5a} :catchall_58

    throw v2
.end method

.method public static selectLoggerLibrary(I)V
    .registers 4
    .param p0, "library"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 157
    sget-object v0, Lfreemarker/log/Logger;->class$freemarker$log$Logger:Ljava/lang/Class;

    if-nez v0, :cond_20

    const-string v0, "freemarker.log.Logger"

    invoke-static {v0}, Lfreemarker/log/Logger;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/log/Logger;->class$freemarker$log$Logger:Ljava/lang/Class;

    :goto_c
    monitor-enter v0

    .line 158
    const/4 v1, -0x1

    if-lt p0, v1, :cond_17

    mul-int/lit8 v1, p0, 0x2

    :try_start_12
    sget-object v2, Lfreemarker/log/Logger;->LIBINIT:[Ljava/lang/String;

    array-length v2, v2

    if-lt v1, v2, :cond_23

    .line 160
    :cond_17
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 164
    :catchall_1d
    move-exception v1

    monitor-exit v0
    :try_end_1f
    .catchall {:try_start_12 .. :try_end_1f} :catchall_1d

    throw v1

    .line 157
    :cond_20
    sget-object v0, Lfreemarker/log/Logger;->class$freemarker$log$Logger:Ljava/lang/Class;

    goto :goto_c

    .line 162
    :cond_23
    :try_start_23
    sput p0, Lfreemarker/log/Logger;->logLibrary:I

    .line 163
    invoke-static {}, Lfreemarker/log/Logger;->createFactory()Lfreemarker/log/LoggerFactory;

    move-result-object v1

    sput-object v1, Lfreemarker/log/Logger;->factory:Lfreemarker/log/LoggerFactory;

    .line 164
    monitor-exit v0
    :try_end_2c
    .catchall {:try_start_23 .. :try_end_2c} :catchall_1d

    .line 165
    return-void
.end method

.method public static setCategoryPrefix(Ljava/lang/String;)V
    .registers 3
    .param p0, "prefix"    # Ljava/lang/String;

    .prologue
    .line 180
    sget-object v0, Lfreemarker/log/Logger;->class$freemarker$log$Logger:Ljava/lang/Class;

    if-nez v0, :cond_18

    const-string v0, "freemarker.log.Logger"

    invoke-static {v0}, Lfreemarker/log/Logger;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/log/Logger;->class$freemarker$log$Logger:Ljava/lang/Class;

    :goto_c
    monitor-enter v0

    .line 181
    if-nez p0, :cond_1b

    .line 183
    :try_start_f
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 186
    :catchall_15
    move-exception v1

    monitor-exit v0
    :try_end_17
    .catchall {:try_start_f .. :try_end_17} :catchall_15

    throw v1

    .line 180
    :cond_18
    sget-object v0, Lfreemarker/log/Logger;->class$freemarker$log$Logger:Ljava/lang/Class;

    goto :goto_c

    .line 185
    :cond_1b
    :try_start_1b
    sput-object p0, Lfreemarker/log/Logger;->categoryPrefix:Ljava/lang/String;

    .line 186
    monitor-exit v0
    :try_end_1e
    .catchall {:try_start_1b .. :try_end_1e} :catchall_15

    .line 187
    return-void
.end method


# virtual methods
.method public abstract debug(Ljava/lang/String;)V
.end method

.method public abstract debug(Ljava/lang/String;Ljava/lang/Throwable;)V
.end method

.method public abstract error(Ljava/lang/String;)V
.end method

.method public abstract error(Ljava/lang/String;Ljava/lang/Throwable;)V
.end method

.method public abstract info(Ljava/lang/String;)V
.end method

.method public abstract info(Ljava/lang/String;Ljava/lang/Throwable;)V
.end method

.method public abstract isDebugEnabled()Z
.end method

.method public abstract isErrorEnabled()Z
.end method

.method public abstract isFatalEnabled()Z
.end method

.method public abstract isInfoEnabled()Z
.end method

.method public abstract isWarnEnabled()Z
.end method

.method public abstract warn(Ljava/lang/String;)V
.end method

.method public abstract warn(Ljava/lang/String;Ljava/lang/Throwable;)V
.end method
