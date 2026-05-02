.class public abstract Lorg/joda/time/base/BaseSingleFieldPeriod;
.super Ljava/lang/Object;
.source "BaseSingleFieldPeriod.java"

# interfaces
.implements Lorg/joda/time/ReadablePeriod;
.implements Ljava/lang/Comparable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/joda/time/ReadablePeriod;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/joda/time/base/BaseSingleFieldPeriod;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final START_1972:J = 0xeaf625800L

.field private static final serialVersionUID:J = 0x8898d4e461cL


# instance fields
.field private volatile iPeriod:I


# direct methods
.method protected constructor <init>(I)V
    .registers 2

    .prologue
    .line 157
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 158
    iput p1, p0, Lorg/joda/time/base/BaseSingleFieldPeriod;->iPeriod:I

    .line 159
    return-void
.end method

.method protected static between(Lorg/joda/time/ReadableInstant;Lorg/joda/time/ReadableInstant;Lorg/joda/time/DurationFieldType;)I
    .registers 8

    .prologue
    .line 68
    if-eqz p0, :cond_4

    if-nez p1, :cond_c

    .line 69
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ReadableInstant objects must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 71
    :cond_c
    invoke-static {p0}, Lorg/joda/time/DateTimeUtils;->getInstantChronology(Lorg/joda/time/ReadableInstant;)Lorg/joda/time/Chronology;

    move-result-object v0

    .line 72
    invoke-virtual {p2, v0}, Lorg/joda/time/DurationFieldType;->getField(Lorg/joda/time/Chronology;)Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-interface {p1}, Lorg/joda/time/ReadableInstant;->getMillis()J

    move-result-wide v1

    invoke-interface {p0}, Lorg/joda/time/ReadableInstant;->getMillis()J

    move-result-wide v3

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/joda/time/DurationField;->getDifference(JJ)I

    move-result v0

    .line 73
    return v0
.end method

