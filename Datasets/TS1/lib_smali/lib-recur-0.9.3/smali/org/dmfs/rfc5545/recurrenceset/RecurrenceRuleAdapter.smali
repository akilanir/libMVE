.class public final Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter;
.super Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter$InstanceIterator;
    }
.end annotation


# instance fields
.field private final mRrule:Lorg/dmfs/rfc5545/recur/RecurrenceRule;


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;)V
    .registers 2

    invoke-direct {p0}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter;-><init>()V

    iput-object p1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter;->mRrule:Lorg/dmfs/rfc5545/recur/RecurrenceRule;

    return-void
.end method


# virtual methods
.method getIterator(Ljava/util/TimeZone;J)Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;
    .registers 6

    new-instance v0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter$InstanceIterator;

    iget-object v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter;->mRrule:Lorg/dmfs/rfc5545/recur/RecurrenceRule;

    invoke-virtual {v1, p2, p3, p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->iterator(JLjava/util/TimeZone;)Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter$InstanceIterator;-><init>(Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter;Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;)V

    return-object v0
.end method

.method getLastInstance(Ljava/util/TimeZone;J)J
    .registers 8

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter;->isInfinite()Z

    move-result v0

    if-eqz v0, :cond_c

    const-wide v0, 0x7fffffffffffffffL

    :cond_b
    :goto_b
    return-wide v0

    :cond_c
    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter;->mRrule:Lorg/dmfs/rfc5545/recur/RecurrenceRule;

    invoke-virtual {v0, p2, p3, p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->iterator(JLjava/util/TimeZone;)Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;

    move-result-object v2

    invoke-virtual {v2}, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->skipAllButLast()V

    const-wide/high16 v0, -0x8000000000000000L

    invoke-virtual {v2}, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_b

    invoke-virtual {v2}, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->nextMillis()J

    move-result-wide v0

    goto :goto_b
.end method

.method isInfinite()Z
    .registers 2

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter;->mRrule:Lorg/dmfs/rfc5545/recur/RecurrenceRule;

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->isInfinite()Z

    move-result v0

    return v0
.end method
