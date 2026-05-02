.class final Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;
.super Lcom/google/common/util/concurrent/Service$Listener;
.source "ServiceManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/ServiceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ServiceListener"
.end annotation


# instance fields
.field final service:Lcom/google/common/util/concurrent/Service;

.field final state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

.field final watch:Lcom/google/common/base/Stopwatch;
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "watch"
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/Service;Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;)V
    .registers 4
    .param p1, "service"    # Lcom/google/common/util/concurrent/Service;
    .param p2, "state"    # Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    .prologue
    .line 601
    invoke-direct {p0}, Lcom/google/common/util/concurrent/Service$Listener;-><init>()V

    .line 593
    invoke-static {}, Lcom/google/common/base/Stopwatch;->createUnstarted()Lcom/google/common/base/Stopwatch;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->watch:Lcom/google/common/base/Stopwatch;

    .line 602
    iput-object p1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->service:Lcom/google/common/util/concurrent/Service;

    .line 603
    iput-object p2, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    .line 604
    return-void
.end method


# virtual methods
.method public failed(Lcom/google/common/util/concurrent/Service$State;Ljava/lang/Throwable;)V
    .registers 7
    .param p1, "from"    # Lcom/google/common/util/concurrent/Service$State;
    .param p2, "failure"    # Ljava/lang/Throwable;

    .prologue
    .line 655
    # getter for: Lcom/google/common/util/concurrent/ServiceManager;->logger:Ljava/util/logging/Logger;
    invoke-static {}, Lcom/google/common/util/concurrent/ServiceManager;->access$300()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Service "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->service:Lcom/google/common/util/concurrent/Service;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " has failed in the "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " state."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2, p2}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 657
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    iget-object v0, v0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/Monitor;->enter()V

    .line 659
    :try_start_35
    sget-object v0, Lcom/google/common/util/concurrent/Service$State;->STARTING:Lcom/google/common/util/concurrent/Service$State;

    if-ne p1, v0, :cond_3d

    .line 660
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->finishedStarting(Z)V

    .line 662
    :cond_3d
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    iget-object v1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->service:Lcom/google/common/util/concurrent/Service;

    # invokes: Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->serviceFailed(Lcom/google/common/util/concurrent/Service;)V
    invoke-static {v0, v1}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->access$500(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;Lcom/google/common/util/concurrent/Service;)V
    :try_end_44
    .catchall {:try_start_35 .. :try_end_44} :catchall_51

    .line 664
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    iget-object v0, v0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 665
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    # invokes: Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->executeListeners()V
    invoke-static {v0}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->access$200(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;)V

    .line 667
    return-void

    .line 664
    :catchall_51
    move-exception v0

    iget-object v1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    iget-object v1, v1, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 665
    iget-object v1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    # invokes: Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->executeListeners()V
    invoke-static {v1}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->access$200(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;)V

    throw v0
.end method

.method finishedStarting(Z)V
    .registers 10
    .param p1, "currentlyHealthy"    # Z
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "monitor"
    .end annotation

    .prologue
    .line 677
    iget-object v1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->watch:Lcom/google/common/base/Stopwatch;

    monitor-enter v1

    .line 678
    :try_start_3
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->watch:Lcom/google/common/base/Stopwatch;

    invoke-virtual {v0}, Lcom/google/common/base/Stopwatch;->stop()Lcom/google/common/base/Stopwatch;

    .line 679
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->service:Lcom/google/common/util/concurrent/Service;

    instance-of v0, v0, Lcom/google/common/util/concurrent/ServiceManager$NoOpService;

    if-nez v0, :cond_2c

    .line 680
    # getter for: Lcom/google/common/util/concurrent/ServiceManager;->logger:Ljava/util/logging/Logger;
    invoke-static {}, Lcom/google/common/util/concurrent/ServiceManager;->access$300()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v3, "Started {0} in {1} ms."

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->service:Lcom/google/common/util/concurrent/Service;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->startupTimeMillis()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v0, v2, v3, v4}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 683
    :cond_2c
    monitor-exit v1
    :try_end_2d
    .catchall {:try_start_3 .. :try_end_2d} :catchall_35

    .line 684
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    iget-object v1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->service:Lcom/google/common/util/concurrent/Service;

    # invokes: Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->serviceFinishedStarting(Lcom/google/common/util/concurrent/Service;Z)V
    invoke-static {v0, v1, p1}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->access$600(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;Lcom/google/common/util/concurrent/Service;Z)V

    .line 685
    return-void

    .line 683
    :catchall_35
    move-exception v0

    :try_start_36
    monitor-exit v1
    :try_end_37
    .catchall {:try_start_36 .. :try_end_37} :catchall_35

    throw v0
.end method

.method public running()V
    .registers 3

    .prologue
    .line 613
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    iget-object v0, v0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/Monitor;->enter()V

    .line 615
    const/4 v0, 0x1

    :try_start_8
    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->finishedStarting(Z)V
    :try_end_b
    .catchall {:try_start_8 .. :try_end_b} :catchall_18

    .line 617
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    iget-object v0, v0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 618
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    # invokes: Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->executeListeners()V
    invoke-static {v0}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->access$200(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;)V

    .line 620
    return-void

    .line 617
    :catchall_18
    move-exception v0

    iget-object v1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    iget-object v1, v1, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 618
    iget-object v1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    # invokes: Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->executeListeners()V
    invoke-static {v1}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->access$200(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;)V

    throw v0
.end method

