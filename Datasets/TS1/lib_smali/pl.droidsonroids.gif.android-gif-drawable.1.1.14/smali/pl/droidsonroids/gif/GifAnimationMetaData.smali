.class public Lpl/droidsonroids/gif/GifAnimationMetaData;
.super Ljava/lang/Object;
.source "GifAnimationMetaData.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lpl/droidsonroids/gif/GifAnimationMetaData;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = 0x4eff56d4f010140dL


# instance fields
.field private final mDuration:I

.field private final mHeight:I

.field private final mImageCount:I

.field private final mLoopCount:I

.field private final mWidth:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 243
    new-instance v0, Lpl/droidsonroids/gif/GifAnimationMetaData$1;

    invoke-direct {v0}, Lpl/droidsonroids/gif/GifAnimationMetaData$1;-><init>()V

    sput-object v0, Lpl/droidsonroids/gif/GifAnimationMetaData;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    .registers 4
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
    .line 156
    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Lpl/droidsonroids/gif/GifInfoHandle;->openUri(Landroid/content/ContentResolver;Landroid/net/Uri;Z)Lpl/droidsonroids/gif/GifInfoHandle;

    move-result-object v0

    invoke-direct {p0, v0}, Lpl/droidsonroids/gif/GifAnimationMetaData;-><init>(Lpl/droidsonroids/gif/GifInfoHandle;)V

    .line 157
    return-void
.end method

.method public constructor <init>(Landroid/content/res/AssetFileDescriptor;)V
    .registers 4
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
    .line 108
    new-instance v0, Lpl/droidsonroids/gif/GifInfoHandle;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lpl/droidsonroids/gif/GifInfoHandle;-><init>(Landroid/content/res/AssetFileDescriptor;Z)V

    invoke-direct {p0, v0}, Lpl/droidsonroids/gif/GifAnimationMetaData;-><init>(Lpl/droidsonroids/gif/GifInfoHandle;)V

    .line 109
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
    .line 58
    invoke-virtual {p1, p2}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v0

    invoke-direct {p0, v0}, Lpl/droidsonroids/gif/GifAnimationMetaData;-><init>(Landroid/content/res/AssetFileDescriptor;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;I)V
    .registers 4
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
    .line 46
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->openRawResourceFd(I)Landroid/content/res/AssetFileDescriptor;

    move-result-object v0

    invoke-direct {p0, v0}, Lpl/droidsonroids/gif/GifAnimationMetaData;-><init>(Landroid/content/res/AssetFileDescriptor;)V

    .line 47
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 235
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 236
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mLoopCount:I

    .line 237
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mDuration:I

    .line 238
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mHeight:I

    .line 239
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mWidth:I

    .line 240
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mImageCount:I

    .line 241
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lpl/droidsonroids/gif/GifAnimationMetaData$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lpl/droidsonroids/gif/GifAnimationMetaData$1;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lpl/droidsonroids/gif/GifAnimationMetaData;-><init>(Landroid/os/Parcel;)V

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
    .line 83
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lpl/droidsonroids/gif/GifAnimationMetaData;-><init>(Ljava/lang/String;)V

    .line 84
    return-void
.end method

.method public constructor <init>(Ljava/io/FileDescriptor;)V
    .registers 6
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
    .line 119
    new-instance v0, Lpl/droidsonroids/gif/GifInfoHandle;

    const-wide/16 v1, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, p1, v1, v2, v3}, Lpl/droidsonroids/gif/GifInfoHandle;-><init>(Ljava/io/FileDescriptor;JZ)V

    invoke-direct {p0, v0}, Lpl/droidsonroids/gif/GifAnimationMetaData;-><init>(Lpl/droidsonroids/gif/GifInfoHandle;)V

    .line 120
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 4
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
    .line 96
    new-instance v0, Lpl/droidsonroids/gif/GifInfoHandle;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lpl/droidsonroids/gif/GifInfoHandle;-><init>(Ljava/io/InputStream;Z)V

    invoke-direct {p0, v0}, Lpl/droidsonroids/gif/GifAnimationMetaData;-><init>(Lpl/droidsonroids/gif/GifInfoHandle;)V

    .line 97
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
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
    .line 72
    new-instance v0, Lpl/droidsonroids/gif/GifInfoHandle;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lpl/droidsonroids/gif/GifInfoHandle;-><init>(Ljava/lang/String;Z)V

    invoke-direct {p0, v0}, Lpl/droidsonroids/gif/GifAnimationMetaData;-><init>(Lpl/droidsonroids/gif/GifInfoHandle;)V

    .line 73
    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .registers 4
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
    .line 143
    new-instance v0, Lpl/droidsonroids/gif/GifInfoHandle;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lpl/droidsonroids/gif/GifInfoHandle;-><init>(Ljava/nio/ByteBuffer;Z)V

    invoke-direct {p0, v0}, Lpl/droidsonroids/gif/GifAnimationMetaData;-><init>(Lpl/droidsonroids/gif/GifInfoHandle;)V

    .line 144
    return-void
