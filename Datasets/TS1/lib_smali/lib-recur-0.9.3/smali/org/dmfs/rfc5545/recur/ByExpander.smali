.class abstract Lorg/dmfs/rfc5545/recur/ByExpander;
.super Lorg/dmfs/rfc5545/recur/RuleIterator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/rfc5545/recur/ByExpander$Scope;
    }
.end annotation


# static fields
.field private static final MAX_EMPTY_SETS:I = 0x3e8


# instance fields
.field final mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

.field mFilterCount:I

.field private final mFilters:[Lorg/dmfs/rfc5545/recur/ByFilter;

.field private final mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

.field private final mStart:J

.field private mWorkingSet:Lorg/dmfs/rfc5545/recur/LongArray;


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V
    .registers 6

    invoke-direct {p0, p1}, Lorg/dmfs/rfc5545/recur/RuleIterator;-><init>(Lorg/dmfs/rfc5545/recur/RuleIterator;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByExpander;->mWorkingSet:Lorg/dmfs/rfc5545/recur/LongArray;

    new-instance v0, Lorg/dmfs/rfc5545/recur/LongArray;

    invoke-direct {v0}, Lorg/dmfs/rfc5545/recur/LongArray;-><init>()V

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByExpander;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    const/16 v0, 0x8

    new-array v0, v0, [Lorg/dmfs/rfc5545/recur/ByFilter;

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByExpander;->mFilters:[Lorg/dmfs/rfc5545/recur/ByFilter;

    const/4 v0, 0x0

    iput v0, p0, Lorg/dmfs/rfc5545/recur/ByExpander;->mFilterCount:I

    iput-wide p3, p0, Lorg/dmfs/rfc5545/recur/ByExpander;->mStart:J

    iput-object p2, p0, Lorg/dmfs/rfc5545/recur/ByExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    return-void
.end method


# virtual methods
.method final addFilter(Lorg/dmfs/rfc5545/recur/ByFilter;)V
    .registers 5

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/ByExpander;->mFilters:[Lorg/dmfs/rfc5545/recur/ByFilter;

    iget v1, p0, Lorg/dmfs/rfc5545/recur/ByExpander;->mFilterCount:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/dmfs/rfc5545/recur/ByExpander;->mFilterCount:I

    aput-object p1, v0, v1

    return-void
.end method

.method final addInstance(J)V
    .registers 4

    iget v0, p0, Lorg/dmfs/rfc5545/recur/ByExpander;->mFilterCount:I

    if-eqz v0, :cond_a

    invoke-virtual {p0, p1, p2}, Lorg/dmfs/rfc5545/recur/ByExpander;->filter(J)Z

    move-result v0

    if-nez v0, :cond_f

    :cond_a
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/ByExpander;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    invoke-virtual {v0, p1, p2}, Lorg/dmfs/rfc5545/recur/LongArray;->add(J)V

    :cond_f
    return-void
.end method

.method abstract expand(JJ)V
.end method

.method fastForward(J)V
    .registers 8

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->maskWeekday(J)J

    move-result-wide v0

    iget-object v2, p0, Lorg/dmfs/rfc5545/recur/ByExpander;->mWorkingSet:Lorg/dmfs/rfc5545/recur/LongArray;

    if-eqz v2, :cond_1e

    :goto_8
    invoke-virtual {v2}, Lorg/dmfs/rfc5545/recur/LongArray;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1e

    invoke-virtual {v2}, Lorg/dmfs/rfc5545/recur/LongArray;->peek()J

    move-result-wide v3

    invoke-static {v3, v4}, Lorg/dmfs/rfc5545/Instance;->maskWeekday(J)J

    move-result-wide v3

    cmp-long v3, v3, v0

    if-gez v3, :cond_1e

    invoke-virtual {v2}, Lorg/dmfs/rfc5545/recur/LongArray;->next()J

    goto :goto_8

    :cond_1e
    if-eqz v2, :cond_26

    invoke-virtual {v2}, Lorg/dmfs/rfc5545/recur/LongArray;->hasNext()Z

    move-result v2

    if-nez v2, :cond_2b

    :cond_26
    iget-object v2, p0, Lorg/dmfs/rfc5545/recur/ByExpander;->mPrevious:Lorg/dmfs/rfc5545/recur/RuleIterator;

    invoke-virtual {v2, v0, v1}, Lorg/dmfs/rfc5545/recur/RuleIterator;->fastForward(J)V

    :cond_2b
    return-void
.end method

.method final filter(J)Z
    .registers 8

    const/4 v0, 0x0

    iget-object v2, p0, Lorg/dmfs/rfc5545/recur/ByExpander;->mFilters:[Lorg/dmfs/rfc5545/recur/ByFilter;

    iget v3, p0, Lorg/dmfs/rfc5545/recur/ByExpander;->mFilterCount:I

    move v1, v0

    :goto_6
    if-ge v1, v3, :cond_11

    aget-object v4, v2, v1

    invoke-virtual {v4, p1, p2}, Lorg/dmfs/rfc5545/recur/ByFilter;->filter(J)Z

    move-result v4

    if-eqz v4, :cond_12

    const/4 v0, 0x1

    :cond_11
    return v0

    :cond_12
    add-int/lit8 v1, v1, 0x1

    goto :goto_6
.end method

.method public next()J
    .registers 3

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/ByExpander;->mWorkingSet:Lorg/dmfs/rfc5545/recur/LongArray;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/recur/LongArray;->hasNext()Z

    move-result v1

    if-nez v1, :cond_10

    :cond_a
    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/ByExpander;->nextSet()Lorg/dmfs/rfc5545/recur/LongArray;

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByExpander;->mWorkingSet:Lorg/dmfs/rfc5545/recur/LongArray;

    :cond_10
    invoke-virtual {v0}, Lorg/dmfs/rfc5545/recur/LongArray;->next()J

    move-result-wide v0

    return-wide v0
.end method

.method nextSet()Lorg/dmfs/rfc5545/recur/LongArray;
    .registers 9

    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/ByExpander;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    iget-object v2, p0, Lorg/dmfs/rfc5545/recur/ByExpander;->mPrevious:Lorg/dmfs/rfc5545/recur/RuleIterator;

    iget-wide v3, p0, Lorg/dmfs/rfc5545/recur/ByExpander;->mStart:J

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/LongArray;->clear()V

    const/4 v0, 0x0

    :cond_a
    const/16 v5, 0x3e8

    if-ne v0, v5, :cond_27

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "too many empty recurrence sets "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_27
    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v2}, Lorg/dmfs/rfc5545/recur/RuleIterator;->nextSet()Lorg/dmfs/rfc5545/recur/LongArray;

    move-result-object v5

    :goto_2d
    invoke-virtual {v5}, Lorg/dmfs/rfc5545/recur/LongArray;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3b

    invoke-virtual {v5}, Lorg/dmfs/rfc5545/recur/LongArray;->next()J

    move-result-wide v6

    invoke-virtual {p0, v6, v7, v3, v4}, Lorg/dmfs/rfc5545/recur/ByExpander;->expand(JJ)V

    goto :goto_2d

    :cond_3b
    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/LongArray;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_a

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/LongArray;->sort()V

    return-object v1
.end method
