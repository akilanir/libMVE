.class Lcom/squareup/picasso/PicassoExecutorService;
.super Ljava/util/concurrent/ThreadPoolExecutor;
.source "PicassoExecutorService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/picasso/PicassoExecutorService$PicassoFutureTask;
    }
.end annotation


# static fields
.field private static final DEFAULT_THREAD_COUNT:I = 0x3


# direct methods
.method constructor <init>()V
    .registers 9

    .prologue
    const/4 v1, 0x3

    .line 38
    const-wide/16 v3, 0x0

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/PriorityBlockingQueue;

    invoke-direct {v6}, Ljava/util/concurrent/PriorityBlockingQueue;-><init>()V

    new-instance v7, Lcom/squareup/picasso/Utils$PicassoThreadFactory;

    invoke-direct {v7}, Lcom/squareup/picasso/Utils$PicassoThreadFactory;-><init>()V

    move-object v0, p0

    move v2, v1

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 40
    return-void
.end method

.method private setThreadCount(I)V
    .registers 2
    .param p1, "threadCount"    # I

    .prologue
    .line 81
    invoke-virtual {p0, p1}, Lcom/squareup/picasso/PicassoExecutorService;->setCorePoolSize(I)V

    .line 82
    invoke-virtual {p0, p1}, Lcom/squareup/picasso/PicassoExecutorService;->setMaximumPoolSize(I)V

    .line 83
    return-void
.end method


# virtual methods
.method adjustThreadCount(Landroid/net/NetworkInfo;)V
    .registers 4
    .param p1, "info"    # Landroid/net/NetworkInfo;

    .prologue
    const/4 v1, 0x3

    .line 43
    if-eqz p1, :cond_9

    invoke-virtual {p1}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result v0

    if-nez v0, :cond_d

    .line 44
    :cond_9
    invoke-direct {p0, v1}, Lcom/squareup/picasso/PicassoExecutorService;->setThreadCount(I)V

    .line 78
    :goto_c
    return-void

    .line 47
    :cond_d
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getType()I

    move-result v0

    sparse-switch v0, :sswitch_data_36

    .line 76
    invoke-direct {p0, v1}, Lcom/squareup/picasso/PicassoExecutorService;->setThreadCount(I)V

    goto :goto_c

    .line 51
    :sswitch_18
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/squareup/picasso/PicassoExecutorService;->setThreadCount(I)V

    goto :goto_c

    .line 54
    :sswitch_1d
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v0

    packed-switch v0, :pswitch_data_48

    .line 72
    :pswitch_24
    invoke-direct {p0, v1}, Lcom/squareup/picasso/PicassoExecutorService;->setThreadCount(I)V

    goto :goto_c

    .line 58
    :pswitch_28
    invoke-direct {p0, v1}, Lcom/squareup/picasso/PicassoExecutorService;->setThreadCount(I)V

    goto :goto_c

    .line 65
    :pswitch_2c
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/squareup/picasso/PicassoExecutorService;->setThreadCount(I)V

    goto :goto_c

    .line 69
    :pswitch_31
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/squareup/picasso/PicassoExecutorService;->setThreadCount(I)V

    goto :goto_c

    .line 47
    :sswitch_data_36
    .sparse-switch
        0x0 -> :sswitch_1d
        0x1 -> :sswitch_18
        0x6 -> :sswitch_18
        0x9 -> :sswitch_18
    .end sparse-switch

    .line 54
    :pswitch_data_48
    .packed-switch 0x1
        :pswitch_31
        :pswitch_31
        :pswitch_2c
        :pswitch_2c
        :pswitch_2c
        :pswitch_2c
        :pswitch_24
        :pswitch_24
        :pswitch_24
        :pswitch_24
        :pswitch_24
        :pswitch_2c
        :pswitch_28
        :pswitch_28
        :pswitch_28
    .end packed-switch
.end method

.method public submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;
    .registers 3
    .param p1, "task"    # Ljava/lang/Runnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            ")",
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 87
    new-instance v0, Lcom/squareup/picasso/PicassoExecutorService$PicassoFutureTask;

    check-cast p1, Lcom/squareup/picasso/BitmapHunter;

    .end local p1    # "task":Ljava/lang/Runnable;
    invoke-direct {v0, p1}, Lcom/squareup/picasso/PicassoExecutorService$PicassoFutureTask;-><init>(Lcom/squareup/picasso/BitmapHunter;)V

    .line 88
    .local v0, "ftask":Lcom/squareup/picasso/PicassoExecutorService$PicassoFutureTask;
    invoke-virtual {p0, v0}, Lcom/squareup/picasso/PicassoExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 89
    return-object v0
.end method
