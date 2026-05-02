.class Lcom/astuetz/PagerSlidingTabStrip$SavedState;
.super Landroid/view/View$BaseSavedState;
.source "PagerSlidingTabStrip.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/astuetz/PagerSlidingTabStrip;
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
            "Lcom/astuetz/PagerSlidingTabStrip$SavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field currentPosition:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 577
    new-instance v0, Lcom/astuetz/PagerSlidingTabStrip$SavedState$1;

    invoke-direct {v0}, Lcom/astuetz/PagerSlidingTabStrip$SavedState$1;-><init>()V

    sput-object v0, Lcom/astuetz/PagerSlidingTabStrip$SavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 567
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 568
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/astuetz/PagerSlidingTabStrip$SavedState;->currentPosition:I

    .line 569
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/astuetz/PagerSlidingTabStrip$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/astuetz/PagerSlidingTabStrip$1;

    .prologue
    .line 559
    invoke-direct {p0, p1}, Lcom/astuetz/PagerSlidingTabStrip$SavedState;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcelable;)V
    .registers 2
    .param p1, "superState"    # Landroid/os/Parcelable;

    .prologue
    .line 563
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 564
    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 573
    invoke-super {p0, p1, p2}, Landroid/view/View$BaseSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 574
    iget v0, p0, Lcom/astuetz/PagerSlidingTabStrip$SavedState;->currentPosition:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 575
    return-void
.end method
