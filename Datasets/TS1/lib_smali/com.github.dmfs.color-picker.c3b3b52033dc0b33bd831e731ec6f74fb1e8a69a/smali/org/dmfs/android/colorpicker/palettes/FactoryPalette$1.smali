.class final Lorg/dmfs/android/colorpicker/palettes/FactoryPalette$1;
.super Ljava/lang/Object;
.source "FactoryPalette.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;
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
        "Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 199
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;

    .prologue
    .line 199
    invoke-virtual {p0, p1}, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette$1;->createFromParcel(Landroid/os/Parcel;)Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;

    move-result-object v0

    return-object v0
.end method

.method public createFromParcel(Landroid/os/Parcel;)Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;
    .registers 4
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 208
    new-instance v0, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;-><init>(Lorg/dmfs/android/colorpicker/palettes/FactoryPalette$1;)V

    .line 209
    .local v0, "state":Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;
    invoke-virtual {v0, p1}, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;->readFromParcel(Landroid/os/Parcel;)V

    .line 210
    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 199
    invoke-virtual {p0, p1}, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette$1;->newArray(I)[Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 222
    new-array v0, p1, [Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;

    return-object v0
.end method
