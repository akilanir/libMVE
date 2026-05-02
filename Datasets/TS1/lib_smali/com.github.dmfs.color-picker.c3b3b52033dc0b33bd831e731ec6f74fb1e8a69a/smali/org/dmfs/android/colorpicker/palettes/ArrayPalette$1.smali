.class final Lorg/dmfs/android/colorpicker/palettes/ArrayPalette$1;
.super Ljava/lang/Object;
.source "ArrayPalette.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;
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
        "Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 372
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;

    .prologue
    .line 372
    invoke-virtual {p0, p1}, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette$1;->createFromParcel(Landroid/os/Parcel;)Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;

    move-result-object v0

    return-object v0
.end method

.method public createFromParcel(Landroid/os/Parcel;)Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;
    .registers 4
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 381
    new-instance v0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;-><init>(Lorg/dmfs/android/colorpicker/palettes/ArrayPalette$1;)V

    .line 382
    .local v0, "state":Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;
    invoke-virtual {v0, p1}, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->readFromParcel(Landroid/os/Parcel;)V

    .line 383
    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 372
    invoke-virtual {p0, p1}, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette$1;->newArray(I)[Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 395
    new-array v0, p1, [Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;

    return-object v0
.end method
