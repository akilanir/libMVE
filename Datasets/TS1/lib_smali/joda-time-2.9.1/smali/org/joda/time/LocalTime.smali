.class public final Lorg/joda/time/LocalTime;
.super Lorg/joda/time/base/BaseLocal;
.source "LocalTime.java"

# interfaces
.implements Lorg/joda/time/ReadablePartial;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/joda/time/LocalTime$Property;
    }
.end annotation


# static fields
.field private static final HOUR_OF_DAY:I = 0x0

.field public static final MIDNIGHT:Lorg/joda/time/LocalTime;

.field private static final MILLIS_OF_SECOND:I = 0x3

.field private static final MINUTE_OF_HOUR:I = 0x1

.field private static final SECOND_OF_MINUTE:I = 0x2

.field private static final TIME_DURATION_TYPES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/joda/time/DurationFieldType;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = -0xbb5440d6211L


# instance fields
.field private final iChronology:Lorg/joda/time/Chronology;

.field private final iLocalMillis:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 84
    new-instance v0, Lorg/joda/time/LocalTime;

    invoke-direct {v0, v1, v1, v1, v1}, Lorg/joda/time/LocalTime;-><init>(IIII)V

    sput-object v0, Lorg/joda/time/LocalTime;->MIDNIGHT:Lorg/joda/time/LocalTime;

    .line 95
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lorg/joda/time/LocalTime;->TIME_DURATION_TYPES:Ljava/util/Set;

    .line 97
    sget-object v0, Lorg/joda/time/LocalTime;->TIME_DURATION_TYPES:Ljava/util/Set;

    invoke-static {}, Lorg/joda/time/DurationFieldType;->millis()Lorg/joda/time/DurationFieldType;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 98
    sget-object v0, Lorg/joda/time/LocalTime;->TIME_DURATION_TYPES:Ljava/util/Set;

    invoke-static {}, Lorg/joda/time/DurationFieldType;->seconds()Lorg/joda/time/DurationFieldType;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 99
    sget-object v0, Lorg/joda/time/LocalTime;->TIME_DURATION_TYPES:Ljava/util/Set;

    invoke-static {}, Lorg/joda/time/DurationFieldType;->minutes()Lorg/joda/time/DurationFieldType;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 100
    sget-object v0, Lorg/joda/time/LocalTime;->TIME_DURATION_TYPES:Ljava/util/Set;

    invoke-static {}, Lorg/joda/time/DurationFieldType;->hours()Lorg/joda/time/DurationFieldType;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 101
    return-void
.end method

.method public constructor <init>()V
    .registers 4

    .prologue
    .line 288
    invoke-static {}, Lorg/joda/time/DateTimeUtils;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {}, Lorg/joda/time/chrono/ISOChronology;->getInstance()Lorg/joda/time/chrono/ISOChronology;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lorg/joda/time/LocalTime;-><init>(JLorg/joda/time/Chronology;)V

    .line 289
    return-void
.end method

.method public constructor <init>(II)V
    .registers 9

    .prologue
    const/4 v3, 0x0

    .line 450
    invoke-static {}, Lorg/joda/time/chrono/ISOChronology;->getInstanceUTC()Lorg/joda/time/chrono/ISOChronology;

    move-result-object v5

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v4, v3

    invoke-direct/range {v0 .. v5}, Lorg/joda/time/LocalTime;-><init>(IIIILorg/joda/time/Chronology;)V

    .line 451
    return-void
.end method

.method public constructor <init>(III)V
    .registers 10

    .prologue
    .line 465
    const/4 v4, 0x0

    invoke-static {}, Lorg/joda/time/chrono/ISOChronology;->getInstanceUTC()Lorg/joda/time/chrono/ISOChronology;

    move-result-object v5

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/joda/time/LocalTime;-><init>(IIIILorg/joda/time/Chronology;)V

    .line 466
    return-void
.end method

.method public constructor <init>(IIII)V
    .registers 11

    .prologue
    .line 482
    invoke-static {}, Lorg/joda/time/chrono/ISOChronology;->getInstanceUTC()Lorg/joda/time/chrono/ISOChronology;

    move-result-object v5

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/joda/time/LocalTime;-><init>(IIIILorg/joda/time/Chronology;)V

    .line 484
    return-void
.end method

.method public constructor <init>(IIIILorg/joda/time/Chronology;)V
    .registers 13

    .prologue
    .line 504
    invoke-direct {p0}, Lorg/joda/time/base/BaseLocal;-><init>()V

    .line 505
    invoke-static {p5}, Lorg/joda/time/DateTimeUtils;->getChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->withUTC()Lorg/joda/time/Chronology;

    move-result-object v0

    .line 506
    const-wide/16 v1, 0x0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-virtual/range {v0 .. v6}, Lorg/joda/time/Chronology;->getDateTimeMillis(JIIII)J

    move-result-wide v1

    .line 508
    iput-object v0, p0, Lorg/joda/time/LocalTime;->iChronology:Lorg/joda/time/Chronology;

    .line 509
    iput-wide v1, p0, Lorg/joda/time/LocalTime;->iLocalMillis:J

    .line 510
    return-void
.end method

