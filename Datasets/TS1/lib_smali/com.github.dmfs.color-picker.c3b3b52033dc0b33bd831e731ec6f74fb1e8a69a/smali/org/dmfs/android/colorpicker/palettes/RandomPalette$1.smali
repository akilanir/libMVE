.class final Lorg/dmfs/android/colorpicker/palettes/RandomPalette$1;
.super Ljava/lang/Object;
.source "RandomPalette.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/colorpicker/palettes/RandomPalette;
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
        "Lorg/dmfs/android/colorpicker/palettes/RandomPalette;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 173
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;

    .prologue
    .line 173
    invoke-virtual {p0, p1}, Lorg/dmfs/android/colorpicker/palettes/RandomPalette$1;->createFromParcel(Landroid/os/Parcel;)Lorg/dmfs/android/colorpicker/palettes/RandomPalette;

    move-result-object v0

    return-object v0
.end method

.method public createFromParcel(Landroid/os/Parcel;)Lorg/dmfs/android/colorpicker/palettes/RandomPalette;
    .registers 4
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 182
    new-instance v0, Lorg/dmfs/android/colorpicker/palettes/RandomPalette;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/dmfs/android/colorpicker/palettes/RandomPalette;-><init>(Lorg/dmfs/android/colorpicker/palettes/RandomPalette$1;)V

    .line 183
    .local v0, "state":Lorg/dmfs/android/colorpicker/palettes/RandomPalette;
    invoke-virtual {v0, p1}, Lorg/dmfs/android/colorpicker/palettes/RandomPalette;->readFromParcel(Landroid/os/Parcel;)V

    .line 184
    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 173
    invoke-virtual {p0, p1}, Lorg/dmfs/android/colorpicker/palettes/RandomPalette$1;->newArray(I)[Lorg/dmfs/android/colorpicker/palettes/RandomPalette;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lorg/dmfs/android/colorpicker/palettes/RandomPalette;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 196
    new-array v0, p1, [Lorg/dmfs/android/colorpicker/palettes/RandomPalette;

    return-object v0
.end method
