.class public abstract Lpl/droidsonroids/gif/InputSource;
.super Ljava/lang/Object;
.source "InputSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lpl/droidsonroids/gif/InputSource$AssetFileDescriptorSource;,
        Lpl/droidsonroids/gif/InputSource$ResourcesSource;,
        Lpl/droidsonroids/gif/InputSource$InputStreamSource;,
        Lpl/droidsonroids/gif/InputSource$FileDescriptorSource;,
        Lpl/droidsonroids/gif/InputSource$AssetSource;,
        Lpl/droidsonroids/gif/InputSource$UriSource;,
        Lpl/droidsonroids/gif/InputSource$FileSource;,
        Lpl/droidsonroids/gif/InputSource$ByteArraySource;,
        Lpl/droidsonroids/gif/InputSource$DirectByteBufferSource;
    }
.end annotation


# instance fields
.field private mIsOpaque:Z


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    return-void
.end method


# virtual methods
.method final build(Lpl/droidsonroids/gif/GifDrawable;Ljava/util/concurrent/ScheduledThreadPoolExecutor;ZI)Lpl/droidsonroids/gif/GifDrawable;
    .registers 7
    .param p1, "oldDrawable"    # Lpl/droidsonroids/gif/GifDrawable;
    .param p2, "executor"    # Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    .param p3, "isRenderingAlwaysEnabled"    # Z
    .param p4, "sampleSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 32
    invoke-virtual {p0}, Lpl/droidsonroids/gif/InputSource;->open()Lpl/droidsonroids/gif/GifInfoHandle;

    move-result-object v0

    .line 33
    .local v0, "handle":Lpl/droidsonroids/gif/GifInfoHandle;
    const/4 v1, 0x1

    if-le p4, v1, :cond_a

    .line 34
    invoke-virtual {v0, p4}, Lpl/droidsonroids/gif/GifInfoHandle;->setSampleSize(I)V

    .line 36
    :cond_a
    new-instance v1, Lpl/droidsonroids/gif/GifDrawable;

    invoke-direct {v1, v0, p1, p2, p3}, Lpl/droidsonroids/gif/GifDrawable;-><init>(Lpl/droidsonroids/gif/GifInfoHandle;Lpl/droidsonroids/gif/GifDrawable;Ljava/util/concurrent/ScheduledThreadPoolExecutor;Z)V

    return-object v1
.end method

.method final isOpaque()Z
    .registers 2

    .prologue
    .line 40
    iget-boolean v0, p0, Lpl/droidsonroids/gif/InputSource;->mIsOpaque:Z

    return v0
.end method

.method abstract open()Lpl/droidsonroids/gif/GifInfoHandle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method final setOpaque(Z)Lpl/droidsonroids/gif/InputSource;
    .registers 2
    .param p1, "isOpaque"    # Z

    .prologue
    .line 53
    iput-boolean p1, p0, Lpl/droidsonroids/gif/InputSource;->mIsOpaque:Z

    .line 54
    return-object p0
.end method
