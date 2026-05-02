.class final Lorg/dmfs/rfc5545/recur/ByYearDayExpander;
.super Lorg/dmfs/rfc5545/recur/ByExpander;


# instance fields
.field private final mMonths:[I

.field private final mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

.field private final mYearDays:[I


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V
    .registers 8

    invoke-direct {p0, p2, p3, p4, p5}, Lorg/dmfs/rfc5545/recur/ByExpander;-><init>(Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYYEARDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getByPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lorg/dmfs/rfc5545/recur/StaticUtils;->ListToSortedArray(Ljava/util/List;)[I

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mYearDays:[I

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getFreq()Lorg/dmfs/rfc5545/recur/Freq;

    move-result-object v0

    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq;->WEEKLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-eq v0, v1, :cond_1f

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYWEEKNO:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-eqz v0, :cond_49

    :cond_1f
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTH:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-eqz v0, :cond_46

    sget-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->WEEKLY_AND_MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    :goto_29
    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    sget-object v1, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->WEEKLY_AND_MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    if-ne v0, v1, :cond_5f

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTH:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-eqz v0, :cond_5f

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTH:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getByPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lorg/dmfs/rfc5545/recur/StaticUtils;->ListToArray(Ljava/util/List;)[I

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mMonths:[I

    :goto_45
    return-void

    :cond_46
    sget-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->WEEKLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    goto :goto_29

    :cond_49
    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getFreq()Lorg/dmfs/rfc5545/recur/Freq;

    move-result-object v0

    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq;->YEARLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne v0, v1, :cond_5c

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTH:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-nez v0, :cond_5c

    sget-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->YEARLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    goto :goto_29

    :cond_5c
    sget-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    goto :goto_29

    :cond_5f
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mMonths:[I

    goto :goto_45
.end method


# virtual methods
.method expand(JJ)V
    .registers 25

    invoke-static/range {p1 .. p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v9

    invoke-static/range {p1 .. p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v10

    invoke-static/range {p1 .. p2}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v11

    invoke-static/range {p1 .. p2}, Lorg/dmfs/rfc5545/Instance;->hour(J)I

    move-result v5

    invoke-static/range {p1 .. p2}, Lorg/dmfs/rfc5545/Instance;->minute(J)I

    move-result v6

    invoke-static/range {p1 .. p2}, Lorg/dmfs/rfc5545/Instance;->second(J)I

    move-result v7

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v2, v9}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerYear(I)I

    move-result v12

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-static/range {p3 .. p4}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v3

    invoke-static/range {p3 .. p4}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v4

    invoke-static/range {p3 .. p4}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v8

    invoke-virtual {v2, v3, v4, v8}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDayOfYear(III)I

    move-result v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mYearDays:[I

    array-length v15, v14

    const/4 v2, 0x0

    move v8, v2

    :goto_3b
    if-ge v8, v15, :cond_299

    aget v3, v14, v8

    if-gez v3, :cond_2a0

    add-int v2, v3, v12

    add-int/lit8 v2, v2, 0x1

    :goto_45
    sget-object v4, Lorg/dmfs/rfc5545/recur/ByYearDayExpander$1;->$SwitchMap$org$dmfs$rfc5545$recur$ByExpander$Scope:[I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->ordinal()I

    move-result v16

    aget v4, v4, v16

    packed-switch v4, :pswitch_data_2a4

    :cond_56
    :goto_56
    add-int/lit8 v2, v8, 0x1

    move v8, v2

    goto :goto_3b

    :pswitch_5a
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    add-int/lit8 v16, v9, -0x1

    move/from16 v0, v16

    invoke-virtual {v4, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerYear(I)I

    move-result v16

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    add-int/lit8 v17, v9, 0x1

    move/from16 v0, v17

    invoke-virtual {v4, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerYear(I)I

    move-result v17

    if-gez v3, :cond_29d

    add-int v4, v3, v16

    add-int/lit8 v4, v4, 0x1

    add-int v3, v3, v17

    add-int/lit8 v3, v3, 0x1

    :goto_7c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v9, v10, v11}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekOfYear(III)I

    move-result v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v9, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekOfYear(II)I

    move-result v19

    if-lez v2, :cond_bb

    if-gt v2, v12, :cond_bb

    move/from16 v0, v19

    move/from16 v1, v18

    if-ne v0, v1, :cond_bb

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v3, v9, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v2

    int-to-long v3, v9

    invoke-static {v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->packedMonth(I)I

    move-result v16

    invoke-static {v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->dayOfMonth(I)I

    move-result v2

    move/from16 v0, v16

    invoke-static {v3, v4, v0, v2}, Lorg/dmfs/rfc5545/Instance;->setMonthAndDayOfMonth(JII)J

    move-result-wide v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->addInstance(J)V

    goto :goto_56

    :cond_bb
    if-lez v3, :cond_f1

    move/from16 v0, v17

    if-gt v3, v0, :cond_f1

    const/4 v2, 0x7

    if-ge v3, v2, :cond_f1

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    add-int/lit8 v4, v9, 0x1

    invoke-virtual {v2, v4, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekOfYear(II)I

    move-result v2

    move/from16 v0, v18

    if-ne v2, v0, :cond_56

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    add-int/lit8 v4, v9, 0x1

    invoke-virtual {v2, v4, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v4

    add-int/lit8 v2, v9, 0x1

    invoke-static {v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->packedMonth(I)I

    move-result v3

    invoke-static {v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->dayOfMonth(I)I

    move-result v4

    invoke-static/range {v2 .. v7}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->addInstance(J)V

    goto/16 :goto_56

    :cond_f1
    if-lez v4, :cond_56

    move/from16 v0, v16

    if-gt v4, v0, :cond_56

    add-int/lit8 v2, v16, -0x7

    if-le v4, v2, :cond_56

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    add-int/lit8 v3, v9, -0x1

    invoke-virtual {v2, v3, v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekOfYear(II)I

    move-result v2

    move/from16 v0, v18

    if-ne v2, v0, :cond_56

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    add-int/lit8 v3, v9, -0x1

    invoke-virtual {v2, v3, v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v4

    add-int/lit8 v2, v9, -0x1

    invoke-static {v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->packedMonth(I)I

    move-result v3

    invoke-static {v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->dayOfMonth(I)I

    move-result v4

    invoke-static/range {v2 .. v7}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->addInstance(J)V

    goto/16 :goto_56

    :pswitch_128
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    add-int/lit8 v16, v9, -0x1

    move/from16 v0, v16

    invoke-virtual {v4, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerYear(I)I

    move-result v16

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    add-int/lit8 v17, v9, 0x1

    move/from16 v0, v17

    invoke-virtual {v4, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerYear(I)I

    move-result v17

    if-gez v3, :cond_29a

    add-int v4, v3, v16

    add-int/lit8 v4, v4, 0x1

    add-int v3, v3, v17

    add-int/lit8 v3, v3, 0x1

    :goto_14a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v9, v10, v11}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekOfYear(III)I

    move-result v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v9, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekOfYear(II)I

    move-result v19

    if-lez v2, :cond_1a4

    if-gt v2, v12, :cond_1a4

    move/from16 v0, v19

    move/from16 v1, v18

    if-ne v0, v1, :cond_1a4

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v3, v9, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v2

    invoke-static {v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->packedMonth(I)I

    move-result v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mMonths:[I

    if-eqz v4, :cond_188

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mMonths:[I

    invoke-static {v4, v3}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v4

    if-gez v4, :cond_190

    :cond_188
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mMonths:[I

    if-nez v4, :cond_56

    if-ne v3, v10, :cond_56

    :cond_190
    int-to-long v0, v9

    move-wide/from16 v16, v0

    invoke-static {v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->dayOfMonth(I)I

    move-result v2

    move-wide/from16 v0, v16

    invoke-static {v0, v1, v3, v2}, Lorg/dmfs/rfc5545/Instance;->setMonthAndDayOfMonth(JII)J

    move-result-wide v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->addInstance(J)V

    goto/16 :goto_56

    :cond_1a4
    if-lez v3, :cond_1f4

    move/from16 v0, v17

    if-gt v3, v0, :cond_1f4

    const/4 v2, 0x7

    if-ge v3, v2, :cond_1f4

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    add-int/lit8 v4, v9, 0x1

    invoke-virtual {v2, v4, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekOfYear(II)I

    move-result v2

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    add-int/lit8 v16, v9, 0x1

    move/from16 v0, v16

    invoke-virtual {v4, v0, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v4

    invoke-static {v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->packedMonth(I)I

    move-result v3

    move/from16 v0, v18

    if-ne v2, v0, :cond_1db

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mMonths:[I

    if-eqz v2, :cond_1db

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mMonths:[I

    invoke-static {v2, v3}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v2

    if-gez v2, :cond_1e3

    :cond_1db
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mMonths:[I

    if-nez v2, :cond_56

    if-ne v3, v10, :cond_56

    :cond_1e3
    add-int/lit8 v2, v9, 0x1

    invoke-static {v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->dayOfMonth(I)I

    move-result v4

    invoke-static/range {v2 .. v7}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->addInstance(J)V

    goto/16 :goto_56

    :cond_1f4
    if-lez v4, :cond_56

    move/from16 v0, v16

    if-gt v4, v0, :cond_56

    add-int/lit8 v2, v16, -0x7

    if-le v4, v2, :cond_56

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    add-int/lit8 v3, v9, -0x1

    invoke-virtual {v2, v3, v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekOfYear(II)I

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    add-int/lit8 v16, v9, -0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0, v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v4

    invoke-static {v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->packedMonth(I)I

    move-result v3

    move/from16 v0, v18

    if-ne v2, v0, :cond_22c

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mMonths:[I

    if-eqz v2, :cond_22c

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mMonths:[I

    invoke-static {v2, v3}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v2

    if-gez v2, :cond_234

    :cond_22c
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mMonths:[I

    if-nez v2, :cond_56

    if-ne v3, v10, :cond_56

    :cond_234
    add-int/lit8 v2, v9, -0x1

    invoke-static {v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->dayOfMonth(I)I

    move-result v4

    invoke-static/range {v2 .. v7}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->addInstance(J)V

    goto/16 :goto_56

    :pswitch_245
    if-lez v2, :cond_56

    if-gt v2, v12, :cond_56

    if-ge v2, v13, :cond_251

    invoke-static/range {p3 .. p4}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v3

    if-eq v9, v3, :cond_56

    :cond_251
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v3, v9, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v2

    invoke-static {v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->packedMonth(I)I

    move-result v3

    if-ne v3, v10, :cond_56

    invoke-static {v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->dayOfMonth(I)I

    move-result v2

    move-wide/from16 v0, p1

    invoke-static {v0, v1, v3, v2}, Lorg/dmfs/rfc5545/Instance;->setMonthAndDayOfMonth(JII)J

    move-result-wide v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->addInstance(J)V

    goto/16 :goto_56

    :pswitch_270
    if-lez v2, :cond_56

    if-gt v2, v12, :cond_56

    if-ge v2, v13, :cond_27c

    invoke-static/range {p3 .. p4}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v3

    if-eq v9, v3, :cond_56

    :cond_27c
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v3, v9, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthAndDayOfYearDay(II)I

    move-result v2

    invoke-static {v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->packedMonth(I)I

    move-result v3

    invoke-static {v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->dayOfMonth(I)I

    move-result v2

    move-wide/from16 v0, p1

    invoke-static {v0, v1, v3, v2}, Lorg/dmfs/rfc5545/Instance;->setMonthAndDayOfMonth(JII)J

    move-result-wide v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/dmfs/rfc5545/recur/ByYearDayExpander;->addInstance(J)V

    goto/16 :goto_56

    :cond_299
    return-void

    :cond_29a
    move v4, v3

    goto/16 :goto_14a

    :cond_29d
    move v4, v3

    goto/16 :goto_7c

    :cond_2a0
    move v2, v3

    goto/16 :goto_45

    nop

    :pswitch_data_2a4
    .packed-switch 0x1
        :pswitch_5a
        :pswitch_128
        :pswitch_245
        :pswitch_270
    .end packed-switch
.end method
