.class final Lorg/dmfs/rfc5545/recur/ByDayFilter;
.super Lorg/dmfs/rfc5545/recur/ByFilter;


# instance fields
.field private final mHasPositions:Z

.field private final mPackedDays:[I

.field private final mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)V
    .registers 9

    const/4 v1, 0x0

    invoke-direct {p0, p2}, Lorg/dmfs/rfc5545/recur/ByFilter;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)V

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getByDayPart()Ljava/util/List;

    move-result-object v2

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTH:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getFreq()Lorg/dmfs/rfc5545/recur/Freq;

    move-result-object v3

    sget-object v4, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYWEEKNO:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v4

    if-nez v4, :cond_1e

    sget-object v4, Lorg/dmfs/rfc5545/recur/Freq;->WEEKLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne v3, v4, :cond_5d

    :cond_1e
    if-nez v0, :cond_24

    sget-object v0, Lorg/dmfs/rfc5545/recur/Freq;->MONTHLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne v3, v0, :cond_5a

    :cond_24
    sget-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->WEEKLY_AND_MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    :goto_26
    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByDayFilter;->mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByDayFilter;->mPackedDays:[I

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v2, v1

    :goto_35
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_69

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;

    iget v4, v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;->pos:I

    if-eqz v4, :cond_46

    const/4 v2, 0x1

    :cond_46
    iget-object v4, p0, Lorg/dmfs/rfc5545/recur/ByDayFilter;->mPackedDays:[I

    iget v5, v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;->pos:I

    iget-object v0, v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;->weekday:Lorg/dmfs/rfc5545/Weekday;

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/Weekday;->ordinal()I

    move-result v0

    invoke-static {v5, v0}, Lorg/dmfs/rfc5545/recur/ByDayFilter;->packWeekday(II)I

    move-result v0

    aput v0, v4, v1

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_35

    :cond_5a
    sget-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->WEEKLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    goto :goto_26

    :cond_5d
    if-nez v0, :cond_63

    sget-object v0, Lorg/dmfs/rfc5545/recur/Freq;->MONTHLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne v3, v0, :cond_66

    :cond_63
    sget-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    goto :goto_26

    :cond_66
    sget-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->YEARLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    goto :goto_26

    :cond_69
    iput-boolean v2, p0, Lorg/dmfs/rfc5545/recur/ByDayFilter;->mHasPositions:Z

    return-void
.end method

.method private static packWeekday(II)I
    .registers 3

    shl-int/lit8 v0, p0, 0x8

    add-int/2addr v0, p1

    return v0
.end method

.method private static unpackPos(I)I
    .registers 2

    ushr-int/lit8 v0, p0, 0x8

    return v0
.end method

.method private static unpackWeekday(I)I
    .registers 2

    and-int/lit16 v0, p0, 0xff

    return v0
.end method


# virtual methods
.method filter(J)Z
    .registers 13

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v2

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v3

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v4

    iget-object v5, p0, Lorg/dmfs/rfc5545/recur/ByDayFilter;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v5, v2, v3, v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDayOfWeek(III)I

    move-result v6

    iget-object v7, p0, Lorg/dmfs/rfc5545/recur/ByDayFilter;->mPackedDays:[I

    iget-boolean v8, p0, Lorg/dmfs/rfc5545/recur/ByDayFilter;->mHasPositions:Z

    if-nez v8, :cond_28

    invoke-static {v1, v6}, Lorg/dmfs/rfc5545/recur/ByDayFilter;->packWeekday(II)I

    move-result v2

    invoke-static {v7, v2}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v2

    if-gez v2, :cond_26

    :goto_24
    move v1, v0

    :cond_25
    :goto_25
    return v1

    :cond_26
    move v0, v1

    goto :goto_24

    :cond_28
    sget-object v8, Lorg/dmfs/rfc5545/recur/ByDayFilter$1;->$SwitchMap$org$dmfs$rfc5545$recur$ByExpander$Scope:[I

    iget-object v9, p0, Lorg/dmfs/rfc5545/recur/ByDayFilter;->mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    invoke-virtual {v9}, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_9c

    goto :goto_25

    :pswitch_36
    invoke-static {v1, v6}, Lorg/dmfs/rfc5545/recur/ByDayFilter;->packWeekday(II)I

    move-result v2

    invoke-static {v7, v2}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v2

    if-gez v2, :cond_42

    :goto_40
    move v1, v0

    goto :goto_25

    :cond_42
    move v0, v1

    goto :goto_40

    :pswitch_44
    add-int/lit8 v8, v4, -0x1

    div-int/lit8 v8, v8, 0x7

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v5, v2, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerPackedMonth(II)I

    move-result v2

    sub-int v2, v4, v2

    div-int/lit8 v2, v2, 0x7

    add-int/lit8 v2, v2, -0x1

    if-lez v8, :cond_60

    invoke-static {v8, v6}, Lorg/dmfs/rfc5545/recur/ByDayFilter;->packWeekday(II)I

    move-result v3

    invoke-static {v7, v3}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v3

    if-gez v3, :cond_25

    :cond_60
    if-gez v2, :cond_6c

    invoke-static {v2, v6}, Lorg/dmfs/rfc5545/recur/ByDayFilter;->packWeekday(II)I

    move-result v2

    invoke-static {v7, v2}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v2

    if-gez v2, :cond_25

    :cond_6c
    move v1, v0

    goto :goto_25

    :pswitch_6e
    invoke-virtual {v5, v2, v3, v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDayOfYear(III)I

    move-result v3

    add-int/lit8 v4, v3, -0x1

    div-int/lit8 v4, v4, 0x7

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v5, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerYear(I)I

    move-result v2

    sub-int v2, v3, v2

    div-int/lit8 v2, v2, 0x7

    add-int/lit8 v2, v2, -0x1

    if-lez v4, :cond_8e

    invoke-static {v4, v6}, Lorg/dmfs/rfc5545/recur/ByDayFilter;->packWeekday(II)I

    move-result v3

    invoke-static {v7, v3}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v3

    if-gez v3, :cond_25

    :cond_8e
    if-gez v2, :cond_9a

    invoke-static {v2, v6}, Lorg/dmfs/rfc5545/recur/ByDayFilter;->packWeekday(II)I

    move-result v2

    invoke-static {v7, v2}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v2

    if-gez v2, :cond_25

    :cond_9a
    move v1, v0

    goto :goto_25

    :pswitch_data_9c
    .packed-switch 0x1
        :pswitch_36
        :pswitch_44
        :pswitch_44
        :pswitch_6e
    .end packed-switch
.end method
