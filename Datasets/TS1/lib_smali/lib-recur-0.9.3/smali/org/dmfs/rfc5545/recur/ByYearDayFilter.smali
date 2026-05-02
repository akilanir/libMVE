.class final Lorg/dmfs/rfc5545/recur/ByYearDayFilter;
.super Lorg/dmfs/rfc5545/recur/ByFilter;


# instance fields
.field private final mYearDays:[I


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)V
    .registers 4

    invoke-direct {p0, p2}, Lorg/dmfs/rfc5545/recur/ByFilter;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)V

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYYEARDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getByPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lorg/dmfs/rfc5545/recur/StaticUtils;->ListToArray(Ljava/util/List;)[I

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByYearDayFilter;->mYearDays:[I

    return-void
.end method


# virtual methods
.method filter(J)Z
    .registers 8

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v0

    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/ByYearDayFilter;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v1, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerYear(I)I

    move-result v1

    iget-object v2, p0, Lorg/dmfs/rfc5545/recur/ByYearDayFilter;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v3

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v4

    invoke-virtual {v2, v0, v3, v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDayOfYear(III)I

    move-result v0

    iget-object v2, p0, Lorg/dmfs/rfc5545/recur/ByYearDayFilter;->mYearDays:[I

    invoke-static {v2, v0}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v2

    if-gez v2, :cond_2a

    iget-object v2, p0, Lorg/dmfs/rfc5545/recur/ByYearDayFilter;->mYearDays:[I

    sub-int v3, v0, v1

    invoke-static {v2, v3}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v2

    if-ltz v2, :cond_2c

    :cond_2a
    if-le v0, v1, :cond_2e

    :cond_2c
    const/4 v0, 0x1

    :goto_2d
    return v0

    :cond_2e
    const/4 v0, 0x0

    goto :goto_2d
.end method
