.class final Lorg/dmfs/rfc5545/recur/SanityFilter;
.super Lorg/dmfs/rfc5545/recur/RuleIterator;


# static fields
.field private static final MAX_EMPTY_SETS:I = 0x3e8

.field private static final MAX_FILTERED_INSTANCES:I = 0x3e8


# instance fields
.field private final mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

.field private final mFilterStart:Z

.field private mFirst:Z

.field private mLastResult:J

.field private final mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

.field private final mStart:J


# direct methods
.method constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V
    .registers 8

    const/4 v0, 0x1

    invoke-direct {p0, p2}, Lorg/dmfs/rfc5545/recur/RuleIterator;-><init>(Lorg/dmfs/rfc5545/recur/RuleIterator;)V

    iput-boolean v0, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mFirst:Z

    new-instance v1, Lorg/dmfs/rfc5545/recur/LongArray;

    invoke-direct {v1}, Lorg/dmfs/rfc5545/recur/LongArray;-><init>()V

    iput-object v1, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    iput-wide p4, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mStart:J

    iput-object p3, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYSETPOS:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v1

    if-nez v1, :cond_24

    :goto_19
    iput-boolean v0, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mFilterStart:Z

    iget-boolean v0, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mFilterStart:Z

    if-eqz v0, :cond_26

    iget-wide v0, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mStart:J

    :goto_21
    iput-wide v0, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mLastResult:J

    return-void

    :cond_24
    const/4 v0, 0x0

    goto :goto_19

    :cond_26
    const-wide/high16 v0, -0x8000000000000000L

    goto :goto_21
.end method


# virtual methods
.method public next()J
    .registers 10

    iget-object v3, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget-boolean v0, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mFirst:Z

    if-eqz v0, :cond_10

    iget-boolean v0, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mFilterStart:Z

    if-eqz v0, :cond_10

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mFirst:Z

    iget-wide v0, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mStart:J

    :goto_f
    return-wide v0

    :cond_10
    const/4 v0, -0x1

    iget-wide v4, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mLastResult:J

    :goto_13
    add-int/lit8 v2, v0, 0x1

    const/16 v0, 0x3e8

    if-ne v2, v0, :cond_21

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "too many filtered recurrence instances"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_21
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mPrevious:Lorg/dmfs/rfc5545/recur/RuleIterator;

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/recur/RuleIterator;->next()J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->maskWeekday(J)J

    move-result-wide v6

    cmp-long v8, v4, v6

    if-gez v8, :cond_38

    invoke-virtual {v3, v6, v7}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->validate(J)Z

    move-result v8

    if-eqz v8, :cond_38

    iput-wide v6, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mLastResult:J

    goto :goto_f

    :cond_38
    move v0, v2

    goto :goto_13
.end method

.method nextSet()Lorg/dmfs/rfc5545/recur/LongArray;
    .registers 12

    const/4 v2, 0x0

    iget-object v5, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    const-wide/high16 v0, -0x8000000000000000L

    iget-object v6, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v5}, Lorg/dmfs/rfc5545/recur/LongArray;->clear()V

    iget-boolean v3, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mFirst:Z

    if-eqz v3, :cond_19

    iget-boolean v3, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mFilterStart:Z

    if-eqz v3, :cond_19

    iput-boolean v2, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mFirst:Z

    iget-wide v0, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mStart:J

    invoke-virtual {v5, v0, v1}, Lorg/dmfs/rfc5545/recur/LongArray;->add(J)V

    :cond_19
    :goto_19
    const/16 v3, 0x3e8

    if-ne v2, v3, :cond_25

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "too many empty recurrence sets"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_25
    add-int/lit8 v4, v2, 0x1

    iget-object v2, p0, Lorg/dmfs/rfc5545/recur/SanityFilter;->mPrevious:Lorg/dmfs/rfc5545/recur/RuleIterator;

    invoke-virtual {v2}, Lorg/dmfs/rfc5545/recur/RuleIterator;->nextSet()Lorg/dmfs/rfc5545/recur/LongArray;

    move-result-object v7

    :cond_2d
    :goto_2d
    invoke-virtual {v7}, Lorg/dmfs/rfc5545/recur/LongArray;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4a

    invoke-virtual {v7}, Lorg/dmfs/rfc5545/recur/LongArray;->next()J

    move-result-wide v8

    invoke-static {v8, v9}, Lorg/dmfs/rfc5545/Instance;->maskWeekday(J)J

    move-result-wide v2

    cmp-long v10, v0, v2

    if-gez v10, :cond_2d

    invoke-virtual {v6, v2, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->validate(J)Z

    move-result v10

    if-eqz v10, :cond_2d

    invoke-virtual {v5, v8, v9}, Lorg/dmfs/rfc5545/recur/LongArray;->add(J)V

    move-wide v0, v2

    goto :goto_2d

    :cond_4a
    invoke-virtual {v5}, Lorg/dmfs/rfc5545/recur/LongArray;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_51

    return-object v5

    :cond_51
    move v2, v4

    goto :goto_19
.end method
