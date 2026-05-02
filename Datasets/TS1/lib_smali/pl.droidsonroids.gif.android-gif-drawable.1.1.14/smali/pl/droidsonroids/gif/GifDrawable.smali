.class public Lpl/droidsonroids/gif/GifDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "GifDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Animatable;
.implements Landroid/widget/MediaController$MediaPlayerControl;


# instance fields
.field final mBuffer:Landroid/graphics/Bitmap;

.field private mCornerRadius:F

.field private final mDstRect:Landroid/graphics/Rect;

.field private final mDstRectF:Landroid/graphics/RectF;

.field final mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

.field final mInvalidationHandler:Lpl/droidsonroids/gif/InvalidationHandler;

.field final mIsRenderingTriggeredOnDraw:Z

.field volatile mIsRunning:Z

.field final mListeners:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lpl/droidsonroids/gif/AnimationListener;",
            ">;"
        }
    .end annotation
.end field

.field final mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

.field mNextFrameRenderTime:J

.field protected final mPaint:Landroid/graphics/Paint;

.field private final mRenderTask:Lpl/droidsonroids/gif/RenderTask;

.field private mScaledHeight:I

.field private mScaledWidth:I

.field mSchedule:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture",
            "<*>;"
        }
    .end annotation
.end field

.field private final mSrcRect:Landroid/graphics/Rect;

.field private mTint:Landroid/content/res/ColorStateList;

.field private mTintFilter:Landroid/graphics/PorterDuffColorFilter;

.field private mTintMode:Landroid/graphics/PorterDuff$Mode;


# direct methods
.method public constructor <init>(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    .registers 6
    .param p1, "resolver"    # Landroid/content/ContentResolver;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "uri"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 208
    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Lpl/droidsonroids/gif/GifInfoHandle;->openUri(Landroid/content/ContentResolver;Landroid/net/Uri;Z)Lpl/droidsonroids/gif/GifInfoHandle;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v2, v2, v1}, Lpl/droidsonroids/gif/GifDrawable;-><init>(Lpl/droidsonroids/gif/GifInfoHandle;Lpl/droidsonroids/gif/GifDrawable;Ljava/util/concurrent/ScheduledThreadPoolExecutor;Z)V

    .line 209
    return-void
.end method

.method public constructor <init>(Landroid/content/res/AssetFileDescriptor;)V
    .registers 5
    .param p1, "afd"    # Landroid/content/res/AssetFileDescriptor;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 160
    new-instance v0, Lpl/droidsonroids/gif/GifInfoHandle;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lpl/droidsonroids/gif/GifInfoHandle;-><init>(Landroid/content/res/AssetFileDescriptor;Z)V

    const/4 v1, 0x1

    invoke-direct {p0, v0, v2, v2, v1}, Lpl/droidsonroids/gif/GifDrawable;-><init>(Lpl/droidsonroids/gif/GifInfoHandle;Lpl/droidsonroids/gif/GifDrawable;Ljava/util/concurrent/ScheduledThreadPoolExecutor;Z)V

    .line 161
    return-void
.end method

.method public constructor <init>(Landroid/content/res/AssetManager;Ljava/lang/String;)V
    .registers 4
    .param p1, "assets"    # Landroid/content/res/AssetManager;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "assetName"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 110
    invoke-virtual {p1, p2}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v0

    invoke-direct {p0, v0}, Lpl/droidsonroids/gif/GifDrawable;-><init>(Landroid/content/res/AssetFileDescriptor;)V

    .line 111
    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;I)V
    .registers 5
    .param p1, "res"    # Landroid/content/res/Resources;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "id"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation

        .annotation build Landroid/support/annotation/RawRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->openRawResourceFd(I)Landroid/content/res/AssetFileDescriptor;

    move-result-object v1

    invoke-direct {p0, v1}, Lpl/droidsonroids/gif/GifDrawable;-><init>(Landroid/content/res/AssetFileDescriptor;)V

    .line 96
    invoke-static {p1, p2}, Lpl/droidsonroids/gif/GifViewUtils;->getDensityScale(Landroid/content/res/Resources;I)F

    move-result v0

    .line 97
    .local v0, "densityScale":F
    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getHeight()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v0

    float-to-int v1, v1

    iput v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mScaledHeight:I

    .line 98
    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getWidth()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v0

    float-to-int v1, v1

    iput v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mScaledWidth:I

    .line 99
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "file"    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lpl/droidsonroids/gif/GifDrawable;-><init>(Ljava/lang/String;)V

    .line 136
    return-void
.end method

