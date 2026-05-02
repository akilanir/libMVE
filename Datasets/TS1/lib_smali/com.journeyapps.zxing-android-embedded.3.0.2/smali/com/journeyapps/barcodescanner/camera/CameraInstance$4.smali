.class Lcom/journeyapps/barcodescanner/camera/CameraInstance$4;
.super Ljava/lang/Object;
.source "CameraInstance.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/journeyapps/barcodescanner/camera/CameraInstance;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/journeyapps/barcodescanner/camera/CameraInstance;


# direct methods
.method constructor <init>(Lcom/journeyapps/barcodescanner/camera/CameraInstance;)V
    .registers 2

    .prologue
    .line 166
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance$4;->this$0:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 170
    :try_start_0
    # getter for: Lcom/journeyapps/barcodescanner/camera/CameraInstance;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->access$100()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Configuring camera"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance$4;->this$0:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    # getter for: Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraManager:Lcom/journeyapps/barcodescanner/camera/CameraManager;
    invoke-static {v1}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->access$000(Lcom/journeyapps/barcodescanner/camera/CameraInstance;)Lcom/journeyapps/barcodescanner/camera/CameraManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->configure()V

    .line 172
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance$4;->this$0:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    # getter for: Lcom/journeyapps/barcodescanner/camera/CameraInstance;->readyHandler:Landroid/os/Handler;
    invoke-static {v1}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->access$300(Lcom/journeyapps/barcodescanner/camera/CameraInstance;)Landroid/os/Handler;

    move-result-object v1

    if-eqz v1, :cond_2f

    .line 173
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance$4;->this$0:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    # getter for: Lcom/journeyapps/barcodescanner/camera/CameraInstance;->readyHandler:Landroid/os/Handler;
    invoke-static {v1}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->access$300(Lcom/journeyapps/barcodescanner/camera/CameraInstance;)Landroid/os/Handler;

    move-result-object v1

    sget v2, Lcom/google/zxing/client/android/R$id;->zxing_prewiew_size_ready:I

    iget-object v3, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance$4;->this$0:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    # invokes: Lcom/journeyapps/barcodescanner/camera/CameraInstance;->getPreviewSize()Lcom/journeyapps/barcodescanner/Size;
    invoke-static {v3}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->access$400(Lcom/journeyapps/barcodescanner/camera/CameraInstance;)Lcom/journeyapps/barcodescanner/Size;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2f} :catch_30

    .line 179
    :cond_2f
    :goto_2f
    return-void

    .line 175
    :catch_30
    move-exception v0

    .line 176
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance$4;->this$0:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    # invokes: Lcom/journeyapps/barcodescanner/camera/CameraInstance;->notifyError(Ljava/lang/Exception;)V
    invoke-static {v1, v0}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->access$200(Lcom/journeyapps/barcodescanner/camera/CameraInstance;Ljava/lang/Exception;)V

    .line 177
    # getter for: Lcom/journeyapps/barcodescanner/camera/CameraInstance;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->access$100()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Failed to configure camera"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2f
.end method
