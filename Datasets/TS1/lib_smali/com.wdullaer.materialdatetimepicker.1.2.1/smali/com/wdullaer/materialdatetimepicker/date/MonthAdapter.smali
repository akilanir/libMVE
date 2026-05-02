.class public abstract Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;
.super Landroid/widget/BaseAdapter;
.source "MonthAdapter.java"

# interfaces
.implements Lcom/wdullaer/materialdatetimepicker/date/MonthView$OnDayClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;
    }
.end annotation


# static fields
.field protected static final MONTHS_IN_YEAR:I = 0xc

.field private static final TAG:Ljava/lang/String; = "SimpleMonthAdapter"

.field protected static WEEK_7_OVERHANG_HEIGHT:I


# instance fields
.field private final mContext:Landroid/content/Context;

.field protected final mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

.field private mSelectedDay:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 44
    const/4 v0, 0x7

    sput v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->WEEK_7_OVERHANG_HEIGHT:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "controller"    # Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    .prologue
    .line 119
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 120
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->mContext:Landroid/content/Context;

    .line 121
    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    .line 122
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->init()V

    .line 123
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->getSelectedDay()Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->setSelectedDay(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;)V

    .line 124
    return-void
.end method

.method private isSelectedDayInMonth(II)Z
    .registers 4
    .param p1, "year"    # I
    .param p2, "month"    # I

    .prologue
    .line 215
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->mSelectedDay:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->year:I

    if-ne v0, p1, :cond_e

    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->mSelectedDay:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->month:I

    if-ne v0, p2, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method


# virtual methods
.method public abstract createMonthView(Landroid/content/Context;)Lcom/wdullaer/materialdatetimepicker/date/MonthView;
.end method

.method public getCount()I
    .registers 3

    .prologue
    .line 149
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->getMaxYear()I

    move-result v0

    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->getMinYear()I

    move-result v1

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    mul-int/lit8 v0, v0, 0xc

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 154
    const/4 v0, 0x0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 159
    int-to-long v0, p1

    return-wide v0
.end method

.method public getSelectedDay()Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;
    .registers 2

    .prologue
    .line 137
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->mSelectedDay:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 12
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/4 v7, -0x1

    .line 172
    const/4 v0, 0x0

    .line 173
    .local v0, "drawingParams":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    if-eqz p2, :cond_62

    move-object v4, p2

    .line 174
    check-cast v4, Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .line 176
    .local v4, "v":Lcom/wdullaer/materialdatetimepicker/date/MonthView;
    invoke-virtual {v4}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getTag()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "drawingParams":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    check-cast v0, Ljava/util/HashMap;

    .line 186
    .restart local v0    # "drawingParams":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    :goto_d
    if-nez v0, :cond_14

    .line 187
    new-instance v0, Ljava/util/HashMap;

    .end local v0    # "drawingParams":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 189
    .restart local v0    # "drawingParams":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    :cond_14
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 191
    rem-int/lit8 v1, p1, 0xc

    .line 192
    .local v1, "month":I
    div-int/lit8 v6, p1, 0xc

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v7}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->getMinYear()I

    move-result v7

    add-int v5, v6, v7

    .line 194
    .local v5, "year":I
    const/4 v3, -0x1

    .line 195
    .local v3, "selectedDay":I
    invoke-direct {p0, v5, v1}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->isSelectedDayInMonth(II)Z

    move-result v6

    if-eqz v6, :cond_2e

    .line 196
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->mSelectedDay:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    iget v3, v6, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->day:I

    .line 201
    :cond_2e
    invoke-virtual {v4}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->reuse()V

    .line 203
    const-string v6, "selected_day"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    const-string v6, "year"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    const-string v6, "month"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    const-string v6, "week_start"

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v7}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->getFirstDayOfWeek()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    invoke-virtual {v4, v0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->setMonthParams(Ljava/util/HashMap;)V

    .line 208
    invoke-virtual {v4}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->invalidate()V

    .line 209
    return-object v4

    .line 178
    .end local v1    # "month":I
    .end local v3    # "selectedDay":I
    .end local v4    # "v":Lcom/wdullaer/materialdatetimepicker/date/MonthView;
    .end local v5    # "year":I
    :cond_62
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v6}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->createMonthView(Landroid/content/Context;)Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    move-result-object v4

    .line 180
    .restart local v4    # "v":Lcom/wdullaer/materialdatetimepicker/date/MonthView;
    new-instance v2, Landroid/widget/AbsListView$LayoutParams;

    invoke-direct {v2, v7, v7}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    .line 182
    .local v2, "params":Landroid/widget/AbsListView$LayoutParams;
    invoke-virtual {v4, v2}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 183
    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->setClickable(Z)V

    .line 184
    invoke-virtual {v4, p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->setOnDayClickListener(Lcom/wdullaer/materialdatetimepicker/date/MonthView$OnDayClickListener;)V

    goto :goto_d
.end method

.method public hasStableIds()Z
    .registers 2

    .prologue
    .line 164
    const/4 v0, 0x1

    return v0
.end method

.method protected init()V
    .registers 4

    .prologue
    .line 144
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;-><init>(J)V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->mSelectedDay:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    .line 145
    return-void
.end method

.method public onDayClick(Lcom/wdullaer/materialdatetimepicker/date/MonthView;Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;)V
    .registers 3
    .param p1, "view"    # Lcom/wdullaer/materialdatetimepicker/date/MonthView;
    .param p2, "day"    # Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    .prologue
    .line 221
    if-eqz p2, :cond_5

    .line 222
    invoke-virtual {p0, p2}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->onDayTapped(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;)V

    .line 224
    :cond_5
    return-void
.end method

.method protected onDayTapped(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;)V
    .registers 6
    .param p1, "day"    # Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    .prologue
    .line 232
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    invoke-interface {v0}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->tryVibrate()V

    .line 233
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->mController:Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;

    iget v1, p1, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->year:I

    iget v2, p1, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->month:I

    iget v3, p1, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->day:I

    invoke-interface {v0, v1, v2, v3}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerController;->onDayOfMonthSelected(III)V

    .line 234
    invoke-virtual {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->setSelectedDay(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;)V

    .line 235
    return-void
.end method

.method public setSelectedDay(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;)V
    .registers 2
    .param p1, "day"    # Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    .prologue
    .line 132
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->mSelectedDay:Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    .line 133
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;->notifyDataSetChanged()V

    .line 134
    return-void
.end method
