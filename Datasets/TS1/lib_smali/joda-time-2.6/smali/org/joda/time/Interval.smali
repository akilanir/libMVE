.class public final Lorg/joda/time/Interval;
.super Lorg/joda/time/base/BaseInterval;
.source "Interval.java"

# interfaces
.implements Lorg/joda/time/ReadableInterval;
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x44500feba8e6e200L


# direct methods
.method public constructor <init>(JJ)V
    .registers 11

    .prologue
    .line 82
    const/4 v5, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-wide v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/joda/time/base/BaseInterval;-><init>(JJLorg/joda/time/Chronology;)V

    .line 83
    return-void
.end method

.method public constructor <init>(JJLorg/joda/time/Chronology;)V
    .registers 6

    .prologue
    .line 109
    invoke-direct/range {p0 .. p5}, Lorg/joda/time/base/BaseInterval;-><init>(JJLorg/joda/time/Chronology;)V

    .line 110
    return-void
.end method

.method public constructor <init>(JJLorg/joda/time/DateTimeZone;)V
    .registers 12

    .prologue
    .line 96
    invoke-static {p5}, Lorg/joda/time/chrono/ISOChronology;->getInstance(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/chrono/ISOChronology;

    move-result-object v5

    move-object v0, p0

    move-wide v1, p1

    move-wide v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/joda/time/base/BaseInterval;-><init>(JJLorg/joda/time/Chronology;)V

    .line 97
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3

    .prologue
    .line 193
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/joda/time/base/BaseInterval;-><init>(Ljava/lang/Object;Lorg/joda/time/Chronology;)V

    .line 194
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Lorg/joda/time/Chronology;)V
    .registers 3

    .prologue
    .line 212
    invoke-direct {p0, p1, p2}, Lorg/joda/time/base/BaseInterval;-><init>(Ljava/lang/Object;Lorg/joda/time/Chronology;)V

    .line 213
    return-void
.end method

.method public constructor <init>(Lorg/joda/time/ReadableDuration;Lorg/joda/time/ReadableInstant;)V
    .registers 3

    .prologue
    .line 146
    invoke-direct {p0, p1, p2}, Lorg/joda/time/base/BaseInterval;-><init>(Lorg/joda/time/ReadableDuration;Lorg/joda/time/ReadableInstant;)V

    .line 147
    return-void
.end method

.method public constructor <init>(Lorg/joda/time/ReadableInstant;Lorg/joda/time/ReadableDuration;)V
    .registers 3

    .prologue
    .line 134
    invoke-direct {p0, p1, p2}, Lorg/joda/time/base/BaseInterval;-><init>(Lorg/joda/time/ReadableInstant;Lorg/joda/time/ReadableDuration;)V

    .line 135
    return-void
.end method

.method public constructor <init>(Lorg/joda/time/ReadableInstant;Lorg/joda/time/ReadableInstant;)V
    .registers 3

    .prologue
    .line 122
    invoke-direct {p0, p1, p2}, Lorg/joda/time/base/BaseInterval;-><init>(Lorg/joda/time/ReadableInstant;Lorg/joda/time/ReadableInstant;)V

    .line 123
    return-void
.end method

.method public constructor <init>(Lorg/joda/time/ReadableInstant;Lorg/joda/time/ReadablePeriod;)V
    .registers 3

    .prologue
    .line 161
    invoke-direct {p0, p1, p2}, Lorg/joda/time/base/BaseInterval;-><init>(Lorg/joda/time/ReadableInstant;Lorg/joda/time/ReadablePeriod;)V

    .line 162
    return-void
.end method

.method public constructor <init>(Lorg/joda/time/ReadablePeriod;Lorg/joda/time/ReadableInstant;)V
    .registers 3

    .prologue
    .line 176
    invoke-direct {p0, p1, p2}, Lorg/joda/time/base/BaseInterval;-><init>(Lorg/joda/time/ReadablePeriod;Lorg/joda/time/ReadableInstant;)V

    .line 177
    return-void
.end method

