.class final Lorg/dmfs/rfc5545/recur/ByMonthSkipFilter;
.super Lorg/dmfs/rfc5545/recur/RuleIterator;


# static fields
.field private static final MAX_EMPTY_SETS:I = 0x3e8


# instance fields
.field private final mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

.field private final mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

.field private final mSkip:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

.field private mWorkingSet:Lorg/dmfs/rfc5545/recur/LongArray;


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V
    .registers 7

    invoke-direct {p0, p2}, Lorg/dmfs/rfc5545/recur/RuleIterator;-><init>(Lorg/dmfs/rfc5545/recur/RuleIterator;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByMonthSkipFilter;->mWorkingSet:Lorg/dmfs/rfc5545/recur/LongArray;

    new-instance v0, Lorg/dmfs/rfc5545/recur/LongArray;

    invoke-direct {v0}, Lorg/dmfs/rfc5545/recur/LongArray;-><init>()V

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByMonthSkipFilter;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    iput-object p3, p0, Lorg/dmfs/rfc5545/recur/ByMonthSkipFilter;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getSkip()Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByMonthSkipFilter;->mSkip:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    return-void
.end method


# virtual methods
.method public next()J
    .registers 3

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/ByMonthSkipFilter;->mWorkingSet:Lorg/dmfs/rfc5545/recur/LongArray;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/recur/LongArray;->hasNext()Z

    move-result v1

    if-nez v1, :cond_10

    :cond_a
    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/ByMonthSkipFilter;->nextSet()Lorg/dmfs/rfc5545/recur/LongArray;

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByMonthSkipFilter;->mWorkingSet:Lorg/dmfs/rfc5545/recur/LongArray;

    :cond_10
    invoke-virtual {v0}, Lorg/dmfs/rfc5545/recur/LongArray;->next()J

    move-result-wide v0

    return-wide v0
.end method

.method nextSet()Lorg/dmfs/rfc5545/recur/LongArray;
    .registers 9

    iget-object v3, p0, Lorg/dmfs/rfc5545/recur/ByMonthSkipFilter;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    iget-object v4, p0, Lorg/dmfs/rfc5545/recur/ByMonthSkipFilter;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v3}, Lorg/dmfs/rfc5545/recur/LongArray;->clear()V

    const/4 v0, 0x0

    :goto_8
    const/16 v1, 0x3e8

    if-ne v0, v1, :cond_14

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "too many empty recurrence sets"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_14
    add-int/lit8 v2, v0, 0x1

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/ByMonthSkipFilter;->mPrevious:Lorg/dmfs/rfc5545/recur/RuleIterator;

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/recur/RuleIterator;->nextSet()Lorg/dmfs/rfc5545/recur/LongArray;

    move-result-object v5

    :goto_1c
    invoke-virtual {v5}, Lorg/dmfs/rfc5545/recur/LongArray;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5e

    invoke-virtual {v5}, Lorg/dmfs/rfc5545/recur/LongArray;->next()J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->maskWeekday(J)J

    move-result-wide v0

    invoke-virtual {v4, v0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->validate(J)Z

    move-result v6

    if-nez v6, :cond_45

    const/4 v6, 0x1

    invoke-static {v0, v1, v6}, Lorg/dmfs/rfc5545/Instance;->setDayOfMonth(JI)J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->validate(J)Z

    move-result v6

    if-eqz v6, :cond_4e

    iget-object v6, p0, Lorg/dmfs/rfc5545/recur/ByMonthSkipFilter;->mSkip:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    sget-object v7, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;->BACKWARD:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    if-ne v6, v7, :cond_49

    invoke-virtual {v4, v0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->prevDay(J)J

    move-result-wide v0

    :cond_45
    :goto_45
    invoke-virtual {v3, v0, v1}, Lorg/dmfs/rfc5545/recur/LongArray;->add(J)V

    goto :goto_1c

    :cond_49
    invoke-virtual {v4, v0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->nextDay(J)J

    move-result-wide v0

    goto :goto_45

    :cond_4e
    iget-object v6, p0, Lorg/dmfs/rfc5545/recur/ByMonthSkipFilter;->mSkip:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    sget-object v7, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;->BACKWARD:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    if-ne v6, v7, :cond_59

    invoke-virtual {v4, v0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->prevMonth(J)J

    move-result-wide v0

    goto :goto_45

    :cond_59
    invoke-virtual {v4, v0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->nextMonth(J)J

    move-result-wide v0

    goto :goto_45

    :cond_5e
    invoke-virtual {v3}, Lorg/dmfs/rfc5545/recur/LongArray;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_65

    return-object v3

    :cond_65
    move v0, v2

    goto :goto_8
.end method
