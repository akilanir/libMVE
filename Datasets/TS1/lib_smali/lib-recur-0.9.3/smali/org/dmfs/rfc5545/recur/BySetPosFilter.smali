.class final Lorg/dmfs/rfc5545/recur/BySetPosFilter;
.super Lorg/dmfs/rfc5545/recur/RuleIterator;


# static fields
.field private static final MAX_EMPTY_SETS:I = 0x3e8


# instance fields
.field private mFirst:Z

.field private final mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

.field private mSetIterator:Lorg/dmfs/rfc5545/recur/LongArray;

.field private final mSetPositions:[I

.field private final mStart:J


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;J)V
    .registers 6

    invoke-direct {p0, p2}, Lorg/dmfs/rfc5545/recur/RuleIterator;-><init>(Lorg/dmfs/rfc5545/recur/RuleIterator;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/dmfs/rfc5545/recur/BySetPosFilter;->mFirst:Z

    new-instance v0, Lorg/dmfs/rfc5545/recur/LongArray;

    invoke-direct {v0}, Lorg/dmfs/rfc5545/recur/LongArray;-><init>()V

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/BySetPosFilter;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYSETPOS:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getByPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lorg/dmfs/rfc5545/recur/StaticUtils;->ListToSortedArray(Ljava/util/List;)[I

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/BySetPosFilter;->mSetPositions:[I

    iput-wide p3, p0, Lorg/dmfs/rfc5545/recur/BySetPosFilter;->mStart:J

    return-void
.end method


# virtual methods
.method public next()J
    .registers 3

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/BySetPosFilter;->mSetIterator:Lorg/dmfs/rfc5545/recur/LongArray;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/BySetPosFilter;->mSetIterator:Lorg/dmfs/rfc5545/recur/LongArray;

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/recur/LongArray;->hasNext()Z

    move-result v0

    if-nez v0, :cond_12

    :cond_c
    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/BySetPosFilter;->nextSet()Lorg/dmfs/rfc5545/recur/LongArray;

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/BySetPosFilter;->mSetIterator:Lorg/dmfs/rfc5545/recur/LongArray;

    :cond_12
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/BySetPosFilter;->mSetIterator:Lorg/dmfs/rfc5545/recur/LongArray;

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/recur/LongArray;->next()J

    move-result-wide v0

    return-wide v0
.end method

.method nextSet()Lorg/dmfs/rfc5545/recur/LongArray;
    .registers 16

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v4, p0, Lorg/dmfs/rfc5545/recur/BySetPosFilter;->mResultSet:Lorg/dmfs/rfc5545/recur/LongArray;

    iget-object v5, p0, Lorg/dmfs/rfc5545/recur/BySetPosFilter;->mSetPositions:[I

    invoke-virtual {v4}, Lorg/dmfs/rfc5545/recur/LongArray;->clear()V

    iget-boolean v0, p0, Lorg/dmfs/rfc5545/recur/BySetPosFilter;->mFirst:Z

    if-eqz v0, :cond_14

    iget-wide v6, p0, Lorg/dmfs/rfc5545/recur/BySetPosFilter;->mStart:J

    invoke-virtual {v4, v6, v7}, Lorg/dmfs/rfc5545/recur/LongArray;->add(J)V

    iput-boolean v2, p0, Lorg/dmfs/rfc5545/recur/BySetPosFilter;->mFirst:Z

    :cond_14
    const/4 v0, -0x1

    move v14, v0

    move v0, v2

    move v2, v14

    :goto_18
    add-int/lit8 v3, v2, 0x1

    const/16 v2, 0x3e8

    if-ne v3, v2, :cond_26

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "too many empty recurrence sets"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_26
    iget-object v2, p0, Lorg/dmfs/rfc5545/recur/BySetPosFilter;->mPrevious:Lorg/dmfs/rfc5545/recur/RuleIterator;

    invoke-virtual {v2}, Lorg/dmfs/rfc5545/recur/RuleIterator;->nextSet()Lorg/dmfs/rfc5545/recur/LongArray;

    move-result-object v6

    invoke-virtual {v6}, Lorg/dmfs/rfc5545/recur/LongArray;->size()I

    move-result v2

    add-int/lit8 v7, v2, 0x1

    move v2, v0

    move v0, v1

    :goto_34
    invoke-virtual {v6}, Lorg/dmfs/rfc5545/recur/LongArray;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_5f

    invoke-virtual {v6}, Lorg/dmfs/rfc5545/recur/LongArray;->next()J

    move-result-wide v8

    invoke-static {v5, v0}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v10

    if-gez v10, :cond_4e

    if-ge v0, v7, :cond_5c

    sub-int v10, v0, v7

    invoke-static {v5, v10}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v10

    if-ltz v10, :cond_5c

    :cond_4e
    iget-wide v10, p0, Lorg/dmfs/rfc5545/recur/BySetPosFilter;->mStart:J

    invoke-static {v8, v9}, Lorg/dmfs/rfc5545/Instance;->maskWeekday(J)J

    move-result-wide v12

    cmp-long v10, v10, v12

    if-gez v10, :cond_5c

    invoke-virtual {v4, v8, v9}, Lorg/dmfs/rfc5545/recur/LongArray;->add(J)V

    move v2, v1

    :cond_5c
    add-int/lit8 v0, v0, 0x1

    goto :goto_34

    :cond_5f
    if-eqz v2, :cond_62

    return-object v4

    :cond_62
    move v0, v2

    move v2, v3

    goto :goto_18
.end method
