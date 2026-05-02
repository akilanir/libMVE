.class Lpl/droidsonroids/gif/GifTextureView$RenderThread;
.super Ljava/lang/Thread;
.source "GifTextureView.java"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lpl/droidsonroids/gif/GifTextureView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RenderThread"
.end annotation


# instance fields
.field final isSurfaceValid:Lpl/droidsonroids/gif/ConditionVariable;

.field private mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

.field private final mGifTextureViewReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lpl/droidsonroids/gif/GifTextureView;",
            ">;"
        }
    .end annotation
.end field

.field private mIOException:Ljava/io/IOException;

.field mSavedState:[J


# direct methods
.method constructor <init>(Lpl/droidsonroids/gif/GifTextureView;)V
    .registers 3
    .param p1, "gifTextureView"    # Lpl/droidsonroids/gif/GifTextureView;

    .prologue
    .line 169
    const-string v0, "GifRenderThread"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 162
    new-instance v0, Lpl/droidsonroids/gif/ConditionVariable;

    invoke-direct {v0}, Lpl/droidsonroids/gif/ConditionVariable;-><init>()V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->isSurfaceValid:Lpl/droidsonroids/gif/ConditionVariable;

    .line 163
    sget-object v0, Lpl/droidsonroids/gif/GifInfoHandle;->NULL_INFO:Lpl/droidsonroids/gif/GifInfoHandle;

    iput-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 170
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifTextureViewReference:Ljava/lang/ref/WeakReference;

    .line 171
    return-void
.end method

.method static synthetic access$200(Lpl/droidsonroids/gif/GifTextureView$RenderThread;)Lpl/droidsonroids/gif/GifInfoHandle;
    .registers 2
    .param p0, "x0"    # Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    .prologue
    .line 160
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    return-object v0
.end method

.method static synthetic access$500(Lpl/droidsonroids/gif/GifTextureView$RenderThread;)Ljava/io/IOException;
    .registers 2
    .param p0, "x0"    # Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    .prologue
    .line 160
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mIOException:Ljava/io/IOException;

    return-object v0
.end method


# virtual methods
.method dispose(Lpl/droidsonroids/gif/GifTextureView;)V
    .registers 3
    .param p1, "gifTextureView"    # Lpl/droidsonroids/gif/GifTextureView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 251
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->isSurfaceValid:Lpl/droidsonroids/gif/ConditionVariable;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/ConditionVariable;->close()V

    .line 252
    const/4 v0, 0x0

    # invokes: Lpl/droidsonroids/gif/GifTextureView;->setSuperSurfaceTextureListener(Lpl/droidsonroids/gif/GifTextureView$RenderThread;)V
    invoke-static {p1, v0}, Lpl/droidsonroids/gif/GifTextureView;->access$100(Lpl/droidsonroids/gif/GifTextureView;Lpl/droidsonroids/gif/GifTextureView$RenderThread;)V

    .line 253
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->postUnbindSurface()V

    .line 254
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->interrupt()V

    .line 255
    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .registers 6
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 228
    iget-object v1, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifTextureViewReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpl/droidsonroids/gif/GifTextureView;

    .line 229
    .local v0, "gifTextureView":Lpl/droidsonroids/gif/GifTextureView;
    if-eqz v0, :cond_f

    .line 230
    iget-object v1, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    # invokes: Lpl/droidsonroids/gif/GifTextureView;->updateTextureViewSize(Lpl/droidsonroids/gif/GifInfoHandle;)V
    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifTextureView;->access$300(Lpl/droidsonroids/gif/GifTextureView;Lpl/droidsonroids/gif/GifInfoHandle;)V

    .line 231
    :cond_f
    iget-object v1, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->isSurfaceValid:Lpl/droidsonroids/gif/ConditionVariable;

    invoke-virtual {v1}, Lpl/droidsonroids/gif/ConditionVariable;->open()V

    .line 232
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .registers 3
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 241
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->isSurfaceValid:Lpl/droidsonroids/gif/ConditionVariable;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/ConditionVariable;->close()V

    .line 242
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->postUnbindSurface()V

    .line 243
    const/4 v0, 0x0

    return v0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .registers 4
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 237
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .registers 2
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 248
    return-void
.end method

.method public run()V
    .registers 10

    .prologue
    .line 176
    :try_start_0
    iget-object v6, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifTextureViewReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lpl/droidsonroids/gif/GifTextureView;

    .line 177
    .local v2, "gifTextureView":Lpl/droidsonroids/gif/GifTextureView;
    if-nez v2, :cond_b

    .line 224
    .end local v2    # "gifTextureView":Lpl/droidsonroids/gif/GifTextureView;
    :goto_a
    return-void

    .line 180
    .restart local v2    # "gifTextureView":Lpl/droidsonroids/gif/GifTextureView;
    :cond_b
    # getter for: Lpl/droidsonroids/gif/GifTextureView;->mInputSource:Lpl/droidsonroids/gif/InputSource;
    invoke-static {v2}, Lpl/droidsonroids/gif/GifTextureView;->access$000(Lpl/droidsonroids/gif/GifTextureView;)Lpl/droidsonroids/gif/InputSource;

    move-result-object v6

    invoke-virtual {v6}, Lpl/droidsonroids/gif/InputSource;->open()Lpl/droidsonroids/gif/GifInfoHandle;

    move-result-object v6

    iput-object v6, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_15} :catch_25

    .line 186
    iget-object v6, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifTextureViewReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "gifTextureView":Lpl/droidsonroids/gif/GifTextureView;
    check-cast v2, Lpl/droidsonroids/gif/GifTextureView;

    .line 187
    .restart local v2    # "gifTextureView":Lpl/droidsonroids/gif/GifTextureView;
    if-nez v2, :cond_29

    .line 188
    iget-object v6, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v6}, Lpl/droidsonroids/gif/GifInfoHandle;->recycle()V

    goto :goto_a

    .line 181
    .end local v2    # "gifTextureView":Lpl/droidsonroids/gif/GifTextureView;
    :catch_25
    move-exception v1

    .line 182
    .local v1, "ex":Ljava/io/IOException;
    iput-object v1, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mIOException:Ljava/io/IOException;

    goto :goto_a

    .line 192
    .end local v1    # "ex":Ljava/io/IOException;
    .restart local v2    # "gifTextureView":Lpl/droidsonroids/gif/GifTextureView;
    :cond_29
    # invokes: Lpl/droidsonroids/gif/GifTextureView;->setSuperSurfaceTextureListener(Lpl/droidsonroids/gif/GifTextureView$RenderThread;)V
    invoke-static {v2, p0}, Lpl/droidsonroids/gif/GifTextureView;->access$100(Lpl/droidsonroids/gif/GifTextureView;Lpl/droidsonroids/gif/GifTextureView$RenderThread;)V

    .line 193
    invoke-virtual {v2}, Lpl/droidsonroids/gif/GifTextureView;->isAvailable()Z

    move-result v3

    .line 194
    .local v3, "isSurfaceAvailable":Z
    iget-object v6, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->isSurfaceValid:Lpl/droidsonroids/gif/ConditionVariable;

    invoke-virtual {v6, v3}, Lpl/droidsonroids/gif/ConditionVariable;->set(Z)V

    .line 195
    if-eqz v3, :cond_3f

    .line 196
    new-instance v6, Lpl/droidsonroids/gif/GifTextureView$RenderThread$1;

    invoke-direct {v6, p0, v2}, Lpl/droidsonroids/gif/GifTextureView$RenderThread$1;-><init>(Lpl/droidsonroids/gif/GifTextureView$RenderThread;Lpl/droidsonroids/gif/GifTextureView;)V

    invoke-virtual {v2, v6}, Lpl/droidsonroids/gif/GifTextureView;->post(Ljava/lang/Runnable;)Z

    .line 203
    :cond_3f
    iget-object v6, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    # getter for: Lpl/droidsonroids/gif/GifTextureView;->mSpeedFactor:F
    invoke-static {v2}, Lpl/droidsonroids/gif/GifTextureView;->access$400(Lpl/droidsonroids/gif/GifTextureView;)F

    move-result v7

    invoke-virtual {v6, v7}, Lpl/droidsonroids/gif/GifInfoHandle;->setSpeedFactor(F)V

    .line 205
    :cond_48
    :goto_48
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->isInterrupted()Z

    move-result v6

    if-nez v6, :cond_6e

    .line 207
    :try_start_4e
    iget-object v6, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->isSurfaceValid:Lpl/droidsonroids/gif/ConditionVariable;

    invoke-virtual {v6}, Lpl/droidsonroids/gif/ConditionVariable;->block()V
    :try_end_53
    .catch Ljava/lang/InterruptedException; {:try_start_4e .. :try_end_53} :catch_6d

    .line 211
    invoke-virtual {v2}, Lpl/droidsonroids/gif/GifTextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v5

    .line 212
    .local v5, "surfaceTexture":Landroid/graphics/SurfaceTexture;
    if-eqz v5, :cond_48

    .line 215
    new-instance v4, Landroid/view/Surface;

    invoke-direct {v4, v5}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 217
    .local v4, "surface":Landroid/view/Surface;
    :try_start_5e
    iget-object v6, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    iget-object v7, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mSavedState:[J

    invoke-virtual {v2}, Lpl/droidsonroids/gif/GifTextureView;->isOpaque()Z

    move-result v8

    invoke-virtual {v6, v4, v7, v8}, Lpl/droidsonroids/gif/GifInfoHandle;->bindSurface(Landroid/view/Surface;[JZ)V
    :try_end_69
    .catchall {:try_start_5e .. :try_end_69} :catchall_78

    .line 219
    invoke-virtual {v4}, Landroid/view/Surface;->release()V

    goto :goto_48

    .line 208
    .end local v4    # "surface":Landroid/view/Surface;
    .end local v5    # "surfaceTexture":Landroid/graphics/SurfaceTexture;
    :catch_6d
    move-exception v0

    .line 222
    :cond_6e
    iget-object v6, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v6}, Lpl/droidsonroids/gif/GifInfoHandle;->recycle()V

    .line 223
    sget-object v6, Lpl/droidsonroids/gif/GifInfoHandle;->NULL_INFO:Lpl/droidsonroids/gif/GifInfoHandle;

    iput-object v6, p0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    goto :goto_a

    .line 219
    .restart local v4    # "surface":Landroid/view/Surface;
    .restart local v5    # "surfaceTexture":Landroid/graphics/SurfaceTexture;
    :catchall_78
    move-exception v6

    invoke-virtual {v4}, Landroid/view/Surface;->release()V

    throw v6
.end method
