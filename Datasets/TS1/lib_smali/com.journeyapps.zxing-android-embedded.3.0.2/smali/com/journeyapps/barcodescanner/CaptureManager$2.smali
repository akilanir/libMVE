.class Lcom/journeyapps/barcodescanner/CaptureManager$2;
.super Ljava/lang/Object;
.source "CaptureManager.java"

# interfaces
.implements Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/journeyapps/barcodescanner/CaptureManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/journeyapps/barcodescanner/CaptureManager;


# direct methods
.method constructor <init>(Lcom/journeyapps/barcodescanner/CaptureManager;)V
    .registers 2

    .prologue
    .line 83
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/CaptureManager$2;->this$0:Lcom/journeyapps/barcodescanner/CaptureManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cameraError(Ljava/lang/Exception;)V
    .registers 3
    .param p1, "error"    # Ljava/lang/Exception;

    .prologue
    .line 101
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager$2;->this$0:Lcom/journeyapps/barcodescanner/CaptureManager;

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/CaptureManager;->displayFrameworkBugMessageAndExit()V

    .line 102
    return-void
.end method

.method public previewSized()V
    .registers 1

    .prologue
    .line 87
    return-void
.end method

.method public previewStarted()V
    .registers 1

    .prologue
    .line 92
    return-void
.end method

.method public previewStopped()V
    .registers 1

    .prologue
    .line 97
    return-void
.end method
