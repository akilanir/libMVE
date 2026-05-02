.class Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayConverter;
.super Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/rfc5545/recur/RecurrenceRule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "WeekdayConverter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter",
        "<",
        "Lorg/dmfs/rfc5545/Weekday;",
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

    invoke-direct {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayConverter;-><init>()V

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

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayConverter;->parse(Ljava/lang/String;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Z)Lorg/dmfs/rfc5545/Weekday;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/lang/String;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Z)Lorg/dmfs/rfc5545/Weekday;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;
        }
    .end annotation

    :try_start_0
    invoke-static {p1}, Lorg/dmfs/rfc5545/Weekday;->valueOf(Ljava/lang/String;)Lorg/dmfs/rfc5545/Weekday;
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    return-object v0

    :catch_5
    move-exception v0

    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "illegal weekday: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
