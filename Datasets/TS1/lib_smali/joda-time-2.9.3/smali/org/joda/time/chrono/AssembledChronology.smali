.class public abstract Lorg/joda/time/chrono/AssembledChronology;
.super Lorg/joda/time/chrono/BaseChronology;
.source "AssembledChronology.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/joda/time/chrono/AssembledChronology$Fields;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x5d6050265d484707L


# instance fields
.field private final iBase:Lorg/joda/time/Chronology;

.field private transient iBaseFlags:I

.field private transient iCenturies:Lorg/joda/time/DurationField;

.field private transient iCenturyOfEra:Lorg/joda/time/DateTimeField;

.field private transient iClockhourOfDay:Lorg/joda/time/DateTimeField;

.field private transient iClockhourOfHalfday:Lorg/joda/time/DateTimeField;

.field private transient iDayOfMonth:Lorg/joda/time/DateTimeField;

.field private transient iDayOfWeek:Lorg/joda/time/DateTimeField;

.field private transient iDayOfYear:Lorg/joda/time/DateTimeField;

.field private transient iDays:Lorg/joda/time/DurationField;

.field private transient iEra:Lorg/joda/time/DateTimeField;

.field private transient iEras:Lorg/joda/time/DurationField;

.field private transient iHalfdayOfDay:Lorg/joda/time/DateTimeField;

.field private transient iHalfdays:Lorg/joda/time/DurationField;

.field private transient iHourOfDay:Lorg/joda/time/DateTimeField;

.field private transient iHourOfHalfday:Lorg/joda/time/DateTimeField;

.field private transient iHours:Lorg/joda/time/DurationField;

.field private transient iMillis:Lorg/joda/time/DurationField;

.field private transient iMillisOfDay:Lorg/joda/time/DateTimeField;

.field private transient iMillisOfSecond:Lorg/joda/time/DateTimeField;

.field private transient iMinuteOfDay:Lorg/joda/time/DateTimeField;

.field private transient iMinuteOfHour:Lorg/joda/time/DateTimeField;

.field private transient iMinutes:Lorg/joda/time/DurationField;

.field private transient iMonthOfYear:Lorg/joda/time/DateTimeField;

.field private transient iMonths:Lorg/joda/time/DurationField;

.field private final iParam:Ljava/lang/Object;

.field private transient iSecondOfDay:Lorg/joda/time/DateTimeField;

.field private transient iSecondOfMinute:Lorg/joda/time/DateTimeField;

.field private transient iSeconds:Lorg/joda/time/DurationField;

.field private transient iWeekOfWeekyear:Lorg/joda/time/DateTimeField;

.field private transient iWeeks:Lorg/joda/time/DurationField;

.field private transient iWeekyear:Lorg/joda/time/DateTimeField;

.field private transient iWeekyearOfCentury:Lorg/joda/time/DateTimeField;

.field private transient iWeekyears:Lorg/joda/time/DurationField;

.field private transient iYear:Lorg/joda/time/DateTimeField;

.field private transient iYearOfCentury:Lorg/joda/time/DateTimeField;

.field private transient iYearOfEra:Lorg/joda/time/DateTimeField;

.field private transient iYears:Lorg/joda/time/DurationField;


# direct methods
.method protected constructor <init>(Lorg/joda/time/Chronology;Ljava/lang/Object;)V
    .registers 3

    .prologue
    .line 99
    invoke-direct {p0}, Lorg/joda/time/chrono/BaseChronology;-><init>()V

    .line 100
    iput-object p1, p0, Lorg/joda/time/chrono/AssembledChronology;->iBase:Lorg/joda/time/Chronology;

    .line 101
    iput-object p2, p0, Lorg/joda/time/chrono/AssembledChronology;->iParam:Ljava/lang/Object;

    .line 102
    invoke-direct {p0}, Lorg/joda/time/chrono/AssembledChronology;->setFields()V

    .line 103
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 389
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 390
    invoke-direct {p0}, Lorg/joda/time/chrono/AssembledChronology;->setFields()V

    .line 391
    return-void
