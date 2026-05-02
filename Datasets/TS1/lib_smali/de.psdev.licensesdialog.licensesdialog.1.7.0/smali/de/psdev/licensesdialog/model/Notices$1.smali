.class final Lde/psdev/licensesdialog/model/Notices$1;
.super Ljava/lang/Object;
.source "Notices.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/psdev/licensesdialog/model/Notices;
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
        "Lde/psdev/licensesdialog/model/Notices;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lde/psdev/licensesdialog/model/Notices;
    .registers 3
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 62
    new-instance v0, Lde/psdev/licensesdialog/model/Notices;

    invoke-direct {v0, p1}, Lde/psdev/licensesdialog/model/Notices;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 60
    invoke-virtual {p0, p1}, Lde/psdev/licensesdialog/model/Notices$1;->createFromParcel(Landroid/os/Parcel;)Lde/psdev/licensesdialog/model/Notices;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lde/psdev/licensesdialog/model/Notices;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 66
    new-array v0, p1, [Lde/psdev/licensesdialog/model/Notices;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3

    .prologue
    .line 60
    invoke-virtual {p0, p1}, Lde/psdev/licensesdialog/model/Notices$1;->newArray(I)[Lde/psdev/licensesdialog/model/Notices;

    move-result-object v0

    return-object v0
.end method
