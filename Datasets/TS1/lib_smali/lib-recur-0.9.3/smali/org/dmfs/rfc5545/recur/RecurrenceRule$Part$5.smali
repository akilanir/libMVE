.class final enum Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$5;
.super Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V
    .registers 5

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;Lorg/dmfs/rfc5545/recur/RecurrenceRule$1;)V

    return-void
.end method


# virtual methods
.method expands(Lorg/dmfs/rfc5545/recur/RecurrenceRule;)Z
    .registers 4

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getFreq()Lorg/dmfs/rfc5545/recur/Freq;

    move-result-object v0

    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq;->YEARLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method getExpander(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;JLjava/util/TimeZone;)Lorg/dmfs/rfc5545/recur/RuleIterator;
    .registers 13

    new-instance v0, Lorg/dmfs/rfc5545/recur/ByMonthExpander;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/dmfs/rfc5545/recur/ByMonthExpander;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V

    return-object v0
.end method

.method getFilter(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)Lorg/dmfs/rfc5545/recur/ByFilter;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    new-instance v0, Lorg/dmfs/rfc5545/recur/ByMonthFilter;

    invoke-direct {v0, p1, p2}, Lorg/dmfs/rfc5545/recur/ByMonthFilter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)V

    return-object v0
.end method
