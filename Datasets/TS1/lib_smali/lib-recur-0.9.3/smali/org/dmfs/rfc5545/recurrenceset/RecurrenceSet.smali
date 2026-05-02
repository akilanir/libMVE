.class public Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;
.super Ljava/lang/Object;


# instance fields
.field private mExceptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter;",
            ">;"
        }
    .end annotation
.end field

.field private final mInstances:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter;",
            ">;"
        }
    .end annotation
.end field

.field private mIsInfinite:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->mInstances:Ljava/util/List;

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->mExceptions:Ljava/util/List;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->mIsInfinite:Z

    return-void
.end method


# virtual methods
.method public addExceptions(Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter;)V
    .registers 3

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->mExceptions:Ljava/util/List;

    if-nez v0, :cond_b

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->mExceptions:Ljava/util/List;

    :cond_b
    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->mExceptions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public addInstances(Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter;)V
    .registers 4

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->mInstances:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-boolean v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->mIsInfinite:Z

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter;->isInfinite()Z

    move-result v1

    or-int/2addr v0, v1

    iput-boolean v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->mIsInfinite:Z

    return-void
.end method

.method public getLastInstance(Ljava/util/TimeZone;J)J
    .registers 10

    const-wide/high16 v0, -0x8000000000000000L

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->isInfinite()Z

    move-result v2

    if-eqz v2, :cond_10

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "can not calculate the last instance of an infinite recurrence set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10
    iget-object v2, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->mExceptions:Ljava/util/List;

    if-eqz v2, :cond_2b

    iget-object v2, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->mExceptions:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_2b

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->iterator(Ljava/util/TimeZone;J)Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;

    move-result-object v2

    :goto_20
    invoke-virtual {v2}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_41

    invoke-virtual {v2}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->next()J

    move-result-wide v0

    goto :goto_20

    :cond_2b
    iget-object v2, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->mInstances:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_42

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->mInstances:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter;

    invoke-virtual {v0, p1, p2, p3}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter;->getLastInstance(Ljava/util/TimeZone;J)J

    move-result-wide v0

    :cond_41
    :goto_41
    return-wide v0

    :cond_42
    iget-object v2, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->mInstances:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move-wide v1, v0

    :goto_49
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_60

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter;

    invoke-virtual {v0, p1, p2, p3}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter;->getLastInstance(Ljava/util/TimeZone;J)J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-lez v0, :cond_62

    move-wide v0, v3

    :goto_5e
    move-wide v1, v0

    goto :goto_49

    :cond_60
    move-wide v0, v1

    goto :goto_41

    :cond_62
    move-wide v0, v1

    goto :goto_5e
.end method

.method public isInfinite()Z
    .registers 2

    iget-boolean v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->mIsInfinite:Z

    return v0
.end method

.method public iterator(Ljava/util/TimeZone;J)Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;
    .registers 10

    const-wide v4, 0x7fffffffffffffffL

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->iterator(Ljava/util/TimeZone;JJ)Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator(Ljava/util/TimeZone;JJ)Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;
    .registers 10

    new-instance v2, Ljava/util/ArrayList;

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->mInstances:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->mInstances:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_25

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter;

    invoke-virtual {v0, p1, p2, p3}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter;->getIterator(Ljava/util/TimeZone;J)Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_25
    const/4 v0, 0x0

    iget-object v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->mExceptions:Ljava/util/List;

    if-eqz v1, :cond_50

    new-instance v1, Ljava/util/ArrayList;

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->mExceptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSet;->mExceptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter;

    invoke-virtual {v0, p1, p2, p3}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter;->getIterator(Ljava/util/TimeZone;J)Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3b

    :cond_4f
    move-object v0, v1

    :cond_50
    new-instance v1, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;

    invoke-direct {v1, v2, v0}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;-><init>(Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {v1, p4, p5}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;->setEnd(J)Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;

    move-result-object v0

    return-object v0
.end method
