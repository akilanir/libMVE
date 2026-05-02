.class public Lorg/joda/time/field/DividedDateTimeField;
.super Lorg/joda/time/field/DecoratedDateTimeField;
.source "DividedDateTimeField.java"


# static fields
.field private static final serialVersionUID:J = 0x7371290d64b04a35L


# instance fields
.field final iDivisor:I

.field final iDurationField:Lorg/joda/time/DurationField;

.field private final iMax:I

.field private final iMin:I

.field final iRangeDurationField:Lorg/joda/time/DurationField;


# direct methods
.method public constructor <init>(Lorg/joda/time/DateTimeField;Lorg/joda/time/DateTimeFieldType;I)V
    .registers 5

    .prologue
    .line 58
    invoke-virtual {p1}, Lorg/joda/time/DateTimeField;->getRangeDurationField()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2, p3}, Lorg/joda/time/field/DividedDateTimeField;-><init>(Lorg/joda/time/DateTimeField;Lorg/joda/time/DurationField;Lorg/joda/time/DateTimeFieldType;I)V

    .line 59
    return-void
.end method

.method public constructor <init>(Lorg/joda/time/DateTimeField;Lorg/joda/time/DurationField;Lorg/joda/time/DateTimeFieldType;I)V
    .registers 8

    .prologue
    .line 72
    invoke-direct {p0, p1, p3}, Lorg/joda/time/field/DecoratedDateTimeField;-><init>(Lorg/joda/time/DateTimeField;Lorg/joda/time/DateTimeFieldType;)V

    .line 73
    const/4 v0, 0x2

    if-ge p4, v0, :cond_e

    .line 74
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The divisor must be at least 2"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 76
    :cond_e
    invoke-virtual {p1}, Lorg/joda/time/DateTimeField;->getDurationField()Lorg/joda/time/DurationField;

    move-result-object v0

    .line 77
    if-nez v0, :cond_2e

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/joda/time/field/DividedDateTimeField;->iDurationField:Lorg/joda/time/DurationField;

    .line 83
    :goto_17
    iput-object p2, p0, Lorg/joda/time/field/DividedDateTimeField;->iRangeDurationField:Lorg/joda/time/DurationField;

    .line 84
    iput p4, p0, Lorg/joda/time/field/DividedDateTimeField;->iDivisor:I

    .line 85
    invoke-virtual {p1}, Lorg/joda/time/DateTimeField;->getMinimumValue()I

    move-result v0

    .line 86
    if-ltz v0, :cond_3a

    div-int/2addr v0, p4

    .line 87
    :goto_22
    invoke-virtual {p1}, Lorg/joda/time/DateTimeField;->getMaximumValue()I

    move-result v1

    .line 88
    if-ltz v1, :cond_40

    div-int/2addr v1, p4

    .line 89
    :goto_29
    iput v0, p0, Lorg/joda/time/field/DividedDateTimeField;->iMin:I

    .line 90
    iput v1, p0, Lorg/joda/time/field/DividedDateTimeField;->iMax:I

    .line 91
    return-void

    .line 80
    :cond_2e
    new-instance v1, Lorg/joda/time/field/ScaledDurationField;

    invoke-virtual {p3}, Lorg/joda/time/DateTimeFieldType;->getDurationType()Lorg/joda/time/DurationFieldType;

    move-result-object v2

    invoke-direct {v1, v0, v2, p4}, Lorg/joda/time/field/ScaledDurationField;-><init>(Lorg/joda/time/DurationField;Lorg/joda/time/DurationFieldType;I)V

    iput-object v1, p0, Lorg/joda/time/field/DividedDateTimeField;->iDurationField:Lorg/joda/time/DurationField;

    goto :goto_17

    .line 86
    :cond_3a
    add-int/lit8 v0, v0, 0x1

    div-int/2addr v0, p4

    add-int/lit8 v0, v0, -0x1

    goto :goto_22

    .line 88
    :cond_40
    add-int/lit8 v1, v1, 0x1

    div-int/2addr v1, p4

    add-int/lit8 v1, v1, -0x1

    goto :goto_29
.end method

.method public constructor <init>(Lorg/joda/time/field/RemainderDateTimeField;Lorg/joda/time/DateTimeFieldType;)V
    .registers 4

    .prologue
    .line 101
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lorg/joda/time/field/DividedDateTimeField;-><init>(Lorg/joda/time/field/RemainderDateTimeField;Lorg/joda/time/DurationField;Lorg/joda/time/DateTimeFieldType;)V

    .line 102
    return-void
.end method

