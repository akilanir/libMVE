.class public Lcom/octo/android/robospice/command/RemoveDataFromCacheCommand;
.super Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;
.source "RemoveDataFromCacheCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand",
        "<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private cacheKey:Ljava/lang/Object;

.field private final clazz:Ljava/lang/Class;
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
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/SpiceManager;",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 11
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;-><init>(Lcom/octo/android/robospice/SpiceManager;)V

    .line 12
    iput-object p2, p0, Lcom/octo/android/robospice/command/RemoveDataFromCacheCommand;->clazz:Ljava/lang/Class;

    .line 13
    iput-object p3, p0, Lcom/octo/android/robospice/command/RemoveDataFromCacheCommand;->cacheKey:Ljava/lang/Object;

    .line 14
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
    .line 6
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/command/RemoveDataFromCacheCommand;->executeWhenBound(Lcom/octo/android/robospice/SpiceService;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected executeWhenBound(Lcom/octo/android/robospice/SpiceService;)Ljava/lang/Void;
    .registers 4
    .param p1, "spiceService"    # Lcom/octo/android/robospice/SpiceService;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/octo/android/robospice/command/RemoveDataFromCacheCommand;->clazz:Ljava/lang/Class;

    iget-object v1, p0, Lcom/octo/android/robospice/command/RemoveDataFromCacheCommand;->cacheKey:Ljava/lang/Object;

    invoke-virtual {p1, v0, v1}, Lcom/octo/android/robospice/SpiceService;->removeDataFromCache(Ljava/lang/Class;Ljava/lang/Object;)Z

    .line 19
    const/4 v0, 0x0

    return-object v0
.end method
