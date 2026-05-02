.class Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter$InstanceIterator;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "InstanceIterator"
.end annotation


# instance fields
.field private final mIterator:Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;

.field final synthetic this$0:Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter;


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter;Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;)V
    .registers 3

    iput-object p1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter$InstanceIterator;->this$0:Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter$InstanceIterator;->mIterator:Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;

    return-void
.end method


# virtual methods
.method public fastForward(J)V
    .registers 4

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter$InstanceIterator;->mIterator:Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;

    invoke-virtual {v0, p1, p2}, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->fastForward(J)V

    return-void
.end method

.method public hasNext()Z
    .registers 2

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter$InstanceIterator;->mIterator:Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public next()J
    .registers 3

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter$InstanceIterator;->mIterator:Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->nextMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public peek()J
    .registers 3

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter$InstanceIterator;->mIterator:Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->peekMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public skip(I)V
    .registers 3

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter$InstanceIterator;->mIterator:Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;

    invoke-virtual {v0, p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;->skip(I)V

    return-void
.end method
