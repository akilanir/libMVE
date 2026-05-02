.class final Lorg/joda/time/chrono/GJYearOfEraDateTimeField;
.super Lorg/joda/time/field/DecoratedDateTimeField;
.source "GJYearOfEraDateTimeField.java"


# static fields
.field private static final serialVersionUID:J = -0x52b9e8405303a9abL


# instance fields
.field private final iChronology:Lorg/joda/time/chrono/BasicChronology;


# direct methods
.method constructor <init>(Lorg/joda/time/DateTimeField;Lorg/joda/time/chrono/BasicChronology;)V
    .registers 4

    .prologue
    .line 42
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->yearOfEra()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/joda/time/field/DecoratedDateTimeField;-><init>(Lorg/joda/time/DateTimeField;Lorg/joda/time/DateTimeFieldType;)V

    .line 43
    iput-object p2, p0, Lorg/joda/time/chrono/GJYearOfEraDateTimeField;->iChronology:Lorg/joda/time/chrono/BasicChronology;

    .line 44
    return-void
.end method

.method private readResolve()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 123
    iget-object v0, p0, Lorg/joda/time/chrono/GJYearOfEraDateTimeField;->iChronology:Lorg/joda/time/chrono/BasicChronology;

    invoke-virtual {v0}, Lorg/joda/time/chrono/BasicChronology;->yearOfEra()Lorg/joda/time/DateTimeField;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public add(JI)J
    .registers 6

    .prologue
    .line 60
    invoke-virtual {p0}, Lorg/joda/time/chrono/GJYearOfEraDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lorg/joda/time/DateTimeField;->add(JI)J

    move-result-wide v0

    return-wide v0
.end method

.method public add(JJ)J
    .registers 7

    .prologue
    .line 64
    invoke-virtual {p0}, Lorg/joda/time/chrono/GJYearOfEraDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/joda/time/DateTimeField;->add(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public addWrapField(JI)J
    .registers 6

    .prologue
    .line 68
    invoke-virtual {p0}, Lorg/joda/time/chrono/GJYearOfEraDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lorg/joda/time/DateTimeField;->addWrapField(JI)J

    move-result-wide v0

    return-wide v0
.end method

.method public addWrapField(Lorg/joda/time/ReadablePartial;I[II)[I
    .registers 6

    .prologue
    .line 72
    invoke-virtual {p0}, Lorg/joda/time/chrono/GJYearOfEraDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/joda/time/DateTimeField;->addWrapField(Lorg/joda/time/ReadablePartial;I[II)[I

    move-result-object v0

    return-object v0
.end method

.method public get(J)I
    .registers 4

    .prologue
    .line 52
    invoke-virtual {p0}, Lorg/joda/time/chrono/GJYearOfEraDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v0

    .line 53
    if-gtz v0, :cond_c

    .line 54
    rsub-int/lit8 v0, v0, 0x1

    .line 56
    :cond_c
    return v0
.end method

.method public getDifference(JJ)I
    .registers 6

    .prologue
    .line 76
    invoke-virtual {p0}, Lorg/joda/time/chrono/GJYearOfEraDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/joda/time/DateTimeField;->getDifference(JJ)I

    move-result v0

    return v0
.end method

.method public getDifferenceAsLong(JJ)J
    .registers 7

    .prologue
    .line 80
    invoke-virtual {p0}, Lorg/joda/time/chrono/GJYearOfEraDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/joda/time/DateTimeField;->getDifferenceAsLong(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public getMaximumValue()I
    .registers 2

    .prologue
    .line 104
    invoke-virtual {p0}, Lorg/joda/time/chrono/GJYearOfEraDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/DateTimeField;->getMaximumValue()I

    move-result v0

    return v0
.end method

.method public getMinimumValue()I
    .registers 2

    .prologue
    .line 100
    const/4 v0, 0x1

    return v0
.end method

.method public getRangeDurationField()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 48
    iget-object v0, p0, Lorg/joda/time/chrono/GJYearOfEraDateTimeField;->iChronology:Lorg/joda/time/chrono/BasicChronology;

    invoke-virtual {v0}, Lorg/joda/time/chrono/BasicChronology;->eras()Lorg/joda/time/DurationField;

    move-result-object v0

    return-object v0
.end method

.method public remainder(J)J
    .registers 5

    .prologue
    .line 116
    invoke-virtual {p0}, Lorg/joda/time/chrono/GJYearOfEraDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->remainder(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public roundCeiling(J)J
    .registers 5

    .prologue
    .line 112
    invoke-virtual {p0}, Lorg/joda/time/chrono/GJYearOfEraDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->roundCeiling(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public roundFloor(J)J
    .registers 5

    .prologue
    .line 108
    invoke-virtual {p0}, Lorg/joda/time/chrono/GJYearOfEraDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->roundFloor(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public set(JI)J
    .registers 6

    .prologue
    .line 92
    const/4 v0, 0x1

    invoke-virtual {p0}, Lorg/joda/time/chrono/GJYearOfEraDateTimeField;->getMaximumValue()I

    move-result v1

    invoke-static {p0, p3, v0, v1}, Lorg/joda/time/field/FieldUtils;->verifyValueBounds(Lorg/joda/time/DateTimeField;III)V

    .line 93
    iget-object v0, p0, Lorg/joda/time/chrono/GJYearOfEraDateTimeField;->iChronology:Lorg/joda/time/chrono/BasicChronology;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/chrono/BasicChronology;->getYear(J)I

    move-result v0

    if-gtz v0, :cond_12

    .line 94
    rsub-int/lit8 p3, p3, 0x1

    .line 96
    :cond_12
    invoke-super {p0, p1, p2, p3}, Lorg/joda/time/field/DecoratedDateTimeField;->set(JI)J

    move-result-wide v0

    return-wide v0
.end method
