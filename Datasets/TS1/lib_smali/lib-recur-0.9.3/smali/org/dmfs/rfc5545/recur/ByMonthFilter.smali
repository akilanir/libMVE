.class final Lorg/dmfs/rfc5545/recur/ByMonthFilter;
.super Lorg/dmfs/rfc5545/recur/ByFilter;


# instance fields
.field private final mAllowOverlappingWeeks:Z

.field private final mMonths:[I


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)V
    .registers 5

    invoke-direct {p0, p2}, Lorg/dmfs/rfc5545/recur/ByFilter;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)V

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTH:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getByPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lorg/dmfs/rfc5545/recur/StaticUtils;->ListToArray(Ljava/util/List;)[I

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByMonthFilter;->mMonths:[I

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getFreq()Lorg/dmfs/rfc5545/recur/Freq;

    move-result-object v0

    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq;->WEEKLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne v0, v1, :cond_33

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-nez v0, :cond_2f

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTHDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-nez v0, :cond_2f

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYYEARDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-eqz v0, :cond_33

    :cond_2f
    const/4 v0, 0x1

    :goto_30
    iput-boolean v0, p0, Lorg/dmfs/rfc5545/recur/ByMonthFilter;->mAllowOverlappingWeeks:Z

    return-void

    :cond_33
    const/4 v0, 0x0

    goto :goto_30
.end method


# virtual methods
.method filter(J)Z
    .registers 10

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v2

    iget-boolean v3, p0, Lorg/dmfs/rfc5545/recur/ByMonthFilter;->mAllowOverlappingWeeks:Z

    if-nez v3, :cond_15

    iget-object v3, p0, Lorg/dmfs/rfc5545/recur/ByMonthFilter;->mMonths:[I

    invoke-static {v3, v2}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v2

    if-gez v2, :cond_13

    :cond_12
    :goto_12
    return v0

    :cond_13
    move v0, v1

    goto :goto_12

    :cond_15
    iget-object v3, p0, Lorg/dmfs/rfc5545/recur/ByMonthFilter;->mMonths:[I

    iget-object v4, p0, Lorg/dmfs/rfc5545/recur/ByMonthFilter;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-static {v3, v2}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v2

    if-ltz v2, :cond_21

    move v0, v1

    goto :goto_12

    :cond_21
    invoke-virtual {v4, p1, p2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->startOfWeek(J)J

    move-result-wide v5

    invoke-static {v5, v6}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v2

    invoke-static {v3, v2}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v2

    if-ltz v2, :cond_31

    move v0, v1

    goto :goto_12

    :cond_31
    const/4 v2, 0x6

    invoke-virtual {v4, v5, v6, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->nextDay(JI)J

    move-result-wide v4

    invoke-static {v4, v5}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v2

    invoke-static {v3, v2}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v2

    if-ltz v2, :cond_12

    move v0, v1

    goto :goto_12
.end method
