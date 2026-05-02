.class Lcom/journeyapps/barcodescanner/camera/CameraInstance$6;
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
    .line 196
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance$6;->this$0:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 200
    :try_start_0
    # getter for: Lcom/journeyapps/barcodescanner/camera/CameraInstance;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->access$100()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Closing camera"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance$6;->this$0:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    # getter for: Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraManager:Lcom/journeyapps/barcodescanner/camera/CameraManager;
    invoke-static {v1}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->access$000(Lcom/journeyapps/barcodescanner/camera/CameraInstance;)Lcom/journeyapps/barcodescanner/camera/CameraManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->stopPreview()V

    .line 202
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance$6;->this$0:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    # getter for: Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraManager:Lcom/journeyapps/barcodescanner/camera/CameraManager;
    invoke-static {v1}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->access$000(Lcom/journeyapps/barcodescanner/camera/CameraInstance;)Lcom/journeyapps/barcodescanner/camera/CameraManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->close()V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1b} :catch_25

    .line 207
    :goto_1b
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraInstance$6;->this$0:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    # getter for: Lcom/journeyapps/barcodescanner/camera/CameraInstance;->cameraThread:Lcom/journeyapps/barcodescanner/camera/CameraThread;
    invoke-static {v1}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->access$600(Lcom/journeyapps/barcodescanner/camera/CameraInstance;)Lcom/journeyapps/barcodescanner/camera/CameraThread;

    move-result-object v1

    invoke-virtual {v1}, Lcom/journeyapps/barcodescanner/camera/CameraThread;->decrementInstances()V

    .line 208
    return-void

    .line 203
    :catch_25
    move-exception v0

    .line 204
    .local v0, "e":Ljava/lang/Exception;
    # getter for: Lcom/journeyapps/barcodescanner/camera/CameraInstance;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->access$100()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Failed to close camera"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1b
.end method