.method public constructor <init>(Lorg/joda/time/field/RemainderDateTimeField;Lorg/joda/time/DurationField;Lorg/joda/time/DateTimeFieldType;)V
    .registers 7

    .prologue
    .line 113
    invoke-virtual {p1}, Lorg/joda/time/field/RemainderDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-direct {p0, v0, p3}, Lorg/joda/time/field/DecoratedDateTimeField;-><init>(Lorg/joda/time/DateTimeField;Lorg/joda/time/DateTimeFieldType;)V

    .line 114
    iget v1, p1, Lorg/joda/time/field/RemainderDateTimeField;->iDivisor:I

    iput v1, p0, Lorg/joda/time/field/DividedDateTimeField;->iDivisor:I

    .line 115
    iget-object v0, p1, Lorg/joda/time/field/RemainderDateTimeField;->iRangeField:Lorg/joda/time/DurationField;

    iput-object v0, p0, Lorg/joda/time/field/DividedDateTimeField;->iDurationField:Lorg/joda/time/DurationField;

    .line 116
    iput-object p2, p0, Lorg/joda/time/field/DividedDateTimeField;->iRangeDurationField:Lorg/joda/time/DurationField;

    .line 117
    invoke-virtual {p0}, Lorg/joda/time/field/DividedDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v2

    .line 118
    invoke-virtual {v2}, Lorg/joda/time/DateTimeField;->getMinimumValue()I

    move-result v0

    .line 119
    if-ltz v0, :cond_29

    div-int/2addr v0, v1

    .line 120
    :goto_1c
    invoke-virtual {v2}, Lorg/joda/time/DateTimeField;->getMaximumValue()I

    move-result v2

    .line 121
    if-ltz v2, :cond_2f

    div-int v1, v2, v1

    .line 122
    :goto_24
    iput v0, p0, Lorg/joda/time/field/DividedDateTimeField;->iMin:I

    .line 123
    iput v1, p0, Lorg/joda/time/field/DividedDateTimeField;->iMax:I

    .line 124
    return-void

    .line 119
    :cond_29
    add-int/lit8 v0, v0, 0x1

    div-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    goto :goto_1c

    .line 121
    :cond_2f
    add-int/lit8 v2, v2, 0x1

    div-int v1, v2, v1

    add-int/lit8 v1, v1, -0x1

    goto :goto_24
.end method

.method private getRemainder(I)I
    .registers 5

    .prologue
    .line 251
    if-ltz p1, :cond_7

    .line 252
    iget v0, p0, Lorg/joda/time/field/DividedDateTimeField;->iDivisor:I

    rem-int v0, p1, v0

    .line 254
    :goto_6
    return v0

    :cond_7
    iget v0, p0, Lorg/joda/time/field/DividedDateTimeField;->iDivisor:I

    add-int/lit8 v0, v0, -0x1

    add-int/lit8 v1, p1, 0x1

    iget v2, p0, Lorg/joda/time/field/DividedDateTimeField;->iDivisor:I

    rem-int/2addr v1, v2

    add-int/2addr v0, v1

    goto :goto_6
.end method


# virtual methods
.method public add(JI)J
    .registers 6

    .prologue
    .line 158
    invoke-virtual {p0}, Lorg/joda/time/field/DividedDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    iget v1, p0, Lorg/joda/time/field/DividedDateTimeField;->iDivisor:I

    mul-int/2addr v1, p3

    invoke-virtual {v0, p1, p2, v1}, Lorg/joda/time/DateTimeField;->add(JI)J

    move-result-wide v0

    return-wide v0
.end method

