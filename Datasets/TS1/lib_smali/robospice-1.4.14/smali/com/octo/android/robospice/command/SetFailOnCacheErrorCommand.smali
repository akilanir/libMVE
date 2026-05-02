.class public Lcom/octo/android/robospice/command/SetFailOnCacheErrorCommand;
.super Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;
.source "SetFailOnCacheErrorCommand.java"


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
.field private final failOnCacheError:Z


# direct methods
.method public constructor <init>(Lcom/octo/android/robospice/SpiceManager;Z)V
    .registers 3
    .param p1, "spiceManager"    # Lcom/octo/android/robospice/SpiceManager;
    .param p2, "failOnCacheError"    # Z

    .prologue
    .line 11
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;-><init>(Lcom/octo/android/robospice/SpiceManager;)V

    .line 12
    iput-boolean p2, p0, Lcom/octo/android/robospice/command/SetFailOnCacheErrorCommand;->failOnCacheError:Z

    .line 13
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
    .line 7
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/command/SetFailOnCacheErrorCommand;->executeWhenBound(Lcom/octo/android/robospice/SpiceService;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected executeWhenBound(Lcom/octo/android/robospice/SpiceService;)Ljava/lang/Void;
    .registers 3
    .param p1, "spiceService"    # Lcom/octo/android/robospice/SpiceService;

    .prologue
    .line 17
    iget-boolean v0, p0, Lcom/octo/android/robospice/command/SetFailOnCacheErrorCommand;->failOnCacheError:Z

    invoke-virtual {p1, v0}, Lcom/octo/android/robospice/SpiceService;->setFailOnCacheError(Z)V

    .line 18
    const/4 v0, 0x0

    return-object v0
.end method
