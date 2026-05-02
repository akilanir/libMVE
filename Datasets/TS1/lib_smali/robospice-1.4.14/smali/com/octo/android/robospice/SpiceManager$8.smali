.class Lcom/octo/android/robospice/SpiceManager$8;
.super Ljava/lang/Object;
.source "SpiceManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/octo/android/robospice/SpiceManager;->dumpState()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/octo/android/robospice/SpiceManager;


# direct methods
.method constructor <init>(Lcom/octo/android/robospice/SpiceManager;)V
    .registers 2

    .prologue
    .line 1035
    iput-object p1, p0, Lcom/octo/android/robospice/SpiceManager$8;->this$0:Lcom/octo/android/robospice/SpiceManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 1038
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager$8;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v2}, Lcom/octo/android/robospice/SpiceManager;->access$300(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 1040
    :try_start_9
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1041
    .local v1, "stringBuilder":Ljava/lang/StringBuilder;
    const-string v2, "[SpiceManager : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1043
    const-string v2, "Requests to be launched : \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1044
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager$8;->this$0:Lcom/octo/android/robospice/SpiceManager;

    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager$8;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;
    invoke-static {v3}, Lcom/octo/android/robospice/SpiceManager;->access$400(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/Map;

    move-result-object v3

    # invokes: Lcom/octo/android/robospice/SpiceManager;->dumpMap(Ljava/lang/StringBuilder;Ljava/util/Map;)V
    invoke-static {v2, v1, v3}, Lcom/octo/android/robospice/SpiceManager;->access$500(Lcom/octo/android/robospice/SpiceManager;Ljava/lang/StringBuilder;Ljava/util/Map;)V

    .line 1046
    const-string v2, "Pending requests : \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1047
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager$8;->this$0:Lcom/octo/android/robospice/SpiceManager;

    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager$8;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->mapPendingRequestToRequestListener:Ljava/util/Map;
    invoke-static {v3}, Lcom/octo/android/robospice/SpiceManager;->access$600(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/Map;

    move-result-object v3

    # invokes: Lcom/octo/android/robospice/SpiceManager;->dumpMap(Ljava/lang/StringBuilder;Ljava/util/Map;)V
    invoke-static {v2, v1, v3}, Lcom/octo/android/robospice/SpiceManager;->access$500(Lcom/octo/android/robospice/SpiceManager;Ljava/lang/StringBuilder;Ljava/util/Map;)V

    .line 1049
    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1051
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager$8;->this$0:Lcom/octo/android/robospice/SpiceManager;

    invoke-virtual {v2}, Lcom/octo/android/robospice/SpiceManager;->waitForServiceToBeBound()V

    .line 1052
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager$8;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;
    invoke-static {v2}, Lcom/octo/android/robospice/SpiceManager;->access$700(Lcom/octo/android/robospice/SpiceManager;)Lcom/octo/android/robospice/SpiceService;
    :try_end_42
    .catch Ljava/lang/InterruptedException; {:try_start_9 .. :try_end_42} :catch_62
    .catchall {:try_start_9 .. :try_end_42} :catchall_75

    move-result-object v2

    if-nez v2, :cond_4f

    .line 1059
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager$8;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v2}, Lcom/octo/android/robospice/SpiceManager;->access$300(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 1061
    .end local v1    # "stringBuilder":Ljava/lang/StringBuilder;
    :goto_4e
    return-void

    .line 1055
    .restart local v1    # "stringBuilder":Ljava/lang/StringBuilder;
    :cond_4f
    :try_start_4f
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager$8;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;
    invoke-static {v2}, Lcom/octo/android/robospice/SpiceManager;->access$700(Lcom/octo/android/robospice/SpiceManager;)Lcom/octo/android/robospice/SpiceService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/octo/android/robospice/SpiceService;->dumpState()V
    :try_end_58
    .catch Ljava/lang/InterruptedException; {:try_start_4f .. :try_end_58} :catch_62
    .catchall {:try_start_4f .. :try_end_58} :catchall_75

    .line 1059
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager$8;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v2}, Lcom/octo/android/robospice/SpiceManager;->access$300(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_4e

    .line 1056
    .end local v1    # "stringBuilder":Ljava/lang/StringBuilder;
    :catch_62
    move-exception v0

    .line 1057
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_63
    const-string v2, "Interrupted while waiting for acquiring service."

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v0, v2, v3}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I
    :try_end_6b
    .catchall {:try_start_63 .. :try_end_6b} :catchall_75

    .line 1059
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager$8;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v2}, Lcom/octo/android/robospice/SpiceManager;->access$300(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_4e

    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_75
    move-exception v2

    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager$8;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v3}, Lcom/octo/android/robospice/SpiceManager;->access$300(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v2
.end method
