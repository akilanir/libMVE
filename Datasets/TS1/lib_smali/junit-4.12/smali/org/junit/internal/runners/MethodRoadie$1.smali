.class Lorg/junit/internal/runners/MethodRoadie$1;
.super Ljava/lang/Object;
.source "MethodRoadie.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/internal/runners/MethodRoadie;->runWithTimeout(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/junit/internal/runners/MethodRoadie;

.field final synthetic val$timeout:J


# direct methods
.method constructor <init>(Lorg/junit/internal/runners/MethodRoadie;J)V
    .registers 4

    .prologue
    .line 60
    iput-object p1, p0, Lorg/junit/internal/runners/MethodRoadie$1;->this$0:Lorg/junit/internal/runners/MethodRoadie;

    iput-wide p2, p0, Lorg/junit/internal/runners/MethodRoadie$1;->val$timeout:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 11

    .prologue
    .line 61
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v3

    .line 62
    .local v3, "service":Ljava/util/concurrent/ExecutorService;
    new-instance v0, Lorg/junit/internal/runners/MethodRoadie$1$1;

    invoke-direct {v0, p0}, Lorg/junit/internal/runners/MethodRoadie$1$1;-><init>(Lorg/junit/internal/runners/MethodRoadie$1;)V

    .line 68
    .local v0, "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Ljava/lang/Object;>;"
    invoke-interface {v3, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v2

    .line 69
    .local v2, "result":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Ljava/lang/Object;>;"
    invoke-interface {v3}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 71
    :try_start_10
    iget-wide v5, p0, Lorg/junit/internal/runners/MethodRoadie$1;->val$timeout:J

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v3, v5, v6, v7}, Ljava/util/concurrent/ExecutorService;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z

    move-result v4

    .line 73
    .local v4, "terminated":Z
    if-nez v4, :cond_1d

    .line 74
    invoke-interface {v3}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 76
    :cond_1d
    const-wide/16 v5, 0x0

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v2, v5, v6, v7}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    :try_end_24
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_10 .. :try_end_24} :catch_25
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_24} :catch_35

    .line 82
    .end local v4    # "terminated":Z
    :goto_24
    return-void

    .line 77
    :catch_25
    move-exception v1

    .line 78
    .local v1, "e":Ljava/util/concurrent/TimeoutException;
    iget-object v5, p0, Lorg/junit/internal/runners/MethodRoadie$1;->this$0:Lorg/junit/internal/runners/MethodRoadie;

    new-instance v6, Lorg/junit/runners/model/TestTimedOutException;

    iget-wide v7, p0, Lorg/junit/internal/runners/MethodRoadie$1;->val$timeout:J

    sget-object v9, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-direct {v6, v7, v8, v9}, Lorg/junit/runners/model/TestTimedOutException;-><init>(JLjava/util/concurrent/TimeUnit;)V

    invoke-virtual {v5, v6}, Lorg/junit/internal/runners/MethodRoadie;->addFailure(Ljava/lang/Throwable;)V

    goto :goto_24

    .line 79
    .end local v1    # "e":Ljava/util/concurrent/TimeoutException;
    :catch_35
    move-exception v1

    .line 80
    .local v1, "e":Ljava/lang/Exception;
    iget-object v5, p0, Lorg/junit/internal/runners/MethodRoadie$1;->this$0:Lorg/junit/internal/runners/MethodRoadie;

    invoke-virtual {v5, v1}, Lorg/junit/internal/runners/MethodRoadie;->addFailure(Ljava/lang/Throwable;)V

    goto :goto_24
.end method
