.class public final Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;
.super Lorg/dmfs/rfc5545/recur/ByExpander;


# instance fields
.field private final mInterval:I

.field private mNextInstance:J

.field private final mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;


# direct methods
.method private constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V
    .registers 9

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v1, p2, p3, p4}, Lorg/dmfs/rfc5545/recur/ByExpander;-><init>(Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V

    new-instance v1, Lorg/dmfs/rfc5545/recur/LongArray;

    invoke-direct {v1, v0}, Lorg/dmfs/rfc5545/recur/LongArray;-><init>(I)V

    iput-object v1, p0, Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getInterval()I

    move-result v1

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getFreq()Lorg/dmfs/rfc5545/recur/Freq;

    move-result-object v2

    sget-object v3, Lorg/dmfs/rfc5545/recur/Freq;->MONTHLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne v2, v3, :cond_23

    const/16 v2, 0xc

    if-le v1, v2, :cond_1e

    div-int/lit8 v0, v1, 0xc

    :cond_1e
    :goto_1e
    iput v0, p0, Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;->mInterval:I

    iput-wide p3, p0, Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;->mNextInstance:J

    return-void

    :cond_23
    move v0, v1

    goto :goto_1e
.end method

.method public static getInstance(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;
    .registers 12

    const/4 v7, 0x1

    const/4 v1, 0x0

    const/4 v6, 0x0

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p0, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-nez v0, :cond_43

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYYEARDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p0, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-nez v0, :cond_43

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYWEEKNO:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p0, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-nez v0, :cond_43

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYHOUR:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p0, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-nez v0, :cond_43

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMINUTE:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p0, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-nez v0, :cond_43

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYSECOND:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p0, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-nez v0, :cond_43

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYSETPOS:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p0, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-nez v0, :cond_43

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getSkip()Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    move-result-object v0

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;->OMIT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    if-eq v0, v2, :cond_45

    :cond_43
    move-object v0, v1

    :goto_44
    return-object v0

    :cond_45
    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getFreq()Lorg/dmfs/rfc5545/recur/Freq;

    move-result-object v2

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTH:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p0, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getByPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Ljava/util/List;

    move-result-object v3

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTHDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p0, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getByPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Ljava/util/List;

    move-result-object v4

    sget-object v0, Lorg/dmfs/rfc5545/recur/Freq;->MONTHLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne v2, v0, :cond_69

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getInterval()I

    move-result v0

    const/4 v5, 0x5

    if-eq v0, v5, :cond_67

    const/4 v5, 0x6

    if-le v0, v5, :cond_69

    rem-int/lit8 v0, v0, 0xc

    if-eqz v0, :cond_69

    :cond_67
    move-object v0, v1

    goto :goto_44

    :cond_69
    if-eqz v3, :cond_9b

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    if-ne v0, v7, :cond_9b

    if-nez v4, :cond_7b

    sget-object v0, Lorg/dmfs/rfc5545/recur/Freq;->MONTHLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-eq v2, v0, :cond_a3

    sget-object v0, Lorg/dmfs/rfc5545/recur/Freq;->YEARLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-eq v2, v0, :cond_a3

    :cond_7b
    if-eqz v4, :cond_9b

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v0

    if-ne v0, v7, :cond_9b

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-lez v0, :cond_9b

    sget-object v0, Lorg/dmfs/rfc5545/recur/Freq;->MONTHLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-eq v2, v0, :cond_a3

    sget-object v0, Lorg/dmfs/rfc5545/recur/Freq;->YEARLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-eq v2, v0, :cond_a3

    sget-object v0, Lorg/dmfs/rfc5545/recur/Freq;->DAILY:Lorg/dmfs/rfc5545/recur/Freq;

    if-eq v2, v0, :cond_a3

    :cond_9b
    sget-object v0, Lorg/dmfs/rfc5545/recur/Freq;->YEARLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne v2, v0, :cond_cb

    if-nez v3, :cond_cb

    if-nez v4, :cond_cb

    :cond_a3
    if-eqz v3, :cond_d0

    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {p2, p3, v0}, Lorg/dmfs/rfc5545/Instance;->setMonth(JI)J

    move-result-wide v1

    :goto_b3
    if-eqz v4, :cond_ce

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v1, v2, v0}, Lorg/dmfs/rfc5545/Instance;->setDayOfMonth(JI)J

    move-result-wide v0

    :goto_c3
    new-instance v2, Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;

    invoke-direct {v2, p0, p1, v0, v1}, Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V

    move-object v0, v2

    goto/16 :goto_44

    :cond_cb
    move-object v0, v1

    goto/16 :goto_44

    :cond_ce
    move-wide v0, v1

    goto :goto_c3

    :cond_d0
    move-wide v1, p2

    goto :goto_b3
.end method


# virtual methods
.method expand(JJ)V
    .registers 5

    return-void
.end method

.method fastForward(J)V
    .registers 8

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v0

    iget-wide v1, p0, Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;->mNextInstance:J

    invoke-static {v1, v2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v1

    iget-wide v2, p0, Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;->mNextInstance:J

    const/4 v4, 0x0

    sub-int/2addr v0, v1

    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iget v4, p0, Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;->mInterval:I

    rem-int/2addr v0, v4

    iget v4, p0, Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;->mInterval:I

    mul-int/2addr v0, v4

    add-int/2addr v0, v1

    invoke-static {v2, v3, v0}, Lorg/dmfs/rfc5545/Instance;->setYear(JI)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;->mNextInstance:J

    return-void
.end method

.method public next()J
    .registers 7

    iget-wide v0, p0, Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;->mNextInstance:J

    iget-wide v2, p0, Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;->mNextInstance:J

    iget-wide v4, p0, Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;->mNextInstance:J

    invoke-static {v4, v5}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v4

    iget v5, p0, Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;->mInterval:I

    add-int/2addr v4, v5

    invoke-static {v2, v3, v4}, Lorg/dmfs/rfc5545/Instance;->setYear(JI)J

    move-result-wide v2

    iput-wide v2, p0, Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;->mNextInstance:J

    return-wide v0
.end method

.method nextSet()Lorg/dmfs/rfc5545/recur/LongArray;
    .registers 4

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/recur/LongArray;->clear()V

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;->next()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/dmfs/rfc5545/recur/LongArray;->add(J)V

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    return-object v0
.end method