.method public static parse(Ljava/lang/String;)Lorg/joda/time/Interval;
    .registers 2

    .prologue
    .line 69
    new-instance v0, Lorg/joda/time/Interval;

    invoke-direct {v0, p0}, Lorg/joda/time/Interval;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public abuts(Lorg/joda/time/ReadableInterval;)Z
    .registers 8

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 338
    if-nez p1, :cond_1a

    .line 339
    invoke-static {}, Lorg/joda/time/DateTimeUtils;->currentTimeMillis()J

    move-result-wide v2

    .line 340
    invoke-virtual {p0}, Lorg/joda/time/Interval;->getStartMillis()J

    move-result-wide v4

    cmp-long v4, v4, v2

    if-eqz v4, :cond_18

    invoke-virtual {p0}, Lorg/joda/time/Interval;->getEndMillis()J

    move-result-wide v4

    cmp-long v2, v4, v2

    if-nez v2, :cond_19

    :cond_18
    move v0, v1

    .line 342
    :cond_19
    :goto_19
    return v0

    :cond_1a
    invoke-interface {p1}, Lorg/joda/time/ReadableInterval;->getEndMillis()J

    move-result-wide v2

    invoke-virtual {p0}, Lorg/joda/time/Interval;->getStartMillis()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-eqz v2, :cond_32

    invoke-virtual {p0}, Lorg/joda/time/Interval;->getEndMillis()J

    move-result-wide v2

    invoke-interface {p1}, Lorg/joda/time/ReadableInterval;->getStartMillis()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_19

    :cond_32
    move v0, v1

    goto :goto_19
.end method

.method public gap(Lorg/joda/time/ReadableInterval;)Lorg/joda/time/Interval;
    .registers 12

    .prologue
    .line 286
    invoke-static {p1}, Lorg/joda/time/DateTimeUtils;->getReadableInterval(Lorg/joda/time/ReadableInterval;)Lorg/joda/time/ReadableInterval;

    move-result-object v0

    .line 287
    invoke-interface {v0}, Lorg/joda/time/ReadableInterval;->getStartMillis()J

    move-result-wide v6

    .line 288
    invoke-interface {v0}, Lorg/joda/time/ReadableInterval;->getEndMillis()J

    move-result-wide v1

    .line 289
    invoke-virtual {p0}, Lorg/joda/time/Interval;->getStartMillis()J

    move-result-wide v3

    .line 290
    invoke-virtual {p0}, Lorg/joda/time/Interval;->getEndMillis()J

    move-result-wide v8

    .line 291
    cmp-long v0, v3, v1

    if-lez v0, :cond_22

    .line 292
    new-instance v0, Lorg/joda/time/Interval;

    invoke-virtual {p0}, Lorg/joda/time/Interval;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lorg/joda/time/Interval;-><init>(JJLorg/joda/time/Chronology;)V

    .line 296
    :goto_21
    return-object v0

    .line 293
    :cond_22
    cmp-long v0, v6, v8

    if-lez v0, :cond_32

    .line 294
    new-instance v0, Lorg/joda/time/Interval;

    invoke-virtual {p0}, Lorg/joda/time/Interval;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v5

    move-wide v1, v8

    move-wide v3, v6

    invoke-direct/range {v0 .. v5}, Lorg/joda/time/Interval;-><init>(JJLorg/joda/time/Chronology;)V

    goto :goto_21

    .line 296
    :cond_32
    const/4 v0, 0x0

    goto :goto_21
.end method

.method public overlap(Lorg/joda/time/ReadableInterval;)Lorg/joda/time/Interval;
    .registers 9

    .prologue
    .line 251
    invoke-static {p1}, Lorg/joda/time/DateTimeUtils;->getReadableInterval(Lorg/joda/time/ReadableInterval;)Lorg/joda/time/ReadableInterval;

    move-result-object v0

    .line 252
    invoke-virtual {p0, v0}, Lorg/joda/time/Interval;->overlaps(Lorg/joda/time/ReadableInterval;)Z

    move-result v1

    if-nez v1, :cond_c

    .line 253
    const/4 v0, 0x0

    .line 257
    :goto_b
    return-object v0

    .line 255
    :cond_c
    invoke-virtual {p0}, Lorg/joda/time/Interval;->getStartMillis()J

    move-result-wide v1

    invoke-interface {v0}, Lorg/joda/time/ReadableInterval;->getStartMillis()J

    move-result-wide v3

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    .line 256
    invoke-virtual {p0}, Lorg/joda/time/Interval;->getEndMillis()J

    move-result-wide v3

    invoke-interface {v0}, Lorg/joda/time/ReadableInterval;->getEndMillis()J

    move-result-wide v5

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    .line 257
    new-instance v0, Lorg/joda/time/Interval;

    invoke-virtual {p0}, Lorg/joda/time/Interval;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lorg/joda/time/Interval;-><init>(JJLorg/joda/time/Chronology;)V

    goto :goto_b
