.class final Lorg/dmfs/rfc5545/recur/SkipBuffer;
.super Lorg/dmfs/rfc5545/recur/RuleIterator;


# instance fields
.field private final mIsYearly:Z

.field private final mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

.field private final mTempSet:Lorg/dmfs/rfc5545/recur/LongArray;

.field private mWorkingSet:Lorg/dmfs/rfc5545/recur/LongArray;


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V
    .registers 8

    invoke-direct {p0, p2}, Lorg/dmfs/rfc5545/recur/RuleIterator;-><init>(Lorg/dmfs/rfc5545/recur/RuleIterator;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/SkipBuffer;->mWorkingSet:Lorg/dmfs/rfc5545/recur/LongArray;

    new-instance v0, Lorg/dmfs/rfc5545/recur/LongArray;

    invoke-direct {v0}, Lorg/dmfs/rfc5545/recur/LongArray;-><init>()V

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/SkipBuffer;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    new-instance v0, Lorg/dmfs/rfc5545/recur/LongArray;

    invoke-direct {v0}, Lorg/dmfs/rfc5545/recur/LongArray;-><init>()V

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/SkipBuffer;->mTempSet:Lorg/dmfs/rfc5545/recur/LongArray;

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getFreq()Lorg/dmfs/rfc5545/recur/Freq;

    move-result-object v0

    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq;->YEARLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne v0, v1, :cond_20

    const/4 v0, 0x1

    :goto_1d
    iput-boolean v0, p0, Lorg/dmfs/rfc5545/recur/SkipBuffer;->mIsYearly:Z

    return-void

    :cond_20
    const/4 v0, 0x0

    goto :goto_1d
.end method


# virtual methods
.method public next()J
    .registers 3

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/SkipBuffer;->mWorkingSet:Lorg/dmfs/rfc5545/recur/LongArray;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/recur/LongArray;->hasNext()Z

    move-result v1

    if-nez v1, :cond_10

    :cond_a
    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/SkipBuffer;->nextSet()Lorg/dmfs/rfc5545/recur/LongArray;

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/SkipBuffer;->mWorkingSet:Lorg/dmfs/rfc5545/recur/LongArray;

    :cond_10
    invoke-virtual {v0}, Lorg/dmfs/rfc5545/recur/LongArray;->next()J

    move-result-wide v0

    return-wide v0
.end method

.method nextSet()Lorg/dmfs/rfc5545/recur/LongArray;
    .registers 13

    const v1, 0x7fffffff

    const/4 v3, 0x0

    iget-object v6, p0, Lorg/dmfs/rfc5545/recur/SkipBuffer;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    iget-object v7, p0, Lorg/dmfs/rfc5545/recur/SkipBuffer;->mTempSet:Lorg/dmfs/rfc5545/recur/LongArray;

    const/4 v0, 0x1

    invoke-virtual {v6}, Lorg/dmfs/rfc5545/recur/LongArray;->clear()V

    invoke-virtual {v7}, Lorg/dmfs/rfc5545/recur/LongArray;->size()I

    move-result v2

    if-lez v2, :cond_6e

    move v2, v1

    :goto_13
    invoke-virtual {v7}, Lorg/dmfs/rfc5545/recur/LongArray;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2c

    invoke-virtual {v7}, Lorg/dmfs/rfc5545/recur/LongArray;->next()J

    move-result-wide v4

    if-eqz v0, :cond_28

    invoke-static {v4, v5}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v1

    invoke-static {v4, v5}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v2

    move v0, v3

    :cond_28
    invoke-virtual {v6, v4, v5}, Lorg/dmfs/rfc5545/recur/LongArray;->add(J)V

    goto :goto_13

    :cond_2c
    invoke-virtual {v7}, Lorg/dmfs/rfc5545/recur/LongArray;->clear()V

    :goto_2f
    iget-object v4, p0, Lorg/dmfs/rfc5545/recur/SkipBuffer;->mPrevious:Lorg/dmfs/rfc5545/recur/RuleIterator;

    invoke-virtual {v4}, Lorg/dmfs/rfc5545/recur/RuleIterator;->nextSet()Lorg/dmfs/rfc5545/recur/LongArray;

    move-result-object v8

    :goto_35
    invoke-virtual {v8}, Lorg/dmfs/rfc5545/recur/LongArray;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6a

    invoke-virtual {v8}, Lorg/dmfs/rfc5545/recur/LongArray;->next()J

    move-result-wide v9

    invoke-static {v9, v10}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v5

    invoke-static {v9, v10}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v4

    if-eqz v0, :cond_50

    invoke-virtual {v6, v9, v10}, Lorg/dmfs/rfc5545/recur/LongArray;->add(J)V

    move v0, v3

    move v1, v4

    move v2, v5

    goto :goto_35

    :cond_50
    iget-boolean v11, p0, Lorg/dmfs/rfc5545/recur/SkipBuffer;->mIsYearly:Z

    if-eqz v11, :cond_5e

    if-ne v5, v2, :cond_5a

    invoke-virtual {v6, v9, v10}, Lorg/dmfs/rfc5545/recur/LongArray;->add(J)V

    goto :goto_35

    :cond_5a
    invoke-virtual {v7, v9, v10}, Lorg/dmfs/rfc5545/recur/LongArray;->add(J)V

    goto :goto_35

    :cond_5e
    if-ne v5, v2, :cond_66

    if-ne v4, v1, :cond_66

    invoke-virtual {v6, v9, v10}, Lorg/dmfs/rfc5545/recur/LongArray;->add(J)V

    goto :goto_35

    :cond_66
    invoke-virtual {v7, v9, v10}, Lorg/dmfs/rfc5545/recur/LongArray;->add(J)V

    goto :goto_35

    :cond_6a
    invoke-virtual {v6}, Lorg/dmfs/rfc5545/recur/LongArray;->sort()V

    return-object v6

    :cond_6e
    move v2, v1

    goto :goto_2f
.end method
