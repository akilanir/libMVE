.class public Lcom/rey/material/app/DatePickerDialog;
.super Lcom/rey/material/app/Dialog;
.source "DatePickerDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/app/DatePickerDialog$Builder;,
        Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;,
        Lcom/rey/material/app/DatePickerDialog$OnDateChangedListener;
    }
.end annotation


# instance fields
.field private mCornerRadius:F

.field private mDatePickerLayout:Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;

.field private mOnDateChangedListener:Lcom/rey/material/app/DatePickerDialog$OnDateChangedListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 57
    sget v0, Lcom/rey/material/R$style;->Material_App_Dialog_DatePicker_Light:I

    invoke-direct {p0, p1, v0}, Lcom/rey/material/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 58
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "style"    # I

    .prologue
    .line 61
    invoke-direct {p0, p1, p2}, Lcom/rey/material/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 62
    return-void
.end method

.method static synthetic access$000(Lcom/rey/material/app/DatePickerDialog;)Lcom/rey/material/app/DatePickerDialog$OnDateChangedListener;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/DatePickerDialog;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog;->mOnDateChangedListener:Lcom/rey/material/app/DatePickerDialog$OnDateChangedListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/rey/material/app/DatePickerDialog;)F
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/DatePickerDialog;

    .prologue
    .line 32
    iget v0, p0, Lcom/rey/material/app/DatePickerDialog;->mCornerRadius:F

    return v0
.end method


# virtual methods
.method public applyStyle(I)Lcom/rey/material/app/Dialog;
    .registers 4
    .param p1, "resId"    # I

    .prologue
    const/4 v1, -0x1

    .line 72
    invoke-super {p0, p1}, Lcom/rey/material/app/Dialog;->applyStyle(I)Lcom/rey/material/app/Dialog;

    .line 74
    if-nez p1, :cond_7

    .line 79
    :goto_6
    return-object p0

    .line 77
    :cond_7
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog;->mDatePickerLayout:Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;

    invoke-virtual {v0, p1}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->applyStyle(I)V

    .line 78
    invoke-virtual {p0, v1, v1}, Lcom/rey/material/app/DatePickerDialog;->layoutParams(II)Lcom/rey/material/app/Dialog;

    goto :goto_6
.end method

.method public cornerRadius(F)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "radius"    # F

    .prologue
    .line 89
    iput p1, p0, Lcom/rey/material/app/DatePickerDialog;->mCornerRadius:F

    .line 90
    invoke-super {p0, p1}, Lcom/rey/material/app/Dialog;->cornerRadius(F)Lcom/rey/material/app/Dialog;

    move-result-object v0

    return-object v0
.end method

.method public date(III)Lcom/rey/material/app/DatePickerDialog;
    .registers 5
    .param p1, "day"    # I
    .param p2, "month"    # I
    .param p3, "year"    # I

    .prologue
    .line 127
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog;->mDatePickerLayout:Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;

    invoke-virtual {v0, p1, p2, p3}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->setDate(III)V

    .line 128
    return-object p0
.end method

.method public date(J)Lcom/rey/material/app/DatePickerDialog;
    .registers 4
    .param p1, "time"    # J

    .prologue
    .line 137
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog;->mDatePickerLayout:Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->setDate(J)V

    .line 138
    return-object p0
.end method

.method public dateRange(IIIIII)Lcom/rey/material/app/DatePickerDialog;
    .registers 14
    .param p1, "minDay"    # I
    .param p2, "minMonth"    # I
    .param p3, "minYear"    # I
    .param p4, "maxDay"    # I
    .param p5, "maxMonth"    # I
    .param p6, "maxYear"    # I

    .prologue
    .line 104
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog;->mDatePickerLayout:Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->setDateRange(IIIIII)V

    .line 105
    return-object p0
.end method

.method public dateRange(JJ)Lcom/rey/material/app/DatePickerDialog;
    .registers 6
    .param p1, "minTime"    # J
    .param p3, "maxTime"    # J

    .prologue
    .line 115
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog;->mDatePickerLayout:Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->setDateRange(JJ)V

    .line 116
    return-object p0
.end method

.method public getCalendar()Ljava/util/Calendar;
    .registers 2

    .prologue
    .line 188
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog;->mDatePickerLayout:Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;

    invoke-virtual {v0}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->getCalendar()Ljava/util/Calendar;

    move-result-object v0

    return-object v0
.end method

.method public getDate()J
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 176
    invoke-virtual {p0}, Lcom/rey/material/app/DatePickerDialog;->getCalendar()Ljava/util/Calendar;

    move-result-object v0

    .line 177
    .local v0, "cal":Ljava/util/Calendar;
    const/16 v1, 0xe

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 178
    const/16 v1, 0xd

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 179
    const/16 v1, 0xc

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 180
    const/16 v1, 0xa

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 181
    const/4 v1, 0x5

    invoke-virtual {p0}, Lcom/rey/material/app/DatePickerDialog;->getDay()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 182
    const/4 v1, 0x2

    invoke-virtual {p0}, Lcom/rey/material/app/DatePickerDialog;->getMonth()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 183
    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/rey/material/app/DatePickerDialog;->getYear()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 184
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v1

    return-wide v1
.end method

.method public getDay()I
    .registers 2

    .prologue
    .line 155
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog;->mDatePickerLayout:Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;

    invoke-virtual {v0}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->getDay()I

    move-result v0

    return v0
.end method

.method public getFormattedDate(Ljava/text/DateFormat;)Ljava/lang/String;
    .registers 3
    .param p1, "formatter"    # Ljava/text/DateFormat;

    .prologue
    .line 197
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog;->mDatePickerLayout:Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;

    invoke-virtual {v0, p1}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->getFormattedDate(Ljava/text/DateFormat;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMonth()I
    .registers 2

    .prologue
    .line 162
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog;->mDatePickerLayout:Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;

    invoke-virtual {v0}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->getMonth()I

    move-result v0

    return v0
.end method

.method public getYear()I
    .registers 2

    .prologue
    .line 169
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog;->mDatePickerLayout:Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;

    invoke-virtual {v0}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->getYear()I

    move-result v0

    return v0
.end method

.method public layoutParams(II)Lcom/rey/material/app/Dialog;
    .registers 4
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    const/4 v0, -0x1

    .line 84
    invoke-super {p0, v0, v0}, Lcom/rey/material/app/Dialog;->layoutParams(II)Lcom/rey/material/app/Dialog;

    move-result-object v0

    return-object v0
.end method

.method protected onCreate()V
    .registers 3

    .prologue
    .line 66
    new-instance v0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;

    invoke-virtual {p0}, Lcom/rey/material/app/DatePickerDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;-><init>(Lcom/rey/material/app/DatePickerDialog;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rey/material/app/DatePickerDialog;->mDatePickerLayout:Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;

    .line 67
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog;->mDatePickerLayout:Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;

    invoke-virtual {p0, v0}, Lcom/rey/material/app/DatePickerDialog;->contentView(Landroid/view/View;)Lcom/rey/material/app/Dialog;

    .line 68
    return-void
.end method

.method public onDateChangedListener(Lcom/rey/material/app/DatePickerDialog$OnDateChangedListener;)Lcom/rey/material/app/DatePickerDialog;
    .registers 2
    .param p1, "listener"    # Lcom/rey/material/app/DatePickerDialog$OnDateChangedListener;

    .prologue
    .line 147
    iput-object p1, p0, Lcom/rey/material/app/DatePickerDialog;->mOnDateChangedListener:Lcom/rey/material/app/DatePickerDialog$OnDateChangedListener;

    .line 148
    return-object p0
.end method
