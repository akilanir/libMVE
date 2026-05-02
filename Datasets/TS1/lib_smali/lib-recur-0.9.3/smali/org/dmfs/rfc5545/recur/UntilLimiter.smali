.class final Lorg/dmfs/rfc5545/recur/UntilLimiter;
.super Lorg/dmfs/rfc5545/recur/Limiter;


# instance fields
.field private final mUntil:J


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;)V
    .registers 7

    invoke-direct {p0, p2}, Lorg/dmfs/rfc5545/recur/Limiter;-><init>(Lorg/dmfs/rfc5545/recur/RuleIterator;)V

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getUntil()Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/dmfs/rfc5545/recur/UntilLimiter;->mUntil:J

    return-void
.end method


# virtual methods
.method stop(J)Z
    .registers 7

    iget-wide v0, p0, Lorg/dmfs/rfc5545/recur/UntilLimiter;->mUntil:J

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->maskWeekday(J)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method
