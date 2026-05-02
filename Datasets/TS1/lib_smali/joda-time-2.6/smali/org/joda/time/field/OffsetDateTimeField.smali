.class public Lorg/joda/time/field/OffsetDateTimeField;
.super Lorg/joda/time/field/DecoratedDateTimeField;
.source "OffsetDateTimeField.java"


# static fields
.field private static final serialVersionUID:J = 0x2ba8177560f527a6L


# instance fields
.field private final iMax:I

.field private final iMin:I

.field private final iOffset:I


# direct methods
.method public constructor <init>(Lorg/joda/time/DateTimeField;I)V
    .registers 9

    .prologue
    .line 47
    if-nez p1, :cond_f

    const/4 v2, 0x0

    :goto_3
    const/high16 v4, -0x80000000

    const v5, 0x7fffffff

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    invoke-direct/range {v0 .. v5}, Lorg/joda/time/field/OffsetDateTimeField;-><init>(Lorg/joda/time/DateTimeField;Lorg/joda/time/DateTimeFieldType;III)V

    .line 48
    return-void

    .line 47
    :cond_f
    invoke-virtual {p1}, Lorg/joda/time/DateTimeField;->getType()Lorg/joda/time/DateTimeFieldType;

    move-result-object v2

    goto :goto_3
.end method

.method public constructor <init>(Lorg/joda/time/DateTimeField;Lorg/joda/time/DateTimeFieldType;I)V
    .registers 10

    .prologue
    .line 59
    const/high16 v4, -0x80000000

    const v5, 0x7fffffff

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/joda/time/field/OffsetDateTimeField;-><init>(Lorg/joda/time/DateTimeField;Lorg/joda/time/DateTimeFieldType;III)V

    .line 60
    return-void
.end method

.method public constructor <init>(Lorg/joda/time/DateTimeField;Lorg/joda/time/DateTimeFieldType;III)V
    .registers 8

    .prologue
    .line 74
    invoke-direct {p0, p1, p2}, Lorg/joda/time/field/DecoratedDateTimeField;-><init>(Lorg/joda/time/DateTimeField;Lorg/joda/time/DateTimeFieldType;)V

    .line 76
    if-nez p3, :cond_d

    .line 77
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The offset cannot be zero"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 80
    :cond_d
    iput p3, p0, Lorg/joda/time/field/OffsetDateTimeField;->iOffset:I

    .line 82
    invoke-virtual {p1}, Lorg/joda/time/DateTimeField;->getMinimumValue()I

    move-result v0

    add-int/2addr v0, p3

    if-ge p4, v0, :cond_2c

    .line 83
    invoke-virtual {p1}, Lorg/joda/time/DateTimeField;->getMinimumValue()I

    move-result v0

    add-int/2addr v0, p3

    iput v0, p0, Lorg/joda/time/field/OffsetDateTimeField;->iMin:I

    .line 87
    :goto_1d
    invoke-virtual {p1}, Lorg/joda/time/DateTimeField;->getMaximumValue()I

    move-result v0

    add-int/2addr v0, p3

    if-le p5, v0, :cond_2f

    .line 88
    invoke-virtual {p1}, Lorg/joda/time/DateTimeField;->getMaximumValue()I

    move-result v0

    add-int/2addr v0, p3

    iput v0, p0, Lorg/joda/time/field/OffsetDateTimeField;->iMax:I

    .line 92
    :goto_2b
    return-void

    .line 85
    :cond_2c
    iput p4, p0, Lorg/joda/time/field/OffsetDateTimeField;->iMin:I

    goto :goto_1d

    .line 90
    :cond_2f
    iput p5, p0, Lorg/joda/time/field/OffsetDateTimeField;->iMax:I

    goto :goto_2b
.end method


# virtual methods
.method public add(JI)J
    .registers 9

    .prologue
    .line 113
    invoke-super {p0, p1, p2, p3}, Lorg/joda/time/field/DecoratedDateTimeField;->add(JI)J

    move-result-wide v0

    .line 114
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/field/OffsetDateTimeField;->get(J)I

    move-result v2

    iget v3, p0, Lorg/joda/time/field/OffsetDateTimeField;->iMin:I

    iget v4, p0, Lorg/joda/time/field/OffsetDateTimeField;->iMax:I

    invoke-static {p0, v2, v3, v4}, Lorg/joda/time/field/FieldUtils;->verifyValueBounds(Lorg/joda/time/DateTimeField;III)V

    .line 115
    return-wide v0
.end method

