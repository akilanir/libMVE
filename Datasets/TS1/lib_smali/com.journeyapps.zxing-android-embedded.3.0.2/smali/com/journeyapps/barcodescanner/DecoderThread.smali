.class public Lcom/journeyapps/barcodescanner/DecoderThread;
.super Ljava/lang/Object;
.source "DecoderThread.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final LOCK:Ljava/lang/Object;

.field private final callback:Landroid/os/Handler$Callback;

.field private cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

.field private cropRect:Landroid/graphics/Rect;

.field private decoder:Lcom/journeyapps/barcodescanner/Decoder;

.field private handler:Landroid/os/Handler;

.field private final previewCallback:Lcom/journeyapps/barcodescanner/camera/PreviewCallback;

.field private resultHandler:Landroid/os/Handler;

.field private running:Z

.field private thread:Landroid/os/HandlerThread;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 23
    const-class v0, Lcom/journeyapps/barcodescanner/DecoderThread;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/journeyapps/barcodescanner/DecoderThread;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/journeyapps/barcodescanner/camera/CameraInstance;Lcom/journeyapps/barcodescanner/Decoder;Landroid/os/Handler;)V
    .registers 5
    .param p1, "cameraInstance"    # Lcom/journeyapps/barcodescanner/camera/CameraInstance;
    .param p2, "decoder"    # Lcom/journeyapps/barcodescanner/Decoder;
    .param p3, "resultHandler"    # Landroid/os/Handler;

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->running:Z

    .line 32
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->LOCK:Ljava/lang/Object;

    .line 34
    new-instance v0, Lcom/journeyapps/barcodescanner/DecoderThread$1;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/DecoderThread$1;-><init>(Lcom/journeyapps/barcodescanner/DecoderThread;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->callback:Landroid/os/Handler$Callback;

    .line 100
    new-instance v0, Lcom/journeyapps/barcodescanner/DecoderThread$2;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/DecoderThread$2;-><init>(Lcom/journeyapps/barcodescanner/DecoderThread;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->previewCallback:Lcom/journeyapps/barcodescanner/camera/PreviewCallback;

    .line 45
    invoke-static {}, Lcom/journeyapps/barcodescanner/Util;->validateMainThread()V

    .line 47
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    .line 48
    iput-object p2, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->decoder:Lcom/journeyapps/barcodescanner/Decoder;

    .line 49
    iput-object p3, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->resultHandler:Landroid/os/Handler;

    .line 50
    return-void
.end method

.method static synthetic access$000(Lcom/journeyapps/barcodescanner/DecoderThread;Lcom/journeyapps/barcodescanner/SourceData;)V
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/DecoderThread;
    .param p1, "x1"    # Lcom/journeyapps/barcodescanner/SourceData;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lcom/journeyapps/barcodescanner/DecoderThread;->decode(Lcom/journeyapps/barcodescanner/SourceData;)V

    return-void
.end method

.method static synthetic access$100(Lcom/journeyapps/barcodescanner/DecoderThread;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/DecoderThread;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->LOCK:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$200(Lcom/journeyapps/barcodescanner/DecoderThread;)Z
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/DecoderThread;

    .prologue
    .line 22
    iget-boolean v0, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->running:Z

    return v0
.end method

.method static synthetic access$300(Lcom/journeyapps/barcodescanner/DecoderThread;)Landroid/os/Handler;
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/DecoderThread;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method private decode(Lcom/journeyapps/barcodescanner/SourceData;)V
    .registers 16
    .param p1, "sourceData"    # Lcom/journeyapps/barcodescanner/SourceData;

    .prologue
    .line 131
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 132
    .local v8, "start":J
    const/4 v5, 0x0

    .line 133
    .local v5, "rawResult":Lcom/google/zxing/Result;
    iget-object v10, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->cropRect:Landroid/graphics/Rect;

    invoke-virtual {p1, v10}, Lcom/journeyapps/barcodescanner/SourceData;->setCropRect(Landroid/graphics/Rect;)V

    .line 134
    invoke-virtual {p0, p1}, Lcom/journeyapps/barcodescanner/DecoderThread;->createSource(Lcom/journeyapps/barcodescanner/SourceData;)Lcom/google/zxing/LuminanceSource;

    move-result-object v7

    .line 136
    .local v7, "source":Lcom/google/zxing/LuminanceSource;
    if-eqz v7, :cond_16

    .line 137
    iget-object v10, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->decoder:Lcom/journeyapps/barcodescanner/Decoder;

    invoke-virtual {v10, v7}, Lcom/journeyapps/barcodescanner/Decoder;->decode(Lcom/google/zxing/LuminanceSource;)Lcom/google/zxing/Result;

    move-result-object v5

    .line 140
    :cond_16
    if-eqz v5, :cond_71

    .line 142
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 143
    .local v2, "end":J
    sget-object v10, Lcom/journeyapps/barcodescanner/DecoderThread;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Found barcode in "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    sub-long v12, v2, v8

    invoke-virtual {v11, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " ms"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    iget-object v10, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->resultHandler:Landroid/os/Handler;

    if-eqz v10, :cond_58

    .line 145
    new-instance v0, Lcom/journeyapps/barcodescanner/BarcodeResult;

    invoke-direct {v0, v5, p1}, Lcom/journeyapps/barcodescanner/BarcodeResult;-><init>(Lcom/google/zxing/Result;Lcom/journeyapps/barcodescanner/SourceData;)V

    .line 146
    .local v0, "barcodeResult":Lcom/journeyapps/barcodescanner/BarcodeResult;
    iget-object v10, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->resultHandler:Landroid/os/Handler;

    sget v11, Lcom/google/zxing/client/android/R$id;->zxing_decode_succeeded:I

    invoke-static {v10, v11, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v4

    .line 147
    .local v4, "message":Landroid/os/Message;
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 148
    .local v1, "bundle":Landroid/os/Bundle;
    invoke-virtual {v4, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 149
    invoke-virtual {v4}, Landroid/os/Message;->sendToTarget()V

    .line 157
    .end local v0    # "barcodeResult":Lcom/journeyapps/barcodescanner/BarcodeResult;
    .end local v1    # "bundle":Landroid/os/Bundle;
    .end local v2    # "end":J
    .end local v4    # "message":Landroid/os/Message;
    :cond_58
    :goto_58
    iget-object v10, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->resultHandler:Landroid/os/Handler;

    if-eqz v10, :cond_6d

    .line 158
    iget-object v10, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->decoder:Lcom/journeyapps/barcodescanner/Decoder;

    invoke-virtual {v10}, Lcom/journeyapps/barcodescanner/Decoder;->getPossibleResultPoints()Ljava/util/List;

    move-result-object v6

    .line 159
    .local v6, "resultPoints":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/ResultPoint;>;"
    iget-object v10, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->resultHandler:Landroid/os/Handler;

    sget v11, Lcom/google/zxing/client/android/R$id;->zxing_possible_result_points:I

    invoke-static {v10, v11, v6}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v4

    .line 160
    .restart local v4    # "message":Landroid/os/Message;
    invoke-virtual {v4}, Landroid/os/Message;->sendToTarget()V

    .line 162
    .end local v4    # "message":Landroid/os/Message;
    .end local v6    # "resultPoints":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/ResultPoint;>;"
    :cond_6d
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/DecoderThread;->requestNextPreview()V

    .line 163
    return-void

    .line 152
    :cond_71
    iget-object v10, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->resultHandler:Landroid/os/Handler;

    if-eqz v10, :cond_58

    .line 153
    iget-object v10, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->resultHandler:Landroid/os/Handler;

    sget v11, Lcom/google/zxing/client/android/R$id;->zxing_decode_failed:I

    invoke-static {v10, v11}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v4

    .line 154
    .restart local v4    # "message":Landroid/os/Message;
    invoke-virtual {v4}, Landroid/os/Message;->sendToTarget()V

    goto :goto_58
.end method

.method private requestNextPreview()V
    .registers 3

    .prologue
    .line 117
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 118
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->previewCallback:Lcom/journeyapps/barcodescanner/camera/PreviewCallback;

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->requestPreview(Lcom/journeyapps/barcodescanner/camera/PreviewCallback;)V

    .line 120
    :cond_f
    return-void
.end method


# virtual methods
.method protected createSource(Lcom/journeyapps/barcodescanner/SourceData;)Lcom/google/zxing/LuminanceSource;
    .registers 3
    .param p1, "sourceData"    # Lcom/journeyapps/barcodescanner/SourceData;

    .prologue
    .line 123
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->cropRect:Landroid/graphics/Rect;

    if-nez v0, :cond_6

    .line 124
    const/4 v0, 0x0

    .line 126
    :goto_5
    return-object v0

    :cond_6
    invoke-virtual {p1}, Lcom/journeyapps/barcodescanner/SourceData;->createSource()Lcom/google/zxing/PlanarYUVLuminanceSource;

    move-result-object v0

    goto :goto_5
.end method

.method public getCropRect()Landroid/graphics/Rect;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->cropRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getDecoder()Lcom/journeyapps/barcodescanner/Decoder;
    .registers 2

    .prologue
    .line 53
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->decoder:Lcom/journeyapps/barcodescanner/Decoder;

    return-object v0
.end method

.method public setCropRect(Landroid/graphics/Rect;)V
    .registers 2
    .param p1, "cropRect"    # Landroid/graphics/Rect;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->cropRect:Landroid/graphics/Rect;

    .line 66
    return-void
.end method

.method public setDecoder(Lcom/journeyapps/barcodescanner/Decoder;)V
    .registers 2
    .param p1, "decoder"    # Lcom/journeyapps/barcodescanner/Decoder;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->decoder:Lcom/journeyapps/barcodescanner/Decoder;

    .line 58
    return-void
.end method

.method public start()V
    .registers 4

    .prologue
    .line 74
    invoke-static {}, Lcom/journeyapps/barcodescanner/Util;->validateMainThread()V

    .line 76
    new-instance v0, Landroid/os/HandlerThread;

    sget-object v1, Lcom/journeyapps/barcodescanner/DecoderThread;->TAG:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->thread:Landroid/os/HandlerThread;

    .line 77
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->thread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 78
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->thread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    iget-object v2, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->callback:Landroid/os/Handler$Callback;

    invoke-direct {v0, v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->handler:Landroid/os/Handler;

    .line 79
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->running:Z

    .line 80
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/DecoderThread;->requestNextPreview()V

    .line 81
    return-void
.end method

.method public stop()V
    .registers 4

    .prologue
    .line 90
    invoke-static {}, Lcom/journeyapps/barcodescanner/Util;->validateMainThread()V

    .line 92
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 93
    const/4 v0, 0x0

    :try_start_7
    iput-boolean v0, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->running:Z

    .line 94
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->handler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 95
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/DecoderThread;->thread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 96
    monitor-exit v1

    .line 97
    return-void

    .line 96
    :catchall_16
    move-exception v0

    monitor-exit v1
    :try_end_18
    .catchall {:try_start_7 .. :try_end_18} :catchall_16

    throw v0
.end method
