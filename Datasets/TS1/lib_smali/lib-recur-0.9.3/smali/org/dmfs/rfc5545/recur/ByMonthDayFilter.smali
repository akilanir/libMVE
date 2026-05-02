.class final Lorg/dmfs/rfc5545/recur/ByMonthDayFilter;
.super Lorg/dmfs/rfc5545/recur/ByFilter;


# instance fields
.field private final mMonthDays:[I


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)V
    .registers 4

    invoke-direct {p0, p2}, Lorg/dmfs/rfc5545/recur/ByFilter;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)V

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTHDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getByPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lorg/dmfs/rfc5545/recur/StaticUtils;->ListToArray(Ljava/util/List;)[I

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByMonthDayFilter;->mMonthDays:[I

    return-void
.end method


# virtual methods
.method filter(J)Z
    .registers 7

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/ByMonthDayFilter;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v1

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerPackedMonth(II)I

    move-result v0

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v1

    iget-object v2, p0, Lorg/dmfs/rfc5545/recur/ByMonthDayFilter;->mMonthDays:[I

    invoke-static {v2, v1}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v2

    if-gez v2, :cond_25

    iget-object v2, p0, Lorg/dmfs/rfc5545/recur/ByMonthDayFilter;->mMonthDays:[I

    add-int/lit8 v3, v1, -0x1

    sub-int/2addr v3, v0

    invoke-static {v2, v3}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v2

    if-ltz v2, :cond_27

    :cond_25
    if-le v1, v0, :cond_29

    :cond_27
    const/4 v0, 0x1

    :goto_28
    return v0

    :cond_29
    const/4 v0, 0x0

    goto :goto_28
.end method
