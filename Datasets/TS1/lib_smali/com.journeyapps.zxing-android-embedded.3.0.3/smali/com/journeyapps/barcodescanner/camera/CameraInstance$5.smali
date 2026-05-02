.class Lcom/journeyapps/barcodescanner/camera/CameraInstance$5;
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
    .line 182
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance$5;->this$0:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 186
    :try_start_0
    # getter for: Lcom/journeyapps/barcodescanner/camera/CameraInstance;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->access$100()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Starting preview"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance$5;->this$0:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    # getter for: Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraManager:Lcom/journeyapps/barcodescanner/camera/CameraManager;
    invoke-static {v1}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->access$000(Lcom/journeyapps/barcodescanner/camera/CameraInstance;)Lcom/journeyapps/barcodescanner/camera/CameraManager;

    move-result-object v1

    iget-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance$5;->this$0:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    # getter for: Lcom/journeyapps/barcodescanner/camera/CameraInstance;->surfaceHolder:Landroid/view/SurfaceHolder;
    invoke-static {v2}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->access$500(Lcom/journeyapps/barcodescanner/camera/CameraInstance;)Landroid/view/SurfaceHolder;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V

    .line 188
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance$5;->this$0:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    # getter for: Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraManager:Lcom/journeyapps/barcodescanner/camera/CameraManager;
    invoke-static {v1}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->access$000(Lcom/journeyapps/barcodescanner/camera/CameraInstance;)Lcom/journeyapps/barcodescanner/camera/CameraManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->startPreview()V
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_21} :catch_22

    .line 193
    :goto_21
    return-void

    .line 189
    :catch_22
    move-exception v0

    .line 190
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance$5;->this$0:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    # invokes: Lcom/journeyapps/barcodescanner/camera/CameraInstance;->notifyError(Ljava/lang/Exception;)V
    invoke-static {v1, v0}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->access$200(Lcom/journeyapps/barcodescanner/camera/CameraInstance;Ljava/lang/Exception;)V

    .line 191
    # getter for: Lcom/journeyapps/barcodescanner/camera/CameraInstance;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->access$100()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Failed to start preview"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_21
.end method
