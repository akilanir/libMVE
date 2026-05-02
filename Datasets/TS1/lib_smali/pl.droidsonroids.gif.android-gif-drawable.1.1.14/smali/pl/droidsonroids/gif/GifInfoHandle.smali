.class final Lpl/droidsonroids/gif/GifInfoHandle;
.super Ljava/lang/Object;
.source "GifInfoHandle.java"


# static fields
.field static final NULL_INFO:Lpl/droidsonroids/gif/GifInfoHandle;


# instance fields
.field private volatile gifInfoPtr:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 27
    new-instance v0, Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-direct {v0}, Lpl/droidsonroids/gif/GifInfoHandle;-><init>()V

    sput-object v0, Lpl/droidsonroids/gif/GifInfoHandle;->NULL_INFO:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 30
    const/4 v0, 0x0

    const-string v1, "pl_droidsonroids_gif"

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/LibraryLoader;->loadLibrary(Landroid/content/Context;Ljava/lang/String;)V

    .line 31
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method constructor <init>(Landroid/content/res/AssetFileDescriptor;Z)V
    .registers 6
    .param p1, "afd"    # Landroid/content/res/AssetFileDescriptor;
    .param p2, "justDecodeMetaData"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    :try_start_3
    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v1

    invoke-static {v0, v1, v2, p2}, Lpl/droidsonroids/gif/GifInfoHandle;->openFd(Ljava/io/FileDescriptor;JZ)J

    move-result-wide v0

    iput-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_15

    .line 129
    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->close()V

    .line 131
    return-void

    .line 129
    :catchall_15
    move-exception v0

    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->close()V

    throw v0
.end method

.method constructor <init>(Ljava/io/FileDescriptor;JZ)V
    .registers 7
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "offset"    # J
    .param p4, "justDecodeMetaData"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lpl/droidsonroids/gif/GifIOException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    invoke-static {p1, p2, p3, p4}, Lpl/droidsonroids/gif/GifInfoHandle;->openFd(Ljava/io/FileDescriptor;JZ)J

    move-result-wide v0

    iput-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    .line 38
    return-void
.end method

.method constructor <init>(Ljava/io/InputStream;Z)V
    .registers 5
    .param p1, "stream"    # Ljava/io/InputStream;
    .param p2, "justDecodeMetaData"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lpl/droidsonroids/gif/GifIOException;
        }
    .end annotation

    .prologue
    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    invoke-virtual {p1}, Ljava/io/InputStream;->markSupported()Z

    move-result v0

    if-nez v0, :cond_11

    .line 120
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "InputStream does not support marking"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 122
    :cond_11
    invoke-static {p1, p2}, Lpl/droidsonroids/gif/GifInfoHandle;->openStream(Ljava/io/InputStream;Z)J

    move-result-wide v0

    iput-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    .line 123
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Z)V
    .registers 5
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "justDecodeMetaData"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lpl/droidsonroids/gif/GifIOException;
        }
    .end annotation

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    invoke-static {p1, p2}, Lpl/droidsonroids/gif/GifInfoHandle;->openFile(Ljava/lang/String;Z)J

    move-result-wide v0

    iput-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    .line 50
    return-void
.end method

.method constructor <init>(Ljava/nio/ByteBuffer;Z)V
    .registers 5
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "justDecodeMetaData"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lpl/droidsonroids/gif/GifIOException;
        }
    .end annotation

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    invoke-static {p1, p2}, Lpl/droidsonroids/gif/GifInfoHandle;->openDirectByteBuffer(Ljava/nio/ByteBuffer;Z)J

    move-result-wide v0

    iput-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    .line 46
    return-void
.end method

