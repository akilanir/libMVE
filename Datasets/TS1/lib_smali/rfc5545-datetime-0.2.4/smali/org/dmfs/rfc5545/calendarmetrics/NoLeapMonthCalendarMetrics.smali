.class public abstract Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;
.super Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/Weekday;I)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;-><init>(Lorg/dmfs/rfc5545/Weekday;I)V

    return-void
.end method


# virtual methods
.method public abstract getMonthsPerYear()I
.end method

.method public getMonthsPerYear(I)I
    .registers 3

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->getMonthsPerYear()I

    move-result v0

    return v0
.end method

.method public isLeapMonth(I)Z
    .registers 3

    const/4 v0, 0x0

    return v0
.end method

.method public monthNum(I)I
    .registers 2

    return p1
.end method

.method public nextDay(J)J
    .registers 7

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v2

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->getDaysPerPackedMonth(II)I

    move-result v1

    if-le v0, v1, :cond_29

    const/4 v1, 0x1

    add-int/lit8 v0, v3, 0x1

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->getMonthsPerYear()I

    move-result v3

    if-ne v0, v3, :cond_24

    add-int/lit8 v0, v2, 0x1

    invoke-static {p1, p2, v0}, Lorg/dmfs/rfc5545/Instance;->setYear(JI)J

    move-result-wide p1

    const/4 v0, 0x0

    :cond_24
    invoke-static {p1, p2, v0}, Lorg/dmfs/rfc5545/Instance;->setMonth(JI)J

    move-result-wide p1

    move v0, v1

    :cond_29
    invoke-static {p1, p2, v0}, Lorg/dmfs/rfc5545/Instance;->setDayOfMonth(JI)J

    move-result-wide v0

    return-wide v0
.end method

.method public nextDay(JI)J
    .registers 8

    if-gez p3, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "n must be >=0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    if-nez p3, :cond_d

    :goto_c
    return-wide p1

    :cond_d
    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v1

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v0

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v2

    invoke-virtual {p0, v1, v0}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->getDaysPerPackedMonth(II)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-virtual {p0, v1, v0, v2}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->getDayOfYear(III)I

    move-result v0

    add-int/2addr v0, p3

    :goto_26
    invoke-virtual {p0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->getDaysPerYear(I)I

    move-result v2

    if-le v0, v2, :cond_30

    sub-int/2addr v0, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_26

    :cond_30
    invoke-virtual {p0, v1, v0}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v0

    invoke-static {v0}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->packedMonth(I)I

    move-result v2

    invoke-static {v0}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->dayOfMonth(I)I

    move-result v0

    invoke-static {p1, p2, v2, v0}, Lorg/dmfs/rfc5545/Instance;->setMonthAndDayOfMonth(JII)J

    move-result-wide v2

    invoke-static {v2, v3, v1}, Lorg/dmfs/rfc5545/Instance;->setYear(JI)J

    move-result-wide p1

    goto :goto_c
.end method

.method public nextMonth(J)J
    .registers 6

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->getMonthsPerYear()I

    move-result v1

    if-ge v0, v1, :cond_11

    invoke-static {p1, p2, v0}, Lorg/dmfs/rfc5545/Instance;->setMonth(JI)J

    move-result-wide v0

    :goto_10
    return-wide v0

    :cond_11
    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Lorg/dmfs/rfc5545/Instance;->setMonth(JI)J

    move-result-wide v0

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-static {v0, v1, v2}, Lorg/dmfs/rfc5545/Instance;->setYear(JI)J

    move-result-wide v0

    goto :goto_10
.end method

.method public nextMonth(JI)J
    .registers 9

    if-gez p3, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "n must be >=0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    if-nez p3, :cond_d

    :goto_c
    return-wide p1

    :cond_d
    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v0

    add-int/2addr v0, p3

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->getMonthsPerYear()I

    move-result v1

    if-ge v0, v1, :cond_1d

    invoke-static {p1, p2, v0}, Lorg/dmfs/rfc5545/Instance;->setMonth(JI)J

    move-result-wide p1

    goto :goto_c

    :cond_1d
    rem-int v2, v0, v1

    invoke-static {p1, p2, v2}, Lorg/dmfs/rfc5545/Instance;->setMonth(JI)J

    move-result-wide v2

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v4

    div-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v2, v3, v0}, Lorg/dmfs/rfc5545/Instance;->setYear(JI)J

    move-result-wide p1

    goto :goto_c