.method public constructor <init>(Ljava/io/FileDescriptor;)V
    .registers 7
    .param p1, "fd"    # Ljava/io/FileDescriptor;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 171
    new-instance v0, Lpl/droidsonroids/gif/GifInfoHandle;

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    invoke-direct {v0, p1, v1, v2, v3}, Lpl/droidsonroids/gif/GifInfoHandle;-><init>(Ljava/io/FileDescriptor;JZ)V

    const/4 v1, 0x1

    invoke-direct {p0, v0, v4, v4, v1}, Lpl/droidsonroids/gif/GifDrawable;-><init>(Lpl/droidsonroids/gif/GifInfoHandle;Lpl/droidsonroids/gif/GifDrawable;Ljava/util/concurrent/ScheduledThreadPoolExecutor;Z)V

    .line 172
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 5
    .param p1, "stream"    # Ljava/io/InputStream;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 148
    new-instance v0, Lpl/droidsonroids/gif/GifInfoHandle;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lpl/droidsonroids/gif/GifInfoHandle;-><init>(Ljava/io/InputStream;Z)V

    const/4 v1, 0x1

    invoke-direct {p0, v0, v2, v2, v1}, Lpl/droidsonroids/gif/GifDrawable;-><init>(Lpl/droidsonroids/gif/GifInfoHandle;Lpl/droidsonroids/gif/GifDrawable;Ljava/util/concurrent/ScheduledThreadPoolExecutor;Z)V

    .line 149
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 5
    .param p1, "filePath"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 124
    new-instance v0, Lpl/droidsonroids/gif/GifInfoHandle;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lpl/droidsonroids/gif/GifInfoHandle;-><init>(Ljava/lang/String;Z)V

    const/4 v1, 0x1

    invoke-direct {p0, v0, v2, v2, v1}, Lpl/droidsonroids/gif/GifDrawable;-><init>(Lpl/droidsonroids/gif/GifInfoHandle;Lpl/droidsonroids/gif/GifDrawable;Ljava/util/concurrent/ScheduledThreadPoolExecutor;Z)V

    .line 125
    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .registers 5
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 195
    new-instance v0, Lpl/droidsonroids/gif/GifInfoHandle;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lpl/droidsonroids/gif/GifInfoHandle;-><init>(Ljava/nio/ByteBuffer;Z)V

    const/4 v1, 0x1

    invoke-direct {p0, v0, v2, v2, v1}, Lpl/droidsonroids/gif/GifDrawable;-><init>(Lpl/droidsonroids/gif/GifInfoHandle;Lpl/droidsonroids/gif/GifDrawable;Ljava/util/concurrent/ScheduledThreadPoolExecutor;Z)V

    .line 196
    return-void
.end method

.method constructor <init>(Lpl/droidsonroids/gif/GifInfoHandle;Lpl/droidsonroids/gif/GifDrawable;Ljava/util/concurrent/ScheduledThreadPoolExecutor;Z)V
    .registers 10
    .param p1, "gifInfoHandle"    # Lpl/droidsonroids/gif/GifInfoHandle;
    .param p2, "oldDrawable"    # Lpl/droidsonroids/gif/GifDrawable;
    .param p3, "executor"    # Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    .param p4, "isRenderingTriggeredOnDraw"    # Z

    .prologue
    const/4 v4, 0x0

    .line 211
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 58
    const/4 v1, 0x1

    iput-boolean v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mIsRunning:Z

    .line 59
    const-wide/high16 v1, -0x8000000000000000L

    iput-wide v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mNextFrameRenderTime:J

    .line 61
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mDstRect:Landroid/graphics/Rect;

    .line 65
    new-instance v1, Landroid/graphics/Paint;

    const/4 v2, 0x6

    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mPaint:Landroid/graphics/Paint;

    .line 71
    new-instance v1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mListeners:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 78
    new-instance v1, Lpl/droidsonroids/gif/RenderTask;

    invoke-direct {v1, p0}, Lpl/droidsonroids/gif/RenderTask;-><init>(Lpl/droidsonroids/gif/GifDrawable;)V

    iput-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mRenderTask:Lpl/droidsonroids/gif/RenderTask;

    .line 83
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mDstRectF:Landroid/graphics/RectF;

    .line 212
    iput-boolean p4, p0, Lpl/droidsonroids/gif/GifDrawable;->mIsRenderingTriggeredOnDraw:Z

    .line 213
    if-eqz p3, :cond_b1

    .end local p3    # "executor":Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    :goto_33
    iput-object p3, p0, Lpl/droidsonroids/gif/GifDrawable;->mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 214
    iput-object p1, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 215
    const/4 v0, 0x0

    .line 216
    .local v0, "oldBitmap":Landroid/graphics/Bitmap;
    if-eqz p2, :cond_6b

    .line 217
    iget-object v2, p2, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    monitor-enter v2

    .line 218
    :try_start_3d
    iget-object v1, p2, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v1}, Lpl/droidsonroids/gif/GifInfoHandle;->isRecycled()Z

    move-result v1

    if-nez v1, :cond_6a

    .line 219
    iget-object v1, p2, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getHeight()I

    move-result v1

    iget-object v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v3}, Lpl/droidsonroids/gif/GifInfoHandle;->getHeight()I

    move-result v3

    if-lt v1, v3, :cond_6a

    iget-object v1, p2, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getWidth()I

    move-result v1

    iget-object v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v3}, Lpl/droidsonroids/gif/GifInfoHandle;->getWidth()I

    move-result v3

    if-lt v1, v3, :cond_6a

    .line 220
    invoke-direct {p2}, Lpl/droidsonroids/gif/GifDrawable;->shutdown()V

    .line 221
    iget-object v0, p2, Lpl/droidsonroids/gif/GifDrawable;->mBuffer:Landroid/graphics/Bitmap;

    .line 222
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 225
    :cond_6a
    monitor-exit v2
    :try_end_6b
    .catchall {:try_start_3d .. :try_end_6b} :catchall_b7

    .line 228
    :cond_6b
    if-nez v0, :cond_ba

    .line 229
    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getWidth()I

    move-result v1

    iget-object v2, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v2}, Lpl/droidsonroids/gif/GifInfoHandle;->getHeight()I

    move-result v2

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mBuffer:Landroid/graphics/Bitmap;

    .line 234
    :goto_81
    new-instance v1, Landroid/graphics/Rect;

    iget-object v2, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v2}, Lpl/droidsonroids/gif/GifInfoHandle;->getWidth()I

    move-result v2

    iget-object v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v3}, Lpl/droidsonroids/gif/GifInfoHandle;->getHeight()I

    move-result v3

    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mSrcRect:Landroid/graphics/Rect;

    .line 235
    new-instance v1, Lpl/droidsonroids/gif/InvalidationHandler;

    invoke-direct {v1, p0}, Lpl/droidsonroids/gif/InvalidationHandler;-><init>(Lpl/droidsonroids/gif/GifDrawable;)V

    iput-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mInvalidationHandler:Lpl/droidsonroids/gif/InvalidationHandler;

    .line 236
    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mRenderTask:Lpl/droidsonroids/gif/RenderTask;

    invoke-virtual {v1}, Lpl/droidsonroids/gif/RenderTask;->doWork()V

    .line 237
    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getWidth()I

    move-result v1

    iput v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mScaledWidth:I

    .line 238
    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getHeight()I

    move-result v1

    iput v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mScaledHeight:I

    .line 239
    return-void

    .line 213
    .end local v0    # "oldBitmap":Landroid/graphics/Bitmap;
    .restart local p3    # "executor":Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    :cond_b1
    invoke-static {}, Lpl/droidsonroids/gif/GifRenderingExecutor;->getInstance()Lpl/droidsonroids/gif/GifRenderingExecutor;

    move-result-object p3

    goto/16 :goto_33

    .line 225
    .end local p3    # "executor":Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    .restart local v0    # "oldBitmap":Landroid/graphics/Bitmap;
    :catchall_b7
    move-exception v1

    :try_start_b8
    monitor-exit v2
    :try_end_b9
    .catchall {:try_start_b8 .. :try_end_b9} :catchall_b7

    throw v1

    .line 231
    :cond_ba
    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mBuffer:Landroid/graphics/Bitmap;

    goto :goto_81
