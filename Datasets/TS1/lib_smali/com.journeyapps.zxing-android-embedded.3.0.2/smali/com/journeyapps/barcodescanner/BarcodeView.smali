.class public Lcom/journeyapps/barcodescanner/BarcodeView;
.super Lcom/journeyapps/barcodescanner/CameraPreview;
.source "BarcodeView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;
    }
.end annotation


# instance fields
.field private callback:Lcom/journeyapps/barcodescanner/BarcodeCallback;

.field private decodeMode:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

.field private decoderFactory:Lcom/journeyapps/barcodescanner/DecoderFactory;

.field private decoderThread:Lcom/journeyapps/barcodescanner/DecoderThread;

.field private final resultCallback:Landroid/os/Handler$Callback;

.field private resultHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lcom/journeyapps/barcodescanner/CameraPreview;-><init>(Landroid/content/Context;)V

    .line 35
    sget-object v0, Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;->NONE:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decodeMode:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->callback:Lcom/journeyapps/barcodescanner/BarcodeCallback;

    .line 44
    new-instance v0, Lcom/journeyapps/barcodescanner/BarcodeView$1;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/BarcodeView$1;-><init>(Lcom/journeyapps/barcodescanner/BarcodeView;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->resultCallback:Landroid/os/Handler$Callback;

    .line 76
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/BarcodeView;->initialize()V

    .line 77
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 80
    invoke-direct {p0, p1, p2}, Lcom/journeyapps/barcodescanner/CameraPreview;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 35
    sget-object v0, Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;->NONE:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decodeMode:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->callback:Lcom/journeyapps/barcodescanner/BarcodeCallback;

    .line 44
    new-instance v0, Lcom/journeyapps/barcodescanner/BarcodeView$1;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/BarcodeView$1;-><init>(Lcom/journeyapps/barcodescanner/BarcodeView;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->resultCallback:Landroid/os/Handler$Callback;

    .line 81
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/BarcodeView;->initialize()V

    .line 82
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 85
    invoke-direct {p0, p1, p2, p3}, Lcom/journeyapps/barcodescanner/CameraPreview;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 35
    sget-object v0, Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;->NONE:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decodeMode:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->callback:Lcom/journeyapps/barcodescanner/BarcodeCallback;

    .line 44
    new-instance v0, Lcom/journeyapps/barcodescanner/BarcodeView$1;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/BarcodeView$1;-><init>(Lcom/journeyapps/barcodescanner/BarcodeView;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->resultCallback:Landroid/os/Handler$Callback;

    .line 86
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/BarcodeView;->initialize()V

    .line 87
    return-void
.end method

.method static synthetic access$000(Lcom/journeyapps/barcodescanner/BarcodeView;)Lcom/journeyapps/barcodescanner/BarcodeCallback;
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/BarcodeView;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->callback:Lcom/journeyapps/barcodescanner/BarcodeCallback;

    return-object v0
.end method

.method static synthetic access$100(Lcom/journeyapps/barcodescanner/BarcodeView;)Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/BarcodeView;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decodeMode:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

    return-object v0
.end method

.method private createDecoder()Lcom/journeyapps/barcodescanner/Decoder;
    .registers 5

    .prologue
    .line 114
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decoderFactory:Lcom/journeyapps/barcodescanner/DecoderFactory;

    if-nez v3, :cond_a

    .line 115
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/BarcodeView;->createDefaultDecoderFactory()Lcom/journeyapps/barcodescanner/DecoderFactory;

    move-result-object v3

    iput-object v3, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decoderFactory:Lcom/journeyapps/barcodescanner/DecoderFactory;

    .line 117
    :cond_a
    new-instance v0, Lcom/journeyapps/barcodescanner/DecoderResultPointCallback;

    invoke-direct {v0}, Lcom/journeyapps/barcodescanner/DecoderResultPointCallback;-><init>()V

    .line 118
    .local v0, "callback":Lcom/journeyapps/barcodescanner/DecoderResultPointCallback;
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 119
    .local v2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;Ljava/lang/Object;>;"
    sget-object v3, Lcom/google/zxing/DecodeHintType;->NEED_RESULT_POINT_CALLBACK:Lcom/google/zxing/DecodeHintType;

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decoderFactory:Lcom/journeyapps/barcodescanner/DecoderFactory;

    invoke-interface {v3, v2}, Lcom/journeyapps/barcodescanner/DecoderFactory;->createDecoder(Ljava/util/Map;)Lcom/journeyapps/barcodescanner/Decoder;

    move-result-object v1

    .line 121
    .local v1, "decoder":Lcom/journeyapps/barcodescanner/Decoder;
    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/DecoderResultPointCallback;->setDecoder(Lcom/journeyapps/barcodescanner/Decoder;)V

    .line 122
    return-object v1
.end method

.method private initialize()V
    .registers 3

    .prologue
    .line 91
    new-instance v0, Lcom/journeyapps/barcodescanner/DefaultDecoderFactory;

    invoke-direct {v0}, Lcom/journeyapps/barcodescanner/DefaultDecoderFactory;-><init>()V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decoderFactory:Lcom/journeyapps/barcodescanner/DecoderFactory;

    .line 92
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->resultCallback:Landroid/os/Handler$Callback;

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->resultHandler:Landroid/os/Handler;

    .line 93
    return-void
.end method

.method private startDecoderThread()V
    .registers 5

    .prologue
    .line 174
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/BarcodeView;->stopDecoderThread()V

    .line 176
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decodeMode:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

    sget-object v1, Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;->NONE:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

    if-eq v0, v1, :cond_2e

    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/BarcodeView;->isPreviewActive()Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 180
    new-instance v0, Lcom/journeyapps/barcodescanner/DecoderThread;

    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/BarcodeView;->getCameraInstance()Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    move-result-object v1

    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/BarcodeView;->createDecoder()Lcom/journeyapps/barcodescanner/Decoder;

    move-result-object v2

    iget-object v3, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->resultHandler:Landroid/os/Handler;

    invoke-direct {v0, v1, v2, v3}, Lcom/journeyapps/barcodescanner/DecoderThread;-><init>(Lcom/journeyapps/barcodescanner/camera/CameraInstance;Lcom/journeyapps/barcodescanner/Decoder;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decoderThread:Lcom/journeyapps/barcodescanner/DecoderThread;

    .line 181
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decoderThread:Lcom/journeyapps/barcodescanner/DecoderThread;

    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/BarcodeView;->getPreviewFramingRect()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/DecoderThread;->setCropRect(Landroid/graphics/Rect;)V

    .line 182
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decoderThread:Lcom/journeyapps/barcodescanner/DecoderThread;

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/DecoderThread;->start()V

    .line 184
    :cond_2e
    return-void
.end method

.method private stopDecoderThread()V
    .registers 2

    .prologue
    .line 194
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decoderThread:Lcom/journeyapps/barcodescanner/DecoderThread;

    if-eqz v0, :cond_c

    .line 195
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decoderThread:Lcom/journeyapps/barcodescanner/DecoderThread;

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/DecoderThread;->stop()V

    .line 196
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decoderThread:Lcom/journeyapps/barcodescanner/DecoderThread;

    .line 198
    :cond_c
    return-void
.end method


# virtual methods
.method protected createDefaultDecoderFactory()Lcom/journeyapps/barcodescanner/DecoderFactory;
    .registers 2

    .prologue
    .line 170
    new-instance v0, Lcom/journeyapps/barcodescanner/DefaultDecoderFactory;

    invoke-direct {v0}, Lcom/journeyapps/barcodescanner/DefaultDecoderFactory;-><init>()V

    return-object v0
.end method

.method public decodeContinuous(Lcom/journeyapps/barcodescanner/BarcodeCallback;)V
    .registers 3
    .param p1, "callback"    # Lcom/journeyapps/barcodescanner/BarcodeCallback;

    .prologue
    .line 155
    sget-object v0, Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;->CONTINUOUS:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decodeMode:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

    .line 156
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->callback:Lcom/journeyapps/barcodescanner/BarcodeCallback;

    .line 157
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/BarcodeView;->startDecoderThread()V

    .line 158
    return-void
.end method

.method public decodeSingle(Lcom/journeyapps/barcodescanner/BarcodeCallback;)V
    .registers 3
    .param p1, "callback"    # Lcom/journeyapps/barcodescanner/BarcodeCallback;

    .prologue
    .line 141
    sget-object v0, Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;->SINGLE:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decodeMode:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

    .line 142
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->callback:Lcom/journeyapps/barcodescanner/BarcodeCallback;

    .line 143
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/BarcodeView;->startDecoderThread()V

    .line 144
    return-void
.end method

.method public getDecoderFactory()Lcom/journeyapps/barcodescanner/DecoderFactory;
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decoderFactory:Lcom/journeyapps/barcodescanner/DecoderFactory;

    return-object v0
.end method

.method public pause()V
    .registers 1

    .prologue
    .line 207
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/BarcodeView;->stopDecoderThread()V

    .line 209
    invoke-super {p0}, Lcom/journeyapps/barcodescanner/CameraPreview;->pause()V

    .line 210
    return-void
.end method

.method protected previewStarted()V
    .registers 1

    .prologue
    .line 188
    invoke-super {p0}, Lcom/journeyapps/barcodescanner/CameraPreview;->previewStarted()V

    .line 190
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/BarcodeView;->startDecoderThread()V

    .line 191
    return-void
.end method

.method public setDecoderFactory(Lcom/journeyapps/barcodescanner/DecoderFactory;)V
    .registers 4
    .param p1, "decoderFactory"    # Lcom/journeyapps/barcodescanner/DecoderFactory;

    .prologue
    .line 105
    invoke-static {}, Lcom/journeyapps/barcodescanner/Util;->validateMainThread()V

    .line 107
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decoderFactory:Lcom/journeyapps/barcodescanner/DecoderFactory;

    .line 108
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decoderThread:Lcom/journeyapps/barcodescanner/DecoderThread;

    if-eqz v0, :cond_12

    .line 109
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decoderThread:Lcom/journeyapps/barcodescanner/DecoderThread;

    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/BarcodeView;->createDecoder()Lcom/journeyapps/barcodescanner/Decoder;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/DecoderThread;->setDecoder(Lcom/journeyapps/barcodescanner/Decoder;)V

    .line 111
    :cond_12
    return-void
.end method

.method public stopDecoding()V
    .registers 2

    .prologue
    .line 164
    sget-object v0, Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;->NONE:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->decodeMode:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

    .line 165
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/BarcodeView;->callback:Lcom/journeyapps/barcodescanner/BarcodeCallback;

    .line 166
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/BarcodeView;->stopDecoderThread()V

    .line 167
    return-void
.end method
