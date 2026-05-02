.class public Lcom/octo/android/robospice/command/GetDateOfDataInCacheCommand;
.super Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;
.source "GetDateOfDataInCacheCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand",
        "<",
        "Ljava/util/Date;",
        ">;"
    }
.end annotation


# instance fields
.field private cacheKey:Ljava/lang/Object;

.field private clazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/octo/android/robospice/SpiceManager;Ljava/lang/Class;Ljava/lang/Object;)V
    .registers 4
    .param p1, "spiceManager"    # Lcom/octo/android/robospice/SpiceManager;
    .param p3, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/SpiceManager;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 15
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;-><init>(Lcom/octo/android/robospice/SpiceManager;)V

    .line 16
    iput-object p2, p0, Lcom/octo/android/robospice/command/GetDateOfDataInCacheCommand;->clazz:Ljava/lang/Class;

    .line 17
    iput-object p3, p0, Lcom/octo/android/robospice/command/GetDateOfDataInCacheCommand;->cacheKey:Ljava/lang/Object;

    .line 18
    return-void
.end method


# virtual methods
.method protected bridge synthetic executeWhenBound(Lcom/octo/android/robospice/SpiceService;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lcom/octo/android/robospice/SpiceService;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 10
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/command/GetDateOfDataInCacheCommand;->executeWhenBound(Lcom/octo/android/robospice/SpiceService;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method protected executeWhenBound(Lcom/octo/android/robospice/SpiceService;)Ljava/util/Date;
    .registers 5
    .param p1, "spiceService"    # Lcom/octo/android/robospice/SpiceService;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 23
    :try_start_0
    iget-object v1, p0, Lcom/octo/android/robospice/command/GetDateOfDataInCacheCommand;->clazz:Ljava/lang/Class;

    iget-object v2, p0, Lcom/octo/android/robospice/command/GetDateOfDataInCacheCommand;->cacheKey:Ljava/lang/Object;

    invoke-virtual {p1, v1, v2}, Lcom/octo/android/robospice/SpiceService;->getDateOfDataInCache(Ljava/lang/Class;Ljava/lang/Object;)Ljava/util/Date;
    :try_end_7
    .catch Lcom/octo/android/robospice/persistence/exception/CacheLoadingException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    .line 25
    :goto_8
    return-object v1

    .line 24
    :catch_9
    move-exception v0

    .line 25
    .local v0, "ex":Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;
    const/4 v1, 0x0

    goto :goto_8
.end method