.end method

.method private setFields()V
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 319
    new-instance v2, Lorg/joda/time/chrono/AssembledChronology$Fields;

    invoke-direct {v2}, Lorg/joda/time/chrono/AssembledChronology$Fields;-><init>()V

    .line 320
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iBase:Lorg/joda/time/Chronology;

    if-eqz v0, :cond_f

    .line 321
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iBase:Lorg/joda/time/Chronology;

    invoke-virtual {v2, v0}, Lorg/joda/time/chrono/AssembledChronology$Fields;->copyFieldsFrom(Lorg/joda/time/Chronology;)V

    .line 323
    :cond_f
    invoke-virtual {p0, v2}, Lorg/joda/time/chrono/AssembledChronology;->assemble(Lorg/joda/time/chrono/AssembledChronology$Fields;)V

    .line 327
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->millis:Lorg/joda/time/DurationField;

    if-eqz v0, :cond_eb

    :goto_16
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iMillis:Lorg/joda/time/DurationField;

    .line 328
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->seconds:Lorg/joda/time/DurationField;

    if-eqz v0, :cond_f1

    :goto_1c
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iSeconds:Lorg/joda/time/DurationField;

    .line 329
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->minutes:Lorg/joda/time/DurationField;

    if-eqz v0, :cond_f7

    :goto_22
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iMinutes:Lorg/joda/time/DurationField;

    .line 330
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->hours:Lorg/joda/time/DurationField;

    if-eqz v0, :cond_fd

    :goto_28
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iHours:Lorg/joda/time/DurationField;

    .line 331
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->halfdays:Lorg/joda/time/DurationField;

    if-eqz v0, :cond_103

    :goto_2e
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iHalfdays:Lorg/joda/time/DurationField;

    .line 332
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->days:Lorg/joda/time/DurationField;

    if-eqz v0, :cond_109

    :goto_34
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iDays:Lorg/joda/time/DurationField;

    .line 333
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->weeks:Lorg/joda/time/DurationField;

    if-eqz v0, :cond_10f

    :goto_3a
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iWeeks:Lorg/joda/time/DurationField;

    .line 334
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->weekyears:Lorg/joda/time/DurationField;

    if-eqz v0, :cond_115

    :goto_40
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iWeekyears:Lorg/joda/time/DurationField;

    .line 335
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->months:Lorg/joda/time/DurationField;

    if-eqz v0, :cond_11b

    :goto_46
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iMonths:Lorg/joda/time/DurationField;

    .line 336
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->years:Lorg/joda/time/DurationField;

    if-eqz v0, :cond_121

    :goto_4c
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iYears:Lorg/joda/time/DurationField;

    .line 337
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->centuries:Lorg/joda/time/DurationField;

    if-eqz v0, :cond_127

    :goto_52
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iCenturies:Lorg/joda/time/DurationField;

    .line 338
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->eras:Lorg/joda/time/DurationField;

    if-eqz v0, :cond_12d

    :goto_58
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iEras:Lorg/joda/time/DurationField;

    .line 343
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->millisOfSecond:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_133

    :goto_5e
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iMillisOfSecond:Lorg/joda/time/DateTimeField;

    .line 344
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->millisOfDay:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_139

    :goto_64
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iMillisOfDay:Lorg/joda/time/DateTimeField;

    .line 345
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->secondOfMinute:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_13f

    :goto_6a
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iSecondOfMinute:Lorg/joda/time/DateTimeField;

    .line 346
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->secondOfDay:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_145

    :goto_70
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iSecondOfDay:Lorg/joda/time/DateTimeField;

    .line 347
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->minuteOfHour:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_14b

    :goto_76
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iMinuteOfHour:Lorg/joda/time/DateTimeField;

    .line 348
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->minuteOfDay:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_151

    :goto_7c
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iMinuteOfDay:Lorg/joda/time/DateTimeField;

    .line 349
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->hourOfDay:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_157

    :goto_82
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iHourOfDay:Lorg/joda/time/DateTimeField;

    .line 350
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->clockhourOfDay:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_15d

    :goto_88
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iClockhourOfDay:Lorg/joda/time/DateTimeField;

    .line 351
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->hourOfHalfday:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_163

    :goto_8e
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iHourOfHalfday:Lorg/joda/time/DateTimeField;

    .line 352
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->clockhourOfHalfday:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_169

    :goto_94
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iClockhourOfHalfday:Lorg/joda/time/DateTimeField;

    .line 353
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->halfdayOfDay:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_16f

    :goto_9a
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iHalfdayOfDay:Lorg/joda/time/DateTimeField;

    .line 354
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->dayOfWeek:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_175

    :goto_a0
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iDayOfWeek:Lorg/joda/time/DateTimeField;

    .line 355
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->dayOfMonth:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_17b

    :goto_a6
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iDayOfMonth:Lorg/joda/time/DateTimeField;

    .line 356
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->dayOfYear:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_181

    :goto_ac
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iDayOfYear:Lorg/joda/time/DateTimeField;

    .line 357
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->weekOfWeekyear:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_187

    :goto_b2
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iWeekOfWeekyear:Lorg/joda/time/DateTimeField;

    .line 358
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->weekyear:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_18d

    :goto_b8
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iWeekyear:Lorg/joda/time/DateTimeField;

    .line 359
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->weekyearOfCentury:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_193

    :goto_be
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iWeekyearOfCentury:Lorg/joda/time/DateTimeField;

    .line 360
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->monthOfYear:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_199

    :goto_c4
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iMonthOfYear:Lorg/joda/time/DateTimeField;

    .line 361
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->year:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_19f

    :goto_ca
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iYear:Lorg/joda/time/DateTimeField;

    .line 362
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->yearOfEra:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_1a5

    :goto_d0
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iYearOfEra:Lorg/joda/time/DateTimeField;

    .line 363
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->yearOfCentury:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_1ab

    :goto_d6
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iYearOfCentury:Lorg/joda/time/DateTimeField;

    .line 364
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->centuryOfEra:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_1b1

    :goto_dc
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iCenturyOfEra:Lorg/joda/time/DateTimeField;

    .line 365
    iget-object v0, v2, Lorg/joda/time/chrono/AssembledChronology$Fields;->era:Lorg/joda/time/DateTimeField;

    if-eqz v0, :cond_1b7

    :goto_e2
    iput-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iEra:Lorg/joda/time/DateTimeField;

    .line 369
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iBase:Lorg/joda/time/Chronology;

    if-nez v0, :cond_1bd

    .line 385
    :goto_e8
    iput v1, p0, Lorg/joda/time/chrono/AssembledChronology;->iBaseFlags:I

    .line 386
    return-void

    .line 327
    :cond_eb
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->millis()Lorg/joda/time/DurationField;

    move-result-object v0

    goto/16 :goto_16

    .line 328
    :cond_f1
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->seconds()Lorg/joda/time/DurationField;

    move-result-object v0

    goto/16 :goto_1c

    .line 329
    :cond_f7
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->minutes()Lorg/joda/time/DurationField;

    move-result-object v0

    goto/16 :goto_22

    .line 330
    :cond_fd
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->hours()Lorg/joda/time/DurationField;

    move-result-object v0

    goto/16 :goto_28

    .line 331
    :cond_103
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->halfdays()Lorg/joda/time/DurationField;

    move-result-object v0

    goto/16 :goto_2e

    .line 332
    :cond_109
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->days()Lorg/joda/time/DurationField;

    move-result-object v0

    goto/16 :goto_34

    .line 333
    :cond_10f
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->weeks()Lorg/joda/time/DurationField;

    move-result-object v0

    goto/16 :goto_3a

    .line 334
    :cond_115
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->weekyears()Lorg/joda/time/DurationField;

    move-result-object v0

    goto/16 :goto_40

    .line 335
    :cond_11b
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->months()Lorg/joda/time/DurationField;

    move-result-object v0

    goto/16 :goto_46

    .line 336
    :cond_121
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->years()Lorg/joda/time/DurationField;

    move-result-object v0

    goto/16 :goto_4c

    .line 337
    :cond_127
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->centuries()Lorg/joda/time/DurationField;

    move-result-object v0

    goto/16 :goto_52

    .line 338
    :cond_12d
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->eras()Lorg/joda/time/DurationField;

    move-result-object v0

    goto/16 :goto_58

    .line 343
    :cond_133
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->millisOfSecond()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_5e

    .line 344
    :cond_139
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->millisOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_64

    .line 345
    :cond_13f
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->secondOfMinute()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_6a

    .line 346
    :cond_145
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->secondOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_70

    .line 347
    :cond_14b
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->minuteOfHour()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_76

    .line 348
    :cond_151
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->minuteOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_7c

    .line 349
    :cond_157
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->hourOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_82

    .line 350
    :cond_15d
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->clockhourOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_88

    .line 351
    :cond_163
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->hourOfHalfday()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_8e

    .line 352
    :cond_169
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->clockhourOfHalfday()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_94

    .line 353
    :cond_16f
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->halfdayOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_9a

    .line 354
    :cond_175
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->dayOfWeek()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_a0

    .line 355
    :cond_17b
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->dayOfMonth()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_a6

    .line 356
    :cond_181
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->dayOfYear()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_ac

    .line 357
    :cond_187
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->weekOfWeekyear()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_b2

    .line 358
    :cond_18d
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->weekyear()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_b8

    .line 359
    :cond_193
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->weekyearOfCentury()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_be

    .line 360
    :cond_199
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->monthOfYear()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_c4

    .line 361
    :cond_19f
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->year()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_ca

    .line 362
    :cond_1a5
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->yearOfEra()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_d0

    .line 363
    :cond_1ab
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->yearOfCentury()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_d6

    .line 364
    :cond_1b1
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->centuryOfEra()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_dc

    .line 365
    :cond_1b7
    invoke-super {p0}, Lorg/joda/time/chrono/BaseChronology;->era()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto/16 :goto_e2

    .line 372
    :cond_1bd
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iHourOfDay:Lorg/joda/time/DateTimeField;

    iget-object v2, p0, Lorg/joda/time/chrono/AssembledChronology;->iBase:Lorg/joda/time/Chronology;

    invoke-virtual {v2}, Lorg/joda/time/Chronology;->hourOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v2

    if-ne v0, v2, :cond_214

    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iMinuteOfHour:Lorg/joda/time/DateTimeField;

    iget-object v2, p0, Lorg/joda/time/chrono/AssembledChronology;->iBase:Lorg/joda/time/Chronology;

    invoke-virtual {v2}, Lorg/joda/time/Chronology;->minuteOfHour()Lorg/joda/time/DateTimeField;

    move-result-object v2

    if-ne v0, v2, :cond_214

    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iSecondOfMinute:Lorg/joda/time/DateTimeField;

    iget-object v2, p0, Lorg/joda/time/chrono/AssembledChronology;->iBase:Lorg/joda/time/Chronology;

    invoke-virtual {v2}, Lorg/joda/time/Chronology;->secondOfMinute()Lorg/joda/time/DateTimeField;

    move-result-object v2

    if-ne v0, v2, :cond_214

    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iMillisOfSecond:Lorg/joda/time/DateTimeField;

    iget-object v2, p0, Lorg/joda/time/chrono/AssembledChronology;->iBase:Lorg/joda/time/Chronology;

    invoke-virtual {v2}, Lorg/joda/time/Chronology;->millisOfSecond()Lorg/joda/time/DateTimeField;

    move-result-object v2

    if-ne v0, v2, :cond_214

    const/4 v0, 0x1

    :goto_1e6
    iget-object v2, p0, Lorg/joda/time/chrono/AssembledChronology;->iMillisOfDay:Lorg/joda/time/DateTimeField;

    iget-object v3, p0, Lorg/joda/time/chrono/AssembledChronology;->iBase:Lorg/joda/time/Chronology;

    invoke-virtual {v3}, Lorg/joda/time/Chronology;->millisOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v3

    if-ne v2, v3, :cond_216

    const/4 v2, 0x2

    :goto_1f1
    or-int/2addr v0, v2

    iget-object v2, p0, Lorg/joda/time/chrono/AssembledChronology;->iYear:Lorg/joda/time/DateTimeField;

    iget-object v3, p0, Lorg/joda/time/chrono/AssembledChronology;->iBase:Lorg/joda/time/Chronology;

    invoke-virtual {v3}, Lorg/joda/time/Chronology;->year()Lorg/joda/time/DateTimeField;

    move-result-object v3

    if-ne v2, v3, :cond_211

    iget-object v2, p0, Lorg/joda/time/chrono/AssembledChronology;->iMonthOfYear:Lorg/joda/time/DateTimeField;

    iget-object v3, p0, Lorg/joda/time/chrono/AssembledChronology;->iBase:Lorg/joda/time/Chronology;

    invoke-virtual {v3}, Lorg/joda/time/Chronology;->monthOfYear()Lorg/joda/time/DateTimeField;

    move-result-object v3

    if-ne v2, v3, :cond_211

    iget-object v2, p0, Lorg/joda/time/chrono/AssembledChronology;->iDayOfMonth:Lorg/joda/time/DateTimeField;

    iget-object v3, p0, Lorg/joda/time/chrono/AssembledChronology;->iBase:Lorg/joda/time/Chronology;

    invoke-virtual {v3}, Lorg/joda/time/Chronology;->dayOfMonth()Lorg/joda/time/DateTimeField;

    move-result-object v3

    if-ne v2, v3, :cond_211

    const/4 v1, 0x4

    :cond_211
    or-int/2addr v1, v0

    goto/16 :goto_e8

    :cond_214
    move v0, v1

    goto :goto_1e6

    :cond_216
    move v2, v1

    goto :goto_1f1
