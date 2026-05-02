.class final Lorg/dmfs/rfc5545/recur/RecurrenceRule$1;
.super Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/rfc5545/recur/RecurrenceRule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter",
        "<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$1;)V

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

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$1;->parse(Ljava/lang/String;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Z)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/lang/String;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Z)Ljava/lang/Void;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;
        }
    .end annotation

    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    const-string v1, "part not allowed in an RRULE"

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
