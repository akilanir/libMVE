.class Lcom/journeyapps/barcodescanner/CameraPreview$2;
.super Ljava/lang/Object;
.source "CameraPreview.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/journeyapps/barcodescanner/CameraPreview;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/journeyapps/barcodescanner/CameraPreview;


# direct methods
.method constructor <init>(Lcom/journeyapps/barcodescanner/CameraPreview;)V
    .registers 2

    .prologue
    .line 134
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/CameraPreview$2;->this$0:Lcom/journeyapps/barcodescanner/CameraPreview;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .registers 5
    .param p1, "message"    # Landroid/os/Message;

    .prologue
    .line 137
    iget v1, p1, Landroid/os/Message;->what:I

    sget v2, Lcom/google/zxing/client/android/R$id;->zxing_prewiew_size_ready:I

    if-ne v1, v2, :cond_11

    .line 138
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/CameraPreview$2;->this$0:Lcom/journeyapps/barcodescanner/CameraPreview;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/journeyapps/barcodescanner/Size;

    # invokes: Lcom/journeyapps/barcodescanner/CameraPreview;->previewSized(Lcom/journeyapps/barcodescanner/Size;)V
    invoke-static {v2, v1}, Lcom/journeyapps/barcodescanner/CameraPreview;->access$300(Lcom/journeyapps/barcodescanner/CameraPreview;Lcom/journeyapps/barcodescanner/Size;)V

    .line 139
    const/4 v1, 0x1

    .line 149
    :goto_10
    return v1

    .line 140
    :cond_11
    iget v1, p1, Landroid/os/Message;->what:I

    sget v2, Lcom/google/zxing/client/android/R$id;->zxing_camera_error:I

    if-ne v1, v2, :cond_31

    .line 141
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Exception;

    .line 143
    .local v0, "error":Ljava/lang/Exception;
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CameraPreview$2;->this$0:Lcom/journeyapps/barcodescanner/CameraPreview;

    invoke-virtual {v1}, Lcom/journeyapps/barcodescanner/CameraPreview;->isActive()Z

    move-result v1

    if-eqz v1, :cond_31

    .line 145
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CameraPreview$2;->this$0:Lcom/journeyapps/barcodescanner/CameraPreview;

    invoke-virtual {v1}, Lcom/journeyapps/barcodescanner/CameraPreview;->pause()V

    .line 146
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CameraPreview$2;->this$0:Lcom/journeyapps/barcodescanner/CameraPreview;

    # getter for: Lcom/journeyapps/barcodescanner/CameraPreview;->fireState:Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;
    invoke-static {v1}, Lcom/journeyapps/barcodescanner/CameraPreview;->access$400(Lcom/journeyapps/barcodescanner/CameraPreview;)Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;->cameraError(Ljava/lang/Exception;)V

    .line 149
    .end local v0    # "error":Ljava/lang/Exception;
    :cond_31
    const/4 v1, 0x0

    goto :goto_10
.end method
