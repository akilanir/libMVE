.class public Lorg/slf4j/helpers/SubstituteLoggerFactory;
.super Ljava/lang/Object;
.source "SubstituteLoggerFactory.java"

# interfaces
.implements Lorg/slf4j/ILoggerFactory;


# instance fields
.field final loggerNameList:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/slf4j/helpers/SubstituteLoggerFactory;->loggerNameList:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getLogger(Ljava/lang/String;)Lorg/slf4j/Logger;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 59
    iget-object v1, p0, Lorg/slf4j/helpers/SubstituteLoggerFactory;->loggerNameList:Ljava/util/List;

    monitor-enter v1

    .line 60
    :try_start_3
    iget-object v0, p0, Lorg/slf4j/helpers/SubstituteLoggerFactory;->loggerNameList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_c

    .line 62
    sget-object v0, Lorg/slf4j/helpers/NOPLogger;->NOP_LOGGER:Lorg/slf4j/helpers/NOPLogger;

    return-object v0

    .line 61
    :catchall_c
    move-exception v0

    :try_start_d
    monitor-exit v1
    :try_end_e
    .catchall {:try_start_d .. :try_end_e} :catchall_c

    throw v0
.end method

.method public getLoggerNameList()Ljava/util/List;
    .registers 4

    .prologue
    .line 66
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .local v0, "copy":Ljava/util/List;
    iget-object v2, p0, Lorg/slf4j/helpers/SubstituteLoggerFactory;->loggerNameList:Ljava/util/List;

    monitor-enter v2

    .line 68
    :try_start_8
    iget-object v1, p0, Lorg/slf4j/helpers/SubstituteLoggerFactory;->loggerNameList:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 69
    monitor-exit v2

    .line 70
    return-object v0

    .line 69
    :catchall_f
    move-exception v1

    monitor-exit v2
    :try_end_11
    .catchall {:try_start_8 .. :try_end_11} :catchall_f

    throw v1
.end method
