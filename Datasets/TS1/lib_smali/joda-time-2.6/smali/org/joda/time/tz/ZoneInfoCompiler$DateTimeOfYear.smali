.class Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;
.super Ljava/lang/Object;
.source "ZoneInfoCompiler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/joda/time/tz/ZoneInfoCompiler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DateTimeOfYear"
.end annotation


# instance fields
.field public final iAdvanceDayOfWeek:Z

.field public final iDayOfMonth:I

.field public final iDayOfWeek:I

.field public final iMillisOfDay:I

.field public final iMonthOfYear:I

.field public final iZoneChar:C


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 530
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 531
    iput v1, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iMonthOfYear:I

    .line 532
    iput v1, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iDayOfMonth:I

    .line 533
    iput v0, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iDayOfWeek:I

    .line 534
    iput-boolean v0, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iAdvanceDayOfWeek:Z

    .line 535
    iput v0, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iMillisOfDay:I

    .line 536
    const/16 v0, 0x77

    iput-char v0, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iZoneChar:C

    .line 537
    return-void
.end method

.method constructor <init>(Ljava/util/StringTokenizer;)V
    .registers 14

    .prologue
    const/16 v10, 0x7d1

    const/4 v5, -0x1

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 539
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 545
    const/16 v6, 0x77

    .line 547
    invoke-virtual {p1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v0

    if-eqz v0, :cond_f7

    .line 548
    invoke-virtual {p1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/joda/time/tz/ZoneInfoCompiler;->parseMonth(Ljava/lang/String;)I

    move-result v7

    .line 550
    invoke-virtual {p1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v0

    if-eqz v0, :cond_f1

    .line 551
    invoke-virtual {p1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v0

    .line 552
    const-string v3, "last"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8a

    .line 554
    const/4 v3, 0x4

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/joda/time/tz/ZoneInfoCompiler;->parseDayOfWeek(Ljava/lang/String;)I

    move-result v0

    move v3, v0

    move v4, v5

    move v0, v1

    .line 580
    :goto_36
    invoke-virtual {p1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v8

    if-eqz v8, :cond_ec

    .line 581
    invoke-virtual {p1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v8

    .line 582
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v8, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lorg/joda/time/tz/ZoneInfoCompiler;->parseZoneChar(C)C

    move-result v6

    .line 583
    const-string v9, "24:00"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e3

    .line 584
    if-ne v4, v5, :cond_d6

    new-instance v0, Lorg/joda/time/LocalDate;

    invoke-direct {v0, v10, v7, v2}, Lorg/joda/time/LocalDate;-><init>(III)V

    invoke-virtual {v0, v2}, Lorg/joda/time/LocalDate;->plusMonths(I)Lorg/joda/time/LocalDate;

    move-result-object v0

    move-object v7, v0

    .line 587
    :goto_62
    if-eq v4, v5, :cond_e1

    if-eqz v3, :cond_e1

    .line 588
    :goto_66
    invoke-virtual {v7}, Lorg/joda/time/LocalDate;->getMonthOfYear()I

    move-result v0

    .line 589
    invoke-virtual {v7}, Lorg/joda/time/LocalDate;->getDayOfMonth()I

    move-result v4

    .line 590
    if-eqz v3, :cond_78

    .line 591
    add-int/lit8 v3, v3, -0x1

    add-int/lit8 v3, v3, 0x1

    rem-int/lit8 v3, v3, 0x7

    add-int/lit8 v3, v3, 0x1

    :cond_78
    move v5, v0

    move v0, v6

    move v11, v1

    move v1, v2

    move v2, v11

    .line 600
    :goto_7d
    iput v5, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iMonthOfYear:I

    .line 601
    iput v4, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iDayOfMonth:I

    .line 602
    iput v3, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iDayOfWeek:I

    .line 603
    iput-boolean v1, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iAdvanceDayOfWeek:Z

    .line 604
    iput v2, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iMillisOfDay:I

    .line 605
    iput-char v0, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iZoneChar:C

    .line 606
    return-void

    .line 558
    :cond_8a
    :try_start_8a
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_8d
    .catch Ljava/lang/NumberFormatException; {:try_start_8a .. :try_end_8d} :catch_92

    move-result v0

    move v3, v1

    move v4, v0

    move v0, v1

    .line 577
    goto :goto_36

    .line 561
    :catch_92
    move-exception v3

    .line 562
    const-string v3, ">="

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 563
    if-lez v4, :cond_b1

    .line 564
    add-int/lit8 v3, v4, 0x2

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 565
    invoke-virtual {v0, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/joda/time/tz/ZoneInfoCompiler;->parseDayOfWeek(Ljava/lang/String;)I

    move-result v0

    move v4, v3

    move v3, v0

    move v0, v2

    .line 566
    goto :goto_36

    .line 568
    :cond_b1
    const-string v3, "<="

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 569
    if-lez v4, :cond_d0

    .line 570
    add-int/lit8 v3, v4, 0x2

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 571
    invoke-virtual {v0, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/joda/time/tz/ZoneInfoCompiler;->parseDayOfWeek(Ljava/lang/String;)I

    move-result v0

    move v4, v3

    move v3, v0

    move v0, v1

    .line 572
    goto/16 :goto_36

    .line 574
    :cond_d0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 584
    :cond_d6
    new-instance v0, Lorg/joda/time/LocalDate;

    invoke-direct {v0, v10, v7, v4}, Lorg/joda/time/LocalDate;-><init>(III)V

    invoke-virtual {v0, v2}, Lorg/joda/time/LocalDate;->plusDays(I)Lorg/joda/time/LocalDate;

    move-result-object v0

    move-object v7, v0

    goto :goto_62

    :cond_e1
    move v2, v1

    .line 587
    goto :goto_66

    .line 594
    :cond_e3
    invoke-static {v8}, Lorg/joda/time/tz/ZoneInfoCompiler;->parseTime(Ljava/lang/String;)I

    move-result v1

    move v2, v1

    move v5, v7

    move v1, v0

    move v0, v6

    goto :goto_7d

    :cond_ec
    move v2, v1

    move v5, v7

    move v1, v0

    move v0, v6

    goto :goto_7d

    :cond_f1
    move v0, v6

    move v3, v1

    move v4, v2

    move v5, v7

    move v2, v1

    goto :goto_7d

    :cond_f7
    move v0, v6

    move v3, v1

    move v4, v2

    move v5, v2

    move v2, v1

    goto :goto_7d
.end method


# virtual methods
.method public addCutover(Lorg/joda/time/tz/DateTimeZoneBuilder;I)V
    .registers 11

    .prologue
    .line 628
    iget-char v2, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iZoneChar:C

    iget v3, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iMonthOfYear:I

    iget v4, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iDayOfMonth:I

    iget v5, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iDayOfWeek:I

    iget-boolean v6, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iAdvanceDayOfWeek:Z

    iget v7, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iMillisOfDay:I

    move-object v0, p1

    move v1, p2

    invoke-virtual/range {v0 .. v7}, Lorg/joda/time/tz/DateTimeZoneBuilder;->addCutover(ICIIIZI)Lorg/joda/time/tz/DateTimeZoneBuilder;

    .line 635
    return-void
.end method

.method public addRecurring(Lorg/joda/time/tz/DateTimeZoneBuilder;Ljava/lang/String;III)V
    .registers 17

    .prologue
    .line 614
    iget-char v5, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iZoneChar:C

    iget v6, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iMonthOfYear:I

    iget v7, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iDayOfMonth:I

    iget v8, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iDayOfWeek:I

    iget-boolean v9, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iAdvanceDayOfWeek:Z

    iget v10, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iMillisOfDay:I

    move-object v0, p1

    move-object v1, p2

    move v2, p3

    move v3, p4

    move/from16 v4, p5

    invoke-virtual/range {v0 .. v10}, Lorg/joda/time/tz/DateTimeZoneBuilder;->addRecurringSavings(Ljava/lang/String;IIICIIIZI)Lorg/joda/time/tz/DateTimeZoneBuilder;

    .line 622
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 638
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MonthOfYear: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iMonthOfYear:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "DayOfMonth: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iDayOfMonth:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "DayOfWeek: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iDayOfWeek:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "AdvanceDayOfWeek: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iAdvanceDayOfWeek:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "MillisOfDay: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iMillisOfDay:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "ZoneChar: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-char v1, p0, Lorg/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear;->iZoneChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
