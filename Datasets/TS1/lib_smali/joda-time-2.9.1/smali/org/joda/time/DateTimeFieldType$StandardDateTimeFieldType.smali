.class Lorg/joda/time/DateTimeFieldType$StandardDateTimeFieldType;
.super Lorg/joda/time/DateTimeFieldType;
.source "DateTimeFieldType.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/joda/time/DateTimeFieldType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StandardDateTimeFieldType"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x909dc78ac7aL


# instance fields
.field private final iOrdinal:B

.field private final transient iRangeType:Lorg/joda/time/DurationFieldType;

.field private final transient iUnitType:Lorg/joda/time/DurationFieldType;


# direct methods
.method constructor <init>(Ljava/lang/String;BLorg/joda/time/DurationFieldType;Lorg/joda/time/DurationFieldType;)V
    .registers 5

    .prologue
    .line 444
    invoke-direct {p0, p1}, Lorg/joda/time/DateTimeFieldType;-><init>(Ljava/lang/String;)V

    .line 445
    iput-byte p2, p0, Lorg/joda/time/DateTimeFieldType$StandardDateTimeFieldType;->iOrdinal:B

    .line 446
    iput-object p3, p0, Lorg/joda/time/DateTimeFieldType$StandardDateTimeFieldType;->iUnitType:Lorg/joda/time/DurationFieldType;

    .line 447
    iput-object p4, p0, Lorg/joda/time/DateTimeFieldType$StandardDateTimeFieldType;->iRangeType:Lorg/joda/time/DurationFieldType;

    .line 448
    return-void
.end method

.method private readResolve()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 541
    iget-byte v0, p0, Lorg/joda/time/DateTimeFieldType$StandardDateTimeFieldType;->iOrdinal:B

    packed-switch v0, :pswitch_data_7a

    .line 590
    :goto_5
    return-object p0

    .line 543
    :pswitch_6
    # getter for: Lorg/joda/time/DateTimeFieldType;->ERA_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$000()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 545
    :pswitch_b
    # getter for: Lorg/joda/time/DateTimeFieldType;->YEAR_OF_ERA_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$100()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 547
    :pswitch_10
    # getter for: Lorg/joda/time/DateTimeFieldType;->CENTURY_OF_ERA_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$200()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 549
    :pswitch_15
    # getter for: Lorg/joda/time/DateTimeFieldType;->YEAR_OF_CENTURY_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$300()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 551
    :pswitch_1a
    # getter for: Lorg/joda/time/DateTimeFieldType;->YEAR_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$400()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 553
    :pswitch_1f
    # getter for: Lorg/joda/time/DateTimeFieldType;->DAY_OF_YEAR_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$500()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 555
    :pswitch_24
    # getter for: Lorg/joda/time/DateTimeFieldType;->MONTH_OF_YEAR_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$600()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 557
    :pswitch_29
    # getter for: Lorg/joda/time/DateTimeFieldType;->DAY_OF_MONTH_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$700()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 559
    :pswitch_2e
    # getter for: Lorg/joda/time/DateTimeFieldType;->WEEKYEAR_OF_CENTURY_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$800()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 561
    :pswitch_33
    # getter for: Lorg/joda/time/DateTimeFieldType;->WEEKYEAR_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$900()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 563
    :pswitch_38
    # getter for: Lorg/joda/time/DateTimeFieldType;->WEEK_OF_WEEKYEAR_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$1000()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 565
    :pswitch_3d
    # getter for: Lorg/joda/time/DateTimeFieldType;->DAY_OF_WEEK_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$1100()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 567
    :pswitch_42
    # getter for: Lorg/joda/time/DateTimeFieldType;->HALFDAY_OF_DAY_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$1200()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 569
    :pswitch_47
    # getter for: Lorg/joda/time/DateTimeFieldType;->HOUR_OF_HALFDAY_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$1300()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 571
    :pswitch_4c
    # getter for: Lorg/joda/time/DateTimeFieldType;->CLOCKHOUR_OF_HALFDAY_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$1400()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 573
    :pswitch_51
    # getter for: Lorg/joda/time/DateTimeFieldType;->CLOCKHOUR_OF_DAY_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$1500()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 575
    :pswitch_56
    # getter for: Lorg/joda/time/DateTimeFieldType;->HOUR_OF_DAY_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$1600()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 577
    :pswitch_5b
    # getter for: Lorg/joda/time/DateTimeFieldType;->MINUTE_OF_DAY_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$1700()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 579
    :pswitch_60
    # getter for: Lorg/joda/time/DateTimeFieldType;->MINUTE_OF_HOUR_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$1800()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 581
    :pswitch_65
    # getter for: Lorg/joda/time/DateTimeFieldType;->SECOND_OF_DAY_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$1900()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 583
    :pswitch_6a
    # getter for: Lorg/joda/time/DateTimeFieldType;->SECOND_OF_MINUTE_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$2000()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 585
    :pswitch_6f
    # getter for: Lorg/joda/time/DateTimeFieldType;->MILLIS_OF_DAY_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$2100()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 587
    :pswitch_74
    # getter for: Lorg/joda/time/DateTimeFieldType;->MILLIS_OF_SECOND_TYPE:Lorg/joda/time/DateTimeFieldType;
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->access$2200()Lorg/joda/time/DateTimeFieldType;

    move-result-object p0

    goto :goto_5

    .line 541
    nop

    :pswitch_data_7a
    .packed-switch 0x1
        :pswitch_6
        :pswitch_b
        :pswitch_10
        :pswitch_15
        :pswitch_1a
        :pswitch_1f
        :pswitch_24
        :pswitch_29
        :pswitch_2e
        :pswitch_33
        :pswitch_38
        :pswitch_3d
        :pswitch_42
        :pswitch_47
        :pswitch_4c
        :pswitch_51
        :pswitch_56
        :pswitch_5b
        :pswitch_60
        :pswitch_65
        :pswitch_6a
        :pswitch_6f
        :pswitch_74
    .end packed-switch
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 463
    if-ne p0, p1, :cond_5

    .line 469
    :cond_4
    :goto_4
    return v0

    .line 466
    :cond_5
    instance-of v2, p1, Lorg/joda/time/DateTimeFieldType$StandardDateTimeFieldType;

    if-eqz v2, :cond_13

    .line 467
    iget-byte v2, p0, Lorg/joda/time/DateTimeFieldType$StandardDateTimeFieldType;->iOrdinal:B

    check-cast p1, Lorg/joda/time/DateTimeFieldType$StandardDateTimeFieldType;

    iget-byte v3, p1, Lorg/joda/time/DateTimeFieldType$StandardDateTimeFieldType;->iOrdinal:B

    if-eq v2, v3, :cond_4

    move v0, v1

    goto :goto_4

    :cond_13
    move v0, v1

    .line 469
    goto :goto_4
