.class public Lcom/octo/android/robospice/command/IsDataInCacheCommand;
.super Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;
.source "IsDataInCacheCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field private cacheExpiryDuration:J

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
.method public constructor <init>(Lcom/octo/android/robospice/SpiceManager;Ljava/lang/Class;Ljava/lang/Object;J)V
    .registers 6
    .param p1, "spiceManager"    # Lcom/octo/android/robospice/SpiceManager;
    .param p3, "cacheKey"    # Ljava/lang/Object;
    .param p4, "cacheExpiryDuration"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/SpiceManager;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            "J)V"
        }
    .end annotation

    .prologue
    .line 14
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;-><init>(Lcom/octo/android/robospice/SpiceManager;)V

    .line 15
    iput-object p2, p0, Lcom/octo/android/robospice/command/IsDataInCacheCommand;->clazz:Ljava/lang/Class;

    .line 16
    iput-wide p4, p0, Lcom/octo/android/robospice/command/IsDataInCacheCommand;->cacheExpiryDuration:J

    .line 17
    iput-object p3, p0, Lcom/octo/android/robospice/command/IsDataInCacheCommand;->cacheKey:Ljava/lang/Object;

    .line 18
    return-void
.end method


# virtual methods
.method protected executeWhenBound(Lcom/octo/android/robospice/SpiceService;)Ljava/lang/Boolean;
    .registers 6
    .param p1, "spiceService"    # Lcom/octo/android/robospice/SpiceService;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheSavingException;,
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 22
    iget-object v0, p0, Lcom/octo/android/robospice/command/IsDataInCacheCommand;->clazz:Ljava/lang/Class;

    iget-object v1, p0, Lcom/octo/android/robospice/command/IsDataInCacheCommand;->cacheKey:Ljava/lang/Object;

    iget-wide v2, p0, Lcom/octo/android/robospice/command/IsDataInCacheCommand;->cacheExpiryDuration:J

    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/octo/android/robospice/SpiceService;->isDataInCache(Ljava/lang/Class;Ljava/lang/Object;J)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic executeWhenBound(Lcom/octo/android/robospice/SpiceService;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lcom/octo/android/robospice/SpiceService;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 8
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/command/IsDataInCacheCommand;->executeWhenBound(Lcom/octo/android/robospice/SpiceService;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
