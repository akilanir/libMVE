.class public final Lorg/dmfs/rfc5545/recur/UnicodeCalendarScales;
.super Ljava/lang/Object;


# static fields
.field private static final CALENDAR_SCALES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/UnicodeCalendarScales;->CALENDAR_SCALES:Ljava/util/Map;

    sget-object v0, Lorg/dmfs/rfc5545/recur/UnicodeCalendarScales;->CALENDAR_SCALES:Ljava/util/Map;

    const-string v1, "GREGORIAN"

    sget-object v2, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->FACTORY:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lorg/dmfs/rfc5545/recur/UnicodeCalendarScales;->CALENDAR_SCALES:Ljava/util/Map;

    const-string v1, "GREGORY"

    sget-object v2, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->FACTORY:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lorg/dmfs/rfc5545/recur/UnicodeCalendarScales;->CALENDAR_SCALES:Ljava/util/Map;

    const-string v1, "JULIAN"

    sget-object v2, Lorg/dmfs/rfc5545/calendarmetrics/JulianCalendarMetrics;->FACTORY:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lorg/dmfs/rfc5545/recur/UnicodeCalendarScales;->CALENDAR_SCALES:Ljava/util/Map;

    const-string v1, "JULIUS"

    sget-object v2, Lorg/dmfs/rfc5545/calendarmetrics/JulianCalendarMetrics;->FACTORY:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lorg/dmfs/rfc5545/recur/UnicodeCalendarScales;->CALENDAR_SCALES:Ljava/util/Map;

    const-string v1, "ISLAMIC-TLBA"

    new-instance v2, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$IslamicCalendarMetricsFactory;

    const-string v3, "ISLAMIC-TLBA"

    sget-object v4, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;->II:Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

    const/4 v5, 0x0

    invoke-direct {v2, v3, v4, v5}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$IslamicCalendarMetricsFactory;-><init>(Ljava/lang/String;Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;Z)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lorg/dmfs/rfc5545/recur/UnicodeCalendarScales;->CALENDAR_SCALES:Ljava/util/Map;

    const-string v1, "ISLAMIC_CIVIL"

    new-instance v2, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$IslamicCalendarMetricsFactory;

    const-string v3, "ISLAMIC_CIVIL"

    sget-object v4, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;->II:Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

    const/4 v5, 0x1

    invoke-direct {v2, v3, v4, v5}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$IslamicCalendarMetricsFactory;-><init>(Ljava/lang/String;Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;Z)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lorg/dmfs/rfc5545/recur/UnicodeCalendarScales;->CALENDAR_SCALES:Ljava/util/Map;

    const-string v1, "ISLAMICC"

    sget-object v2, Lorg/dmfs/rfc5545/recur/UnicodeCalendarScales;->CALENDAR_SCALES:Ljava/util/Map;

    const-string v3, "ISLAMIC_CIVIL"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCalendarMetricsForName(Ljava/lang/String;)Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;
    .registers 2

    sget-object v0, Lorg/dmfs/rfc5545/recur/UnicodeCalendarScales;->CALENDAR_SCALES:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;

    return-object v0
.end method
