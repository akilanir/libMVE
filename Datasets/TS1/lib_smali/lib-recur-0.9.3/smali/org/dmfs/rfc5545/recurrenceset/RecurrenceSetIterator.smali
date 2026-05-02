.class public Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;
.super Ljava/lang/Object;


# static fields
.field private static final EXCEPTION_CACHE_SIZE:I = 0x10

.field private static final INSTANCE_CACHE_SIZE:I = 0x20

.field private static final MAX_SKIPPED_INSTANCES:I = 0x3e8


# instance fields
.field private mAdapterComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;",
            ">;"
        }
    .end annotation
.end field

.field private mExceptionCache:[J

.field private mExceptions:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

.field private mExceptionsInCache:I

.field private mInstanceCache:[J

.field private mInstances:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

.field private mInstancesInCache:I

.field private mIterateEnd:J

.field private mLastExceptionIndex:I

.field private mNextInstance:I


# direct methods
.method constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mNextInstance:I

    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mIterateEnd:J

    new-instance v0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator$1;

    invoke-direct {v0, p0}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator$1;-><init>(Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;)V

    iput-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mAdapterComparator:Ljava/util/Comparator;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    iput-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mInstances:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mInstances:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    iget-object v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mAdapterComparator:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    if-eqz p2, :cond_47

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_47

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    invoke-interface {p2, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    iput-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptions:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptions:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    iget-object v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mAdapterComparator:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    :goto_46
    return-void

    :cond_47
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptions:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    goto :goto_46
.end method

.method private fillExceptionCache()V
    .registers 14

    const/16 v12, 0x10

    const/4 v5, 0x0

    const/4 v11, 0x1

    const/4 v1, 0x0

    iput v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mLastExceptionIndex:I

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptionCache:[J

    if-nez v0, :cond_f

    new-array v0, v12, [J

    iput-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptionCache:[J

    :cond_f
    iget-wide v6, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mIterateEnd:J

    iget-object v2, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptions:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    array-length v3, v2

    if-nez v3, :cond_17

    :goto_16
    return-void

    :cond_17
    array-length v3, v2

    if-ne v3, v11, :cond_8e

    aget-object v2, v2, v1

    invoke-interface {v2}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_29

    iput-object v5, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptions:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    iput v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptionsInCache:I

    goto :goto_16

    :cond_27
    add-int/lit8 v1, v1, 0x1

    :cond_29
    :goto_29
    invoke-interface {v2}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3b

    if-ge v1, v12, :cond_3b

    :try_start_31
    invoke-interface {v2}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;->next()J

    move-result-wide v3

    aput-wide v3, v0, v1
    :try_end_37
    .catch Ljava/lang/IllegalArgumentException; {:try_start_31 .. :try_end_37} :catch_3f

    cmp-long v3, v3, v6

    if-lez v3, :cond_27

    :cond_3b
    move v2, v1

    :cond_3c
    :goto_3c
    iput v2, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptionsInCache:I

    goto :goto_16

    :catch_3f
    move-exception v3

    iput-object v5, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptions:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    goto :goto_29

    :cond_43
    add-int/lit8 v2, v2, 0x1

    :try_start_45
    iget-object v4, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mAdapterComparator:Ljava/util/Comparator;

    invoke-static {v3, v4}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V
    :try_end_4a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_45 .. :try_end_4a} :catch_79

    :goto_4a
    array-length v4, v3

    if-lez v4, :cond_3c

    if-ge v2, v12, :cond_3c

    aget-object v4, v3, v1

    :try_start_51
    invoke-interface {v4}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_62

    invoke-interface {v4}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;->next()J

    move-result-wide v8

    aput-wide v8, v0, v2

    cmp-long v4, v8, v6

    if-lez v4, :cond_43

    goto :goto_3c

    :cond_62
    array-length v4, v3

    if-le v4, v11, :cond_74

    array-length v4, v3

    add-int/lit8 v4, v4, -0x1

    new-array v4, v4, [Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    const/4 v8, 0x1

    const/4 v9, 0x0

    array-length v10, v4

    invoke-static {v3, v8, v4, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object v4, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptions:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    move-object v3, v4

    goto :goto_4a

    :cond_74
    const/4 v4, 0x0

    iput-object v4, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptions:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;
    :try_end_77
    .catch Ljava/lang/IllegalArgumentException; {:try_start_51 .. :try_end_77} :catch_79

    move-object v3, v5

    goto :goto_4a

    :catch_79
    move-exception v4

    array-length v4, v3

    if-le v4, v11, :cond_8a

    array-length v4, v3

    add-int/lit8 v4, v4, -0x1

    new-array v4, v4, [Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    array-length v8, v4

    invoke-static {v3, v11, v4, v1, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object v4, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptions:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    move-object v3, v4

    goto :goto_4a

    :cond_8a
    iput-object v5, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptions:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    move-object v3, v5

    goto :goto_4a

    :cond_8e
    move-object v3, v2

    move v2, v1

    goto :goto_4a
.end method

.method private fillInstanceCache()V
    .registers 13

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mInstanceCache:[J

    if-nez v0, :cond_a

    const/16 v0, 0x20

    new-array v0, v0, [J

    iput-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mInstanceCache:[J

    :cond_a
    iget-wide v8, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mIterateEnd:J

    iget-object v5, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mInstances:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    const/4 v4, 0x0

    const/4 v3, 0x0

    const-wide/high16 v1, -0x8000000000000000L

    if-eqz v5, :cond_55

    array-length v6, v5

    const/4 v7, 0x1

    if-ne v6, v7, :cond_55

    const/4 v6, 0x0

    aget-object v7, v5, v6

    :cond_1b
    :goto_1b
    invoke-interface {v7}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2d

    const/16 v5, 0x20

    if-ge v4, v5, :cond_2d

    :try_start_25
    invoke-interface {v7}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;->next()J
    :try_end_28
    .catch Ljava/lang/IllegalArgumentException; {:try_start_25 .. :try_end_28} :catch_50

    move-result-wide v5

    cmp-long v10, v5, v8

    if-lez v10, :cond_33

    :cond_2d
    iput v4, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mInstancesInCache:I

    const/4 v0, 0x0

    iput v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mNextInstance:I

    return-void

    :cond_33
    cmp-long v10, v1, v5

    if-eqz v10, :cond_44

    :try_start_37
    invoke-direct {p0, v5, v6}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->isException(J)Z

    move-result v10

    if-nez v10, :cond_44

    aput-wide v5, v0, v4
    :try_end_3f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_37 .. :try_end_3f} :catch_50

    add-int/lit8 v4, v4, 0x1

    const/4 v3, 0x0

    move-wide v1, v5

    goto :goto_1b

    :cond_44
    cmp-long v10, v1, v5

    if-eqz v10, :cond_1b

    add-int/lit8 v3, v3, 0x1

    const/16 v1, 0x3e8

    if-ge v3, v1, :cond_2d

    move-wide v1, v5

    goto :goto_1b

    :catch_50
    move-exception v5

    const/4 v5, 0x0

    iput-object v5, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mInstances:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    goto :goto_1b

    :cond_55
    if-eqz v5, :cond_2d

    :goto_57
    array-length v6, v5

    if-lez v6, :cond_2d

    const/16 v6, 0x20

    if-ge v4, v6, :cond_2d

    const/4 v6, 0x0

    aget-object v6, v5, v6

    :try_start_61
    invoke-interface {v6}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_a1

    invoke-interface {v6}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;->next()J

    move-result-wide v6

    cmp-long v10, v6, v8

    if-gtz v10, :cond_2d

    invoke-direct {p0, v6, v7}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->isException(J)Z

    move-result v10

    if-nez v10, :cond_95

    cmp-long v10, v1, v6

    if-eqz v10, :cond_95

    aput-wide v6, v0, v4

    add-int/lit8 v4, v4, 0x1

    const/4 v3, 0x0

    move-wide v1, v6

    :cond_7f
    :goto_7f
    iget-object v6, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mAdapterComparator:Ljava/util/Comparator;

    invoke-static {v5, v6}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V
    :try_end_84
    .catch Ljava/lang/IllegalArgumentException; {:try_start_61 .. :try_end_84} :catch_85

    goto :goto_57

    :catch_85
    move-exception v6

    array-length v6, v5

    add-int/lit8 v6, v6, -0x1

    new-array v6, v6, [Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    const/4 v7, 0x1

    const/4 v10, 0x0

    array-length v11, v6

    invoke-static {v5, v7, v6, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object v6, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mInstances:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    move-object v5, v6

    goto :goto_57

    :cond_95
    cmp-long v10, v1, v6

    if-eqz v10, :cond_7f

    add-int/lit8 v3, v3, 0x1

    const/16 v1, 0x3e8

    if-ge v3, v1, :cond_2d

    move-wide v1, v6

    goto :goto_7f

    :cond_a1
    :try_start_a1
    array-length v6, v5

    add-int/lit8 v6, v6, -0x1

    new-array v6, v6, [Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    const/4 v7, 0x1

    const/4 v10, 0x0

    array-length v11, v6

    invoke-static {v5, v7, v6, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object v6, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mInstances:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;
    :try_end_ae
    .catch Ljava/lang/IllegalArgumentException; {:try_start_a1 .. :try_end_ae} :catch_85

    move-object v5, v6

    goto :goto_57
.end method

.method private isException(J)Z
    .registers 7

    const/4 v0, 0x0

    iget-object v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptions:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    if-nez v1, :cond_6

    :cond_5
    :goto_5
    return v0

    :cond_6
    iget-object v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptionCache:[J

    if-nez v1, :cond_d

    invoke-direct {p0}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->fillExceptionCache()V

    :cond_d
    :goto_d
    iget v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptionsInCache:I

    if-lez v1, :cond_5

    iget-object v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptionCache:[J

    aget-wide v1, v1, v0

    cmp-long v1, p1, v1

    if-ltz v1, :cond_5

    iget-object v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptionCache:[J

    iget v2, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptionsInCache:I

    add-int/lit8 v2, v2, -0x1

    aget-wide v1, v1, v2

    cmp-long v1, p1, v1

    if-gtz v1, :cond_37

    iget-object v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptionCache:[J

    iget v2, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mLastExceptionIndex:I

    add-int/lit8 v2, v2, 0x1

    iget v3, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptionsInCache:I

    invoke-static {v1, v2, v3, p1, p2}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([JIIJ)I

    move-result v1

    if-ltz v1, :cond_5

    iput v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mLastExceptionIndex:I

    const/4 v0, 0x1

    goto :goto_5

    :cond_37
    invoke-direct {p0}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->fillExceptionCache()V

    goto :goto_d
.end method


# virtual methods
.method public fastForward(J)V
    .registers 9

    const/4 v0, 0x0

    iget-object v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mInstanceCache:[J

    if-eqz v1, :cond_1b

    iget-object v2, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mInstanceCache:[J

    iget v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mNextInstance:I

    iget v3, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mInstancesInCache:I

    :goto_b
    if-ge v1, v3, :cond_16

    aget-wide v4, v2, v1

    cmp-long v4, v4, p1

    if-gez v4, :cond_16

    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    :cond_16
    if-ge v1, v3, :cond_1b

    iput v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mNextInstance:I

    :cond_1a
    return-void

    :cond_1b
    iget-object v2, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mInstances:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    array-length v3, v2

    move v1, v0

    :goto_1f
    if-ge v1, v3, :cond_29

    aget-object v4, v2, v1

    invoke-interface {v4, p1, p2}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;->fastForward(J)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1f

    :cond_29
    iget-object v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptions:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    if-eqz v1, :cond_1a

    iget-object v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mExceptions:[Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    array-length v2, v1

    :goto_30
    if-ge v0, v2, :cond_1a

    aget-object v3, v1, v0

    invoke-interface {v3, p1, p2}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;->fastForward(J)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_30
.end method

.method public hasNext()Z
    .registers 3

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mInstanceCache:[J

    if-eqz v0, :cond_a

    iget v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mNextInstance:I

    const/16 v1, 0x20

    if-ne v0, v1, :cond_d

    :cond_a
    invoke-direct {p0}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->fillInstanceCache()V

    :cond_d
    iget v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mNextInstance:I

    iget v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mInstancesInCache:I

    if-ge v0, v1, :cond_15

    const/4 v0, 0x1

    :goto_14
    return v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public next()J
    .registers 4

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mInstanceCache:[J

    if-eqz v0, :cond_a

    iget v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mNextInstance:I

    const/16 v1, 0x20

    if-ne v0, v1, :cond_d

    :cond_a
    invoke-direct {p0}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->fillInstanceCache()V

    :cond_d
    iget v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mNextInstance:I

    iget v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mInstancesInCache:I

    if-lt v0, v1, :cond_1b

    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    const-string v1, "no more instances to iterate"

    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1b
    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mInstanceCache:[J

    iget v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mNextInstance:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mNextInstance:I

    aget-wide v0, v0, v1

    return-wide v0
.end method

.method setEnd(J)Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;
    .registers 3

    iput-wide p1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->mIterateEnd:J

    return-object p0
.end method