.end method

.method public toInterval()Lorg/joda/time/Interval;
    .registers 1

    .prologue
    .line 223
    return-object p0
.end method

.method public withChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Interval;
    .registers 8

    .prologue
    .line 355
    invoke-virtual {p0}, Lorg/joda/time/Interval;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    if-ne v0, p1, :cond_7

    .line 358
    :goto_6
    return-object p0

    :cond_7
    new-instance v0, Lorg/joda/time/Interval;

    invoke-virtual {p0}, Lorg/joda/time/Interval;->getStartMillis()J

    move-result-wide v1

    invoke-virtual {p0}, Lorg/joda/time/Interval;->getEndMillis()J

    move-result-wide v3

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lorg/joda/time/Interval;-><init>(JJLorg/joda/time/Chronology;)V

    move-object p0, v0

    goto :goto_6
.end method

.method public withDurationAfterStart(Lorg/joda/time/ReadableDuration;)Lorg/joda/time/Interval;
    .registers 11

    .prologue
    .line 422
    invoke-static {p1}, Lorg/joda/time/DateTimeUtils;->getDurationMillis(Lorg/joda/time/ReadableDuration;)J

    move-result-wide v3

    .line 423
    invoke-virtual {p0}, Lorg/joda/time/Interval;->toDurationMillis()J

    move-result-wide v0

    cmp-long v0, v3, v0

    if-nez v0, :cond_d

    .line 429
    :goto_c
    return-object p0

    .line 426
    :cond_d
    invoke-virtual {p0}, Lorg/joda/time/Interval;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    .line 427
    invoke-virtual {p0}, Lorg/joda/time/Interval;->getStartMillis()J

    move-result-wide v1

    .line 428
    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v5}, Lorg/joda/time/Chronology;->add(JJI)J

    move-result-wide v6

    .line 429
    new-instance v3, Lorg/joda/time/Interval;

    move-wide v4, v1

    move-object v8, v0

    invoke-direct/range {v3 .. v8}, Lorg/joda/time/Interval;-><init>(JJLorg/joda/time/Chronology;)V

    move-object p0, v3

    goto :goto_c
.end method

.method public withDurationBeforeEnd(Lorg/joda/time/ReadableDuration;)Lorg/joda/time/Interval;
    .registers 11

    .prologue
    .line 440
    invoke-static {p1}, Lorg/joda/time/DateTimeUtils;->getDurationMillis(Lorg/joda/time/ReadableDuration;)J

    move-result-wide v3

    .line 441
    invoke-virtual {p0}, Lorg/joda/time/Interval;->toDurationMillis()J

    move-result-wide v0

    cmp-long v0, v3, v0

    if-nez v0, :cond_d

    .line 447
    :goto_c
    return-object p0

    .line 444
    :cond_d
    invoke-virtual {p0}, Lorg/joda/time/Interval;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    .line 445
    invoke-virtual {p0}, Lorg/joda/time/Interval;->getEndMillis()J

    move-result-wide v1

    .line 446
    const/4 v5, -0x1

    invoke-virtual/range {v0 .. v5}, Lorg/joda/time/Chronology;->add(JJI)J

    move-result-wide v4

    .line 447
    new-instance v3, Lorg/joda/time/Interval;

    move-wide v6, v1

    move-object v8, v0

    invoke-direct/range {v3 .. v8}, Lorg/joda/time/Interval;-><init>(JJLorg/joda/time/Chronology;)V

    move-object p0, v3

    goto :goto_c
.end method

.method public withEnd(Lorg/joda/time/ReadableInstant;)Lorg/joda/time/Interval;
    .registers 4

    .prologue
    .line 409
    invoke-static {p1}, Lorg/joda/time/DateTimeUtils;->getInstantMillis(Lorg/joda/time/ReadableInstant;)J

    move-result-wide v0

    .line 410
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/Interval;->withEndMillis(J)Lorg/joda/time/Interval;

    move-result-object v0

    return-object v0
.end method

