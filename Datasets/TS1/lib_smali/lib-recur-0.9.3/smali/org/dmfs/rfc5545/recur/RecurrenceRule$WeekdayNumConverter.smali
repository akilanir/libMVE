.class Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNumConverter;
.super Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/rfc5545/recur/RecurrenceRule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "WeekdayNumConverter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter",
        "<",
        "Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$1;)V
    .registers 2

    invoke-direct {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNumConverter;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic parse(Ljava/lang/String;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Z)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;
        }
    .end annotation

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNumConverter;->parse(Ljava/lang/String;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Z)Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/lang/String;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Z)Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;
        }
    .end annotation

    invoke-static {p1, p4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;->valueOf(Ljava/lang/String;Z)Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;

    move-result-object v0

    return-object v0
.end method
