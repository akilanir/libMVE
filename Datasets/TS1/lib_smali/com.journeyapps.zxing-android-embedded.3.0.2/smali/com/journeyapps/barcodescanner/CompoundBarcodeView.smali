.class public Lcom/journeyapps/barcodescanner/CompoundBarcodeView;
.super Landroid/widget/FrameLayout;
.source "CompoundBarcodeView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/journeyapps/barcodescanner/CompoundBarcodeView$TorchListener;,
        Lcom/journeyapps/barcodescanner/CompoundBarcodeView$WrappedCallback;
    }
.end annotation


# instance fields
.field private barcodeView:Lcom/journeyapps/barcodescanner/BarcodeView;

.field private statusView:Landroid/widget/TextView;

.field private torchListener:Lcom/journeyapps/barcodescanner/CompoundBarcodeView$TorchListener;

.field private viewFinder:Lcom/journeyapps/barcodescanner/ViewfinderView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 62
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 63
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->initialize()V

    .line 64
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 67
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 68
    invoke-direct {p0, p2}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->initialize(Landroid/util/AttributeSet;)V

    .line 69
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 72
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 73
    invoke-direct {p0, p2}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->initialize(Landroid/util/AttributeSet;)V

    .line 74
    return-void
.end method

.method static synthetic access$000(Lcom/journeyapps/barcodescanner/CompoundBarcodeView;)Lcom/journeyapps/barcodescanner/ViewfinderView;
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/CompoundBarcodeView;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->viewFinder:Lcom/journeyapps/barcodescanner/ViewfinderView;

    return-object v0
.end method

.method private initialize()V
    .registers 2

    .prologue
    .line 118
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->initialize(Landroid/util/AttributeSet;)V

    .line 119
    return-void
.end method

