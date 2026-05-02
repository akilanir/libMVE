.class public Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;
.super Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$IslamicCalendarMetricsFactory;,
        Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;
    }
.end annotation


# static fields
.field public static final CALENDAR_SCALE_CIVIL:Ljava/lang/String; = "ISLAMIC-CIVIL"

.field public static final CALENDAR_SCALE_TLBA:Ljava/lang/String; = "ISLAMIC-TLBA"

.field public static final DAYS_PER_CYCLE:J = 0x2987L

.field private static final GREGORIAN_METRICS:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

.field public static final LEAP_YEAR_COUNT:[[B

.field public static final LEAP_YEAR_PATTERNS:[I

.field public static final MILLIS_PER_CYCLE:J = 0xd5dbf68400L

.field public static final MILLIS_PER_DAY:J = 0x5265c00L

.field public static final MILLIS_TO_1389_10_22C:J = 0x26ac5419b000L

.field public static final WEEKDAYS:[Lorg/dmfs/rfc5545/Weekday;


# instance fields
.field private final mCivil:Z

.field private final mLeapYearPatternIndex:I


# direct methods
.method static constructor <clinit>()V
    .registers 4

    const/4 v1, 0x4

    const/16 v3, 0x1f

    new-array v0, v1, [I

    fill-array-data v0, :array_40

    sput-object v0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->LEAP_YEAR_PATTERNS:[I

    new-array v0, v1, [[B

    const/4 v1, 0x0

    new-array v2, v3, [B

    fill-array-data v2, :array_4c

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-array v2, v3, [B

    fill-array-data v2, :array_60

    aput-object v2, v0, v1

    const/4 v1, 0x2

    new-array v2, v3, [B

    fill-array-data v2, :array_74

    aput-object v2, v0, v1

    const/4 v1, 0x3

    new-array v2, v3, [B

    fill-array-data v2, :array_88

    aput-object v2, v0, v1

    sput-object v0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->LEAP_YEAR_COUNT:[[B

    invoke-static {}, Lorg/dmfs/rfc5545/Weekday;->values()[Lorg/dmfs/rfc5545/Weekday;

    move-result-object v0

    sput-object v0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->WEEKDAYS:[Lorg/dmfs/rfc5545/Weekday;

    sget-object v0, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->FACTORY:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;

    sget-object v1, Lorg/dmfs/rfc5545/Weekday;->SU:Lorg/dmfs/rfc5545/Weekday;

    invoke-virtual {v0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;->getCalendarMetrics(Lorg/dmfs/rfc5545/Weekday;)Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    move-result-object v0

    sput-object v0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->GREGORIAN_METRICS:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    return-void

    nop

    :array_40
    .array-data 4
        0x2524a4a4
        0x252524a4
        0x29292524
        0x49292924    # 692882.25f
    .end array-data

    :array_4c
    .array-data 1
        0x0t
        0x0t
        0x1t
        0x1t
        0x1t
        0x2t
        0x2t
        0x3t
        0x3t
        0x3t
        0x4t
        0x4t
        0x4t
        0x5t
        0x5t
        0x6t
        0x6t
        0x6t
        0x7t
        0x7t
        0x7t
        0x8t
        0x8t
        0x8t
        0x9t
        0x9t
        0xat
        0xat
        0xat
        0xbt
        0xbt
    .end array-data

    :array_60
    .array-data 1
        0x0t
        0x0t
        0x1t
        0x1t
        0x1t
        0x2t
        0x2t
        0x3t
        0x3t
        0x3t
        0x4t
        0x4t
        0x4t
        0x5t
        0x5t
        0x5t
        0x6t
        0x6t
        0x7t
        0x7t
        0x7t
        0x8t
        0x8t
        0x8t
        0x9t
        0x9t
        0xat
        0xat
        0xat
        0xbt
        0xbt
    .end array-data

    :array_74
    .array-data 1
        0x0t
        0x0t
        0x1t
        0x1t
        0x1t
        0x2t
        0x2t
        0x2t
        0x3t
        0x3t
        0x4t
        0x4t
        0x4t
        0x5t
        0x5t
        0x5t
        0x6t
        0x6t
        0x6t
        0x7t
        0x7t
        0x8t
        0x8t
        0x8t
        0x9t
        0x9t
        0x9t
        0xat
        0xat
        0xbt
        0xbt
    .end array-data

    :array_88
    .array-data 1
        0x0t
        0x0t
        0x1t
        0x1t
        0x1t
        0x2t
        0x2t
        0x2t
        0x3t
        0x3t
        0x3t
        0x4t
        0x4t
        0x5t
        0x5t
        0x5t
        0x6t
        0x6t
        0x6t
        0x7t
        0x7t
        0x8t
        0x8t
        0x8t
        0x9t
        0x9t
        0x9t
        0xat
        0xat
        0xat
        0xbt
    .end array-data
.end method

.method public constructor <init>(Lorg/dmfs/rfc5545/Weekday;ILorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;Z)V
    .registers 6

    invoke-direct {p0, p1, p2}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;-><init>(Lorg/dmfs/rfc5545/Weekday;I)V

    invoke-virtual {p3}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;->ordinal()I

    move-result v0

    iput v0, p0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->mLeapYearPatternIndex:I

    iput-boolean p4, p0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->mCivil:Z

    return-void
.end method


# virtual methods
.method public getDayOfMonthOfYearDay(II)I
    .registers 4

    invoke-virtual {p0, p1, p2}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->getPackedMonthOfYearDay(II)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->getYearDaysForPackedMonth(II)I

    move-result v0

    sub-int v0, p2, v0

    return v0
.end method

.method public getDayOfYear(III)I
    .registers 5

    invoke-virtual {p0, p1, p2}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->getYearDaysForPackedMonth(II)I

    move-result v0

    add-int/2addr v0, p3

    return v0
.end method

.method public getDaysPerPackedMonth(II)I
    .registers 4

    const/16 v0, 0xb

    if-ne p2, v0, :cond_d

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->isLeapYear(I)Z

    move-result v0

    if-eqz v0, :cond_d

    const/16 v0, 0x1e

    :goto_c
    return v0

    :cond_d
    and-int/lit8 v0, p2, 0x1

    rsub-int/lit8 v0, v0, 0x1e

    goto :goto_c
.end method

.method public getDaysPerYear(I)I
    .registers 3

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->isLeapYear(I)Z

    move-result v0

    if-eqz v0, :cond_9

    const/16 v0, 0x163

    :goto_8
    return v0

    :cond_9
    const/16 v0, 0x162

    goto :goto_8
.end method

.method public getMaxMonthDayNum()I
    .registers 2

    const/16 v0, 0x1e

    return v0
.end method

.method public getMaxWeekNoNum()I
    .registers 2

    const/16 v0, 0x34

    return v0
.end method

.method public getMaxYearDayNum()I
    .registers 2

    const/16 v0, 0x163

    return v0
.end method

.method public getMonthAndDayOfYearDay(II)I
    .registers 6

    move v0, p2

    move v1, p1

    :goto_2
    const/4 v2, 0x1

    if-ge v0, v2, :cond_d

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->getDaysPerYear(I)I

    move-result v2

    add-int/2addr v0, v2

    goto :goto_2

    :cond_d
    :goto_d
    invoke-virtual {p0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->getDaysPerYear(I)I

    move-result v2

    if-le v0, v2, :cond_17

    add-int/lit8 v1, v1, 0x1

    sub-int/2addr v0, v2

    goto :goto_d

    :cond_17
    const/16 v2, 0x163

    if-ne v0, v2, :cond_27

    const/16 v2, 0xb

    :goto_1d
    invoke-virtual {p0, v1, v2}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->getYearDaysForPackedMonth(II)I

    move-result v1

    sub-int/2addr v0, v1

    invoke-static {v2, v0}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->monthAndDay(II)I

    move-result v0

    return v0

    :cond_27
    add-int/lit8 v2, v0, -0x1

    mul-int/lit8 v2, v2, 0x2

    div-int/lit8 v2, v2, 0x3b

    goto :goto_1d
.end method

.method public getMonthsPerYear()I
    .registers 2

    const/16 v0, 0xc

    return v0
.end method

.method public getPackedMonthOfYearDay(II)I
    .registers 6

    move v0, p2

    move v1, p1

    :goto_2
    const/4 v2, 0x1

    if-ge v0, v2, :cond_d

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->getDaysPerYear(I)I

    move-result v2

    add-int/2addr v0, v2

    goto :goto_2

    :cond_d
    :goto_d
    invoke-virtual {p0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->getDaysPerYear(I)I

    move-result v2

    if-le v0, v2, :cond_17

    add-int/lit8 v1, v1, 0x1

    sub-int/2addr v0, v2

    goto :goto_d

    :cond_17
    const/16 v1, 0x163

    if-ne v0, v1, :cond_1e

    const/16 v0, 0xb

    :goto_1d
    return v0

    :cond_1e
    add-int/lit8 v0, v0, -0x1

    mul-int/lit8 v0, v0, 0x2

    div-int/lit8 v0, v0, 0x3b

    goto :goto_1d
.end method

.method public getWeekDayOfFirstYearDay(I)I
    .registers 6

    add-int/lit8 v0, p1, -0x1

    rem-int/lit8 v1, v0, 0x1e

    div-int/lit8 v0, v0, 0x1e

    mul-int/lit8 v0, v0, 0x5

    add-int/lit8 v0, v0, 0x5

    mul-int/lit8 v2, v1, 0x4

    add-int/2addr v0, v2

    sget-object v2, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->LEAP_YEAR_COUNT:[[B

    iget v3, p0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->mLeapYearPatternIndex:I

    aget-object v2, v2, v3

    aget-byte v1, v2, v1

    add-int/2addr v0, v1

    rem-int/lit8 v0, v0, 0x7

    return v0
.end method

.method public getWeekOfYear(II)I
    .registers 5

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->getYearDayOfFirstWeekStart(I)I

    move-result v0

    if-ge p2, v0, :cond_d

    add-int/lit8 v0, p1, -0x1

    invoke-virtual {p0, v0}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->getWeeksPerYear(I)I

    move-result v0

    :cond_c
    :goto_c
    return v0

    :cond_d
    sub-int v0, p2, v0

    div-int/lit8 v0, v0, 0x7

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->getWeeksPerYear(I)I

    move-result v1

    if-le v0, v1, :cond_c

    sub-int/2addr v0, v1

    goto :goto_c
.end method

.method public getWeeksPerYear(I)I
    .registers 5

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->getYearDayOfFirstWeekStart(I)I

    move-result v0

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->getDaysPerYear(I)I

    move-result v1

    sub-int v0, v1, v0

    add-int/lit8 v1, v0, 0x1

    div-int/lit8 v0, v1, 0x7

    rem-int/lit8 v1, v1, 0x7

    rsub-int/lit8 v1, v1, 0x7

    iget v2, p0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->minDaysInFirstWeek:I

    if-lt v1, v2, :cond_17

    :goto_16
    return v0

    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_16
.end method

.method public getYearDayOfFirstWeekStart(I)I
    .registers 4

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->getWeekDayOfFirstYearDay(I)I

    move-result v0

    iget v1, p0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->weekStartInt:I

    sub-int v0, v1, v0

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->minDaysInFirstWeek:I

    if-le v0, v1, :cond_11

    add-int/lit8 v0, v0, -0x7

    :cond_10
    :goto_10
    return v0

    :cond_11
    iget v1, p0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->minDaysInFirstWeek:I

    add-int/lit8 v1, v1, -0x6

    if-ge v0, v1, :cond_10

    add-int/lit8 v0, v0, 0x7

    goto :goto_10
.end method

.method public getYearDayOfIsoYear(III)I
    .registers 6

    mul-int/lit8 v0, p2, 0x7

    add-int/lit8 v0, v0, -0x7

    iget v1, p0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->weekStartInt:I

    sub-int v1, p3, v1

    add-int/lit8 v1, v1, 0x7

    rem-int/lit8 v1, v1, 0x7

    add-int/2addr v0, v1

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->getYearDayOfFirstWeekStart(I)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getYearDayOfWeekStart(II)I
    .registers 5

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->getYearDayOfFirstWeekStart(I)I

    move-result v0

    add-int/lit8 v1, p2, -0x1

    mul-int/lit8 v1, v1, 0x7

    add-int/2addr v0, v1

    return v0
.end method

.method public getYearDaysForPackedMonth(II)I
    .registers 5

    mul-int/lit8 v0, p2, 0x1d

    add-int/lit8 v1, p2, 0x1

    ushr-int/lit8 v1, v1, 0x1

    add-int/2addr v0, v1

    return v0
.end method

.method isLeapYear(I)Z
    .registers 5

    const/4 v0, 0x1

    sget-object v1, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->LEAP_YEAR_PATTERNS:[I

    iget v2, p0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->mLeapYearPatternIndex:I

    aget v1, v1, v2

    add-int/lit8 v2, p1, -0x1

    rem-int/lit8 v2, v2, 0x1e

    add-int/lit8 v2, v2, 0x1

    shl-int v2, v0, v2

    and-int/2addr v1, v2

    if-eqz v1, :cond_13

    :goto_12
    return v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public toGregorian(J)J
    .registers 14

    const-wide v9, 0x26ac5419b000L

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v0

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v1

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v2

    add-int/lit8 v3, v0, -0x1

    rem-int/lit8 v3, v3, 0x1e

    add-int/lit8 v4, v0, -0x1

    div-int/lit8 v4, v4, 0x1e

    int-to-long v4, v4

    const-wide/16 v6, 0x2987

    mul-long/2addr v4, v6

    mul-int/lit16 v6, v3, 0x162

    sget-object v7, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->LEAP_YEAR_COUNT:[[B

    iget v8, p0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->mLeapYearPatternIndex:I

    aget-object v7, v7, v8

    aget-byte v3, v7, v3

    add-int/2addr v3, v6

    int-to-long v6, v3

    add-long v3, v4, v6

    invoke-virtual {p0, v0, v1, v2}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->getDayOfYear(III)I

    move-result v0

    int-to-long v0, v0

    add-long/2addr v0, v3

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x18

    mul-long/2addr v0, v2

    const-wide/16 v2, 0xe10

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    iget-boolean v2, p0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->mCivil:Z

    if-eqz v2, :cond_4a

    sub-long/2addr v0, v9

    :goto_42
    sget-object v2, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->GREGORIAN_METRICS:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v1, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->toInstance(JLjava/util/TimeZone;)J

    move-result-wide v0

    return-wide v0

    :cond_4a
    sub-long/2addr v0, v9

    const-wide/32 v2, 0x5265c00

    sub-long/2addr v0, v2

    goto :goto_42
.end method

.method public toInstance(JLjava/util/TimeZone;)J
    .registers 14

    if-eqz p3, :cond_8

    invoke-virtual {p3, p1, p2}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v0

    int-to-long v0, v0

    add-long/2addr p1, v0

    :cond_8
    iget-boolean v0, p0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->mCivil:Z

    if-eqz v0, :cond_7e

    const-wide v0, 0x26ac5419b000L

    :goto_11
    add-long v1, p1, v0

    const-wide/32 v3, 0x5265c00

    rem-long v3, v1, v3

    long-to-int v0, v3

    const-wide/32 v3, 0x5265c00

    div-long/2addr v1, v3

    if-gez v0, :cond_84

    const v3, 0x5265c00

    add-int/2addr v0, v3

    const-wide/16 v3, 0x1

    sub-long/2addr v1, v3

    move v5, v0

    move-wide v8, v1

    move-wide v0, v8

    :goto_29
    const-wide/16 v2, 0x2987

    div-long v2, v0, v2

    long-to-int v2, v2

    const-wide/16 v3, 0x2987

    rem-long/2addr v0, v3

    const-wide/16 v3, 0x163

    div-long v3, v0, v3

    long-to-int v3, v3

    mul-int/lit16 v4, v3, 0x162

    sget-object v6, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->LEAP_YEAR_COUNT:[[B

    iget v7, p0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->mLeapYearPatternIndex:I

    aget-object v6, v6, v7

    aget-byte v6, v6, v3

    add-int/2addr v4, v6

    int-to-long v6, v4

    sub-long/2addr v0, v6

    long-to-int v0, v0

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v3, 0x1

    const/16 v3, 0x163

    if-gt v0, v3, :cond_56

    const/16 v3, 0x163

    if-ne v0, v3, :cond_5d

    invoke-virtual {p0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->isLeapYear(I)Z

    move-result v3

    if-nez v3, :cond_5d

    :cond_56
    invoke-virtual {p0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->getDaysPerYear(I)I

    move-result v3

    sub-int/2addr v0, v3

    add-int/lit8 v1, v1, 0x1

    :cond_5d
    const v3, 0xea60

    div-int v4, v5, v3

    invoke-virtual {p0, v1, v0}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v3

    mul-int/lit8 v0, v2, 0x1e

    add-int/2addr v0, v1

    invoke-static {v3}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->packedMonth(I)I

    move-result v1

    invoke-static {v3}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->dayOfMonth(I)I

    move-result v2

    div-int/lit8 v3, v4, 0x3c

    rem-int/lit8 v4, v4, 0x3c

    div-int/lit16 v5, v5, 0x3e8

    rem-int/lit8 v5, v5, 0x3c

    invoke-static/range {v0 .. v5}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v0

    return-wide v0

    :cond_7e
    const-wide v0, 0x26ac59400c00L

    goto :goto_11

    :cond_84
    move v5, v0

    move-wide v8, v1

    move-wide v0, v8

    goto :goto_29
.end method

.method public toMillis(Ljava/util/TimeZone;IIIIIII)J
    .registers 18

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move v0, p2

    move v1, p3

    move v2, p4

    invoke-static/range {v0 .. v5}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->toGregorian(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v2

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v3

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v4

    sget-object v0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;->GREGORIAN_METRICS:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    move-object v1, p1

    move v5, p5

    move v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-virtual/range {v0 .. v8}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->toMillis(Ljava/util/TimeZone;IIIIIII)J

    move-result-wide v0

    return-wide v0
.end method