.method public constructor <init>(J)V
    .registers 4

    .prologue
    .line 329
    invoke-static {}, Lorg/joda/time/chrono/ISOChronology;->getInstance()Lorg/joda/time/chrono/ISOChronology;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lorg/joda/time/LocalTime;-><init>(JLorg/joda/time/Chronology;)V

    .line 330
    return-void
.end method

.method public constructor <init>(JLorg/joda/time/Chronology;)V
    .registers 8

    .prologue
    .line 356
    invoke-direct {p0}, Lorg/joda/time/base/BaseLocal;-><init>()V

    .line 357
    invoke-static {p3}, Lorg/joda/time/DateTimeUtils;->getChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v0

    .line 359
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->getZone()Lorg/joda/time/DateTimeZone;

    move-result-object v1

    sget-object v2, Lorg/joda/time/DateTimeZone;->UTC:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v1, v2, p1, p2}, Lorg/joda/time/DateTimeZone;->getMillisKeepLocal(Lorg/joda/time/DateTimeZone;J)J

    move-result-wide v1

    .line 360
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->withUTC()Lorg/joda/time/Chronology;

    move-result-object v0

    .line 361
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->millisOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v1

    int-to-long v1, v1

    iput-wide v1, p0, Lorg/joda/time/LocalTime;->iLocalMillis:J

    .line 362
    iput-object v0, p0, Lorg/joda/time/LocalTime;->iChronology:Lorg/joda/time/Chronology;

    .line 363
    return-void
.end method

