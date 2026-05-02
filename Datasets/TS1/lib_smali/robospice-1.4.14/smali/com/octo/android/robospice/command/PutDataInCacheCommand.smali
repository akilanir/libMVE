.class public Lcom/octo/android/robospice/command/PutDataInCacheCommand;
.super Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;
.source "PutDataInCacheCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private cacheKey:Ljava/lang/Object;

.field private data:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/octo/android/robospice/SpiceManager;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .param p1, "spiceManager"    # Lcom/octo/android/robospice/SpiceManager;
    .param p3, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/SpiceManager;",
            "TT;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 13
    .local p0, "this":Lcom/octo/android/robospice/command/PutDataInCacheCommand;, "Lcom/octo/android/robospice/command/PutDataInCacheCommand<TT;>;"
    .local p2, "data":Ljava/lang/Object;, "TT;"
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;-><init>(Lcom/octo/android/robospice/SpiceManager;)V

    .line 14
    iput-object p2, p0, Lcom/octo/android/robospice/command/PutDataInCacheCommand;->data:Ljava/lang/Object;

    .line 15
    iput-object p3, p0, Lcom/octo/android/robospice/command/PutDataInCacheCommand;->cacheKey:Ljava/lang/Object;

    .line 16
    return-void
.end method


# virtual methods
.method protected executeWhenBound(Lcom/octo/android/robospice/SpiceService;)Ljava/lang/Object;
    .registers 4
    .param p1, "spiceService"    # Lcom/octo/android/robospice/SpiceService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/SpiceService;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheSavingException;,
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 20
    .local p0, "this":Lcom/octo/android/robospice/command/PutDataInCacheCommand;, "Lcom/octo/android/robospice/command/PutDataInCacheCommand<TT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/command/PutDataInCacheCommand;->cacheKey:Ljava/lang/Object;

    iget-object v1, p0, Lcom/octo/android/robospice/command/PutDataInCacheCommand;->data:Ljava/lang/Object;

    invoke-virtual {p1, v0, v1}, Lcom/octo/android/robospice/SpiceService;->putDataInCache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
