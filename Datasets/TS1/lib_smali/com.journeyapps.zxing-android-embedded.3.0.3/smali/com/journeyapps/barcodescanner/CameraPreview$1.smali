.class Lcom/journeyapps/barcodescanner/CameraPreview$1;
.super Ljava/lang/Object;
.source "CameraPreview.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


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
    .line 111
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/CameraPreview$1;->this$0:Lcom/journeyapps/barcodescanner/CameraPreview;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .registers 7
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 125
    if-nez p1, :cond_c

    .line 126
    # getter for: Lcom/journeyapps/barcodescanner/CameraPreview;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/journeyapps/barcodescanner/CameraPreview;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "*** WARNING *** surfaceChanged() gave us a null surface!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    :goto_b
    return-void

    .line 129
    :cond_c
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview$1;->this$0:Lcom/journeyapps/barcodescanner/CameraPreview;

    new-instance v1, Lcom/journeyapps/barcodescanner/Size;

    invoke-direct {v1, p3, p4}, Lcom/journeyapps/barcodescanner/Size;-><init>(II)V

    # setter for: Lcom/journeyapps/barcodescanner/CameraPreview;->currentSurfaceSize:Lcom/journeyapps/barcodescanner/Size;
    invoke-static {v0, v1}, Lcom/journeyapps/barcodescanner/CameraPreview;->access$002(Lcom/journeyapps/barcodescanner/CameraPreview;Lcom/journeyapps/barcodescanner/Size;)Lcom/journeyapps/barcodescanner/Size;

    .line 130
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview$1;->this$0:Lcom/journeyapps/barcodescanner/CameraPreview;

    # invokes: Lcom/journeyapps/barcodescanner/CameraPreview;->startPreviewIfReady()V
    invoke-static {v0}, Lcom/journeyapps/barcodescanner/CameraPreview;->access$200(Lcom/journeyapps/barcodescanner/CameraPreview;)V

    goto :goto_b
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .registers 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 116
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .registers 4
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 120
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview$1;->this$0:Lcom/journeyapps/barcodescanner/CameraPreview;

    const/4 v1, 0x0

    # setter for: Lcom/journeyapps/barcodescanner/CameraPreview;->currentSurfaceSize:Lcom/journeyapps/barcodescanner/Size;
    invoke-static {v0, v1}, Lcom/journeyapps/barcodescanner/CameraPreview;->access$002(Lcom/journeyapps/barcodescanner/CameraPreview;Lcom/journeyapps/barcodescanner/Size;)Lcom/journeyapps/barcodescanner/Size;

    .line 121
    return-void
.end method
