.class public Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;
.super Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;


# static fields
.field public static final CALENDAR_SCALE_ALIAS:Ljava/lang/String; = "GREGORIAN"

.field public static final CALENDAR_SCALE_NAME:Ljava/lang/String; = "GREGORY"

.field private static final DAYS_PER_MONTH:[I

.field public static final FACTORY:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;

.field public static final WEEKDAYS:[Lorg/dmfs/rfc5545/Weekday;

.field private static final YEARDAYS_PER_MONTH:[I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const/16 v1, 0xc

    new-instance v0, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics$1;

    invoke-direct {v0}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics$1;-><init>()V

    sput-object v0, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->FACTORY:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;

    new-array v0, v1, [I

    fill-array-data v0, :array_1e

    sput-object v0, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->DAYS_PER_MONTH:[I

    new-array v0, v1, [I

    fill-array-data v0, :array_3a

    sput-object v0, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->YEARDAYS_PER_MONTH:[I

    invoke-static {}, Lorg/dmfs/rfc5545/Weekday;->values()[Lorg/dmfs/rfc5545/Weekday;

    move-result-object v0

    sput-object v0, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->WEEKDAYS:[Lorg/dmfs/rfc5545/Weekday;

    return-void

    :array_1e
    .array-data 4
        0x1f
        0x1c
        0x1f
        0x1e
        0x1f
        0x1e
        0x1f
        0x1f
        0x1e
        0x1f
        0x1e
        0x1f
    .end array-data

    :array_3a
    .array-data 4
        0x0
        0x1f
        0x3b
        0x5a
        0x78
        0x97
        0xb5
        0xd4
        0xf3
        0x111
        0x130
        0x14e
    .end array-data
.end method

.method public constructor <init>(Lorg/dmfs/rfc5545/Weekday;I)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;-><init>(Lorg/dmfs/rfc5545/Weekday;I)V

    return-void
.end method


# virtual methods
.method public getDayOfMonthOfYearDay(II)I
    .registers 4

    invoke-virtual {p0, p1, p2}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getPackedMonthOfYearDay(II)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getYearDaysForPackedMonth(II)I

    move-result v0

    sub-int v0, p2, v0

    return v0
.end method

.method public getDayOfYear(III)I
    .registers 5

    invoke-virtual {p0, p1, p2}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getYearDaysForPackedMonth(II)I

    move-result v0

    add-int/2addr v0, p3

    return v0
.end method

.method public getDaysPerPackedMonth(II)I
    .registers 4

    const/4 v0, 0x1

    if-ne p2, v0, :cond_10

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->isLeapYear(I)Z

    move-result v0

    if-eqz v0, :cond_10

    sget-object v0, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->DAYS_PER_MONTH:[I

    aget v0, v0, p2

    add-int/lit8 v0, v0, 0x1

    :goto_f
    return v0

    :cond_10
    sget-object v0, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->DAYS_PER_MONTH:[I

    aget v0, v0, p2

    goto :goto_f
.end method

.method public getDaysPerYear(I)I
    .registers 3

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->isLeapYear(I)Z

    move-result v0

    if-eqz v0, :cond_9

    const/16 v0, 0x16e

    :goto_8
    return v0

    :cond_9
    const/16 v0, 0x16d

    goto :goto_8
.end method

.method public getMaxMonthDayNum()I
    .registers 2

    const/16 v0, 0x1f

    return v0
.end method

.method public getMaxWeekNoNum()I
    .registers 2

    const/16 v0, 0x35

    return v0
.end method

.method public getMaxYearDayNum()I
    .registers 2

    const/16 v0, 0x16e

    return v0
.end method

.method public getMonthAndDayOfYearDay(II)I
    .registers 7

    move v0, p2

    move v1, p1

    :goto_2
    const/4 v2, 0x1

    if-ge v0, v2, :cond_d

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getDaysPerYear(I)I

    move-result v2

    add-int/2addr v0, v2

    goto :goto_2

    :cond_d
    :goto_d
    invoke-virtual {p0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getDaysPerYear(I)I

    move-result v2

    if-le v0, v2, :cond_17

    add-int/lit8 v1, v1, 0x1

    sub-int/2addr v0, v2

    goto :goto_d

    :cond_17
    shr-int/lit8 v2, v0, 0x5

    add-int/lit8 v2, v2, 0x1

    const/16 v3, 0xc

    if-ge v2, v3, :cond_27

    invoke-virtual {p0, v1, v2}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getYearDaysForPackedMonth(II)I

    move-result v3

    if-ge v3, v0, :cond_27

    add-int/lit8 v2, v2, 0x1

    :cond_27
    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p0, v1, v2}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getYearDaysForPackedMonth(II)I

    move-result v1

    sub-int/2addr v0, v1

    invoke-static {v2, v0}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->monthAndDay(II)I

    move-result v0

    return v0
.end method

.method public getMonthsPerYear()I
    .registers 2

    const/16 v0, 0xc

    return v0
.end method

.method public getPackedMonthOfYearDay(II)I
    .registers 7

    move v0, p2

    move v1, p1

    :goto_2
    const/4 v2, 0x1

    if-ge v0, v2, :cond_d

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getDaysPerYear(I)I

    move-result v2

    add-int/2addr v0, v2

    goto :goto_2

    :cond_d
    :goto_d
    invoke-virtual {p0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getDaysPerYear(I)I

    move-result v2

    if-le v0, v2, :cond_17

    add-int/lit8 v1, v1, 0x1

    sub-int/2addr v0, v2

    goto :goto_d

    :cond_17
    shr-int/lit8 v2, v0, 0x5

    add-int/lit8 v2, v2, 0x1

    const/16 v3, 0xc

    if-ge v2, v3, :cond_2a

    invoke-virtual {p0, v1, v2}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getYearDaysForPackedMonth(II)I

    move-result v1

    if-ge v1, v0, :cond_2a

    add-int/lit8 v0, v2, 0x1

    :goto_27
    add-int/lit8 v0, v0, -0x1

    return v0

    :cond_2a
    move v0, v2

    goto :goto_27
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

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->numLeapDaysSince1970(I)I

    move-result v2

    int-to-long v2, v2

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
    .registers 5

    add-int/lit8 v0, p1, -0x1

    and-int/lit8 v1, v0, 0x3

    mul-int/lit8 v1, v1, 0x5

    add-int/lit8 v1, v1, 0x1

    rem-int/lit8 v2, v0, 0x64

    mul-int/lit8 v2, v2, 0x4

    add-int/2addr v1, v2

    rem-int/lit16 v0, v0, 0x190

    mul-int/lit8 v0, v0, 0x6

    add-int/2addr v0, v1

    rem-int/lit8 v0, v0, 0x7

    return v0
.end method

.method public getWeekOfYear(II)I
    .registers 5

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getYearDayOfFirstWeekStart(I)I

    move-result v0

    if-ge p2, v0, :cond_d

    add-int/lit8 v0, p1, -0x1

    invoke-virtual {p0, v0}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getWeeksPerYear(I)I

    move-result v0

    :cond_c
    :goto_c
    return v0

    :cond_d
    sub-int v0, p2, v0

    div-int/lit8 v0, v0, 0x7

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getWeeksPerYear(I)I

    move-result v1

    if-le v0, v1, :cond_c

    sub-int/2addr v0, v1

    goto :goto_c
.end method

.method public getWeeksPerYear(I)I
    .registers 5

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getYearDayOfFirstWeekStart(I)I

    move-result v0

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getDaysPerYear(I)I

    move-result v1

    sub-int v0, v1, v0

    add-int/lit8 v1, v0, 0x1

    div-int/lit8 v0, v1, 0x7

    rem-int/lit8 v1, v1, 0x7

    rsub-int/lit8 v1, v1, 0x7

    iget v2, p0, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->minDaysInFirstWeek:I

    if-lt v1, v2, :cond_17

    :goto_16
    return v0

    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_16
.end method

.method public getYearDayOfFirstWeekStart(I)I
    .registers 4

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getWeekDayOfFirstYearDay(I)I

    move-result v0

    iget v1, p0, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->weekStartInt:I

    sub-int v0, v1, v0

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->minDaysInFirstWeek:I

    if-le v0, v1, :cond_11

    add-int/lit8 v0, v0, -0x7

    :cond_10
    :goto_10
    return v0

    :cond_11
    iget v1, p0, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->minDaysInFirstWeek:I

    add-int/lit8 v1, v1, -0x6

    if-ge v0, v1, :cond_10

    add-int/lit8 v0, v0, 0x7

    goto :goto_10
.end method

.method public getYearDayOfIsoYear(III)I
    .registers 6

    mul-int/lit8 v0, p2, 0x7

    add-int/lit8 v0, v0, -0x7

    iget v1, p0, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->weekStartInt:I

    sub-int v1, p3, v1

    add-int/lit8 v1, v1, 0x7

    rem-int/lit8 v1, v1, 0x7

    add-int/2addr v0, v1

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getYearDayOfFirstWeekStart(I)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getYearDayOfWeekStart(II)I
    .registers 5

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getYearDayOfFirstWeekStart(I)I

    move-result v0

    add-int/lit8 v1, p2, -0x1

    mul-int/lit8 v1, v1, 0x7

    add-int/2addr v0, v1

    return v0
.end method

.method public getYearDaysForPackedMonth(II)I
    .registers 4

    const/4 v0, 0x1

    if-le p2, v0, :cond_10

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->isLeapYear(I)Z

    move-result v0

    if-eqz v0, :cond_10

    sget-object v0, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->YEARDAYS_PER_MONTH:[I

    aget v0, v0, p2

    add-int/lit8 v0, v0, 0x1

    :goto_f
    return v0

    :cond_10
    sget-object v0, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->YEARDAYS_PER_MONTH:[I

    aget v0, v0, p2

    goto :goto_f
.end method

.method isLeapYear(I)Z
    .registers 3

    and-int/lit8 v0, p1, 0x3

    if-nez v0, :cond_8

    rem-int/lit8 v0, p1, 0x64

    if-nez v0, :cond_c

    :cond_8
    rem-int/lit16 v0, p1, 0x190

    if-nez v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method numLeapDaysSince1970(I)I
    .registers 5

    add-int/lit8 v0, p1, -0x1

    shr-int/lit8 v1, v0, 0x2

    div-int/lit8 v0, v0, 0x64

    shr-int/lit8 v2, v0, 0x2

    add-int/lit16 v1, v1, -0x1ec

    add-int/lit8 v0, v0, -0x13

    sub-int v0, v1, v0

    add-int/lit8 v1, v2, -0x4

    add-int/2addr v0, v1

    return v0
.end method

.method public toInstance(JLjava/util/TimeZone;)J
    .registers 16

    const v9, 0x23ab1

    const v4, 0x8eac

    const/4 v8, 0x3

    const-wide/32 v6, 0x5265c00

    if-eqz p3, :cond_12

    invoke-virtual {p3, p1, p2}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v0

    int-to-long v0, v0

    add-long/2addr p1, v0

    :cond_12
    rem-long v0, p1, v6

    long-to-int v0, v0

    int-to-long v1, v0

    sub-long v1, p1, v1

    if-gez v0, :cond_76

    const v3, 0x5265c00

    add-int/2addr v0, v3

    sub-long/2addr v1, v6

    move v5, v0

    move-wide v10, v1

    move-wide v0, v10

    :goto_22
    div-long/2addr v0, v6

    const-wide/32 v2, 0xaf75d

    add-long/2addr v0, v2

    const-wide/16 v2, 0x1dd

    add-long/2addr v0, v2

    long-to-int v0, v0

    div-int v1, v0, v9

    rem-int/2addr v0, v9

    div-int v2, v0, v4

    invoke-static {v2, v8}, Ljava/lang/Math;->min(II)I

    move-result v2

    mul-int v3, v2, v4

    sub-int/2addr v0, v3

    div-int/lit16 v3, v0, 0x5b5

    const/16 v4, 0x18

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    mul-int/lit16 v4, v3, 0x5b5

    sub-int/2addr v0, v4

    div-int/lit16 v4, v0, 0x16d

    invoke-static {v4, v8}, Ljava/lang/Math;->min(II)I

    move-result v4

    mul-int/lit16 v6, v4, 0x16d

    sub-int/2addr v0, v6

    add-int/lit8 v6, v0, 0x1

    shl-int/lit8 v0, v1, 0x2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x64

    shl-int/lit8 v1, v3, 0x2

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0, v6}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v2

    const v1, 0xea60

    div-int v4, v5, v1

    invoke-static {v2}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->packedMonth(I)I

    move-result v1

    invoke-static {v2}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->dayOfMonth(I)I

    move-result v2

    div-int/lit8 v3, v4, 0x3c

    rem-int/lit8 v4, v4, 0x3c

    div-int/lit16 v5, v5, 0x3e8

    rem-int/lit8 v5, v5, 0x3c

    invoke-static/range {v0 .. v5}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v0

    return-wide v0

    :cond_76
    move v5, v0

    move-wide v10, v1

    move-wide v0, v10

    goto :goto_22
.end method

.method public toMillis(Ljava/util/TimeZone;IIIIIII)J
    .registers 28

    mul-int/lit8 v4, p5, 0x3c

    add-int v4, v4, p6

    mul-int/lit8 v4, v4, 0x3c

    add-int v4, v4, p7

    mul-int/lit16 v4, v4, 0x3e8

    add-int v10, v4, p8

    move-object/from16 v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-virtual {v0, v1, v2, v3}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getDayOfWeek(III)I

    move-result v18

    if-nez p1, :cond_69

    const/4 v4, 0x0

    :goto_1b
    move-object/from16 v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-virtual {v0, v1, v2, v3}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getDayOfYear(III)I

    move-result v13

    move-object/from16 v11, p0

    move/from16 v12, p2

    move/from16 v14, p5

    move/from16 v15, p6

    move/from16 v16, p7

    move/from16 v17, p8

    invoke-virtual/range {v11 .. v17}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getTimeStamp(IIIIII)J

    move-result-wide v11

    sub-int/2addr v10, v4

    if-gez v10, :cond_7e

    const v4, 0x5265c00

    add-int/2addr v10, v4

    add-int/lit8 v8, p4, -0x1

    if-nez v8, :cond_b8

    add-int/lit8 v4, p3, -0x1

    if-gez v4, :cond_52

    add-int/lit8 p2, p2, -0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getMonthsPerYear(I)I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    :cond_52
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v1, v4}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getDaysPerPackedMonth(II)I

    move-result v8

    add-int/lit8 v5, v18, 0x6

    rem-int/lit8 v5, v5, 0x7

    move v7, v4

    move/from16 v6, p2

    move v4, v5

    :goto_62
    if-nez p1, :cond_ae

    const/4 v4, 0x0

    :goto_65
    int-to-long v4, v4

    sub-long v4, v11, v4

    return-wide v4

    :cond_69
    const/4 v5, 0x1

    add-int/lit8 v9, v18, 0x1

    move-object/from16 v4, p1

    move/from16 v6, p2

    move/from16 v7, p3

    move/from16 v8, p4

    invoke-virtual/range {v4 .. v10}, Ljava/util/TimeZone;->getOffset(IIIIII)I

    move-result v4

    invoke-virtual/range {p1 .. p1}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v5

    sub-int/2addr v4, v5

    goto :goto_1b

    :cond_7e
    const v4, 0x5265c00

    if-lt v10, v4, :cond_bf

    const v4, 0x5265c00

    sub-int/2addr v10, v4

    add-int/lit8 v8, p4, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getDaysPerPackedMonth(II)I

    move-result v4

    if-le v8, v4, :cond_b8

    add-int/lit8 v4, p3, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;->getMonthsPerYear(I)I

    move-result v5

    if-lt v4, v5, :cond_a4

    add-int/lit8 p2, p2, 0x1

    const/4 v4, 0x0

    :cond_a4
    const/4 v8, 0x1

    add-int/lit8 v5, v18, 0x1

    rem-int/lit8 v5, v5, 0x7

    move v7, v4

    move/from16 v6, p2

    move v4, v5

    goto :goto_62

    :cond_ae
    const/4 v5, 0x1

    add-int/lit8 v9, v4, 0x1

    move-object/from16 v4, p1

    invoke-virtual/range {v4 .. v10}, Ljava/util/TimeZone;->getOffset(IIIIII)I

    move-result v4

    goto :goto_65

    :cond_b8
    move/from16 v4, v18

    move/from16 v7, p3

    move/from16 v6, p2

    goto :goto_62

    :cond_bf
    move/from16 v4, v18

    move/from16 v8, p4

    move/from16 v7, p3

    move/from16 v6, p2

    goto :goto_62
.end method
