.class public Lcom/rey/material/app/DatePickerDialog$Builder;
.super Lcom/rey/material/app/Dialog$Builder;
.source "DatePickerDialog.java"

# interfaces
.implements Lcom/rey/material/app/DatePickerDialog$OnDateChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/DatePickerDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/rey/material/app/DatePickerDialog$Builder;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mCalendar:Ljava/util/Calendar;

.field protected mDay:I

.field protected mMaxDay:I

.field protected mMaxMonth:I

.field protected mMaxYear:I

.field protected mMinDay:I

.field protected mMinMonth:I

.field protected mMinYear:I

.field protected mMonth:I

.field protected mYear:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 856
    new-instance v0, Lcom/rey/material/app/DatePickerDialog$Builder$1;

    invoke-direct {v0}, Lcom/rey/material/app/DatePickerDialog$Builder$1;-><init>()V

    sput-object v0, Lcom/rey/material/app/DatePickerDialog$Builder;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 714
    sget v0, Lcom/rey/material/R$style;->Material_App_Dialog_DatePicker_Light:I

    invoke-direct {p0, v0}, Lcom/rey/material/app/DatePickerDialog$Builder;-><init>(I)V

    .line 715
    return-void
.end method

.method public constructor <init>(I)V
    .registers 4
    .param p1, "styleId"    # I

    .prologue
    .line 718
    invoke-direct {p0, p1}, Lcom/rey/material/app/Dialog$Builder;-><init>(I)V

    .line 719
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 720
    .local v0, "cal":Ljava/util/Calendar;
    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    iput v1, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mDay:I

    .line 721
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    iput v1, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMonth:I

    .line 722
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    iput v1, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mYear:I

    .line 723
    iget v1, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mDay:I

    iput v1, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMinDay:I

    .line 724
    iget v1, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMonth:I

    iput v1, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMinMonth:I

    .line 725
    iget v1, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mYear:I

    add-int/lit8 v1, v1, -0xc

    iput v1, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMinYear:I

    .line 726
    iget v1, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mDay:I

    iput v1, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMaxDay:I

    .line 727
    iget v1, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMonth:I

    iput v1, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMaxMonth:I

    .line 728
    iget v1, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mYear:I

    add-int/lit8 v1, v1, 0xc

    iput v1, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMaxYear:I

    .line 729
    return-void
.end method

.method public constructor <init>(IIIIIIIII)V
    .registers 21
    .param p1, "minDay"    # I
    .param p2, "minMonth"    # I
    .param p3, "minYear"    # I
    .param p4, "maxDay"    # I
    .param p5, "maxMonth"    # I
    .param p6, "maxYear"    # I
    .param p7, "day"    # I
    .param p8, "month"    # I
    .param p9, "year"    # I

    .prologue
    .line 732
    sget v1, Lcom/rey/material/R$style;->Material_App_Dialog_DatePicker_Light:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    invoke-direct/range {v0 .. v10}, Lcom/rey/material/app/DatePickerDialog$Builder;-><init>(IIIIIIIIII)V

    .line 733
    return-void
.end method

.method public constructor <init>(IIIIIIIIII)V
    .registers 11
    .param p1, "styleId"    # I
    .param p2, "minDay"    # I
    .param p3, "minMonth"    # I
    .param p4, "minYear"    # I
    .param p5, "maxDay"    # I
    .param p6, "maxMonth"    # I
    .param p7, "maxYear"    # I
    .param p8, "day"    # I
    .param p9, "month"    # I
    .param p10, "year"    # I

    .prologue
    .line 736
    invoke-direct {p0, p1}, Lcom/rey/material/app/Dialog$Builder;-><init>(I)V

    .line 737
    iput p2, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMinDay:I

    .line 738
    iput p3, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMinMonth:I

    .line 739
    iput p4, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMinYear:I

    .line 740
    iput p5, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMaxDay:I

    .line 741
    iput p6, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMaxMonth:I

    .line 742
    iput p7, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMaxYear:I

    .line 743
    iput p8, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mDay:I

    .line 744
    iput p9, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMonth:I

    .line 745
    iput p10, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mYear:I

    .line 746
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .registers 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 827
    invoke-direct {p0, p1}, Lcom/rey/material/app/Dialog$Builder;-><init>(Landroid/os/Parcel;)V

    .line 828
    return-void
