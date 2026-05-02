.class final Lcom/journeyapps/barcodescanner/camera/CameraManager$CameraPreviewCallback;
.super Ljava/lang/Object;
.source "CameraManager.java"

# interfaces
.implements Landroid/hardware/Camera$PreviewCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/journeyapps/barcodescanner/camera/CameraManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "CameraPreviewCallback"
.end annotation


# instance fields
.field private callback:Lcom/journeyapps/barcodescanner/camera/PreviewCallback;

.field private resolution:Lcom/journeyapps/barcodescanner/Size;

.field final synthetic this$0:Lcom/journeyapps/barcodescanner/camera/CameraManager;


# direct methods
.method public constructor <init>(Lcom/journeyapps/barcodescanner/camera/CameraManager;)V
    .registers 2

    .prologue
    .line 81
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager$CameraPreviewCallback;->this$0:Lcom/journeyapps/barcodescanner/camera/CameraManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    return-void
.end method


# virtual methods
.method public onPreviewFrame([BLandroid/hardware/Camera;)V
    .registers 11
    .param p1, "data"    # [B
    .param p2, "camera"    # Landroid/hardware/Camera;

    .prologue
    .line 94
    iget-object v7, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager$CameraPreviewCallback;->resolution:Lcom/journeyapps/barcodescanner/Size;

    .line 95
    .local v7, "cameraResolution":Lcom/journeyapps/barcodescanner/Size;
    iget-object v6, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager$CameraPreviewCallback;->callback:Lcom/journeyapps/barcodescanner/camera/PreviewCallback;

    .line 96
    .local v6, "callback":Lcom/journeyapps/barcodescanner/camera/PreviewCallback;
    if-eqz v7, :cond_24

    if-eqz v6, :cond_24

    .line 97
    invoke-virtual {p2}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getPreviewFormat()I

    move-result v4

    .line 98
    .local v4, "format":I
    new-instance v0, Lcom/journeyapps/barcodescanner/SourceData;

    iget v2, v7, Lcom/journeyapps/barcodescanner/Size;->width:I

    iget v3, v7, Lcom/journeyapps/barcodescanner/Size;->height:I

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager$CameraPreviewCallback;->this$0:Lcom/journeyapps/barcodescanner/camera/CameraManager;

    invoke-virtual {v1}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->getCameraRotation()I

    move-result v5

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/journeyapps/barcodescanner/SourceData;-><init>([BIIII)V

    .line 99
    .local v0, "source":Lcom/journeyapps/barcodescanner/SourceData;
    invoke-interface {v6, v0}, Lcom/journeyapps/barcodescanner/camera/PreviewCallback;->onPreview(Lcom/journeyapps/barcodescanner/SourceData;)V

    .line 103
    .end local v0    # "source":Lcom/journeyapps/barcodescanner/SourceData;
    .end local v4    # "format":I
    :goto_23
    return-void

    .line 101
    :cond_24
    # getter for: Lcom/journeyapps/barcodescanner/camera/CameraManager;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->access$000()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Got preview callback, but no handler or resolution available"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_23
.end method

.method public setCallback(Lcom/journeyapps/barcodescanner/camera/PreviewCallback;)V
    .registers 2
    .param p1, "callback"    # Lcom/journeyapps/barcodescanner/camera/PreviewCallback;

    .prologue
    .line 89
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager$CameraPreviewCallback;->callback:Lcom/journeyapps/barcodescanner/camera/PreviewCallback;

    .line 90
    return-void
.end method

.method public setResolution(Lcom/journeyapps/barcodescanner/Size;)V
    .registers 2
    .param p1, "resolution"    # Lcom/journeyapps/barcodescanner/Size;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager$CameraPreviewCallback;->resolution:Lcom/journeyapps/barcodescanner/Size;

    .line 86
    return-void
.end method
