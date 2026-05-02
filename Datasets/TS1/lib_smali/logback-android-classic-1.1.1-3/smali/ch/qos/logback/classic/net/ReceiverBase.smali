.class public abstract Lch/qos/logback/classic/net/ReceiverBase;
.super Lch/qos/logback/core/spi/ContextAwareBase;

# interfaces
.implements Lch/qos/logback/core/spi/LifeCycle;


# instance fields
.field private started:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/spi/ContextAwareBase;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract getRunnableTask()Ljava/lang/Runnable;
.end method

.method public final isStarted()Z
    .registers 2

    iget-boolean v0, p0, Lch/qos/logback/classic/net/ReceiverBase;->started:Z

    return v0
.end method

.method protected abstract onStop()V
.end method

.method protected abstract shouldStart()Z
.end method

.method public final start()V
    .registers 3

    invoke-virtual {p0}, Lch/qos/logback/classic/net/ReceiverBase;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_7

    :cond_6
    :goto_6
    return-void

    :cond_7
    invoke-virtual {p0}, Lch/qos/logback/classic/net/ReceiverBase;->getContext()Lch/qos/logback/core/Context;

    move-result-object v0

    if-nez v0, :cond_15

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "context not set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_15
    invoke-virtual {p0}, Lch/qos/logback/classic/net/ReceiverBase;->shouldStart()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lch/qos/logback/classic/net/ReceiverBase;->getContext()Lch/qos/logback/core/Context;

    move-result-object v0

    invoke-interface {v0}, Lch/qos/logback/core/Context;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-virtual {p0}, Lch/qos/logback/classic/net/ReceiverBase;->getRunnableTask()Ljava/lang/Runnable;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/classic/net/ReceiverBase;->started:Z

    goto :goto_6
.end method

.method public final stop()V
    .registers 4

    invoke-virtual {p0}, Lch/qos/logback/classic/net/ReceiverBase;->isStarted()Z

    move-result v0

    if-nez v0, :cond_7

    :goto_6
    return-void

    :cond_7
    :try_start_7
    invoke-virtual {p0}, Lch/qos/logback/classic/net/ReceiverBase;->onStop()V
    :try_end_a
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_a} :catch_e

    :goto_a
    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/classic/net/ReceiverBase;->started:Z

    goto :goto_6

    :catch_e
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "on stop: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/classic/net/ReceiverBase;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_a
.end method
