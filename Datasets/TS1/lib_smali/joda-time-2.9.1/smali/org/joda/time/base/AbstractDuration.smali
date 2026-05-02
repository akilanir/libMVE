.class public abstract Lorg/joda/time/base/AbstractDuration;
.super Ljava/lang/Object;
.source "AbstractDuration.java"

# interfaces
.implements Lorg/joda/time/ReadableDuration;


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    return-void
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3

    .prologue
    .line 38
    check-cast p1, Lorg/joda/time/ReadableDuration;

    invoke-virtual {p0, p1}, Lorg/joda/time/base/AbstractDuration;->compareTo(Lorg/joda/time/ReadableDuration;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/joda/time/ReadableDuration;)I
    .registers 7

    .prologue
    .line 93
    invoke-virtual {p0}, Lorg/joda/time/base/AbstractDuration;->getMillis()J

    move-result-wide v0

    .line 94
    invoke-interface {p1}, Lorg/joda/time/ReadableDuration;->getMillis()J

    move-result-wide v2

    .line 97
    cmp-long v4, v0, v2

    if-gez v4, :cond_e

    .line 98
    const/4 v0, -0x1

    .line 103
    :goto_d
    return v0

    .line 100
    :cond_e
    cmp-long v0, v0, v2

    if-lez v0, :cond_14

    .line 101
    const/4 v0, 0x1

    goto :goto_d

    .line 103
    :cond_14
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 8

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 154
    if-ne p0, p1, :cond_5

    .line 161
    :cond_4
    :goto_4
    return v0

    .line 157
    :cond_5
    instance-of v2, p1, Lorg/joda/time/ReadableDuration;

    if-nez v2, :cond_b

    move v0, v1

    .line 158
    goto :goto_4

    .line 160
    :cond_b
    check-cast p1, Lorg/joda/time/ReadableDuration;

    .line 161
    invoke-virtual {p0}, Lorg/joda/time/base/AbstractDuration;->getMillis()J

    move-result-wide v2

    invoke-interface {p1}, Lorg/joda/time/ReadableDuration;->getMillis()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-eqz v2, :cond_4

    move v0, v1

    goto :goto_4
.end method

.method public hashCode()I
    .registers 5

    .prologue
    .line 171
    invoke-virtual {p0}, Lorg/joda/time/base/AbstractDuration;->getMillis()J

    move-result-wide v0

    .line 172
    const/16 v2, 0x20

    ushr-long v2, v0, v2

    xor-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

.method public isEqual(Lorg/joda/time/ReadableDuration;)Z
    .registers 3

    .prologue
    .line 113
    if-nez p1, :cond_4

    .line 114
    sget-object p1, Lorg/joda/time/Duration;->ZERO:Lorg/joda/time/Duration;

    .line 116
    :cond_4
    invoke-virtual {p0, p1}, Lorg/joda/time/base/AbstractDuration;->compareTo(Lorg/joda/time/ReadableDuration;)I

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public isLongerThan(Lorg/joda/time/ReadableDuration;)Z
    .registers 3

    .prologue
    .line 126
    if-nez p1, :cond_4

    .line 127
    sget-object p1, Lorg/joda/time/Duration;->ZERO:Lorg/joda/time/Duration;

    .line 129
    :cond_4
    invoke-virtual {p0, p1}, Lorg/joda/time/base/AbstractDuration;->compareTo(Lorg/joda/time/ReadableDuration;)I

    move-result v0

    if-lez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public isShorterThan(Lorg/joda/time/ReadableDuration;)Z
    .registers 3

    .prologue
    .line 139
    if-nez p1, :cond_4

    .line 140
    sget-object p1, Lorg/joda/time/Duration;->ZERO:Lorg/joda/time/Duration;

    .line 142
    :cond_4
    invoke-virtual {p0, p1}, Lorg/joda/time/base/AbstractDuration;->compareTo(Lorg/joda/time/ReadableDuration;)I

    move-result v0

    if-gez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public toDuration()Lorg/joda/time/Duration;
    .registers 4

    .prologue
    .line 54
    new-instance v0, Lorg/joda/time/Duration;

    invoke-virtual {p0}, Lorg/joda/time/base/AbstractDuration;->getMillis()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Lorg/joda/time/Duration;-><init>(J)V

    return-object v0
.end method

.method public toPeriod()Lorg/joda/time/Period;
    .registers 4

    .prologue
    .line 80
    new-instance v0, Lorg/joda/time/Period;

    invoke-virtual {p0}, Lorg/joda/time/base/AbstractDuration;->getMillis()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Lorg/joda/time/Period;-><init>(J)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 9
    .annotation runtime Lorg/joda/convert/ToString;
    .end annotation

    .prologue
    const-wide/16 v6, 0x3e8

    .line 189
    invoke-virtual {p0}, Lorg/joda/time/base/AbstractDuration;->getMillis()J

    move-result-wide v2

    .line 190
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 191
    const-string v0, "PT"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 192
    const-wide/16 v0, 0x0

    cmp-long v0, v2, v0

    if-gez v0, :cond_2c

    const/4 v0, 0x1

    .line 193
    :goto_17
    invoke-static {v4, v2, v3}, Lorg/joda/time/format/FormatUtils;->appendUnpaddedInteger(Ljava/lang/StringBuffer;J)V

    .line 194
    :goto_1a
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->length()I

    move-result v5

    if-eqz v0, :cond_2e

    const/4 v1, 0x7

    :goto_21
    if-ge v5, v1, :cond_32

    .line 195
    if-eqz v0, :cond_30

    const/4 v1, 0x3

    :goto_26
    const-string v5, "0"

    invoke-virtual {v4, v1, v5}, Ljava/lang/StringBuffer;->insert(ILjava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1a

    .line 192
    :cond_2c
    const/4 v0, 0x0

    goto :goto_17

    .line 194
    :cond_2e
    const/4 v1, 0x6

    goto :goto_21

    .line 195
    :cond_30
    const/4 v1, 0x2

    goto :goto_26

    .line 197
    :cond_32
    div-long v0, v2, v6

    mul-long/2addr v0, v6

    cmp-long v0, v0, v2

    if-nez v0, :cond_4c

    .line 198
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 202
    :goto_42
    const/16 v0, 0x53

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 203
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 200
    :cond_4c
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x3

    const-string v1, "."

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuffer;->insert(ILjava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_42
.end method
