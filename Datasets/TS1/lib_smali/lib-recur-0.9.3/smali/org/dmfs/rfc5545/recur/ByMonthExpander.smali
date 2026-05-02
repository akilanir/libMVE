.class final Lorg/dmfs/rfc5545/recur/ByMonthExpander;
.super Lorg/dmfs/rfc5545/recur/ByExpander;


# instance fields
.field private final mMonths:[I


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V
    .registers 7

    invoke-direct {p0, p2, p3, p4, p5}, Lorg/dmfs/rfc5545/recur/ByExpander;-><init>(Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTH:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getByPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lorg/dmfs/rfc5545/recur/StaticUtils;->ListToSortedArray(Ljava/util/List;)[I

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByMonthExpander;->mMonths:[I

    return-void
.end method


# virtual methods
.method expand(JJ)V
    .registers 11

    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/ByMonthExpander;->mMonths:[I

    array-length v2, v1

    const/4 v0, 0x0

    :goto_4
    if-ge v0, v2, :cond_17

    aget v3, v1, v0

    invoke-static {p1, p2, v3}, Lorg/dmfs/rfc5545/Instance;->setMonth(JI)J

    move-result-wide v3

    cmp-long v5, v3, p3

    if-gez v5, :cond_13

    :goto_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_13
    invoke-virtual {p0, v3, v4}, Lorg/dmfs/rfc5545/recur/ByMonthExpander;->addInstance(J)V

    goto :goto_10

    :cond_17
    return-void
.end method
