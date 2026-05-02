.class public abstract Lorg/joda/time/chrono/BaseChronology;
.super Lorg/joda/time/Chronology;
.source "BaseChronology.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x657569e3af0ff59cL


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 54
    invoke-direct {p0}, Lorg/joda/time/Chronology;-><init>()V

    .line 55
    return-void
.end method


# virtual methods
.method public add(JJI)J
    .registers 8

    .prologue
    .line 324
    const-wide/16 v0, 0x0

    cmp-long v0, p3, v0

    if-eqz v0, :cond_8

    if-nez p5, :cond_9

    .line 328
    :cond_8
    :goto_8
    return-wide p1

    .line 327
    :cond_9
    invoke-static {p3, p4, p5}, Lorg/joda/time/field/FieldUtils;->safeMultiply(JI)J

    move-result-wide v0

    .line 328
    invoke-static {p1, p2, v0, v1}, Lorg/joda/time/field/FieldUtils;->safeAdd(JJ)J

    move-result-wide p1

    goto :goto_8
.end method

.method public add(Lorg/joda/time/ReadablePeriod;JI)J
    .registers 14

    .prologue
    .line 303
    if-eqz p4, :cond_2a

    if-eqz p1, :cond_2a

    .line 304
    const/4 v0, 0x0

    invoke-interface {p1}, Lorg/joda/time/ReadablePeriod;->size()I

    move-result v3

    move v2, v0

    move-wide v0, p2

    :goto_b
    if-ge v2, v3, :cond_29

    .line 305
    invoke-interface {p1, v2}, Lorg/joda/time/ReadablePeriod;->getValue(I)I

    move-result v4

    int-to-long v4, v4

    .line 306
    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-eqz v6, :cond_26

    .line 307
    invoke-interface {p1, v2}, Lorg/joda/time/ReadablePeriod;->getFieldType(I)Lorg/joda/time/DurationFieldType;

    move-result-object v6

    invoke-virtual {v6, p0}, Lorg/joda/time/DurationFieldType;->getField(Lorg/joda/time/Chronology;)Lorg/joda/time/DurationField;

    move-result-object v6

    int-to-long v7, p4

    mul-long/2addr v4, v7

    invoke-virtual {v6, v0, v1, v4, v5}, Lorg/joda/time/DurationField;->add(JJ)J

    move-result-wide v0

    .line 304
    :cond_26
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    :cond_29
    move-wide p2, v0

    .line 311
    :cond_2a
    return-wide p2
.end method

.method public centuries()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 642
    invoke-static {}, Lorg/joda/time/DurationFieldType;->centuries()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    invoke-static {v0}, Lorg/joda/time/field/UnsupportedDurationField;->getInstance(Lorg/joda/time/DurationFieldType;)Lorg/joda/time/field/UnsupportedDurationField;

    move-result-object v0

    return-object v0
.end method

.method public centuryOfEra()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 651
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->centuryOfEra()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->centuries()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public clockhourOfDay()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 444
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->clockhourOfDay()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->hours()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public clockhourOfHalfday()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 473
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->clockhourOfHalfday()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->hours()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public dayOfMonth()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 515
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfMonth()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->days()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public dayOfWeek()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 506
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfWeek()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->days()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public dayOfYear()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 524
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfYear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->days()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public days()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 493
    invoke-static {}, Lorg/joda/time/DurationFieldType;->days()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    invoke-static {v0}, Lorg/joda/time/field/UnsupportedDurationField;->getInstance(Lorg/joda/time/DurationFieldType;)Lorg/joda/time/field/UnsupportedDurationField;

    move-result-object v0

    return-object v0
.end method

.method public era()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 671
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->era()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->eras()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public eras()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 662
    invoke-static {}, Lorg/joda/time/DurationFieldType;->eras()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    invoke-static {v0}, Lorg/joda/time/field/UnsupportedDurationField;->getInstance(Lorg/joda/time/DurationFieldType;)Lorg/joda/time/field/UnsupportedDurationField;

    move-result-object v0

    return-object v0
.end method

