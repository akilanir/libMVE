.class public final Lorg/dmfs/rfc5545/recur/FreqIterator;
.super Lorg/dmfs/rfc5545/recur/ByExpander;


# static fields
.field private static final MAX_EMPTY_SETS:I = 0x3e8


# instance fields
.field private final mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

.field private final mFreq:Lorg/dmfs/rfc5545/recur/Freq;

.field private final mInterval:I

.field private mNextInstance:J

.field private final mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V
    .registers 9

    const/4 v0, 0x0

    invoke-direct {p0, v0, p2, p3, p4}, Lorg/dmfs/rfc5545/recur/ByExpander;-><init>(Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V

    new-instance v0, Lorg/dmfs/rfc5545/recur/LongArray;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/LongArray;-><init>(I)V

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/FreqIterator;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getFreq()Lorg/dmfs/rfc5545/recur/Freq;

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/FreqIterator;->mFreq:Lorg/dmfs/rfc5545/recur/Freq;

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getInterval()I

    move-result v0

    iput v0, p0, Lorg/dmfs/rfc5545/recur/FreqIterator;->mInterval:I

    iput-object p2, p0, Lorg/dmfs/rfc5545/recur/FreqIterator;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-static {p3, p4}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v0

    invoke-static {p3, p4}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v1

    invoke-static {p3, p4}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v2

    iget-object v3, p0, Lorg/dmfs/rfc5545/recur/FreqIterator;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v3, v0, v1, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDayOfYear(III)I

    move-result v1

    iget-object v2, p0, Lorg/dmfs/rfc5545/recur/FreqIterator;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v2, v0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDayOfWeek(II)I

    move-result v0

    invoke-static {p3, p4, v0}, Lorg/dmfs/rfc5545/Instance;->setDayOfWeek(JI)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/dmfs/rfc5545/recur/FreqIterator;->mNextInstance:J

    return-void
.end method


# virtual methods
.method expand(JJ)V
    .registers 5

    return-void
.end method

.method fastForward(J)V
    .registers 10

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/FreqIterator;->mFreq:Lorg/dmfs/rfc5545/recur/Freq;

    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/FreqIterator;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget-wide v2, p0, Lorg/dmfs/rfc5545/recur/FreqIterator;->mNextInstance:J

    iget v4, p0, Lorg/dmfs/rfc5545/recur/FreqIterator;->mInterval:I

    move-wide v5, p1

    invoke-virtual/range {v0 .. v6}, Lorg/dmfs/rfc5545/recur/Freq;->next(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;JIJ)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/dmfs/rfc5545/recur/FreqIterator;->mNextInstance:J

    return-void
.end method

.method public next()J
    .registers 7

    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/FreqIterator;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    const/16 v0, 0x3e8

    :cond_4
    add-int/lit8 v0, v0, -0x1

    if-gez v0, :cond_10

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "too many empty recurrence sets"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10
    iget-wide v2, p0, Lorg/dmfs/rfc5545/recur/FreqIterator;->mNextInstance:J

    iget-object v4, p0, Lorg/dmfs/rfc5545/recur/FreqIterator;->mFreq:Lorg/dmfs/rfc5545/recur/Freq;

    iget v5, p0, Lorg/dmfs/rfc5545/recur/FreqIterator;->mInterval:I

    invoke-virtual {v4, v1, v2, v3, v5}, Lorg/dmfs/rfc5545/recur/Freq;->next(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;JI)J

    move-result-wide v4

    iput-wide v4, p0, Lorg/dmfs/rfc5545/recur/FreqIterator;->mNextInstance:J

    iget v4, p0, Lorg/dmfs/rfc5545/recur/FreqIterator;->mFilterCount:I

    if-lez v4, :cond_26

    invoke-virtual {p0, v2, v3}, Lorg/dmfs/rfc5545/recur/FreqIterator;->filter(J)Z

    move-result v4

    if-nez v4, :cond_4

    :cond_26
    return-wide v2
.end method

.method nextSet()Lorg/dmfs/rfc5545/recur/LongArray;
    .registers 4

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/FreqIterator;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/recur/LongArray;->clear()V

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/FreqIterator;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/FreqIterator;->next()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/dmfs/rfc5545/recur/LongArray;->add(J)V

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/FreqIterator;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    return-object v0
.end method
