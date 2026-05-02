.class public abstract Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;
    }
.end annotation


# instance fields
.field public final minDaysInFirstWeek:I

.field public final weekStart:Lorg/dmfs/rfc5545/Weekday;

.field public final weekStartInt:I


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/Weekday;I)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->weekStart:Lorg/dmfs/rfc5545/Weekday;

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/Weekday;->ordinal()I

    move-result v0

    iput v0, p0, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->weekStartInt:I

    iput p2, p0, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->minDaysInFirstWeek:I

    return-void
.end method

.method public static dayOfMonth(I)I
    .registers 2

    and-int/lit16 v0, p0, 0xff

    return v0
.end method

.method public static monthAndDay(II)I
    .registers 3

    shl-int/lit8 v0, p0, 0x8

    add-int/2addr v0, p1

    return v0
.end method

.method public static packedMonth(I)I
    .registers 2

    shr-int/lit8 v0, p0, 0x8

    return v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5

    const/4 v1, 0x0

    instance-of v0, p1, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    if-nez v0, :cond_6

    :goto_5
    return v1

    :cond_6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-ne v0, v2, :cond_24

    iget v2, p0, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->minDaysInFirstWeek:I

    move-object v0, p1

    check-cast v0, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget v0, v0, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->minDaysInFirstWeek:I

    if-ne v2, v0, :cond_24

    iget-object v0, p0, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->weekStart:Lorg/dmfs/rfc5545/Weekday;

    check-cast p1, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget-object v2, p1, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->weekStart:Lorg/dmfs/rfc5545/Weekday;

    if-ne v0, v2, :cond_24

    const/4 v0, 0x1

    :goto_22
    move v1, v0

    goto :goto_5

    :cond_24
    move v0, v1

    goto :goto_22
.end method

.method public abstract getDayOfMonthOfYearDay(II)I
.end method

.method public getDayOfWeek(II)I
    .registers 4

    invoke-virtual {p0, p1}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekDayOfFirstYearDay(I)I

    move-result v0

    add-int/2addr v0, p2

    add-int/lit8 v0, v0, -0x1

    rem-int/lit8 v0, v0, 0x7

    return v0
.end method

.method public getDayOfWeek(III)I
    .registers 5

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDayOfYear(III)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDayOfWeek(II)I

    move-result v0

    return v0
.end method

.method public abstract getDayOfYear(III)I
.end method

.method public abstract getDaysPerPackedMonth(II)I
.end method

.method public abstract getDaysPerYear(I)I
.end method

.method public abstract getMaxMonthDayNum()I
.end method

.method public abstract getMaxWeekNoNum()I
.end method

.method public abstract getMaxYearDayNum()I
.end method

.method public abstract getMonthAndDayOfYearDay(II)I
.end method

.method public abstract getMonthsPerYear(I)I
.end method

.method public abstract getPackedMonthOfYearDay(II)I
.end method

.method public abstract getWeekDayOfFirstYearDay(I)I
.end method

.method public abstract getWeekOfYear(II)I
.end method

.method public getWeekOfYear(III)I
    .registers 5

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDayOfYear(III)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekOfYear(II)I

    move-result v0

    return v0
.end method

.method public abstract getWeeksPerYear(I)I
.end method

.method public abstract getYearDayOfFirstWeekStart(I)I
.end method

.method public abstract getYearDayOfIsoYear(III)I
.end method

.method public abstract getYearDayOfWeekStart(II)I
.end method

.method public abstract getYearDaysForPackedMonth(II)I
.end method

.method public hashCode()I
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public isLeapMonth(I)Z
    .registers 4

    const/4 v0, 0x1

    and-int/lit8 v1, p1, 0x1

    if-ne v1, v0, :cond_6

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public monthNum(I)I
    .registers 3

    ushr-int/lit8 v0, p1, 0x1

    return v0
.end method

.method public abstract nextDay(J)J
.end method

.method public abstract nextDay(JI)J
.end method

.method public abstract nextMonth(J)J
.end method

.method public abstract nextMonth(JI)J
.end method

.method public packedMonth(IZ)I
    .registers 4

    if-eqz p2, :cond_5

    shl-int/lit8 v0, p1, 0x2

    :goto_4
    return v0

    :cond_5
    shl-int/lit8 v0, p1, 0x1

    goto :goto_4
.end method

.method public packedMonth(Ljava/lang/String;)I
    .registers 6

    const/4 v0, 0x0

    if-nez p1, :cond_b

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "month strings must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_b
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_14

    const/4 v2, 0x3

    if-le v1, v2, :cond_2d

    :cond_14
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "illegal month string "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2d
    add-int/lit8 v2, v1, -0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x4c

    if-eq v2, v3, :cond_3b

    const/16 v3, 0x6c

    if-ne v2, v3, :cond_3c

    :cond_3b
    const/4 v0, 0x1

    :cond_3c
    const/4 v2, 0x0

    sub-int/2addr v1, v0

    :try_start_3e
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_45
    .catch Ljava/lang/NumberFormatException; {:try_start_3e .. :try_end_45} :catch_4d

    move-result v1

    add-int/lit8 v1, v1, -0x1

    add-int/lit8 v0, v0, 0x1

    shl-int v0, v1, v0

    return v0

    :catch_4d
    move-exception v0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "illegal month string "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public packedMonthToString(I)Ljava/lang/String;
    .registers 4

    and-int/lit8 v0, p1, 0x1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1f

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    ushr-int/lit8 v1, p1, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "L"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_1e
    return-object v0

    :cond_1f
    ushr-int/lit8 v0, p1, 0x1

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1e
.end method

