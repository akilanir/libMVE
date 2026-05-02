.class final Lcom/github/mrengineer13/snackbar/Snack$1;
.super Ljava/lang/Object;
.source "Snack.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/mrengineer13/snackbar/Snack;
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
        "Lcom/github/mrengineer13/snackbar/Snack;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/github/mrengineer13/snackbar/Snack;
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 74
    new-instance v0, Lcom/github/mrengineer13/snackbar/Snack;

    invoke-direct {v0, p1}, Lcom/github/mrengineer13/snackbar/Snack;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;

    .prologue
    .line 72
    invoke-virtual {p0, p1}, Lcom/github/mrengineer13/snackbar/Snack$1;->createFromParcel(Landroid/os/Parcel;)Lcom/github/mrengineer13/snackbar/Snack;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/github/mrengineer13/snackbar/Snack;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 78
    new-array v0, p1, [Lcom/github/mrengineer13/snackbar/Snack;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 72
    invoke-virtual {p0, p1}, Lcom/github/mrengineer13/snackbar/Snack$1;->newArray(I)[Lcom/github/mrengineer13/snackbar/Snack;

    move-result-object v0

    return-object v0
.end method
