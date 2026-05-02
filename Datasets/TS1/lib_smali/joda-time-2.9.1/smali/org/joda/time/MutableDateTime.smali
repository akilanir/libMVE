.class public Lorg/joda/time/MutableDateTime;
.super Lorg/joda/time/base/BaseDateTime;
.source "MutableDateTime.java"

# interfaces
.implements Lorg/joda/time/ReadWritableDateTime;
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/joda/time/MutableDateTime$Property;
    }
.end annotation


# static fields
.field public static final ROUND_CEILING:I = 0x2

.field public static final ROUND_FLOOR:I = 0x1

.field public static final ROUND_HALF_CEILING:I = 0x4

.field public static final ROUND_HALF_EVEN:I = 0x5

.field public static final ROUND_HALF_FLOOR:I = 0x3

.field public static final ROUND_NONE:I = 0x0

.field private static final serialVersionUID:J = 0x2796807cf37e0267L


# instance fields
.field private iRoundingField:Lorg/joda/time/DateTimeField;

.field private iRoundingMode:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 171
    invoke-direct {p0}, Lorg/joda/time/base/BaseDateTime;-><init>()V

    .line 172
    return-void
.end method

.method public constructor <init>(IIIIIII)V
    .registers 8

    .prologue
    .line 323
    invoke-direct/range {p0 .. p7}, Lorg/joda/time/base/BaseDateTime;-><init>(IIIIIII)V

    .line 324
    return-void
.end method

.method public constructor <init>(IIIIIIILorg/joda/time/Chronology;)V
    .registers 9

    .prologue
    .line 379
    invoke-direct/range {p0 .. p8}, Lorg/joda/time/base/BaseDateTime;-><init>(IIIIIIILorg/joda/time/Chronology;)V

    .line 381
    return-void
.end method

.method public constructor <init>(IIIIIIILorg/joda/time/DateTimeZone;)V
    .registers 9

    .prologue
    .line 350
    invoke-direct/range {p0 .. p8}, Lorg/joda/time/base/BaseDateTime;-><init>(IIIIIIILorg/joda/time/DateTimeZone;)V

    .line 352
    return-void
.end method

.method public constructor <init>(J)V
    .registers 3

    .prologue
    .line 209
    invoke-direct {p0, p1, p2}, Lorg/joda/time/base/BaseDateTime;-><init>(J)V

    .line 210
    return-void
.end method

.method public constructor <init>(JLorg/joda/time/Chronology;)V
    .registers 4

    .prologue
    .line 236
    invoke-direct {p0, p1, p2, p3}, Lorg/joda/time/base/BaseDateTime;-><init>(JLorg/joda/time/Chronology;)V

    .line 237
    return-void
.end method

.method public constructor <init>(JLorg/joda/time/DateTimeZone;)V
    .registers 4

    .prologue
    .line 222
    invoke-direct {p0, p1, p2, p3}, Lorg/joda/time/base/BaseDateTime;-><init>(JLorg/joda/time/DateTimeZone;)V

    .line 223
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3

    .prologue
    .line 256
    const/4 v0, 0x0

    check-cast v0, Lorg/joda/time/Chronology;

    invoke-direct {p0, p1, v0}, Lorg/joda/time/base/BaseDateTime;-><init>(Ljava/lang/Object;Lorg/joda/time/Chronology;)V

    .line 257
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Lorg/joda/time/Chronology;)V
    .registers 4

    .prologue
    .line 299
    invoke-static {p2}, Lorg/joda/time/DateTimeUtils;->getChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/joda/time/base/BaseDateTime;-><init>(Ljava/lang/Object;Lorg/joda/time/Chronology;)V

    .line 300
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Lorg/joda/time/DateTimeZone;)V
    .registers 3

    .prologue
    .line 279
    invoke-direct {p0, p1, p2}, Lorg/joda/time/base/BaseDateTime;-><init>(Ljava/lang/Object;Lorg/joda/time/DateTimeZone;)V

    .line 280
    return-void
.end method

.method public constructor <init>(Lorg/joda/time/Chronology;)V
    .registers 2

    .prologue
    .line 198
    invoke-direct {p0, p1}, Lorg/joda/time/base/BaseDateTime;-><init>(Lorg/joda/time/Chronology;)V

    .line 199
    return-void