.end method


# virtual methods
.method protected abstract assemble(Lorg/joda/time/chrono/AssembledChronology$Fields;)V
.end method

.method public final centuries()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 280
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iCenturies:Lorg/joda/time/DurationField;

    return-object v0
.end method

.method public final centuryOfEra()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 284
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iCenturyOfEra:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final clockhourOfDay()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 200
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iClockhourOfDay:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final clockhourOfHalfday()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 212
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iClockhourOfHalfday:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final dayOfMonth()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 228
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iDayOfMonth:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final dayOfWeek()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 224
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iDayOfWeek:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final dayOfYear()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 232
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iDayOfYear:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final days()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 220
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iDays:Lorg/joda/time/DurationField;

    return-object v0
.end method

.method public final era()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 292
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iEra:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final eras()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 288
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iEras:Lorg/joda/time/DurationField;

    return-object v0
.end method

.method protected final getBase()Lorg/joda/time/Chronology;
    .registers 2

    .prologue
    .line 308
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iBase:Lorg/joda/time/Chronology;

    return-object v0
.end method

.method public getDateTimeMillis(IIII)J
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 118
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iBase:Lorg/joda/time/Chronology;

    if-eqz v0, :cond_10

    iget v1, p0, Lorg/joda/time/chrono/AssembledChronology;->iBaseFlags:I

    and-int/lit8 v1, v1, 0x6

    const/4 v2, 0x6

    if-ne v1, v2, :cond_10

    .line 120
    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/joda/time/Chronology;->getDateTimeMillis(IIII)J

    move-result-wide v0

    .line 122
    :goto_f
    return-wide v0

    :cond_10
    invoke-super {p0, p1, p2, p3, p4}, Lorg/joda/time/chrono/BaseChronology;->getDateTimeMillis(IIII)J

    move-result-wide v0

    goto :goto_f
