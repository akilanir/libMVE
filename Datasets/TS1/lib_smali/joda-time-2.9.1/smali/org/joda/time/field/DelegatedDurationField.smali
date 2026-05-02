.class public Lorg/joda/time/field/DelegatedDurationField;
.super Lorg/joda/time/DurationField;
.source "DelegatedDurationField.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x4d6381cd0978f915L


# instance fields
.field private final iField:Lorg/joda/time/DurationField;

.field private final iType:Lorg/joda/time/DurationFieldType;


# direct methods
.method protected constructor <init>(Lorg/joda/time/DurationField;)V
    .registers 3

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/joda/time/field/DelegatedDurationField;-><init>(Lorg/joda/time/DurationField;Lorg/joda/time/DurationFieldType;)V

    .line 51
    return-void
.end method

.method protected constructor <init>(Lorg/joda/time/DurationField;Lorg/joda/time/DurationFieldType;)V
    .registers 5

    .prologue
    .line 60
    invoke-direct {p0}, Lorg/joda/time/DurationField;-><init>()V

    .line 61
    if-nez p1, :cond_d

    .line 62
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The field must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 64
    :cond_d
    iput-object p1, p0, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    .line 65
    if-nez p2, :cond_15

    invoke-virtual {p1}, Lorg/joda/time/DurationField;->getType()Lorg/joda/time/DurationFieldType;

    move-result-object p2

    :cond_15
    iput-object p2, p0, Lorg/joda/time/field/DelegatedDurationField;->iType:Lorg/joda/time/DurationFieldType;

    .line 66
    return-void
.end method


# virtual methods
.method public add(JI)J
    .registers 6

    .prologue
    .line 130
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    invoke-virtual {v0, p1, p2, p3}, Lorg/joda/time/DurationField;->add(JI)J

    move-result-wide v0

    return-wide v0
.end method

.method public add(JJ)J
    .registers 7

    .prologue
    .line 134
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/joda/time/DurationField;->add(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3

    .prologue
    .line 34
    check-cast p1, Lorg/joda/time/DurationField;

    invoke-virtual {p0, p1}, Lorg/joda/time/field/DelegatedDurationField;->compareTo(Lorg/joda/time/DurationField;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/joda/time/DurationField;)I
    .registers 3

    .prologue
    .line 150
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    invoke-virtual {v0, p1}, Lorg/joda/time/DurationField;->compareTo(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    .prologue
    .line 154
    instance-of v0, p1, Lorg/joda/time/field/DelegatedDurationField;

    if-eqz v0, :cond_f

    .line 155
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    check-cast p1, Lorg/joda/time/field/DelegatedDurationField;

    iget-object v1, p1, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 157
    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public getDifference(JJ)I
    .registers 6

    .prologue
    .line 138
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/joda/time/DurationField;->getDifference(JJ)I

    move-result v0

    return v0
.end method

.method public getDifferenceAsLong(JJ)J
    .registers 7

    .prologue
    .line 142
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/joda/time/DurationField;->getDifferenceAsLong(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public getMillis(I)J
    .registers 4

    .prologue
    .line 114
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    invoke-virtual {v0, p1}, Lorg/joda/time/DurationField;->getMillis(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getMillis(IJ)J
    .registers 6

    .prologue
    .line 122
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    invoke-virtual {v0, p1, p2, p3}, Lorg/joda/time/DurationField;->getMillis(IJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public getMillis(J)J
    .registers 5

    .prologue
    .line 118
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DurationField;->getMillis(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getMillis(JJ)J
    .registers 7

    .prologue
    .line 126
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/joda/time/DurationField;->getMillis(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iType:Lorg/joda/time/DurationFieldType;

    invoke-virtual {v0}, Lorg/joda/time/DurationFieldType;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getType()Lorg/joda/time/DurationFieldType;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iType:Lorg/joda/time/DurationFieldType;

    return-object v0
.end method

.method public getUnitMillis()J
    .registers 3

    .prologue
    .line 146
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    invoke-virtual {v0}, Lorg/joda/time/DurationField;->getUnitMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public getValue(J)I
    .registers 4

    .prologue
    .line 98
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DurationField;->getValue(J)I

    move-result v0

    return v0
.end method

.method public getValue(JJ)I
    .registers 6

    .prologue
    .line 106
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/joda/time/DurationField;->getValue(JJ)I

    move-result v0

    return v0
.end method

.method public getValueAsLong(J)J
    .registers 5

    .prologue
    .line 102
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DurationField;->getValueAsLong(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getValueAsLong(JJ)J
    .registers 7

    .prologue
    .line 110
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/joda/time/DurationField;->getValueAsLong(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public final getWrappedField()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 161
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iget-object v1, p0, Lorg/joda/time/field/DelegatedDurationField;->iType:Lorg/joda/time/DurationFieldType;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public isPrecise()Z
    .registers 2

    .prologue
    .line 94
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    invoke-virtual {v0}, Lorg/joda/time/DurationField;->isPrecise()Z

    move-result v0

    return v0
.end method

.method public isSupported()Z
    .registers 2

    .prologue
    .line 90
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    invoke-virtual {v0}, Lorg/joda/time/DurationField;->isSupported()Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 165
    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iType:Lorg/joda/time/DurationFieldType;

    if-nez v0, :cond_b

    iget-object v0, p0, Lorg/joda/time/field/DelegatedDurationField;->iField:Lorg/joda/time/DurationField;

    invoke-virtual {v0}, Lorg/joda/time/DurationField;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DurationField["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/joda/time/field/DelegatedDurationField;->iType:Lorg/joda/time/DurationFieldType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method
