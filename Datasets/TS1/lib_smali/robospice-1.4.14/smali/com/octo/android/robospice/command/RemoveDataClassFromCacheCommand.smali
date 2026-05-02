.class public Lcom/octo/android/robospice/command/RemoveDataClassFromCacheCommand;
.super Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;
.source "RemoveDataClassFromCacheCommand.java"


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
.field private final clazz:Ljava/lang/Class;
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
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/SpiceManager;",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 10
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;-><init>(Lcom/octo/android/robospice/SpiceManager;)V

    .line 11
    iput-object p2, p0, Lcom/octo/android/robospice/command/RemoveDataClassFromCacheCommand;->clazz:Ljava/lang/Class;

    .line 12
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
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/command/RemoveDataClassFromCacheCommand;->executeWhenBound(Lcom/octo/android/robospice/SpiceService;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected executeWhenBound(Lcom/octo/android/robospice/SpiceService;)Ljava/lang/Void;
    .registers 3
    .param p1, "spiceService"    # Lcom/octo/android/robospice/SpiceService;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/octo/android/robospice/command/RemoveDataClassFromCacheCommand;->clazz:Ljava/lang/Class;

    invoke-virtual {p1, v0}, Lcom/octo/android/robospice/SpiceService;->removeAllDataFromCache(Ljava/lang/Class;)V

    .line 17
    const/4 v0, 0x0

    return-object v0
.end method