.end method

.method public getDateTimeMillis(IIIIIII)J
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 131
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iBase:Lorg/joda/time/Chronology;

    if-eqz v0, :cond_17

    iget v1, p0, Lorg/joda/time/chrono/AssembledChronology;->iBaseFlags:I

    and-int/lit8 v1, v1, 0x5

    const/4 v2, 0x5

    if-ne v1, v2, :cond_17

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move v7, p7

    .line 133
    invoke-virtual/range {v0 .. v7}, Lorg/joda/time/Chronology;->getDateTimeMillis(IIIIIII)J

    move-result-wide v0

    .line 136
    :goto_16
    return-wide v0

    :cond_17
    invoke-super/range {p0 .. p7}, Lorg/joda/time/chrono/BaseChronology;->getDateTimeMillis(IIIIIII)J

    move-result-wide v0

    goto :goto_16
.end method

.method public getDateTimeMillis(JIIII)J
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 146
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iBase:Lorg/joda/time/Chronology;

    if-eqz v0, :cond_15

    iget v1, p0, Lorg/joda/time/chrono/AssembledChronology;->iBaseFlags:I

    and-int/lit8 v1, v1, 0x1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_15

    move-wide v1, p1

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    .line 148
    invoke-virtual/range {v0 .. v6}, Lorg/joda/time/Chronology;->getDateTimeMillis(JIIII)J

    move-result-wide v0

    .line 151
    :goto_14
    return-wide v0

    :cond_15
    invoke-super/range {p0 .. p6}, Lorg/joda/time/chrono/BaseChronology;->getDateTimeMillis(JIIII)J

    move-result-wide v0

    goto :goto_14
