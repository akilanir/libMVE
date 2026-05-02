.class final Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;
.super Lorg/dmfs/rfc5545/recur/ByExpander;


# instance fields
.field private final mAllowOverlappingWeeks:Z

.field private final mByWeekNo:[I

.field private final mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V
    .registers 8

    invoke-direct {p0, p2, p3, p4, p5}, Lorg/dmfs/rfc5545/recur/ByExpander;-><init>(Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYWEEKNO:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getByPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lorg/dmfs/rfc5545/recur/StaticUtils;->ListToSortedArray(Ljava/util/List;)[I

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mByWeekNo:[I

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTH:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-eqz v0, :cond_3d

    sget-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    :goto_19
    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    sget-object v1, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    if-ne v0, v1, :cond_40

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-nez v0, :cond_39

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTHDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-nez v0, :cond_39

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYYEARDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-eqz v0, :cond_40

    :cond_39
    const/4 v0, 0x1

    :goto_3a
    iput-boolean v0, p0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mAllowOverlappingWeeks:Z

    return-void

    :cond_3d
    sget-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->YEARLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    goto :goto_19

    :cond_40
    const/4 v0, 0x0

    goto :goto_3a
.end method


# virtual methods
.method expand(JJ)V
    .registers 22

    invoke-static/range {p1 .. p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v3

    invoke-static/range {p1 .. p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v9

    invoke-static/range {p1 .. p2}, Lorg/dmfs/rfc5545/Instance;->hour(J)I

    move-result v5

    invoke-static/range {p1 .. p2}, Lorg/dmfs/rfc5545/Instance;->minute(J)I

    move-result v6

    invoke-static/range {p1 .. p2}, Lorg/dmfs/rfc5545/Instance;->second(J)I

    move-result v7

    invoke-static/range {p1 .. p2}, Lorg/dmfs/rfc5545/Instance;->dayOfWeek(J)I

    move-result v10

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v2, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeeksPerYear(I)I

    move-result v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mByWeekNo:[I

    array-length v13, v12

    const/4 v2, 0x0

    move v8, v2

    move v2, v3

    :goto_28
    if-ge v8, v13, :cond_175

    aget v3, v12, v8

    if-gez v3, :cond_17c

    add-int/2addr v3, v11

    add-int/lit8 v3, v3, 0x1

    move v4, v3

    :goto_32
    if-lez v4, :cond_36

    if-le v4, v11, :cond_3a

    :cond_36
    :goto_36
    add-int/lit8 v3, v8, 0x1

    move v8, v3

    goto :goto_28

    :cond_3a
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    sget-object v14, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    if-ne v3, v14, :cond_e9

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mAllowOverlappingWeeks:Z

    if-eqz v3, :cond_e9

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v3, v2, v4, v10}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getYearDayOfIsoYear(III)I

    move-result v3

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v14, v2, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v14

    invoke-static {v14}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->packedMonth(I)I

    move-result v3

    if-ne v3, v9, :cond_6c

    invoke-static {v14}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->dayOfMonth(I)I

    move-result v4

    invoke-static/range {v2 .. v7}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4}, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->addInstance(J)V

    goto :goto_36

    :cond_6c
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget v3, v3, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->weekStartInt:I

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v14, v2, v4, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getYearDayOfIsoYear(III)I

    move-result v14

    const/4 v15, 0x1

    if-lt v14, v15, :cond_36

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v15, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerYear(I)I

    move-result v15

    if-gt v14, v15, :cond_36

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v15, v2, v14}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v14

    invoke-static {v14}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->packedMonth(I)I

    move-result v15

    if-ne v15, v9, :cond_ab

    sub-int v3, v10, v3

    add-int/lit8 v3, v3, 0x7

    rem-int/lit8 v3, v3, 0x7

    invoke-static {v14}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->dayOfMonth(I)I

    move-result v4

    add-int/2addr v4, v3

    move v3, v9

    invoke-static/range {v2 .. v7}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4}, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->addInstance(J)V

    goto :goto_36

    :cond_ab
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    add-int/lit8 v15, v3, 0x6

    rem-int/lit8 v15, v15, 0x7

    invoke-virtual {v14, v2, v4, v15}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getYearDayOfIsoYear(III)I

    move-result v4

    const/4 v14, 0x1

    if-lt v4, v14, :cond_36

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v14, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerYear(I)I

    move-result v14

    if-gt v4, v14, :cond_36

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v14, v2, v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v4

    invoke-static {v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->packedMonth(I)I

    move-result v14

    if-ne v14, v9, :cond_36

    sub-int v3, v10, v3

    add-int/lit8 v3, v3, -0x6

    rem-int/lit8 v3, v3, 0x7

    invoke-static {v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->dayOfMonth(I)I

    move-result v4

    add-int/2addr v4, v3

    move v3, v9

    invoke-static/range {v2 .. v7}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4}, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->addInstance(J)V

    goto/16 :goto_36

    :cond_e9
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    sget-object v14, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    if-ne v3, v14, :cond_125

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v3, v2, v4, v10}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getYearDayOfIsoYear(III)I

    move-result v3

    const/4 v4, 0x1

    if-lt v3, v4, :cond_36

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v4, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerYear(I)I

    move-result v4

    if-gt v3, v4, :cond_36

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v4, v2, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v3

    invoke-static {v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->packedMonth(I)I

    move-result v4

    if-ne v4, v9, :cond_36

    invoke-static {v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->dayOfMonth(I)I

    move-result v3

    move-wide/from16 v0, p1

    invoke-static {v0, v1, v4, v3}, Lorg/dmfs/rfc5545/Instance;->setMonthAndDayOfMonth(JII)J

    move-result-wide v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4}, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->addInstance(J)V

    goto/16 :goto_36

    :cond_125
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v3, v2, v4, v10}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getYearDayOfIsoYear(III)I

    move-result v3

    const/4 v4, 0x1

    if-ge v3, v4, :cond_15a

    add-int/lit8 v4, v2, -0x1

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v2, v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerYear(I)I

    move-result v2

    add-int/2addr v2, v3

    move v3, v4

    :goto_13c
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v4, v3, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v2

    invoke-static {v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->packedMonth(I)I

    move-result v4

    invoke-static {v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->dayOfMonth(I)I

    move-result v2

    move-wide/from16 v0, p1

    invoke-static {v0, v1, v4, v2}, Lorg/dmfs/rfc5545/Instance;->setMonthAndDayOfMonth(JII)J

    move-result-wide v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->addInstance(J)V

    move v2, v3

    goto/16 :goto_36

    :cond_15a
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v4, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerYear(I)I

    move-result v4

    if-le v3, v4, :cond_176

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByWeekNoExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v4, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerYear(I)I

    move-result v4

    sub-int/2addr v3, v4

    add-int/lit8 v2, v2, 0x1

    move/from16 v16, v3

    move v3, v2

    move/from16 v2, v16

    goto :goto_13c

    :cond_175
    return-void

    :cond_176
    move/from16 v16, v3

    move v3, v2

    move/from16 v2, v16

    goto :goto_13c

    :cond_17c
    move v4, v3

    goto/16 :goto_32
.end method
