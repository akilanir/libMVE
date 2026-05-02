.class Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;
.super Ljava/lang/Object;
.source "IonDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/ion/IonDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "IonGifDecoder"
.end annotation


# instance fields
.field currentFrame:Lcom/koushikdutta/ion/gif/GifFrame;

.field exception:Ljava/lang/Exception;

.field gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

.field isLoading:Z

.field loader:Ljava/lang/Runnable;

.field nextFrameRender:J

.field postLoad:Ljava/lang/Runnable;

.field final synthetic this$0:Lcom/koushikdutta/ion/IonDrawable;


# direct methods
.method public constructor <init>(Lcom/koushikdutta/ion/IonDrawable;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    .registers 4
    .param p1, "this$0"    # Lcom/koushikdutta/ion/IonDrawable;
    .param p2, "info"    # Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .prologue
    .line 182
    iput-object p1, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->this$0:Lcom/koushikdutta/ion/IonDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 187
    new-instance v0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder$1;

    invoke-direct {v0, p0}, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder$1;-><init>(Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;)V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->loader:Ljava/lang/Runnable;

    .line 203
    new-instance v0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder$2;

    invoke-direct {v0, p0}, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder$2;-><init>(Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;)V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->postLoad:Ljava/lang/Runnable;

    .line 183
    iget-object v0, p2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

    invoke-virtual {v0}, Lcom/koushikdutta/ion/gif/GifDecoder;->mutate()Lcom/koushikdutta/ion/gif/GifDecoder;

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

    .line 184
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

    invoke-virtual {v0}, Lcom/koushikdutta/ion/gif/GifDecoder;->getLastFrame()Lcom/koushikdutta/ion/gif/GifFrame;

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->currentFrame:Lcom/koushikdutta/ion/gif/GifFrame;

    .line 185
    return-void
.end method


# virtual methods
.method public getCurrentFrame()Lcom/koushikdutta/ion/gif/GifFrame;
    .registers 7

    .prologue
    .line 222
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 223
    .local v0, "now":J
    iget-wide v2, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->nextFrameRender:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_16

    .line 224
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->getDelay()J

    move-result-wide v2

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->nextFrameRender:J

    .line 225
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->scheduleNextFrame()V

    .line 228
    :cond_16
    iget-wide v2, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->nextFrameRender:J

    cmp-long v2, v0, v2

    if-ltz v2, :cond_43

    .line 230
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

    invoke-virtual {v2}, Lcom/koushikdutta/ion/gif/GifDecoder;->getLastFrame()Lcom/koushikdutta/ion/gif/GifFrame;

    move-result-object v2

    iget-object v3, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->currentFrame:Lcom/koushikdutta/ion/gif/GifFrame;

    if-eq v2, v3, :cond_40

    .line 232
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

    invoke-virtual {v2}, Lcom/koushikdutta/ion/gif/GifDecoder;->getLastFrame()Lcom/koushikdutta/ion/gif/GifFrame;

    move-result-object v2

    iput-object v2, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->currentFrame:Lcom/koushikdutta/ion/gif/GifFrame;

    .line 234
    iget-wide v2, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->nextFrameRender:J

    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->getDelay()J

    move-result-wide v4

    add-long/2addr v2, v4

    cmp-long v2, v0, v2

    if-lez v2, :cond_46

    .line 235
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->getDelay()J

    move-result-wide v2

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->nextFrameRender:J

    .line 239
    :cond_40
    :goto_40
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->scheduleNextFrame()V

    .line 242
    :cond_43
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->currentFrame:Lcom/koushikdutta/ion/gif/GifFrame;

    return-object v2

    .line 237
    :cond_46
    iget-wide v2, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->nextFrameRender:J

    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->getDelay()J

    move-result-wide v4

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->nextFrameRender:J

    goto :goto_40
.end method

.method getDelay()J
    .registers 5

    .prologue
    .line 213
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->currentFrame:Lcom/koushikdutta/ion/gif/GifFrame;

    if-nez v2, :cond_7

    .line 214
    const-wide/16 v0, 0x64

    .line 218
    :cond_6
    :goto_6
    return-wide v0

    .line 215
    :cond_7
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->currentFrame:Lcom/koushikdutta/ion/gif/GifFrame;

    iget v2, v2, Lcom/koushikdutta/ion/gif/GifFrame;->delay:I

    int-to-long v0, v2

    .line 216
    .local v0, "delay":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_6

    .line 217
    const-wide/16 v0, 0x64

    goto :goto_6
.end method

.method public declared-synchronized scheduleNextFrame()V
    .registers 3

    .prologue
    .line 247
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->isLoading:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_2e

    if-eqz v0, :cond_7

    .line 255
    :cond_5
    :goto_5
    monitor-exit p0

    return-void

    .line 249
    :cond_7
    :try_start_7
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->exception:Ljava/lang/Exception;

    if-nez v0, :cond_5

    .line 251
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

    invoke-virtual {v0}, Lcom/koushikdutta/ion/gif/GifDecoder;->getStatus()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_21

    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->this$0:Lcom/koushikdutta/ion/IonDrawable;

    # getter for: Lcom/koushikdutta/ion/IonDrawable;->repeatAnimation:Z
    invoke-static {v0}, Lcom/koushikdutta/ion/IonDrawable;->access$100(Lcom/koushikdutta/ion/IonDrawable;)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 252
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

    invoke-virtual {v0}, Lcom/koushikdutta/ion/gif/GifDecoder;->restart()V

    .line 253
    :cond_21
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->isLoading:Z

    .line 254
    invoke-static {}, Lcom/koushikdutta/ion/Ion;->getBitmapLoadExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iget-object v1, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->loader:Ljava/lang/Runnable;

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_2d
    .catchall {:try_start_7 .. :try_end_2d} :catchall_2e

    goto :goto_5

    .line 247
    :catchall_2e
    move-exception v0

    monitor-exit p0

    throw v0
.end method
