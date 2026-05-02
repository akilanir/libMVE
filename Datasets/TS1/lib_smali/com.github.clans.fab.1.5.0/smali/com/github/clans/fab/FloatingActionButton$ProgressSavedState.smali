.class Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;
.super Landroid/view/View$BaseSavedState;
.source "FloatingActionButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/clans/fab/FloatingActionButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ProgressSavedState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field mAnimateProgress:Z

.field mCurrentProgress:F

.field mProgress:I

.field mProgressBackgroundColor:I

.field mProgressBarEnabled:Z

.field mProgressBarVisibilityChanged:Z

.field mProgressColor:I

.field mProgressIndeterminate:Z

.field mProgressWidth:I

.field mShouldProgressIndeterminate:Z

.field mShouldSetProgress:Z

.field mShowProgressBackground:Z

.field mSpinSpeed:F

.field mTargetProgress:F


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 763
    new-instance v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState$1;

    invoke-direct {v0}, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState$1;-><init>()V

    sput-object v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 5
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 727
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 728
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mCurrentProgress:F

    .line 729
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mTargetProgress:F

    .line 730
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_6e

    move v0, v1

    :goto_18
    iput-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgressBarEnabled:Z

    .line 731
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mSpinSpeed:F

    .line 732
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgress:I

    .line 733
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgressWidth:I

    .line 734
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgressColor:I

    .line 735
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgressBackgroundColor:I

    .line 736
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_70

    move v0, v1

    :goto_3f
    iput-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgressBarVisibilityChanged:Z

    .line 737
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_72

    move v0, v1

    :goto_48
    iput-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgressIndeterminate:Z

    .line 738
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_74

    move v0, v1

    :goto_51
    iput-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mShouldProgressIndeterminate:Z

    .line 739
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_76

    move v0, v1

    :goto_5a
    iput-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mShouldSetProgress:Z

    .line 740
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_78

    move v0, v1

    :goto_63
    iput-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mAnimateProgress:Z

    .line 741
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_7a

    :goto_6b
    iput-boolean v1, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mShowProgressBackground:Z

    .line 742
    return-void

    :cond_6e
    move v0, v2

    .line 730
    goto :goto_18

    :cond_70
    move v0, v2

    .line 736
    goto :goto_3f

    :cond_72
    move v0, v2

    .line 737
    goto :goto_48

    :cond_74
    move v0, v2

    .line 738
    goto :goto_51

    :cond_76
    move v0, v2

    .line 739
    goto :goto_5a

    :cond_78
    move v0, v2

    .line 740
    goto :goto_63

    :cond_7a
    move v1, v2

    .line 741
    goto :goto_6b
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/github/clans/fab/FloatingActionButton$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/github/clans/fab/FloatingActionButton$1;

    .prologue
    .line 705
    invoke-direct {p0, p1}, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method constructor <init>(Landroid/os/Parcelable;)V
    .registers 2
    .param p1, "superState"    # Landroid/os/Parcelable;

    .prologue
    .line 723
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 724
    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 6
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 746
    invoke-super {p0, p1, p2}, Landroid/view/View$BaseSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 747
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mCurrentProgress:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 748
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mTargetProgress:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 749
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgressBarEnabled:Z

    if-eqz v0, :cond_60

    move v0, v1

    :goto_14
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 750
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mSpinSpeed:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 751
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgress:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 752
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgressWidth:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 753
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgressColor:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 754
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgressBackgroundColor:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 755
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgressBarVisibilityChanged:Z

    if-eqz v0, :cond_62

    move v0, v1

    :goto_35
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 756
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgressIndeterminate:Z

    if-eqz v0, :cond_64

    move v0, v1

    :goto_3d
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 757
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mShouldProgressIndeterminate:Z

    if-eqz v0, :cond_66

    move v0, v1

    :goto_45
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 758
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mShouldSetProgress:Z

    if-eqz v0, :cond_68

    move v0, v1

    :goto_4d
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 759
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mAnimateProgress:Z

    if-eqz v0, :cond_6a

    move v0, v1

    :goto_55
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 760
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mShowProgressBackground:Z

    if-eqz v0, :cond_6c

    :goto_5c
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 761
    return-void

    :cond_60
    move v0, v2

    .line 749
    goto :goto_14

    :cond_62
    move v0, v2

    .line 755
    goto :goto_35

    :cond_64
    move v0, v2

    .line 756
    goto :goto_3d

    :cond_66
    move v0, v2

    .line 757
    goto :goto_45

    :cond_68
    move v0, v2

    .line 758
    goto :goto_4d

    :cond_6a
    move v0, v2

    .line 759
    goto :goto_55

    :cond_6c
    move v1, v2

    .line 760
    goto :goto_5c
.end method
