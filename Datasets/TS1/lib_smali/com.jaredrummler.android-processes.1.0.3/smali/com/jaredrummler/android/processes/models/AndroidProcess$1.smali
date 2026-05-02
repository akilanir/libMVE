.class final Lcom/jaredrummler/android/processes/models/AndroidProcess$1;
.super Ljava/lang/Object;
.source "AndroidProcess.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jaredrummler/android/processes/models/AndroidProcess;
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
        "Lcom/jaredrummler/android/processes/models/AndroidProcess;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 596
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/jaredrummler/android/processes/models/AndroidProcess;
    .registers 3
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 599
    new-instance v0, Lcom/jaredrummler/android/processes/models/AndroidProcess;

    invoke-direct {v0, p1}, Lcom/jaredrummler/android/processes/models/AndroidProcess;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 596
    invoke-virtual {p0, p1}, Lcom/jaredrummler/android/processes/models/AndroidProcess$1;->createFromParcel(Landroid/os/Parcel;)Lcom/jaredrummler/android/processes/models/AndroidProcess;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/jaredrummler/android/processes/models/AndroidProcess;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 603
    new-array v0, p1, [Lcom/jaredrummler/android/processes/models/AndroidProcess;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3

    .prologue
    .line 596
    invoke-virtual {p0, p1}, Lcom/jaredrummler/android/processes/models/AndroidProcess$1;->newArray(I)[Lcom/jaredrummler/android/processes/models/AndroidProcess;

    move-result-object v0

    return-object v0
.end method
