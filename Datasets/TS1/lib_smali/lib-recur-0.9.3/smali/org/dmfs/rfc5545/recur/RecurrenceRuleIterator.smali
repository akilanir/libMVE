.class public final Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;
.super Ljava/lang/Object;


# instance fields
.field private final mAllDay:Z

.field private final mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

.field private mNextDateTime:Lorg/dmfs/rfc5545/DateTime;

.field private mNextInstance:J

.field private mNextMillis:J

.field private final mRuleIterator:Lorg/dmfs/rfc5545/recur/RuleIterator;

.field private final mTimeZone:Ljava/util/TimeZone;


# direct methods
.method constructor <init>(Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/DateTime;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)V
    .registers 7

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/high16 v1, -0x8000000000000000L

    iput-wide v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextMillis:J

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextDateTime:Lorg/dmfs/rfc5545/DateTime;

    iput-object p1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mRuleIterator:Lorg/dmfs/rfc5545/recur/RuleIterator;

    invoke-virtual {p2}, Lorg/dmfs/rfc5545/DateTime;->isAllDay()Z

    move-result v1

    iput-boolean v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mAllDay:Z

    iput-object p3, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {p2}, Lorg/dmfs/rfc5545/DateTime;->isFloating()Z

    move-result v1

    if-eqz v1, :cond_20

    :goto_1a
    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mTimeZone:Ljava/util/TimeZone;

    invoke-direct {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->fetchNextInstance()V

    return-void

    :cond_20
    invoke-virtual {p2}, Lorg/dmfs/rfc5545/DateTime;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v0

    goto :goto_1a
.end method

.method private fetchNextInstance()V
    .registers 3

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mRuleIterator:Lorg/dmfs/rfc5545/recur/RuleIterator;

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/recur/RuleIterator;->next()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextInstance:J

    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextMillis:J

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextDateTime:Lorg/dmfs/rfc5545/DateTime;

    return-void
.end method


# virtual methods
.method public fastForward(J)V
    .registers 11

    const-wide/high16 v6, -0x8000000000000000L

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_9

    :cond_8
    :goto_8
    return-void

    :cond_9
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mTimeZone:Ljava/util/TimeZone;

    invoke-virtual {v0, p1, p2, v1}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->toInstance(JLjava/util/TimeZone;)J

    move-result-wide v2

    iget-wide v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextInstance:J

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->maskWeekday(J)J

    move-result-wide v0

    cmp-long v4, v2, v0

    if-lez v4, :cond_8

    iget-object v4, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mRuleIterator:Lorg/dmfs/rfc5545/recur/RuleIterator;

    invoke-virtual {v4, v2, v3}, Lorg/dmfs/rfc5545/recur/RuleIterator;->fastForward(J)V

    :goto_20
    cmp-long v5, v0, v6

    if-eqz v5, :cond_2d

    cmp-long v5, v0, v2

    if-gez v5, :cond_2d

    invoke-virtual {v4}, Lorg/dmfs/rfc5545/recur/RuleIterator;->next()J

    move-result-wide v0

    goto :goto_20

    :cond_2d
    iput-wide v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextInstance:J

    iput-wide v6, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextMillis:J

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextDateTime:Lorg/dmfs/rfc5545/DateTime;

    goto :goto_8
.end method

.method public fastForward(Lorg/dmfs/rfc5545/DateTime;)V
    .registers 10

    const-wide/high16 v6, -0x8000000000000000L

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_9

    :cond_8
    :goto_8
    return-void

    :cond_9
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mTimeZone:Ljava/util/TimeZone;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/DateTime;->shiftTimeZone(Ljava/util/TimeZone;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v2

    iget-wide v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextInstance:J

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->maskWeekday(J)J

    move-result-wide v0

    cmp-long v4, v2, v0

    if-lez v4, :cond_8

    iget-object v4, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mRuleIterator:Lorg/dmfs/rfc5545/recur/RuleIterator;

    invoke-virtual {v4, v2, v3}, Lorg/dmfs/rfc5545/recur/RuleIterator;->fastForward(J)V

    :goto_22
    cmp-long v5, v0, v6

    if-eqz v5, :cond_2f

    cmp-long v5, v0, v2

    if-gez v5, :cond_2f

    invoke-virtual {v4}, Lorg/dmfs/rfc5545/recur/RuleIterator;->next()J

    move-result-wide v0

    goto :goto_22

    :cond_2f
    iput-wide v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextInstance:J

    iput-wide v6, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextMillis:J

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextDateTime:Lorg/dmfs/rfc5545/DateTime;

    goto :goto_8
.end method

.method public hasNext()Z
    .registers 5

    iget-wide v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextInstance:J

    const-wide/high16 v2, -0x8000000000000000L

    cmp-long v0, v0, v2

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public nextDateTime()Lorg/dmfs/rfc5545/DateTime;
    .registers 11

    iget-wide v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextInstance:J

    const-wide/high16 v2, -0x8000000000000000L

    cmp-long v0, v0, v2

    if-nez v0, :cond_10

    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    const-string v1, "No more instances to iterate."

    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10
    iget-wide v8, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextInstance:J

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextDateTime:Lorg/dmfs/rfc5545/DateTime;

    invoke-direct {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->fetchNextInstance()V

    if-eqz v0, :cond_1a

    :goto_19
    return-object v0

    :cond_1a
    iget-boolean v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mAllDay:Z

    if-eqz v0, :cond_32

    new-instance v0, Lorg/dmfs/rfc5545/DateTime;

    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-static {v8, v9}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v2

    invoke-static {v8, v9}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v3

    invoke-static {v8, v9}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v4

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;III)V

    goto :goto_19

    :cond_32
    new-instance v0, Lorg/dmfs/rfc5545/DateTime;

    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget-object v2, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mTimeZone:Ljava/util/TimeZone;

    invoke-static {v8, v9}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v3

    invoke-static {v8, v9}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v4

    invoke-static {v8, v9}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v5

    invoke-static {v8, v9}, Lorg/dmfs/rfc5545/Instance;->hour(J)I

    move-result v6

    invoke-static {v8, v9}, Lorg/dmfs/rfc5545/Instance;->minute(J)I

    move-result v7

    invoke-static {v8, v9}, Lorg/dmfs/rfc5545/Instance;->second(J)I

    move-result v8

    invoke-direct/range {v0 .. v8}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;IIIIII)V

    goto :goto_19
.end method

.method public nextMillis()J
    .registers 5

    const-wide/high16 v2, -0x8000000000000000L

    iget-wide v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextInstance:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_10

    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    const-string v1, "No more instances to iterate."

    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10
    iget-wide v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextMillis:J

    cmp-long v2, v0, v2

    if-nez v2, :cond_20

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget-wide v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextInstance:J

    iget-object v3, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mTimeZone:Ljava/util/TimeZone;

    invoke-virtual {v0, v1, v2, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->toMillis(JLjava/util/TimeZone;)J

    move-result-wide v0

    :cond_20
    invoke-direct {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->fetchNextInstance()V

    return-wide v0
.end method

.method public peekDateTime()Lorg/dmfs/rfc5545/DateTime;
    .registers 11

    iget-wide v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextInstance:J

    const-wide/high16 v2, -0x8000000000000000L

    cmp-long v0, v0, v2

    if-nez v0, :cond_10

    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    const-string v1, "No more instances to iterate."

    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10
    iget-wide v8, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextInstance:J

    iget-boolean v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mAllDay:Z

    if-eqz v0, :cond_2c

    new-instance v0, Lorg/dmfs/rfc5545/DateTime;

    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-static {v8, v9}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v2

    invoke-static {v8, v9}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v3

    invoke-static {v8, v9}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v4

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;III)V

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextDateTime:Lorg/dmfs/rfc5545/DateTime;

    :goto_2b
    return-object v0

    :cond_2c
    new-instance v0, Lorg/dmfs/rfc5545/DateTime;

    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget-object v2, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mTimeZone:Ljava/util/TimeZone;

    invoke-static {v8, v9}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v3

    invoke-static {v8, v9}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v4

    invoke-static {v8, v9}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v5

    invoke-static {v8, v9}, Lorg/dmfs/rfc5545/Instance;->hour(J)I

    move-result v6

    invoke-static {v8, v9}, Lorg/dmfs/rfc5545/Instance;->minute(J)I

    move-result v7

    invoke-static {v8, v9}, Lorg/dmfs/rfc5545/Instance;->second(J)I

    move-result v8

    invoke-direct/range {v0 .. v8}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;IIIIII)V

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextDateTime:Lorg/dmfs/rfc5545/DateTime;

    goto :goto_2b
.end method

.method public peekMillis()J
    .registers 5

    const-wide/high16 v2, -0x8000000000000000L

    iget-wide v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextInstance:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_10

    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    const-string v1, "No more instances to iterate."

    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10
    iget-wide v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextMillis:J

    cmp-long v2, v0, v2

    if-nez v2, :cond_22

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget-wide v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextInstance:J

    iget-object v3, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mTimeZone:Ljava/util/TimeZone;

    invoke-virtual {v0, v1, v2, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->toMillis(JLjava/util/TimeZone;)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextMillis:J

    :cond_22
    return-wide v0
.end method

.method public skip(I)V
    .registers 5

    if-nez p1, :cond_3

    :goto_2
    return-void

    :cond_3
    if-gez p1, :cond_d

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Can not skip backbards"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mRuleIterator:Lorg/dmfs/rfc5545/recur/RuleIterator;

    :cond_f
    invoke-virtual {v0}, Lorg/dmfs/rfc5545/recur/RuleIterator;->next()J

    move-result-wide v1

    add-int/lit8 p1, p1, -0x1

    if-gtz p1, :cond_f

    iput-wide v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextInstance:J

    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextMillis:J

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextDateTime:Lorg/dmfs/rfc5545/DateTime;

    goto :goto_2
.end method

.method public skipAllButLast()V
    .registers 9

    const-wide/high16 v2, -0x8000000000000000L

    iget-object v6, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mRuleIterator:Lorg/dmfs/rfc5545/recur/RuleIterator;

    move-wide v0, v2

    :goto_5
    invoke-virtual {v6}, Lorg/dmfs/rfc5545/recur/RuleIterator;->next()J

    move-result-wide v4

    cmp-long v7, v4, v2

    if-nez v7, :cond_15

    iput-wide v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextInstance:J

    iput-wide v2, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextMillis:J

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->mNextDateTime:Lorg/dmfs/rfc5545/DateTime;

    return-void

    :cond_15
    move-wide v0, v4

    goto :goto_5
.end method