.method constructor <init>([BZ)V
    .registers 5
    .param p1, "bytes"    # [B
    .param p2, "justDecodeMetaData"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lpl/droidsonroids/gif/GifIOException;
        }
    .end annotation

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    invoke-static {p1, p2}, Lpl/droidsonroids/gif/GifInfoHandle;->openByteArray([BZ)J

    move-result-wide v0

    iput-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    .line 42
    return-void
.end method

.method private static native bindSurface(JLandroid/view/Surface;[JZ)V
.end method

.method private static native free(J)V
.end method

.method private static native getAllocationByteCount(J)J
.end method

.method private static native getComment(J)Ljava/lang/String;
.end method

.method private static native getCurrentFrameIndex(J)I
.end method

.method private static native getCurrentLoop(J)I
.end method

.method private static native getCurrentPosition(J)I
.end method

.method private static native getDuration(J)I
.end method

.method private static native getFrameDuration(JI)I
.end method

.method private static native getHeight(J)I
.end method

.method private static native getLoopCount(J)I
.end method

.method private static native getNativeErrorCode(J)I
.end method

.method private static native getNumberOfFrames(J)I
.end method

.method private static native getSavedState(J)[J
.end method

.method private static native getSourceLength(J)J
.end method

.method private static native getWidth(J)I
.end method

.method private static native isAnimationCompleted(J)Z
.end method

.method static native openByteArray([BZ)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lpl/droidsonroids/gif/GifIOException;
        }
    .end annotation
.end method

.method static native openDirectByteBuffer(Ljava/nio/ByteBuffer;Z)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lpl/droidsonroids/gif/GifIOException;
        }
    .end annotation
.end method

.method static native openFd(Ljava/io/FileDescriptor;JZ)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lpl/droidsonroids/gif/GifIOException;
        }
    .end annotation
.end method

.method static native openFile(Ljava/lang/String;Z)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lpl/droidsonroids/gif/GifIOException;
        }
    .end annotation
.end method

.method static native openStream(Ljava/io/InputStream;Z)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lpl/droidsonroids/gif/GifIOException;
        }
    .end annotation
.end method

.method static openUri(Landroid/content/ContentResolver;Landroid/net/Uri;Z)Lpl/droidsonroids/gif/GifInfoHandle;
    .registers 5
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "justDecodeMetaData"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 134
    const-string v0, "file"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 135
    new-instance v0, Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Lpl/droidsonroids/gif/GifInfoHandle;-><init>(Ljava/lang/String;Z)V

    .line 137
    :goto_15
    return-object v0

    :cond_16
    new-instance v0, Lpl/droidsonroids/gif/GifInfoHandle;

    const-string v1, "r"

    invoke-virtual {p0, p1, v1}, Landroid/content/ContentResolver;->openAssetFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Lpl/droidsonroids/gif/GifInfoHandle;-><init>(Landroid/content/res/AssetFileDescriptor;Z)V

    goto :goto_15
.end method

.method private static native postUnbindSurface(J)V
.end method

.method private static native renderFrame(JLandroid/graphics/Bitmap;)J
.end method

.method private static native reset(J)Z
.end method

.method private static native restoreRemainder(J)J
.end method

