.class public Lorg/openintents/openpgp/OpenPgpDecryptionResult;
.super Ljava/lang/Object;
.source "OpenPgpDecryptionResult.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lorg/openintents/openpgp/OpenPgpDecryptionResult;",
            ">;"
        }
    .end annotation
.end field

.field public static final PARCELABLE_VERSION:I = 0x1

.field public static final RESULT_ENCRYPTED:I = 0x1

.field public static final RESULT_INSECURE:I = 0x0

.field public static final RESULT_NOT_ENCRYPTED:I = -0x1


# instance fields
.field result:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 83
    new-instance v0, Lorg/openintents/openpgp/OpenPgpDecryptionResult$1;

    invoke-direct {v0}, Lorg/openintents/openpgp/OpenPgpDecryptionResult$1;-><init>()V

    sput-object v0, Lorg/openintents/openpgp/OpenPgpDecryptionResult;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    return-void
.end method

.method public constructor <init>(I)V
    .registers 2
    .param p1, "result"    # I

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput p1, p0, Lorg/openintents/openpgp/OpenPgpDecryptionResult;->result:I

    .line 53
    return-void
.end method

.method public constructor <init>(Lorg/openintents/openpgp/OpenPgpDecryptionResult;)V
    .registers 3
    .param p1, "b"    # Lorg/openintents/openpgp/OpenPgpDecryptionResult;

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iget v0, p1, Lorg/openintents/openpgp/OpenPgpDecryptionResult;->result:I

    iput v0, p0, Lorg/openintents/openpgp/OpenPgpDecryptionResult;->result:I

    .line 57
    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 60
    const/4 v0, 0x0

    return v0
.end method

.method public getResult()I
    .registers 2

    .prologue
    .line 40
    iget v0, p0, Lorg/openintents/openpgp/OpenPgpDecryptionResult;->result:I

    return v0
.end method

.method public setResult(I)V
    .registers 2
    .param p1, "result"    # I

    .prologue
    .line 44
    iput p1, p0, Lorg/openintents/openpgp/OpenPgpDecryptionResult;->result:I

    .line 45
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 105
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\nresult: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/openintents/openpgp/OpenPgpDecryptionResult;->result:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 7
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 68
    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 71
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    .line 72
    .local v1, "sizePosition":I
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 73
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    .line 75
    .local v2, "startPosition":I
    iget v3, p0, Lorg/openintents/openpgp/OpenPgpDecryptionResult;->result:I

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 77
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    sub-int v0, v3, v2

    .line 78
    .local v0, "parcelableSize":I
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 79
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 80
    add-int v3, v2, v0

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 81
    return-void
.end method
