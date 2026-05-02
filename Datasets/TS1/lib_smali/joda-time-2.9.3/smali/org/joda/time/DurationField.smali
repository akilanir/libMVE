.class public abstract Lorg/joda/time/DurationField;
.super Ljava/lang/Object;
.source "DurationField.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/joda/time/DurationField;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract add(JI)J
.end method

.method public abstract add(JJ)J
.end method

.method public abstract getDifference(JJ)I
.end method

.method public abstract getDifferenceAsLong(JJ)J
.end method

.method public abstract getMillis(I)J
.end method

.method public abstract getMillis(IJ)J
.end method

.method public abstract getMillis(J)J
.end method

.method public abstract getMillis(JJ)J
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract getType()Lorg/joda/time/DurationFieldType;
.end method

.method public abstract getUnitMillis()J
.end method

.method public abstract getValue(J)I
.end method

.method public abstract getValue(JJ)I
.end method

.method public abstract getValueAsLong(J)J
.end method

.method public abstract getValueAsLong(JJ)J
.end method

.method public abstract isPrecise()Z
.end method

.method public abstract isSupported()Z
.end method

.method public subtract(JI)J
    .registers 6

    .prologue
    .line 209
    const/high16 v0, -0x80000000

    if-ne p3, v0, :cond_a

    .line 210
    int-to-long v0, p3

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/joda/time/DurationField;->subtract(JJ)J

    move-result-wide v0

    .line 212
    :goto_9
    return-wide v0

    :cond_a
    neg-int v0, p3

    invoke-virtual {p0, p1, p2, v0}, Lorg/joda/time/DurationField;->add(JI)J

    move-result-wide v0

    goto :goto_9
.end method

.method public subtract(JJ)J
    .registers 7

    .prologue
    .line 224
    const-wide/high16 v0, -0x8000000000000000L

    cmp-long v0, p3, v0

    if-nez v0, :cond_e

    .line 225
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "Long.MIN_VALUE cannot be negated"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 227
    :cond_e
    neg-long v0, p3

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/joda/time/DurationField;->add(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public abstract toString()Ljava/lang/String;
.end method
