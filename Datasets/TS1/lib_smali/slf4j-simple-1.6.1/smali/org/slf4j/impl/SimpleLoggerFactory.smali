.class public Lorg/slf4j/impl/SimpleLoggerFactory;
.super Ljava/lang/Object;
.source "SimpleLoggerFactory.java"

# interfaces
.implements Lorg/slf4j/ILoggerFactory;


# static fields
.field static final INSTANCE:Lorg/slf4j/impl/SimpleLoggerFactory;


# instance fields
.field loggerMap:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 50
    new-instance v0, Lorg/slf4j/impl/SimpleLoggerFactory;

    invoke-direct {v0}, Lorg/slf4j/impl/SimpleLoggerFactory;-><init>()V

    sput-object v0, Lorg/slf4j/impl/SimpleLoggerFactory;->INSTANCE:Lorg/slf4j/impl/SimpleLoggerFactory;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/slf4j/impl/SimpleLoggerFactory;->loggerMap:Ljava/util/Map;

    .line 56
    return-void
.end method


# virtual methods
.method public getLogger(Ljava/lang/String;)Lorg/slf4j/Logger;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 62
    const/4 v1, 0x0

    .line 64
    .local v1, "slogger":Lorg/slf4j/Logger;
    monitor-enter p0

    .line 65
    :try_start_2
    iget-object v3, p0, Lorg/slf4j/impl/SimpleLoggerFactory;->loggerMap:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lorg/slf4j/Logger;

    move-object v1, v0

    .line 66
    if-nez v1, :cond_19

    .line 67
    new-instance v2, Lorg/slf4j/impl/SimpleLogger;

    invoke-direct {v2, p1}, Lorg/slf4j/impl/SimpleLogger;-><init>(Ljava/lang/String;)V
    :try_end_13
    .catchall {:try_start_2 .. :try_end_13} :catchall_1b

    .line 68
    .end local v1    # "slogger":Lorg/slf4j/Logger;
    .local v2, "slogger":Lorg/slf4j/Logger;
    :try_start_13
    iget-object v3, p0, Lorg/slf4j/impl/SimpleLoggerFactory;->loggerMap:Ljava/util/Map;

    invoke-interface {v3, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_18
    .catchall {:try_start_13 .. :try_end_18} :catchall_1e

    move-object v1, v2

    .line 70
    .end local v2    # "slogger":Lorg/slf4j/Logger;
    .restart local v1    # "slogger":Lorg/slf4j/Logger;
    :cond_19
    :try_start_19
    monitor-exit p0

    .line 71
    return-object v1

    .line 70
    :catchall_1b
    move-exception v3

    :goto_1c
    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_19 .. :try_end_1d} :catchall_1b

    throw v3

    .end local v1    # "slogger":Lorg/slf4j/Logger;
    .restart local v2    # "slogger":Lorg/slf4j/Logger;
    :catchall_1e
    move-exception v3

    move-object v1, v2

    .end local v2    # "slogger":Lorg/slf4j/Logger;
    .restart local v1    # "slogger":Lorg/slf4j/Logger;
    goto :goto_1c
.end method
