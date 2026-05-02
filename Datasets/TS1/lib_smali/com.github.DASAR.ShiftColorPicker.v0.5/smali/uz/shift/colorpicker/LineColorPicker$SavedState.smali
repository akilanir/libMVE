.class Luz/shift/colorpicker/LineColorPicker$SavedState;
.super Landroid/view/View$BaseSavedState;
.source "LineColorPicker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Luz/shift/colorpicker/LineColorPicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SavedState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Luz/shift/colorpicker/LineColorPicker$SavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field isColorSelected:Z

.field selectedColor:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 290
    new-instance v0, Luz/shift/colorpicker/LineColorPicker$SavedState$1;

    invoke-direct {v0}, Luz/shift/colorpicker/LineColorPicker$SavedState$1;-><init>()V

    sput-object v0, Luz/shift/colorpicker/LineColorPicker$SavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 4
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v0, 0x1

    .line 277
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 278
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Luz/shift/colorpicker/LineColorPicker$SavedState;->selectedColor:I

    .line 279
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-ne v1, v0, :cond_13

    :goto_10
    iput-boolean v0, p0, Luz/shift/colorpicker/LineColorPicker$SavedState;->isColorSelected:Z

    .line 280
    return-void

    .line 279
    :cond_13
    const/4 v0, 0x0

    goto :goto_10
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Luz/shift/colorpicker/LineColorPicker$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Luz/shift/colorpicker/LineColorPicker$1;

    .prologue
    .line 268
    invoke-direct {p0, p1}, Luz/shift/colorpicker/LineColorPicker$SavedState;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method constructor <init>(Landroid/os/Parcelable;)V
    .registers 2
    .param p1, "superState"    # Landroid/os/Parcelable;

    .prologue
    .line 273
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 274
    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 284
    invoke-super {p0, p1, p2}, Landroid/view/View$BaseSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 285
    iget v0, p0, Luz/shift/colorpicker/LineColorPicker$SavedState;->selectedColor:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 286
    iget-boolean v0, p0, Luz/shift/colorpicker/LineColorPicker$SavedState;->isColorSelected:Z

    if-eqz v0, :cond_11

    const/4 v0, 0x1

    :goto_d
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 287
    return-void

    .line 286
    :cond_11
    const/4 v0, 0x0

    goto :goto_d
.end method
