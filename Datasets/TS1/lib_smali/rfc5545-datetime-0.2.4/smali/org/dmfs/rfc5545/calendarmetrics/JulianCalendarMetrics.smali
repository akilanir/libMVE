.class public Lorg/dmfs/rfc5545/calendarmetrics/JulianCalendarMetrics;
.super Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;


# static fields
.field public static final CALENDAR_SCALE_ALIAS:Ljava/lang/String; = "JULIAN"

.field public static final CALENDAR_SCALE_NAME:Ljava/lang/String; = "JULIUS"

.field public static final FACTORY:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;


# instance fields
.field private mGregorianCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lorg/dmfs/rfc5545/calendarmetrics/JulianCalendarMetrics$1;

    invoke-direct {v0}, Lorg/dmfs/rfc5545/calendarmetrics/JulianCalendarMetrics$1;-><init>()V

    sput-object v0, Lorg/dmfs/rfc5545/calendarmetrics/JulianCalendarMetrics;->FACTORY:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;

    return-void
.end method

.method public constructor <init>(Lorg/dmfs/rfc5545/Weekday;I)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;-><init>(Lorg/dmfs/rfc5545/Weekday;I)V

    return-void
.end method


# virtual methods
.method public getDayOfWeek(II)I
    .registers 5

    add-int/lit8 v0, p1, -0x1

    add-int/lit8 v1, p2, 0x5

    add-int/2addr v1, v0

    shr-int/lit8 v0, v0, 0x2

    add-int/2addr v0, v1

    rem-int/lit8 v0, v0, 0x7

    return v0
.end method

.method getTimeStamp(IIIIII)J
    .registers 13

    const-wide/16 v4, 0x3c

    add-int/lit16 v0, p1, -0x7b2

    mul-int/lit16 v0, v0, 0x16d

    int-to-long v0, v0

    int-to-long v2, p2

    add-long/2addr v0, v2

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/JulianCalendarMetrics;->numLeapDaysSince1970(I)I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    const-wide/16 v2, 0xd

    add-long/2addr v0, v2

    const-wide/16 v2, 0x18

    mul-long/2addr v0, v2

    int-to-long v2, p3

    add-long/2addr v0, v2

    mul-long/2addr v0, v4

    int-to-long v2, p4

    add-long/2addr v0, v2

    mul-long/2addr v0, v4

    int-to-long v2, p5

    add-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    int-to-long v2, p6

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public getWeekDayOfFirstYearDay(I)I
    .registers 4

    add-int/lit8 v0, p1, -0x1

    add-int/lit8 v1, v0, 0x6

    shr-int/lit8 v0, v0, 0x2

    add-int/2addr v0, v1

    rem-int/lit8 v0, v0, 0x7

    return v0
.end method

.method isLeapYear(I)Z
    .registers 3

    and-int/lit8 v0, p1, 0x3

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method numLeapDaysSince1970(I)I
    .registers 3

    add-int/lit8 v0, p1, -0x1

    shr-int/lit8 v0, v0, 0x2

    add-int/lit16 v0, v0, -0x1ec

    return v0
.end method

.method public toInstance(JLjava/util/TimeZone;)J
    .registers 14

    const-wide/32 v6, 0x5265c00

    if-eqz p3, :cond_b

    invoke-virtual {p3, p1, p2}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v0

    int-to-long v0, v0

    add-long/2addr p1, v0

    :cond_b
    rem-long v0, p1, v6

    long-to-int v0, v0

    int-to-long v1, v0

    sub-long v1, p1, v1

    if-gez v0, :cond_5b

    const v3, 0x5265c00

    add-int/2addr v0, v3

    sub-long/2addr v1, v6

    move v5, v0

    move-wide v8, v1

    move-wide v0, v8

    :goto_1b
    div-long/2addr v0, v6

    const-wide/32 v2, 0xaf75d

    add-long/2addr v0, v2

    const-wide/16 v2, 0x1ec

    add-long/2addr v0, v2

    const-wide/16 v2, 0xd

    sub-long/2addr v0, v2

    long-to-int v0, v0

    div-int/lit16 v1, v0, 0x5b5

    mul-int/lit16 v2, v1, 0x5b5

    sub-int/2addr v0, v2

    div-int/lit16 v2, v0, 0x16d

    const/4 v3, 0x3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    mul-int/lit16 v3, v2, 0x16d

    sub-int/2addr v0, v3

    add-int/lit8 v3, v0, 0x1

    shl-int/lit8 v0, v1, 0x2

    add-int/2addr v0, v2

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0, v3}, Lorg/dmfs/rfc5545/calendarmetrics/JulianCalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v2

    const v1, 0xea60

    div-int v4, v5, v1

    invoke-static {v2}, Lorg/dmfs/rfc5545/calendarmetrics/JulianCalendarMetrics;->packedMonth(I)I

    move-result v1

    invoke-static {v2}, Lorg/dmfs/rfc5545/calendarmetrics/JulianCalendarMetrics;->dayOfMonth(I)I

    move-result v2

    div-int/lit8 v3, v4, 0x3c

    rem-int/lit8 v4, v4, 0x3c

    div-int/lit16 v5, v5, 0x3e8

    rem-int/lit8 v5, v5, 0x3c

    invoke-static/range {v0 .. v5}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v0

    return-wide v0

    :cond_5b
    move v5, v0

    move-wide v8, v1

    move-wide v0, v8

    goto :goto_1b