.method private initialize(Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 83
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Lcom/google/zxing/client/android/R$styleable;->zxing_view:[I

    invoke-virtual {v2, p1, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 85
    .local v0, "attributes":Landroid/content/res/TypedArray;
    sget v2, Lcom/google/zxing/client/android/R$styleable;->zxing_view_zxing_scanner_layout:I

    sget v3, Lcom/google/zxing/client/android/R$layout;->zxing_barcode_scanner:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 88
    .local v1, "scannerLayout":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 90
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1, p0}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 92
    sget v2, Lcom/google/zxing/client/android/R$id;->zxing_barcode_surface:I

    invoke-virtual {p0, v2}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/journeyapps/barcodescanner/BarcodeView;

    iput-object v2, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->barcodeView:Lcom/journeyapps/barcodescanner/BarcodeView;

    .line 94
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->barcodeView:Lcom/journeyapps/barcodescanner/BarcodeView;

    if-nez v2, :cond_32

    .line 95
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "There is no a com.journeyapps.barcodescanner.BarcodeView on provided layout with the id \"zxing_barcode_surface\"."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 100
    :cond_32
    sget v2, Lcom/google/zxing/client/android/R$id;->zxing_viewfinder_view:I

    invoke-virtual {p0, v2}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/journeyapps/barcodescanner/ViewfinderView;

    iput-object v2, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->viewFinder:Lcom/journeyapps/barcodescanner/ViewfinderView;

    .line 102
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->viewFinder:Lcom/journeyapps/barcodescanner/ViewfinderView;

    if-nez v2, :cond_48

    .line 103
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "There is no a com.journeyapps.barcodescanner.ViewfinderView on provided layout with the id \"zxing_viewfinder_view\"."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 108
    :cond_48
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->viewFinder:Lcom/journeyapps/barcodescanner/ViewfinderView;

    iget-object v3, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->barcodeView:Lcom/journeyapps/barcodescanner/BarcodeView;

    invoke-virtual {v2, v3}, Lcom/journeyapps/barcodescanner/ViewfinderView;->setCameraPreview(Lcom/journeyapps/barcodescanner/CameraPreview;)V

    .line 111
    sget v2, Lcom/google/zxing/client/android/R$id;->zxing_status_view:I

    invoke-virtual {p0, v2}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->statusView:Landroid/widget/TextView;

    .line 112
    return-void
.end method


# virtual methods
.method public decodeContinuous(Lcom/journeyapps/barcodescanner/BarcodeCallback;)V
    .registers 4
    .param p1, "callback"    # Lcom/journeyapps/barcodescanner/BarcodeCallback;

    .prologue
    .line 201
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->barcodeView:Lcom/journeyapps/barcodescanner/BarcodeView;

    new-instance v1, Lcom/journeyapps/barcodescanner/CompoundBarcodeView$WrappedCallback;

    invoke-direct {v1, p0, p1}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView$WrappedCallback;-><init>(Lcom/journeyapps/barcodescanner/CompoundBarcodeView;Lcom/journeyapps/barcodescanner/BarcodeCallback;)V

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/BarcodeView;->decodeContinuous(Lcom/journeyapps/barcodescanner/BarcodeCallback;)V

    .line 202
    return-void
.end method

.method public decodeSingle(Lcom/journeyapps/barcodescanner/BarcodeCallback;)V
    .registers 4
    .param p1, "callback"    # Lcom/journeyapps/barcodescanner/BarcodeCallback;

    .prologue
    .line 193
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->barcodeView:Lcom/journeyapps/barcodescanner/BarcodeView;

    new-instance v1, Lcom/journeyapps/barcodescanner/CompoundBarcodeView$WrappedCallback;

    invoke-direct {v1, p0, p1}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView$WrappedCallback;-><init>(Lcom/journeyapps/barcodescanner/CompoundBarcodeView;Lcom/journeyapps/barcodescanner/BarcodeCallback;)V

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/BarcodeView;->decodeSingle(Lcom/journeyapps/barcodescanner/BarcodeCallback;)V

    .line 195
    return-void
.end method

.method public getBarcodeView()Lcom/journeyapps/barcodescanner/BarcodeView;
    .registers 2

    .prologue
    .line 177
    sget v0, Lcom/google/zxing/client/android/R$id;->zxing_barcode_surface:I

    invoke-virtual {p0, v0}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/journeyapps/barcodescanner/BarcodeView;

    return-object v0
.end method

.method public getStatusView()Landroid/widget/TextView;
    .registers 2

    .prologue
    .line 185
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->statusView:Landroid/widget/TextView;

    return-object v0
.end method

.method public getViewFinder()Lcom/journeyapps/barcodescanner/ViewfinderView;
    .registers 2

    .prologue
    .line 181
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->viewFinder:Lcom/journeyapps/barcodescanner/ViewfinderView;

    return-object v0
.end method

.method public initializeFromIntent(Landroid/content/Intent;)V
    .registers 11
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 128
    invoke-static {p1}, Lcom/google/zxing/client/android/DecodeFormatManager;->parseDecodeFormats(Landroid/content/Intent;)Ljava/util/Set;

    move-result-object v3

    .line 129
    .local v3, "decodeFormats":Ljava/util/Set;, "Ljava/util/Set<Lcom/google/zxing/BarcodeFormat;>;"
    invoke-static {p1}, Lcom/google/zxing/client/android/DecodeHintManager;->parseDecodeHints(Landroid/content/Intent;)Ljava/util/Map;

    move-result-object v4

    .line 131
    .local v4, "decodeHints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;Ljava/lang/Object;>;"
    new-instance v6, Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    invoke-direct {v6}, Lcom/journeyapps/barcodescanner/camera/CameraSettings;-><init>()V

    .line 133
    .local v6, "settings":Lcom/journeyapps/barcodescanner/camera/CameraSettings;
    const-string v7, "SCAN_CAMERA_ID"

    invoke-virtual {p1, v7}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_21

    .line 134
    const-string v7, "SCAN_CAMERA_ID"

    const/4 v8, -0x1

    invoke-virtual {p1, v7, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 135
    .local v0, "cameraId":I
    if-ltz v0, :cond_21

    .line 136
    invoke-virtual {v6, v0}, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->setRequestedCameraId(I)V

    .line 140
    .end local v0    # "cameraId":I
    :cond_21
    const-string v7, "PROMPT_MESSAGE"

    invoke-virtual {p1, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 141
    .local v2, "customPromptMessage":Ljava/lang/String;
    if-eqz v2, :cond_2c

    .line 142
    invoke-virtual {p0, v2}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->setStatusText(Ljava/lang/String;)V

    .line 145
    :cond_2c
    const-string v7, "CHARACTER_SET"

    invoke-virtual {p1, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 147
    .local v1, "characterSet":Ljava/lang/String;
    new-instance v5, Lcom/google/zxing/MultiFormatReader;

    invoke-direct {v5}, Lcom/google/zxing/MultiFormatReader;-><init>()V

    .line 148
    .local v5, "reader":Lcom/google/zxing/MultiFormatReader;
    invoke-virtual {v5, v4}, Lcom/google/zxing/MultiFormatReader;->setHints(Ljava/util/Map;)V

    .line 150
    iget-object v7, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->barcodeView:Lcom/journeyapps/barcodescanner/BarcodeView;

    invoke-virtual {v7, v6}, Lcom/journeyapps/barcodescanner/BarcodeView;->setCameraSettings(Lcom/journeyapps/barcodescanner/camera/CameraSettings;)V

    .line 151
    iget-object v7, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->barcodeView:Lcom/journeyapps/barcodescanner/BarcodeView;

    new-instance v8, Lcom/journeyapps/barcodescanner/DefaultDecoderFactory;

    invoke-direct {v8, v3, v4, v1}, Lcom/journeyapps/barcodescanner/DefaultDecoderFactory;-><init>(Ljava/util/Collection;Ljava/util/Map;Ljava/lang/String;)V

    invoke-virtual {v7, v8}, Lcom/journeyapps/barcodescanner/BarcodeView;->setDecoderFactory(Lcom/journeyapps/barcodescanner/DecoderFactory;)V

    .line 152
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, 0x1

    .line 233
    sparse-switch p1, :sswitch_data_12

    .line 246
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    :goto_8
    :sswitch_8
    return v0

    .line 240
    :sswitch_9
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->setTorchOff()V

    goto :goto_8

    .line 243
    :sswitch_d
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->setTorchOn()V

    goto :goto_8

    .line 233
    nop

    :sswitch_data_12
    .sparse-switch
        0x18 -> :sswitch_d
        0x19 -> :sswitch_9
        0x1b -> :sswitch_8
        0x50 -> :sswitch_8
    .end sparse-switch
.end method

.method public pause()V
    .registers 2

    .prologue
    .line 166
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->barcodeView:Lcom/journeyapps/barcodescanner/BarcodeView;

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/BarcodeView;->pause()V

    .line 167
    return-void
.end method

.method public resume()V
    .registers 2

    .prologue
    .line 173
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->barcodeView:Lcom/journeyapps/barcodescanner/BarcodeView;

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/BarcodeView;->resume()V

    .line 174
    return-void
.end method

.method public setStatusText(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 156
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->statusView:Landroid/widget/TextView;

    if-eqz v0, :cond_9

    .line 157
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->statusView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 159
    :cond_9
    return-void
.end method

.method public setTorchListener(Lcom/journeyapps/barcodescanner/CompoundBarcodeView$TorchListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/journeyapps/barcodescanner/CompoundBarcodeView$TorchListener;

    .prologue
    .line 250
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->torchListener:Lcom/journeyapps/barcodescanner/CompoundBarcodeView$TorchListener;

    .line 251
    return-void
.end method

.method public setTorchOff()V
    .registers 3

    .prologue
    .line 219
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->barcodeView:Lcom/journeyapps/barcodescanner/BarcodeView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/BarcodeView;->setTorch(Z)V

    .line 221
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->torchListener:Lcom/journeyapps/barcodescanner/CompoundBarcodeView$TorchListener;

    if-eqz v0, :cond_f

    .line 222
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->torchListener:Lcom/journeyapps/barcodescanner/CompoundBarcodeView$TorchListener;

    invoke-interface {v0}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView$TorchListener;->onTorchOff()V

    .line 224
    :cond_f
    return-void
.end method

.method public setTorchOn()V
    .registers 3

    .prologue
    .line 208
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->barcodeView:Lcom/journeyapps/barcodescanner/BarcodeView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/BarcodeView;->setTorch(Z)V

    .line 210
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->torchListener:Lcom/journeyapps/barcodescanner/CompoundBarcodeView$TorchListener;

    if-eqz v0, :cond_f

    .line 211
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->torchListener:Lcom/journeyapps/barcodescanner/CompoundBarcodeView$TorchListener;

    invoke-interface {v0}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView$TorchListener;->onTorchOn()V

    .line 213
    :cond_f
    return-void
.end method