.end method


# virtual methods
.method public contentView(I)Lcom/rey/material/app/Dialog$Builder;
    .registers 2
    .param p1, "layoutId"    # I

    .prologue
    .line 807
    return-object p0
.end method

.method public date(III)Lcom/rey/material/app/DatePickerDialog$Builder;
    .registers 4
    .param p1, "day"    # I
    .param p2, "month"    # I
    .param p3, "year"    # I

    .prologue
    .line 775
    iput p1, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mDay:I

    .line 776
    iput p2, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMonth:I

    .line 777
    iput p3, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mYear:I

    .line 778
    return-object p0
.end method

.method public date(J)Lcom/rey/material/app/DatePickerDialog$Builder;
    .registers 8
    .param p1, "time"    # J

    .prologue
    .line 782
    iget-object v3, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mCalendar:Ljava/util/Calendar;

    if-nez v3, :cond_a

    .line 783
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v3

    iput-object v3, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mCalendar:Ljava/util/Calendar;

    .line 785
    :cond_a
    iget-object v3, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v3, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 786
    iget-object v3, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mCalendar:Ljava/util/Calendar;

    const/4 v4, 0x5

    invoke-virtual {v3, v4}, Ljava/util/Calendar;->get(I)I

    move-result v0

    .line 787
    .local v0, "day":I
    iget-object v3, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mCalendar:Ljava/util/Calendar;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Ljava/util/Calendar;->get(I)I

    move-result v1

    .line 788
    .local v1, "month":I
    iget-object v3, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mCalendar:Ljava/util/Calendar;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/util/Calendar;->get(I)I

    move-result v2

    .line 790
    .local v2, "year":I
    invoke-virtual {p0, v0, v1, v2}, Lcom/rey/material/app/DatePickerDialog$Builder;->date(III)Lcom/rey/material/app/DatePickerDialog$Builder;

    move-result-object v3

    return-object v3
.end method

.method public dateRange(IIIIII)Lcom/rey/material/app/DatePickerDialog$Builder;
    .registers 7
    .param p1, "minDay"    # I
    .param p2, "minMonth"    # I
    .param p3, "minYear"    # I
    .param p4, "maxDay"    # I
    .param p5, "maxMonth"    # I
    .param p6, "maxYear"    # I

    .prologue
    .line 749
    iput p1, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMinDay:I

    .line 750
    iput p2, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMinMonth:I

    .line 751
    iput p3, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMinYear:I

    .line 752
    iput p4, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMaxDay:I

    .line 753
    iput p5, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMaxMonth:I

    .line 754
    iput p6, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMaxYear:I

    .line 755
    return-object p0
.end method

