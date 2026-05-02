.class final enum Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$18;
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
    .registers 3

    const/4 v0, 0x1

    return v0
.end method

.method getExpander(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;JLjava/util/TimeZone;)Lorg/dmfs/rfc5545/recur/RuleIterator;
    .registers 8

    new-instance v0, Lorg/dmfs/rfc5545/recur/UntilLimiter;

    invoke-direct {v0, p1, p2, p3, p6}, Lorg/dmfs/rfc5545/recur/UntilLimiter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;)V

    return-object v0
.end method

.method getFilter(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)Lorg/dmfs/rfc5545/recur/ByFilter;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "UNTIL doesn\'t support filtering"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
