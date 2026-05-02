.class Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;
.super Lcom/google/common/util/concurrent/AbstractFuture;
.source "Futures.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/Futures;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ChainingListenableFuture"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<I:",
        "Ljava/lang/Object;",
        "O:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/util/concurrent/AbstractFuture",
        "<TO;>;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# instance fields
.field private function:Lcom/google/common/util/concurrent/AsyncFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/AsyncFunction",
            "<-TI;+TO;>;"
        }
    .end annotation
.end field

.field private inputFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture",
            "<+TI;>;"
        }
    .end annotation
.end field

.field private final outputCreated:Ljava/util/concurrent/CountDownLatch;

.field private volatile outputFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture",
            "<+TO;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/google/common/util/concurrent/AsyncFunction;Lcom/google/common/util/concurrent/ListenableFuture;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/AsyncFunction",
            "<-TI;+TO;>;",
            "Lcom/google/common/util/concurrent/ListenableFuture",
            "<+TI;>;)V"
        }
    .end annotation

    .prologue
    .line 803
    .local p0, "this":Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;, "Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture<TI;TO;>;"
    .local p1, "function":Lcom/google/common/util/concurrent/AsyncFunction;, "Lcom/google/common/util/concurrent/AsyncFunction<-TI;+TO;>;"
    .local p2, "inputFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TI;>;"
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractFuture;-><init>()V

    .line 799
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->outputCreated:Ljava/util/concurrent/CountDownLatch;

    .line 804
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/util/concurrent/AsyncFunction;

    iput-object v0, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->function:Lcom/google/common/util/concurrent/AsyncFunction;

    .line 805
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/util/concurrent/ListenableFuture;

    iput-object v0, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->inputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 806
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/util/concurrent/AsyncFunction;Lcom/google/common/util/concurrent/ListenableFuture;Lcom/google/common/util/concurrent/Futures$1;)V
    .registers 4
    .param p1, "x0"    # Lcom/google/common/util/concurrent/AsyncFunction;
    .param p2, "x1"    # Lcom/google/common/util/concurrent/ListenableFuture;
    .param p3, "x2"    # Lcom/google/common/util/concurrent/Futures$1;

    .prologue
    .line 793
    .local p0, "this":Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;, "Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture<TI;TO;>;"
    invoke-direct {p0, p1, p2}, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;-><init>(Lcom/google/common/util/concurrent/AsyncFunction;Lcom/google/common/util/concurrent/ListenableFuture;)V

    return-void
.end method