.end method

.method public constructor <init>(Lorg/joda/time/DateTimeZone;)V
    .registers 2

    .prologue
    .line 184
    invoke-direct {p0, p1}, Lorg/joda/time/base/BaseDateTime;-><init>(Lorg/joda/time/DateTimeZone;)V

    .line 185
    return-void
.end method

.method public static now()Lorg/joda/time/MutableDateTime;
    .registers 1

    .prologue
    .line 105
    new-instance v0, Lorg/joda/time/MutableDateTime;

    invoke-direct {v0}, Lorg/joda/time/MutableDateTime;-><init>()V

    return-object v0
.end method

.method public static now(Lorg/joda/time/Chronology;)Lorg/joda/time/MutableDateTime;
    .registers 3

    .prologue
    .line 132
    if-nez p0, :cond_a

    .line 133
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Chronology must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 135
    :cond_a
    new-instance v0, Lorg/joda/time/MutableDateTime;

    invoke-direct {v0, p0}, Lorg/joda/time/MutableDateTime;-><init>(Lorg/joda/time/Chronology;)V

    return-object v0
.end method

.method public static now(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/MutableDateTime;
    .registers 3

    .prologue
    .line 117
    if-nez p0, :cond_a

    .line 118
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Zone must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 120
    :cond_a
    new-instance v0, Lorg/joda/time/MutableDateTime;

    invoke-direct {v0, p0}, Lorg/joda/time/MutableDateTime;-><init>(Lorg/joda/time/DateTimeZone;)V

    return-object v0
.end method

.method public static parse(Ljava/lang/String;)Lorg/joda/time/MutableDateTime;
    .registers 2
    .annotation runtime Lorg/joda/convert/FromString;
    .end annotation

    .prologue
    .line 149
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat;->dateTimeParser()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/format/DateTimeFormatter;->withOffsetParsed()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/joda/time/MutableDateTime;->parse(Ljava/lang/String;Lorg/joda/time/format/DateTimeFormatter;)Lorg/joda/time/MutableDateTime;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/lang/String;Lorg/joda/time/format/DateTimeFormatter;)Lorg/joda/time/MutableDateTime;
    .registers 3

    .prologue
    .line 160
    invoke-virtual {p1, p0}, Lorg/joda/time/format/DateTimeFormatter;->parseDateTime(Ljava/lang/String;)Lorg/joda/time/DateTime;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/DateTime;->toMutableDateTime()Lorg/joda/time/MutableDateTime;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public add(J)V
    .registers 5

    .prologue
    .line 496
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v0

    invoke-static {v0, v1, p1, p2}, Lorg/joda/time/field/FieldUtils;->safeAdd(JJ)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 497
    return-void
.end method

