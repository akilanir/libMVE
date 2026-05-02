.class final Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics$1;
.super Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;-><init>()V

    return-void
.end method


# virtual methods
.method public getCalendarMetrics(Lorg/dmfs/rfc5545/Weekday;)Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;
    .registers 4

    new-instance v0, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;

    const/4 v1, 0x4

    invoke-direct {v0, p1, v1}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;-><init>(Lorg/dmfs/rfc5545/Weekday;I)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    const-string v0, "GREGORIAN"

    return-object v0
.end method
