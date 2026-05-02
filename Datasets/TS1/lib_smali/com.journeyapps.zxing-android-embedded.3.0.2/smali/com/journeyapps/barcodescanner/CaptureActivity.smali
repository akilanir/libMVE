.class public Lcom/journeyapps/barcodescanner/CaptureActivity;
.super Landroid/app/Activity;
.source "CaptureActivity.java"


# instance fields
.field private barcodeScannerView:Lcom/journeyapps/barcodescanner/CompoundBarcodeView;

.field private capture:Lcom/journeyapps/barcodescanner/CaptureManager;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 18
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 20
    sget v0, Lcom/google/zxing/client/android/R$layout;->zxing_capture:I

    invoke-virtual {p0, v0}, Lcom/journeyapps/barcodescanner/CaptureActivity;->setContentView(I)V

    .line 21
    sget v0, Lcom/google/zxing/client/android/R$id;->zxing_barcode_scanner:I

    invoke-virtual {p0, v0}, Lcom/journeyapps/barcodescanner/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureActivity;->barcodeScannerView:Lcom/journeyapps/barcodescanner/CompoundBarcodeView;

    .line 23
    new-instance v0, Lcom/journeyapps/barcodescanner/CaptureManager;

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CaptureActivity;->barcodeScannerView:Lcom/journeyapps/barcodescanner/CompoundBarcodeView;

    invoke-direct {v0, p0, v1}, Lcom/journeyapps/barcodescanner/CaptureManager;-><init>(Landroid/app/Activity;Lcom/journeyapps/barcodescanner/CompoundBarcodeView;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureActivity;->capture:Lcom/journeyapps/barcodescanner/CaptureManager;

    .line 24
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureActivity;->capture:Lcom/journeyapps/barcodescanner/CaptureManager;

    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/CaptureActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/journeyapps/barcodescanner/CaptureManager;->initializeFromIntent(Landroid/content/Intent;Landroid/os/Bundle;)V

    .line 25
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureActivity;->capture:Lcom/journeyapps/barcodescanner/CaptureManager;

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/CaptureManager;->decode()V

    .line 26
    return-void
.end method

.method protected onDestroy()V
    .registers 2

    .prologue
    .line 42
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 43
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureActivity;->capture:Lcom/journeyapps/barcodescanner/CaptureManager;

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/CaptureManager;->onDestroy()V

    .line 44
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureActivity;->barcodeScannerView:Lcom/journeyapps/barcodescanner/CompoundBarcodeView;

    invoke-virtual {v0, p1, p2}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_e

    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_10

    :cond_e
    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method protected onPause()V
    .registers 2

    .prologue
    .line 36
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 37
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureActivity;->capture:Lcom/journeyapps/barcodescanner/CaptureManager;

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/CaptureManager;->onPause()V

    .line 38
    return-void
.end method

.method protected onResume()V
    .registers 2

    .prologue
    .line 30
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 31
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureActivity;->capture:Lcom/journeyapps/barcodescanner/CaptureManager;

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/CaptureManager;->onResume()V

    .line 32
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 48
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 49
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureActivity;->capture:Lcom/journeyapps/barcodescanner/CaptureManager;

    invoke-virtual {v0, p1}, Lcom/journeyapps/barcodescanner/CaptureManager;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 50
    return-void
.end method