.method protected static between(Lorg/joda/time/ReadablePartial;Lorg/joda/time/ReadablePartial;Lorg/joda/time/ReadablePeriod;)I
    .registers 10

    .prologue
    const-wide v4, 0xeaf625800L

    const/4 v6, 0x0

    .line 90
    if-eqz p0, :cond_a

    if-nez p1, :cond_12

    .line 91
    :cond_a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ReadablePartial objects must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 93
    :cond_12
    invoke-interface {p0}, Lorg/joda/time/ReadablePartial;->size()I

    move-result v0

    invoke-interface {p1}, Lorg/joda/time/ReadablePartial;->size()I

    move-result v1

    if-eq v0, v1, :cond_24

    .line 94
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ReadablePartial objects must have the same set of fields"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 96
    :cond_24
    invoke-interface {p0}, Lorg/joda/time/ReadablePartial;->size()I

    move-result v1

    move v0, v6

    :goto_29
    if-ge v0, v1, :cond_40

    .line 97
    invoke-interface {p0, v0}, Lorg/joda/time/ReadablePartial;->getFieldType(I)Lorg/joda/time/DateTimeFieldType;

    move-result-object v2

    invoke-interface {p1, v0}, Lorg/joda/time/ReadablePartial;->getFieldType(I)Lorg/joda/time/DateTimeFieldType;

    move-result-object v3

    if-eq v2, v3, :cond_3d

    .line 98
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ReadablePartial objects must have the same set of fields"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 96
    :cond_3d
    add-int/lit8 v0, v0, 0x1

    goto :goto_29

    .line 101
    :cond_40
    invoke-static {p0}, Lorg/joda/time/DateTimeUtils;->isContiguous(Lorg/joda/time/ReadablePartial;)Z

    move-result v0

    if-nez v0, :cond_4e

    .line 102
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ReadablePartial objects must be contiguous"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 104
    :cond_4e
    invoke-interface {p0}, Lorg/joda/time/ReadablePartial;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-static {v0}, Lorg/joda/time/DateTimeUtils;->getChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->withUTC()Lorg/joda/time/Chronology;

    move-result-object v0

    .line 105
    invoke-virtual {v0, p0, v4, v5}, Lorg/joda/time/Chronology;->set(Lorg/joda/time/ReadablePartial;J)J

    move-result-wide v2

    invoke-virtual {v0, p1, v4, v5}, Lorg/joda/time/Chronology;->set(Lorg/joda/time/ReadablePartial;J)J

    move-result-wide v4

    move-object v1, p2

    invoke-virtual/range {v0 .. v5}, Lorg/joda/time/Chronology;->get(Lorg/joda/time/ReadablePeriod;JJ)[I

    move-result-object v0

    .line 106
    aget v0, v0, v6

    return v0
.end method

.method protected static standardPeriodIn(Lorg/joda/time/ReadablePeriod;J)I
    .registers 10

    .prologue
    const/4 v0, 0x0

    .line 130
    if-nez p0, :cond_4

    .line 147
    :goto_3
    return v0

    .line 133
    :cond_4
    invoke-static {}, Lorg/joda/time/chrono/ISOChronology;->getInstanceUTC()Lorg/joda/time/chrono/ISOChronology;

    move-result-object v3

    .line 134
    const-wide/16 v1, 0x0

    .line 135
    :goto_a
    invoke-interface {p0}, Lorg/joda/time/ReadablePeriod;->size()I

    move-result v4

    if-ge v0, v4, :cond_5a

    .line 136
    invoke-interface {p0, v0}, Lorg/joda/time/ReadablePeriod;->getValue(I)I

    move-result v4

    .line 137
    if-eqz v4, :cond_57

    .line 138
    invoke-interface {p0, v0}, Lorg/joda/time/ReadablePeriod;->getFieldType(I)Lorg/joda/time/DurationFieldType;

    move-result-object v5

    invoke-virtual {v5, v3}, Lorg/joda/time/DurationFieldType;->getField(Lorg/joda/time/Chronology;)Lorg/joda/time/DurationField;

    move-result-object v5

    .line 139
    invoke-virtual {v5}, Lorg/joda/time/DurationField;->isPrecise()Z

    move-result v6

    if-nez v6, :cond_4b

    .line 140
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot convert period to duration as "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v5}, Lorg/joda/time/DurationField;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not precise in the period "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 144
    :cond_4b
    invoke-virtual {v5}, Lorg/joda/time/DurationField;->getUnitMillis()J

    move-result-wide v5

    invoke-static {v5, v6, v4}, Lorg/joda/time/field/FieldUtils;->safeMultiply(JI)J

    move-result-wide v4

    invoke-static {v1, v2, v4, v5}, Lorg/joda/time/field/FieldUtils;->safeAdd(JJ)J

    move-result-wide v1

    .line 135
    :cond_57
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 147
    :cond_5a
    div-long v0, v1, p1

    invoke-static {v0, v1}, Lorg/joda/time/field/FieldUtils;->safeToInt(J)I

    move-result v0

    goto :goto_3
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3

    .prologue
    .line 46
    check-cast p1, Lorg/joda/time/base/BaseSingleFieldPeriod;

    invoke-virtual {p0, p1}, Lorg/joda/time/base/BaseSingleFieldPeriod;->compareTo(Lorg/joda/time/base/BaseSingleFieldPeriod;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/joda/time/base/BaseSingleFieldPeriod;)I
    .registers 5

    .prologue
    .line 332
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eq v0, v1, :cond_2f

    .line 333
    new-instance v0, Ljava/lang/ClassCastException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " cannot be compared to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 335
    :cond_2f
    invoke-virtual {p1}, Lorg/joda/time/base/BaseSingleFieldPeriod;->getValue()I

    move-result v0

    .line 336
    invoke-virtual {p0}, Lorg/joda/time/base/BaseSingleFieldPeriod;->getValue()I

    move-result v1

    .line 337
    if-le v1, v0, :cond_3b

    .line 338
    const/4 v0, 0x1

    .line 343
    :goto_3a
    return v0

    .line 340
    :cond_3b
    if-ge v1, v0, :cond_3f

    .line 341
    const/4 v0, -0x1

    goto :goto_3a

    .line 343
    :cond_3f
    const/4 v0, 0x0

    goto :goto_3a
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 301
    if-ne p0, p1, :cond_5

    .line 308
    :cond_4
    :goto_4
    return v0

    .line 304
    :cond_5
    instance-of v2, p1, Lorg/joda/time/ReadablePeriod;

    if-nez v2, :cond_b

    move v0, v1

    .line 305
    goto :goto_4

    .line 307
    :cond_b
    check-cast p1, Lorg/joda/time/ReadablePeriod;

    .line 308
    invoke-interface {p1}, Lorg/joda/time/ReadablePeriod;->getPeriodType()Lorg/joda/time/PeriodType;

    move-result-object v2

    invoke-virtual {p0}, Lorg/joda/time/base/BaseSingleFieldPeriod;->getPeriodType()Lorg/joda/time/PeriodType;

    move-result-object v3

    if-ne v2, v3, :cond_21

    invoke-interface {p1, v1}, Lorg/joda/time/ReadablePeriod;->getValue(I)I

    move-result v2

    invoke-virtual {p0}, Lorg/joda/time/base/BaseSingleFieldPeriod;->getValue()I

    move-result v3

    if-eq v2, v3, :cond_4

    :cond_21
    move v0, v1

    goto :goto_4
.end method

.method public get(Lorg/joda/time/DurationFieldType;)I
    .registers 3

    .prologue
    .line 249
    invoke-virtual {p0}, Lorg/joda/time/base/BaseSingleFieldPeriod;->getFieldType()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    if-ne p1, v0, :cond_b

    .line 250
    invoke-virtual {p0}, Lorg/joda/time/base/BaseSingleFieldPeriod;->getValue()I

    move-result v0

    .line 252
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public abstract getFieldType()Lorg/joda/time/DurationFieldType;
.end method

.method public getFieldType(I)Lorg/joda/time/DurationFieldType;
    .registers 4

    .prologue
    .line 217
    if-eqz p1, :cond_c

    .line 218
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 220
    :cond_c
    invoke-virtual {p0}, Lorg/joda/time/base/BaseSingleFieldPeriod;->getFieldType()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    return-object v0
.end method

.method public abstract getPeriodType()Lorg/joda/time/PeriodType;
.end method

.method protected getValue()I
    .registers 2

    .prologue
    .line 168
    iget v0, p0, Lorg/joda/time/base/BaseSingleFieldPeriod;->iPeriod:I

    return v0
.end method

.method public getValue(I)I
    .registers 4

    .prologue
    .line 233
    if-eqz p1, :cond_c

    .line 234
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 236
    :cond_c
    invoke-virtual {p0}, Lorg/joda/time/base/BaseSingleFieldPeriod;->getValue()I

    move-result v0

    return v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 317
    .line 318
    invoke-virtual {p0}, Lorg/joda/time/base/BaseSingleFieldPeriod;->getValue()I

    move-result v0

    add-int/lit16 v0, v0, 0x1cb

    .line 319
    mul-int/lit8 v0, v0, 0x1b

    invoke-virtual {p0}, Lorg/joda/time/base/BaseSingleFieldPeriod;->getFieldType()Lorg/joda/time/DurationFieldType;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 320
    return v0
.end method

.method public isSupported(Lorg/joda/time/DurationFieldType;)Z
    .registers 3

    .prologue
    .line 262
    invoke-virtual {p0}, Lorg/joda/time/base/BaseSingleFieldPeriod;->getFieldType()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    if-ne p1, v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method protected setValue(I)V
    .registers 2

    .prologue
    .line 178
    iput p1, p0, Lorg/joda/time/base/BaseSingleFieldPeriod;->iPeriod:I

    .line 179
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 203
    const/4 v0, 0x1

    return v0
.end method

.method public toMutablePeriod()Lorg/joda/time/MutablePeriod;
    .registers 2

    .prologue
    .line 285
    new-instance v0, Lorg/joda/time/MutablePeriod;

    invoke-direct {v0}, Lorg/joda/time/MutablePeriod;-><init>()V

    .line 286
    invoke-virtual {v0, p0}, Lorg/joda/time/MutablePeriod;->add(Lorg/joda/time/ReadablePeriod;)V

    .line 287
    return-object v0
.end method

.method public toPeriod()Lorg/joda/time/Period;
    .registers 2

    .prologue
    .line 273
    sget-object v0, Lorg/joda/time/Period;->ZERO:Lorg/joda/time/Period;

    invoke-virtual {v0, p0}, Lorg/joda/time/Period;->withFields(Lorg/joda/time/ReadablePeriod;)Lorg/joda/time/Period;

    move-result-object v0

    return-object v0
.end method
