.class final Lpl/droidsonroids/gif/GifRenderingExecutor;
.super Ljava/util/concurrent/ScheduledThreadPoolExecutor;
.source "GifRenderingExecutor.java"


# static fields
.field private static volatile instance:Lpl/droidsonroids/gif/GifRenderingExecutor;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 16
    const/4 v0, 0x0

    sput-object v0, Lpl/droidsonroids/gif/GifRenderingExecutor;->instance:Lpl/droidsonroids/gif/GifRenderingExecutor;

    return-void
.end method

.method private constructor <init>()V
    .registers 3

    .prologue
    .line 12
    const/4 v0, 0x1

    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor$DiscardPolicy;

    invoke-direct {v1}, Ljava/util/concurrent/ThreadPoolExecutor$DiscardPolicy;-><init>()V

    invoke-direct {p0, v0, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(ILjava/util/concurrent/RejectedExecutionHandler;)V

    .line 13
    return-void
.end method

.method public static getInstance()Lpl/droidsonroids/gif/GifRenderingExecutor;
    .registers 2

    .prologue
    .line 19
    sget-object v0, Lpl/droidsonroids/gif/GifRenderingExecutor;->instance:Lpl/droidsonroids/gif/GifRenderingExecutor;

    if-nez v0, :cond_13

    .line 20
    const-class v1, Lpl/droidsonroids/gif/GifRenderingExecutor;

    monitor-enter v1

    .line 21
    :try_start_7
    sget-object v0, Lpl/droidsonroids/gif/GifRenderingExecutor;->instance:Lpl/droidsonroids/gif/GifRenderingExecutor;

    if-nez v0, :cond_12

    .line 22
    new-instance v0, Lpl/droidsonroids/gif/GifRenderingExecutor;

    invoke-direct {v0}, Lpl/droidsonroids/gif/GifRenderingExecutor;-><init>()V

    sput-object v0, Lpl/droidsonroids/gif/GifRenderingExecutor;->instance:Lpl/droidsonroids/gif/GifRenderingExecutor;

    .line 24
    :cond_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_16

    .line 26
    :cond_13
    sget-object v0, Lpl/droidsonroids/gif/GifRenderingExecutor;->instance:Lpl/droidsonroids/gif/GifRenderingExecutor;

    return-object v0

    .line 24
    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v0
.end method