.end method

.method public toMillis(Ljava/util/TimeZone;IIIIIII)J
    .registers 18

    const/4 v0, 0x1

    if-le p3, v0, :cond_39

    div-int/lit8 v0, p2, 0x64

    shr-int/lit8 v1, v0, 0x2

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x2

    add-int/2addr v0, p4

    move v1, v0

    :goto_c
    iget-object v0, p0, Lorg/dmfs/rfc5545/calendarmetrics/JulianCalendarMetrics;->mGregorianCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;

    if-nez v0, :cond_1b

    new-instance v0, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;

    iget-object v2, p0, Lorg/dmfs/rfc5545/calendarmetrics/JulianCalendarMetrics;->weekStart:Lorg/dmfs/rfc5545/Weekday;

    iget v3, p0, Lorg/dmfs/rfc5545/calendarmetrics/JulianCalendarMetrics;->minDaysInFirstWeek:I

    invoke-direct {v0, v2, v3}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;-><init>(Lorg/dmfs/rfc5545/Weekday;I)V

    iput-object v0, p0, Lorg/dmfs/rfc5545/calendarmetrics/JulianCalendarMetrics;->mGregorianCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;

    :cond_1b
    invoke-virtual {p0, p2, p3}, Lorg/dmfs/rfc5545/calendarmetrics/JulianCalendarMetrics;->getDaysPerPackedMonth(II)I

    move-result v2

    if-le v1, v2, :cond_56

    sub-int v4, v1, v2

    add-int/lit8 v3, p3, 0x1

    const/16 v1, 0xb

    if-le v3, v1, :cond_6e

    const/4 v3, 0x0

    add-int/lit8 p2, p2, 0x1

    move v2, p2

    :goto_2d
    move-object v1, p1

    move v5, p5

    move v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-virtual/range {v0 .. v8}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->toMillis(Ljava/util/TimeZone;IIIIIII)J

    move-result-wide v0

    return-wide v0

    :cond_39
    add-int/lit8 v0, p2, -0x1

    div-int/lit8 v0, v0, 0x64

    shr-int/lit8 v1, v0, 0x2

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x2

    add-int/2addr v0, p4

    const/4 v1, 0x1

    if-ne p3, v1, :cond_70

    const/16 v1, 0x1c

    if-le v0, v1, :cond_70

    rem-int/lit8 v1, p2, 0x64

    if-nez v1, :cond_70

    rem-int/lit16 v1, p2, 0x190

    if-eqz v1, :cond_70

    add-int/lit8 v0, v0, 0x1

    move v1, v0

    goto :goto_c

    :cond_56
    const/4 v2, 0x1

    if-ge v1, v2, :cond_6a

    add-int/lit8 v2, p3, -0x1

    if-gez v2, :cond_61

    add-int/lit8 p2, p2, -0x1

    const/16 v2, 0xb

    :cond_61
    invoke-virtual {v0, p2, v2}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getDaysPerPackedMonth(II)I

    move-result v3

    add-int v4, v1, v3

    move v3, v2

    move v2, p2

    goto :goto_2d

    :cond_6a
    move v4, v1

    move v3, p3

    move v2, p2

    goto :goto_2d

    :cond_6e
    move v2, p2

    goto :goto_2d

    :cond_70
    move v1, v0

    goto :goto_c
.end method
