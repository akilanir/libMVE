.class public Lcom/journeyapps/barcodescanner/camera/CameraInstance;
.super Ljava/lang/Object;
.source "CameraInstance.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private cameraManager:Lcom/journeyapps/barcodescanner/camera/CameraManager;

.field private cameraSettings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

.field private cameraThread:Lcom/journeyapps/barcodescanner/camera/CameraThread;

.field private closer:Ljava/lang/Runnable;

.field private configure:Ljava/lang/Runnable;

.field private displayConfiguration:Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;

.field private open:Z

.field private opener:Ljava/lang/Runnable;

.field private previewStarter:Ljava/lang/Runnable;

.field private readyHandler:Landroid/os/Handler;

.field private surfaceHolder:Landroid/view/SurfaceHolder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 17
    const-class v0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->open:Z

    .line 25
    new-instance v0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    invoke-direct {v0}, Lcom/journeyapps/barcodescanner/camera/CameraSettings;-><init>()V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraSettings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    .line 153
    new-instance v0, Lcom/journeyapps/barcodescanner/camera/CameraInstance$3;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/camera/CameraInstance$3;-><init>(Lcom/journeyapps/barcodescanner/camera/CameraInstance;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->opener:Ljava/lang/Runnable;

    .line 166
    new-instance v0, Lcom/journeyapps/barcodescanner/camera/CameraInstance$4;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/camera/CameraInstance$4;-><init>(Lcom/journeyapps/barcodescanner/camera/CameraInstance;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->configure:Ljava/lang/Runnable;

    .line 182
    new-instance v0, Lcom/journeyapps/barcodescanner/camera/CameraInstance$5;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/camera/CameraInstance$5;-><init>(Lcom/journeyapps/barcodescanner/camera/CameraInstance;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->previewStarter:Ljava/lang/Runnable;

    .line 196
    new-instance v0, Lcom/journeyapps/barcodescanner/camera/CameraInstance$6;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/camera/CameraInstance$6;-><init>(Lcom/journeyapps/barcodescanner/camera/CameraInstance;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->closer:Ljava/lang/Runnable;

    .line 28
    invoke-static {}, Lcom/journeyapps/barcodescanner/Util;->validateMainThread()V

    .line 30
    invoke-static {}, Lcom/journeyapps/barcodescanner/camera/CameraThread;->getInstance()Lcom/journeyapps/barcodescanner/camera/CameraThread;

    move-result-object v0

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraThread:Lcom/journeyapps/barcodescanner/camera/CameraThread;

    .line 31
    new-instance v0, Lcom/journeyapps/barcodescanner/camera/CameraManager;

    invoke-direct {v0, p1}, Lcom/journeyapps/barcodescanner/camera/CameraManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraManager:Lcom/journeyapps/barcodescanner/camera/CameraManager;

    .line 32
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraManager:Lcom/journeyapps/barcodescanner/camera/CameraManager;

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraSettings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->setCameraSettings(Lcom/journeyapps/barcodescanner/camera/CameraSettings;)V

    .line 33
    return-void
.end method

.method static synthetic access$000(Lcom/journeyapps/barcodescanner/camera/CameraInstance;)Lcom/journeyapps/barcodescanner/camera/CameraManager;
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraManager:Lcom/journeyapps/barcodescanner/camera/CameraManager;

    return-object v0
.end method

.method static synthetic access$100()Ljava/lang/String;
    .registers 1

    .prologue
    .line 16
    sget-object v0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/journeyapps/barcodescanner/camera/CameraInstance;Ljava/lang/Exception;)V
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/camera/CameraInstance;
    .param p1, "x1"    # Ljava/lang/Exception;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->notifyError(Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic access$300(Lcom/journeyapps/barcodescanner/camera/CameraInstance;)Landroid/os/Handler;
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->readyHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$400(Lcom/journeyapps/barcodescanner/camera/CameraInstance;)Lcom/journeyapps/barcodescanner/Size;
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->getPreviewSize()Lcom/journeyapps/barcodescanner/Size;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/journeyapps/barcodescanner/camera/CameraInstance;)Landroid/view/SurfaceHolder;
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->surfaceHolder:Landroid/view/SurfaceHolder;

    return-object v0
.end method

.method static synthetic access$600(Lcom/journeyapps/barcodescanner/camera/CameraInstance;)Lcom/journeyapps/barcodescanner/camera/CameraThread;
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraThread:Lcom/journeyapps/barcodescanner/camera/CameraThread;

    return-object v0
.end method

.method private getPreviewSize()Lcom/journeyapps/barcodescanner/Size;
    .registers 2

    .prologue
    .line 74
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraManager:Lcom/journeyapps/barcodescanner/camera/CameraManager;

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->getPreviewSize()Lcom/journeyapps/barcodescanner/Size;

    move-result-object v0

    return-object v0
.end method

.method private notifyError(Ljava/lang/Exception;)V
    .registers 4
    .param p1, "error"    # Ljava/lang/Exception;

    .prologue
    .line 212
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->readyHandler:Landroid/os/Handler;

    if-eqz v0, :cond_f

    .line 213
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->readyHandler:Landroid/os/Handler;

    sget v1, Lcom/google/zxing/client/android/R$id;->zxing_camera_error:I

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 215
    :cond_f
    return-void
.end method

.method private validateOpen()V
    .registers 3

    .prologue
    .line 147
    iget-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->open:Z

    if-nez v0, :cond_c

    .line 148
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "CameraInstance is not open"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 150
    :cond_c
    return-void
.end method


# virtual methods
.method public close()V
    .registers 3

    .prologue
    .line 122
    invoke-static {}, Lcom/journeyapps/barcodescanner/Util;->validateMainThread()V

    .line 124
    iget-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->open:Z

    if-eqz v0, :cond_e

    .line 125
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraThread:Lcom/journeyapps/barcodescanner/camera/CameraThread;

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->closer:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/camera/CameraThread;->enqueue(Ljava/lang/Runnable;)V

    .line 128
    :cond_e
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->open:Z

    .line 129
    return-void
.end method

.method public configureCamera()V
    .registers 3

    .prologue
    .line 95
    invoke-static {}, Lcom/journeyapps/barcodescanner/Util;->validateMainThread()V

    .line 96
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->validateOpen()V

    .line 98
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraThread:Lcom/journeyapps/barcodescanner/camera/CameraThread;

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->configure:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/camera/CameraThread;->enqueue(Ljava/lang/Runnable;)V

    .line 99
    return-void
.end method

.method public getCameraRotation()I
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraManager:Lcom/journeyapps/barcodescanner/camera/CameraManager;

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->getCameraRotation()I

    move-result v0

    return v0
.end method

.method public getCameraSettings()Lcom/journeyapps/barcodescanner/camera/CameraSettings;
    .registers 2

    .prologue
    .line 53
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraSettings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    return-object v0
.end method

.method public getDisplayConfiguration()Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;
    .registers 2

    .prologue
    .line 41
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->displayConfiguration:Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;

    return-object v0
.end method

.method public isOpen()Z
    .registers 2

    .prologue
    .line 132
    iget-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->open:Z

    return v0
.end method

.method public open()V
    .registers 3

    .prologue
    .line 87
    invoke-static {}, Lcom/journeyapps/barcodescanner/Util;->validateMainThread()V

    .line 89
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->open:Z

    .line 91
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraThread:Lcom/journeyapps/barcodescanner/camera/CameraThread;

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->opener:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/camera/CameraThread;->incrementAndEnqueue(Ljava/lang/Runnable;)V

    .line 92
    return-void
.end method

.method public requestPreview(Lcom/journeyapps/barcodescanner/camera/PreviewCallback;)V
    .registers 4
    .param p1, "callback"    # Lcom/journeyapps/barcodescanner/camera/PreviewCallback;

    .prologue
    .line 136
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->validateOpen()V

    .line 138
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraThread:Lcom/journeyapps/barcodescanner/camera/CameraThread;

    new-instance v1, Lcom/journeyapps/barcodescanner/camera/CameraInstance$2;

    invoke-direct {v1, p0, p1}, Lcom/journeyapps/barcodescanner/camera/CameraInstance$2;-><init>(Lcom/journeyapps/barcodescanner/camera/CameraInstance;Lcom/journeyapps/barcodescanner/camera/PreviewCallback;)V

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/camera/CameraThread;->enqueue(Ljava/lang/Runnable;)V

    .line 144
    return-void
.end method

.method public setCameraSettings(Lcom/journeyapps/barcodescanner/camera/CameraSettings;)V
    .registers 3
    .param p1, "cameraSettings"    # Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->open:Z

    if-nez v0, :cond_b

    .line 63
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraSettings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    .line 64
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraManager:Lcom/journeyapps/barcodescanner/camera/CameraManager;

    invoke-virtual {v0, p1}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->setCameraSettings(Lcom/journeyapps/barcodescanner/camera/CameraSettings;)V

    .line 66
    :cond_b
    return-void
.end method

.method public setDisplayConfiguration(Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;)V
    .registers 3
    .param p1, "configuration"    # Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->displayConfiguration:Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;

    .line 37
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraManager:Lcom/journeyapps/barcodescanner/camera/CameraManager;

    invoke-virtual {v0, p1}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->setDisplayConfiguration(Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;)V

    .line 38
    return-void
.end method

.method public setReadyHandler(Landroid/os/Handler;)V
    .registers 2
    .param p1, "readyHandler"    # Landroid/os/Handler;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->readyHandler:Landroid/os/Handler;

    .line 46
    return-void
.end method

.method public setSurfaceHolder(Landroid/view/SurfaceHolder;)V
    .registers 2
    .param p1, "surfaceHolder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->surfaceHolder:Landroid/view/SurfaceHolder;

    .line 50
    return-void
.end method

.method public setTorch(Z)V
    .registers 4
    .param p1, "on"    # Z

    .prologue
    .line 109
    invoke-static {}, Lcom/journeyapps/barcodescanner/Util;->validateMainThread()V

    .line 111
    iget-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->open:Z

    if-eqz v0, :cond_11

    .line 112
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraThread:Lcom/journeyapps/barcodescanner/camera/CameraThread;

    new-instance v1, Lcom/journeyapps/barcodescanner/camera/CameraInstance$1;

    invoke-direct {v1, p0, p1}, Lcom/journeyapps/barcodescanner/camera/CameraInstance$1;-><init>(Lcom/journeyapps/barcodescanner/camera/CameraInstance;Z)V

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/camera/CameraThread;->enqueue(Ljava/lang/Runnable;)V

    .line 119
    :cond_11
    return-void
.end method

.method public startPreview()V
    .registers 3

    .prologue
    .line 102
    invoke-static {}, Lcom/journeyapps/barcodescanner/Util;->validateMainThread()V

    .line 103
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->validateOpen()V

    .line 105
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraThread:Lcom/journeyapps/barcodescanner/camera/CameraThread;

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->previewStarter:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/camera/CameraThread;->enqueue(Ljava/lang/Runnable;)V

    .line 106
    return-void
.end method
