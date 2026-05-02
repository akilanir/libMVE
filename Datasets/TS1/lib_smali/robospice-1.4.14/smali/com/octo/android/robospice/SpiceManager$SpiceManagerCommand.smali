.class public abstract Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;
.super Ljava/lang/Object;
.source "SpiceManager.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/octo/android/robospice/SpiceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "SpiceManagerCommand"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private exception:Ljava/lang/Exception;

.field protected spiceManager:Lcom/octo/android/robospice/SpiceManager;

.field private successFull:Z


# direct methods
.method public constructor <init>(Lcom/octo/android/robospice/SpiceManager;)V
    .registers 2
    .param p1, "spiceManager"    # Lcom/octo/android/robospice/SpiceManager;

    .prologue
    .line 1323
    .local p0, "this":Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;, "Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1324
    iput-object p1, p0, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    .line 1325
    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;, "Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand<TT;>;"
    const/4 v5, 0x1

    const/4 v2, 0x0

    .line 1330
    :try_start_2
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    invoke-virtual {v3}, Lcom/octo/android/robospice/SpiceManager;->waitForServiceToBeBound()V

    .line 1331
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;
    invoke-static {v3}, Lcom/octo/android/robospice/SpiceManager;->access$700(Lcom/octo/android/robospice/SpiceManager;)Lcom/octo/android/robospice/SpiceService;

    move-result-object v3

    if-nez v3, :cond_11

    move-object v1, v2

    .line 1352
    :goto_10
    return-object v1

    .line 1335
    :cond_11
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v3}, Lcom/octo/android/robospice/SpiceManager;->access$300(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V
    :try_end_1a
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_1a} :catch_4c

    .line 1337
    :try_start_1a
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;
    invoke-static {v3}, Lcom/octo/android/robospice/SpiceManager;->access$700(Lcom/octo/android/robospice/SpiceManager;)Lcom/octo/android/robospice/SpiceService;

    move-result-object v3

    if-eqz v3, :cond_2a

    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->isStopped:Z
    invoke-static {v3}, Lcom/octo/android/robospice/SpiceManager;->access$1300(Lcom/octo/android/robospice/SpiceManager;)Z
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_27} :catch_61
    .catchall {:try_start_1a .. :try_end_27} :catchall_72

    move-result v3

    if-eqz v3, :cond_35

    .line 1348
    :cond_2a
    :try_start_2a
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v3}, Lcom/octo/android/robospice/SpiceManager;->access$300(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V
    :try_end_33
    .catch Ljava/lang/InterruptedException; {:try_start_2a .. :try_end_33} :catch_4c

    move-object v1, v2

    goto :goto_10

    .line 1340
    :cond_35
    :try_start_35
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;
    invoke-static {v3}, Lcom/octo/android/robospice/SpiceManager;->access$700(Lcom/octo/android/robospice/SpiceManager;)Lcom/octo/android/robospice/SpiceService;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;->executeWhenBound(Lcom/octo/android/robospice/SpiceService;)Ljava/lang/Object;

    move-result-object v1

    .line 1341
    .local v1, "result":Ljava/lang/Object;, "TT;"
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;->successFull:Z
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_42} :catch_61
    .catchall {:try_start_35 .. :try_end_42} :catchall_72

    .line 1348
    :try_start_42
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v3}, Lcom/octo/android/robospice/SpiceManager;->access$300(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V
    :try_end_4b
    .catch Ljava/lang/InterruptedException; {:try_start_42 .. :try_end_4b} :catch_4c

    goto :goto_10

    .line 1350
    .end local v1    # "result":Ljava/lang/Object;, "TT;"
    :catch_4c
    move-exception v0

    .line 1351
    .local v0, "e":Ljava/lang/InterruptedException;
    const-string v3, "Spice command %s couldn\'t bind to service."

    new-array v4, v5, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v0, v3, v4}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    move-object v1, v2

    .line 1352
    goto :goto_10

    .line 1343
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_61
    move-exception v0

    .line 1344
    .local v0, "e":Ljava/lang/Exception;
    :try_start_62
    invoke-static {v0}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;)I

    .line 1345
    iput-object v0, p0, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;->exception:Ljava/lang/Exception;
    :try_end_67
    .catchall {:try_start_62 .. :try_end_67} :catchall_72

    .line 1348
    :try_start_67
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v3}, Lcom/octo/android/robospice/SpiceManager;->access$300(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    move-object v1, v2

    goto :goto_10

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_72
    move-exception v3

    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v4}, Lcom/octo/android/robospice/SpiceManager;->access$300(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v3
    :try_end_7d
    .catch Ljava/lang/InterruptedException; {:try_start_67 .. :try_end_7d} :catch_4c
.end method

.method protected abstract executeWhenBound(Lcom/octo/android/robospice/SpiceService;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/SpiceService;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public getException()Ljava/lang/Exception;
    .registers 2

    .prologue
    .line 1364
    .local p0, "this":Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;, "Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand<TT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;->exception:Ljava/lang/Exception;

    return-object v0
.end method

.method public isSuccessFull()Z
    .registers 2

    .prologue
    .line 1360
    .local p0, "this":Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;, "Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand<TT;>;"
    iget-boolean v0, p0, Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;->successFull:Z

    return v0
.end method
