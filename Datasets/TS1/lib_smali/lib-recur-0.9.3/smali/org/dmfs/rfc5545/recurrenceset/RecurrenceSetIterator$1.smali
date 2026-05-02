.class Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;


# direct methods
.method constructor <init>(Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;)V
    .registers 2

    iput-object p1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator$1;->this$0:Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4

    check-cast p1, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    check-cast p2, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;

    invoke-virtual {p0, p1, p2}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator$1;->compare(Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;)I
    .registers 11

    const-wide/16 v6, 0x0

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-interface {p1}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;->hasNext()Z

    move-result v2

    invoke-interface {p2}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;->hasNext()Z

    move-result v3

    if-eqz v2, :cond_26

    if-eqz v3, :cond_26

    invoke-interface {p1}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;->peek()J

    move-result-wide v2

    invoke-interface {p2}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;->peek()J

    move-result-wide v4

    sub-long/2addr v2, v4

    cmp-long v4, v2, v6

    if-gez v4, :cond_1e

    :cond_1d
    :goto_1d
    return v0

    :cond_1e
    cmp-long v0, v2, v6

    if-lez v0, :cond_24

    move v0, v1

    goto :goto_1d

    :cond_24
    const/4 v0, 0x0

    goto :goto_1d

    :cond_26
    if-nez v2, :cond_1d

    move v0, v1

    goto :goto_1d
.end method