.method public withEndMillis(J)Lorg/joda/time/Interval;
    .registers 9

    .prologue
    .line 395
    invoke-virtual {p0}, Lorg/joda/time/Interval;->getEndMillis()J

    move-result-wide v0

    cmp-long v0, p1, v0

    if-nez v0, :cond_9

    .line 398
    :goto_8
    return-object p0

    :cond_9
    new-instance v0, Lorg/joda/time/Interval;

    invoke-virtual {p0}, Lorg/joda/time/Interval;->getStartMillis()J

    move-result-wide v1

    invoke-virtual {p0}, Lorg/joda/time/Interval;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v5

    move-wide v3, p1

    invoke-direct/range {v0 .. v5}, Lorg/joda/time/Interval;-><init>(JJLorg/joda/time/Chronology;)V

    move-object p0, v0

    goto :goto_8
.end method

.method public withPeriodAfterStart(Lorg/joda/time/ReadablePeriod;)Lorg/joda/time/Interval;
    .registers 8

    .prologue
    .line 459
    if-nez p1, :cond_8

    .line 460
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/joda/time/Interval;->withDurationAfterStart(Lorg/joda/time/ReadableDuration;)Lorg/joda/time/Interval;

    move-result-object v0

    .line 465
    :goto_7
    return-object v0

    .line 462
    :cond_8
    invoke-virtual {p0}, Lorg/joda/time/Interval;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v5

    .line 463
    invoke-virtual {p0}, Lorg/joda/time/Interval;->getStartMillis()J

    move-result-wide v1

    .line 464
    const/4 v0, 0x1

    invoke-virtual {v5, p1, v1, v2, v0}, Lorg/joda/time/Chronology;->add(Lorg/joda/time/ReadablePeriod;JI)J

    move-result-wide v3

    .line 465
    new-instance v0, Lorg/joda/time/Interval;

    invoke-direct/range {v0 .. v5}, Lorg/joda/time/Interval;-><init>(JJLorg/joda/time/Chronology;)V

    goto :goto_7
.end method

.method public withPeriodBeforeEnd(Lorg/joda/time/ReadablePeriod;)Lorg/joda/time/Interval;
    .registers 8

    .prologue
    .line 476
    if-nez p1, :cond_8

    .line 477
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/joda/time/Interval;->withDurationBeforeEnd(Lorg/joda/time/ReadableDuration;)Lorg/joda/time/Interval;

    move-result-object v0

    .line 482
    :goto_7
    return-object v0

    .line 479
    :cond_8
    invoke-virtual {p0}, Lorg/joda/time/Interval;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v5

    .line 480
    invoke-virtual {p0}, Lorg/joda/time/Interval;->getEndMillis()J

    move-result-wide v3

    .line 481
    const/4 v0, -0x1

    invoke-virtual {v5, p1, v3, v4, v0}, Lorg/joda/time/Chronology;->add(Lorg/joda/time/ReadablePeriod;JI)J

    move-result-wide v1

    .line 482
    new-instance v0, Lorg/joda/time/Interval;

    invoke-direct/range {v0 .. v5}, Lorg/joda/time/Interval;-><init>(JJLorg/joda/time/Chronology;)V

    goto :goto_7
.end method

.method public withStart(Lorg/joda/time/ReadableInstant;)Lorg/joda/time/Interval;
    .registers 4

    .prologue
    .line 383
    invoke-static {p1}, Lorg/joda/time/DateTimeUtils;->getInstantMillis(Lorg/joda/time/ReadableInstant;)J

    move-result-wide v0

    .line 384
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/Interval;->withStartMillis(J)Lorg/joda/time/Interval;

    move-result-object v0

    return-object v0
.end method

.method public withStartMillis(J)Lorg/joda/time/Interval;
    .registers 9

    .prologue
    .line 369
    invoke-virtual {p0}, Lorg/joda/time/Interval;->getStartMillis()J

    move-result-wide v0

    cmp-long v0, p1, v0

    if-nez v0, :cond_9

    .line 372
    :goto_8
    return-object p0

    :cond_9
    new-instance v0, Lorg/joda/time/Interval;

    invoke-virtual {p0}, Lorg/joda/time/Interval;->getEndMillis()J

    move-result-wide v3

    invoke-virtual {p0}, Lorg/joda/time/Interval;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v5

    move-wide v1, p1

    invoke-direct/range {v0 .. v5}, Lorg/joda/time/Interval;-><init>(JJLorg/joda/time/Chronology;)V

    move-object p0, v0

    goto :goto_8
.end method
