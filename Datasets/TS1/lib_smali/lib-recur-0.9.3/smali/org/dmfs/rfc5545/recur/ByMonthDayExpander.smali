.class final Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;
.super Lorg/dmfs/rfc5545/recur/ByExpander;


# instance fields
.field private final mMonthDays:[I

.field private final mMonths:[I

.field private final mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V
    .registers 8

    invoke-direct {p0, p2, p3, p4, p5}, Lorg/dmfs/rfc5545/recur/ByExpander;-><init>(Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTHDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getByPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lorg/dmfs/rfc5545/recur/StaticUtils;->ListToSortedArray(Ljava/util/List;)[I

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->mMonthDays:[I

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYWEEKNO:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-nez v0, :cond_1f

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getFreq()Lorg/dmfs/rfc5545/recur/Freq;

    move-result-object v0

    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq;->WEEKLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne v0, v1, :cond_51

    :cond_1f
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTH:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-nez v0, :cond_2f

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getFreq()Lorg/dmfs/rfc5545/recur/Freq;

    move-result-object v0

    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq;->MONTHLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne v0, v1, :cond_4e

    :cond_2f
    sget-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->WEEKLY_AND_MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    :goto_31
    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    sget-object v1, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->WEEKLY_AND_MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    if-ne v0, v1, :cond_54

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTH:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-eqz v0, :cond_54

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTH:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getByPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lorg/dmfs/rfc5545/recur/StaticUtils;->ListToArray(Ljava/util/List;)[I

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->mMonths:[I

    :goto_4d
    return-void

    :cond_4e
    sget-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->WEEKLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    goto :goto_31

    :cond_51
    sget-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    goto :goto_31

    :cond_54
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->mMonths:[I

    goto :goto_4d
.end method


# virtual methods
.method expand(JJ)V
    .registers 27

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    move-object/from16 v18, v0

    invoke-static/range {p1 .. p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v2

    invoke-static/range {p1 .. p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v3

    invoke-static/range {p3 .. p4}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v4

    invoke-static/range {p3 .. p4}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v5

    if-lt v2, v4, :cond_1c

    if-ne v2, v4, :cond_1d

    if-ge v3, v5, :cond_1d

    :cond_1c
    return-void

    :cond_1d
    invoke-static/range {p1 .. p2}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v10

    const/4 v9, 0x0

    invoke-static/range {p1 .. p2}, Lorg/dmfs/rfc5545/Instance;->hour(J)I

    move-result v5

    invoke-static/range {p1 .. p2}, Lorg/dmfs/rfc5545/Instance;->minute(J)I

    move-result v6

    invoke-static/range {p1 .. p2}, Lorg/dmfs/rfc5545/Instance;->second(J)I

    move-result v7

    const/4 v8, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    sget-object v12, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->WEEKLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    if-eq v11, v12, :cond_40

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    sget-object v12, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->WEEKLY_AND_MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    if-ne v11, v12, :cond_2e2

    :cond_40
    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v3, v10}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekOfYear(III)I

    move-result v9

    if-nez v3, :cond_bf

    add-int/lit8 v4, v2, -0x1

    add-int/lit8 v8, v2, -0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthsPerYear(I)I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v8}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerPackedMonth(II)I

    move-result v4

    :goto_5a
    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthsPerYear(I)I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    if-ne v3, v8, :cond_c8

    add-int/lit8 v8, v2, 0x1

    const/4 v10, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v0, v8, v10}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerPackedMonth(II)I

    move-result v8

    move v14, v8

    move v15, v4

    move/from16 v16, v9

    :goto_71
    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerPackedMonth(II)I

    move-result v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->mMonthDays:[I

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v21, v0

    const/4 v4, 0x0

    move/from16 v17, v4

    :goto_85
    move/from16 v0, v17

    move/from16 v1, v21

    if-ge v0, v1, :cond_1c

    aget v8, v20, v17

    if-gez v8, :cond_2df

    add-int v4, v8, v19

    add-int/lit8 v4, v4, 0x1

    :goto_93
    sget-object v9, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander$1;->$SwitchMap$org$dmfs$rfc5545$recur$ByExpander$Scope:[I

    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    invoke-virtual {v10}, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->ordinal()I

    move-result v10

    aget v9, v9, v10

    packed-switch v9, :pswitch_data_2e8

    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "invalid scope for ByMonthDayExpander: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->mScope:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_bf
    add-int/lit8 v4, v3, -0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerPackedMonth(II)I

    move-result v4

    goto :goto_5a

    :cond_c8
    add-int/lit8 v8, v3, 0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v8}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDaysPerPackedMonth(II)I

    move-result v8

    move v14, v8

    move v15, v4

    move/from16 v16, v9

    goto :goto_71

    :pswitch_d5
    if-gez v8, :cond_2db

    add-int v9, v8, v15

    add-int/lit8 v9, v9, 0x1

    add-int/2addr v8, v14

    add-int/lit8 v10, v8, 0x1

    move v11, v9

    :goto_df
    if-lez v4, :cond_fd

    move/from16 v0, v19

    if-gt v4, v0, :cond_fd

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v3, v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekOfYear(III)I

    move-result v8

    move/from16 v0, v16

    if-ne v8, v0, :cond_fd

    invoke-static/range {v2 .. v7}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v9}, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->addInstance(J)V

    :cond_f8
    :goto_f8
    add-int/lit8 v4, v17, 0x1

    move/from16 v17, v4

    goto :goto_85

    :cond_fd
    if-lez v10, :cond_147

    if-gt v10, v14, :cond_147

    const/4 v4, 0x7

    if-ge v10, v4, :cond_147

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthsPerYear(I)I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ge v3, v4, :cond_12a

    add-int/lit8 v4, v3, 0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v4, v10}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekOfYear(III)I

    move-result v4

    move/from16 v0, v16

    if-ne v4, v0, :cond_f8

    add-int/lit8 v9, v3, 0x1

    move v8, v2

    move v11, v5

    move v12, v6

    move v13, v7

    invoke-static/range {v8 .. v13}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v9}, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->addInstance(J)V

    goto :goto_f8

    :cond_12a
    add-int/lit8 v4, v2, 0x1

    const/4 v8, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v8, v10}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekOfYear(III)I

    move-result v4

    move/from16 v0, v16

    if-ne v4, v0, :cond_f8

    add-int/lit8 v8, v2, 0x1

    const/4 v9, 0x0

    move v11, v5

    move v12, v6

    move v13, v7

    invoke-static/range {v8 .. v13}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v9}, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->addInstance(J)V

    goto :goto_f8

    :cond_147
    if-lez v11, :cond_f8

    if-gt v11, v15, :cond_f8

    add-int/lit8 v4, v15, -0x7

    if-le v11, v4, :cond_f8

    if-lez v3, :cond_16e

    add-int/lit8 v4, v3, -0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v4, v11}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekOfYear(III)I

    move-result v4

    move/from16 v0, v16

    if-ne v4, v0, :cond_f8

    add-int/lit8 v9, v3, -0x1

    move v8, v2

    move v10, v11

    move v11, v5

    move v12, v6

    move v13, v7

    invoke-static/range {v8 .. v13}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v9}, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->addInstance(J)V

    goto :goto_f8

    :cond_16e
    add-int/lit8 v4, v2, -0x1

    add-int/lit8 v8, v2, -0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthsPerYear(I)I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v8, v11}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekOfYear(III)I

    move-result v4

    move/from16 v0, v16

    if-ne v4, v0, :cond_f8

    add-int/lit8 v8, v2, -0x1

    add-int/lit8 v4, v2, -0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthsPerYear(I)I

    move-result v4

    add-int/lit8 v9, v4, -0x1

    move v10, v11

    move v11, v5

    move v12, v6

    move v13, v7

    invoke-static/range {v8 .. v13}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v9}, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->addInstance(J)V

    goto/16 :goto_f8

    :pswitch_19f
    if-gez v8, :cond_2d7

    add-int v9, v8, v15

    add-int/lit8 v9, v9, 0x1

    add-int/2addr v8, v14

    add-int/lit8 v10, v8, 0x1

    move v11, v9

    :goto_1a9
    if-lez v4, :cond_1d4

    move/from16 v0, v19

    if-gt v4, v0, :cond_1d4

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v3, v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekOfYear(III)I

    move-result v8

    move/from16 v0, v16

    if-ne v8, v0, :cond_1d4

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->mMonths:[I

    if-eqz v8, :cond_1c9

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->mMonths:[I

    invoke-static {v8, v3}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v8

    if-ltz v8, :cond_f8

    :cond_1c9
    invoke-static/range {v2 .. v7}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v9}, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->addInstance(J)V

    goto/16 :goto_f8

    :cond_1d4
    if-lez v10, :cond_243

    if-gt v10, v14, :cond_243

    const/4 v4, 0x7

    if-ge v10, v4, :cond_243

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthsPerYear(I)I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ge v3, v4, :cond_214

    add-int/lit8 v4, v3, 0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v4, v10}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekOfYear(III)I

    move-result v4

    move/from16 v0, v16

    if-ne v4, v0, :cond_f8

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->mMonths:[I

    if-eqz v4, :cond_f8

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->mMonths:[I

    add-int/lit8 v8, v3, 0x1

    invoke-static {v4, v8}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v4

    if-ltz v4, :cond_f8

    add-int/lit8 v9, v3, 0x1

    move v8, v2

    move v11, v5

    move v12, v6

    move v13, v7

    invoke-static/range {v8 .. v13}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v9}, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->addInstance(J)V

    goto/16 :goto_f8

    :cond_214
    add-int/lit8 v4, v2, 0x1

    const/4 v8, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v8, v10}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekOfYear(III)I

    move-result v4

    move/from16 v0, v16

    if-ne v4, v0, :cond_f8

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->mMonths:[I

    if-eqz v4, :cond_f8

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->mMonths:[I

    const/4 v8, 0x0

    invoke-static {v4, v8}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v4

    if-ltz v4, :cond_f8

    add-int/lit8 v8, v2, 0x1

    const/4 v9, 0x0

    move v11, v5

    move v12, v6

    move v13, v7

    invoke-static/range {v8 .. v13}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v9}, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->addInstance(J)V

    goto/16 :goto_f8

    :cond_243
    if-lez v11, :cond_f8

    if-gt v11, v15, :cond_f8

    add-int/lit8 v4, v15, -0x7

    if-le v11, v4, :cond_f8

    if-lez v3, :cond_27d

    add-int/lit8 v4, v3, -0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v4, v11}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekOfYear(III)I

    move-result v4

    move/from16 v0, v16

    if-ne v4, v0, :cond_f8

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->mMonths:[I

    if-eqz v4, :cond_f8

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->mMonths:[I

    add-int/lit8 v8, v3, -0x1

    invoke-static {v4, v8}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v4

    if-ltz v4, :cond_f8

    add-int/lit8 v9, v3, -0x1

    move v8, v2

    move v10, v11

    move v11, v5

    move v12, v6

    move v13, v7

    invoke-static/range {v8 .. v13}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v9}, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->addInstance(J)V

    goto/16 :goto_f8

    :cond_27d
    add-int/lit8 v4, v2, -0x1

    add-int/lit8 v8, v2, -0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthsPerYear(I)I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v8, v11}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekOfYear(III)I

    move-result v4

    move/from16 v0, v16

    if-ne v4, v0, :cond_f8

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->mMonths:[I

    if-eqz v4, :cond_f8

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->mMonths:[I

    add-int/lit8 v8, v2, -0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthsPerYear(I)I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-static {v4, v8}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([II)I

    move-result v4

    if-ltz v4, :cond_f8

    add-int/lit8 v8, v2, -0x1

    add-int/lit8 v4, v2, -0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getMonthsPerYear(I)I

    move-result v4

    add-int/lit8 v9, v4, -0x1

    move v10, v11

    move v11, v5

    move v12, v6

    move v13, v7

    invoke-static/range {v8 .. v13}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v9}, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->addInstance(J)V

    goto/16 :goto_f8

    :pswitch_2c8
    if-lez v4, :cond_f8

    move-wide/from16 v0, p1

    invoke-static {v0, v1, v4}, Lorg/dmfs/rfc5545/Instance;->setDayOfMonth(JI)J

    move-result-wide v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v9}, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;->addInstance(J)V

    goto/16 :goto_f8

    :cond_2d7
    move v10, v8

    move v11, v8

    goto/16 :goto_1a9

    :cond_2db
    move v10, v8

    move v11, v8

    goto/16 :goto_df

    :cond_2df
    move v4, v8

    goto/16 :goto_93

    :cond_2e2
    move v14, v4

    move v15, v8

    move/from16 v16, v9

    goto/16 :goto_71

    :pswitch_data_2e8
    .packed-switch 0x1
        :pswitch_d5
        :pswitch_19f
        :pswitch_2c8
    .end packed-switch
.end method
