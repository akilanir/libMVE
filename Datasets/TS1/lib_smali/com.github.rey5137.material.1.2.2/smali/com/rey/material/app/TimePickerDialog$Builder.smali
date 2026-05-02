.class public Lcom/rey/material/app/TimePickerDialog$Builder;
.super Lcom/rey/material/app/Dialog$Builder;
.source "TimePickerDialog.java"

# interfaces
.implements Lcom/rey/material/app/TimePickerDialog$OnTimeChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/TimePickerDialog;
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
            "Lcom/rey/material/app/TimePickerDialog$Builder;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected mHour:I

.field protected mMinute:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 680
    new-instance v0, Lcom/rey/material/app/TimePickerDialog$Builder$1;

    invoke-direct {v0}, Lcom/rey/material/app/TimePickerDialog$Builder$1;-><init>()V

    sput-object v0, Lcom/rey/material/app/TimePickerDialog$Builder;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 611
    sget v1, Lcom/rey/material/R$style;->Material_App_Dialog_TimePicker_Light:I

    invoke-direct {p0, v1}, Lcom/rey/material/app/Dialog$Builder;-><init>(I)V

    .line 612
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 613
    .local v0, "cal":Ljava/util/Calendar;
    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    iput v1, p0, Lcom/rey/material/app/TimePickerDialog$Builder;->mHour:I

    .line 614
    const/16 v1, 0xc

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    iput v1, p0, Lcom/rey/material/app/TimePickerDialog$Builder;->mMinute:I

    .line 615
    return-void
.end method

.method public constructor <init>(II)V
    .registers 4
    .param p1, "hourOfDay"    # I
    .param p2, "minute"    # I

    .prologue
    .line 618
    sget v0, Lcom/rey/material/R$style;->Material_App_Dialog_TimePicker_Light:I

    invoke-direct {p0, v0, p1, p2}, Lcom/rey/material/app/TimePickerDialog$Builder;-><init>(III)V

    .line 619
    return-void
.end method

.method public constructor <init>(III)V
    .registers 4
    .param p1, "styleId"    # I
    .param p2, "hourOfDay"    # I
    .param p3, "minute"    # I

    .prologue
    .line 622
    invoke-direct {p0, p1}, Lcom/rey/material/app/Dialog$Builder;-><init>(I)V

    .line 623
    invoke-virtual {p0, p2}, Lcom/rey/material/app/TimePickerDialog$Builder;->hour(I)Lcom/rey/material/app/TimePickerDialog$Builder;

    .line 624
    invoke-virtual {p0, p3}, Lcom/rey/material/app/TimePickerDialog$Builder;->minute(I)Lcom/rey/material/app/TimePickerDialog$Builder;

    .line 625
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .registers 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 665
    invoke-direct {p0, p1}, Lcom/rey/material/app/Dialog$Builder;-><init>(Landroid/os/Parcel;)V

    .line 666
    return-void
.end method


# virtual methods
.method public contentView(I)Lcom/rey/material/app/Dialog$Builder;
    .registers 2
    .param p1, "layoutId"    # I

    .prologue
    .line 647
    return-object p0
.end method

.method public getHour()I
    .registers 2

    .prologue
    .line 638
    iget v0, p0, Lcom/rey/material/app/TimePickerDialog$Builder;->mHour:I

    return v0
.end method

.method public getMinute()I
    .registers 2

    .prologue
    .line 642
    iget v0, p0, Lcom/rey/material/app/TimePickerDialog$Builder;->mMinute:I

    return v0
.end method

.method public hour(I)Lcom/rey/material/app/TimePickerDialog$Builder;
    .registers 4
    .param p1, "hour"    # I

    .prologue
    .line 628
    const/4 v0, 0x0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/16 v1, 0x18

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/TimePickerDialog$Builder;->mHour:I

    .line 629
    return-object p0
.end method

.method public minute(I)Lcom/rey/material/app/TimePickerDialog$Builder;
    .registers 2
    .param p1, "minute"    # I

    .prologue
    .line 633
    iput p1, p0, Lcom/rey/material/app/TimePickerDialog$Builder;->mMinute:I

    .line 634
    return-object p0
.end method

.method protected onBuild(Landroid/content/Context;I)Lcom/rey/material/app/Dialog;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "styleId"    # I

    .prologue
    .line 652
    new-instance v0, Lcom/rey/material/app/TimePickerDialog;

    invoke-direct {v0, p1, p2}, Lcom/rey/material/app/TimePickerDialog;-><init>(Landroid/content/Context;I)V

    .line 653
    .local v0, "dialog":Lcom/rey/material/app/TimePickerDialog;
    iget v1, p0, Lcom/rey/material/app/TimePickerDialog$Builder;->mHour:I

    invoke-virtual {v0, v1}, Lcom/rey/material/app/TimePickerDialog;->hour(I)Lcom/rey/material/app/TimePickerDialog;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/app/TimePickerDialog$Builder;->mMinute:I

    invoke-virtual {v1, v2}, Lcom/rey/material/app/TimePickerDialog;->minute(I)Lcom/rey/material/app/TimePickerDialog;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/rey/material/app/TimePickerDialog;->onTimeChangedListener(Lcom/rey/material/app/TimePickerDialog$OnTimeChangedListener;)Lcom/rey/material/app/TimePickerDialog;

    .line 656
    return-object v0
.end method

.method protected onReadFromParcel(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 676
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/TimePickerDialog$Builder;->mHour:I

    .line 677
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/TimePickerDialog$Builder;->mMinute:I

    .line 678
    return-void
.end method

.method public onTimeChanged(IIII)V
    .registers 6
    .param p1, "oldHour"    # I
    .param p2, "oldMinute"    # I
    .param p3, "newHour"    # I
    .param p4, "newMinute"    # I

    .prologue
    .line 661
    invoke-virtual {p0, p3}, Lcom/rey/material/app/TimePickerDialog$Builder;->hour(I)Lcom/rey/material/app/TimePickerDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p4}, Lcom/rey/material/app/TimePickerDialog$Builder;->minute(I)Lcom/rey/material/app/TimePickerDialog$Builder;

    .line 662
    return-void
.end method

.method protected onWriteToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 670
    iget v0, p0, Lcom/rey/material/app/TimePickerDialog$Builder;->mHour:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 671
    iget v0, p0, Lcom/rey/material/app/TimePickerDialog$Builder;->mMinute:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 672
    return-void
.end method
