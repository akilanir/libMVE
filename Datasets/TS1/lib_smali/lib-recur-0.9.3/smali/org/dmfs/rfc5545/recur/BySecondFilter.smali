.class Lorg/dmfs/rfc5545/recur/BySecondFilter;
.super Lorg/dmfs/rfc5545/recur/ByFilter;


# instance fields
.field private final mSeconds:[I


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)V
    .registers 4

    invoke-direct {p0, p2}, Lorg/dmfs/rfc5545/recur/ByFilter;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)V

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYSECOND:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getByPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lorg/dmfs/rfc5545/recur/StaticUtils;->ListToArray(Ljava/util/List;)[I

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/BySecondFilter;->mSeconds:[I

    return-void
.end method


# virtual methods
.method filter(J)Z
    .registers 5

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/BySecondFilter;->mSeconds:[I

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->second(J)I

    move-result v1

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v0

    if-gez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method
