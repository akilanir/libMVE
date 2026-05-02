.class public Lcom/octo/android/robospice/command/GetAllCacheKeysCommand;
.super Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;
.source "GetAllCacheKeysCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand",
        "<",
        "Ljava/util/List",
        "<",
        "Ljava/lang/Object;",
        ">;>;"
    }
.end annotation


# instance fields
.field private clazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/octo/android/robospice/SpiceManager;Ljava/lang/Class;)V
    .registers 3
    .param p1, "spiceManager"    # Lcom/octo/android/robospice/SpiceManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/SpiceManager;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 14
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;-><init>(Lcom/octo/android/robospice/SpiceManager;)V

    .line 15
    iput-object p2, p0, Lcom/octo/android/robospice/command/GetAllCacheKeysCommand;->clazz:Ljava/lang/Class;

    .line 16
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
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/command/GetAllCacheKeysCommand;->executeWhenBound(Lcom/octo/android/robospice/SpiceService;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected executeWhenBound(Lcom/octo/android/robospice/SpiceService;)Ljava/util/List;
    .registers 3
    .param p1, "spiceService"    # Lcom/octo/android/robospice/SpiceService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/SpiceService;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;,
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 20
    iget-object v0, p0, Lcom/octo/android/robospice/command/GetAllCacheKeysCommand;->clazz:Ljava/lang/Class;

    invoke-virtual {p1, v0}, Lcom/octo/android/robospice/SpiceService;->getAllCacheKeys(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