.method public constructor <init>(JLorg/joda/time/DateTimeZone;)V
    .registers 5

    .prologue
    .line 343
    invoke-static {p3}, Lorg/joda/time/chrono/ISOChronology;->getInstance(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/chrono/ISOChronology;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lorg/joda/time/LocalTime;-><init>(JLorg/joda/time/Chronology;)V

    .line 344
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3

    .prologue
    .line 383
    const/4 v0, 0x0

    check-cast v0, Lorg/joda/time/Chronology;

    invoke-direct {p0, p1, v0}, Lorg/joda/time/LocalTime;-><init>(Ljava/lang/Object;Lorg/joda/time/Chronology;)V

    .line 384
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Lorg/joda/time/Chronology;)V
    .registers 11

    .prologue
    .line 430
    invoke-direct {p0}, Lorg/joda/time/base/BaseLocal;-><init>()V

    .line 431
    invoke-static {}, Lorg/joda/time/convert/ConverterManager;->getInstance()Lorg/joda/time/convert/ConverterManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/joda/time/convert/ConverterManager;->getPartialConverter(Ljava/lang/Object;)Lorg/joda/time/convert/PartialConverter;

    move-result-object v0

    .line 432
    invoke-interface {v0, p1, p2}, Lorg/joda/time/convert/PartialConverter;->getChronology(Ljava/lang/Object;Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v1

    .line 433
    invoke-static {v1}, Lorg/joda/time/DateTimeUtils;->getChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v1

    .line 434
    invoke-virtual {v1}, Lorg/joda/time/Chronology;->withUTC()Lorg/joda/time/Chronology;

    move-result-object v2

    iput-object v2, p0, Lorg/joda/time/LocalTime;->iChronology:Lorg/joda/time/Chronology;

    .line 435
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat;->localTimeParser()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v2

    invoke-interface {v0, p0, p1, v1, v2}, Lorg/joda/time/convert/PartialConverter;->getPartialValues(Lorg/joda/time/ReadablePartial;Ljava/lang/Object;Lorg/joda/time/Chronology;Lorg/joda/time/format/DateTimeFormatter;)[I

    move-result-object v6

    .line 436
    iget-object v0, p0, Lorg/joda/time/LocalTime;->iChronology:Lorg/joda/time/Chronology;

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    aget v3, v6, v3

    const/4 v4, 0x1

    aget v4, v6, v4

    const/4 v5, 0x2

    aget v5, v6, v5

    const/4 v7, 0x3

    aget v6, v6, v7

    invoke-virtual/range {v0 .. v6}, Lorg/joda/time/Chronology;->getDateTimeMillis(JIIII)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/joda/time/LocalTime;->iLocalMillis:J

    .line 437
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Lorg/joda/time/DateTimeZone;)V
    .registers 11

    .prologue
    .line 404
    invoke-direct {p0}, Lorg/joda/time/base/BaseLocal;-><init>()V

    .line 405
    invoke-static {}, Lorg/joda/time/convert/ConverterManager;->getInstance()Lorg/joda/time/convert/ConverterManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/joda/time/convert/ConverterManager;->getPartialConverter(Ljava/lang/Object;)Lorg/joda/time/convert/PartialConverter;

    move-result-object v0

    .line 406
    invoke-interface {v0, p1, p2}, Lorg/joda/time/convert/PartialConverter;->getChronology(Ljava/lang/Object;Lorg/joda/time/DateTimeZone;)Lorg/joda/time/Chronology;

    move-result-object v1

    .line 407
    invoke-static {v1}, Lorg/joda/time/DateTimeUtils;->getChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v1

    .line 408
    invoke-virtual {v1}, Lorg/joda/time/Chronology;->withUTC()Lorg/joda/time/Chronology;

    move-result-object v2

    iput-object v2, p0, Lorg/joda/time/LocalTime;->iChronology:Lorg/joda/time/Chronology;

    .line 409
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat;->localTimeParser()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v2

    invoke-interface {v0, p0, p1, v1, v2}, Lorg/joda/time/convert/PartialConverter;->getPartialValues(Lorg/joda/time/ReadablePartial;Ljava/lang/Object;Lorg/joda/time/Chronology;Lorg/joda/time/format/DateTimeFormatter;)[I

    move-result-object v6

    .line 410
    iget-object v0, p0, Lorg/joda/time/LocalTime;->iChronology:Lorg/joda/time/Chronology;

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    aget v3, v6, v3

    const/4 v4, 0x1

    aget v4, v6, v4

    const/4 v5, 0x2

    aget v5, v6, v5

    const/4 v7, 0x3

    aget v6, v6, v7

    invoke-virtual/range {v0 .. v6}, Lorg/joda/time/Chronology;->getDateTimeMillis(JIIII)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/joda/time/LocalTime;->iLocalMillis:J

    .line 411
    return-void
.end method

.method public constructor <init>(Lorg/joda/time/Chronology;)V
    .registers 4

    .prologue
    .line 316
    invoke-static {}, Lorg/joda/time/DateTimeUtils;->currentTimeMillis()J

    move-result-wide v0

    invoke-direct {p0, v0, v1, p1}, Lorg/joda/time/LocalTime;-><init>(JLorg/joda/time/Chronology;)V

    .line 317
    return-void
.end method

.method public constructor <init>(Lorg/joda/time/DateTimeZone;)V
    .registers 5

    .prologue
    .line 302
    invoke-static {}, Lorg/joda/time/DateTimeUtils;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {p1}, Lorg/joda/time/chrono/ISOChronology;->getInstance(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/chrono/ISOChronology;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lorg/joda/time/LocalTime;-><init>(JLorg/joda/time/Chronology;)V

    .line 303
    return-void
.end method

.method public static fromCalendarFields(Ljava/util/Calendar;)Lorg/joda/time/LocalTime;
    .registers 6

    .prologue
    .line 234
    if-nez p0, :cond_a

    .line 235
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The calendar must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 237
    :cond_a
    new-instance v0, Lorg/joda/time/LocalTime;

    const/16 v1, 0xb

    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    const/16 v2, 0xc

    invoke-virtual {p0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v2

    const/16 v3, 0xd

    invoke-virtual {p0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/16 v4, 0xe

    invoke-virtual {p0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/joda/time/LocalTime;-><init>(IIII)V

    return-object v0
.end method

.method public static fromDateFields(Ljava/util/Date;)Lorg/joda/time/LocalTime;
    .registers 9

    .prologue
    .line 267
    if-nez p0, :cond_a

    .line 268
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 270
    :cond_a
    new-instance v0, Lorg/joda/time/LocalTime;

    invoke-virtual {p0}, Ljava/util/Date;->getHours()I

    move-result v1

    invoke-virtual {p0}, Ljava/util/Date;->getMinutes()I

    move-result v2

    invoke-virtual {p0}, Ljava/util/Date;->getSeconds()I

    move-result v3

    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    rem-long/2addr v4, v6

    long-to-int v4, v4

    add-int/lit16 v4, v4, 0x3e8

    rem-int/lit16 v4, v4, 0x3e8

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/joda/time/LocalTime;-><init>(IIII)V

    return-object v0
.end method

.method public static fromMillisOfDay(J)Lorg/joda/time/LocalTime;
    .registers 3

    .prologue
    .line 190
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/joda/time/LocalTime;->fromMillisOfDay(JLorg/joda/time/Chronology;)Lorg/joda/time/LocalTime;

    move-result-object v0

    return-object v0
.end method

.method public static fromMillisOfDay(JLorg/joda/time/Chronology;)Lorg/joda/time/LocalTime;
    .registers 5

    .prologue
    .line 205
    invoke-static {p2}, Lorg/joda/time/DateTimeUtils;->getChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->withUTC()Lorg/joda/time/Chronology;

    move-result-object v0

    .line 206
    new-instance v1, Lorg/joda/time/LocalTime;

    invoke-direct {v1, p0, p1, v0}, Lorg/joda/time/LocalTime;-><init>(JLorg/joda/time/Chronology;)V

    return-object v1
.end method

.method public static now()Lorg/joda/time/LocalTime;
    .registers 1

    .prologue
    .line 118
    new-instance v0, Lorg/joda/time/LocalTime;

    invoke-direct {v0}, Lorg/joda/time/LocalTime;-><init>()V

    return-object v0
.end method

.method public static now(Lorg/joda/time/Chronology;)Lorg/joda/time/LocalTime;
    .registers 3

    .prologue
    .line 147
    if-nez p0, :cond_a

    .line 148
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Chronology must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 150
    :cond_a
    new-instance v0, Lorg/joda/time/LocalTime;

    invoke-direct {v0, p0}, Lorg/joda/time/LocalTime;-><init>(Lorg/joda/time/Chronology;)V

    return-object v0
.end method

.method public static now(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/LocalTime;
    .registers 3

    .prologue
    .line 131
    if-nez p0, :cond_a

    .line 132
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Zone must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 134
    :cond_a
    new-instance v0, Lorg/joda/time/LocalTime;

    invoke-direct {v0, p0}, Lorg/joda/time/LocalTime;-><init>(Lorg/joda/time/DateTimeZone;)V

    return-object v0
.end method

.method public static parse(Ljava/lang/String;)Lorg/joda/time/LocalTime;
    .registers 2
    .annotation runtime Lorg/joda/convert/FromString;
    .end annotation

    .prologue
    .line 164
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat;->localTimeParser()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/joda/time/LocalTime;->parse(Ljava/lang/String;Lorg/joda/time/format/DateTimeFormatter;)Lorg/joda/time/LocalTime;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/lang/String;Lorg/joda/time/format/DateTimeFormatter;)Lorg/joda/time/LocalTime;
    .registers 3

    .prologue
    .line 175
    invoke-virtual {p1, p0}, Lorg/joda/time/format/DateTimeFormatter;->parseLocalTime(Ljava/lang/String;)Lorg/joda/time/LocalTime;

    move-result-object v0

    return-object v0
.end method

.method private readResolve()Ljava/lang/Object;
    .registers 5

    .prologue
    .line 517
    iget-object v0, p0, Lorg/joda/time/LocalTime;->iChronology:Lorg/joda/time/Chronology;

    if-nez v0, :cond_11

    .line 518
    new-instance v0, Lorg/joda/time/LocalTime;

    iget-wide v1, p0, Lorg/joda/time/LocalTime;->iLocalMillis:J

    invoke-static {}, Lorg/joda/time/chrono/ISOChronology;->getInstanceUTC()Lorg/joda/time/chrono/ISOChronology;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lorg/joda/time/LocalTime;-><init>(JLorg/joda/time/Chronology;)V

    move-object p0, v0

    .line 523
    :cond_10
    :goto_10
    return-object p0

    .line 520
    :cond_11
    sget-object v0, Lorg/joda/time/DateTimeZone;->UTC:Lorg/joda/time/DateTimeZone;

    iget-object v1, p0, Lorg/joda/time/LocalTime;->iChronology:Lorg/joda/time/Chronology;

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->getZone()Lorg/joda/time/DateTimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/joda/time/DateTimeZone;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 521
    new-instance v0, Lorg/joda/time/LocalTime;

    iget-wide v1, p0, Lorg/joda/time/LocalTime;->iLocalMillis:J

    iget-object v3, p0, Lorg/joda/time/LocalTime;->iChronology:Lorg/joda/time/Chronology;

    invoke-virtual {v3}, Lorg/joda/time/Chronology;->withUTC()Lorg/joda/time/Chronology;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lorg/joda/time/LocalTime;-><init>(JLorg/joda/time/Chronology;)V

    move-object p0, v0

    goto :goto_10
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3

    .prologue
    .line 76
    check-cast p1, Lorg/joda/time/ReadablePartial;

    invoke-virtual {p0, p1}, Lorg/joda/time/LocalTime;->compareTo(Lorg/joda/time/ReadablePartial;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/joda/time/ReadablePartial;)I
    .registers 8

    .prologue
    const/4 v1, 0x0

    .line 712
    if-ne p0, p1, :cond_4

    .line 723
    :goto_3
    return v1

    .line 715
    :cond_4
    instance-of v0, p1, Lorg/joda/time/LocalTime;

    if-eqz v0, :cond_2c

    move-object v0, p1

    .line 716
    check-cast v0, Lorg/joda/time/LocalTime;

    .line 717
    iget-object v2, p0, Lorg/joda/time/LocalTime;->iChronology:Lorg/joda/time/Chronology;

    iget-object v3, v0, Lorg/joda/time/LocalTime;->iChronology:Lorg/joda/time/Chronology;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 718
    iget-wide v2, p0, Lorg/joda/time/LocalTime;->iLocalMillis:J

    iget-wide v4, v0, Lorg/joda/time/LocalTime;->iLocalMillis:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_20

    const/4 v0, -0x1

    :goto_1e
    move v1, v0

    goto :goto_3

    :cond_20
    iget-wide v2, p0, Lorg/joda/time/LocalTime;->iLocalMillis:J

    iget-wide v4, v0, Lorg/joda/time/LocalTime;->iLocalMillis:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_2a

    move v0, v1

    goto :goto_1e

    :cond_2a
    const/4 v0, 0x1

    goto :goto_1e

    .line 723
    :cond_2c
    invoke-super {p0, p1}, Lorg/joda/time/base/BaseLocal;->compareTo(Lorg/joda/time/ReadablePartial;)I

    move-result v1

    goto :goto_3
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 8

    .prologue
    const/4 v1, 0x1

    .line 682
    if-ne p0, p1, :cond_4

    .line 691
    :goto_3
    return v1

    .line 685
    :cond_4
    instance-of v0, p1, Lorg/joda/time/LocalTime;

    if-eqz v0, :cond_22

    move-object v0, p1

    .line 686
    check-cast v0, Lorg/joda/time/LocalTime;

    .line 687
    iget-object v2, p0, Lorg/joda/time/LocalTime;->iChronology:Lorg/joda/time/Chronology;

    iget-object v3, v0, Lorg/joda/time/LocalTime;->iChronology:Lorg/joda/time/Chronology;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_22

    .line 688
    iget-wide v2, p0, Lorg/joda/time/LocalTime;->iLocalMillis:J

    iget-wide v4, v0, Lorg/joda/time/LocalTime;->iLocalMillis:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_20

    move v0, v1

    :goto_1e
    move v1, v0

    goto :goto_3

    :cond_20
    const/4 v0, 0x0

    goto :goto_1e

    .line 691
    :cond_22
    invoke-super {p0, p1}, Lorg/joda/time/base/BaseLocal;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_3
.end method

.method public get(Lorg/joda/time/DateTimeFieldType;)I
    .registers 5

    .prologue
    .line 604
    if-nez p1, :cond_a

    .line 605
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The DateTimeFieldType must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 607
    :cond_a
    invoke-virtual {p0, p1}, Lorg/joda/time/LocalTime;->isSupported(Lorg/joda/time/DateTimeFieldType;)Z

    move-result v0

    if-nez v0, :cond_2f

    .line 608
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

    .line 610
    :cond_2f
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/joda/time/DateTimeFieldType;->getField(Lorg/joda/time/Chronology;)Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v0

    return v0
.end method

.method public getChronology()Lorg/joda/time/Chronology;
    .registers 2

    .prologue
    .line 669
    iget-object v0, p0, Lorg/joda/time/LocalTime;->iChronology:Lorg/joda/time/Chronology;

    return-object v0
.end method

.method protected getField(ILorg/joda/time/Chronology;)Lorg/joda/time/DateTimeField;
    .registers 6

    .prologue
    .line 548
    packed-switch p1, :pswitch_data_30

    .line 558
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 550
    :pswitch_1c
    invoke-virtual {p2}, Lorg/joda/time/Chronology;->hourOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    .line 556
    :goto_20
    return-object v0

    .line 552
    :pswitch_21
    invoke-virtual {p2}, Lorg/joda/time/Chronology;->minuteOfHour()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_20

    .line 554
    :pswitch_26
    invoke-virtual {p2}, Lorg/joda/time/Chronology;->secondOfMinute()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_20

    .line 556
    :pswitch_2b
    invoke-virtual {p2}, Lorg/joda/time/Chronology;->millisOfSecond()Lorg/joda/time/DateTimeField;

    move-result-object v0

    goto :goto_20

    .line 548
    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_21
        :pswitch_26
        :pswitch_2b
    .end packed-switch
.end method

.method public getHourOfDay()I
    .registers 4

    .prologue
    .line 1100
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->hourOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v0

    return v0
.end method

.method protected getLocalMillis()J
    .registers 3

    .prologue
    .line 660
    iget-wide v0, p0, Lorg/joda/time/LocalTime;->iLocalMillis:J

    return-wide v0
.end method

.method public getMillisOfDay()I
    .registers 4

    .prologue
    .line 1136
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->millisOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v0

    return v0
.end method

.method public getMillisOfSecond()I
    .registers 4

    .prologue
    .line 1127
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->millisOfSecond()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v0

    return v0
.end method

.method public getMinuteOfHour()I
    .registers 4

    .prologue
    .line 1109
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->minuteOfHour()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v0

    return v0
.end method

.method public getSecondOfMinute()I
    .registers 4

    .prologue
    .line 1118
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->secondOfMinute()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v0

    return v0
.end method

.method public getValue(I)I
    .registers 5

    .prologue
    .line 574
    packed-switch p1, :pswitch_data_60

    .line 584
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 576
    :pswitch_1c
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->hourOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v0

    .line 582
    :goto_2c
    return v0

    .line 578
    :pswitch_2d
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->minuteOfHour()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v0

    goto :goto_2c

    .line 580
    :pswitch_3e
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->secondOfMinute()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v0

    goto :goto_2c

    .line 582
    :pswitch_4f
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->millisOfSecond()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v0

    goto :goto_2c

    .line 574
    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_2d
        :pswitch_3e
        :pswitch_4f
    .end packed-switch
.end method

.method public hourOfDay()Lorg/joda/time/LocalTime$Property;
    .registers 3

    .prologue
    .line 1222
    new-instance v0, Lorg/joda/time/LocalTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->hourOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/LocalTime$Property;-><init>(Lorg/joda/time/LocalTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public isSupported(Lorg/joda/time/DateTimeFieldType;)Z
    .registers 5

    .prologue
    const/4 v0, 0x0

    .line 622
    if-nez p1, :cond_4

    .line 629
    :cond_3
    :goto_3
    return v0

    .line 625
    :cond_4
    invoke-virtual {p1}, Lorg/joda/time/DateTimeFieldType;->getDurationType()Lorg/joda/time/DurationFieldType;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/joda/time/LocalTime;->isSupported(Lorg/joda/time/DurationFieldType;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 628
    invoke-virtual {p1}, Lorg/joda/time/DateTimeFieldType;->getRangeDurationType()Lorg/joda/time/DurationFieldType;

    move-result-object v1

    .line 629
    invoke-virtual {p0, v1}, Lorg/joda/time/LocalTime;->isSupported(Lorg/joda/time/DurationFieldType;)Z

    move-result v2

    if-nez v2, :cond_1e

    invoke-static {}, Lorg/joda/time/DurationFieldType;->days()Lorg/joda/time/DurationFieldType;

    move-result-object v2

    if-ne v1, v2, :cond_3

    :cond_1e
    const/4 v0, 0x1

    goto :goto_3
.end method

.method public isSupported(Lorg/joda/time/DurationFieldType;)Z
    .registers 8

    .prologue
    const/4 v0, 0x0

    .line 640
    if-nez p1, :cond_4

    .line 648
    :cond_3
    :goto_3
    return v0

    .line 643
    :cond_4
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/joda/time/DurationFieldType;->getField(Lorg/joda/time/Chronology;)Lorg/joda/time/DurationField;

    move-result-object v1

    .line 644
    sget-object v2, Lorg/joda/time/LocalTime;->TIME_DURATION_TYPES:Ljava/util/Set;

    invoke-interface {v2, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_28

    invoke-virtual {v1}, Lorg/joda/time/DurationField;->getUnitMillis()J

    move-result-wide v2

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v4

    invoke-virtual {v4}, Lorg/joda/time/Chronology;->days()Lorg/joda/time/DurationField;

    move-result-object v4

    invoke-virtual {v4}, Lorg/joda/time/DurationField;->getUnitMillis()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-gez v2, :cond_3

    .line 646
    :cond_28
    invoke-virtual {v1}, Lorg/joda/time/DurationField;->isSupported()Z

    move-result v0

    goto :goto_3
.end method

.method public millisOfDay()Lorg/joda/time/LocalTime$Property;
    .registers 3

    .prologue
    .line 1258
    new-instance v0, Lorg/joda/time/LocalTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->millisOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/LocalTime$Property;-><init>(Lorg/joda/time/LocalTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public millisOfSecond()Lorg/joda/time/LocalTime$Property;
    .registers 3

    .prologue
    .line 1249
    new-instance v0, Lorg/joda/time/LocalTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->millisOfSecond()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/LocalTime$Property;-><init>(Lorg/joda/time/LocalTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public minus(Lorg/joda/time/ReadablePeriod;)Lorg/joda/time/LocalTime;
    .registers 3

    .prologue
    .line 978
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Lorg/joda/time/LocalTime;->withPeriodAdded(Lorg/joda/time/ReadablePeriod;I)Lorg/joda/time/LocalTime;

    move-result-object v0

    return-object v0
.end method

.method public minusHours(I)Lorg/joda/time/LocalTime;
    .registers 5

    .prologue
    .line 998
    if-nez p1, :cond_3

    .line 1002
    :goto_2
    return-object p0

    .line 1001
    :cond_3
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->hours()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DurationField;->subtract(JI)J

    move-result-wide v0

    .line 1002
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/LocalTime;->withLocalMillis(J)Lorg/joda/time/LocalTime;

    move-result-object p0

    goto :goto_2
.end method

.method public minusMillis(I)Lorg/joda/time/LocalTime;
    .registers 5

    .prologue
    .line 1067
    if-nez p1, :cond_3

    .line 1071
    :goto_2
    return-object p0

    .line 1070
    :cond_3
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->millis()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DurationField;->subtract(JI)J

    move-result-wide v0

    .line 1071
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/LocalTime;->withLocalMillis(J)Lorg/joda/time/LocalTime;

    move-result-object p0

    goto :goto_2
.end method

.method public minusMinutes(I)Lorg/joda/time/LocalTime;
    .registers 5

    .prologue
    .line 1021
    if-nez p1, :cond_3

    .line 1025
    :goto_2
    return-object p0

    .line 1024
    :cond_3
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->minutes()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DurationField;->subtract(JI)J

    move-result-wide v0

    .line 1025
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/LocalTime;->withLocalMillis(J)Lorg/joda/time/LocalTime;

    move-result-object p0

    goto :goto_2
.end method

.method public minusSeconds(I)Lorg/joda/time/LocalTime;
    .registers 5

    .prologue
    .line 1044
    if-nez p1, :cond_3

    .line 1048
    :goto_2
    return-object p0

    .line 1047
    :cond_3
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->seconds()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DurationField;->subtract(JI)J

    move-result-wide v0

    .line 1048
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/LocalTime;->withLocalMillis(J)Lorg/joda/time/LocalTime;

    move-result-object p0

    goto :goto_2
.end method

.method public minuteOfHour()Lorg/joda/time/LocalTime$Property;
    .registers 3

    .prologue
    .line 1231
    new-instance v0, Lorg/joda/time/LocalTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->minuteOfHour()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/LocalTime$Property;-><init>(Lorg/joda/time/LocalTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public plus(Lorg/joda/time/ReadablePeriod;)Lorg/joda/time/LocalTime;
    .registers 3

    .prologue
    .line 867
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lorg/joda/time/LocalTime;->withPeriodAdded(Lorg/joda/time/ReadablePeriod;I)Lorg/joda/time/LocalTime;

    move-result-object v0

    return-object v0
.end method

.method public plusHours(I)Lorg/joda/time/LocalTime;
    .registers 5

    .prologue
    .line 887
    if-nez p1, :cond_3

    .line 891
    :goto_2
    return-object p0

    .line 890
    :cond_3
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->hours()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DurationField;->add(JI)J

    move-result-wide v0

    .line 891
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/LocalTime;->withLocalMillis(J)Lorg/joda/time/LocalTime;

    move-result-object p0

    goto :goto_2
.end method

.method public plusMillis(I)Lorg/joda/time/LocalTime;
    .registers 5

    .prologue
    .line 956
    if-nez p1, :cond_3

    .line 960
    :goto_2
    return-object p0

    .line 959
    :cond_3
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->millis()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DurationField;->add(JI)J

    move-result-wide v0

    .line 960
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/LocalTime;->withLocalMillis(J)Lorg/joda/time/LocalTime;

    move-result-object p0

    goto :goto_2
.end method

.method public plusMinutes(I)Lorg/joda/time/LocalTime;
    .registers 5

    .prologue
    .line 910
    if-nez p1, :cond_3

    .line 914
    :goto_2
    return-object p0

    .line 913
    :cond_3
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->minutes()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DurationField;->add(JI)J

    move-result-wide v0

    .line 914
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/LocalTime;->withLocalMillis(J)Lorg/joda/time/LocalTime;

    move-result-object p0

    goto :goto_2
.end method

.method public plusSeconds(I)Lorg/joda/time/LocalTime;
    .registers 5

    .prologue
    .line 933
    if-nez p1, :cond_3

    .line 937
    :goto_2
    return-object p0

    .line 936
    :cond_3
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->seconds()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DurationField;->add(JI)J

    move-result-wide v0

    .line 937
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/LocalTime;->withLocalMillis(J)Lorg/joda/time/LocalTime;

    move-result-object p0

    goto :goto_2
.end method

.method public property(Lorg/joda/time/DateTimeFieldType;)Lorg/joda/time/LocalTime$Property;
    .registers 5

    .prologue
    .line 1084
    if-nez p1, :cond_a

    .line 1085
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The DateTimeFieldType must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1087
    :cond_a
    invoke-virtual {p0, p1}, Lorg/joda/time/LocalTime;->isSupported(Lorg/joda/time/DateTimeFieldType;)Z

    move-result v0

    if-nez v0, :cond_2f

    .line 1088
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

    .line 1090
    :cond_2f
    new-instance v0, Lorg/joda/time/LocalTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/joda/time/DateTimeFieldType;->getField(Lorg/joda/time/Chronology;)Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/LocalTime$Property;-><init>(Lorg/joda/time/LocalTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public secondOfMinute()Lorg/joda/time/LocalTime$Property;
    .registers 3

    .prologue
    .line 1240
    new-instance v0, Lorg/joda/time/LocalTime$Property;

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/Chronology;->secondOfMinute()Lorg/joda/time/DateTimeField;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/joda/time/LocalTime$Property;-><init>(Lorg/joda/time/LocalTime;Lorg/joda/time/DateTimeField;)V

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 535
    const/4 v0, 0x4

    return v0
.end method

.method public toDateTimeToday()Lorg/joda/time/DateTime;
    .registers 2

    .prologue
    .line 1270
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/joda/time/LocalTime;->toDateTimeToday(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/DateTime;

    move-result-object v0

    return-object v0
.end method

.method public toDateTimeToday(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/DateTime;
    .registers 6

    .prologue
    .line 1285
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/joda/time/Chronology;->withZone(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/Chronology;

    move-result-object v0

    .line 1286
    invoke-static {}, Lorg/joda/time/DateTimeUtils;->currentTimeMillis()J

    move-result-wide v1

    .line 1287
    invoke-virtual {v0, p0, v1, v2}, Lorg/joda/time/Chronology;->set(Lorg/joda/time/ReadablePartial;J)J

    move-result-wide v1

    .line 1288
    new-instance v3, Lorg/joda/time/DateTime;

    invoke-direct {v3, v1, v2, v0}, Lorg/joda/time/DateTime;-><init>(JLorg/joda/time/Chronology;)V

    return-object v3
.end method

.method public toString()Ljava/lang/String;
    .registers 2
    .annotation runtime Lorg/joda/convert/ToString;
    .end annotation

    .prologue
    .line 1299
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat;->time()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/joda/time/format/DateTimeFormatter;->print(Lorg/joda/time/ReadablePartial;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .prologue
    .line 1309
    if-nez p1, :cond_7

    .line 1310
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1312
    :goto_6
    return-object v0

    :cond_7
    invoke-static {p1}, Lorg/joda/time/format/DateTimeFormat;->forPattern(Ljava/lang/String;)Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/joda/time/format/DateTimeFormatter;->print(Lorg/joda/time/ReadablePartial;)Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public toString(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 1323
    if-nez p1, :cond_7

    .line 1324
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1326
    :goto_6
    return-object v0

    :cond_7
    invoke-static {p1}, Lorg/joda/time/format/DateTimeFormat;->forPattern(Ljava/lang/String;)Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/joda/time/format/DateTimeFormatter;->withLocale(Ljava/util/Locale;)Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/joda/time/format/DateTimeFormatter;->print(Lorg/joda/time/ReadablePartial;)Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public withField(Lorg/joda/time/DateTimeFieldType;I)Lorg/joda/time/LocalTime;
    .registers 6

    .prologue
    .line 782
    if-nez p1, :cond_a

    .line 783
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Field must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 785
    :cond_a
    invoke-virtual {p0, p1}, Lorg/joda/time/LocalTime;->isSupported(Lorg/joda/time/DateTimeFieldType;)Z

    move-result v0

    if-nez v0, :cond_2f

    .line 786
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

    .line 788
    :cond_2f
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/joda/time/DateTimeFieldType;->getField(Lorg/joda/time/Chronology;)Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p2}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    .line 789
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/LocalTime;->withLocalMillis(J)Lorg/joda/time/LocalTime;

    move-result-object v0

    return-object v0
.end method

.method public withFieldAdded(Lorg/joda/time/DurationFieldType;I)Lorg/joda/time/LocalTime;
    .registers 6

    .prologue
    .line 815
    if-nez p1, :cond_a

    .line 816
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Field must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 818
    :cond_a
    invoke-virtual {p0, p1}, Lorg/joda/time/LocalTime;->isSupported(Lorg/joda/time/DurationFieldType;)Z

    move-result v0

    if-nez v0, :cond_2f

    .line 819
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

    .line 821
    :cond_2f
    if-nez p2, :cond_32

    .line 825
    :goto_31
    return-object p0

    .line 824
    :cond_32
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/joda/time/DurationFieldType;->getField(Lorg/joda/time/Chronology;)Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p2}, Lorg/joda/time/DurationField;->add(JI)J

    move-result-wide v0

    .line 825
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/LocalTime;->withLocalMillis(J)Lorg/joda/time/LocalTime;

    move-result-object p0

    goto :goto_31
.end method

.method public withFields(Lorg/joda/time/ReadablePartial;)Lorg/joda/time/LocalTime;
    .registers 5

    .prologue
    .line 756
    if-nez p1, :cond_3

    .line 759
    :goto_2
    return-object p0

    :cond_3
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, p1, v1, v2}, Lorg/joda/time/Chronology;->set(Lorg/joda/time/ReadablePartial;J)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/LocalTime;->withLocalMillis(J)Lorg/joda/time/LocalTime;

    move-result-object p0

    goto :goto_2
.end method

.method public withHourOfDay(I)Lorg/joda/time/LocalTime;
    .registers 5

    .prologue
    .line 1152
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->hourOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/LocalTime;->withLocalMillis(J)Lorg/joda/time/LocalTime;

    move-result-object v0

    return-object v0
.end method

.method withLocalMillis(J)Lorg/joda/time/LocalTime;
    .registers 5

    .prologue
    .line 738
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v0

    cmp-long v0, p1, v0

    if-nez v0, :cond_9

    :goto_8
    return-object p0

    :cond_9
    new-instance v0, Lorg/joda/time/LocalTime;

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-direct {v0, p1, p2, v1}, Lorg/joda/time/LocalTime;-><init>(JLorg/joda/time/Chronology;)V

    move-object p0, v0

    goto :goto_8
.end method

.method public withMillisOfDay(I)Lorg/joda/time/LocalTime;
    .registers 5

    .prologue
    .line 1212
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->millisOfDay()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/LocalTime;->withLocalMillis(J)Lorg/joda/time/LocalTime;

    move-result-object v0

    return-object v0
.end method

.method public withMillisOfSecond(I)Lorg/joda/time/LocalTime;
    .registers 5

    .prologue
    .line 1197
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->millisOfSecond()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/LocalTime;->withLocalMillis(J)Lorg/joda/time/LocalTime;

    move-result-object v0

    return-object v0
.end method

.method public withMinuteOfHour(I)Lorg/joda/time/LocalTime;
    .registers 5

    .prologue
    .line 1167
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->minuteOfHour()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/LocalTime;->withLocalMillis(J)Lorg/joda/time/LocalTime;

    move-result-object v0

    return-object v0
.end method

.method public withPeriodAdded(Lorg/joda/time/ReadablePeriod;I)Lorg/joda/time/LocalTime;
    .registers 6

    .prologue
    .line 845
    if-eqz p1, :cond_4

    if-nez p2, :cond_5

    .line 849
    :cond_4
    :goto_4
    return-object p0

    .line 848
    :cond_5
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, p1, v1, v2, p2}, Lorg/joda/time/Chronology;->add(Lorg/joda/time/ReadablePeriod;JI)J

    move-result-wide v0

    .line 849
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/LocalTime;->withLocalMillis(J)Lorg/joda/time/LocalTime;

    move-result-object p0

    goto :goto_4
.end method

.method public withSecondOfMinute(I)Lorg/joda/time/LocalTime;
    .registers 5

    .prologue
    .line 1182
    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->secondOfMinute()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {p0}, Lorg/joda/time/LocalTime;->getLocalMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/LocalTime;->withLocalMillis(J)Lorg/joda/time/LocalTime;

    move-result-object v0

    return-object v0
.end method