.end method

.method public constructor <init>([B)V
    .registers 5
    .param p1, "bytes"    # [B
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 183
    new-instance v0, Lpl/droidsonroids/gif/GifInfoHandle;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lpl/droidsonroids/gif/GifInfoHandle;-><init>([BZ)V

    const/4 v1, 0x1

    invoke-direct {p0, v0, v2, v2, v1}, Lpl/droidsonroids/gif/GifDrawable;-><init>(Lpl/droidsonroids/gif/GifInfoHandle;Lpl/droidsonroids/gif/GifDrawable;Ljava/util/concurrent/ScheduledThreadPoolExecutor;Z)V

    .line 184
    return-void
.end method

.method public static createFromResource(Landroid/content/res/Resources;I)Lpl/droidsonroids/gif/GifDrawable;
    .registers 4
    .param p0, "res"    # Landroid/content/res/Resources;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "resourceId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation

        .annotation build Landroid/support/annotation/RawRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 433
    :try_start_0
    new-instance v1, Lpl/droidsonroids/gif/GifDrawable;

    invoke-direct {v1, p0, p1}, Lpl/droidsonroids/gif/GifDrawable;-><init>(Landroid/content/res/Resources;I)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 435
    :goto_5
    return-object v1

    .line 434
    :catch_6
    move-exception v0

    .line 435
    .local v0, "ignored":Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_5
.end method

.method private shutdown()V
    .registers 3

    .prologue
    .line 254
    const/4 v0, 0x0

    iput-boolean v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mIsRunning:Z

    .line 255
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mInvalidationHandler:Lpl/droidsonroids/gif/InvalidationHandler;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lpl/droidsonroids/gif/InvalidationHandler;->removeMessages(I)V

    .line 256
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->recycle()V

    .line 257
    return-void
.end method

.method private updateTintFilter(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;
    .registers 6
    .param p1, "tint"    # Landroid/content/res/ColorStateList;
    .param p2, "tintMode"    # Landroid/graphics/PorterDuff$Mode;

    .prologue
    .line 814
    if-eqz p1, :cond_4

    if-nez p2, :cond_6

    .line 815
    :cond_4
    const/4 v1, 0x0

    .line 819
    :goto_5
    return-object v1

    .line 818
    :cond_6
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawable;->getState()[I

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    .line 819
    .local v0, "color":I
    new-instance v1, Landroid/graphics/PorterDuffColorFilter;

    invoke-direct {v1, v0, p2}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    goto :goto_5
.end method

.method private waitForPendingRenderTask()V
    .registers 3

    .prologue
    .line 356
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mSchedule:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_a

    .line 357
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mSchedule:Ljava/util/concurrent/ScheduledFuture;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 359
    :cond_a
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mInvalidationHandler:Lpl/droidsonroids/gif/InvalidationHandler;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lpl/droidsonroids/gif/InvalidationHandler;->removeMessages(I)V

    .line 360
    return-void
.end method


# virtual methods
.method public addAnimationListener(Lpl/droidsonroids/gif/AnimationListener;)V
    .registers 3
    .param p1, "listener"    # Lpl/droidsonroids/gif/AnimationListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 786
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mListeners:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 787
    return-void
.end method

.method public canPause()Z
    .registers 2

    .prologue
    .line 598
    const/4 v0, 0x1

    return v0
.end method

.method public canSeekBackward()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 608
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawable;->getNumberOfFrames()I

    move-result v1

    if-le v1, v0, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public canSeekForward()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 618
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawable;->getNumberOfFrames()I

    move-result v1

    if-le v1, v0, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 13
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const-wide/high16 v9, -0x8000000000000000L

    .line 729
    iget-object v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mTintFilter:Landroid/graphics/PorterDuffColorFilter;

    if-eqz v3, :cond_62

    iget-object v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->getColorFilter()Landroid/graphics/ColorFilter;

    move-result-object v3

    if-nez v3, :cond_62

    .line 730
    iget-object v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mPaint:Landroid/graphics/Paint;

    iget-object v4, p0, Lpl/droidsonroids/gif/GifDrawable;->mTintFilter:Landroid/graphics/PorterDuffColorFilter;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 731
    const/4 v0, 0x1

    .line 735
    .local v0, "clearColorFilter":Z
    :goto_16
    iget-object v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->getShader()Landroid/graphics/Shader;

    move-result-object v3

    if-nez v3, :cond_64

    .line 736
    iget-object v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mBuffer:Landroid/graphics/Bitmap;

    iget-object v4, p0, Lpl/droidsonroids/gif/GifDrawable;->mSrcRect:Landroid/graphics/Rect;

    iget-object v5, p0, Lpl/droidsonroids/gif/GifDrawable;->mDstRect:Landroid/graphics/Rect;

    iget-object v6, p0, Lpl/droidsonroids/gif/GifDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 740
    :goto_29
    if-eqz v0, :cond_31

    .line 741
    iget-object v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 744
    :cond_31
    iget-boolean v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mIsRenderingTriggeredOnDraw:Z

    if-eqz v3, :cond_61

    iget-boolean v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mIsRunning:Z

    if-eqz v3, :cond_61

    iget-wide v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mNextFrameRenderTime:J

    cmp-long v3, v3, v9

    if-eqz v3, :cond_61

    .line 745
    const-wide/16 v3, 0x0

    iget-wide v5, p0, Lpl/droidsonroids/gif/GifDrawable;->mNextFrameRenderTime:J

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v7

    sub-long/2addr v5, v7

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    .line 746
    .local v1, "renderDelay":J
    iput-wide v9, p0, Lpl/droidsonroids/gif/GifDrawable;->mNextFrameRenderTime:J

    .line 747
    iget-object v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    iget-object v4, p0, Lpl/droidsonroids/gif/GifDrawable;->mRenderTask:Lpl/droidsonroids/gif/RenderTask;

    invoke-virtual {v3, v4}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->remove(Ljava/lang/Runnable;)Z

    .line 748
    iget-object v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    iget-object v4, p0, Lpl/droidsonroids/gif/GifDrawable;->mRenderTask:Lpl/droidsonroids/gif/RenderTask;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v4, v1, v2, v5}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v3

    iput-object v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mSchedule:Ljava/util/concurrent/ScheduledFuture;

    .line 750
    .end local v1    # "renderDelay":J
    :cond_61
    return-void

    .line 733
    .end local v0    # "clearColorFilter":Z
    :cond_62
    const/4 v0, 0x0

    .restart local v0    # "clearColorFilter":Z
    goto :goto_16

    .line 738
    :cond_64
    iget-object v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mDstRectF:Landroid/graphics/RectF;

    iget v4, p0, Lpl/droidsonroids/gif/GifDrawable;->mCornerRadius:F

    iget v5, p0, Lpl/droidsonroids/gif/GifDrawable;->mCornerRadius:F

    iget-object v6, p0, Lpl/droidsonroids/gif/GifDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_29
.end method

.method public getAllocationByteCount()J
    .registers 5

    .prologue
    .line 651
    iget-object v2, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v2}, Lpl/droidsonroids/gif/GifInfoHandle;->getAllocationByteCount()J

    move-result-wide v0

    .line 652
    .local v0, "byteCount":J
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-lt v2, v3, :cond_15

    .line 653
    iget-object v2, p0, Lpl/droidsonroids/gif/GifDrawable;->mBuffer:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getAllocationByteCount()I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    .line 657
    :goto_14
    return-wide v0

    .line 655
    :cond_15
    iget-object v2, p0, Lpl/droidsonroids/gif/GifDrawable;->mBuffer:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result v2

    iget-object v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mBuffer:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    mul-int/2addr v2, v3

    int-to-long v2, v2

    add-long/2addr v0, v2

    goto :goto_14
.end method

.method public getAlpha()I
    .registers 2

    .prologue
    .line 762
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    move-result v0

    return v0
.end method

.method public getAudioSessionId()I
    .registers 2

    .prologue
    .line 629
    const/4 v0, 0x0

    return v0
.end method

.method public getBufferPercentage()I
    .registers 2

    .prologue
    .line 588
    const/16 v0, 0x64

    return v0
.end method

.method public getColorFilter()Landroid/graphics/ColorFilter;
    .registers 2

    .prologue
    .line 801
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getColorFilter()Landroid/graphics/ColorFilter;

    move-result-object v0

    return-object v0
.end method

.method public getComment()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 374
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getComment()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCornerRadius()F
    .registers 2
    .annotation build Landroid/support/annotation/FloatRange;
        from = 0.0
    .end annotation

    .prologue
    .line 950
    iget v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mCornerRadius:F

    return v0
.end method

.method public getCurrentFrame()Landroid/graphics/Bitmap;
    .registers 4

    .prologue
    .line 810
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mBuffer:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mBuffer:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v1

    iget-object v2, p0, Lpl/droidsonroids/gif/GifDrawable;->mBuffer:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->isMutable()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentFrameIndex()I
    .registers 2

    .prologue
    .line 888
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getCurrentFrameIndex()I

    move-result v0

    return v0
.end method

.method public getCurrentLoop()I
    .registers 3

    .prologue
    .line 898
    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getCurrentLoop()I

    move-result v0

    .line 899
    .local v0, "currentLoop":I
    if-eqz v0, :cond_10

    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getLoopCount()I

    move-result v1

    if-ge v0, v1, :cond_11

    .line 902
    .end local v0    # "currentLoop":I
    :cond_10
    :goto_10
    return v0

    .restart local v0    # "currentLoop":I
    :cond_11
    add-int/lit8 v0, v0, -0x1

    goto :goto_10
.end method

.method public getCurrentPosition()I
    .registers 2

    .prologue
    .line 481
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getCurrentPosition()I

    move-result v0

    return v0
.end method

.method public getDuration()I
    .registers 2

    .prologue
    .line 470
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getDuration()I

    move-result v0

    return v0
.end method

.method public getError()Lpl/droidsonroids/gif/GifError;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 419
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getNativeErrorCode()I

    move-result v0

    invoke-static {v0}, Lpl/droidsonroids/gif/GifError;->fromCode(I)Lpl/droidsonroids/gif/GifError;

    move-result-object v0

    return-object v0
.end method

.method public getFrameByteCount()I
    .registers 3

    .prologue
    .line 641
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mBuffer:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result v0

    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mBuffer:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    mul-int/2addr v0, v1

    return v0
.end method

.method public getFrameDuration(I)I
    .registers 3
    .param p1, "index"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param

    .prologue
    .line 924
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v0, p1}, Lpl/droidsonroids/gif/GifInfoHandle;->getFrameDuration(I)I

    move-result v0

    return v0
.end method

.method public getInputSourceByteCount()J
    .registers 3

    .prologue
    .line 670
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getSourceLength()J

    move-result-wide v0

    return-wide v0
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .prologue
    .line 268
    iget v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mScaledHeight:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .prologue
    .line 273
    iget v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mScaledWidth:I

    return v0
.end method

.method public getLoopCount()I
    .registers 2

    .prologue
    .line 384
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getLoopCount()I

    move-result v0

    return v0
.end method

.method public getNumberOfFrames()I
    .registers 2

    .prologue
    .line 409
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getNumberOfFrames()I

    move-result v0

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 293
    const/4 v0, -0x2

    return v0
.end method

.method public final getPaint()Landroid/graphics/Paint;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 757
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mPaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method public getPixel(II)I
    .registers 5
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 695
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getWidth()I

    move-result v0

    if-lt p1, v0, :cond_10

    .line 696
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "x must be < width"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 698
    :cond_10
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getHeight()I

    move-result v0

    if-lt p2, v0, :cond_20

    .line 699
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "y must be < height"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 701
    :cond_20
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mBuffer:Landroid/graphics/Bitmap;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v0

    return v0
.end method

.method public getPixels([I)V
    .registers 10
    .param p1, "pixels"    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x0

    .line 680
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mBuffer:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getWidth()I

    move-result v3

    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getWidth()I

    move-result v6

    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getHeight()I

    move-result v7

    move-object v1, p1

    move v4, v2

    move v5, v2

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 681
    return-void
.end method

.method public isAnimationCompleted()Z
    .registers 2

    .prologue
    .line 912
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->isAnimationCompleted()Z

    move-result v0

    return v0
.end method

.method public isPlaying()Z
    .registers 2

    .prologue
    .line 577
    iget-boolean v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mIsRunning:Z

    return v0
.end method

.method public isRecycled()Z
    .registers 2

    .prologue
    .line 263
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->isRecycled()Z

    move-result v0

    return v0
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 364
    iget-boolean v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mIsRunning:Z

    return v0
.end method

.method public isStateful()Z
    .registers 2

    .prologue
    .line 847
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    if-nez v0, :cond_12

    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mTint:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mTint:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_12
    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .registers 7
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 706
    iget-object v2, p0, Lpl/droidsonroids/gif/GifDrawable;->mDstRect:Landroid/graphics/Rect;

    invoke-virtual {v2, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 707
    iget-object v2, p0, Lpl/droidsonroids/gif/GifDrawable;->mDstRectF:Landroid/graphics/RectF;

    iget-object v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mDstRect:Landroid/graphics/Rect;

    invoke-virtual {v2, v3}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 709
    iget-object v2, p0, Lpl/droidsonroids/gif/GifDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v2}, Landroid/graphics/Paint;->getShader()Landroid/graphics/Shader;

    move-result-object v0

    .line 710
    .local v0, "shader":Landroid/graphics/Shader;
    if-eqz v0, :cond_4b

    .line 711
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 712
    .local v1, "shaderMatrix":Landroid/graphics/Matrix;
    iget-object v2, p0, Lpl/droidsonroids/gif/GifDrawable;->mDstRectF:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    iget-object v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mDstRectF:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 713
    iget-object v2, p0, Lpl/droidsonroids/gif/GifDrawable;->mDstRectF:Landroid/graphics/RectF;

    .line 714
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    iget-object v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mBuffer:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v2, v3

    iget-object v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mDstRectF:Landroid/graphics/RectF;

    .line 715
    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    iget-object v4, p0, Lpl/droidsonroids/gif/GifDrawable;->mBuffer:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    .line 713
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 716
    invoke-virtual {v0, v1}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 717
    iget-object v2, p0, Lpl/droidsonroids/gif/GifDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 719
    .end local v1    # "shaderMatrix":Landroid/graphics/Matrix;
    :cond_4b
    return-void
.end method

.method protected onStateChange([I)Z
    .registers 4
    .param p1, "stateSet"    # [I

    .prologue
    .line 838
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mTint:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    if-eqz v0, :cond_14

    .line 839
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mTint:Landroid/content/res/ColorStateList;

    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p0, v0, v1}, Lpl/droidsonroids/gif/GifDrawable;->updateTintFilter(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v0

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mTintFilter:Landroid/graphics/PorterDuffColorFilter;

    .line 840
    const/4 v0, 0x1

    .line 842
    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public pause()V
    .registers 1

    .prologue
    .line 457
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawable;->stop()V

    .line 458
    return-void
.end method

.method public recycle()V
    .registers 2

    .prologue
    .line 249
    invoke-direct {p0}, Lpl/droidsonroids/gif/GifDrawable;->shutdown()V

    .line 250
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mBuffer:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 251
    return-void
.end method

.method public removeAnimationListener(Lpl/droidsonroids/gif/AnimationListener;)Z
    .registers 3
    .param p1, "listener"    # Lpl/droidsonroids/gif/AnimationListener;

    .prologue
    .line 796
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mListeners:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public reset()V
    .registers 3

    .prologue
    .line 328
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    new-instance v1, Lpl/droidsonroids/gif/GifDrawable$1;

    invoke-direct {v1, p0, p0}, Lpl/droidsonroids/gif/GifDrawable$1;-><init>(Lpl/droidsonroids/gif/GifDrawable;Lpl/droidsonroids/gif/GifDrawable;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 336
    return-void
.end method

.method public seekTo(I)V
    .registers 4
    .param p1, "position"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
            to = 0x7fffffffL
        .end annotation
    .end param

    .prologue
    .line 498
    if-gez p1, :cond_a

    .line 499
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Position is not positive"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 501
    :cond_a
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    new-instance v1, Lpl/droidsonroids/gif/GifDrawable$2;

    invoke-direct {v1, p0, p0, p1}, Lpl/droidsonroids/gif/GifDrawable$2;-><init>(Lpl/droidsonroids/gif/GifDrawable;Lpl/droidsonroids/gif/GifDrawable;I)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 508
    return-void
.end method

.method public seekToFrame(I)V
    .registers 4
    .param p1, "frameIndex"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
            to = 0x7fffffffL
        .end annotation
    .end param

    .prologue
    .line 518
    if-gez p1, :cond_a

    .line 519
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "Frame index is not positive"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 521
    :cond_a
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    new-instance v1, Lpl/droidsonroids/gif/GifDrawable$3;

    invoke-direct {v1, p0, p0, p1}, Lpl/droidsonroids/gif/GifDrawable$3;-><init>(Lpl/droidsonroids/gif/GifDrawable;Lpl/droidsonroids/gif/GifDrawable;I)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 528
    return-void
.end method

.method public seekToFrameAndGet(I)Landroid/graphics/Bitmap;
    .registers 7
    .param p1, "frameIndex"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
            to = 0x7fffffffL
        .end annotation
    .end param

    .prologue
    .line 538
    if-gez p1, :cond_a

    .line 539
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    const-string v2, "Frame index is not positive"

    invoke-direct {v1, v2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 542
    :cond_a
    iget-object v2, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    monitor-enter v2

    .line 543
    :try_start_d
    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    iget-object v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mBuffer:Landroid/graphics/Bitmap;

    invoke-virtual {v1, p1, v3}, Lpl/droidsonroids/gif/GifInfoHandle;->seekToFrame(ILandroid/graphics/Bitmap;)V

    .line 544
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawable;->getCurrentFrame()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 545
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    monitor-exit v2
    :try_end_19
    .catchall {:try_start_d .. :try_end_19} :catchall_22

    .line 546
    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mInvalidationHandler:Lpl/droidsonroids/gif/InvalidationHandler;

    const/4 v2, -0x1

    const-wide/16 v3, 0x0

    invoke-virtual {v1, v2, v3, v4}, Lpl/droidsonroids/gif/InvalidationHandler;->sendEmptyMessageAtTime(IJ)Z

    .line 547
    return-object v0

    .line 545
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :catchall_22
    move-exception v1

    :try_start_23
    monitor-exit v2
    :try_end_24
    .catchall {:try_start_23 .. :try_end_24} :catchall_22

    throw v1
.end method

.method public seekToPositionAndGet(I)Landroid/graphics/Bitmap;
    .registers 7
    .param p1, "position"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
            to = 0x7fffffffL
        .end annotation
    .end param

    .prologue
    .line 558
    if-gez p1, :cond_a

    .line 559
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Position is not positive"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 562
    :cond_a
    iget-object v2, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    monitor-enter v2

    .line 563
    :try_start_d
    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    iget-object v3, p0, Lpl/droidsonroids/gif/GifDrawable;->mBuffer:Landroid/graphics/Bitmap;

    invoke-virtual {v1, p1, v3}, Lpl/droidsonroids/gif/GifInfoHandle;->seekToTime(ILandroid/graphics/Bitmap;)V

    .line 564
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawable;->getCurrentFrame()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 565
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    monitor-exit v2
    :try_end_19
    .catchall {:try_start_d .. :try_end_19} :catchall_22

    .line 566
    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mInvalidationHandler:Lpl/droidsonroids/gif/InvalidationHandler;

    const/4 v2, -0x1

    const-wide/16 v3, 0x0

    invoke-virtual {v1, v2, v3, v4}, Lpl/droidsonroids/gif/InvalidationHandler;->sendEmptyMessageAtTime(IJ)Z

    .line 567
    return-object v0

    .line 565
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :catchall_22
    move-exception v1

    :try_start_23
    monitor-exit v2
    :try_end_24
    .catchall {:try_start_23 .. :try_end_24} :catchall_22

    throw v1
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
            to = 0xffL
        .end annotation
    .end param

    .prologue
    .line 278
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 279
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 283
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 284
    return-void
.end method

.method public setCornerRadius(F)V
    .registers 6
    .param p1, "cornerRadius"    # F
        .annotation build Landroid/support/annotation/FloatRange;
            from = 0.0
        .end annotation
    .end param

    .prologue
    .line 934
    iput p1, p0, Lpl/droidsonroids/gif/GifDrawable;->mCornerRadius:F

    .line 936
    const/4 v1, 0x0

    cmpl-float v1, p1, v1

    if-lez v1, :cond_18

    .line 937
    new-instance v0, Landroid/graphics/BitmapShader;

    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mBuffer:Landroid/graphics/Bitmap;

    sget-object v2, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v3, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v0, v1, v2, v3}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 941
    .local v0, "bitmapShader":Landroid/graphics/Shader;
    :goto_12
    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 942
    return-void

    .line 939
    .end local v0    # "bitmapShader":Landroid/graphics/Shader;
    :cond_18
    const/4 v0, 0x0

    .restart local v0    # "bitmapShader":Landroid/graphics/Shader;
    goto :goto_12
.end method

.method public setDither(Z)V
    .registers 3
    .param p1, "dither"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 775
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 776
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawable;->invalidateSelf()V

    .line 777
    return-void
.end method

.method public setFilterBitmap(Z)V
    .registers 3
    .param p1, "filter"    # Z

    .prologue
    .line 767
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 768
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawable;->invalidateSelf()V

    .line 769
    return-void
.end method

.method public setLoopCount(I)V
    .registers 3
    .param p1, "loopCount"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
            to = 0xffffL
        .end annotation
    .end param

    .prologue
    .line 393
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v0, p1}, Lpl/droidsonroids/gif/GifInfoHandle;->setLoopCount(I)V

    .line 394
    return-void
.end method

.method public setSpeed(F)V
    .registers 3
    .param p1, "factor"    # F
        .annotation build Landroid/support/annotation/FloatRange;
            from = 0.0
            fromInclusive = false
        .end annotation
    .end param

    .prologue
    .line 449
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v0, p1}, Lpl/droidsonroids/gif/GifInfoHandle;->setSpeedFactor(F)V

    .line 450
    return-void
.end method

.method public setTintList(Landroid/content/res/ColorStateList;)V
    .registers 3
    .param p1, "tint"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 824
    iput-object p1, p0, Lpl/droidsonroids/gif/GifDrawable;->mTint:Landroid/content/res/ColorStateList;

    .line 825
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p0, p1, v0}, Lpl/droidsonroids/gif/GifDrawable;->updateTintFilter(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v0

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mTintFilter:Landroid/graphics/PorterDuffColorFilter;

    .line 826
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawable;->invalidateSelf()V

    .line 827
    return-void
.end method

.method public setTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3
    .param p1, "tintMode"    # Landroid/graphics/PorterDuff$Mode;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 831
    iput-object p1, p0, Lpl/droidsonroids/gif/GifDrawable;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    .line 832
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mTint:Landroid/content/res/ColorStateList;

    invoke-direct {p0, v0, p1}, Lpl/droidsonroids/gif/GifDrawable;->updateTintFilter(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v0

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mTintFilter:Landroid/graphics/PorterDuffColorFilter;

    .line 833
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawable;->invalidateSelf()V

    .line 834
    return-void
.end method

.method public setVisible(ZZ)Z
    .registers 5
    .param p1, "visible"    # Z
    .param p2, "restart"    # Z

    .prologue
    .line 866
    invoke-super {p0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result v0

    .line 867
    .local v0, "changed":Z
    iget-boolean v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mIsRenderingTriggeredOnDraw:Z

    if-nez v1, :cond_14

    .line 868
    if-eqz p1, :cond_15

    .line 869
    if-eqz p2, :cond_f

    .line 870
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawable;->reset()V

    .line 872
    :cond_f
    if-eqz v0, :cond_14

    .line 873
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawable;->start()V

    .line 879
    :cond_14
    :goto_14
    return v0

    .line 875
    :cond_15
    if-eqz v0, :cond_14

    .line 876
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDrawable;->stop()V

    goto :goto_14
.end method

.method public start()V
    .registers 4

    .prologue
    .line 302
    monitor-enter p0

    .line 303
    :try_start_1
    iget-boolean v2, p0, Lpl/droidsonroids/gif/GifDrawable;->mIsRunning:Z

    if-eqz v2, :cond_7

    .line 304
    monitor-exit p0

    .line 310
    :goto_6
    return-void

    .line 306
    :cond_7
    const/4 v2, 0x1

    iput-boolean v2, p0, Lpl/droidsonroids/gif/GifDrawable;->mIsRunning:Z

    .line 307
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_15

    .line 308
    iget-object v2, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v2}, Lpl/droidsonroids/gif/GifInfoHandle;->restoreRemainder()J

    move-result-wide v0

    .line 309
    .local v0, "lastFrameRemainder":J
    invoke-virtual {p0, v0, v1}, Lpl/droidsonroids/gif/GifDrawable;->startAnimation(J)V

    goto :goto_6

    .line 307
    .end local v0    # "lastFrameRemainder":J
    :catchall_15
    move-exception v2

    :try_start_16
    monitor-exit p0
    :try_end_17
    .catchall {:try_start_16 .. :try_end_17} :catchall_15

    throw v2
.end method

.method startAnimation(J)V
    .registers 8
    .param p1, "lastFrameRemainder"    # J

    .prologue
    const-wide/16 v2, 0x0

    .line 313
    iget-boolean v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mIsRenderingTriggeredOnDraw:Z

    if-eqz v0, :cond_f

    .line 314
    iput-wide v2, p0, Lpl/droidsonroids/gif/GifDrawable;->mNextFrameRenderTime:J

    .line 315
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mInvalidationHandler:Lpl/droidsonroids/gif/InvalidationHandler;

    const/4 v1, -0x1

    invoke-virtual {v0, v1, v2, v3}, Lpl/droidsonroids/gif/InvalidationHandler;->sendEmptyMessageAtTime(IJ)Z

    .line 320
    :goto_e
    return-void

    .line 317
    :cond_f
    invoke-direct {p0}, Lpl/droidsonroids/gif/GifDrawable;->waitForPendingRenderTask()V

    .line 318
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawable;->mRenderTask:Lpl/droidsonroids/gif/RenderTask;

    invoke-static {p1, p2, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3, v4}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mSchedule:Ljava/util/concurrent/ScheduledFuture;

    goto :goto_e
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 344
    monitor-enter p0

    .line 345
    :try_start_1
    iget-boolean v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mIsRunning:Z

    if-nez v0, :cond_7

    .line 346
    monitor-exit p0

    .line 353
    :goto_6
    return-void

    .line 348
    :cond_7
    const/4 v0, 0x0

    iput-boolean v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mIsRunning:Z

    .line 349
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_14

    .line 351
    invoke-direct {p0}, Lpl/droidsonroids/gif/GifDrawable;->waitForPendingRenderTask()V

    .line 352
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->saveRemainder()V

    goto :goto_6

    .line 349
    :catchall_14
    move-exception v0

    :try_start_15
    monitor-exit p0
    :try_end_16
    .catchall {:try_start_15 .. :try_end_16} :catchall_14

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 401
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v1, "GIF: size: %dx%d, frames: %d, error: %d"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 402
    invoke-virtual {v4}, Lpl/droidsonroids/gif/GifInfoHandle;->getWidth()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v4}, Lpl/droidsonroids/gif/GifInfoHandle;->getHeight()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    iget-object v4, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v4}, Lpl/droidsonroids/gif/GifInfoHandle;->getNumberOfFrames()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x3

    iget-object v4, p0, Lpl/droidsonroids/gif/GifDrawable;->mNativeInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v4}, Lpl/droidsonroids/gif/GifInfoHandle;->getNativeErrorCode()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    .line 401
    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
