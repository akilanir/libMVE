.class public final Lorg/joda/time/convert/ConverterManager;
.super Ljava/lang/Object;
.source "ConverterManager.java"


# static fields
.field private static INSTANCE:Lorg/joda/time/convert/ConverterManager;


# instance fields
.field private iDurationConverters:Lorg/joda/time/convert/ConverterSet;

.field private iInstantConverters:Lorg/joda/time/convert/ConverterSet;

.field private iIntervalConverters:Lorg/joda/time/convert/ConverterSet;

.field private iPartialConverters:Lorg/joda/time/convert/ConverterSet;

.field private iPeriodConverters:Lorg/joda/time/convert/ConverterSet;


# direct methods
.method protected constructor <init>()V
    .registers 10

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    new-instance v0, Lorg/joda/time/convert/ConverterSet;

    const/4 v1, 0x6

    new-array v1, v1, [Lorg/joda/time/convert/Converter;

    sget-object v2, Lorg/joda/time/convert/ReadableInstantConverter;->INSTANCE:Lorg/joda/time/convert/ReadableInstantConverter;

    aput-object v2, v1, v4

    sget-object v2, Lorg/joda/time/convert/StringConverter;->INSTANCE:Lorg/joda/time/convert/StringConverter;

    aput-object v2, v1, v5

    sget-object v2, Lorg/joda/time/convert/CalendarConverter;->INSTANCE:Lorg/joda/time/convert/CalendarConverter;

    aput-object v2, v1, v6

    sget-object v2, Lorg/joda/time/convert/DateConverter;->INSTANCE:Lorg/joda/time/convert/DateConverter;

    aput-object v2, v1, v7

    sget-object v2, Lorg/joda/time/convert/LongConverter;->INSTANCE:Lorg/joda/time/convert/LongConverter;

    aput-object v2, v1, v8

    const/4 v2, 0x5

    sget-object v3, Lorg/joda/time/convert/NullConverter;->INSTANCE:Lorg/joda/time/convert/NullConverter;

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lorg/joda/time/convert/ConverterSet;-><init>([Lorg/joda/time/convert/Converter;)V

    iput-object v0, p0, Lorg/joda/time/convert/ConverterManager;->iInstantConverters:Lorg/joda/time/convert/ConverterSet;

    .line 116
    new-instance v0, Lorg/joda/time/convert/ConverterSet;

    const/4 v1, 0x7

    new-array v1, v1, [Lorg/joda/time/convert/Converter;

    sget-object v2, Lorg/joda/time/convert/ReadablePartialConverter;->INSTANCE:Lorg/joda/time/convert/ReadablePartialConverter;

    aput-object v2, v1, v4

    sget-object v2, Lorg/joda/time/convert/ReadableInstantConverter;->INSTANCE:Lorg/joda/time/convert/ReadableInstantConverter;

    aput-object v2, v1, v5

    sget-object v2, Lorg/joda/time/convert/StringConverter;->INSTANCE:Lorg/joda/time/convert/StringConverter;

    aput-object v2, v1, v6

    sget-object v2, Lorg/joda/time/convert/CalendarConverter;->INSTANCE:Lorg/joda/time/convert/CalendarConverter;

    aput-object v2, v1, v7

    sget-object v2, Lorg/joda/time/convert/DateConverter;->INSTANCE:Lorg/joda/time/convert/DateConverter;

    aput-object v2, v1, v8

    const/4 v2, 0x5

    sget-object v3, Lorg/joda/time/convert/LongConverter;->INSTANCE:Lorg/joda/time/convert/LongConverter;

    aput-object v3, v1, v2

    const/4 v2, 0x6

    sget-object v3, Lorg/joda/time/convert/NullConverter;->INSTANCE:Lorg/joda/time/convert/NullConverter;

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lorg/joda/time/convert/ConverterSet;-><init>([Lorg/joda/time/convert/Converter;)V

    iput-object v0, p0, Lorg/joda/time/convert/ConverterManager;->iPartialConverters:Lorg/joda/time/convert/ConverterSet;

    .line 126
    new-instance v0, Lorg/joda/time/convert/ConverterSet;

    const/4 v1, 0x5

    new-array v1, v1, [Lorg/joda/time/convert/Converter;

    sget-object v2, Lorg/joda/time/convert/ReadableDurationConverter;->INSTANCE:Lorg/joda/time/convert/ReadableDurationConverter;

    aput-object v2, v1, v4

    sget-object v2, Lorg/joda/time/convert/ReadableIntervalConverter;->INSTANCE:Lorg/joda/time/convert/ReadableIntervalConverter;

    aput-object v2, v1, v5

    sget-object v2, Lorg/joda/time/convert/StringConverter;->INSTANCE:Lorg/joda/time/convert/StringConverter;

    aput-object v2, v1, v6

    sget-object v2, Lorg/joda/time/convert/LongConverter;->INSTANCE:Lorg/joda/time/convert/LongConverter;

    aput-object v2, v1, v7

    sget-object v2, Lorg/joda/time/convert/NullConverter;->INSTANCE:Lorg/joda/time/convert/NullConverter;

    aput-object v2, v1, v8

    invoke-direct {v0, v1}, Lorg/joda/time/convert/ConverterSet;-><init>([Lorg/joda/time/convert/Converter;)V

    iput-object v0, p0, Lorg/joda/time/convert/ConverterManager;->iDurationConverters:Lorg/joda/time/convert/ConverterSet;

    .line 134
    new-instance v0, Lorg/joda/time/convert/ConverterSet;

    const/4 v1, 0x5

    new-array v1, v1, [Lorg/joda/time/convert/Converter;

    sget-object v2, Lorg/joda/time/convert/ReadableDurationConverter;->INSTANCE:Lorg/joda/time/convert/ReadableDurationConverter;

    aput-object v2, v1, v4

    sget-object v2, Lorg/joda/time/convert/ReadablePeriodConverter;->INSTANCE:Lorg/joda/time/convert/ReadablePeriodConverter;

    aput-object v2, v1, v5

    sget-object v2, Lorg/joda/time/convert/ReadableIntervalConverter;->INSTANCE:Lorg/joda/time/convert/ReadableIntervalConverter;

    aput-object v2, v1, v6

    sget-object v2, Lorg/joda/time/convert/StringConverter;->INSTANCE:Lorg/joda/time/convert/StringConverter;

    aput-object v2, v1, v7

    sget-object v2, Lorg/joda/time/convert/NullConverter;->INSTANCE:Lorg/joda/time/convert/NullConverter;

    aput-object v2, v1, v8

    invoke-direct {v0, v1}, Lorg/joda/time/convert/ConverterSet;-><init>([Lorg/joda/time/convert/Converter;)V

    iput-object v0, p0, Lorg/joda/time/convert/ConverterManager;->iPeriodConverters:Lorg/joda/time/convert/ConverterSet;

    .line 142
    new-instance v0, Lorg/joda/time/convert/ConverterSet;

    new-array v1, v7, [Lorg/joda/time/convert/Converter;

    sget-object v2, Lorg/joda/time/convert/ReadableIntervalConverter;->INSTANCE:Lorg/joda/time/convert/ReadableIntervalConverter;

    aput-object v2, v1, v4

    sget-object v2, Lorg/joda/time/convert/StringConverter;->INSTANCE:Lorg/joda/time/convert/StringConverter;

    aput-object v2, v1, v5

    sget-object v2, Lorg/joda/time/convert/NullConverter;->INSTANCE:Lorg/joda/time/convert/NullConverter;

    aput-object v2, v1, v6

    invoke-direct {v0, v1}, Lorg/joda/time/convert/ConverterSet;-><init>([Lorg/joda/time/convert/Converter;)V

    iput-object v0, p0, Lorg/joda/time/convert/ConverterManager;->iIntervalConverters:Lorg/joda/time/convert/ConverterSet;

    .line 147
    return-void
.end method

.method private checkAlterDurationConverters()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 404
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v0

    .line 405
    if-eqz v0, :cond_10

    .line 406
    new-instance v1, Lorg/joda/time/JodaTimePermission;

    const-string v2, "ConverterManager.alterDurationConverters"

    invoke-direct {v1, v2}, Lorg/joda/time/JodaTimePermission;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/SecurityManager;->checkPermission(Ljava/security/Permission;)V

    .line 408
    :cond_10
    return-void
.end method

.method private checkAlterInstantConverters()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 230
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v0

    .line 231
    if-eqz v0, :cond_10

    .line 232
    new-instance v1, Lorg/joda/time/JodaTimePermission;

    const-string v2, "ConverterManager.alterInstantConverters"

    invoke-direct {v1, v2}, Lorg/joda/time/JodaTimePermission;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/SecurityManager;->checkPermission(Ljava/security/Permission;)V

    .line 234
    :cond_10
    return-void
.end method

.method private checkAlterIntervalConverters()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 578
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v0

    .line 579
    if-eqz v0, :cond_10

    .line 580
    new-instance v1, Lorg/joda/time/JodaTimePermission;

    const-string v2, "ConverterManager.alterIntervalConverters"

    invoke-direct {v1, v2}, Lorg/joda/time/JodaTimePermission;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/SecurityManager;->checkPermission(Ljava/security/Permission;)V

    .line 582
    :cond_10
    return-void
.end method

.method private checkAlterPartialConverters()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 317
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v0

    .line 318
    if-eqz v0, :cond_10

    .line 319
    new-instance v1, Lorg/joda/time/JodaTimePermission;

    const-string v2, "ConverterManager.alterPartialConverters"

    invoke-direct {v1, v2}, Lorg/joda/time/JodaTimePermission;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/SecurityManager;->checkPermission(Ljava/security/Permission;)V

    .line 321
    :cond_10
    return-void
.end method

.method private checkAlterPeriodConverters()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 491
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v0

    .line 492
    if-eqz v0, :cond_10

    .line 493
    new-instance v1, Lorg/joda/time/JodaTimePermission;

    const-string v2, "ConverterManager.alterPeriodConverters"

    invoke-direct {v1, v2}, Lorg/joda/time/JodaTimePermission;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/SecurityManager;->checkPermission(Ljava/security/Permission;)V

    .line 495
    :cond_10
    return-void
.end method

.method public static getInstance()Lorg/joda/time/convert/ConverterManager;
    .registers 1

    .prologue
    .line 89
    sget-object v0, Lorg/joda/time/convert/ConverterManager;->INSTANCE:Lorg/joda/time/convert/ConverterManager;

    if-nez v0, :cond_b

    .line 90
    new-instance v0, Lorg/joda/time/convert/ConverterManager;

    invoke-direct {v0}, Lorg/joda/time/convert/ConverterManager;-><init>()V

    sput-object v0, Lorg/joda/time/convert/ConverterManager;->INSTANCE:Lorg/joda/time/convert/ConverterManager;

    .line 92
    :cond_b
    sget-object v0, Lorg/joda/time/convert/ConverterManager;->INSTANCE:Lorg/joda/time/convert/ConverterManager;

    return-object v0
.end method


# virtual methods
.method public addDurationConverter(Lorg/joda/time/convert/DurationConverter;)Lorg/joda/time/convert/DurationConverter;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 370
    invoke-direct {p0}, Lorg/joda/time/convert/ConverterManager;->checkAlterDurationConverters()V

    .line 371
    if-nez p1, :cond_7

    .line 372
    const/4 v0, 0x0

    .line 376
    :goto_6
    return-object v0

    .line 374
    :cond_7
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/joda/time/convert/DurationConverter;

    .line 375
    iget-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iDurationConverters:Lorg/joda/time/convert/ConverterSet;

    invoke-virtual {v1, p1, v0}, Lorg/joda/time/convert/ConverterSet;->add(Lorg/joda/time/convert/Converter;[Lorg/joda/time/convert/Converter;)Lorg/joda/time/convert/ConverterSet;

    move-result-object v1

    iput-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iDurationConverters:Lorg/joda/time/convert/ConverterSet;

    .line 376
    const/4 v1, 0x0

    aget-object v0, v0, v1

    goto :goto_6
.end method

.method public addInstantConverter(Lorg/joda/time/convert/InstantConverter;)Lorg/joda/time/convert/InstantConverter;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 196
    invoke-direct {p0}, Lorg/joda/time/convert/ConverterManager;->checkAlterInstantConverters()V

    .line 197
    if-nez p1, :cond_7

    .line 198
    const/4 v0, 0x0

    .line 202
    :goto_6
    return-object v0

    .line 200
    :cond_7
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/joda/time/convert/InstantConverter;

    .line 201
    iget-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iInstantConverters:Lorg/joda/time/convert/ConverterSet;

    invoke-virtual {v1, p1, v0}, Lorg/joda/time/convert/ConverterSet;->add(Lorg/joda/time/convert/Converter;[Lorg/joda/time/convert/Converter;)Lorg/joda/time/convert/ConverterSet;

    move-result-object v1

    iput-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iInstantConverters:Lorg/joda/time/convert/ConverterSet;

    .line 202
    const/4 v1, 0x0

    aget-object v0, v0, v1

    goto :goto_6
.end method

.method public addIntervalConverter(Lorg/joda/time/convert/IntervalConverter;)Lorg/joda/time/convert/IntervalConverter;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 544
    invoke-direct {p0}, Lorg/joda/time/convert/ConverterManager;->checkAlterIntervalConverters()V

    .line 545
    if-nez p1, :cond_7

    .line 546
    const/4 v0, 0x0

    .line 550
    :goto_6
    return-object v0

    .line 548
    :cond_7
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/joda/time/convert/IntervalConverter;

    .line 549
    iget-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iIntervalConverters:Lorg/joda/time/convert/ConverterSet;

    invoke-virtual {v1, p1, v0}, Lorg/joda/time/convert/ConverterSet;->add(Lorg/joda/time/convert/Converter;[Lorg/joda/time/convert/Converter;)Lorg/joda/time/convert/ConverterSet;

    move-result-object v1

    iput-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iIntervalConverters:Lorg/joda/time/convert/ConverterSet;

    .line 550
    const/4 v1, 0x0

    aget-object v0, v0, v1

    goto :goto_6
.end method

.method public addPartialConverter(Lorg/joda/time/convert/PartialConverter;)Lorg/joda/time/convert/PartialConverter;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 283
    invoke-direct {p0}, Lorg/joda/time/convert/ConverterManager;->checkAlterPartialConverters()V

    .line 284
    if-nez p1, :cond_7

    .line 285
    const/4 v0, 0x0

    .line 289
    :goto_6
    return-object v0

    .line 287
    :cond_7
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/joda/time/convert/PartialConverter;

    .line 288
    iget-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iPartialConverters:Lorg/joda/time/convert/ConverterSet;

    invoke-virtual {v1, p1, v0}, Lorg/joda/time/convert/ConverterSet;->add(Lorg/joda/time/convert/Converter;[Lorg/joda/time/convert/Converter;)Lorg/joda/time/convert/ConverterSet;

    move-result-object v1

    iput-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iPartialConverters:Lorg/joda/time/convert/ConverterSet;

    .line 289
    const/4 v1, 0x0

    aget-object v0, v0, v1

    goto :goto_6
.end method

.method public addPeriodConverter(Lorg/joda/time/convert/PeriodConverter;)Lorg/joda/time/convert/PeriodConverter;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 457
    invoke-direct {p0}, Lorg/joda/time/convert/ConverterManager;->checkAlterPeriodConverters()V

    .line 458
    if-nez p1, :cond_7

    .line 459
    const/4 v0, 0x0

    .line 463
    :goto_6
    return-object v0

    .line 461
    :cond_7
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/joda/time/convert/PeriodConverter;

    .line 462
    iget-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iPeriodConverters:Lorg/joda/time/convert/ConverterSet;

    invoke-virtual {v1, p1, v0}, Lorg/joda/time/convert/ConverterSet;->add(Lorg/joda/time/convert/Converter;[Lorg/joda/time/convert/Converter;)Lorg/joda/time/convert/ConverterSet;

    move-result-object v1

    iput-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iPeriodConverters:Lorg/joda/time/convert/ConverterSet;

    .line 463
    const/4 v1, 0x0

    aget-object v0, v0, v1

    goto :goto_6
.end method

.method public getDurationConverter(Ljava/lang/Object;)Lorg/joda/time/convert/DurationConverter;
    .registers 5

    .prologue
    .line 334
    iget-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iDurationConverters:Lorg/joda/time/convert/ConverterSet;

    if-nez p1, :cond_e

    const/4 v0, 0x0

    :goto_5
    invoke-virtual {v1, v0}, Lorg/joda/time/convert/ConverterSet;->select(Ljava/lang/Class;)Lorg/joda/time/convert/Converter;

    move-result-object v0

    check-cast v0, Lorg/joda/time/convert/DurationConverter;

    .line 336
    if-eqz v0, :cond_13

    .line 337
    return-object v0

    .line 334
    :cond_e
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_5

    .line 339
    :cond_13
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No duration converter found for type: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-nez p1, :cond_30

    const-string v0, "null"

    :goto_24
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_30
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_24
.end method

.method public getDurationConverters()[Lorg/joda/time/convert/DurationConverter;
    .registers 3

    .prologue
    .line 350
    iget-object v0, p0, Lorg/joda/time/convert/ConverterManager;->iDurationConverters:Lorg/joda/time/convert/ConverterSet;

    .line 351
    invoke-virtual {v0}, Lorg/joda/time/convert/ConverterSet;->size()I

    move-result v1

    new-array v1, v1, [Lorg/joda/time/convert/DurationConverter;

    .line 352
    invoke-virtual {v0, v1}, Lorg/joda/time/convert/ConverterSet;->copyInto([Lorg/joda/time/convert/Converter;)V

    .line 353
    return-object v1
.end method

.method public getInstantConverter(Ljava/lang/Object;)Lorg/joda/time/convert/InstantConverter;
    .registers 5

    .prologue
    .line 160
    iget-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iInstantConverters:Lorg/joda/time/convert/ConverterSet;

    if-nez p1, :cond_e

    const/4 v0, 0x0

    :goto_5
    invoke-virtual {v1, v0}, Lorg/joda/time/convert/ConverterSet;->select(Ljava/lang/Class;)Lorg/joda/time/convert/Converter;

    move-result-object v0

    check-cast v0, Lorg/joda/time/convert/InstantConverter;

    .line 162
    if-eqz v0, :cond_13

    .line 163
    return-object v0

    .line 160
    :cond_e
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_5

    .line 165
    :cond_13
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No instant converter found for type: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-nez p1, :cond_30

    const-string v0, "null"

    :goto_24
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_30
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_24
.end method

.method public getInstantConverters()[Lorg/joda/time/convert/InstantConverter;
    .registers 3

    .prologue
    .line 176
    iget-object v0, p0, Lorg/joda/time/convert/ConverterManager;->iInstantConverters:Lorg/joda/time/convert/ConverterSet;

    .line 177
    invoke-virtual {v0}, Lorg/joda/time/convert/ConverterSet;->size()I

    move-result v1

    new-array v1, v1, [Lorg/joda/time/convert/InstantConverter;

    .line 178
    invoke-virtual {v0, v1}, Lorg/joda/time/convert/ConverterSet;->copyInto([Lorg/joda/time/convert/Converter;)V

    .line 179
    return-object v1
.end method

.method public getIntervalConverter(Ljava/lang/Object;)Lorg/joda/time/convert/IntervalConverter;
    .registers 5

    .prologue
    .line 508
    iget-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iIntervalConverters:Lorg/joda/time/convert/ConverterSet;

    if-nez p1, :cond_e

    const/4 v0, 0x0

    :goto_5
    invoke-virtual {v1, v0}, Lorg/joda/time/convert/ConverterSet;->select(Ljava/lang/Class;)Lorg/joda/time/convert/Converter;

    move-result-object v0

    check-cast v0, Lorg/joda/time/convert/IntervalConverter;

    .line 510
    if-eqz v0, :cond_13

    .line 511
    return-object v0

    .line 508
    :cond_e
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_5

    .line 513
    :cond_13
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No interval converter found for type: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-nez p1, :cond_30

    const-string v0, "null"

    :goto_24
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_30
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_24
.end method

.method public getIntervalConverters()[Lorg/joda/time/convert/IntervalConverter;
    .registers 3

    .prologue
    .line 524
    iget-object v0, p0, Lorg/joda/time/convert/ConverterManager;->iIntervalConverters:Lorg/joda/time/convert/ConverterSet;

    .line 525
    invoke-virtual {v0}, Lorg/joda/time/convert/ConverterSet;->size()I

    move-result v1

    new-array v1, v1, [Lorg/joda/time/convert/IntervalConverter;

    .line 526
    invoke-virtual {v0, v1}, Lorg/joda/time/convert/ConverterSet;->copyInto([Lorg/joda/time/convert/Converter;)V

    .line 527
    return-object v1
.end method

.method public getPartialConverter(Ljava/lang/Object;)Lorg/joda/time/convert/PartialConverter;
    .registers 5

    .prologue
    .line 247
    iget-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iPartialConverters:Lorg/joda/time/convert/ConverterSet;

    if-nez p1, :cond_e

    const/4 v0, 0x0

    :goto_5
    invoke-virtual {v1, v0}, Lorg/joda/time/convert/ConverterSet;->select(Ljava/lang/Class;)Lorg/joda/time/convert/Converter;

    move-result-object v0

    check-cast v0, Lorg/joda/time/convert/PartialConverter;

    .line 249
    if-eqz v0, :cond_13

    .line 250
    return-object v0

    .line 247
    :cond_e
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_5

    .line 252
    :cond_13
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No partial converter found for type: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-nez p1, :cond_30

    const-string v0, "null"

    :goto_24
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_30
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_24
.end method

.method public getPartialConverters()[Lorg/joda/time/convert/PartialConverter;
    .registers 3

    .prologue
    .line 263
    iget-object v0, p0, Lorg/joda/time/convert/ConverterManager;->iPartialConverters:Lorg/joda/time/convert/ConverterSet;

    .line 264
    invoke-virtual {v0}, Lorg/joda/time/convert/ConverterSet;->size()I

    move-result v1

    new-array v1, v1, [Lorg/joda/time/convert/PartialConverter;

    .line 265
    invoke-virtual {v0, v1}, Lorg/joda/time/convert/ConverterSet;->copyInto([Lorg/joda/time/convert/Converter;)V

    .line 266
    return-object v1
.end method

.method public getPeriodConverter(Ljava/lang/Object;)Lorg/joda/time/convert/PeriodConverter;
    .registers 5

    .prologue
    .line 421
    iget-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iPeriodConverters:Lorg/joda/time/convert/ConverterSet;

    if-nez p1, :cond_e

    const/4 v0, 0x0

    :goto_5
    invoke-virtual {v1, v0}, Lorg/joda/time/convert/ConverterSet;->select(Ljava/lang/Class;)Lorg/joda/time/convert/Converter;

    move-result-object v0

    check-cast v0, Lorg/joda/time/convert/PeriodConverter;

    .line 423
    if-eqz v0, :cond_13

    .line 424
    return-object v0

    .line 421
    :cond_e
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_5

    .line 426
    :cond_13
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No period converter found for type: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-nez p1, :cond_30

    const-string v0, "null"

    :goto_24
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_30
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_24
.end method

.method public getPeriodConverters()[Lorg/joda/time/convert/PeriodConverter;
    .registers 3

    .prologue
    .line 437
    iget-object v0, p0, Lorg/joda/time/convert/ConverterManager;->iPeriodConverters:Lorg/joda/time/convert/ConverterSet;

    .line 438
    invoke-virtual {v0}, Lorg/joda/time/convert/ConverterSet;->size()I

    move-result v1

    new-array v1, v1, [Lorg/joda/time/convert/PeriodConverter;

    .line 439
    invoke-virtual {v0, v1}, Lorg/joda/time/convert/ConverterSet;->copyInto([Lorg/joda/time/convert/Converter;)V

    .line 440
    return-object v1
.end method

.method public removeDurationConverter(Lorg/joda/time/convert/DurationConverter;)Lorg/joda/time/convert/DurationConverter;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 389
    invoke-direct {p0}, Lorg/joda/time/convert/ConverterManager;->checkAlterDurationConverters()V

    .line 390
    if-nez p1, :cond_7

    .line 391
    const/4 v0, 0x0

    .line 395
    :goto_6
    return-object v0

    .line 393
    :cond_7
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/joda/time/convert/DurationConverter;

    .line 394
    iget-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iDurationConverters:Lorg/joda/time/convert/ConverterSet;

    invoke-virtual {v1, p1, v0}, Lorg/joda/time/convert/ConverterSet;->remove(Lorg/joda/time/convert/Converter;[Lorg/joda/time/convert/Converter;)Lorg/joda/time/convert/ConverterSet;

    move-result-object v1

    iput-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iDurationConverters:Lorg/joda/time/convert/ConverterSet;

    .line 395
    const/4 v1, 0x0

    aget-object v0, v0, v1

    goto :goto_6
.end method

.method public removeInstantConverter(Lorg/joda/time/convert/InstantConverter;)Lorg/joda/time/convert/InstantConverter;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 215
    invoke-direct {p0}, Lorg/joda/time/convert/ConverterManager;->checkAlterInstantConverters()V

    .line 216
    if-nez p1, :cond_7

    .line 217
    const/4 v0, 0x0

    .line 221
    :goto_6
    return-object v0

    .line 219
    :cond_7
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/joda/time/convert/InstantConverter;

    .line 220
    iget-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iInstantConverters:Lorg/joda/time/convert/ConverterSet;

    invoke-virtual {v1, p1, v0}, Lorg/joda/time/convert/ConverterSet;->remove(Lorg/joda/time/convert/Converter;[Lorg/joda/time/convert/Converter;)Lorg/joda/time/convert/ConverterSet;

    move-result-object v1

    iput-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iInstantConverters:Lorg/joda/time/convert/ConverterSet;

    .line 221
    const/4 v1, 0x0

    aget-object v0, v0, v1

    goto :goto_6
.end method

.method public removeIntervalConverter(Lorg/joda/time/convert/IntervalConverter;)Lorg/joda/time/convert/IntervalConverter;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 563
    invoke-direct {p0}, Lorg/joda/time/convert/ConverterManager;->checkAlterIntervalConverters()V

    .line 564
    if-nez p1, :cond_7

    .line 565
    const/4 v0, 0x0

    .line 569
    :goto_6
    return-object v0

    .line 567
    :cond_7
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/joda/time/convert/IntervalConverter;

    .line 568
    iget-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iIntervalConverters:Lorg/joda/time/convert/ConverterSet;

    invoke-virtual {v1, p1, v0}, Lorg/joda/time/convert/ConverterSet;->remove(Lorg/joda/time/convert/Converter;[Lorg/joda/time/convert/Converter;)Lorg/joda/time/convert/ConverterSet;

    move-result-object v1

    iput-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iIntervalConverters:Lorg/joda/time/convert/ConverterSet;

    .line 569
    const/4 v1, 0x0

    aget-object v0, v0, v1

    goto :goto_6
.end method

.method public removePartialConverter(Lorg/joda/time/convert/PartialConverter;)Lorg/joda/time/convert/PartialConverter;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 302
    invoke-direct {p0}, Lorg/joda/time/convert/ConverterManager;->checkAlterPartialConverters()V

    .line 303
    if-nez p1, :cond_7

    .line 304
    const/4 v0, 0x0

    .line 308
    :goto_6
    return-object v0

    .line 306
    :cond_7
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/joda/time/convert/PartialConverter;

    .line 307
    iget-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iPartialConverters:Lorg/joda/time/convert/ConverterSet;

    invoke-virtual {v1, p1, v0}, Lorg/joda/time/convert/ConverterSet;->remove(Lorg/joda/time/convert/Converter;[Lorg/joda/time/convert/Converter;)Lorg/joda/time/convert/ConverterSet;

    move-result-object v1

    iput-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iPartialConverters:Lorg/joda/time/convert/ConverterSet;

    .line 308
    const/4 v1, 0x0

    aget-object v0, v0, v1

    goto :goto_6
.end method

.method public removePeriodConverter(Lorg/joda/time/convert/PeriodConverter;)Lorg/joda/time/convert/PeriodConverter;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 476
    invoke-direct {p0}, Lorg/joda/time/convert/ConverterManager;->checkAlterPeriodConverters()V

    .line 477
    if-nez p1, :cond_7

    .line 478
    const/4 v0, 0x0

    .line 482
    :goto_6
    return-object v0

    .line 480
    :cond_7
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/joda/time/convert/PeriodConverter;

    .line 481
    iget-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iPeriodConverters:Lorg/joda/time/convert/ConverterSet;

    invoke-virtual {v1, p1, v0}, Lorg/joda/time/convert/ConverterSet;->remove(Lorg/joda/time/convert/Converter;[Lorg/joda/time/convert/Converter;)Lorg/joda/time/convert/ConverterSet;

    move-result-object v1

    iput-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iPeriodConverters:Lorg/joda/time/convert/ConverterSet;

    .line 482
    const/4 v1, 0x0

    aget-object v0, v0, v1

    goto :goto_6
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 589
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ConverterManager["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iInstantConverters:Lorg/joda/time/convert/ConverterSet;

    invoke-virtual {v1}, Lorg/joda/time/convert/ConverterSet;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " instant,"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iPartialConverters:Lorg/joda/time/convert/ConverterSet;

    invoke-virtual {v1}, Lorg/joda/time/convert/ConverterSet;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " partial,"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iDurationConverters:Lorg/joda/time/convert/ConverterSet;

    invoke-virtual {v1}, Lorg/joda/time/convert/ConverterSet;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " duration,"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iPeriodConverters:Lorg/joda/time/convert/ConverterSet;

    invoke-virtual {v1}, Lorg/joda/time/convert/ConverterSet;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " period,"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/joda/time/convert/ConverterManager;->iIntervalConverters:Lorg/joda/time/convert/ConverterSet;

    invoke-virtual {v1}, Lorg/joda/time/convert/ConverterSet;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " interval]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
