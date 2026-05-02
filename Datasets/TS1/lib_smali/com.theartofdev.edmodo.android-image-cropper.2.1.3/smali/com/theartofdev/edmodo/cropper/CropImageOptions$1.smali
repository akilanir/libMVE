.class final Lcom/theartofdev/edmodo/cropper/CropImageOptions$1;
.super Ljava/lang/Object;
.source "CropImageOptions.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/theartofdev/edmodo/cropper/CropImageOptions;
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
        "Lcom/theartofdev/edmodo/cropper/CropImageOptions;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/theartofdev/edmodo/cropper/CropImageOptions;
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 34
    new-instance v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    invoke-direct {v0, p1}, Lcom/theartofdev/edmodo/cropper/CropImageOptions;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 31
    invoke-virtual {p0, p1}, Lcom/theartofdev/edmodo/cropper/CropImageOptions$1;->createFromParcel(Landroid/os/Parcel;)Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/theartofdev/edmodo/cropper/CropImageOptions;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 39
    new-array v0, p1, [Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3

    .prologue
    .line 31
    invoke-virtual {p0, p1}, Lcom/theartofdev/edmodo/cropper/CropImageOptions$1;->newArray(I)[Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    move-result-object v0

    return-object v0
.end method
