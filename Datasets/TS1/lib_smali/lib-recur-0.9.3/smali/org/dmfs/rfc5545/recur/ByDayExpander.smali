.class final Lorg/dmfs/rfc5545/recur/ByDayExpander;
.super Lorg/dmfs/rfc5545/recur/ByExpander;


# instance fields
.field private final mByDay:[I

.field private final mMonths:[I

.field private final mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V
    .registers 12

    invoke-direct {p0, p2, p3, p4, p5}, Lorg/dmfs/rfc5545/recur/ByExpander;-><init>(Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getByDayPart()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByDayExpander;->mByDay:[I

    const/4 v0, 0x0

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    move v1, v0

    :goto_15
    if-ge v1, v3, :cond_31

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;

    iget-object v4, p0, Lorg/dmfs/rfc5545/recur/ByDayExpander;->mByDay:[I

    iget v5, v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;->pos:I

    iget-object v0, v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;->weekday:Lorg/dmfs/rfc5545/Weekday;

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/Weekday;->ordinal()I

    move-result v0

    invoke-static {v5, v0}, Lorg/dmfs/rfc5545/recur/ByDayExpander;->packWeekday(II)I

    move-result v0

    aput v0, v4, v1

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_15

    :cond_31
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTH:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v1

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getFreq()Lorg/dmfs/rfc5545/recur/Freq;

    move-result-object v0

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYWEEKNO:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v2}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v2

    if-nez v2, :cond_47

    sget-object v2, Lorg/dmfs/rfc5545/recur/Freq;->WEEKLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne v0, v2, :cond_69

    :cond_47
    if-nez v1, :cond_4d

    sget-object v2, Lorg/dmfs/rfc5545/recur/Freq;->MONTHLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne v0, v2, :cond_66

    :cond_4d
    sget-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->WEEKLY_AND_MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    :goto_4f
    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByDayExpander;->mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/ByDayExpander;->mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    sget-object v2, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->WEEKLY_AND_MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    if-ne v0, v2, :cond_75

    if-eqz v1, :cond_75

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTH:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getByPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lorg/dmfs/rfc5545/recur/StaticUtils;->ListToArray(Ljava/util/List;)[I

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByDayExpander;->mMonths:[I

    :goto_65
    return-void

    :cond_66
    sget-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->WEEKLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    goto :goto_4f

    :cond_69
    if-nez v1, :cond_6f

    sget-object v2, Lorg/dmfs/rfc5545/recur/Freq;->MONTHLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne v0, v2, :cond_72

    :cond_6f
    sget-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    goto :goto_4f

    :cond_72
    sget-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->YEARLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    goto :goto_4f

    :cond_75
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByDayExpander;->mMonths:[I

    goto :goto_65
.end method

.method private static packWeekday(II)I
    .registers 3

    shl-int/lit8 v0, p0, 0x8

    add-int/2addr v0, p1

    return v0
.end method

.method private static unpackPos(I)I
    .registers 2

    shr-int/lit8 v0, p0, 0x8

    return v0
.end method

.method private static unpackWeekday(I)I
    .registers 2

    and-int/lit16 v0, p0, 0xff

    return v0
.end method


# virtual methods
.method expand(JJ)V
    .registers 17

    iget-object v3, p0, Lorg/dmfs/rfc5545/recur/ByDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v4

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v5

    iget-object v6, p0, Lorg/dmfs/rfc5545/recur/ByDayExpander;->mByDay:[I

    array-length v7, v6

    const/4 v0, 0x0

    move v2, v0

    :goto_f
    if-ge v2, v7, :cond_109

    aget v0, v6, v2

    invoke-static {v0}, Lorg/dmfs/rfc5545/recur/ByDayExpander;->unpackPos(I)I

    move-result v8

    invoke-static {v0}, Lorg/dmfs/rfc5545/recur/ByDayExpander;->unpackWeekday(I)I

    move-result v0

    sget-object v1, Lorg/dmfs/rfc5545/recur/ByDayExpander$1;->$SwitchMap$org$dmfs$rfc5545$recur$ByExpander$Scope:[I

    iget-object v9, p0, Lorg/dmfs/rfc5545/recur/ByDayExpander;->mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    invoke-virtual {v9}, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->ordinal()I

    move-result v9

    aget v1, v1, v9

    packed-switch v1, :pswitch_data_10a

    :cond_28
    :goto_28
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_f

    :pswitch_2c
    if-eqz v8, :cond_31

    const/4 v1, 0x1

    if-ne v8, v1, :cond_28

    :cond_31
    invoke-virtual {v3, p1, p2, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->setDayOfWeek(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/dmfs/rfc5545/recur/ByDayExpander;->addInstance(J)V

    goto :goto_28

    :pswitch_39
    if-eqz v8, :cond_3e

    const/4 v1, 0x1

    if-ne v8, v1, :cond_28

    :cond_3e
    invoke-virtual {v3, p1, p2, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->setDayOfWeek(JI)J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v8

    iget-object v9, p0, Lorg/dmfs/rfc5545/recur/ByDayExpander;->mMonths:[I

    if-eqz v9, :cond_52

    iget-object v9, p0, Lorg/dmfs/rfc5545/recur/ByDayExpander;->mMonths:[I

    invoke-static {v9, v8}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v9

    if-gtz v9, :cond_58

    :cond_52
    iget-object v9, p0, Lorg/dmfs/rfc5545/recur/ByDayExpander;->mMonths:[I

    if-nez v9, :cond_28

    if-ne v8, v5, :cond_28

    :cond_58
    invoke-virtual {p0, v0, v1}, Lorg/dmfs/rfc5545/recur/ByDayExpander;->addInstance(J)V

    goto :goto_28

    :pswitch_5c
    const/4 v1, 0x1

    invoke-virtual {v3, v4, v5, v1}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDayOfWeek(III)I

    move-result v1

    invoke-virtual {v3, v4, v5}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerPackedMonth(II)I

    move-result v9

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x7

    rem-int/lit8 v0, v0, 0x7

    add-int/lit8 v1, v0, 0x1

    if-nez v8, :cond_7b

    move v0, v1

    :goto_6f
    if-gt v0, v9, :cond_28

    invoke-static {p1, p2, v0}, Lorg/dmfs/rfc5545/Instance;->setDayOfMonth(JI)J

    move-result-wide v10

    invoke-virtual {p0, v10, v11}, Lorg/dmfs/rfc5545/recur/ByDayExpander;->addInstance(J)V

    add-int/lit8 v0, v0, 0x7

    goto :goto_6f

    :cond_7b
    sub-int v0, v9, v1

    div-int/lit8 v0, v0, 0x7

    add-int/lit8 v0, v0, 0x1

    if-lez v8, :cond_85

    if-le v8, v0, :cond_8d

    :cond_85
    if-gez v8, :cond_28

    add-int v9, v8, v0

    add-int/lit8 v9, v9, 0x1

    if-lez v9, :cond_28

    :cond_8d
    if-lez v8, :cond_9c

    add-int/lit8 v0, v8, -0x1

    :goto_91
    mul-int/lit8 v0, v0, 0x7

    add-int/2addr v0, v1

    invoke-static {p1, p2, v0}, Lorg/dmfs/rfc5545/Instance;->setDayOfMonth(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/dmfs/rfc5545/recur/ByDayExpander;->addInstance(J)V

    goto :goto_28

    :cond_9c
    add-int/2addr v0, v8

    goto :goto_91

    :pswitch_9e
    invoke-virtual {v3, v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekDayOfFirstYearDay(I)I

    move-result v1

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x7

    rem-int/lit8 v0, v0, 0x7

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v3, v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerYear(I)I

    move-result v1

    if-nez v8, :cond_c7

    :goto_af
    if-gt v0, v1, :cond_28

    invoke-virtual {v3, v4, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v8

    invoke-static {v8}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->packedMonth(I)I

    move-result v9

    invoke-static {v8}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->dayOfMonth(I)I

    move-result v8

    invoke-static {p1, p2, v9, v8}, Lorg/dmfs/rfc5545/Instance;->setMonthAndDayOfMonth(JII)J

    move-result-wide v8

    invoke-virtual {p0, v8, v9}, Lorg/dmfs/rfc5545/recur/ByDayExpander;->addInstance(J)V

    add-int/lit8 v0, v0, 0x7

    goto :goto_af

    :cond_c7
    if-lez v8, :cond_e5

    add-int/lit8 v8, v8, -0x1

    mul-int/lit8 v8, v8, 0x7

    add-int/2addr v0, v8

    if-gt v0, v1, :cond_28

    invoke-virtual {v3, v4, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v0

    invoke-static {v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->packedMonth(I)I

    move-result v1

    invoke-static {v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->dayOfMonth(I)I

    move-result v0

    invoke-static {p1, p2, v1, v0}, Lorg/dmfs/rfc5545/Instance;->setMonthAndDayOfMonth(JII)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/dmfs/rfc5545/recur/ByDayExpander;->addInstance(J)V

    goto/16 :goto_28

    :cond_e5
    add-int/2addr v0, v1

    rem-int/lit8 v9, v1, 0x7

    sub-int/2addr v0, v9

    if-le v0, v1, :cond_ed

    add-int/lit8 v0, v0, -0x7

    :cond_ed
    add-int/lit8 v1, v8, 0x1

    mul-int/lit8 v1, v1, 0x7

    add-int/2addr v0, v1

    if-lez v0, :cond_28

    invoke-virtual {v3, v4, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v0

    invoke-static {v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->packedMonth(I)I

    move-result v1

    invoke-static {v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->dayOfMonth(I)I

    move-result v0

    invoke-static {p1, p2, v1, v0}, Lorg/dmfs/rfc5545/Instance;->setMonthAndDayOfMonth(JII)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/dmfs/rfc5545/recur/ByDayExpander;->addInstance(J)V

    goto/16 :goto_28

    :cond_109
    return-void

    :pswitch_data_10a
    .packed-switch 0x1
        :pswitch_2c
        :pswitch_39
        :pswitch_5c
        :pswitch_9e
    .end packed-switch
.end method
