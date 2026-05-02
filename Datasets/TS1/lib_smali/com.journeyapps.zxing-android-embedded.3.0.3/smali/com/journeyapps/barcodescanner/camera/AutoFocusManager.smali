.class public final Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;
.super Ljava/lang/Object;
.source "AutoFocusManager.java"


# static fields
.field private static final AUTO_FOCUS_INTERVAL_MS:J = 0x7d0L

.field private static final FOCUS_MODES_CALLING_AF:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private MESSAGE_FOCUS:I

.field private final autoFocusCallback:Landroid/hardware/Camera$AutoFocusCallback;

.field private final camera:Landroid/hardware/Camera;

.field private final focusHandlerCallback:Landroid/os/Handler$Callback;

.field private focusing:Z

.field private handler:Landroid/os/Handler;

.field private stopped:Z

.field private final useAutoFocus:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 33
    const-class v0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->TAG:Ljava/lang/String;

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    sput-object v0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->FOCUS_MODES_CALLING_AF:Ljava/util/Collection;

    .line 49
    sget-object v0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->FOCUS_MODES_CALLING_AF:Ljava/util/Collection;

    const-string v1, "auto"

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 50
    sget-object v0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->FOCUS_MODES_CALLING_AF:Ljava/util/Collection;

    const-string v1, "macro"

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 51
    return-void
.end method

.method public constructor <init>(Landroid/hardware/Camera;Lcom/journeyapps/barcodescanner/camera/CameraSettings;)V
    .registers 7
    .param p1, "camera"    # Landroid/hardware/Camera;
    .param p2, "settings"    # Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    .prologue
    const/4 v1, 0x1

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput v1, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->MESSAGE_FOCUS:I

    .line 53
    new-instance v2, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager$1;

    invoke-direct {v2, p0}, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager$1;-><init>(Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;)V

    iput-object v2, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->focusHandlerCallback:Landroid/os/Handler$Callback;

    .line 64
    new-instance v2, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager$2;

    invoke-direct {v2, p0}, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager$2;-><init>(Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;)V

    iput-object v2, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->autoFocusCallback:Landroid/hardware/Camera$AutoFocusCallback;

    .line 78
    new-instance v2, Landroid/os/Handler;

    iget-object v3, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->focusHandlerCallback:Landroid/os/Handler$Callback;

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v2, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->handler:Landroid/os/Handler;

    .line 79
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->camera:Landroid/hardware/Camera;

    .line 80
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v2

    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->getFocusMode()Ljava/lang/String;

    move-result-object v0

    .line 81
    .local v0, "currentFocusMode":Ljava/lang/String;
    invoke-virtual {p2}, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->isAutoFocusEnabled()Z

    move-result v2

    if-eqz v2, :cond_5f

    sget-object v2, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->FOCUS_MODES_CALLING_AF:Ljava/util/Collection;

    invoke-interface {v2, v0}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5f

    :goto_35
    iput-boolean v1, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->useAutoFocus:Z

    .line 82
    sget-object v1, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Current focus mode \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'; use auto focus? "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->useAutoFocus:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->start()V

    .line 84
    return-void

    .line 81
    :cond_5f
    const/4 v1, 0x0

    goto :goto_35
.end method

.method static synthetic access$000(Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;)I
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;

    .prologue
    .line 31
    iget v0, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->MESSAGE_FOCUS:I

    return v0
.end method

.method static synthetic access$100(Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;)V
    .registers 1
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->focus()V

    return-void
.end method

.method static synthetic access$202(Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;
    .param p1, "x1"    # Z

    .prologue
    .line 31
    iput-boolean p1, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->focusing:Z

    return p1
.end method

.method static synthetic access$300(Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;)V
    .registers 1
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->autoFocusAgainLater()V

    return-void
.end method

.method static synthetic access$400(Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;)Landroid/os/Handler;
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method private declared-synchronized autoFocusAgainLater()V
    .registers 5

    .prologue
    .line 88
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->stopped:Z

    if-nez v0, :cond_1e

    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->handler:Landroid/os/Handler;

    iget v1, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->MESSAGE_FOCUS:I

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_1e

    .line 89
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->handler:Landroid/os/Handler;

    iget v2, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->MESSAGE_FOCUS:I

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z
    :try_end_1e
    .catchall {:try_start_1 .. :try_end_1e} :catchall_20

    .line 91
    :cond_1e
    monitor-exit p0

    return-void

    .line 88
    :catchall_20
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private cancelOutstandingTask()V
    .registers 3

    .prologue
    .line 118
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->handler:Landroid/os/Handler;

    iget v1, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->MESSAGE_FOCUS:I

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 119
    return-void
.end method

.method private focus()V
    .registers 4

    .prologue
    .line 102
    iget-boolean v1, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->useAutoFocus:Z

    if-eqz v1, :cond_16

    .line 103
    iget-boolean v1, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->stopped:Z

    if-nez v1, :cond_16

    iget-boolean v1, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->focusing:Z

    if-nez v1, :cond_16

    .line 105
    :try_start_c
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->camera:Landroid/hardware/Camera;

    iget-object v2, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->autoFocusCallback:Landroid/hardware/Camera$AutoFocusCallback;

    invoke-virtual {v1, v2}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 106
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->focusing:Z
    :try_end_16
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_16} :catch_17

    .line 115
    :cond_16
    :goto_16
    return-void

    .line 107
    :catch_17
    move-exception v0

    .line 109
    .local v0, "re":Ljava/lang/RuntimeException;
    sget-object v1, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->TAG:Ljava/lang/String;

    const-string v2, "Unexpected exception while focusing"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 111
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->autoFocusAgainLater()V

    goto :goto_16
.end method


# virtual methods
.method public start()V
    .registers 2

    .prologue
    .line 97
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->stopped:Z

    .line 98
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->focus()V

    .line 99
    return-void
.end method

.method public stop()V
    .registers 4

    .prologue
    .line 125
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->stopped:Z

    .line 126
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->focusing:Z

    .line 127
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->cancelOutstandingTask()V

    .line 128
    iget-boolean v1, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->useAutoFocus:Z

    if-eqz v1, :cond_12

    .line 131
    :try_start_d
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->cancelAutoFocus()V
    :try_end_12
    .catch Ljava/lang/RuntimeException; {:try_start_d .. :try_end_12} :catch_13

    .line 137
    :cond_12
    :goto_12
    return-void

    .line 132
    :catch_13
    move-exception v0

    .line 134
    .local v0, "re":Ljava/lang/RuntimeException;
    sget-object v1, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->TAG:Ljava/lang/String;

    const-string v2, "Unexpected exception while cancelling focusing"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_12
.end method