.end method

.method public getDurationType()Lorg/joda/time/DurationFieldType;
    .registers 2

    .prologue
    .line 452
    iget-object v0, p0, Lorg/joda/time/DateTimeFieldType$StandardDateTimeFieldType;->iUnitType:Lorg/joda/time/DurationFieldType;

    return-object v0
.end method

.method public getField(Lorg/joda/time/Chronology;)Lorg/joda/time/DateTimeField;
    .registers 4

    .prologue
    .line 480
    invoke-static {p1}, Lorg/joda/time/DateTimeUtils;->getChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v0

    .line 482
    iget-byte v1, p0, Lorg/joda/time/DateTimeFieldType$StandardDateTimeFieldType;->iOrdinal:B

    packed-switch v1, :pswitch_data_82

    .line 531
    new-instance v0, Ljava/lang/InternalError;

    invoke-direct {v0}, Ljava/lang/InternalError;-><init>()V

    throw v0

    .line 484
    :pswitch_f
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->era()Lorg/joda/time/DateTimeField;

    move-result-object v0

    .line 528
    :goto_13
    return-object v0

    .line 486
    :pswitch_14
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->yearOfEra()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 488
    :pswitch_19
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->centuryOfEra()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 490
    :pswitch_1e
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->yearOfCentury()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 492
    :pswitch_23
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->year()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 494
    :pswitch_28
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->dayOfYear()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 496
    :pswitch_2d
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->monthOfYear()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 498
    :pswitch_32
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->dayOfMonth()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 500
    :pswitch_37
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->weekyearOfCentury()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 502
    :pswitch_3c
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->weekyear()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 504
    :pswitch_41
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->weekOfWeekyear()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 506
    :pswitch_46
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->dayOfWeek()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 508
    :pswitch_4b
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->halfdayOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 510
    :pswitch_50
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->hourOfHalfday()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 512
    :pswitch_55
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->clockhourOfHalfday()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 514
    :pswitch_5a
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->clockhourOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 516
    :pswitch_5f
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->hourOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 518
    :pswitch_64
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->minuteOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 520
    :pswitch_69
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->minuteOfHour()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 522
    :pswitch_6e
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->secondOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 524
    :pswitch_73
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->secondOfMinute()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 526
    :pswitch_78
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->millisOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 528
    :pswitch_7d
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->millisOfSecond()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_13

    .line 482
    :pswitch_data_82
    .packed-switch 0x1
        :pswitch_f
        :pswitch_14
        :pswitch_19
        :pswitch_1e
        :pswitch_23
        :pswitch_28
        :pswitch_2d
        :pswitch_32
        :pswitch_37
        :pswitch_3c
        :pswitch_41
        :pswitch_46
        :pswitch_4b
        :pswitch_50
        :pswitch_55
        :pswitch_5a
        :pswitch_5f
        :pswitch_64
        :pswitch_69
        :pswitch_6e
        :pswitch_73
        :pswitch_78
        :pswitch_7d
    .end packed-switch
.end method

.method public getRangeDurationType()Lorg/joda/time/DurationFieldType;
    .registers 2

    .prologue
    .line 457
    iget-object v0, p0, Lorg/joda/time/DateTimeFieldType$StandardDateTimeFieldType;->iRangeType:Lorg/joda/time/DurationFieldType;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 475
    const/4 v0, 0x1

    iget-byte v1, p0, Lorg/joda/time/DateTimeFieldType$StandardDateTimeFieldType;->iOrdinal:B

    shl-int/2addr v0, v1

    return v0
.end method