.method public abstract prevDay(J)J
.end method

.method public abstract prevDay(JI)J
.end method

.method public abstract prevMonth(J)J
.end method

.method public abstract prevMonth(JI)J
.end method

.method public scaleEquals(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)Z
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public setDayOfWeek(JI)J
    .registers 7

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v0

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v1

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDayOfWeek(III)I

    move-result v0

    iget v1, p0, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->weekStartInt:I

    sub-int v0, v1, v0

    add-int/lit8 v0, v0, -0x7

    rem-int/lit8 v0, v0, 0x7

    iget v1, p0, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->weekStartInt:I

    sub-int v1, p3, v1

    add-int/lit8 v1, v1, 0x7

    rem-int/lit8 v1, v1, 0x7

    add-int/2addr v0, v1

    packed-switch v0, :pswitch_data_3a

    :goto_24
    :pswitch_24
    return-wide p1

    :pswitch_25
    neg-int v0, v0

    invoke-virtual {p0, p1, p2, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->prevDay(JI)J

    move-result-wide p1

    goto :goto_24

    :pswitch_2b
    invoke-virtual {p0, p1, p2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->prevDay(J)J

    move-result-wide p1

    goto :goto_24

    :pswitch_30
    invoke-virtual {p0, p1, p2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->nextDay(J)J

    move-result-wide p1

    goto :goto_24

    :pswitch_35
    invoke-virtual {p0, p1, p2, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->nextDay(JI)J

    move-result-wide p1

    goto :goto_24

    :pswitch_data_3a
    .packed-switch -0x6
        :pswitch_25
        :pswitch_25
        :pswitch_25
        :pswitch_25
        :pswitch_25
        :pswitch_2b
        :pswitch_24
        :pswitch_30
        :pswitch_35
        :pswitch_35
        :pswitch_35
        :pswitch_35
        :pswitch_35
    .end packed-switch
.end method

.method public startOfWeek(J)J
    .registers 6

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v0

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v1

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDayOfWeek(III)I

    move-result v0

    iget v1, p0, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->weekStartInt:I

    sub-int v0, v1, v0

    add-int/lit8 v0, v0, -0x7

    rem-int/lit8 v0, v0, 0x7

    if-nez v0, :cond_1b

    :goto_1a
    return-wide p1

    :cond_1b
    const/4 v1, -0x1

    if-ne v0, v1, :cond_23

    invoke-virtual {p0, p1, p2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->prevDay(J)J

    move-result-wide p1

    goto :goto_1a

    :cond_23
    neg-int v0, v0

    invoke-virtual {p0, p1, p2, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->prevDay(JI)J

    move-result-wide p1

    goto :goto_1a
.end method

.method public abstract toInstance(JLjava/util/TimeZone;)J
.end method

.method public toMillis(JLjava/util/TimeZone;)J
    .registers 13

    if-eqz p3, :cond_e

    const-string v0, "UTC"

    invoke-virtual {p3}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    :cond_e
    const/4 v1, 0x0

    :goto_f
    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v2

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v3

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v4

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->hour(J)I

    move-result v5

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->minute(J)I

    move-result v6

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->second(J)I

    move-result v7

    const/4 v8, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v8}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->toMillis(Ljava/util/TimeZone;IIIIIII)J

    move-result-wide v0

    return-wide v0

    :cond_2e
    move-object v1, p3

    goto :goto_f
.end method

.method public abstract toMillis(Ljava/util/TimeZone;IIIIIII)J
.end method

.method public validate(J)Z
    .registers 9

    const/16 v5, 0x3b

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v2

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v3

    if-ltz v3, :cond_14

    invoke-virtual {p0, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthsPerYear(I)I

    move-result v4

    if-lt v3, v4, :cond_16

    :cond_14
    move v0, v1

    :cond_15
    :goto_15
    return v0

    :cond_16
    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v4

    if-lt v4, v0, :cond_22

    invoke-virtual {p0, v2, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerPackedMonth(II)I

    move-result v2

    if-le v4, v2, :cond_24

    :cond_22
    move v0, v1

    goto :goto_15

    :cond_24
    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->hour(J)I

    move-result v2

    if-ltz v2, :cond_2e

    const/16 v3, 0x17

    if-le v2, v3, :cond_30

    :cond_2e
    move v0, v1

    goto :goto_15

    :cond_30
    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->minute(J)I

    move-result v2

    if-ltz v2, :cond_38

    if-le v2, v5, :cond_3a

    :cond_38
    move v0, v1

    goto :goto_15

    :cond_3a
    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->second(J)I

    move-result v2

    if-ltz v2, :cond_42

    if-le v2, v5, :cond_15

    :cond_42
    move v0, v1

    goto :goto_15
.end method