.method public add(Lorg/joda/time/DurationFieldType;I)V
    .registers 6

    .prologue
    .line 635
    if-nez p1, :cond_a

    .line 636
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Field must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 638
    :cond_a
    if-eqz p2, :cond_1f

    .line 639
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/joda/time/DurationFieldType;->getField(Lorg/joda/time/Chronology;)Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p2}, Lorg/joda/time/DurationField;->add(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 641
    :cond_1f
    return-void
.end method

.method public add(Lorg/joda/time/ReadableDuration;)V
    .registers 3

    .prologue
    .line 508
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lorg/joda/time/MutableDateTime;->add(Lorg/joda/time/ReadableDuration;I)V

    .line 509
    return-void
.end method

.method public add(Lorg/joda/time/ReadableDuration;I)V
    .registers 5

    .prologue
    .line 521
    if-eqz p1, :cond_d

    .line 522
    invoke-interface {p1}, Lorg/joda/time/ReadableDuration;->getMillis()J

    move-result-wide v0

    invoke-static {v0, v1, p2}, Lorg/joda/time/field/FieldUtils;->safeMultiply(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->add(J)V

    .line 524
    :cond_d
    return-void
.end method

.method public add(Lorg/joda/time/ReadablePeriod;)V
    .registers 3

    .prologue
    .line 535
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lorg/joda/time/MutableDateTime;->add(Lorg/joda/time/ReadablePeriod;I)V

    .line 536
    return-void
.end method

.method public add(Lorg/joda/time/ReadablePeriod;I)V
    .registers 6

    .prologue
    .line 548
    if-eqz p1, :cond_11

    .line 549
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, p1, v1, v2, p2}, Lorg/joda/time/Chronology;->add(Lorg/joda/time/ReadablePeriod;JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 551
    :cond_11
    return-void
.end method

.method public addDays(I)V
    .registers 5

    .prologue
    .line 773
    if-eqz p1, :cond_15

    .line 774
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->days()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DurationField;->add(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 776
    :cond_15
    return-void
.end method

.method public addHours(I)V
    .registers 5

    .prologue
    .line 796
    if-eqz p1, :cond_15

    .line 797
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->hours()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DurationField;->add(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 799
    :cond_15
    return-void
.end method

.method public addMillis(I)V
    .registers 5

    .prologue
    .line 897
    if-eqz p1, :cond_15

    .line 898
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->millis()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DurationField;->add(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 900
    :cond_15
    return-void
.end method

.method public addMinutes(I)V
    .registers 5

    .prologue
    .line 829
    if-eqz p1, :cond_15

    .line 830
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->minutes()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DurationField;->add(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 832
    :cond_15
    return-void
.end method

.method public addMonths(I)V
    .registers 5

    .prologue
    .line 707
    if-eqz p1, :cond_15

    .line 708
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->months()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DurationField;->add(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 710
    :cond_15
    return-void
.end method

.method public addSeconds(I)V
    .registers 5

    .prologue
    .line 862
    if-eqz p1, :cond_15

    .line 863
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->seconds()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DurationField;->add(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 865
    :cond_15
    return-void
.end method

.method public addWeeks(I)V
    .registers 5

    .prologue
    .line 730
    if-eqz p1, :cond_15

    .line 731
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->weeks()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DurationField;->add(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 733
    :cond_15
    return-void
.end method

.method public addWeekyears(I)V
    .registers 5

    .prologue
    .line 684
    if-eqz p1, :cond_15

    .line 685
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->weekyears()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DurationField;->add(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 687
    :cond_15
    return-void
.end method

.method public addYears(I)V
    .registers 5

    .prologue
    .line 661
    if-eqz p1, :cond_15

    .line 662
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->years()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DurationField;->add(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 664
    :cond_15
    return-void
.end method

.method public centuryOfEra()Lorg/joda/time/MutableDateTime$Property;
    .registers 3

    .prologue
    .line 1065
    new-instance v0, Lorg/joda/time/MutableDateTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->centuryOfEra()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/MutableDateTime$Property;-><init>(Lorg/joda/time/MutableDateTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public clone()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 1235
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    return-object v0

    .line 1236
    :catch_5
    move-exception v0

    .line 1237
    new-instance v0, Ljava/lang/InternalError;

    const-string v1, "Clone error"

    invoke-direct {v0, v1}, Ljava/lang/InternalError;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public copy()Lorg/joda/time/MutableDateTime;
    .registers 2

    .prologue
    .line 1224
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/joda/time/MutableDateTime;

    return-object v0
.end method

.method public dayOfMonth()Lorg/joda/time/MutableDateTime$Property;
    .registers 3

    .prologue
    .line 1139
    new-instance v0, Lorg/joda/time/MutableDateTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->dayOfMonth()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/MutableDateTime$Property;-><init>(Lorg/joda/time/MutableDateTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public dayOfWeek()Lorg/joda/time/MutableDateTime$Property;
    .registers 3

    .prologue
    .line 1150
    new-instance v0, Lorg/joda/time/MutableDateTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->dayOfWeek()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/MutableDateTime$Property;-><init>(Lorg/joda/time/MutableDateTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public dayOfYear()Lorg/joda/time/MutableDateTime$Property;
    .registers 3

    .prologue
    .line 1128
    new-instance v0, Lorg/joda/time/MutableDateTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->dayOfYear()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/MutableDateTime$Property;-><init>(Lorg/joda/time/MutableDateTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public era()Lorg/joda/time/MutableDateTime$Property;
    .registers 3

    .prologue
    .line 1056
    new-instance v0, Lorg/joda/time/MutableDateTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->era()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/MutableDateTime$Property;-><init>(Lorg/joda/time/MutableDateTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public getRoundingField()Lorg/joda/time/DateTimeField;
    .registers 2

    .prologue
    .line 391
    iget-object v0, p0, Lorg/joda/time/MutableDateTime;->iRoundingField:Lorg/joda/time/DateTimeField;

    return-object v0
.end method

.method public getRoundingMode()I
    .registers 2

    .prologue
    .line 401
    iget v0, p0, Lorg/joda/time/MutableDateTime;->iRoundingMode:I

    return v0
.end method

.method public hourOfDay()Lorg/joda/time/MutableDateTime$Property;
    .registers 3

    .prologue
    .line 1160
    new-instance v0, Lorg/joda/time/MutableDateTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->hourOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/MutableDateTime$Property;-><init>(Lorg/joda/time/MutableDateTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public millisOfDay()Lorg/joda/time/MutableDateTime$Property;
    .registers 3

    .prologue
    .line 1205
    new-instance v0, Lorg/joda/time/MutableDateTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->millisOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/MutableDateTime$Property;-><init>(Lorg/joda/time/MutableDateTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public millisOfSecond()Lorg/joda/time/MutableDateTime$Property;
    .registers 3

    .prologue
    .line 1214
    new-instance v0, Lorg/joda/time/MutableDateTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->millisOfSecond()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/MutableDateTime$Property;-><init>(Lorg/joda/time/MutableDateTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public minuteOfDay()Lorg/joda/time/MutableDateTime$Property;
    .registers 3

    .prologue
    .line 1169
    new-instance v0, Lorg/joda/time/MutableDateTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->minuteOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/MutableDateTime$Property;-><init>(Lorg/joda/time/MutableDateTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public minuteOfHour()Lorg/joda/time/MutableDateTime$Property;
    .registers 3

    .prologue
    .line 1178
    new-instance v0, Lorg/joda/time/MutableDateTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->minuteOfHour()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/MutableDateTime$Property;-><init>(Lorg/joda/time/MutableDateTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public monthOfYear()Lorg/joda/time/MutableDateTime$Property;
    .registers 3

    .prologue
    .line 1110
    new-instance v0, Lorg/joda/time/MutableDateTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->monthOfYear()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/MutableDateTime$Property;-><init>(Lorg/joda/time/MutableDateTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public property(Lorg/joda/time/DateTimeFieldType;)Lorg/joda/time/MutableDateTime$Property;
    .registers 5

    .prologue
    .line 1040
    if-nez p1, :cond_a

    .line 1041
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The DateTimeFieldType must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1043
    :cond_a
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/joda/time/DateTimeFieldType;->getField(Lorg/joda/time/Chronology;)Lorg/joda/time/DateTimeField;

    move-result-object v0

    .line 1044
    invoke-virtual {v0}, Lorg/joda/time/DateTimeField;->isSupported()Z

    move-result v1

    if-nez v1, :cond_37

    .line 1045
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Field \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' is not supported"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1047
    :cond_37
    new-instance v1, Lorg/joda/time/MutableDateTime$Property;

    invoke-direct {v1, p0, v0}, Lorg/joda/time/MutableDateTime$Property;-><init>(Lorg/joda/time/MutableDateTime;Lorg/joda/time/DateTimeField;)V

    return-object v1
.end method

.method public secondOfDay()Lorg/joda/time/MutableDateTime$Property;
    .registers 3

    .prologue
    .line 1187
    new-instance v0, Lorg/joda/time/MutableDateTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->secondOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/MutableDateTime$Property;-><init>(Lorg/joda/time/MutableDateTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public secondOfMinute()Lorg/joda/time/MutableDateTime$Property;
    .registers 3

    .prologue
    .line 1196
    new-instance v0, Lorg/joda/time/MutableDateTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->secondOfMinute()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/MutableDateTime$Property;-><init>(Lorg/joda/time/MutableDateTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public set(Lorg/joda/time/DateTimeFieldType;I)V
    .registers 6

    .prologue
    .line 620
    if-nez p1, :cond_a

    .line 621
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Field must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 623
    :cond_a
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/joda/time/DateTimeFieldType;->getField(Lorg/joda/time/Chronology;)Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p2}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 624
    return-void
.end method

.method public setChronology(Lorg/joda/time/Chronology;)V
    .registers 2

    .prologue
    .line 562
    invoke-super {p0, p1}, Lorg/joda/time/base/BaseDateTime;->setChronology(Lorg/joda/time/Chronology;)V

    .line 563
    return-void
.end method

.method public setDate(III)V
    .registers 6

    .prologue
    .line 950
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    .line 951
    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, p3, v1}, Lorg/joda/time/Chronology;->getDateTimeMillis(IIII)J

    move-result-wide v0

    .line 952
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setDate(J)V

    .line 953
    return-void
.end method

.method public setDate(J)V
    .registers 5

    .prologue
    .line 911
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->millisOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillisOfDay()I

    move-result v1

    invoke-virtual {v0, p1, p2, v1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 912
    return-void
.end method

.method public setDate(Lorg/joda/time/ReadableInstant;)V
    .registers 6

    .prologue
    .line 925
    invoke-static {p1}, Lorg/joda/time/DateTimeUtils;->getInstantMillis(Lorg/joda/time/ReadableInstant;)J

    move-result-wide v0

    .line 926
    instance-of v2, p1, Lorg/joda/time/ReadableDateTime;

    if-eqz v2, :cond_20

    .line 927
    check-cast p1, Lorg/joda/time/ReadableDateTime;

    .line 928
    invoke-interface {p1}, Lorg/joda/time/ReadableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v2

    invoke-static {v2}, Lorg/joda/time/DateTimeUtils;->getChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v2

    .line 929
    invoke-virtual {v2}, Lorg/joda/time/Chronology;->getZone()Lorg/joda/time/DateTimeZone;

    move-result-object v2

    .line 930
    if-eqz v2, :cond_20

    .line 931
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getZone()Lorg/joda/time/DateTimeZone;

    move-result-object v3

    invoke-virtual {v2, v3, v0, v1}, Lorg/joda/time/DateTimeZone;->getMillisKeepLocal(Lorg/joda/time/DateTimeZone;J)J

    move-result-wide v0

    .line 934
    :cond_20
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setDate(J)V

    .line 935
    return-void
.end method

.method public setDateTime(IIIIIII)V
    .registers 16

    .prologue
    .line 1025
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move v7, p7

    invoke-virtual/range {v0 .. v7}, Lorg/joda/time/Chronology;->getDateTimeMillis(IIIIIII)J

    move-result-wide v0

    .line 1027
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 1028
    return-void
.end method

.method public setDayOfMonth(I)V
    .registers 5

    .prologue
    .line 753
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->dayOfMonth()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 754
    return-void
.end method

.method public setDayOfWeek(I)V
    .registers 5

    .prologue
    .line 763
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->dayOfWeek()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 764
    return-void
.end method

.method public setDayOfYear(I)V
    .registers 5

    .prologue
    .line 743
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->dayOfYear()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 744
    return-void
.end method

.method public setHourOfDay(I)V
    .registers 5

    .prologue
    .line 786
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->hourOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 787
    return-void
.end method

.method public setMillis(J)V
    .registers 4

    .prologue
    .line 453
    iget v0, p0, Lorg/joda/time/MutableDateTime;->iRoundingMode:I

    packed-switch v0, :pswitch_data_2c

    .line 472
    :goto_5
    :pswitch_5
    invoke-super {p0, p1, p2}, Lorg/joda/time/base/BaseDateTime;->setMillis(J)V

    .line 473
    return-void

    .line 457
    :pswitch_9
    iget-object v0, p0, Lorg/joda/time/MutableDateTime;->iRoundingField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->roundFloor(J)J

    move-result-wide p1

    goto :goto_5

    .line 460
    :pswitch_10
    iget-object v0, p0, Lorg/joda/time/MutableDateTime;->iRoundingField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->roundCeiling(J)J

    move-result-wide p1

    goto :goto_5

    .line 463
    :pswitch_17
    iget-object v0, p0, Lorg/joda/time/MutableDateTime;->iRoundingField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->roundHalfFloor(J)J

    move-result-wide p1

    goto :goto_5

    .line 466
    :pswitch_1e
    iget-object v0, p0, Lorg/joda/time/MutableDateTime;->iRoundingField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->roundHalfCeiling(J)J

    move-result-wide p1

    goto :goto_5

    .line 469
    :pswitch_25
    iget-object v0, p0, Lorg/joda/time/MutableDateTime;->iRoundingField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->roundHalfEven(J)J

    move-result-wide p1

    goto :goto_5

    .line 453
    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_5
        :pswitch_9
        :pswitch_10
        :pswitch_17
        :pswitch_1e
        :pswitch_25
    .end packed-switch
.end method

.method public setMillis(Lorg/joda/time/ReadableInstant;)V
    .registers 4

    .prologue
    .line 484
    invoke-static {p1}, Lorg/joda/time/DateTimeUtils;->getInstantMillis(Lorg/joda/time/ReadableInstant;)J

    move-result-wide v0

    .line 485
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 486
    return-void
.end method

.method public setMillisOfDay(I)V
    .registers 5

    .prologue
    .line 875
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->millisOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 876
    return-void
.end method

.method public setMillisOfSecond(I)V
    .registers 5

    .prologue
    .line 885
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->millisOfSecond()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 886
    return-void
.end method

.method public setMinuteOfDay(I)V
    .registers 5

    .prologue
    .line 809
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->minuteOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 810
    return-void
.end method

.method public setMinuteOfHour(I)V
    .registers 5

    .prologue
    .line 819
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->minuteOfHour()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 820
    return-void
.end method

.method public setMonthOfYear(I)V
    .registers 5

    .prologue
    .line 697
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->monthOfYear()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 698
    return-void
.end method

.method public setRounding(Lorg/joda/time/DateTimeField;)V
    .registers 3

    .prologue
    .line 417
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lorg/joda/time/MutableDateTime;->setRounding(Lorg/joda/time/DateTimeField;I)V

    .line 418
    return-void
.end method

.method public setRounding(Lorg/joda/time/DateTimeField;I)V
    .registers 6

    .prologue
    .line 435
    if-eqz p1, :cond_20

    if-ltz p2, :cond_7

    const/4 v0, 0x5

    if-le p2, v0, :cond_20

    .line 436
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Illegal rounding mode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 438
    :cond_20
    if-nez p2, :cond_32

    const/4 v0, 0x0

    :goto_23
    iput-object v0, p0, Lorg/joda/time/MutableDateTime;->iRoundingField:Lorg/joda/time/DateTimeField;

    .line 439
    if-nez p1, :cond_28

    const/4 p2, 0x0

    :cond_28
    iput p2, p0, Lorg/joda/time/MutableDateTime;->iRoundingMode:I

    .line 440
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 441
    return-void

    :cond_32
    move-object v0, p1

    .line 438
    goto :goto_23
.end method

.method public setSecondOfDay(I)V
    .registers 5

    .prologue
    .line 842
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->secondOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 843
    return-void
.end method

.method public setSecondOfMinute(I)V
    .registers 5

    .prologue
    .line 852
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->secondOfMinute()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 853
    return-void
.end method

.method public setTime(IIII)V
    .registers 12

    .prologue
    .line 1000
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-virtual/range {v0 .. v6}, Lorg/joda/time/Chronology;->getDateTimeMillis(JIIII)J

    move-result-wide v0

    .line 1002
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 1003
    return-void
.end method

.method public setTime(J)V
    .registers 7

    .prologue
    .line 964
    invoke-static {}, Lorg/joda/time/chrono/ISOChronology;->getInstanceUTC()Lorg/joda/time/chrono/ISOChronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/chrono/ISOChronology;->millisOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v0

    .line 965
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->millisOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3, v0}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 966
    return-void
.end method

.method public setTime(Lorg/joda/time/ReadableInstant;)V
    .registers 6

    .prologue
    .line 976
    invoke-static {p1}, Lorg/joda/time/DateTimeUtils;->getInstantMillis(Lorg/joda/time/ReadableInstant;)J

    move-result-wide v0

    .line 977
    invoke-static {p1}, Lorg/joda/time/DateTimeUtils;->getInstantChronology(Lorg/joda/time/ReadableInstant;)Lorg/joda/time/Chronology;

    move-result-object v2

    .line 978
    invoke-virtual {v2}, Lorg/joda/time/Chronology;->getZone()Lorg/joda/time/DateTimeZone;

    move-result-object v2

    .line 979
    if-eqz v2, :cond_14

    .line 980
    sget-object v3, Lorg/joda/time/DateTimeZone;->UTC:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v2, v3, v0, v1}, Lorg/joda/time/DateTimeZone;->getMillisKeepLocal(Lorg/joda/time/DateTimeZone;J)J

    move-result-wide v0

    .line 982
    :cond_14
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setTime(J)V

    .line 983
    return-void
.end method

.method public setWeekOfWeekyear(I)V
    .registers 5

    .prologue
    .line 720
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->weekOfWeekyear()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 721
    return-void
.end method

.method public setWeekyear(I)V
    .registers 5

    .prologue
    .line 674
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->weekyear()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 675
    return-void
.end method

.method public setYear(I)V
    .registers 5

    .prologue
    .line 651
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->year()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    .line 652
    return-void
.end method

.method public setZone(Lorg/joda/time/DateTimeZone;)V
    .registers 5

    .prologue
    .line 581
    invoke-static {p1}, Lorg/joda/time/DateTimeUtils;->getZone(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/DateTimeZone;

    move-result-object v0

    .line 582
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    .line 583
    invoke-virtual {v1}, Lorg/joda/time/Chronology;->getZone()Lorg/joda/time/DateTimeZone;

    move-result-object v2

    if-eq v2, v0, :cond_15

    .line 584
    invoke-virtual {v1, v0}, Lorg/joda/time/Chronology;->withZone(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/joda/time/MutableDateTime;->setChronology(Lorg/joda/time/Chronology;)V

    .line 586
    :cond_15
    return-void
.end method

.method public setZoneRetainFields(Lorg/joda/time/DateTimeZone;)V
    .registers 6

    .prologue
    .line 600
    invoke-static {p1}, Lorg/joda/time/DateTimeUtils;->getZone(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/DateTimeZone;

    move-result-object v0

    .line 601
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getZone()Lorg/joda/time/DateTimeZone;

    move-result-object v1

    invoke-static {v1}, Lorg/joda/time/DateTimeUtils;->getZone(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/DateTimeZone;

    move-result-object v1

    .line 602
    if-ne v0, v1, :cond_f

    .line 609
    :goto_e
    return-void

    .line 606
    :cond_f
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getMillis()J

    move-result-wide v2

    invoke-virtual {v1, v0, v2, v3}, Lorg/joda/time/DateTimeZone;->getMillisKeepLocal(Lorg/joda/time/DateTimeZone;J)J

    move-result-wide v1

    .line 607
    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v3

    invoke-virtual {v3, v0}, Lorg/joda/time/Chronology;->withZone(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/joda/time/MutableDateTime;->setChronology(Lorg/joda/time/Chronology;)V

    .line 608
    invoke-virtual {p0, v1, v2}, Lorg/joda/time/MutableDateTime;->setMillis(J)V

    goto :goto_e
.end method

.method public weekOfWeekyear()Lorg/joda/time/MutableDateTime$Property;
    .registers 3

    .prologue
    .line 1119
    new-instance v0, Lorg/joda/time/MutableDateTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->weekOfWeekyear()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/MutableDateTime$Property;-><init>(Lorg/joda/time/MutableDateTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public weekyear()Lorg/joda/time/MutableDateTime$Property;
    .registers 3

    .prologue
    .line 1101
    new-instance v0, Lorg/joda/time/MutableDateTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->weekyear()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/MutableDateTime$Property;-><init>(Lorg/joda/time/MutableDateTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public year()Lorg/joda/time/MutableDateTime$Property;
    .registers 3

    .prologue
    .line 1092
    new-instance v0, Lorg/joda/time/MutableDateTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->year()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/MutableDateTime$Property;-><init>(Lorg/joda/time/MutableDateTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public yearOfCentury()Lorg/joda/time/MutableDateTime$Property;
    .registers 3

    .prologue
    .line 1074
    new-instance v0, Lorg/joda/time/MutableDateTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->yearOfCentury()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/MutableDateTime$Property;-><init>(Lorg/joda/time/MutableDateTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public yearOfEra()Lorg/joda/time/MutableDateTime$Property;
    .registers 3

    .prologue
    .line 1083
    new-instance v0, Lorg/joda/time/MutableDateTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/MutableDateTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->yearOfEra()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/MutableDateTime$Property;-><init>(Lorg/joda/time/MutableDateTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method