.end method

.method public packedMonth(IZ)I
    .registers 3

    return p1
.end method

.method public packedMonth(Ljava/lang/String;)I
    .registers 6

    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ltz v0, :cond_e

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->getMonthsPerYear()I

    move-result v1

    if-lt v0, v1, :cond_4f

    :cond_e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "month "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is out of range 1.."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->getMonthsPerYear()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_35
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_35} :catch_35

    :catch_35
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

    :cond_4f
    return v0
.end method

.method public packedMonthToString(I)Ljava/lang/String;
    .registers 3

    add-int/lit8 v0, p1, 0x1

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public prevDay(J)J
    .registers 6

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v1

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v2

    invoke-virtual {p0, v1, v2}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->getDaysPerPackedMonth(II)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    if-gtz v0, :cond_3a

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v1

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v2, -0x1

    if-gt v0, v2, :cond_31

    add-int/lit8 v1, v1, -0x1

    invoke-static {p1, p2, v1}, Lorg/dmfs/rfc5545/Instance;->setYear(JI)J

    move-result-wide p1

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->getMonthsPerYear()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :cond_31
    invoke-virtual {p0, v1, v0}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->getDaysPerPackedMonth(II)I

    move-result v1

    invoke-static {p1, p2, v0}, Lorg/dmfs/rfc5545/Instance;->setMonth(JI)J

    move-result-wide p1

    move v0, v1

    :cond_3a
    invoke-static {p1, p2, v0}, Lorg/dmfs/rfc5545/Instance;->setDayOfMonth(JI)J

    move-result-wide v0

    return-wide v0
.end method

.method public prevDay(JI)J
    .registers 8

    if-gez p3, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "n must be >=0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    if-nez p3, :cond_d

    :goto_c
    return-wide p1

    :cond_d
    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v1

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v0

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v2

    invoke-virtual {p0, v1, v0}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->getDaysPerPackedMonth(II)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-virtual {p0, v1, v0, v2}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->getDayOfYear(III)I

    move-result v0

    sub-int/2addr v0, p3

    :goto_28
    const/4 v2, 0x1

    if-ge v0, v2, :cond_33

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->getDaysPerYear(I)I

    move-result v2

    add-int/2addr v0, v2

    goto :goto_28

    :cond_33
    invoke-virtual {p0, v1, v0}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v0

    invoke-static {v0}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->packedMonth(I)I

    move-result v2

    invoke-static {v0}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->dayOfMonth(I)I

    move-result v0

    invoke-static {p1, p2, v2, v0}, Lorg/dmfs/rfc5545/Instance;->setMonthAndDayOfMonth(JII)J

    move-result-wide v2

    invoke-static {v2, v3, v1}, Lorg/dmfs/rfc5545/Instance;->setYear(JI)J

    move-result-wide p1

    goto :goto_c
.end method

.method public prevMonth(J)J
    .registers 6

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ltz v0, :cond_d

    invoke-static {p1, p2, v0}, Lorg/dmfs/rfc5545/Instance;->setMonth(JI)J

    move-result-wide v0

    :goto_c
    return-wide v0

    :cond_d
    invoke-virtual {p0}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->getMonthsPerYear()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {p1, p2, v0}, Lorg/dmfs/rfc5545/Instance;->setMonth(JI)J

    move-result-wide v0

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-static {v0, v1, v2}, Lorg/dmfs/rfc5545/Instance;->setYear(JI)J

    move-result-wide v0

    goto :goto_c
.end method

.method public prevMonth(JI)J
    .registers 9

    if-gez p3, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "n must be >=0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    if-nez p3, :cond_d

    :goto_c
    return-wide p1

    :cond_d
    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v0

    sub-int/2addr v0, p3

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics;->getMonthsPerYear()I

    move-result v1

    if-ltz v0, :cond_1d

    invoke-static {p1, p2, v0}, Lorg/dmfs/rfc5545/Instance;->setMonth(JI)J

    move-result-wide p1

    goto :goto_c

    :cond_1d
    rem-int v2, v0, v1

    add-int/2addr v2, v1

    rem-int/2addr v2, v1

    invoke-static {p1, p2, v2}, Lorg/dmfs/rfc5545/Instance;->setMonth(JI)J

    move-result-wide v2

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v4

    div-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v2, v3, v0}, Lorg/dmfs/rfc5545/Instance;->setYear(JI)J

    move-result-wide p1

    goto :goto_c
.end method
