.class public Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;
.super Ljava/lang/Object;
.source "MonthAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CalendarDay"
.end annotation


# instance fields
.field private calendar:Ljava/util/Calendar;

.field day:I

.field month:I

.field year:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->setTime(J)V

    .line 59
    return-void
.end method

.method public constructor <init>(III)V
    .registers 4
    .param p1, "year"    # I
    .param p2, "month"    # I
    .param p3, "day"    # I

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    invoke-virtual {p0, p1, p2, p3}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->setDay(III)V

    .line 73
    return-void
.end method

.method public constructor <init>(J)V
    .registers 3
    .param p1, "timeInMillis"    # J

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    invoke-direct {p0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->setTime(J)V

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/util/Calendar;)V
    .registers 3
    .param p1, "calendar"    # Ljava/util/Calendar;

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v0

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->year:I

    .line 67
    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v0

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->month:I

    .line 68
    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v0

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->day:I

    .line 69
    return-void
.end method

.method private setTime(J)V
    .registers 5
    .param p1, "timeInMillis"    # J

    .prologue
    .line 88
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->calendar:Ljava/util/Calendar;

    if-nez v0, :cond_a

    .line 89
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->calendar:Ljava/util/Calendar;

    .line 91
    :cond_a
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->calendar:Ljava/util/Calendar;

    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 92
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->calendar:Ljava/util/Calendar;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v0

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->month:I

    .line 93
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->calendar:Ljava/util/Calendar;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v0

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->year:I

    .line 94
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->calendar:Ljava/util/Calendar;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v0

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->day:I

    .line 95
    return-void
.end method


# virtual methods
.method public getDay()I
    .registers 2

    .prologue
    .line 106
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->day:I

    return v0
.end method

.method public getMonth()I
    .registers 2

    .prologue
    .line 102
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->month:I

    return v0
.end method

.method public getYear()I
    .registers 2

    .prologue
    .line 98
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->year:I

    return v0
.end method

.method public set(Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;)V
    .registers 3
    .param p1, "date"    # Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;

    .prologue
    .line 76
    iget v0, p1, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->year:I

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->year:I

    .line 77
    iget v0, p1, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->month:I

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->month:I

    .line 78
    iget v0, p1, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->day:I

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->day:I

    .line 79
    return-void
.end method

.method public setDay(III)V
    .registers 4
    .param p1, "year"    # I
    .param p2, "month"    # I
    .param p3, "day"    # I

    .prologue
    .line 82
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->year:I

    .line 83
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->month:I

    .line 84
    iput p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthAdapter$CalendarDay;->day:I

    .line 85
    return-void
.end method
