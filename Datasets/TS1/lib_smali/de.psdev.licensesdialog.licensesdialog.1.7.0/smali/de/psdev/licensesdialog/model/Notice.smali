.class public Lde/psdev/licensesdialog/model/Notice;
.super Ljava/lang/Object;
.source "Notice.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lde/psdev/licensesdialog/model/Notice;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mCopyright:Ljava/lang/String;

.field private mLicense:Lde/psdev/licensesdialog/licenses/License;

.field private mName:Ljava/lang/String;

.field private mUrl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 98
    new-instance v0, Lde/psdev/licensesdialog/model/Notice$1;

    invoke-direct {v0}, Lde/psdev/licensesdialog/model/Notice$1;-><init>()V

    sput-object v0, Lde/psdev/licensesdialog/model/Notice;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/psdev/licensesdialog/model/Notice;->mName:Ljava/lang/String;

    .line 93
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/psdev/licensesdialog/model/Notice;->mUrl:Ljava/lang/String;

    .line 94
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/psdev/licensesdialog/model/Notice;->mCopyright:Ljava/lang/String;

    .line 95
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lde/psdev/licensesdialog/licenses/License;

    iput-object v0, p0, Lde/psdev/licensesdialog/model/Notice;->mLicense:Lde/psdev/licensesdialog/licenses/License;

    .line 96
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lde/psdev/licensesdialog/model/Notice$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lde/psdev/licensesdialog/model/Notice$1;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lde/psdev/licensesdialog/model/Notice;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lde/psdev/licensesdialog/licenses/License;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "copyright"    # Ljava/lang/String;
    .param p4, "license"    # Lde/psdev/licensesdialog/licenses/License;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lde/psdev/licensesdialog/model/Notice;->mName:Ljava/lang/String;

    .line 37
    iput-object p2, p0, Lde/psdev/licensesdialog/model/Notice;->mUrl:Ljava/lang/String;

    .line 38
    iput-object p3, p0, Lde/psdev/licensesdialog/model/Notice;->mCopyright:Ljava/lang/String;

    .line 39
    iput-object p4, p0, Lde/psdev/licensesdialog/model/Notice;->mLicense:Lde/psdev/licensesdialog/licenses/License;

    .line 40
    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 80
    const/4 v0, 0x0

    return v0
.end method

.method public getCopyright()Ljava/lang/String;
    .registers 2

    .prologue
    .line 69
    iget-object v0, p0, Lde/psdev/licensesdialog/model/Notice;->mCopyright:Ljava/lang/String;

    return-object v0
.end method

.method public getLicense()Lde/psdev/licensesdialog/licenses/License;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lde/psdev/licensesdialog/model/Notice;->mLicense:Lde/psdev/licensesdialog/licenses/License;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lde/psdev/licensesdialog/model/Notice;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lde/psdev/licensesdialog/model/Notice;->mUrl:Ljava/lang/String;

    return-object v0
.end method

.method public setCopyright(Ljava/lang/String;)V
    .registers 2
    .param p1, "copyright"    # Ljava/lang/String;

    .prologue
    .line 53
    iput-object p1, p0, Lde/psdev/licensesdialog/model/Notice;->mCopyright:Ljava/lang/String;

    .line 54
    return-void
.end method

.method public setLicense(Lde/psdev/licensesdialog/licenses/License;)V
    .registers 2
    .param p1, "license"    # Lde/psdev/licensesdialog/licenses/License;

    .prologue
    .line 57
    iput-object p1, p0, Lde/psdev/licensesdialog/model/Notice;->mLicense:Lde/psdev/licensesdialog/licenses/License;

    .line 58
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 45
    iput-object p1, p0, Lde/psdev/licensesdialog/model/Notice;->mName:Ljava/lang/String;

    .line 46
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .registers 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 49
    iput-object p1, p0, Lde/psdev/licensesdialog/model/Notice;->mUrl:Ljava/lang/String;

    .line 50
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 85
    iget-object v0, p0, Lde/psdev/licensesdialog/model/Notice;->mName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 86
    iget-object v0, p0, Lde/psdev/licensesdialog/model/Notice;->mUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 87
    iget-object v0, p0, Lde/psdev/licensesdialog/model/Notice;->mCopyright:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 88
    iget-object v0, p0, Lde/psdev/licensesdialog/model/Notice;->mLicense:Lde/psdev/licensesdialog/licenses/License;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 89
    return-void
.end method