.method public dateRange(JJ)Lcom/rey/material/app/DatePickerDialog$Builder;
    .registers 15
    .param p1, "minTime"    # J
    .param p3, "maxTime"    # J

    .prologue
    const/4 v9, 0x5

    const/4 v8, 0x2

    const/4 v7, 0x1

    .line 759
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mCalendar:Ljava/util/Calendar;

    if-nez v0, :cond_d

    .line 760
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mCalendar:Ljava/util/Calendar;

    .line 762
    :cond_d
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 763
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v0, v9}, Ljava/util/Calendar;->get(I)I

    move-result v1

    .line 764
    .local v1, "minDay":I
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v0, v8}, Ljava/util/Calendar;->get(I)I

    move-result v2

    .line 765
    .local v2, "minMonth":I
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v0, v7}, Ljava/util/Calendar;->get(I)I

    move-result v3

    .line 766
    .local v3, "minYear":I
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v0, p3, p4}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 767
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v0, v9}, Ljava/util/Calendar;->get(I)I

    move-result v4

    .line 768
    .local v4, "maxDay":I
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v0, v8}, Ljava/util/Calendar;->get(I)I

    move-result v5

    .line 769
    .local v5, "maxMonth":I
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v0, v7}, Ljava/util/Calendar;->get(I)I

    move-result v6

    .local v6, "maxYear":I
    move-object v0, p0

    .line 771
    invoke-virtual/range {v0 .. v6}, Lcom/rey/material/app/DatePickerDialog$Builder;->dateRange(IIIIII)Lcom/rey/material/app/DatePickerDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDay()I
    .registers 2

    .prologue
    .line 794
    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mDay:I

    return v0
.end method

.method public getMonth()I
    .registers 2

    .prologue
    .line 798
    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMonth:I

    return v0
.end method

.method public getYear()I
    .registers 2

    .prologue
    .line 802
    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mYear:I

    return v0
.end method

.method protected onBuild(Landroid/content/Context;I)Lcom/rey/material/app/Dialog;
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "styleId"    # I

    .prologue
    .line 812
    new-instance v0, Lcom/rey/material/app/DatePickerDialog;

    invoke-direct {v0, p1, p2}, Lcom/rey/material/app/DatePickerDialog;-><init>(Landroid/content/Context;I)V

    .line 814
    .local v0, "dialog":Lcom/rey/material/app/DatePickerDialog;
    iget v1, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMinDay:I

    iget v2, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMinMonth:I

    iget v3, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMinYear:I

    iget v4, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMaxDay:I

    iget v5, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMaxMonth:I

    iget v6, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMaxYear:I

    invoke-virtual/range {v0 .. v6}, Lcom/rey/material/app/DatePickerDialog;->dateRange(IIIIII)Lcom/rey/material/app/DatePickerDialog;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mDay:I

    iget v3, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMonth:I

    iget v4, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mYear:I

    invoke-virtual {v1, v2, v3, v4}, Lcom/rey/material/app/DatePickerDialog;->date(III)Lcom/rey/material/app/DatePickerDialog;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/rey/material/app/DatePickerDialog;->onDateChangedListener(Lcom/rey/material/app/DatePickerDialog$OnDateChangedListener;)Lcom/rey/material/app/DatePickerDialog;

    .line 818
    return-object v0
.end method

.method public onDateChanged(IIIIII)V
    .registers 7
    .param p1, "oldDay"    # I
    .param p2, "oldMonth"    # I
    .param p3, "oldYear"    # I
    .param p4, "newDay"    # I
    .param p5, "newMonth"    # I
    .param p6, "newYear"    # I

    .prologue
    .line 823
    invoke-virtual {p0, p4, p5, p6}, Lcom/rey/material/app/DatePickerDialog$Builder;->date(III)Lcom/rey/material/app/DatePickerDialog$Builder;

    .line 824
    return-void
.end method

.method protected onReadFromParcel(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 832
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMinDay:I

    .line 833
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMinMonth:I

    .line 834
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMinYear:I

    .line 835
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMaxDay:I

    .line 836
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMaxMonth:I

    .line 837
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMaxYear:I

    .line 838
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mDay:I

    .line 839
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMonth:I

    .line 840
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mYear:I

    .line 841
    return-void
.end method

.method protected onWriteToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 845
    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMinDay:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 846
    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMinMonth:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 847
    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMinYear:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 848
    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMaxDay:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 849
    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMaxMonth:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 850
    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMaxYear:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 851
    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mDay:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 852
    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mMonth:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 853
    iget v0, p0, Lcom/rey/material/app/DatePickerDialog$Builder;->mYear:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 854
    return-void
.end method
