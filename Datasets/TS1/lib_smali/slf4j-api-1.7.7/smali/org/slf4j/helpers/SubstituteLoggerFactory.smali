.class public Lorg/slf4j/helpers/SubstituteLoggerFactory;
.super Ljava/lang/Object;
.source "SubstituteLoggerFactory.java"

# interfaces
.implements Lorg/slf4j/ILoggerFactory;


# instance fields
.field final loggers:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/slf4j/helpers/SubstituteLogger;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/slf4j/helpers/SubstituteLoggerFactory;->loggers:Ljava/util/concurrent/ConcurrentMap;

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lorg/slf4j/helpers/SubstituteLoggerFactory;->loggers:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->clear()V

    .line 66
    return-void
.end method

.method public getLogger(Ljava/lang/String;)Lorg/slf4j/Logger;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 46
    iget-object v2, p0, Lorg/slf4j/helpers/SubstituteLoggerFactory;->loggers:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/slf4j/helpers/SubstituteLogger;

    .line 47
    .local v0, "logger":Lorg/slf4j/helpers/SubstituteLogger;
    if-nez v0, :cond_1a

    .line 48
    new-instance v0, Lorg/slf4j/helpers/SubstituteLogger;

    .end local v0    # "logger":Lorg/slf4j/helpers/SubstituteLogger;
    invoke-direct {v0, p1}, Lorg/slf4j/helpers/SubstituteLogger;-><init>(Ljava/lang/String;)V

    .line 49
    .restart local v0    # "logger":Lorg/slf4j/helpers/SubstituteLogger;
    iget-object v2, p0, Lorg/slf4j/helpers/SubstituteLoggerFactory;->loggers:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, p1, v0}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/slf4j/helpers/SubstituteLogger;

    .line 50
    .local v1, "oldLogger":Lorg/slf4j/helpers/SubstituteLogger;
    if-eqz v1, :cond_1a

    .line 51
    move-object v0, v1

    .line 53
    .end local v1    # "oldLogger":Lorg/slf4j/helpers/SubstituteLogger;
    :cond_1a
    return-object v0
.end method

.method public getLoggerNames()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 57
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/slf4j/helpers/SubstituteLoggerFactory;->loggers:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1}, Ljava/util/concurrent/ConcurrentMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getLoggers()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/slf4j/helpers/SubstituteLogger;",
            ">;"
        }
    .end annotation

    .prologue
    .line 61
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/slf4j/helpers/SubstituteLoggerFactory;->loggers:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method
