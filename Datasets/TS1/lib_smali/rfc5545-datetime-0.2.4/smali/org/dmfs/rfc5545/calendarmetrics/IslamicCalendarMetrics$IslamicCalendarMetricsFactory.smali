.class public final Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$IslamicCalendarMetricsFactory;
.super Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "IslamicCalendarMetricsFactory"
.end annotation


# instance fields
.field private final mCivil:Z

.field private final mName:Ljava/lang/String;

.field private final mPattern:Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;Z)V
    .registers 4

    invoke-direct {p0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;-><init>()V

    iput-object p1, p0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$IslamicCalendarMetricsFactory;->mName:Ljava/lang/String;

    iput-object p2, p0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$IslamicCalendarMetricsFactory;->mPattern:Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

    iput-boolean p3, p0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$IslamicCalendarMetricsFactory;->mCivil:Z

    return-void
.end method


# virtual methods
.method public getCalendarMetrics(Lorg/dmfs/rfc5545/Weekday;)Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;
    .registers 6

    new-instance v0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;

    const/4 v1, 0x4

    iget-object v2, p0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$IslamicCalendarMetricsFactory;->mPattern:Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

    iget-boolean v3, p0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$IslamicCalendarMetricsFactory;->mCivil:Z

    invoke-direct {v0, p1, v1, v2, v3}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;-><init>(Lorg/dmfs/rfc5545/Weekday;ILorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;Z)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$IslamicCalendarMetricsFactory;->mName:Ljava/lang/String;

    return-object v0
.end method
