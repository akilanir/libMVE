.class Landroid/support/v7/internal/widget/ProgressBarCompat$SavedState;
.super Landroid/view/View$BaseSavedState;
.source "ProgressBarCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/internal/widget/ProgressBarCompat;
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
            "Landroid/support/v7/internal/widget/ProgressBarCompat$SavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field progress:I

.field secondaryProgress:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 868
    new-instance v0, Landroid/support/v7/internal/widget/ProgressBarCompat$SavedState$1;

    invoke-direct {v0}, Landroid/support/v7/internal/widget/ProgressBarCompat$SavedState$1;-><init>()V

    sput-object v0, Landroid/support/v7/internal/widget/ProgressBarCompat$SavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 856
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 857
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat$SavedState;->progress:I

    .line 858
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat$SavedState;->secondaryProgress:I

    .line 859
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Landroid/support/v7/internal/widget/ProgressBarCompat$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Landroid/support/v7/internal/widget/ProgressBarCompat$1;

    .prologue
    .line 841
    invoke-direct {p0, p1}, Landroid/support/v7/internal/widget/ProgressBarCompat$SavedState;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method constructor <init>(Landroid/os/Parcelable;)V
    .registers 2
    .param p1, "superState"    # Landroid/os/Parcelable;

    .prologue
    .line 849
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 850
    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 863
    invoke-super {p0, p1, p2}, Landroid/view/View$BaseSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 864
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat$SavedState;->progress:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 865
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat$SavedState;->secondaryProgress:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 866
    return-void
.end method
