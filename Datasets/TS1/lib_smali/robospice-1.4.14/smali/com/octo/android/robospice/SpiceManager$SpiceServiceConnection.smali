.class public Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;
.super Ljava/lang/Object;
.source "SpiceManager.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/octo/android/robospice/SpiceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SpiceServiceConnection"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/octo/android/robospice/SpiceManager;


# direct methods
.method public constructor <init>(Lcom/octo/android/robospice/SpiceManager;)V
    .registers 2

    .prologue
    .line 1079
    iput-object p1, p0, Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;->this$0:Lcom/octo/android/robospice/SpiceManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .registers 7
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 1083
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v0}, Lcom/octo/android/robospice/SpiceManager;->access$800(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 1085
    :try_start_9
    instance-of v0, p2, Lcom/octo/android/robospice/SpiceService$SpiceServiceBinder;

    if-eqz v0, :cond_61

    .line 1086
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;->this$0:Lcom/octo/android/robospice/SpiceManager;

    check-cast p2, Lcom/octo/android/robospice/SpiceService$SpiceServiceBinder;

    .end local p2    # "service":Landroid/os/IBinder;
    invoke-virtual {p2}, Lcom/octo/android/robospice/SpiceService$SpiceServiceBinder;->getSpiceService()Lcom/octo/android/robospice/SpiceService;

    move-result-object v1

    # setter for: Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;
    invoke-static {v0, v1}, Lcom/octo/android/robospice/SpiceManager;->access$702(Lcom/octo/android/robospice/SpiceManager;Lcom/octo/android/robospice/SpiceService;)Lcom/octo/android/robospice/SpiceService;

    .line 1087
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;
    invoke-static {v0}, Lcom/octo/android/robospice/SpiceManager;->access$700(Lcom/octo/android/robospice/SpiceManager;)Lcom/octo/android/robospice/SpiceService;

    move-result-object v0

    iget-object v1, p0, Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->removerSpiceServiceListener:Lcom/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener;
    invoke-static {v1}, Lcom/octo/android/robospice/SpiceManager;->access$900(Lcom/octo/android/robospice/SpiceManager;)Lcom/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/octo/android/robospice/SpiceService;->addSpiceServiceListener(Lcom/octo/android/robospice/request/listener/SpiceServiceListener;)V

    .line 1088
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Bound to service : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;
    invoke-static {v1}, Lcom/octo/android/robospice/SpiceManager;->access$700(Lcom/octo/android/robospice/SpiceManager;)Lcom/octo/android/robospice/SpiceService;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 1089
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->conditionServiceBound:Ljava/util/concurrent/locks/Condition;
    invoke-static {v0}, Lcom/octo/android/robospice/SpiceManager;->access$1000(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_57
    .catchall {:try_start_9 .. :try_end_57} :catchall_75

    .line 1094
    :goto_57
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v0}, Lcom/octo/android/robospice/SpiceManager;->access$800(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 1096
    return-void

    .line 1091
    .restart local p2    # "service":Landroid/os/IBinder;
    :cond_61
    :try_start_61
    const-string v0, "Unexpected IBinder service at onServiceConnected :%s "

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Object;[Ljava/lang/Object;)I
    :try_end_74
    .catchall {:try_start_61 .. :try_end_74} :catchall_75

    goto :goto_57

    .line 1094
    .end local p2    # "service":Landroid/os/IBinder;
    :catchall_75
    move-exception v0

    iget-object v1, p0, Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v1}, Lcom/octo/android/robospice/SpiceManager;->access$800(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .registers 4
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    .line 1101
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v0}, Lcom/octo/android/robospice/SpiceManager;->access$800(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 1103
    :try_start_9
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;
    invoke-static {v0}, Lcom/octo/android/robospice/SpiceManager;->access$700(Lcom/octo/android/robospice/SpiceManager;)Lcom/octo/android/robospice/SpiceService;

    move-result-object v0

    if-eqz v0, :cond_4d

    .line 1104
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unbound from service start : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;
    invoke-static {v1}, Lcom/octo/android/robospice/SpiceManager;->access$700(Lcom/octo/android/robospice/SpiceManager;)Lcom/octo/android/robospice/SpiceService;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 1105
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;->this$0:Lcom/octo/android/robospice/SpiceManager;

    const/4 v1, 0x0

    # setter for: Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;
    invoke-static {v0, v1}, Lcom/octo/android/robospice/SpiceManager;->access$702(Lcom/octo/android/robospice/SpiceManager;Lcom/octo/android/robospice/SpiceService;)Lcom/octo/android/robospice/SpiceService;

    .line 1106
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;->this$0:Lcom/octo/android/robospice/SpiceManager;

    const/4 v1, 0x0

    # setter for: Lcom/octo/android/robospice/SpiceManager;->isUnbinding:Z
    invoke-static {v0, v1}, Lcom/octo/android/robospice/SpiceManager;->access$1102(Lcom/octo/android/robospice/SpiceManager;Z)Z

    .line 1107
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->conditionServiceUnbound:Ljava/util/concurrent/locks/Condition;
    invoke-static {v0}, Lcom/octo/android/robospice/SpiceManager;->access$1200(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_4d
    .catchall {:try_start_9 .. :try_end_4d} :catchall_57

    .line 1110
    :cond_4d
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v0}, Lcom/octo/android/robospice/SpiceManager;->access$800(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 1112
    return-void

    .line 1110
    :catchall_57
    move-exception v0

    iget-object v1, p0, Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v1}, Lcom/octo/android/robospice/SpiceManager;->access$800(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method
