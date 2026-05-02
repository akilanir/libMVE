.class Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;
.super Ljava/io/FilterOutputStream;
.source "GunzippingOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/network/GunzippingOutputStream$GunzippingCallable;
    }
.end annotation


# static fields
.field private static final sExecutor:Ljava/util/concurrent/ExecutorService;


# instance fields
.field private final mCopyFuture:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 37
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;->sExecutor:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private constructor <init>(Ljava/io/OutputStream;Ljava/util/concurrent/Future;)V
    .registers 3
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/OutputStream;",
            "Ljava/util/concurrent/Future",
            "<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    .local p2, "copyFuture":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Ljava/lang/Void;>;"
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 51
    iput-object p2, p0, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;->mCopyFuture:Ljava/util/concurrent/Future;

    .line 52
    return-void
.end method

.method public static create(Ljava/io/OutputStream;)Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;
    .registers 6
    .param p0, "finalOut"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    new-instance v1, Ljava/io/PipedInputStream;

    invoke-direct {v1}, Ljava/io/PipedInputStream;-><init>()V

    .line 41
    .local v1, "pipeIn":Ljava/io/PipedInputStream;
    new-instance v2, Ljava/io/PipedOutputStream;

    invoke-direct {v2, v1}, Ljava/io/PipedOutputStream;-><init>(Ljava/io/PipedInputStream;)V

    .line 43
    .local v2, "pipeOut":Ljava/io/PipedOutputStream;
    sget-object v3, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;->sExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v4, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream$GunzippingCallable;

    invoke-direct {v4, v1, p0}, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream$GunzippingCallable;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    invoke-interface {v3, v4}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v0

    .line 46
    .local v0, "copyFuture":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Ljava/lang/Void;>;"
    new-instance v3, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;

    invoke-direct {v3, v2, v0}, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;-><init>(Ljava/io/OutputStream;Ljava/util/concurrent/Future;)V

    return-object v3
.end method

.method private static getAndRethrow(Ljava/util/concurrent/Future;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Future",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<TT;>;"
    :goto_0
    :try_start_0
    invoke-interface {p0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_3} :catch_13
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v2

    return-object v2

    .line 77
    :catch_5
    move-exception v1

    .line 78
    .local v1, "e":Ljava/util/concurrent/ExecutionException;
    invoke-virtual {v1}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 79
    .local v0, "cause":Ljava/lang/Throwable;
    const-class v2, Ljava/io/IOException;

    invoke-static {v0, v2}, Lcom/facebook/stetho/common/ExceptionUtil;->propagateIfInstanceOf(Ljava/lang/Throwable;Ljava/lang/Class;)V

    .line 80
    invoke-static {v0}, Lcom/facebook/stetho/common/ExceptionUtil;->propagate(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    goto :goto_0

    .line 75
    .end local v0    # "cause":Ljava/lang/Throwable;
    .end local v1    # "e":Ljava/util/concurrent/ExecutionException;
    :catch_13
    move-exception v2

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    const/4 v1, 0x0

    .line 58
    .local v1, "success":Z
    :try_start_1
    invoke-super {p0}, Ljava/io/FilterOutputStream;->close()V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_f

    .line 59
    const/4 v1, 0x1

    .line 62
    :try_start_5
    iget-object v2, p0, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;->mCopyFuture:Ljava/util/concurrent/Future;

    invoke-static {v2}, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;->getAndRethrow(Ljava/util/concurrent/Future;)Ljava/lang/Object;
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_a} :catch_b

    .line 69
    :cond_a
    return-void

    .line 63
    :catch_b
    move-exception v0

    .line 64
    .local v0, "e":Ljava/io/IOException;
    if-eqz v1, :cond_a

    .line 65
    throw v0

    .line 61
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_f
    move-exception v2

    .line 62
    :try_start_10
    iget-object v3, p0, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;->mCopyFuture:Ljava/util/concurrent/Future;

    invoke-static {v3}, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;->getAndRethrow(Ljava/util/concurrent/Future;)Ljava/lang/Object;
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_15} :catch_16

    .line 67
    :cond_15
    throw v2

    .line 63
    :catch_16
    move-exception v0

    .line 64
    .restart local v0    # "e":Ljava/io/IOException;
    if-eqz v1, :cond_15

    .line 65
    throw v0
.end method
