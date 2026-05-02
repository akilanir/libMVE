.class public Lcom/rey/material/app/TimePickerDialog;
.super Lcom/rey/material/app/Dialog;
.source "TimePickerDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/app/TimePickerDialog$Builder;,
        Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;,
        Lcom/rey/material/app/TimePickerDialog$OnTimeChangedListener;
    }
.end annotation


# instance fields
.field private mCornerRadius:F

.field private mTimePickerLayout:Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 54
    sget v0, Lcom/rey/material/R$style;->Material_App_Dialog_TimePicker_Light:I

    invoke-direct {p0, p1, v0}, Lcom/rey/material/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 55
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "style"    # I

    .prologue
    .line 58
    invoke-direct {p0, p1, p2}, Lcom/rey/material/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 59
    return-void
.end method

.method static synthetic access$000(Lcom/rey/material/app/TimePickerDialog;)F
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/TimePickerDialog;

    .prologue
    .line 32
    iget v0, p0, Lcom/rey/material/app/TimePickerDialog;->mCornerRadius:F

    return v0
.end method


# virtual methods
.method public applyStyle(I)Lcom/rey/material/app/Dialog;
    .registers 4
    .param p1, "resId"    # I

    .prologue
    const/4 v1, -0x1

    .line 69
    invoke-super {p0, p1}, Lcom/rey/material/app/Dialog;->applyStyle(I)Lcom/rey/material/app/Dialog;

    .line 71
    if-nez p1, :cond_7

    .line 76
    :goto_6
    return-object p0

    .line 74
    :cond_7
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog;->mTimePickerLayout:Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;

    invoke-virtual {v0, p1}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->applyStyle(I)V

    .line 75
    invoke-virtual {p0, v1, v1}, Lcom/rey/material/app/TimePickerDialog;->layoutParams(II)Lcom/rey/material/app/Dialog;

    goto :goto_6
.end method

.method public cornerRadius(F)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "radius"    # F

    .prologue
    .line 86
    iput p1, p0, Lcom/rey/material/app/TimePickerDialog;->mCornerRadius:F

    .line 87
    invoke-super {p0, p1}, Lcom/rey/material/app/Dialog;->cornerRadius(F)Lcom/rey/material/app/Dialog;

    move-result-object v0

    return-object v0
.end method

.method public getFormattedTime(Ljava/text/DateFormat;)Ljava/lang/String;
    .registers 3
    .param p1, "formatter"    # Ljava/text/DateFormat;

    .prologue
    .line 139
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog;->mTimePickerLayout:Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;

    invoke-virtual {v0, p1}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->getFormattedTime(Ljava/text/DateFormat;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHour()I
    .registers 2

    .prologue
    .line 123
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog;->mTimePickerLayout:Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;

    invoke-virtual {v0}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->getHour()I

    move-result v0

    return v0
.end method

.method public getMinute()I
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog;->mTimePickerLayout:Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;

    invoke-virtual {v0}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->getMinute()I

    move-result v0

    return v0
.end method

.method public hour(I)Lcom/rey/material/app/TimePickerDialog;
    .registers 3
    .param p1, "hour"    # I

    .prologue
    .line 96
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog;->mTimePickerLayout:Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;

    invoke-virtual {v0, p1}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->setHour(I)V

    .line 97
    return-object p0
.end method

.method public layoutParams(II)Lcom/rey/material/app/Dialog;
    .registers 4
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    const/4 v0, -0x1

    .line 81
    invoke-super {p0, v0, v0}, Lcom/rey/material/app/Dialog;->layoutParams(II)Lcom/rey/material/app/Dialog;

    move-result-object v0

    return-object v0
.end method

.method public minute(I)Lcom/rey/material/app/TimePickerDialog;
    .registers 3
    .param p1, "minute"    # I

    .prologue
    .line 106
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog;->mTimePickerLayout:Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;

    invoke-virtual {v0, p1}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->setMinute(I)V

    .line 107
    return-object p0
.end method

.method protected onCreate()V
    .registers 3

    .prologue
    .line 63
    new-instance v0, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;

    invoke-virtual {p0}, Lcom/rey/material/app/TimePickerDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;-><init>(Lcom/rey/material/app/TimePickerDialog;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rey/material/app/TimePickerDialog;->mTimePickerLayout:Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;

    .line 64
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog;->mTimePickerLayout:Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;

    invoke-virtual {p0, v0}, Lcom/rey/material/app/TimePickerDialog;->contentView(Landroid/view/View;)Lcom/rey/material/app/Dialog;

    .line 65
    return-void
.end method

.method public onTimeChangedListener(Lcom/rey/material/app/TimePickerDialog$OnTimeChangedListener;)Lcom/rey/material/app/TimePickerDialog;
    .registers 3
    .param p1, "listener"    # Lcom/rey/material/app/TimePickerDialog$OnTimeChangedListener;

    .prologue
    .line 115
    iget-object v0, p0, Lcom/rey/material/app/TimePickerDialog;->mTimePickerLayout:Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;

    invoke-virtual {v0, p1}, Lcom/rey/material/app/TimePickerDialog$TimePickerLayout;->setOnTimeChangedListener(Lcom/rey/material/app/TimePickerDialog$OnTimeChangedListener;)V

    .line 116
    return-object p0
.end method