.method private static native restoreSavedState(J[JLandroid/graphics/Bitmap;)I
.end method

.method private static native saveRemainder(J)V
.end method

.method private static native seekToFrame(JILandroid/graphics/Bitmap;)V
.end method

.method private static native seekToTime(JILandroid/graphics/Bitmap;)V
.end method

.method private static native setLoopCount(JI)V
.end method

.method private static native setSampleSize(JI)I
.end method

.method private static native setSpeedFactor(JF)V
.end method


# virtual methods
.method bindSurface(Landroid/view/Surface;[JZ)V
    .registers 6
    .param p1, "surface"    # Landroid/view/Surface;
    .param p2, "savedState"    # [J
    .param p3, "isOpaque"    # Z

    .prologue
    .line 145
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1, p1, p2, p3}, Lpl/droidsonroids/gif/GifInfoHandle;->bindSurface(JLandroid/view/Surface;[JZ)V

    .line 146
    return-void
.end method

.method protected finalize()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 237
    :try_start_0
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifInfoHandle;->recycle()V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_7

    .line 239
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 241
    return-void

    .line 239
    :catchall_7
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method declared-synchronized getAllocationByteCount()J
    .registers 3

    .prologue
    .line 227
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getAllocationByteCount(J)J
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result-wide v0

    monitor-exit p0

    return-wide v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getComment()Ljava/lang/String;
    .registers 3

    .prologue
    .line 166
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getComment(J)Ljava/lang/String;
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getCurrentFrameIndex()I
    .registers 3

    .prologue
    .line 211
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getCurrentFrameIndex(J)I
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getCurrentLoop()I
    .registers 3

    .prologue
    .line 215
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getCurrentLoop(J)I
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getCurrentPosition()I
    .registers 3

    .prologue
    .line 207
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getCurrentPosition(J)I
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getDuration()I
    .registers 3

    .prologue
    .line 203
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getDuration(J)I
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method getFrameDuration(I)I
    .registers 4
    .param p1, "index"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param

    .prologue
    .line 260
    monitor-enter p0

    .line 261
    if-ltz p1, :cond_b

    :try_start_3
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getNumberOfFrames(J)I

    move-result v0

    if-lt p1, v0, :cond_16

    .line 262
    :cond_b
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "Frame index is out of bounds"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 265
    :catchall_13
    move-exception v0

    monitor-exit p0
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_13

    throw v0

    .line 264
    :cond_16
    :try_start_16
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1, p1}, Lpl/droidsonroids/gif/GifInfoHandle;->getFrameDuration(JI)I

    move-result v0

    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_16 .. :try_end_1d} :catchall_13

    return v0
.end method

