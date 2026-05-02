.class public Lpl/droidsonroids/gif/GifDrawableBuilder;
.super Ljava/lang/Object;
.source "GifDrawableBuilder.java"


# instance fields
.field private mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

.field private mInputSource:Lpl/droidsonroids/gif/InputSource;

.field private mIsRenderingTriggeredOnDraw:Z

.field private mOldDrawable:Lpl/droidsonroids/gif/GifDrawable;

.field private mSampleSize:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput v0, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mSampleSize:I

    .line 42
    iput-boolean v0, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mIsRenderingTriggeredOnDraw:Z

    .line 37
    return-void
.end method


# virtual methods
.method public build()Lpl/droidsonroids/gif/GifDrawable;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    if-nez v0, :cond_c

    .line 68
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Source is not set"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 70
    :cond_c
    iget-object v0, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    iget-object v1, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mOldDrawable:Lpl/droidsonroids/gif/GifDrawable;

    iget-object v2, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    iget-boolean v3, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mIsRenderingTriggeredOnDraw:Z

    iget v4, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mSampleSize:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lpl/droidsonroids/gif/InputSource;->build(Lpl/droidsonroids/gif/GifDrawable;Ljava/util/concurrent/ScheduledThreadPoolExecutor;ZI)Lpl/droidsonroids/gif/GifDrawable;

    move-result-object v0

    return-object v0
.end method

