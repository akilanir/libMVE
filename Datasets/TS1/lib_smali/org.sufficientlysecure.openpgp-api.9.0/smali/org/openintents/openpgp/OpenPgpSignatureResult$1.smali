.class final Lorg/openintents/openpgp/OpenPgpSignatureResult$1;
.super Ljava/lang/Object;
.source "OpenPgpSignatureResult.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/openintents/openpgp/OpenPgpSignatureResult;
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
        "Lorg/openintents/openpgp/OpenPgpSignatureResult;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;

    .prologue
    .line 153
    invoke-virtual {p0, p1}, Lorg/openintents/openpgp/OpenPgpSignatureResult$1;->createFromParcel(Landroid/os/Parcel;)Lorg/openintents/openpgp/OpenPgpSignatureResult;

    move-result-object v0

    return-object v0
.end method

.method public createFromParcel(Landroid/os/Parcel;)Lorg/openintents/openpgp/OpenPgpSignatureResult;
    .registers 7
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    const/4 v3, 0x1

    .line 155
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 156
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 157
    .local v0, "parcelableSize":I
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    .line 159
    .local v1, "startPosition":I
    new-instance v2, Lorg/openintents/openpgp/OpenPgpSignatureResult;

    invoke-direct {v2}, Lorg/openintents/openpgp/OpenPgpSignatureResult;-><init>()V

    .line 160
    .local v2, "vr":Lorg/openintents/openpgp/OpenPgpSignatureResult;
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    iput v4, v2, Lorg/openintents/openpgp/OpenPgpSignatureResult;->result:I

    .line 161
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v4

    if-ne v4, v3, :cond_3d

    :goto_1d
    iput-boolean v3, v2, Lorg/openintents/openpgp/OpenPgpSignatureResult;->signatureOnly:Z

    .line 162
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lorg/openintents/openpgp/OpenPgpSignatureResult;->primaryUserId:Ljava/lang/String;

    .line 163
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v3

    iput-wide v3, v2, Lorg/openintents/openpgp/OpenPgpSignatureResult;->keyId:J

    .line 164
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, v2, Lorg/openintents/openpgp/OpenPgpSignatureResult;->userIds:Ljava/util/ArrayList;

    .line 165
    iget-object v3, v2, Lorg/openintents/openpgp/OpenPgpSignatureResult;->userIds:Ljava/util/ArrayList;

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->readStringList(Ljava/util/List;)V

    .line 168
    add-int v3, v1, v0

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 170
    return-object v2

    .line 161
    :cond_3d
    const/4 v3, 0x0

    goto :goto_1d
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 153
    invoke-virtual {p0, p1}, Lorg/openintents/openpgp/OpenPgpSignatureResult$1;->newArray(I)[Lorg/openintents/openpgp/OpenPgpSignatureResult;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lorg/openintents/openpgp/OpenPgpSignatureResult;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 174
    new-array v0, p1, [Lorg/openintents/openpgp/OpenPgpSignatureResult;

    return-object v0
.end method
