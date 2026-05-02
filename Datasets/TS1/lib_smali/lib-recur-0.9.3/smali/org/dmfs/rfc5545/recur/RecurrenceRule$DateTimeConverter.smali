.class Lorg/dmfs/rfc5545/recur/RecurrenceRule$DateTimeConverter;
.super Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/rfc5545/recur/RecurrenceRule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DateTimeConverter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter",
        "<",
        "Lorg/dmfs/rfc5545/DateTime;",
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

    invoke-direct {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$DateTimeConverter;-><init>()V

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

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$DateTimeConverter;->parse(Ljava/lang/String;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Z)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/lang/String;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Z)Lorg/dmfs/rfc5545/DateTime;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;
        }
    .end annotation

    const/4 v0, 0x0

    :try_start_1
    check-cast v0, Ljava/util/TimeZone;

    invoke-static {p2, v0, p1}, Lorg/dmfs/rfc5545/DateTime;->parse(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;Ljava/lang/String;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    invoke-virtual {p2, p3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->scaleEquals(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)Z

    move-result v1

    if-eqz v1, :cond_e

    :cond_d
    :goto_d
    return-object v0

    :cond_e
    new-instance v1, Lorg/dmfs/rfc5545/DateTime;

    invoke-direct {v1, p3, v0}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/DateTime;)V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_13} :catch_15

    move-object v0, v1

    goto :goto_d

    :catch_15
    move-exception v0

    move-object v2, v0

    if-eqz p4, :cond_41

    if-eqz p1, :cond_41

    const-string v0, "ZZ"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_41

    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_25
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lorg/dmfs/rfc5545/DateTime;->parse(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;Ljava/lang/String;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    invoke-virtual {p2, p3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->scaleEquals(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)Z

    move-result v1

    if-nez v1, :cond_d

    new-instance v1, Lorg/dmfs/rfc5545/DateTime;

    invoke-direct {v1, p3, v0}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/DateTime;)V
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_3e} :catch_40

    move-object v0, v1

    goto :goto_d

    :catch_40
    move-exception v0

    :cond_41
    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid UNTIL date: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, v2}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method