.method static synthetic access$302(Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 2
    .param p0, "x0"    # Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;
    .param p1, "x1"    # Lcom/google/common/util/concurrent/ListenableFuture;

    .prologue
    .line 793
    iput-object p1, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->outputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    return-object p1
.end method

.method private cancel(Ljava/util/concurrent/Future;Z)V
    .registers 3
    .param p1    # Ljava/util/concurrent/Future;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "mayInterruptIfRunning"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future",
            "<*>;Z)V"
        }
    .end annotation

    .prologue
    .line 826
    .local p0, "this":Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;, "Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture<TI;TO;>;"
    .local p1, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    if-eqz p1, :cond_5

    .line 827
    invoke-interface {p1, p2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 829
    :cond_5
    return-void
.end method


# virtual methods
.method public cancel(Z)Z
    .registers 3
    .param p1, "mayInterruptIfRunning"    # Z

    .prologue
    .line 814
    .local p0, "this":Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;, "Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture<TI;TO;>;"
    invoke-super {p0, p1}, Lcom/google/common/util/concurrent/AbstractFuture;->cancel(Z)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 817
    iget-object v0, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->inputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-direct {p0, v0, p1}, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->cancel(Ljava/util/concurrent/Future;Z)V

    .line 818
    iget-object v0, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->outputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-direct {p0, v0, p1}, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->cancel(Ljava/util/concurrent/Future;Z)V

    .line 819
    const/4 v0, 0x1

    .line 821
    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public run()V
    .registers 8

    .prologue
    .local p0, "this":Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;, "Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture<TI;TO;>;"
    const/4 v6, 0x0

    .line 836
    :try_start_1
    iget-object v4, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->inputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-static {v4}, Lcom/google/common/util/concurrent/Uninterruptibles;->getUninterruptibly(Ljava/util/concurrent/Future;)Ljava/lang/Object;
    :try_end_6
    .catch Ljava/util/concurrent/CancellationException; {:try_start_1 .. :try_end_6} :catch_29
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_6} :catch_38
    .catch Ljava/lang/reflect/UndeclaredThrowableException; {:try_start_1 .. :try_end_6} :catch_60
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_6} :catch_72
    .catchall {:try_start_1 .. :try_end_6} :catchall_80

    move-result-object v2

    .line 849
    .local v2, "sourceResult":Ljava/lang/Object;, "TI;"
    :try_start_7
    iget-object v4, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->function:Lcom/google/common/util/concurrent/AsyncFunction;

    invoke-interface {v4, v2}, Lcom/google/common/util/concurrent/AsyncFunction;->apply(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    iput-object v1, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->outputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 851
    .local v1, "outputFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TO;>;"
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->isCancelled()Z

    move-result v4

    if-eqz v4, :cond_4a

    .line 852
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->wasInterrupted()Z

    move-result v4

    invoke-interface {v1, v4}, Lcom/google/common/util/concurrent/ListenableFuture;->cancel(Z)Z

    .line 853
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->outputFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    :try_end_1f
    .catch Ljava/lang/reflect/UndeclaredThrowableException; {:try_start_7 .. :try_end_1f} :catch_60
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_1f} :catch_72
    .catchall {:try_start_7 .. :try_end_1f} :catchall_80

    .line 885
    iput-object v6, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->function:Lcom/google/common/util/concurrent/AsyncFunction;

    .line 886
    iput-object v6, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->inputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 888
    iget-object v4, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->outputCreated:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v4}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 890
    .end local v1    # "outputFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TO;>;"
    .end local v2    # "sourceResult":Ljava/lang/Object;, "TI;"
    :goto_28
    return-void

    .line 837
    :catch_29
    move-exception v0

    .line 841
    .local v0, "e":Ljava/util/concurrent/CancellationException;
    const/4 v4, 0x0

    :try_start_2b
    invoke-virtual {p0, v4}, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->cancel(Z)Z
    :try_end_2e
    .catch Ljava/lang/reflect/UndeclaredThrowableException; {:try_start_2b .. :try_end_2e} :catch_60
    .catch Ljava/lang/Throwable; {:try_start_2b .. :try_end_2e} :catch_72
    .catchall {:try_start_2b .. :try_end_2e} :catchall_80

    .line 885
    iput-object v6, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->function:Lcom/google/common/util/concurrent/AsyncFunction;

    .line 886
    iput-object v6, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->inputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 888
    iget-object v4, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->outputCreated:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v4}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    goto :goto_28

    .line 843
    .end local v0    # "e":Ljava/util/concurrent/CancellationException;
    :catch_38
    move-exception v0

    .line 845
    .local v0, "e":Ljava/util/concurrent/ExecutionException;
    :try_start_39
    invoke-virtual {v0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->setException(Ljava/lang/Throwable;)Z
    :try_end_40
    .catch Ljava/lang/reflect/UndeclaredThrowableException; {:try_start_39 .. :try_end_40} :catch_60
    .catch Ljava/lang/Throwable; {:try_start_39 .. :try_end_40} :catch_72
    .catchall {:try_start_39 .. :try_end_40} :catchall_80

    .line 885
    iput-object v6, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->function:Lcom/google/common/util/concurrent/AsyncFunction;

    .line 886
    iput-object v6, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->inputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 888
    iget-object v4, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->outputCreated:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v4}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    goto :goto_28

    .line 856
    .end local v0    # "e":Ljava/util/concurrent/ExecutionException;
    .restart local v1    # "outputFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TO;>;"
    .restart local v2    # "sourceResult":Ljava/lang/Object;, "TI;"
    :cond_4a
    :try_start_4a
    new-instance v4, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture$1;

    invoke-direct {v4, p0, v1}, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture$1;-><init>(Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;Lcom/google/common/util/concurrent/ListenableFuture;)V

    invoke-static {}, Lcom/google/common/util/concurrent/MoreExecutors;->sameThreadExecutor()Lcom/google/common/util/concurrent/ListeningExecutorService;

    move-result-object v5

    invoke-interface {v1, v4, v5}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V
    :try_end_56
    .catch Ljava/lang/reflect/UndeclaredThrowableException; {:try_start_4a .. :try_end_56} :catch_60
    .catch Ljava/lang/Throwable; {:try_start_4a .. :try_end_56} :catch_72
    .catchall {:try_start_4a .. :try_end_56} :catchall_80

    .line 885
    iput-object v6, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->function:Lcom/google/common/util/concurrent/AsyncFunction;

    .line 886
    iput-object v6, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->inputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 888
    iget-object v4, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->outputCreated:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v4}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    goto :goto_28

    .line 876
    .end local v1    # "outputFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TO;>;"
    .end local v2    # "sourceResult":Ljava/lang/Object;, "TI;"
    :catch_60
    move-exception v0

    .line 878
    .local v0, "e":Ljava/lang/reflect/UndeclaredThrowableException;
    :try_start_61
    invoke-virtual {v0}, Ljava/lang/reflect/UndeclaredThrowableException;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->setException(Ljava/lang/Throwable;)Z
    :try_end_68
    .catchall {:try_start_61 .. :try_end_68} :catchall_80

    .line 885
    iput-object v6, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->function:Lcom/google/common/util/concurrent/AsyncFunction;

    .line 886
    iput-object v6, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->inputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 888
    iget-object v4, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->outputCreated:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v4}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    goto :goto_28

    .line 879
    .end local v0    # "e":Ljava/lang/reflect/UndeclaredThrowableException;
    :catch_72
    move-exception v3

    .line 882
    .local v3, "t":Ljava/lang/Throwable;
    :try_start_73
    invoke-virtual {p0, v3}, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->setException(Ljava/lang/Throwable;)Z
    :try_end_76
    .catchall {:try_start_73 .. :try_end_76} :catchall_80

    .line 885
    iput-object v6, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->function:Lcom/google/common/util/concurrent/AsyncFunction;

    .line 886
    iput-object v6, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->inputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 888
    iget-object v4, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->outputCreated:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v4}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    goto :goto_28

    .line 885
    .end local v3    # "t":Ljava/lang/Throwable;
    :catchall_80
    move-exception v4

    iput-object v6, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->function:Lcom/google/common/util/concurrent/AsyncFunction;

    .line 886
    iput-object v6, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->inputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 888
    iget-object v5, p0, Lcom/google/common/util/concurrent/Futures$ChainingListenableFuture;->outputCreated:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v5}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    throw v4
.end method
