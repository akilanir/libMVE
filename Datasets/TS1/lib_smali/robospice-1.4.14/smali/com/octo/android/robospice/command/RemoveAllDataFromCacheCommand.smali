.class public Lcom/octo/android/robospice/command/RemoveAllDataFromCacheCommand;
.super Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;
.source "RemoveAllDataFromCacheCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand",
        "<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/octo/android/robospice/SpiceManager;)V
    .registers 2
    .param p1, "spiceManager"    # Lcom/octo/android/robospice/SpiceManager;

    .prologue
    .line 9
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;-><init>(Lcom/octo/android/robospice/SpiceManager;)V

    .line 10
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
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/command/RemoveAllDataFromCacheCommand;->executeWhenBound(Lcom/octo/android/robospice/SpiceService;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected executeWhenBound(Lcom/octo/android/robospice/SpiceService;)Ljava/lang/Void;
    .registers 3
    .param p1, "spiceService"    # Lcom/octo/android/robospice/SpiceService;

    .prologue
    .line 14
    invoke-virtual {p1}, Lcom/octo/android/robospice/SpiceService;->removeAllDataFromCache()V

    .line 15
    const/4 v0, 0x0

    return-object v0
.end method
