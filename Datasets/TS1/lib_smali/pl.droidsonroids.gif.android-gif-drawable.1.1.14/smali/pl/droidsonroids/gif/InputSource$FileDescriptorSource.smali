.class public final Lpl/droidsonroids/gif/InputSource$FileDescriptorSource;
.super Lpl/droidsonroids/gif/InputSource;
.source "InputSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lpl/droidsonroids/gif/InputSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "FileDescriptorSource"
.end annotation


# instance fields
.field private final mFd:Ljava/io/FileDescriptor;


# direct methods
.method public constructor <init>(Ljava/io/FileDescriptor;)V
    .registers 2
    .param p1, "fileDescriptor"    # Ljava/io/FileDescriptor;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 190
    invoke-direct {p0}, Lpl/droidsonroids/gif/InputSource;-><init>()V

    .line 191
    iput-object p1, p0, Lpl/droidsonroids/gif/InputSource$FileDescriptorSource;->mFd:Ljava/io/FileDescriptor;

    .line 192
    return-void
.end method


# virtual methods
.method open()Lpl/droidsonroids/gif/GifInfoHandle;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 196
    new-instance v0, Lpl/droidsonroids/gif/GifInfoHandle;

    iget-object v1, p0, Lpl/droidsonroids/gif/InputSource$FileDescriptorSource;->mFd:Ljava/io/FileDescriptor;

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lpl/droidsonroids/gif/GifInfoHandle;-><init>(Ljava/io/FileDescriptor;JZ)V

    return-object v0
.end method
