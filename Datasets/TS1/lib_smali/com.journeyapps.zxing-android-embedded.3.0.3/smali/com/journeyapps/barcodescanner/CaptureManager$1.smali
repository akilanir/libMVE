.class Lcom/journeyapps/barcodescanner/CaptureManager$1;
.super Ljava/lang/Object;
.source "CaptureManager.java"

# interfaces
.implements Lcom/journeyapps/barcodescanner/BarcodeCallback;


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
    .line 67
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/CaptureManager$1;->this$0:Lcom/journeyapps/barcodescanner/CaptureManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public barcodeResult(Lcom/journeyapps/barcodescanner/BarcodeResult;)V
    .registers 6
    .param p1, "result"    # Lcom/journeyapps/barcodescanner/BarcodeResult;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager$1;->this$0:Lcom/journeyapps/barcodescanner/CaptureManager;

    # getter for: Lcom/journeyapps/barcodescanner/CaptureManager;->barcodeView:Lcom/journeyapps/barcodescanner/CompoundBarcodeView;
    invoke-static {v0}, Lcom/journeyapps/barcodescanner/CaptureManager;->access$000(Lcom/journeyapps/barcodescanner/CaptureManager;)Lcom/journeyapps/barcodescanner/CompoundBarcodeView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->pause()V

    .line 71
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager$1;->this$0:Lcom/journeyapps/barcodescanner/CaptureManager;

    # getter for: Lcom/journeyapps/barcodescanner/CaptureManager;->beepManager:Lcom/google/zxing/client/android/BeepManager;
    invoke-static {v0}, Lcom/journeyapps/barcodescanner/CaptureManager;->access$100(Lcom/journeyapps/barcodescanner/CaptureManager;)Lcom/google/zxing/client/android/BeepManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/zxing/client/android/BeepManager;->playBeepSoundAndVibrate()V

    .line 73
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager$1;->this$0:Lcom/journeyapps/barcodescanner/CaptureManager;

    # getter for: Lcom/journeyapps/barcodescanner/CaptureManager;->handler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/journeyapps/barcodescanner/CaptureManager;->access$200(Lcom/journeyapps/barcodescanner/CaptureManager;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/journeyapps/barcodescanner/CaptureManager$1$1;

    invoke-direct {v1, p0, p1}, Lcom/journeyapps/barcodescanner/CaptureManager$1$1;-><init>(Lcom/journeyapps/barcodescanner/CaptureManager$1;Lcom/journeyapps/barcodescanner/BarcodeResult;)V

    const-wide/16 v2, 0x96

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 80
    return-void
.end method

.method public possibleResultPoints(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/zxing/ResultPoint;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 85
    .local p1, "resultPoints":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/ResultPoint;>;"
    return-void
.end method