.method public from(Landroid/content/ContentResolver;Landroid/net/Uri;)Lpl/droidsonroids/gif/GifDrawableBuilder;
    .registers 4
    .param p1, "contentResolver"    # Landroid/content/ContentResolver;
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 180
    new-instance v0, Lpl/droidsonroids/gif/InputSource$UriSource;

    invoke-direct {v0, p1, p2}, Lpl/droidsonroids/gif/InputSource$UriSource;-><init>(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 181
    return-object p0
.end method

.method public from(Landroid/content/res/AssetFileDescriptor;)Lpl/droidsonroids/gif/GifDrawableBuilder;
    .registers 3
    .param p1, "assetFileDescriptor"    # Landroid/content/res/AssetFileDescriptor;

    .prologue
    .line 145
    new-instance v0, Lpl/droidsonroids/gif/InputSource$AssetFileDescriptorSource;

    invoke-direct {v0, p1}, Lpl/droidsonroids/gif/InputSource$AssetFileDescriptorSource;-><init>(Landroid/content/res/AssetFileDescriptor;)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 146
    return-object p0
.end method

.method public from(Landroid/content/res/AssetManager;Ljava/lang/String;)Lpl/droidsonroids/gif/GifDrawableBuilder;
    .registers 4
    .param p1, "assetManager"    # Landroid/content/res/AssetManager;
    .param p2, "assetName"    # Ljava/lang/String;

    .prologue
    .line 168
    new-instance v0, Lpl/droidsonroids/gif/InputSource$AssetSource;

    invoke-direct {v0, p1, p2}, Lpl/droidsonroids/gif/InputSource$AssetSource;-><init>(Landroid/content/res/AssetManager;Ljava/lang/String;)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 169
    return-object p0
.end method

.method public from(Landroid/content/res/Resources;I)Lpl/droidsonroids/gif/GifDrawableBuilder;
    .registers 4
    .param p1, "resources"    # Landroid/content/res/Resources;
    .param p2, "resourceId"    # I

    .prologue
    .line 236
    new-instance v0, Lpl/droidsonroids/gif/InputSource$ResourcesSource;

    invoke-direct {v0, p1, p2}, Lpl/droidsonroids/gif/InputSource$ResourcesSource;-><init>(Landroid/content/res/Resources;I)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 237
    return-object p0
.end method

.method public from(Ljava/io/File;)Lpl/droidsonroids/gif/GifDrawableBuilder;
    .registers 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 191
    new-instance v0, Lpl/droidsonroids/gif/InputSource$FileSource;

    invoke-direct {v0, p1}, Lpl/droidsonroids/gif/InputSource$FileSource;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 192
    return-object p0
.end method

.method public from(Ljava/io/FileDescriptor;)Lpl/droidsonroids/gif/GifDrawableBuilder;
    .registers 3
    .param p1, "fileDescriptor"    # Ljava/io/FileDescriptor;

    .prologue
    .line 156
    new-instance v0, Lpl/droidsonroids/gif/InputSource$FileDescriptorSource;

    invoke-direct {v0, p1}, Lpl/droidsonroids/gif/InputSource$FileDescriptorSource;-><init>(Ljava/io/FileDescriptor;)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 157
    return-object p0
.end method

.method public from(Ljava/io/InputStream;)Lpl/droidsonroids/gif/GifDrawableBuilder;
    .registers 3
    .param p1, "inputStream"    # Ljava/io/InputStream;

    .prologue
    .line 134
    new-instance v0, Lpl/droidsonroids/gif/InputSource$InputStreamSource;

    invoke-direct {v0, p1}, Lpl/droidsonroids/gif/InputSource$InputStreamSource;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 135
    return-object p0
.end method

.method public from(Ljava/lang/String;)Lpl/droidsonroids/gif/GifDrawableBuilder;
    .registers 3
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 202
    new-instance v0, Lpl/droidsonroids/gif/InputSource$FileSource;

    invoke-direct {v0, p1}, Lpl/droidsonroids/gif/InputSource$FileSource;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 203
    return-object p0
.end method

.method public from(Ljava/nio/ByteBuffer;)Lpl/droidsonroids/gif/GifDrawableBuilder;
    .registers 3
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 224
    new-instance v0, Lpl/droidsonroids/gif/InputSource$DirectByteBufferSource;

    invoke-direct {v0, p1}, Lpl/droidsonroids/gif/InputSource$DirectByteBufferSource;-><init>(Ljava/nio/ByteBuffer;)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 225
    return-object p0
.end method

.method public from([B)Lpl/droidsonroids/gif/GifDrawableBuilder;
    .registers 3
    .param p1, "bytes"    # [B

    .prologue
    .line 213
    new-instance v0, Lpl/droidsonroids/gif/InputSource$ByteArraySource;

    invoke-direct {v0, p1}, Lpl/droidsonroids/gif/InputSource$ByteArraySource;-><init>([B)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 214
    return-object p0
.end method

.method public sampleSize(I)V
    .registers 2
    .param p1, "sampleSize"    # I

    .prologue
    .line 57
    iput p1, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mSampleSize:I

    .line 58
    return-void
.end method

.method public setRenderingTriggeredOnDraw(Z)Lpl/droidsonroids/gif/GifDrawableBuilder;
    .registers 2
    .param p1, "isRenderingTriggeredOnDraw"    # Z

    .prologue
    .line 123
    iput-boolean p1, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mIsRenderingTriggeredOnDraw:Z

    .line 124
    return-object p0
.end method

.method public taskExecutor(Ljava/util/concurrent/ScheduledThreadPoolExecutor;)Lpl/droidsonroids/gif/GifDrawableBuilder;
    .registers 2
    .param p1, "executor"    # Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .prologue
    .line 105
    iput-object p1, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 106
    return-object p0
.end method

.method public threadPoolSize(I)Lpl/droidsonroids/gif/GifDrawableBuilder;
    .registers 3
    .param p1, "threadPoolSize"    # I

    .prologue
    .line 93
    new-instance v0, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-direct {v0, p1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(I)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 94
    return-object p0
.end method

.method public with(Lpl/droidsonroids/gif/GifDrawable;)Lpl/droidsonroids/gif/GifDrawableBuilder;
    .registers 2
    .param p1, "drawable"    # Lpl/droidsonroids/gif/GifDrawable;

    .prologue
    .line 80
    iput-object p1, p0, Lpl/droidsonroids/gif/GifDrawableBuilder;->mOldDrawable:Lpl/droidsonroids/gif/GifDrawable;

    .line 81
    return-object p0
.end method