.method declared-synchronized getHeight()I
    .registers 3

    .prologue
    .line 277
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getHeight(J)I
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getLoopCount()I
    .registers 3

    .prologue
    .line 170
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getLoopCount(J)I
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getNativeErrorCode()I
    .registers 3

    .prologue
    .line 187
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getNativeErrorCode(J)I
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getNumberOfFrames()I
    .registers 3

    .prologue
    .line 281
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getNumberOfFrames(J)I
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getSavedState()[J
    .registers 3

    .prologue
    .line 252
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getSavedState(J)[J
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getSourceLength()J
    .registers 3

    .prologue
    .line 183
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getSourceLength(J)J
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result-wide v0

    monitor-exit p0

    return-wide v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getWidth()I
    .registers 3

    .prologue
    .line 273
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getWidth(J)I
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized isAnimationCompleted()Z
    .registers 3

    .prologue
    .line 248
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifInfoHandle;->isAnimationCompleted(J)Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized isRecycled()Z
    .registers 5

    .prologue
    .line 231
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_e

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_a
    monitor-exit p0

    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_a

    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized postUnbindSurface()V
    .registers 3

    .prologue
    .line 244
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifInfoHandle;->postUnbindSurface(J)V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 245
    monitor-exit p0

    return-void

    .line 244
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized recycle()V
    .registers 3

    .prologue
    .line 149
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifInfoHandle;->free(J)V

    .line 150
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 151
    monitor-exit p0

    return-void

    .line 149
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized renderFrame(Landroid/graphics/Bitmap;)J
    .registers 4
    .param p1, "frameBuffer"    # Landroid/graphics/Bitmap;

    .prologue
    .line 141
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1, p1}, Lpl/droidsonroids/gif/GifInfoHandle;->renderFrame(JLandroid/graphics/Bitmap;)J
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result-wide v0

    monitor-exit p0

    return-wide v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized reset()Z
    .registers 3

    .prologue
    .line 158
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifInfoHandle;->reset(J)Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized restoreRemainder()J
    .registers 3

    .prologue
    .line 154
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifInfoHandle;->restoreRemainder(J)J
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result-wide v0

    monitor-exit p0

    return-wide v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized restoreSavedState([JLandroid/graphics/Bitmap;)I
    .registers 5
    .param p1, "savedState"    # [J
    .param p2, "mBuffer"    # Landroid/graphics/Bitmap;

    .prologue
    .line 256
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1, p1, p2}, Lpl/droidsonroids/gif/GifInfoHandle;->restoreSavedState(J[JLandroid/graphics/Bitmap;)I
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized saveRemainder()V
    .registers 3

    .prologue
    .line 162
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1}, Lpl/droidsonroids/gif/GifInfoHandle;->saveRemainder(J)V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 163
    monitor-exit p0

    return-void

    .line 162
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized seekToFrame(ILandroid/graphics/Bitmap;)V
    .registers 5
    .param p1, "frameIndex"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
            to = 0x7fffffffL
        .end annotation
    .end param
    .param p2, "buffer"    # Landroid/graphics/Bitmap;

    .prologue
    .line 223
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1, p1, p2}, Lpl/droidsonroids/gif/GifInfoHandle;->seekToFrame(JILandroid/graphics/Bitmap;)V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 224
    monitor-exit p0

    return-void

    .line 223
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized seekToTime(ILandroid/graphics/Bitmap;)V
    .registers 5
    .param p1, "position"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
            to = 0x7fffffffL
        .end annotation
    .end param
    .param p2, "buffer"    # Landroid/graphics/Bitmap;

    .prologue
    .line 219
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1, p1, p2}, Lpl/droidsonroids/gif/GifInfoHandle;->seekToTime(JILandroid/graphics/Bitmap;)V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 220
    monitor-exit p0

    return-void

    .line 219
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method setLoopCount(I)V
    .registers 4
    .param p1, "loopCount"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
            to = 0xffffL
        .end annotation
    .end param

    .prologue
    .line 174
    if-ltz p1, :cond_7

    const v0, 0xffff

    if-le p1, v0, :cond_f

    .line 175
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Loop count of range <0, 65535>"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 177
    :cond_f
    monitor-enter p0

    .line 178
    :try_start_10
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1, p1}, Lpl/droidsonroids/gif/GifInfoHandle;->setLoopCount(JI)V

    .line 179
    monitor-exit p0

    .line 180
    return-void

    .line 179
    :catchall_17
    move-exception v0

    monitor-exit p0
    :try_end_19
    .catchall {:try_start_10 .. :try_end_19} :catchall_17

    throw v0
.end method

.method setSampleSize(I)V
    .registers 4
    .param p1, "sampleSize"    # I

    .prologue
    .line 269
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1, p1}, Lpl/droidsonroids/gif/GifInfoHandle;->setSampleSize(JI)I

    .line 270
    return-void
.end method

.method setSpeedFactor(F)V
    .registers 4
    .param p1, "factor"    # F
        .annotation build Landroid/support/annotation/FloatRange;
            from = 0.0
            fromInclusive = false
        .end annotation
    .end param

    .prologue
    .line 191
    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-lez v0, :cond_b

    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 192
    :cond_b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Speed factor is not positive"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 194
    :cond_13
    const/high16 v0, 0x30000000

    cmpg-float v0, p1, v0

    if-gez v0, :cond_1b

    .line 195
    const/high16 p1, 0x30000000

    .line 197
    :cond_1b
    monitor-enter p0

    .line 198
    :try_start_1c
    iget-wide v0, p0, Lpl/droidsonroids/gif/GifInfoHandle;->gifInfoPtr:J

    invoke-static {v0, v1, p1}, Lpl/droidsonroids/gif/GifInfoHandle;->setSpeedFactor(JF)V

    .line 199
    monitor-exit p0

    .line 200
    return-void

    .line 199
    :catchall_23
    move-exception v0

    monitor-exit p0
    :try_end_25
    .catchall {:try_start_1c .. :try_end_25} :catchall_23

    throw v0
.end method
