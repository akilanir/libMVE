.class public Lorg/openintents/openpgp/OpenPgpError;
.super Ljava/lang/Object;
.source "OpenPgpError.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CLIENT_SIDE_ERROR:I = -0x1

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lorg/openintents/openpgp/OpenPgpError;",
            ">;"
        }
    .end annotation
.end field

.field public static final GENERIC_ERROR:I = 0x0

.field public static final INCOMPATIBLE_API_VERSIONS:I = 0x1

.field public static final NO_OR_WRONG_PASSPHRASE:I = 0x2

.field public static final NO_USER_IDS:I = 0x3

.field public static final PARCELABLE_VERSION:I = 0x1


# instance fields
.field errorId:I

.field message:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 94
    new-instance v0, Lorg/openintents/openpgp/OpenPgpError$1;

    invoke-direct {v0}, Lorg/openintents/openpgp/OpenPgpError$1;-><init>()V

    sput-object v0, Lorg/openintents/openpgp/OpenPgpError;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .registers 3
    .param p1, "errorId"    # I
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput p1, p0, Lorg/openintents/openpgp/OpenPgpError;->errorId:I

    .line 45
    iput-object p2, p0, Lorg/openintents/openpgp/OpenPgpError;->message:Ljava/lang/String;

    .line 46
    return-void
.end method

.method public constructor <init>(Lorg/openintents/openpgp/OpenPgpError;)V
    .registers 3
    .param p1, "b"    # Lorg/openintents/openpgp/OpenPgpError;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iget v0, p1, Lorg/openintents/openpgp/OpenPgpError;->errorId:I

    iput v0, p0, Lorg/openintents/openpgp/OpenPgpError;->errorId:I

    .line 50
    iget-object v0, p1, Lorg/openintents/openpgp/OpenPgpError;->message:Ljava/lang/String;

    iput-object v0, p0, Lorg/openintents/openpgp/OpenPgpError;->message:Ljava/lang/String;

    .line 51
    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 70
    const/4 v0, 0x0

    return v0
.end method

.method public getErrorId()I
    .registers 2

    .prologue
    .line 54
    iget v0, p0, Lorg/openintents/openpgp/OpenPgpError;->errorId:I

    return v0
.end method

.method public getMessage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 62
    iget-object v0, p0, Lorg/openintents/openpgp/OpenPgpError;->message:Ljava/lang/String;

    return-object v0
.end method

.method public setErrorId(I)V
    .registers 2
    .param p1, "errorId"    # I

    .prologue
    .line 58
    iput p1, p0, Lorg/openintents/openpgp/OpenPgpError;->errorId:I

    .line 59
    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 66
    iput-object p1, p0, Lorg/openintents/openpgp/OpenPgpError;->message:Ljava/lang/String;

    .line 67
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 7
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 78
    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 81
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    .line 82
    .local v1, "sizePosition":I
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 83
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    .line 85
    .local v2, "startPosition":I
    iget v3, p0, Lorg/openintents/openpgp/OpenPgpError;->errorId:I

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 86
    iget-object v3, p0, Lorg/openintents/openpgp/OpenPgpError;->message:Ljava/lang/String;

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 88
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    sub-int v0, v3, v2

    .line 89
    .local v0, "parcelableSize":I
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 90
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 91
    add-int v3, v2, v0

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 92
    return-void
.end method
