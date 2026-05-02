.class Lcom/journeyapps/barcodescanner/camera/CameraThread;
.super Ljava/lang/Object;
.source "CameraThread.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static instance:Lcom/journeyapps/barcodescanner/camera/CameraThread;


# instance fields
.field private final LOCK:Ljava/lang/Object;

.field private handler:Landroid/os/Handler;

.field private openCount:I

.field private thread:Landroid/os/HandlerThread;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 12
    const-class v0, Lcom/journeyapps/barcodescanner/camera/CameraThread;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/4 v0, 0x0

    iput v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->openCount:I

    .line 29
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->LOCK:Ljava/lang/Object;

    .line 33
    return-void
.end method

.method public static getInstance()Lcom/journeyapps/barcodescanner/camera/CameraThread;
    .registers 1

    .prologue
    .line 17
    sget-object v0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->instance:Lcom/journeyapps/barcodescanner/camera/CameraThread;

    if-nez v0, :cond_b

    .line 18
    new-instance v0, Lcom/journeyapps/barcodescanner/camera/CameraThread;

    invoke-direct {v0}, Lcom/journeyapps/barcodescanner/camera/CameraThread;-><init>()V

    sput-object v0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->instance:Lcom/journeyapps/barcodescanner/camera/CameraThread;

    .line 20
    :cond_b
    sget-object v0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->instance:Lcom/journeyapps/barcodescanner/camera/CameraThread;

    return-object v0
.end method

.method private quit()V
    .registers 3

    .prologue
    .line 60
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 61
    :try_start_3
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->thread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 62
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->thread:Landroid/os/HandlerThread;

    .line 63
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->handler:Landroid/os/Handler;

    .line 64
    monitor-exit v1

    .line 65
    return-void

    .line 64
    :catchall_10
    move-exception v0

    monitor-exit v1
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_10

    throw v0
.end method


# virtual methods
.method protected decrementInstances()V
    .registers 3

    .prologue
    .line 71
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 72
    :try_start_3
    iget v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->openCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->openCount:I

    .line 73
    iget v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->openCount:I

    if-nez v0, :cond_10

    .line 74
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/camera/CameraThread;->quit()V

    .line 76
    :cond_10
    monitor-exit v1

    .line 77
    return-void

    .line 76
    :catchall_12
    move-exception v0

    monitor-exit v1
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_12

    throw v0
.end method

.method protected enqueue(Ljava/lang/Runnable;)V
    .registers 5
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 43
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 44
    :try_start_3
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->handler:Landroid/os/Handler;

    if-nez v0, :cond_31

    .line 45
    iget v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->openCount:I

    if-gtz v0, :cond_16

    .line 46
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "CameraThread is not open"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 53
    :catchall_13
    move-exception v0

    monitor-exit v1
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_13

    throw v0

    .line 48
    :cond_16
    :try_start_16
    new-instance v0, Landroid/os/HandlerThread;

    const-string v2, "CameraThread"

    invoke-direct {v0, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->thread:Landroid/os/HandlerThread;

    .line 49
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->thread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 50
    new-instance v0, Landroid/os/Handler;

    iget-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->thread:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->handler:Landroid/os/Handler;

    .line 52
    :cond_31
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 53
    monitor-exit v1
    :try_end_37
    .catchall {:try_start_16 .. :try_end_37} :catchall_13

    .line 54
    return-void
.end method

.method protected incrementAndEnqueue(Ljava/lang/Runnable;)V
    .registers 4
    .param p1, "runner"    # Ljava/lang/Runnable;

    .prologue
    .line 85
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 86
    :try_start_3
    iget v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->openCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraThread;->openCount:I

    .line 87
    invoke-virtual {p0, p1}, Lcom/journeyapps/barcodescanner/camera/CameraThread;->enqueue(Ljava/lang/Runnable;)V

    .line 88
    monitor-exit v1

    .line 89
    return-void

    .line 88
    :catchall_e
    move-exception v0

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v0
.end method
