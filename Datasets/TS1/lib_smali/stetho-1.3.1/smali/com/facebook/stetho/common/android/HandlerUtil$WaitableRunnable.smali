.class abstract Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;
.super Ljava/lang/Object;
.source "HandlerUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/common/android/HandlerUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "WaitableRunnable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# instance fields
.field private mException:Ljava/lang/Exception;

.field private mIsDone:Z

.field private mValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 103
    .local p0, "this":Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;, "Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable<TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    return-void
.end method

.method private join()V
    .registers 2

    .prologue
    .line 139
    .local p0, "this":Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;, "Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable<TV;>;"
    monitor-enter p0

    .line 140
    :goto_1
    :try_start_1
    iget-boolean v0, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mIsDone:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_d

    if-nez v0, :cond_b

    .line 142
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_8} :catch_9
    .catchall {:try_start_5 .. :try_end_8} :catchall_d

    goto :goto_1

    .line 143
    :catch_9
    move-exception v0

    goto :goto_1

    .line 146
    :cond_b
    :try_start_b
    monitor-exit p0

    .line 147
    return-void

    .line 146
    :catchall_d
    move-exception v0

    monitor-exit p0
    :try_end_f
    .catchall {:try_start_b .. :try_end_f} :catchall_d

    throw v0
.end method


# virtual methods
.method public invoke(Landroid/os/Handler;)Ljava/lang/Object;
    .registers 4
    .param p1, "handler"    # Landroid/os/Handler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Handler;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 125
    .local p0, "this":Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;, "Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable<TV;>;"
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 126
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Handler.post() returned false"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 129
    :cond_e
    invoke-direct {p0}, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->join()V

    .line 131
    iget-object v0, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mException:Ljava/lang/Exception;

    if-eqz v0, :cond_1d

    .line 132
    new-instance v0, Ljava/lang/RuntimeException;

    iget-object v1, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mException:Ljava/lang/Exception;

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 135
    :cond_1d
    iget-object v0, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mValue:Ljava/lang/Object;

    return-object v0
.end method

.method protected abstract onRun()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation
.end method

.method public final run()V
    .registers 4

    .prologue
    .line 109
    .local p0, "this":Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;, "Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable<TV;>;"
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->onRun()Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mValue:Ljava/lang/Object;

    .line 110
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mException:Ljava/lang/Exception;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_9} :catch_15
    .catchall {:try_start_0 .. :try_end_9} :catchall_27

    .line 115
    monitor-enter p0

    .line 116
    const/4 v1, 0x1

    :try_start_b
    iput-boolean v1, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mIsDone:Z

    .line 117
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 118
    monitor-exit p0

    .line 120
    :goto_11
    return-void

    .line 118
    :catchall_12
    move-exception v1

    monitor-exit p0
    :try_end_14
    .catchall {:try_start_b .. :try_end_14} :catchall_12

    throw v1

    .line 111
    :catch_15
    move-exception v0

    .line 112
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    :try_start_17
    iput-object v1, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mValue:Ljava/lang/Object;

    .line 113
    iput-object v0, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mException:Ljava/lang/Exception;
    :try_end_1b
    .catchall {:try_start_17 .. :try_end_1b} :catchall_27

    .line 115
    monitor-enter p0

    .line 116
    const/4 v1, 0x1

    :try_start_1d
    iput-boolean v1, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mIsDone:Z

    .line 117
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 118
    monitor-exit p0

    goto :goto_11

    :catchall_24
    move-exception v1

    monitor-exit p0
    :try_end_26
    .catchall {:try_start_1d .. :try_end_26} :catchall_24

    throw v1

    .line 115
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_27
    move-exception v1

    monitor-enter p0

    .line 116
    const/4 v2, 0x1

    :try_start_2a
    iput-boolean v2, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mIsDone:Z

    .line 117
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 118
    monitor-exit p0
    :try_end_30
    .catchall {:try_start_2a .. :try_end_30} :catchall_31

    throw v1

    :catchall_31
    move-exception v1

    :try_start_32
    monitor-exit p0
    :try_end_33
    .catchall {:try_start_32 .. :try_end_33} :catchall_31

    throw v1
.end method