.end method

.method protected final getParam()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 315
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iParam:Ljava/lang/Object;

    return-object v0
.end method

.method public getZone()Lorg/joda/time/DateTimeZone;
    .registers 2

    .prologue
    .line 107
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iBase:Lorg/joda/time/Chronology;

    if-eqz v0, :cond_9

    .line 108
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->getZone()Lorg/joda/time/DateTimeZone;

    move-result-object v0

    .line 110
    :goto_8
    return-object v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public final halfdayOfDay()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 216
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iHalfdayOfDay:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final halfdays()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 204
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iHalfdays:Lorg/joda/time/DurationField;

    return-object v0
.end method

.method public final hourOfDay()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 196
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iHourOfDay:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final hourOfHalfday()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 208
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iHourOfHalfday:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final hours()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 192
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iHours:Lorg/joda/time/DurationField;

    return-object v0
.end method

.method public final millis()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 156
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iMillis:Lorg/joda/time/DurationField;

    return-object v0
.end method

.method public final millisOfDay()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 164
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iMillisOfDay:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final millisOfSecond()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 160
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iMillisOfSecond:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final minuteOfDay()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 188
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iMinuteOfDay:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final minuteOfHour()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 184
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iMinuteOfHour:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final minutes()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 180
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iMinutes:Lorg/joda/time/DurationField;

    return-object v0
.end method

.method public final monthOfYear()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 260
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iMonthOfYear:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final months()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 256
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iMonths:Lorg/joda/time/DurationField;

    return-object v0
.end method

.method public final secondOfDay()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 176
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iSecondOfDay:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final secondOfMinute()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 172
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iSecondOfMinute:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final seconds()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 168
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iSeconds:Lorg/joda/time/DurationField;

    return-object v0
.end method

.method public final weekOfWeekyear()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 240
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iWeekOfWeekyear:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final weeks()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 236
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iWeeks:Lorg/joda/time/DurationField;

    return-object v0
.end method

.method public final weekyear()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 248
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iWeekyear:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final weekyearOfCentury()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 252
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iWeekyearOfCentury:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final weekyears()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 244
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iWeekyears:Lorg/joda/time/DurationField;

    return-object v0
.end method

.method public final year()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 268
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iYear:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final yearOfCentury()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 276
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iYearOfCentury:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final yearOfEra()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 272
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iYearOfEra:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public final years()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 264
    iget-object v0, p0, Lorg/joda/time/chrono/AssembledChronology;->iYears:Lorg/joda/time/DurationField;

    return-object v0
.end method
