.class public final Lorg/joda/time/field/UnsupportedDateTimeField;
.super Lorg/joda/time/DateTimeField;
.source "UnsupportedDateTimeField.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static cCache:Ljava/util/HashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lorg/joda/time/DateTimeFieldType;",
            "Lorg/joda/time/field/UnsupportedDateTimeField;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = -0x1ad9252e642f962fL


# instance fields
.field private final iDurationField:Lorg/joda/time/DurationField;

.field private final iType:Lorg/joda/time/DateTimeFieldType;


# direct methods
.method private constructor <init>(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)V
    .registers 4

    .prologue
    .line 82
    invoke-direct {p0}, Lorg/joda/time/DateTimeField;-><init>()V

    .line 83
    if-eqz p1, :cond_7

    if-nez p2, :cond_d

    .line 84
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 86
    :cond_d
    iput-object p1, p0, Lorg/joda/time/field/UnsupportedDateTimeField;->iType:Lorg/joda/time/DateTimeFieldType;

    .line 87
    iput-object p2, p0, Lorg/joda/time/field/UnsupportedDateTimeField;->iDurationField:Lorg/joda/time/DurationField;

    .line 88
    return-void
.end method

.method public static declared-synchronized getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;
    .registers 6

    .prologue
    const/4 v1, 0x0

    .line 55
    const-class v2, Lorg/joda/time/field/UnsupportedDateTimeField;

    monitor-enter v2

    :try_start_4
    sget-object v0, Lorg/joda/time/field/UnsupportedDateTimeField;->cCache:Ljava/util/HashMap;

    if-nez v0, :cond_1f

    .line 56
    new-instance v0, Ljava/util/HashMap;

    const/4 v3, 0x7

    invoke-direct {v0, v3}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lorg/joda/time/field/UnsupportedDateTimeField;->cCache:Ljava/util/HashMap;

    move-object v0, v1

    .line 64
    :cond_11
    :goto_11
    if-nez v0, :cond_1d

    .line 65
    new-instance v0, Lorg/joda/time/field/UnsupportedDateTimeField;

    invoke-direct {v0, p0, p1}, Lorg/joda/time/field/UnsupportedDateTimeField;-><init>(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)V

    .line 66
    sget-object v1, Lorg/joda/time/field/UnsupportedDateTimeField;->cCache:Ljava/util/HashMap;

    invoke-virtual {v1, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1d
    .catchall {:try_start_4 .. :try_end_1d} :catchall_31

    .line 68
    :cond_1d
    monitor-exit v2

    return-object v0

    .line 59
    :cond_1f
    :try_start_1f
    sget-object v0, Lorg/joda/time/field/UnsupportedDateTimeField;->cCache:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/joda/time/field/UnsupportedDateTimeField;

    .line 60
    if-eqz v0, :cond_11

    invoke-virtual {v0}, Lorg/joda/time/field/UnsupportedDateTimeField;->getDurationField()Lorg/joda/time/DurationField;
    :try_end_2c
    .catchall {:try_start_1f .. :try_end_2c} :catchall_31

    move-result-object v3

    if-eq v3, p1, :cond_11

    move-object v0, v1

    .line 61
    goto :goto_11

    .line 55
    :catchall_31
    move-exception v0

    monitor-exit v2

    throw v0
.end method

.method private readResolve()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 540
    iget-object v0, p0, Lorg/joda/time/field/UnsupportedDateTimeField;->iType:Lorg/joda/time/DateTimeFieldType;

    iget-object v1, p0, Lorg/joda/time/field/UnsupportedDateTimeField;->iDurationField:Lorg/joda/time/DurationField;

    invoke-static {v0, v1}, Lorg/joda/time/field/UnsupportedDateTimeField;->getInstance(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;)Lorg/joda/time/field/UnsupportedDateTimeField;

    move-result-object v0

    return-object v0
.end method

.method private unsupported()Ljava/lang/UnsupportedOperationException;
    .registers 4

    .prologue
    .line 544
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lorg/joda/time/field/UnsupportedDateTimeField;->iType:Lorg/joda/time/DateTimeFieldType;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " field is unsupported"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public add(JI)J
    .registers 6

    .prologue
    .line 225
    invoke-virtual {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->getDurationField()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lorg/joda/time/DurationField;->add(JI)J

    move-result-wide v0

    return-wide v0
.end method

.method public add(JJ)J
    .registers 7

    .prologue
    .line 234
    invoke-virtual {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->getDurationField()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/joda/time/DurationField;->add(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public add(Lorg/joda/time/ReadablePartial;I[II)[I
    .registers 6

    .prologue
    .line 243
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public addWrapField(JI)J
    .registers 5

    .prologue
    .line 261
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public addWrapField(Lorg/joda/time/ReadablePartial;I[II)[I
    .registers 6

    .prologue
    .line 270
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public addWrapPartial(Lorg/joda/time/ReadablePartial;I[II)[I
    .registers 6

    .prologue
    .line 252
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public get(J)I
    .registers 4

    .prologue
    .line 126
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getAsShortText(ILjava/util/Locale;)Ljava/lang/String;
    .registers 4

    .prologue
    .line 216
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getAsShortText(J)Ljava/lang/String;
    .registers 4

    .prologue
    .line 189
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getAsShortText(JLjava/util/Locale;)Ljava/lang/String;
    .registers 5

    .prologue
    .line 180
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getAsShortText(Lorg/joda/time/ReadablePartial;ILjava/util/Locale;)Ljava/lang/String;
    .registers 5

    .prologue
    .line 198
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getAsShortText(Lorg/joda/time/ReadablePartial;Ljava/util/Locale;)Ljava/lang/String;
    .registers 4

    .prologue
    .line 207
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getAsText(ILjava/util/Locale;)Ljava/lang/String;
    .registers 4

    .prologue
    .line 171
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getAsText(J)Ljava/lang/String;
    .registers 4

    .prologue
    .line 144
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getAsText(JLjava/util/Locale;)Ljava/lang/String;
    .registers 5

    .prologue
    .line 135
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getAsText(Lorg/joda/time/ReadablePartial;ILjava/util/Locale;)Ljava/lang/String;
    .registers 5

    .prologue
    .line 153
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getAsText(Lorg/joda/time/ReadablePartial;Ljava/util/Locale;)Ljava/lang/String;
    .registers 4

    .prologue
    .line 162
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getDifference(JJ)I
    .registers 6

    .prologue
    .line 279
    invoke-virtual {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->getDurationField()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/joda/time/DurationField;->getDifference(JJ)I

    move-result v0

    return v0
.end method

.method public getDifferenceAsLong(JJ)J
    .registers 7

    .prologue
    .line 288
    invoke-virtual {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->getDurationField()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/joda/time/DurationField;->getDifferenceAsLong(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public getDurationField()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 343
    iget-object v0, p0, Lorg/joda/time/field/UnsupportedDateTimeField;->iDurationField:Lorg/joda/time/DurationField;

    return-object v0
.end method

.method public getLeapAmount(J)I
    .registers 4

    .prologue
    .line 370
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getLeapDurationField()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 379
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMaximumShortTextLength(Ljava/util/Locale;)I
    .registers 3

    .prologue
    .line 469
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getMaximumTextLength(Ljava/util/Locale;)I
    .registers 3

    .prologue
    .line 460
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getMaximumValue()I
    .registers 2

    .prologue
    .line 424
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getMaximumValue(J)I
    .registers 4

    .prologue
    .line 433
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getMaximumValue(Lorg/joda/time/ReadablePartial;)I
    .registers 3

    .prologue
    .line 442
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getMaximumValue(Lorg/joda/time/ReadablePartial;[I)I
    .registers 4

    .prologue
    .line 451
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getMinimumValue()I
    .registers 2

    .prologue
    .line 388
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getMinimumValue(J)I
    .registers 4

    .prologue
    .line 397
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getMinimumValue(Lorg/joda/time/ReadablePartial;)I
    .registers 3

    .prologue
    .line 406
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getMinimumValue(Lorg/joda/time/ReadablePartial;[I)I
    .registers 4

    .prologue
    .line 415
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lorg/joda/time/field/UnsupportedDateTimeField;->iType:Lorg/joda/time/DateTimeFieldType;

    invoke-virtual {v0}, Lorg/joda/time/DateTimeFieldType;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRangeDurationField()Lorg/joda/time/DurationField;
    .registers 2

    .prologue
    .line 352
    const/4 v0, 0x0

    return-object v0
.end method

.method public getType()Lorg/joda/time/DateTimeFieldType;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lorg/joda/time/field/UnsupportedDateTimeField;->iType:Lorg/joda/time/DateTimeFieldType;

    return-object v0
.end method

.method public isLeap(J)Z
    .registers 4

    .prologue
    .line 361
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public isLenient()Z
    .registers 2

    .prologue
    .line 117
    const/4 v0, 0x0

    return v0
.end method

.method public isSupported()Z
    .registers 2

    .prologue
    .line 108
    const/4 v0, 0x0

    return v0
.end method

.method public remainder(J)J
    .registers 4

    .prologue
    .line 523
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public roundCeiling(J)J
    .registers 4

    .prologue
    .line 487
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public roundFloor(J)J
    .registers 4

    .prologue
    .line 478
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public roundHalfCeiling(J)J
    .registers 4

    .prologue
    .line 505
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public roundHalfEven(J)J
    .registers 4

    .prologue
    .line 514
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public roundHalfFloor(J)J
    .registers 4

    .prologue
    .line 496
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public set(JI)J
    .registers 5

    .prologue
    .line 297
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public set(JLjava/lang/String;)J
    .registers 5

    .prologue
    .line 324
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public set(JLjava/lang/String;Ljava/util/Locale;)J
    .registers 6

    .prologue
    .line 315
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public set(Lorg/joda/time/ReadablePartial;I[II)[I
    .registers 6

    .prologue
    .line 306
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public set(Lorg/joda/time/ReadablePartial;I[ILjava/lang/String;Ljava/util/Locale;)[I
    .registers 7

    .prologue
    .line 333
    invoke-direct {p0}, Lorg/joda/time/field/UnsupportedDateTimeField;->unsupported()Ljava/lang/UnsupportedOperationException;

    move-result-object v0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 533
    const-string v0, "UnsupportedDateTimeField"

    return-object v0
.end method