.end method

.method private constructor <init>(Lpl/droidsonroids/gif/GifInfoHandle;)V
    .registers 3
    .param p1, "gifInfoHandle"    # Lpl/droidsonroids/gif/GifInfoHandle;

    .prologue
    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 160
    invoke-virtual {p1}, Lpl/droidsonroids/gif/GifInfoHandle;->getLoopCount()I

    move-result v0

    iput v0, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mLoopCount:I

    .line 161
    invoke-virtual {p1}, Lpl/droidsonroids/gif/GifInfoHandle;->getDuration()I

    move-result v0

    iput v0, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mDuration:I

    .line 162
    invoke-virtual {p1}, Lpl/droidsonroids/gif/GifInfoHandle;->getWidth()I

    move-result v0

    iput v0, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mWidth:I

    .line 163
    invoke-virtual {p1}, Lpl/droidsonroids/gif/GifInfoHandle;->getHeight()I

    move-result v0

    iput v0, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mHeight:I

    .line 164
    invoke-virtual {p1}, Lpl/droidsonroids/gif/GifInfoHandle;->getNumberOfFrames()I

    move-result v0

    iput v0, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mImageCount:I

    .line 165
    invoke-virtual {p1}, Lpl/droidsonroids/gif/GifInfoHandle;->recycle()V

    .line 166
    return-void
.end method

.method public constructor <init>([B)V
    .registers 4
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
    .line 131
    new-instance v0, Lpl/droidsonroids/gif/GifInfoHandle;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lpl/droidsonroids/gif/GifInfoHandle;-><init>([BZ)V

    invoke-direct {p0, v0}, Lpl/droidsonroids/gif/GifAnimationMetaData;-><init>(Lpl/droidsonroids/gif/GifInfoHandle;)V

    .line 132
    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 223
    const/4 v0, 0x0

    return v0
.end method

.method public getDuration()I
    .registers 2

    .prologue
    .line 204
    iget v0, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mDuration:I

    return v0
.end method

.method public getHeight()I
    .registers 2

    .prologue
    .line 179
    iget v0, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mHeight:I

    return v0
.end method

.method public getLoopCount()I
    .registers 2

    .prologue
    .line 195
    iget v0, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mLoopCount:I

    return v0
.end method

.method public getNumberOfFrames()I
    .registers 2

    .prologue
    .line 186
    iget v0, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mImageCount:I

    return v0
.end method

.method public getWidth()I
    .registers 2

    .prologue
    .line 172
    iget v0, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mWidth:I

    return v0
.end method

.method public isAnimated()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 211
    iget v1, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mImageCount:I

    if-le v1, v0, :cond_a

    iget v1, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mDuration:I

    if-lez v1, :cond_a

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public toString()Ljava/lang/String;
    .registers 8

    .prologue
    .line 216
    iget v2, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mLoopCount:I

    if-nez v2, :cond_52

    const-string v0, "Infinity"

    .line 217
    .local v0, "loopCount":Ljava/lang/String;
    :goto_6
    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v3, "GIF: size: %dx%d, frames: %d, loops: %s, duration: %d"

    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget v6, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mWidth:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    iget v6, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mHeight:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    iget v6, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mImageCount:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x3

    aput-object v0, v4, v5

    const/4 v5, 0x4

    iget v6, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mDuration:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 218
    .local v1, "suffix":Ljava/lang/String;
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifAnimationMetaData;->isAnimated()Z

    move-result v2

    if-eqz v2, :cond_51

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Animated "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "suffix":Ljava/lang/String;
    :cond_51
    return-object v1

    .line 216
    .end local v0    # "loopCount":Ljava/lang/String;
    :cond_52
    iget v2, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mLoopCount:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 228
    iget v0, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mLoopCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 229
    iget v0, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mDuration:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 230
    iget v0, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mHeight:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 231
    iget v0, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mWidth:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 232
    iget v0, p0, Lpl/droidsonroids/gif/GifAnimationMetaData;->mImageCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 233
    return-void
.end method
