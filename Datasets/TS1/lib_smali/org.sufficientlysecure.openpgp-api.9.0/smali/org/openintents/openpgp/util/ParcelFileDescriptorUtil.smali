.class public Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil;
.super Ljava/lang/Object;
.source "ParcelFileDescriptorUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    return-void
.end method

.method public static pipeFrom(Ljava/io/InputStream;)Landroid/os/ParcelFileDescriptor;
    .registers 6
    .param p0, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 31
    invoke-static {}, Landroid/os/ParcelFileDescriptor;->createPipe()[Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    .line 32
    .local v0, "pipe":[Landroid/os/ParcelFileDescriptor;
    const/4 v3, 0x0

    aget-object v1, v0, v3

    .line 33
    .local v1, "readSide":Landroid/os/ParcelFileDescriptor;
    const/4 v3, 0x1

    aget-object v2, v0, v3

    .line 35
    .local v2, "writeSide":Landroid/os/ParcelFileDescriptor;
    new-instance v3, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;

    new-instance v4, Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;

    invoke-direct {v4, v2}, Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V

    invoke-direct {v3, p0, v4}, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    invoke-virtual {v3}, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->start()V

    .line 38
    return-object v1
.end method

.method public static pipeTo(Ljava/io/OutputStream;Landroid/os/ParcelFileDescriptor;)Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;
    .registers 4
    .param p0, "outputStream"    # Ljava/io/OutputStream;
    .param p1, "output"    # Landroid/os/ParcelFileDescriptor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    new-instance v0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;

    new-instance v1, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;

    invoke-direct {v1, p1}, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V

    invoke-direct {v0, v1, p0}, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 47
    .local v0, "t":Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;
    invoke-virtual {v0}, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->start()V

    .line 48
    return-object v0
.end method
