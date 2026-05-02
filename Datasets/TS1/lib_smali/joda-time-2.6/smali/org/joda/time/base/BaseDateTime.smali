.class public abstract Lorg/joda/time/base/BaseDateTime;
.super Lorg/joda/time/base/AbstractDateTime;
.source "BaseDateTime.java"

# interfaces
.implements Lorg/joda/time/ReadableDateTime;
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x61eb0a2d15dL


# instance fields
.field private volatile iChronology:Lorg/joda/time/Chronology;

.field private volatile iMillis:J


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    .line 61
    invoke-static {}, Lorg/joda/time/DateTimeUtils;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {}, Lorg/joda/time/chrono/ISOChronology;->getInstance()Lorg/joda/time/chrono/ISOChronology;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lorg/joda/time/base/BaseDateTime;-><init>(JLorg/joda/time/Chronology;)V

    .line 62
    return-void
.end method

.method public constructor <init>(IIIIIII)V
    .registers 17

    .prologue
    .line 199
    invoke-static {}, Lorg/joda/time/chrono/ISOChronology;->getInstance()Lorg/joda/time/chrono/ISOChronology;

    move-result-object v8

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move/from16 v7, p7

    invoke-direct/range {v0 .. v8}, Lorg/joda/time/base/BaseDateTime;-><init>(IIIIIIILorg/joda/time/Chronology;)V

    .line 201
    return-void
.end method

.method public constructor <init>(IIIIIIILorg/joda/time/Chronology;)V
    .registers 18

    .prologue
    .line 256
    invoke-direct {p0}, Lorg/joda/time/base/AbstractDateTime;-><init>()V

    .line 257
    move-object/from16 v0, p8

    invoke-virtual {p0, v0}, Lorg/joda/time/base/BaseDateTime;->checkChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v1

    iput-object v1, p0, Lorg/joda/time/base/BaseDateTime;->iChronology:Lorg/joda/time/Chronology;

    .line 258
    iget-object v1, p0, Lorg/joda/time/base/BaseDateTime;->iChronology:Lorg/joda/time/Chronology;

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    move/from16 v8, p7

    invoke-virtual/range {v1 .. v8}, Lorg/joda/time/Chronology;->getDateTimeMillis(IIIIIII)J

    move-result-wide v1

    .line 260
    iget-object v3, p0, Lorg/joda/time/base/BaseDateTime;->iChronology:Lorg/joda/time/Chronology;

    invoke-virtual {p0, v1, v2, v3}, Lorg/joda/time/base/BaseDateTime;->checkInstant(JLorg/joda/time/Chronology;)J

    move-result-wide v1

    iput-wide v1, p0, Lorg/joda/time/base/BaseDateTime;->iMillis:J

    .line 261
    return-void
.end method