.method start()V
    .registers 2

    .prologue
    .line 688
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->startTimer()V

    .line 689
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->service:Lcom/google/common/util/concurrent/Service;

    invoke-interface {v0}, Lcom/google/common/util/concurrent/Service;->startAsync()Lcom/google/common/util/concurrent/Service;

    .line 690
    return-void
.end method

.method startTimer()V
    .registers 6

    .prologue
    .line 694
    iget-object v1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->watch:Lcom/google/common/base/Stopwatch;

    monitor-enter v1

    .line 695
    :try_start_3
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->watch:Lcom/google/common/base/Stopwatch;

    invoke-virtual {v0}, Lcom/google/common/base/Stopwatch;->isRunning()Z

    move-result v0

    if-nez v0, :cond_23

    .line 696
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->watch:Lcom/google/common/base/Stopwatch;

    invoke-virtual {v0}, Lcom/google/common/base/Stopwatch;->start()Lcom/google/common/base/Stopwatch;

    .line 697
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->service:Lcom/google/common/util/concurrent/Service;

    instance-of v0, v0, Lcom/google/common/util/concurrent/ServiceManager$NoOpService;

    if-nez v0, :cond_23

    .line 698
    # getter for: Lcom/google/common/util/concurrent/ServiceManager;->logger:Ljava/util/logging/Logger;
    invoke-static {}, Lcom/google/common/util/concurrent/ServiceManager;->access$300()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v3, "Starting {0}."

    iget-object v4, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->service:Lcom/google/common/util/concurrent/Service;

    invoke-virtual {v0, v2, v3, v4}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 701
    :cond_23
    monitor-exit v1

    .line 702
    return-void

    .line 701
    :catchall_25
    move-exception v0

    monitor-exit v1
    :try_end_27
    .catchall {:try_start_3 .. :try_end_27} :catchall_25

    throw v0
.end method

.method public starting()V
    .registers 1

    .prologue
    .line 609
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->startTimer()V

    .line 610
    return-void
.end method

.method startupTimeMillis()J
    .registers 5

    .prologue
    .line 706
    iget-object v1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->watch:Lcom/google/common/base/Stopwatch;

    monitor-enter v1

    .line 707
    :try_start_3
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->watch:Lcom/google/common/base/Stopwatch;

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2}, Lcom/google/common/base/Stopwatch;->elapsed(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v2

    monitor-exit v1

    return-wide v2

    .line 708
    :catchall_d
    move-exception v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_d

    throw v0
.end method

.method public stopping(Lcom/google/common/util/concurrent/Service$State;)V
    .registers 4
    .param p1, "from"    # Lcom/google/common/util/concurrent/Service$State;

    .prologue
    .line 623
    sget-object v0, Lcom/google/common/util/concurrent/Service$State;->STARTING:Lcom/google/common/util/concurrent/Service$State;

    if-ne p1, v0, :cond_1b

    .line 624
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    iget-object v0, v0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/Monitor;->enter()V

    .line 626
    const/4 v0, 0x0

    :try_start_c
    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->finishedStarting(Z)V
    :try_end_f
    .catchall {:try_start_c .. :try_end_f} :catchall_1c

    .line 628
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    iget-object v0, v0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 629
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    # invokes: Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->executeListeners()V
    invoke-static {v0}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->access$200(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;)V

    .line 632
    :cond_1b
    return-void

    .line 628
    :catchall_1c
    move-exception v0

    iget-object v1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    iget-object v1, v1, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 629
    iget-object v1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    # invokes: Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->executeListeners()V
    invoke-static {v1}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->access$200(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;)V

    throw v0
.end method

.method public terminated(Lcom/google/common/util/concurrent/Service$State;)V
    .registers 8
    .param p1, "from"    # Lcom/google/common/util/concurrent/Service$State;

    .prologue
    const/4 v5, 0x0

    .line 635
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->service:Lcom/google/common/util/concurrent/Service;

    instance-of v0, v0, Lcom/google/common/util/concurrent/ServiceManager$NoOpService;

    if-nez v0, :cond_1c

    .line 636
    # getter for: Lcom/google/common/util/concurrent/ServiceManager;->logger:Ljava/util/logging/Logger;
    invoke-static {}, Lcom/google/common/util/concurrent/ServiceManager;->access$300()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v2, "Service {0} has terminated. Previous state was: {1}"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->service:Lcom/google/common/util/concurrent/Service;

    aput-object v4, v3, v5

    const/4 v4, 0x1

    aput-object p1, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 639
    :cond_1c
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    iget-object v0, v0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/Monitor;->enter()V

    .line 641
    :try_start_23
    sget-object v0, Lcom/google/common/util/concurrent/Service$State;->NEW:Lcom/google/common/util/concurrent/Service$State;

    if-ne p1, v0, :cond_2e

    .line 644
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->startTimer()V

    .line 645
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->finishedStarting(Z)V

    .line 647
    :cond_2e
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    iget-object v1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->service:Lcom/google/common/util/concurrent/Service;

    # invokes: Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->serviceTerminated(Lcom/google/common/util/concurrent/Service;)V
    invoke-static {v0, v1}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->access$400(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;Lcom/google/common/util/concurrent/Service;)V
    :try_end_35
    .catchall {:try_start_23 .. :try_end_35} :catchall_42

    .line 649
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    iget-object v0, v0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 650
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    # invokes: Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->executeListeners()V
    invoke-static {v0}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->access$200(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;)V

    .line 652
    return-void

    .line 649
    :catchall_42
    move-exception v0

    iget-object v1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    iget-object v1, v1, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 650
    iget-object v1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    # invokes: Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->executeListeners()V
    invoke-static {v1}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->access$200(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;)V

    throw v0
.end method
