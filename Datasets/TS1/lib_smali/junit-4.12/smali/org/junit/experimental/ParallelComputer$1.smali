.class Lorg/junit/experimental/ParallelComputer$1;
.super Ljava/lang/Object;
.source "ParallelComputer.java"

# interfaces
.implements Lorg/junit/runners/model/RunnerScheduler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/experimental/ParallelComputer;->parallelize(Lorg/junit/runner/Runner;)Lorg/junit/runner/Runner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field private final fService:Ljava/util/concurrent/ExecutorService;


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/experimental/ParallelComputer$1;->fService:Ljava/util/concurrent/ExecutorService;

    return-void
.end method


# virtual methods
.method public finished()V
    .registers 6

    .prologue
    .line 43
    :try_start_0
    iget-object v1, p0, Lorg/junit/experimental/ParallelComputer$1;->fService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 44
    iget-object v1, p0, Lorg/junit/experimental/ParallelComputer$1;->fService:Ljava/util/concurrent/ExecutorService;

    const-wide v2, 0x7fffffffffffffffL

    sget-object v4, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v2, v3, v4}, Ljava/util/concurrent/ExecutorService;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_11
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_11} :catch_12

    .line 48
    :goto_11
    return-void

    .line 45
    :catch_12
    move-exception v0

    .line 46
    .local v0, "e":Ljava/lang/InterruptedException;
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, v1}, Ljava/lang/InterruptedException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_11
.end method

.method public schedule(Ljava/lang/Runnable;)V
    .registers 3
    .param p1, "childStatement"    # Ljava/lang/Runnable;

    .prologue
    .line 38
    iget-object v0, p0, Lorg/junit/experimental/ParallelComputer$1;->fService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 39
    return-void
.end method