.method public constructor <init>(IIIIIIILorg/joda/time/DateTimeZone;)V
    .registers 18

    .prologue
    .line 227
    invoke-static/range {p8 .. p8}, Lorg/joda/time/chrono/ISOChronology;->getInstance(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/chrono/ISOChronology;

    move-result-object v8

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move/from16 v7, p7

    invoke-direct/range {v0 .. v8}, Lorg/joda/time/base/BaseDateTime;-><init>(IIIIIIILorg/joda/time/Chronology;)V

    .line 229
    return-void
.end method

.method public constructor <init>(J)V
    .registers 4

    .prologue
    .line 97
    invoke-static {}, Lorg/joda/time/chrono/ISOChronology;->getInstance()Lorg/joda/time/chrono/ISOChronology;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lorg/joda/time/base/BaseDateTime;-><init>(JLorg/joda/time/Chronology;)V

    .line 98
    return-void
.end method

.method public constructor <init>(JLorg/joda/time/Chronology;)V
    .registers 10

    .prologue
    .line 124
    invoke-direct {p0}, Lorg/joda/time/base/AbstractDateTime;-><init>()V

    .line 125
    invoke-virtual {p0, p3}, Lorg/joda/time/base/BaseDateTime;->checkChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v0

    iput-object v0, p0, Lorg/joda/time/base/BaseDateTime;->iChronology:Lorg/joda/time/Chronology;

    .line 126
    iget-object v0, p0, Lorg/joda/time/base/BaseDateTime;->iChronology:Lorg/joda/time/Chronology;

    invoke-virtual {p0, p1, p2, v0}, Lorg/joda/time/base/BaseDateTime;->checkInstant(JLorg/joda/time/Chronology;)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/joda/time/base/BaseDateTime;->iMillis:J

    .line 128
    iget-object v0, p0, Lorg/joda/time/base/BaseDateTime;->iChronology:Lorg/joda/time/Chronology;

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->year()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/DateTimeField;->isSupported()Z

    move-result v0

    if-eqz v0, :cond_34

    .line 129
    iget-object v0, p0, Lorg/joda/time/base/BaseDateTime;->iChronology:Lorg/joda/time/Chronology;

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->year()Lorg/joda/time/DateTimeField;

    move-result-object v0

    iget-wide v1, p0, Lorg/joda/time/base/BaseDateTime;->iMillis:J

    iget-object v3, p0, Lorg/joda/time/base/BaseDateTime;->iChronology:Lorg/joda/time/Chronology;

    invoke-virtual {v3}, Lorg/joda/time/Chronology;->year()Lorg/joda/time/DateTimeField;

    move-result-object v3

    iget-wide v4, p0, Lorg/joda/time/base/BaseDateTime;->iMillis:J

    invoke-virtual {v3, v4, v5}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Lorg/joda/time/DateTimeField;->set(JI)J

    .line 131
    :cond_34
    return-void
.end method

.method public constructor <init>(JLorg/joda/time/DateTimeZone;)V
    .registers 5

    .prologue
    .line 110
    invoke-static {p3}, Lorg/joda/time/chrono/ISOChronology;->getInstance(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/chrono/ISOChronology;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lorg/joda/time/base/BaseDateTime;-><init>(JLorg/joda/time/Chronology;)V

    .line 111
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Lorg/joda/time/Chronology;)V
    .registers 6

    .prologue
    .line 172
    invoke-direct {p0}, Lorg/joda/time/base/AbstractDateTime;-><init>()V

    .line 173
    invoke-static {}, Lorg/joda/time/convert/ConverterManager;->getInstance()Lorg/joda/time/convert/ConverterManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/joda/time/convert/ConverterManager;->getInstantConverter(Ljava/lang/Object;)Lorg/joda/time/convert/InstantConverter;

    move-result-object v0

    .line 174
    invoke-interface {v0, p1, p2}, Lorg/joda/time/convert/InstantConverter;->getChronology(Ljava/lang/Object;Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/joda/time/base/BaseDateTime;->checkChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v1

    iput-object v1, p0, Lorg/joda/time/base/BaseDateTime;->iChronology:Lorg/joda/time/Chronology;

    .line 175
    invoke-interface {v0, p1, p2}, Lorg/joda/time/convert/InstantConverter;->getInstantMillis(Ljava/lang/Object;Lorg/joda/time/Chronology;)J

    move-result-wide v0

    iget-object v2, p0, Lorg/joda/time/base/BaseDateTime;->iChronology:Lorg/joda/time/Chronology;

    invoke-virtual {p0, v0, v1, v2}, Lorg/joda/time/base/BaseDateTime;->checkInstant(JLorg/joda/time/Chronology;)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/joda/time/base/BaseDateTime;->iMillis:J

    .line 176
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Lorg/joda/time/DateTimeZone;)V
    .registers 7

    .prologue
    .line 150
    invoke-direct {p0}, Lorg/joda/time/base/AbstractDateTime;-><init>()V

    .line 151
    invoke-static {}, Lorg/joda/time/convert/ConverterManager;->getInstance()Lorg/joda/time/convert/ConverterManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/joda/time/convert/ConverterManager;->getInstantConverter(Ljava/lang/Object;)Lorg/joda/time/convert/InstantConverter;

    move-result-object v0

    .line 152
    invoke-interface {v0, p1, p2}, Lorg/joda/time/convert/InstantConverter;->getChronology(Ljava/lang/Object;Lorg/joda/time/DateTimeZone;)Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/joda/time/base/BaseDateTime;->checkChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v1

    .line 153
    iput-object v1, p0, Lorg/joda/time/base/BaseDateTime;->iChronology:Lorg/joda/time/Chronology;

    .line 154
    invoke-interface {v0, p1, v1}, Lorg/joda/time/convert/InstantConverter;->getInstantMillis(Ljava/lang/Object;Lorg/joda/time/Chronology;)J

    move-result-wide v2

    invoke-virtual {p0, v2, v3, v1}, Lorg/joda/time/base/BaseDateTime;->checkInstant(JLorg/joda/time/Chronology;)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/joda/time/base/BaseDateTime;->iMillis:J

    .line 155
    return-void
.end method

.method public constructor <init>(Lorg/joda/time/Chronology;)V
    .registers 4

    .prologue
    .line 86
    invoke-static {}, Lorg/joda/time/DateTimeUtils;->currentTimeMillis()J

    move-result-wide v0

    invoke-direct {p0, v0, v1, p1}, Lorg/joda/time/base/BaseDateTime;-><init>(JLorg/joda/time/Chronology;)V

    .line 87
    return-void
.end method

.method public constructor <init>(Lorg/joda/time/DateTimeZone;)V
    .registers 5

    .prologue
    .line 73
    invoke-static {}, Lorg/joda/time/DateTimeUtils;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {p1}, Lorg/joda/time/chrono/ISOChronology;->getInstance(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/chrono/ISOChronology;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lorg/joda/time/base/BaseDateTime;-><init>(JLorg/joda/time/Chronology;)V

    .line 74
    return-void
.end method


# virtual methods
.method protected checkChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;
    .registers 3

    .prologue
    .line 274
    invoke-static {p1}, Lorg/joda/time/DateTimeUtils;->getChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v0

    return-object v0
.end method

.method protected checkInstant(JLorg/joda/time/Chronology;)J
    .registers 4

    .prologue
    .line 288
    return-wide p1
.end method

.method public getChronology()Lorg/joda/time/Chronology;
    .registers 2

    .prologue
    .line 308
    iget-object v0, p0, Lorg/joda/time/base/BaseDateTime;->iChronology:Lorg/joda/time/Chronology;

    return-object v0
.end method

.method public getMillis()J
    .registers 3

    .prologue
    .line 299
    iget-wide v0, p0, Lorg/joda/time/base/BaseDateTime;->iMillis:J

    return-wide v0
.end method

.method protected setChronology(Lorg/joda/time/Chronology;)V
    .registers 3

    .prologue
    .line 333
    invoke-virtual {p0, p1}, Lorg/joda/time/base/BaseDateTime;->checkChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v0

    iput-object v0, p0, Lorg/joda/time/base/BaseDateTime;->iChronology:Lorg/joda/time/Chronology;

    .line 334
    return-void
.end method

.method protected setMillis(J)V
    .registers 5

    .prologue
    .line 321
    iget-object v0, p0, Lorg/joda/time/base/BaseDateTime;->iChronology:Lorg/joda/time/Chronology;

    invoke-virtual {p0, p1, p2, v0}, Lorg/joda/time/base/BaseDateTime;->checkInstant(JLorg/joda/time/Chronology;)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/joda/time/base/BaseDateTime;->iMillis:J

    .line 322
    return-void
.end method