.method public get(Lorg/joda/time/ReadablePartial;J)[I
    .registers 8

    .prologue
    .line 223
    invoke-interface {p1}, Lorg/joda/time/ReadablePartial;->size()I

    move-result v1

    .line 224
    new-array v2, v1, [I

    .line 225
    const/4 v0, 0x0

    :goto_7
    if-ge v0, v1, :cond_1a

    .line 226
    invoke-interface {p1, v0}, Lorg/joda/time/ReadablePartial;->getFieldType(I)Lorg/joda/time/DateTimeFieldType;

    move-result-object v3

    invoke-virtual {v3, p0}, Lorg/joda/time/DateTimeFieldType;->getField(Lorg/joda/time/Chronology;)Lorg/joda/time/DateTimeField;

    move-result-object v3

    invoke-virtual {v3, p2, p3}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v3

    aput v3, v2, v0

    .line 225
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 228
    :cond_1a
    return-object v2
.end method

.method public get(Lorg/joda/time/ReadablePeriod;J)[I
    .registers 14

    .prologue
    const-wide/16 v1, 0x0

    .line 278
    invoke-interface {p1}, Lorg/joda/time/ReadablePeriod;->size()I

    move-result v3

    .line 279
    new-array v4, v3, [I

    .line 280
    cmp-long v0, p2, v1

    if-eqz v0, :cond_2e

    .line 282
    const/4 v0, 0x0

    move v7, v0

    move-wide v8, v1

    move-wide v0, v8

    move v2, v7

    :goto_11
    if-ge v2, v3, :cond_2e

    .line 283
    invoke-interface {p1, v2}, Lorg/joda/time/ReadablePeriod;->getFieldType(I)Lorg/joda/time/DurationFieldType;

    move-result-object v5

    invoke-virtual {v5, p0}, Lorg/joda/time/DurationFieldType;->getField(Lorg/joda/time/Chronology;)Lorg/joda/time/DurationField;

    move-result-object v5

    .line 284
    invoke-virtual {v5}, Lorg/joda/time/DurationField;->isPrecise()Z

    move-result v6

    if-eqz v6, :cond_2b

    .line 285
    invoke-virtual {v5, p2, p3, v0, v1}, Lorg/joda/time/DurationField;->getDifference(JJ)I

    move-result v6

    .line 286
    invoke-virtual {v5, v0, v1, v6}, Lorg/joda/time/DurationField;->add(JI)J

    move-result-wide v0

    .line 287
    aput v6, v4, v2

    .line 282
    :cond_2b
    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    .line 291
    :cond_2e
    return-object v4
.end method

.method public get(Lorg/joda/time/ReadablePeriod;JJ)[I
    .registers 13

    .prologue
    .line 255
    invoke-interface {p1}, Lorg/joda/time/ReadablePeriod;->size()I

    move-result v3

    .line 256
    new-array v4, v3, [I

    .line 257
    cmp-long v0, p2, p4

    if-eqz v0, :cond_26

    .line 258
    const/4 v0, 0x0

    move v2, v0

    move-wide v0, p2

    :goto_d
    if-ge v2, v3, :cond_26

    .line 259
    invoke-interface {p1, v2}, Lorg/joda/time/ReadablePeriod;->getFieldType(I)Lorg/joda/time/DurationFieldType;

    move-result-object v5

    invoke-virtual {v5, p0}, Lorg/joda/time/DurationFieldType;->getField(Lorg/joda/time/Chronology;)Lorg/joda/time/DurationField;

    move-result-object v5

    .line 260
    invoke-virtual {v5, p4, p5, v0, v1}, Lorg/joda/time/DurationField;->getDifference(JJ)I

    move-result v6

    .line 261
    if-eqz v6, :cond_21

    .line 262
    invoke-virtual {v5, v0, v1, v6}, Lorg/joda/time/DurationField;->add(JI)J

    move-result-wide v0

    .line 264
    :cond_21
    aput v6, v4, v2

    .line 258
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 267
    :cond_26
    return-object v4
.end method

.method public getDateTimeMillis(IIII)J
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 102
    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->year()Lorg/joda/time/DateTimeField;

    move-result-object v0

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    .line 103
    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->monthOfYear()Lorg/joda/time/DateTimeField;

    move-result-object v2

    invoke-virtual {v2, v0, v1, p2}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    .line 104
    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->dayOfMonth()Lorg/joda/time/DateTimeField;

    move-result-object v2

    invoke-virtual {v2, v0, v1, p3}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    .line 105
    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->millisOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v2

    invoke-virtual {v2, v0, v1, p4}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    return-wide v0
.end method

.method public getDateTimeMillis(IIIIIII)J
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 132
    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->year()Lorg/joda/time/DateTimeField;

    move-result-object v0

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    .line 133
    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->monthOfYear()Lorg/joda/time/DateTimeField;

    move-result-object v2

    invoke-virtual {v2, v0, v1, p2}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    .line 134
    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->dayOfMonth()Lorg/joda/time/DateTimeField;

    move-result-object v2

    invoke-virtual {v2, v0, v1, p3}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    .line 135
    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->hourOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v2

    invoke-virtual {v2, v0, v1, p4}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    .line 136
    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->minuteOfHour()Lorg/joda/time/DateTimeField;

    move-result-object v2

    invoke-virtual {v2, v0, v1, p5}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    .line 137
    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->secondOfMinute()Lorg/joda/time/DateTimeField;

    move-result-object v2

    invoke-virtual {v2, v0, v1, p6}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    .line 138
    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->millisOfSecond()Lorg/joda/time/DateTimeField;

    move-result-object v2

    invoke-virtual {v2, v0, v1, p7}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    return-wide v0
.end method

.method public getDateTimeMillis(JIIII)J
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 163
    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->hourOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    .line 164
    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->minuteOfHour()Lorg/joda/time/DateTimeField;

    move-result-object v2

    invoke-virtual {v2, v0, v1, p4}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    .line 165
    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->secondOfMinute()Lorg/joda/time/DateTimeField;

    move-result-object v2

    invoke-virtual {v2, v0, v1, p5}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    .line 166
    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->millisOfSecond()Lorg/joda/time/DateTimeField;

    move-result-object v2

    invoke-virtual {v2, v0, v1, p6}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    return-wide v0
.end method

.method public abstract getZone()Lorg/joda/time/DateTimeZone;
.end method

.method public halfdayOfDay()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 482
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->halfdayOfDay()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->halfdays()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public halfdays()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 455
    invoke-static {}, Lorg/joda/time/DurationFieldType;->halfdays()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    invoke-static {v0}, Lorg/joda/time/field/UnsupportedDurationField;->getInstance(Lorg/joda/time/DurationFieldType;)Lorg/joda/time/field/UnsupportedDurationField;

    move-result-object v0

    return-object v0
.end method

.method public hourOfDay()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 435
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->hourOfDay()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->hours()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public hourOfHalfday()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 464
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->hourOfHalfday()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->hours()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public hours()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 426
    invoke-static {}, Lorg/joda/time/DurationFieldType;->hours()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    invoke-static {v0}, Lorg/joda/time/field/UnsupportedDurationField;->getInstance(Lorg/joda/time/DurationFieldType;)Lorg/joda/time/field/UnsupportedDurationField;

    move-result-object v0

    return-object v0
.end method

.method public millis()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 339
    invoke-static {}, Lorg/joda/time/DurationFieldType;->millis()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    invoke-static {v0}, Lorg/joda/time/field/UnsupportedDurationField;->getInstance(Lorg/joda/time/DurationFieldType;)Lorg/joda/time/field/UnsupportedDurationField;

    move-result-object v0

    return-object v0
.end method

.method public millisOfDay()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 357
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->millisOfDay()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->millis()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public millisOfSecond()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 348
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->millisOfSecond()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->millis()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public minuteOfDay()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 415
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->minuteOfDay()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->minutes()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public minuteOfHour()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 406
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->minuteOfHour()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->minutes()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public minutes()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 397
    invoke-static {}, Lorg/joda/time/DurationFieldType;->minutes()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    invoke-static {v0}, Lorg/joda/time/field/UnsupportedDurationField;->getInstance(Lorg/joda/time/DurationFieldType;)Lorg/joda/time/field/UnsupportedDurationField;

    move-result-object v0

    return-object v0
.end method

.method public monthOfYear()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 593
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->monthOfYear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->months()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public months()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 584
    invoke-static {}, Lorg/joda/time/DurationFieldType;->months()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    invoke-static {v0}, Lorg/joda/time/field/UnsupportedDurationField;->getInstance(Lorg/joda/time/DurationFieldType;)Lorg/joda/time/field/UnsupportedDurationField;

    move-result-object v0

    return-object v0
.end method

.method public secondOfDay()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 386
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->secondOfDay()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->seconds()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public secondOfMinute()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 377
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->secondOfMinute()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->seconds()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public seconds()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 368
    invoke-static {}, Lorg/joda/time/DurationFieldType;->seconds()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    invoke-static {v0}, Lorg/joda/time/field/UnsupportedDurationField;->getInstance(Lorg/joda/time/DurationFieldType;)Lorg/joda/time/field/UnsupportedDurationField;

    move-result-object v0

    return-object v0
.end method

.method public set(Lorg/joda/time/ReadablePartial;J)J
    .registers 8

    .prologue
    .line 239
    const/4 v0, 0x0

    invoke-interface {p1}, Lorg/joda/time/ReadablePartial;->size()I

    move-result v1

    :goto_5
    if-ge v0, v1, :cond_1a

    .line 240
    invoke-interface {p1, v0}, Lorg/joda/time/ReadablePartial;->getFieldType(I)Lorg/joda/time/DateTimeFieldType;

    move-result-object v2

    invoke-virtual {v2, p0}, Lorg/joda/time/DateTimeFieldType;->getField(Lorg/joda/time/Chronology;)Lorg/joda/time/DateTimeField;

    move-result-object v2

    invoke-interface {p1, v0}, Lorg/joda/time/ReadablePartial;->getValue(I)I

    move-result v3

    invoke-virtual {v2, p2, p3, v3}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide p2

    .line 239
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 242
    :cond_1a
    return-wide p2
.end method

.method public abstract toString()Ljava/lang/String;
.end method

.method public validate(Lorg/joda/time/ReadablePartial;[I)V
    .registers 10

    .prologue
    const/4 v0, 0x0

    const/4 v6, 0x0

    .line 183
    invoke-interface {p1}, Lorg/joda/time/ReadablePartial;->size()I

    move-result v2

    move v1, v0

    .line 184
    :goto_7
    if-ge v1, v2, :cond_4c

    .line 185
    aget v3, p2, v1

    .line 186
    invoke-interface {p1, v1}, Lorg/joda/time/ReadablePartial;->getField(I)Lorg/joda/time/DateTimeField;

    move-result-object v4

    .line 187
    invoke-virtual {v4}, Lorg/joda/time/DateTimeField;->getMinimumValue()I

    move-result v5

    if-ge v3, v5, :cond_2b

    .line 188
    new-instance v0, Lorg/joda/time/IllegalFieldValueException;

    invoke-virtual {v4}, Lorg/joda/time/DateTimeField;->getType()Lorg/joda/time/DateTimeFieldType;

    move-result-object v1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v4}, Lorg/joda/time/DateTimeField;->getMinimumValue()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3, v6}, Lorg/joda/time/IllegalFieldValueException;-><init>(Lorg/joda/time/DateTimeFieldType;Ljava/lang/Number;Ljava/lang/Number;Ljava/lang/Number;)V

    throw v0

    .line 192
    :cond_2b
    invoke-virtual {v4}, Lorg/joda/time/DateTimeField;->getMaximumValue()I

    move-result v5

    if-le v3, v5, :cond_47

    .line 193
    new-instance v0, Lorg/joda/time/IllegalFieldValueException;

    invoke-virtual {v4}, Lorg/joda/time/DateTimeField;->getType()Lorg/joda/time/DateTimeFieldType;

    move-result-object v1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v4}, Lorg/joda/time/DateTimeField;->getMaximumValue()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v0, v1, v2, v6, v3}, Lorg/joda/time/IllegalFieldValueException;-><init>(Lorg/joda/time/DateTimeFieldType;Ljava/lang/Number;Ljava/lang/Number;Ljava/lang/Number;)V

    throw v0

    .line 184
    :cond_47
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 199
    :cond_4a
    add-int/lit8 v0, v0, 0x1

    :cond_4c
    if-ge v0, v2, :cond_8c

    .line 200
    aget v1, p2, v0

    .line 201
    invoke-interface {p1, v0}, Lorg/joda/time/ReadablePartial;->getField(I)Lorg/joda/time/DateTimeField;

    move-result-object v3

    .line 202
    invoke-virtual {v3, p1, p2}, Lorg/joda/time/DateTimeField;->getMinimumValue(Lorg/joda/time/ReadablePartial;[I)I

    move-result v4

    if-ge v1, v4, :cond_70

    .line 203
    new-instance v0, Lorg/joda/time/IllegalFieldValueException;

    invoke-virtual {v3}, Lorg/joda/time/DateTimeField;->getType()Lorg/joda/time/DateTimeFieldType;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v3, p1, p2}, Lorg/joda/time/DateTimeField;->getMinimumValue(Lorg/joda/time/ReadablePartial;[I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v0, v2, v1, v3, v6}, Lorg/joda/time/IllegalFieldValueException;-><init>(Lorg/joda/time/DateTimeFieldType;Ljava/lang/Number;Ljava/lang/Number;Ljava/lang/Number;)V

    throw v0

    .line 207
    :cond_70
    invoke-virtual {v3, p1, p2}, Lorg/joda/time/DateTimeField;->getMaximumValue(Lorg/joda/time/ReadablePartial;[I)I

    move-result v4

    if-le v1, v4, :cond_4a

    .line 208
    new-instance v0, Lorg/joda/time/IllegalFieldValueException;

    invoke-virtual {v3}, Lorg/joda/time/DateTimeField;->getType()Lorg/joda/time/DateTimeFieldType;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v3, p1, p2}, Lorg/joda/time/DateTimeField;->getMaximumValue(Lorg/joda/time/ReadablePartial;[I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v0, v2, v1, v6, v3}, Lorg/joda/time/IllegalFieldValueException;-><init>(Lorg/joda/time/DateTimeFieldType;Ljava/lang/Number;Ljava/lang/Number;Ljava/lang/Number;)V

    throw v0

    .line 213
    :cond_8c
    return-void
.end method

.method public weekOfWeekyear()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 544
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->weekOfWeekyear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->weeks()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public weeks()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 535
    invoke-static {}, Lorg/joda/time/DurationFieldType;->weeks()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    invoke-static {v0}, Lorg/joda/time/field/UnsupportedDurationField;->getInstance(Lorg/joda/time/DurationFieldType;)Lorg/joda/time/field/UnsupportedDurationField;

    move-result-object v0

    return-object v0
.end method

.method public weekyear()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 564
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->weekyear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->weekyears()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public weekyearOfCentury()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 573
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->weekyearOfCentury()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->weekyears()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public weekyears()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 555
    invoke-static {}, Lorg/joda/time/DurationFieldType;->weekyears()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    invoke-static {v0}, Lorg/joda/time/field/UnsupportedDurationField;->getInstance(Lorg/joda/time/DurationFieldType;)Lorg/joda/time/field/UnsupportedDurationField;

    move-result-object v0

    return-object v0
.end method

.method public abstract withUTC()Lorg/joda/time/Chronology;
.end method

.method public abstract withZone(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/Chronology;
.end method

.method public year()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 613
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->year()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->years()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public yearOfCentury()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 631
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->yearOfCentury()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->years()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public yearOfEra()Lorg/joda/time/DateTimeField;
    .registers 3

    .prologue
    .line 622
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->yearOfEra()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/chrono/BaseChronology;->years()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method public years()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 604
    invoke-static {}, Lorg/joda/time/DurationFieldType;->years()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    invoke-static {v0}, Lorg/joda/time/field/UnsupportedDurationField;->getInstance(Lorg/joda/time/DurationFieldType;)Lorg/joda/time/field/UnsupportedDurationField;

    move-result-object v0

    return-object v0
.end method