.method public add(JJ)J
    .registers 8

    .prologue
    .line 170
    invoke-virtual {p0}, Lorg/joda/time/field/DividedDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    iget v1, p0, Lorg/joda/time/field/DividedDateTimeField;->iDivisor:I

    int-to-long v1, v1

    mul-long/2addr v1, p3

    invoke-virtual {v0, p1, p2, v1, v2}, Lorg/joda/time/DateTimeField;->add(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public addWrapField(JI)J
    .registers 7

    .prologue
    .line 182
    invoke-virtual {p0, p1, p2}, Lorg/joda/time/field/DividedDateTimeField;->get(J)I

    move-result v0

    iget v1, p0, Lorg/joda/time/field/DividedDateTimeField;->iMin:I

    iget v2, p0, Lorg/joda/time/field/DividedDateTimeField;->iMax:I

    invoke-static {v0, p3, v1, v2}, Lorg/joda/time/field/FieldUtils;->getWrappedValue(IIII)I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lorg/joda/time/field/DividedDateTimeField;->set(JI)J

    move-result-wide v0

    return-wide v0
.end method

.method public get(J)I
    .registers 5

    .prologue
    .line 141
    invoke-virtual {p0}, Lorg/joda/time/field/DividedDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v0

    .line 142
    if-ltz v0, :cond_e

    .line 143
    iget v1, p0, Lorg/joda/time/field/DividedDateTimeField;->iDivisor:I

    div-int/2addr v0, v1

    .line 145
    :goto_d
    return v0

    :cond_e
    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Lorg/joda/time/field/DividedDateTimeField;->iDivisor:I

    div-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    goto :goto_d
.end method

.method public getDifference(JJ)I
    .registers 7

    .prologue
    .line 186
    invoke-virtual {p0}, Lorg/joda/time/field/DividedDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/joda/time/DateTimeField;->getDifference(JJ)I

    move-result v0

    iget v1, p0, Lorg/joda/time/field/DividedDateTimeField;->iDivisor:I

    div-int/2addr v0, v1

    return v0
.end method

.method public getDifferenceAsLong(JJ)J
    .registers 9

    .prologue
    .line 190
    invoke-virtual {p0}, Lorg/joda/time/field/DividedDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/joda/time/DateTimeField;->getDifferenceAsLong(JJ)J

    move-result-wide v0

    iget v2, p0, Lorg/joda/time/field/DividedDateTimeField;->iDivisor:I

    int-to-long v2, v2

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public getDivisor()I
    .registers 2

    .prologue
    .line 247
    iget v0, p0, Lorg/joda/time/field/DividedDateTimeField;->iDivisor:I

    return v0
.end method

.method public getDurationField()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 211
    iget-object v0, p0, Lorg/joda/time/field/DividedDateTimeField;->iDurationField:Lorg/joda/time/DurationField;

    return-object v0
.end method

.method public getMaximumValue()I
    .registers 2

    .prologue
    .line 229
    iget v0, p0, Lorg/joda/time/field/DividedDateTimeField;->iMax:I

    return v0
.end method

.method public getMinimumValue()I
    .registers 2

    .prologue
    .line 220
    iget v0, p0, Lorg/joda/time/field/DividedDateTimeField;->iMin:I

    return v0
.end method

.method public getRangeDurationField()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 128
    iget-object v0, p0, Lorg/joda/time/field/DividedDateTimeField;->iRangeDurationField:Lorg/joda/time/DurationField;

    if-eqz v0, :cond_7

    .line 129
    iget-object v0, p0, Lorg/joda/time/field/DividedDateTimeField;->iRangeDurationField:Lorg/joda/time/DurationField;

    .line 131
    :goto_6
    return-object v0

    :cond_7
    invoke-super {p0}, Lorg/joda/time/field/DecoratedDateTimeField;->getRangeDurationField()Lorg/joda/time/DurationField;

    move-result-object v0

    goto :goto_6
.end method

.method public remainder(J)J
    .registers 5

    .prologue
    .line 238
    invoke-virtual {p0}, Lorg/joda/time/field/DividedDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->remainder(J)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/field/DividedDateTimeField;->get(J)I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lorg/joda/time/field/DividedDateTimeField;->set(JI)J

    move-result-wide v0

    return-wide v0
.end method

.method public roundFloor(J)J
    .registers 6

    .prologue
    .line 233
    invoke-virtual {p0}, Lorg/joda/time/field/DividedDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    .line 234
    invoke-virtual {p0, p1, p2}, Lorg/joda/time/field/DividedDateTimeField;->get(J)I

    move-result v1

    iget v2, p0, Lorg/joda/time/field/DividedDateTimeField;->iDivisor:I

    mul-int/2addr v1, v2

    invoke-virtual {v0, p1, p2, v1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/joda/time/DateTimeField;->roundFloor(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public set(JI)J
    .registers 7

    .prologue
    .line 202
    iget v0, p0, Lorg/joda/time/field/DividedDateTimeField;->iMin:I

    iget v1, p0, Lorg/joda/time/field/DividedDateTimeField;->iMax:I

    invoke-static {p0, p3, v0, v1}, Lorg/joda/time/field/FieldUtils;->verifyValueBounds(Lorg/joda/time/DateTimeField;III)V

    .line 203
    invoke-virtual {p0}, Lorg/joda/time/field/DividedDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v0

    invoke-direct {p0, v0}, Lorg/joda/time/field/DividedDateTimeField;->getRemainder(I)I

    move-result v0

    .line 204
    invoke-virtual {p0}, Lorg/joda/time/field/DividedDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v1

    iget v2, p0, Lorg/joda/time/field/DividedDateTimeField;->iDivisor:I

    mul-int/2addr v2, p3

    add-int/2addr v0, v2

    invoke-virtual {v1, p1, p2, v0}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    return-wide v0
.end method
