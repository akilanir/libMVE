.class public final Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;
.super Lorg/dmfs/rfc5545/recur/ByExpander;


# instance fields
.field private mCount:I

.field private final mInstanceLimit:I

.field private final mInterval:I

.field private mNextInstance:J

.field private final mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

.field private final mStart:J

.field private mYear:I

.field private mYearDay:I


# direct methods
.method private constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;JJ)V
    .registers 10

    const/4 v0, 0x0

    invoke-direct {p0, v0, p2, p5, p6}, Lorg/dmfs/rfc5545/recur/ByExpander;-><init>(Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V

    new-instance v0, Lorg/dmfs/rfc5545/recur/LongArray;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/LongArray;-><init>(I)V

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getInterval()I

    move-result v0

    iput v0, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mInterval:I

    iput-wide p3, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mStart:J

    iput-wide p5, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mNextInstance:J

    invoke-static {p5, p6}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v0

    iput v0, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mYear:I

    iget v0, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mYear:I

    invoke-static {p5, p6}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v1

    invoke-static {p5, p6}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v2

    invoke-virtual {p2, v0, v1, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDayOfYear(III)I

    move-result v0

    iput v0, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mYearDay:I

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getCount()Ljava/lang/Integer;

    move-result-object v0

    if-nez v0, :cond_36

    const/4 v0, -0x1

    :goto_33
    iput v0, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mInstanceLimit:I

    return-void

    :cond_36
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_33
.end method

.method public static getInstance(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;
    .registers 11

    const/4 v0, 0x0

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getFreq()Lorg/dmfs/rfc5545/recur/Freq;

    move-result-object v1

    sget-object v2, Lorg/dmfs/rfc5545/recur/Freq;->WEEKLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne v1, v2, :cond_51

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTH:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p0, v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v1

    if-nez v1, :cond_51

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYYEARDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p0, v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v1

    if-nez v1, :cond_51

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTHDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p0, v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v1

    if-nez v1, :cond_51

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYWEEKNO:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p0, v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v1

    if-nez v1, :cond_51

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYHOUR:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p0, v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v1

    if-nez v1, :cond_51

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMINUTE:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p0, v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v1

    if-nez v1, :cond_51

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYSECOND:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p0, v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v1

    if-nez v1, :cond_51

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYSETPOS:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p0, v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v1

    if-nez v1, :cond_51

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getSkip()Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    move-result-object v1

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;->OMIT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    if-eq v1, v2, :cond_52

    :cond_51
    :goto_51
    return-object v0

    :cond_52
    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getByDayPart()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_5f

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_51

    :cond_5f
    if-eqz v1, :cond_b4

    const/4 v0, 0x0

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;

    iget-object v0, v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;->weekday:Lorg/dmfs/rfc5545/Weekday;

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/Weekday;->ordinal()I

    move-result v0

    invoke-static {p2, p3}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v1

    invoke-static {p2, p3}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v2

    invoke-static {p2, p3}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v3

    invoke-virtual {p1, v1, v2, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDayOfYear(III)I

    move-result v2

    invoke-virtual {p1, v1, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDayOfWeek(II)I

    move-result v3

    if-eq v3, v0, :cond_b4

    sub-int/2addr v0, v3

    add-int/lit8 v0, v0, 0x7

    rem-int/lit8 v0, v0, 0x7

    add-int/2addr v0, v2

    invoke-static {p2, p3}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v2

    invoke-virtual {p1, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerYear(I)I

    move-result v2

    if-le v0, v2, :cond_97

    add-int/lit8 v1, v1, 0x1

    sub-int/2addr v0, v2

    :cond_97
    invoke-virtual {p1, v1, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v0

    invoke-static {p2, p3, v1}, Lorg/dmfs/rfc5545/Instance;->setYear(JI)J

    move-result-wide v1

    invoke-static {v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->packedMonth(I)I

    move-result v3

    invoke-static {v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->dayOfMonth(I)I

    move-result v0

    invoke-static {v1, v2, v3, v0}, Lorg/dmfs/rfc5545/Instance;->setMonthAndDayOfMonth(JII)J

    move-result-wide v5

    :goto_ab
    new-instance v0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;

    move-object v1, p0

    move-object v2, p1

    move-wide v3, p2

    invoke-direct/range {v0 .. v6}, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;JJ)V

    goto :goto_51

    :cond_b4
    move-wide v5, p2

    goto :goto_ab
.end method


# virtual methods
.method expand(JJ)V
    .registers 5

    return-void
.end method

.method fastForward(J)V
    .registers 11

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v1

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v2

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    add-int/lit8 v3, v1, -0x1

    invoke-virtual {v0, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthsPerYear(I)I

    move-result v3

    iget-wide v4, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mNextInstance:J

    invoke-static {v4, v5}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v0

    :goto_16
    iget v4, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mYear:I

    add-int/lit8 v5, v1, -0x1

    if-lt v4, v5, :cond_2e

    iget v4, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mYear:I

    add-int/lit8 v5, v1, -0x1

    if-ne v4, v5, :cond_28

    if-nez v2, :cond_28

    add-int/lit8 v4, v3, -0x1

    if-lt v0, v4, :cond_2e

    :cond_28
    iget v4, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mYear:I

    if-ne v4, v1, :cond_3f

    if-ge v0, v2, :cond_3f

    :cond_2e
    iget-wide v4, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mNextInstance:J

    const-wide/high16 v6, -0x8000000000000000L

    cmp-long v0, v4, v6

    if-lez v0, :cond_3f

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->next()J

    move-result-wide v4

    invoke-static {v4, v5}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v0

    goto :goto_16

    :cond_3f
    return-void
.end method

.method public next()J
    .registers 7

    iget v0, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mCount:I

    if-nez v0, :cond_13

    iget-wide v0, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mStart:J

    iget-wide v2, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mNextInstance:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_13

    iget-wide v0, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mStart:J

    :goto_12
    return-wide v0

    :cond_13
    iget v0, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mInstanceLimit:I

    if-lez v0, :cond_22

    iget v0, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mCount:I

    iget v1, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mInstanceLimit:I

    if-le v0, v1, :cond_22

    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mNextInstance:J

    goto :goto_12

    :cond_22
    iget-wide v1, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mNextInstance:J

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget v3, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mYear:I

    invoke-virtual {v0, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerYear(I)I

    move-result v0

    iget v3, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mYearDay:I

    iget v4, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mInterval:I

    mul-int/lit8 v4, v4, 0x7

    add-int/2addr v3, v4

    iput v3, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mYearDay:I

    :goto_35
    iget v3, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mYearDay:I

    if-le v3, v0, :cond_4e

    iget v3, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mYear:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mYear:I

    iget v3, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mYearDay:I

    sub-int v0, v3, v0

    iput v0, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mYearDay:I

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget v3, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mYear:I

    invoke-virtual {v0, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerYear(I)I

    move-result v0

    goto :goto_35

    :cond_4e
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget v3, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mYear:I

    iget v4, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mYearDay:I

    invoke-virtual {v0, v3, v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v0

    iget-wide v3, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mNextInstance:J

    iget v5, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mYear:I

    invoke-static {v3, v4, v5}, Lorg/dmfs/rfc5545/Instance;->setYear(JI)J

    move-result-wide v3

    invoke-static {v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->packedMonth(I)I

    move-result v5

    invoke-static {v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->dayOfMonth(I)I

    move-result v0

    invoke-static {v3, v4, v5, v0}, Lorg/dmfs/rfc5545/Instance;->setMonthAndDayOfMonth(JII)J

    move-result-wide v3

    iput-wide v3, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mNextInstance:J

    move-wide v0, v1

    goto :goto_12
.end method

.method nextSet()Lorg/dmfs/rfc5545/recur/LongArray;
    .registers 4

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/recur/LongArray;->clear()V

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->next()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/dmfs/rfc5545/recur/LongArray;->add(J)V

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    return-object v0
.end method
