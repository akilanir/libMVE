.class final Lorg/junit/runner/notification/SynchronizedRunListener;
.super Lorg/junit/runner/notification/RunListener;
.source "SynchronizedRunListener.java"


# annotations
.annotation runtime Lorg/junit/runner/notification/RunListener$ThreadSafe;
.end annotation


# instance fields
.field private final listener:Lorg/junit/runner/notification/RunListener;

.field private final monitor:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lorg/junit/runner/notification/RunListener;Ljava/lang/Object;)V
    .registers 3
    .param p1, "listener"    # Lorg/junit/runner/notification/RunListener;
    .param p2, "monitor"    # Ljava/lang/Object;

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/junit/runner/notification/RunListener;-><init>()V

    .line 28
    iput-object p1, p0, Lorg/junit/runner/notification/SynchronizedRunListener;->listener:Lorg/junit/runner/notification/RunListener;

    .line 29
    iput-object p2, p0, Lorg/junit/runner/notification/SynchronizedRunListener;->monitor:Ljava/lang/Object;

    .line 30
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 88
    if-ne p0, p1, :cond_4

    .line 89
    const/4 v1, 0x1

    .line 96
    :goto_3
    return v1

    .line 91
    :cond_4
    instance-of v1, p1, Lorg/junit/runner/notification/SynchronizedRunListener;

    if-nez v1, :cond_a

    .line 92
    const/4 v1, 0x0

    goto :goto_3

    :cond_a
    move-object v0, p1

    .line 94
    check-cast v0, Lorg/junit/runner/notification/SynchronizedRunListener;

    .line 96
    .local v0, "that":Lorg/junit/runner/notification/SynchronizedRunListener;
    iget-object v1, p0, Lorg/junit/runner/notification/SynchronizedRunListener;->listener:Lorg/junit/runner/notification/RunListener;

    iget-object v2, v0, Lorg/junit/runner/notification/SynchronizedRunListener;->listener:Lorg/junit/runner/notification/RunListener;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_3
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lorg/junit/runner/notification/SynchronizedRunListener;->listener:Lorg/junit/runner/notification/RunListener;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public testAssumptionFailure(Lorg/junit/runner/notification/Failure;)V
    .registers 4
    .param p1, "failure"    # Lorg/junit/runner/notification/Failure;

    .prologue
    .line 69
    iget-object v1, p0, Lorg/junit/runner/notification/SynchronizedRunListener;->monitor:Ljava/lang/Object;

    monitor-enter v1

    .line 70
    :try_start_3
    iget-object v0, p0, Lorg/junit/runner/notification/SynchronizedRunListener;->listener:Lorg/junit/runner/notification/RunListener;

    invoke-virtual {v0, p1}, Lorg/junit/runner/notification/RunListener;->testAssumptionFailure(Lorg/junit/runner/notification/Failure;)V

    .line 71
    monitor-exit v1

    .line 72
    return-void

    .line 71
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public testFailure(Lorg/junit/runner/notification/Failure;)V
    .registers 4
    .param p1, "failure"    # Lorg/junit/runner/notification/Failure;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 62
    iget-object v1, p0, Lorg/junit/runner/notification/SynchronizedRunListener;->monitor:Ljava/lang/Object;

    monitor-enter v1

    .line 63
    :try_start_3
    iget-object v0, p0, Lorg/junit/runner/notification/SynchronizedRunListener;->listener:Lorg/junit/runner/notification/RunListener;

    invoke-virtual {v0, p1}, Lorg/junit/runner/notification/RunListener;->testFailure(Lorg/junit/runner/notification/Failure;)V

    .line 64
    monitor-exit v1

    .line 65
    return-void

    .line 64
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public testFinished(Lorg/junit/runner/Description;)V
    .registers 4
    .param p1, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 55
    iget-object v1, p0, Lorg/junit/runner/notification/SynchronizedRunListener;->monitor:Ljava/lang/Object;

    monitor-enter v1

    .line 56
    :try_start_3
    iget-object v0, p0, Lorg/junit/runner/notification/SynchronizedRunListener;->listener:Lorg/junit/runner/notification/RunListener;

    invoke-virtual {v0, p1}, Lorg/junit/runner/notification/RunListener;->testFinished(Lorg/junit/runner/Description;)V

    .line 57
    monitor-exit v1

    .line 58
    return-void

    .line 57
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public testIgnored(Lorg/junit/runner/Description;)V
    .registers 4
    .param p1, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 76
    iget-object v1, p0, Lorg/junit/runner/notification/SynchronizedRunListener;->monitor:Ljava/lang/Object;

    monitor-enter v1

    .line 77
    :try_start_3
    iget-object v0, p0, Lorg/junit/runner/notification/SynchronizedRunListener;->listener:Lorg/junit/runner/notification/RunListener;

    invoke-virtual {v0, p1}, Lorg/junit/runner/notification/RunListener;->testIgnored(Lorg/junit/runner/Description;)V

    .line 78
    monitor-exit v1

    .line 79
    return-void

    .line 78
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public testRunFinished(Lorg/junit/runner/Result;)V
    .registers 4
    .param p1, "result"    # Lorg/junit/runner/Result;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 41
    iget-object v1, p0, Lorg/junit/runner/notification/SynchronizedRunListener;->monitor:Ljava/lang/Object;

    monitor-enter v1

    .line 42
    :try_start_3
    iget-object v0, p0, Lorg/junit/runner/notification/SynchronizedRunListener;->listener:Lorg/junit/runner/notification/RunListener;

    invoke-virtual {v0, p1}, Lorg/junit/runner/notification/RunListener;->testRunFinished(Lorg/junit/runner/Result;)V

    .line 43
    monitor-exit v1

    .line 44
    return-void

    .line 43
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public testRunStarted(Lorg/junit/runner/Description;)V
    .registers 4
    .param p1, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 34
    iget-object v1, p0, Lorg/junit/runner/notification/SynchronizedRunListener;->monitor:Ljava/lang/Object;

    monitor-enter v1

    .line 35
    :try_start_3
    iget-object v0, p0, Lorg/junit/runner/notification/SynchronizedRunListener;->listener:Lorg/junit/runner/notification/RunListener;

    invoke-virtual {v0, p1}, Lorg/junit/runner/notification/RunListener;->testRunStarted(Lorg/junit/runner/Description;)V

    .line 36
    monitor-exit v1

    .line 37
    return-void

    .line 36
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public testStarted(Lorg/junit/runner/Description;)V
    .registers 4
    .param p1, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 48
    iget-object v1, p0, Lorg/junit/runner/notification/SynchronizedRunListener;->monitor:Ljava/lang/Object;

    monitor-enter v1

    .line 49
    :try_start_3
    iget-object v0, p0, Lorg/junit/runner/notification/SynchronizedRunListener;->listener:Lorg/junit/runner/notification/RunListener;

    invoke-virtual {v0, p1}, Lorg/junit/runner/notification/RunListener;->testStarted(Lorg/junit/runner/Description;)V

    .line 50
    monitor-exit v1

    .line 51
    return-void

    .line 50
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/junit/runner/notification/SynchronizedRunListener;->listener:Lorg/junit/runner/notification/RunListener;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " (with synchronization wrapper)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
