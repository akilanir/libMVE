.class final Lorg/openintents/openpgp/OpenPgpDecryptionResult$1;
.super Ljava/lang/Object;
.source "OpenPgpDecryptionResult.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/openintents/openpgp/OpenPgpDecryptionResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lorg/openintents/openpgp/OpenPgpDecryptionResult;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;

    .prologue
    .line 83
    invoke-virtual {p0, p1}, Lorg/openintents/openpgp/OpenPgpDecryptionResult$1;->createFromParcel(Landroid/os/Parcel;)Lorg/openintents/openpgp/OpenPgpDecryptionResult;

    move-result-object v0

    return-object v0
.end method

.method public createFromParcel(Landroid/os/Parcel;)Lorg/openintents/openpgp/OpenPgpDecryptionResult;
    .registers 6
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 85
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 86
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 87
    .local v0, "parcelableSize":I
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    .line 89
    .local v1, "startPosition":I
    new-instance v2, Lorg/openintents/openpgp/OpenPgpDecryptionResult;

    invoke-direct {v2}, Lorg/openintents/openpgp/OpenPgpDecryptionResult;-><init>()V

    .line 90
    .local v2, "vr":Lorg/openintents/openpgp/OpenPgpDecryptionResult;
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    iput v3, v2, Lorg/openintents/openpgp/OpenPgpDecryptionResult;->result:I

    .line 93
    add-int v3, v1, v0

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 95
    return-object v2
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 83
    invoke-virtual {p0, p1}, Lorg/openintents/openpgp/OpenPgpDecryptionResult$1;->newArray(I)[Lorg/openintents/openpgp/OpenPgpDecryptionResult;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lorg/openintents/openpgp/OpenPgpDecryptionResult;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 99
    new-array v0, p1, [Lorg/openintents/openpgp/OpenPgpDecryptionResult;

    return-object v0
.end method
