.class public final Lcom/facebook/stetho/common/android/HandlerUtil;
.super Ljava/lang/Object;
.source "HandlerUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    return-void
.end method

.method public static checkThreadAccess(Landroid/os/Handler;)Z
    .registers 3
    .param p0, "handler"    # Landroid/os/Handler;

    .prologue
    .line 28
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {p0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public static postAndWait(Landroid/os/Handler;Lcom/facebook/stetho/common/UncheckedCallable;)Ljava/lang/Object;
    .registers 5
    .param p0, "handler"    # Landroid/os/Handler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/os/Handler;",
            "Lcom/facebook/stetho/common/UncheckedCallable",
            "<TV;>;)TV;"
        }
    .end annotation

    .prologue
    .line 52
    .local p1, "c":Lcom/facebook/stetho/common/UncheckedCallable;, "Lcom/facebook/stetho/common/UncheckedCallable<TV;>;"
    invoke-static {p0}, Lcom/facebook/stetho/common/android/HandlerUtil;->checkThreadAccess(Landroid/os/Handler;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 54
    :try_start_6
    invoke-interface {p1}, Lcom/facebook/stetho/common/UncheckedCallable;->call()Ljava/lang/Object;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_9} :catch_b

    move-result-object v2

    .line 67
    :goto_a
    return-object v2

    .line 55
    :catch_b
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 60
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_12
    new-instance v1, Lcom/facebook/stetho/common/android/HandlerUtil$1;

    invoke-direct {v1, p1}, Lcom/facebook/stetho/common/android/HandlerUtil$1;-><init>(Lcom/facebook/stetho/common/UncheckedCallable;)V

    .line 67
    .local v1, "wrapper":Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;, "Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable<TV;>;"
    invoke-virtual {v1, p0}, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->invoke(Landroid/os/Handler;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_a
.end method

.method public static postAndWait(Landroid/os/Handler;Ljava/lang/Runnable;)V
    .registers 5
    .param p0, "handler"    # Landroid/os/Handler;
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 78
    invoke-static {p0}, Lcom/facebook/stetho/common/android/HandlerUtil;->checkThreadAccess(Landroid/os/Handler;)Z

    move-result v2

    if-eqz v2, :cond_11

    .line 80
    :try_start_6
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V
    :try_end_9
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_9} :catch_a

    .line 96
    :goto_9
    return-void

    .line 82
    :catch_a
    move-exception v0

    .line 83
    .local v0, "e":Ljava/lang/RuntimeException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 87
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :cond_11
    new-instance v1, Lcom/facebook/stetho/common/android/HandlerUtil$2;

    invoke-direct {v1, p1}, Lcom/facebook/stetho/common/android/HandlerUtil$2;-><init>(Ljava/lang/Runnable;)V

    .line 95
    .local v1, "wrapper":Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;, "Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable<Ljava/lang/Void;>;"
    invoke-virtual {v1, p0}, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->invoke(Landroid/os/Handler;)Ljava/lang/Object;

    goto :goto_9
.end method

.method public static verifyThreadAccess(Landroid/os/Handler;)V
    .registers 2
    .param p0, "handler"    # Landroid/os/Handler;

    .prologue
    .line 38
    invoke-static {p0}, Lcom/facebook/stetho/common/android/HandlerUtil;->checkThreadAccess(Landroid/os/Handler;)Z

    move-result v0

    invoke-static {v0}, Lcom/facebook/stetho/common/Util;->throwIfNot(Z)V

    .line 39
    return-void
.end method
