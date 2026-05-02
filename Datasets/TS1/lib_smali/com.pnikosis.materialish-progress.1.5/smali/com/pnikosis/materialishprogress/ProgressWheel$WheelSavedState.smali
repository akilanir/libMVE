.class Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;
.super Landroid/view/View$BaseSavedState;
.source "ProgressWheel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pnikosis/materialishprogress/ProgressWheel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "WheelSavedState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field barColor:I

.field barWidth:I

.field circleRadius:I

.field fillRadius:Z

.field isSpinning:Z

.field linearProgress:Z

.field mProgress:F

.field mTargetProgress:F

.field rimColor:I

.field rimWidth:I

.field spinSpeed:F


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 724
    new-instance v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState$1;

    invoke-direct {v0}, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState$1;-><init>()V

    sput-object v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 5
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 693
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 694
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->mProgress:F

    .line 695
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->mTargetProgress:F

    .line 696
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_50

    move v0, v1

    :goto_18
    iput-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->isSpinning:Z

    .line 697
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->spinSpeed:F

    .line 698
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->barWidth:I

    .line 699
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->barColor:I

    .line 700
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->rimWidth:I

    .line 701
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->rimColor:I

    .line 702
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->circleRadius:I

    .line 703
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_52

    move v0, v1

    :goto_45
    iput-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->linearProgress:Z

    .line 704
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_54

    :goto_4d
    iput-boolean v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->fillRadius:Z

    .line 705
    return-void

    :cond_50
    move v0, v2

    .line 696
    goto :goto_18

    :cond_52
    move v0, v2

    .line 703
    goto :goto_45

    :cond_54
    move v1, v2

    .line 704
    goto :goto_4d
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/pnikosis/materialishprogress/ProgressWheel$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/pnikosis/materialishprogress/ProgressWheel$1;

    .prologue
    .line 675
    invoke-direct {p0, p1}, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method constructor <init>(Landroid/os/Parcelable;)V
    .registers 2
    .param p1, "superState"    # Landroid/os/Parcelable;

    .prologue
    .line 689
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 690
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

    .line 709
    invoke-super {p0, p1, p2}, Landroid/view/View$BaseSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 710
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->mProgress:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 711
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->mTargetProgress:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 712
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->isSpinning:Z

    if-eqz v0, :cond_48

    move v0, v1

    :goto_14
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 713
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->spinSpeed:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 714
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->barWidth:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 715
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->barColor:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 716
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->rimWidth:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 717
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->rimColor:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 718
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->circleRadius:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 719
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->linearProgress:Z

    if-eqz v0, :cond_4a

    move v0, v1

    :goto_3b
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 720
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->fillRadius:Z

    if-eqz v0, :cond_4c

    :goto_43
    int-to-byte v0, v1

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 721
    return-void

    :cond_48
    move v0, v2

    .line 712
    goto :goto_14

    :cond_4a
    move v0, v2

    .line 719
    goto :goto_3b

    :cond_4c
    move v1, v2

    .line 720
    goto :goto_43
.end method