.method public add(JJ)J
    .registers 10

    .prologue
    .line 127
    invoke-super {p0, p1, p2, p3, p4}, Lorg/joda/time/field/DecoratedDateTimeField;->add(JJ)J

    move-result-wide v0

    .line 128
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/field/OffsetDateTimeField;->get(J)I

    move-result v2

    iget v3, p0, Lorg/joda/time/field/OffsetDateTimeField;->iMin:I

    iget v4, p0, Lorg/joda/time/field/OffsetDateTimeField;->iMax:I

    invoke-static {p0, v2, v3, v4}, Lorg/joda/time/field/FieldUtils;->verifyValueBounds(Lorg/joda/time/DateTimeField;III)V

    .line 129
    return-wide v0
.end method

.method public addWrapField(JI)J
    .registers 7

    .prologue
    .line 141
    invoke-virtual {p0, p1, p2}, Lorg/joda/time/field/OffsetDateTimeField;->get(J)I

    move-result v0

    iget v1, p0, Lorg/joda/time/field/OffsetDateTimeField;->iMin:I

    iget v2, p0, Lorg/joda/time/field/OffsetDateTimeField;->iMax:I

    invoke-static {v0, p3, v1, v2}, Lorg/joda/time/field/FieldUtils;->getWrappedValue(IIII)I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lorg/joda/time/field/OffsetDateTimeField;->set(JI)J

    move-result-wide v0

    return-wide v0
.end method

.method public get(J)I
    .registers 5

    .prologue
    .line 101
    invoke-super {p0, p1, p2}, Lorg/joda/time/field/DecoratedDateTimeField;->get(J)I

    move-result v0

    iget v1, p0, Lorg/joda/time/field/OffsetDateTimeField;->iOffset:I

    add-int/2addr v0, v1

    return v0
.end method

.method public getLeapAmount(J)I
    .registers 4

    .prologue
    .line 162
    invoke-virtual {p0}, Lorg/joda/time/field/OffsetDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->getLeapAmount(J)I

    move-result v0

    return v0
.end method

.method public getLeapDurationField()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 166
    invoke-virtual {p0}, Lorg/joda/time/field/OffsetDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/DateTimeField;->getLeapDurationField()Lorg/joda/time/DurationField;

    move-result-object v0

    return-object v0
.end method

.method public getMaximumValue()I
    .registers 2

    .prologue
    .line 184
    iget v0, p0, Lorg/joda/time/field/OffsetDateTimeField;->iMax:I

    return v0
.end method

.method public getMinimumValue()I
    .registers 2

    .prologue
    .line 175
    iget v0, p0, Lorg/joda/time/field/OffsetDateTimeField;->iMin:I

    return v0
.end method

.method public getOffset()I
    .registers 2

    .prologue
    .line 217
    iget v0, p0, Lorg/joda/time/field/OffsetDateTimeField;->iOffset:I

    return v0
.end method

.method public isLeap(J)Z
    .registers 4

    .prologue
    .line 158
    invoke-virtual {p0}, Lorg/joda/time/field/OffsetDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->isLeap(J)Z

    move-result v0

    return v0
.end method

.method public remainder(J)J
    .registers 5

    .prologue
    .line 208
    invoke-virtual {p0}, Lorg/joda/time/field/OffsetDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->remainder(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public roundCeiling(J)J
    .registers 5

    .prologue
    .line 192
    invoke-virtual {p0}, Lorg/joda/time/field/OffsetDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->roundCeiling(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public roundFloor(J)J
    .registers 5

    .prologue
    .line 188
    invoke-virtual {p0}, Lorg/joda/time/field/OffsetDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->roundFloor(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public roundHalfCeiling(J)J
    .registers 5

    .prologue
    .line 200
    invoke-virtual {p0}, Lorg/joda/time/field/OffsetDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->roundHalfCeiling(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public roundHalfEven(J)J
    .registers 5

    .prologue
    .line 204
    invoke-virtual {p0}, Lorg/joda/time/field/OffsetDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->roundHalfEven(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public roundHalfFloor(J)J
    .registers 5

    .prologue
    .line 196
    invoke-virtual {p0}, Lorg/joda/time/field/OffsetDateTimeField;->getWrappedField()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->roundHalfFloor(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public set(JI)J
    .registers 6

    .prologue
    .line 153
    iget v0, p0, Lorg/joda/time/field/OffsetDateTimeField;->iMin:I

    iget v1, p0, Lorg/joda/time/field/OffsetDateTimeField;->iMax:I

    invoke-static {p0, p3, v0, v1}, Lorg/joda/time/field/FieldUtils;->verifyValueBounds(Lorg/joda/time/DateTimeField;III)V

    .line 154
    iget v0, p0, Lorg/joda/time/field/OffsetDateTimeField;->iOffset:I

    sub-int v0, p3, v0

    invoke-super {p0, p1, p2, v0}, Lorg/joda/time/field/DecoratedDateTimeField;->set(JI)J

    move-result-wide v0

    return-wide v0
.end method
