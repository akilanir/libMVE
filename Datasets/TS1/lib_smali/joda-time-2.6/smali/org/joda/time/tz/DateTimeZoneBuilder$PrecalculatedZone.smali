.class final Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;
.super Lorg/joda/time/DateTimeZone;
.source "DateTimeZoneBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/joda/time/tz/DateTimeZoneBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PrecalculatedZone"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x6c69b735442cb4f9L


# instance fields
.field private final iNameKeys:[Ljava/lang/String;

.field private final iStandardOffsets:[I

.field private final iTailZone:Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

.field private final iTransitions:[J

.field private final iWallOffsets:[I


# direct methods
.method private constructor <init>(Ljava/lang/String;[J[I[I[Ljava/lang/String;Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;)V
    .registers 7

    .prologue
    .line 1503
    invoke-direct {p0, p1}, Lorg/joda/time/DateTimeZone;-><init>(Ljava/lang/String;)V

    .line 1504
    iput-object p2, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTransitions:[J

    .line 1505
    iput-object p3, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iWallOffsets:[I

    .line 1506
    iput-object p4, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iStandardOffsets:[I

    .line 1507
    iput-object p5, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iNameKeys:[Ljava/lang/String;

    .line 1508
    iput-object p6, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTailZone:Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    .line 1509
    return-void
.end method

.method static create(Ljava/lang/String;ZLjava/util/ArrayList;Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;)Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;
    .registers 29
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;",
            ">;",
            "Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;",
            ")",
            "Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;"
        }
    .end annotation

    .prologue
    .line 1392
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 1393
    if-nez v5, :cond_c

    .line 1394
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v2

    .line 1397
    :cond_c
    new-array v11, v5, [J

    .line 1398
    new-array v12, v5, [I

    .line 1399
    new-array v13, v5, [I

    .line 1400
    new-array v14, v5, [Ljava/lang/String;

    .line 1402
    const/4 v3, 0x0

    .line 1403
    const/4 v2, 0x0

    move-object v4, v3

    move v3, v2

    :goto_18
    if-ge v3, v5, :cond_4c

    .line 1404
    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;

    .line 1406
    invoke-virtual {v2, v4}, Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;->isTransitionFrom(Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;)Z

    move-result v4

    if-nez v4, :cond_30

    .line 1407
    new-instance v2, Ljava/lang/IllegalArgumentException;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1410
    :cond_30
    invoke-virtual {v2}, Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;->getMillis()J

    move-result-wide v6

    aput-wide v6, v11, v3

    .line 1411
    invoke-virtual {v2}, Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;->getWallOffset()I

    move-result v4

    aput v4, v12, v3

    .line 1412
    invoke-virtual {v2}, Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;->getStandardOffset()I

    move-result v4

    aput v4, v13, v3

    .line 1413
    invoke-virtual {v2}, Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;->getNameKey()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v14, v3

    .line 1403
    add-int/lit8 v3, v3, 0x1

    move-object v4, v2

    goto :goto_18

    .line 1420
    :cond_4c
    const/4 v2, 0x5

    new-array v3, v2, [Ljava/lang/String;

    .line 1421
    new-instance v2, Ljava/text/DateFormatSymbols;

    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v2, v4}, Ljava/text/DateFormatSymbols;-><init>(Ljava/util/Locale;)V

    invoke-virtual {v2}, Ljava/text/DateFormatSymbols;->getZoneStrings()[[Ljava/lang/String;

    move-result-object v4

    .line 1422
    const/4 v2, 0x0

    move-object v9, v3

    :goto_5c
    array-length v3, v4

    if-ge v2, v3, :cond_76

    .line 1423
    aget-object v3, v4, v2

    .line 1424
    if-eqz v3, :cond_20e

    array-length v5, v3

    const/4 v6, 0x5

    if-ne v5, v6, :cond_20e

    const/4 v5, 0x0

    aget-object v5, v3, v5

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_20e

    .line 1422
    :goto_72
    add-int/lit8 v2, v2, 0x1

    move-object v9, v3

    goto :goto_5c

    .line 1429
    :cond_76
    invoke-static {}, Lorg/joda/time/chrono/ISOChronology;->getInstanceUTC()Lorg/joda/time/chrono/ISOChronology;

    move-result-object v8

    .line 1431
    const/4 v2, 0x0

    move v10, v2

    :goto_7c
    array-length v2, v14

    add-int/lit8 v2, v2, -0x1

    if-ge v10, v2, :cond_17b

    .line 1432
    aget-object v15, v14, v10

    .line 1433
    add-int/lit8 v2, v10, 0x1

    aget-object v16, v14, v2

    .line 1434
    aget v2, v12, v10

    int-to-long v0, v2

    move-wide/from16 v17, v0

    .line 1435
    add-int/lit8 v2, v10, 0x1

    aget v2, v12, v2

    int-to-long v0, v2

    move-wide/from16 v19, v0

    .line 1436
    aget v2, v13, v10

    int-to-long v0, v2

    move-wide/from16 v21, v0

    .line 1437
    add-int/lit8 v2, v10, 0x1

    aget v2, v13, v2

    int-to-long v0, v2

    move-wide/from16 v23, v0

    .line 1438
    new-instance v2, Lorg/joda/time/Period;

    aget-wide v3, v11, v10

    add-int/lit8 v5, v10, 0x1

    aget-wide v5, v11, v5

    invoke-static {}, Lorg/joda/time/PeriodType;->yearMonthDay()Lorg/joda/time/PeriodType;

    move-result-object v7

    invoke-direct/range {v2 .. v8}, Lorg/joda/time/Period;-><init>(JJLorg/joda/time/PeriodType;Lorg/joda/time/Chronology;)V

    .line 1439
    cmp-long v3, v17, v19

    if-eqz v3, :cond_152

    cmp-long v3, v21, v23

    if-nez v3, :cond_152

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_152

    invoke-virtual {v2}, Lorg/joda/time/Period;->getYears()I

    move-result v3

    if-nez v3, :cond_152

    invoke-virtual {v2}, Lorg/joda/time/Period;->getMonths()I

    move-result v3

    const/4 v4, 0x4

    if-le v3, v4, :cond_152

    invoke-virtual {v2}, Lorg/joda/time/Period;->getMonths()I

    move-result v2

    const/16 v3, 0x8

    if-ge v2, v3, :cond_152

    const/4 v2, 0x2

    aget-object v2, v9, v2

    invoke-virtual {v15, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_152

    const/4 v2, 0x4

    aget-object v2, v9, v2

    invoke-virtual {v15, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_152

    .line 1446
    invoke-static {}, Lorg/joda/time/tz/ZoneInfoCompiler;->verbose()Z

    move-result v2

    if-eqz v2, :cond_135

    .line 1447
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Fixing duplicate name key - "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1448
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "     - "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    new-instance v4, Lorg/joda/time/DateTime;

    aget-wide v5, v11, v10

    invoke-direct {v4, v5, v6, v8}, Lorg/joda/time/DateTime;-><init>(JLorg/joda/time/Chronology;)V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " - "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    new-instance v4, Lorg/joda/time/DateTime;

    add-int/lit8 v5, v10, 0x1

    aget-wide v5, v11, v5

    invoke-direct {v4, v5, v6, v8}, Lorg/joda/time/DateTime;-><init>(JLorg/joda/time/Chronology;)V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1451
    :cond_135
    cmp-long v2, v17, v19

    if-lez v2, :cond_157

    .line 1452
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "-Summer"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v14, v10

    .line 1431
    :cond_152
    :goto_152
    add-int/lit8 v2, v10, 0x1

    move v10, v2

    goto/16 :goto_7c

    .line 1453
    :cond_157
    cmp-long v2, v17, v19

    if-gez v2, :cond_152

    .line 1454
    add-int/lit8 v2, v10, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "-Summer"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v14, v2

    .line 1455
    add-int/lit8 v10, v10, 0x1

    goto :goto_152

    .line 1460
    :cond_17b
    if-eqz p3, :cond_20b

    .line 1461
    move-object/from16 v0, p3

    iget-object v2, v0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStartRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    invoke-virtual {v2}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->getNameKey()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p3

    iget-object v3, v0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iEndRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    invoke-virtual {v3}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->getNameKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_20b

    .line 1463
    invoke-static {}, Lorg/joda/time/tz/ZoneInfoCompiler;->verbose()Z

    move-result v2

    if-eqz v2, :cond_1b9

    .line 1464
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Fixing duplicate recurrent name key - "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p3

    iget-object v4, v0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStartRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    invoke-virtual {v4}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->getNameKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1467
    :cond_1b9
    move-object/from16 v0, p3

    iget-object v2, v0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStartRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    invoke-virtual {v2}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->getSaveMillis()I

    move-result v2

    if-lez v2, :cond_1ec

    .line 1468
    new-instance v8, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    invoke-virtual/range {p3 .. p3}, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->getID()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p3

    iget v3, v0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStandardOffset:I

    move-object/from16 v0, p3

    iget-object v4, v0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStartRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    const-string v5, "-Summer"

    invoke-virtual {v4, v5}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->renameAppend(Ljava/lang/String;)Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    move-result-object v4

    move-object/from16 v0, p3

    iget-object v5, v0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iEndRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    invoke-direct {v8, v2, v3, v4, v5}, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;-><init>(Ljava/lang/String;ILorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;)V

    .line 1483
    :goto_1de
    new-instance v2, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;

    if-eqz p1, :cond_208

    move-object/from16 v3, p0

    :goto_1e4
    move-object v4, v11

    move-object v5, v12

    move-object v6, v13

    move-object v7, v14

    invoke-direct/range {v2 .. v8}, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;-><init>(Ljava/lang/String;[J[I[I[Ljava/lang/String;Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;)V

    return-object v2

    .line 1474
    :cond_1ec
    new-instance v8, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    invoke-virtual/range {p3 .. p3}, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->getID()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p3

    iget v3, v0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStandardOffset:I

    move-object/from16 v0, p3

    iget-object v4, v0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStartRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    move-object/from16 v0, p3

    iget-object v5, v0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iEndRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    const-string v6, "-Summer"

    invoke-virtual {v5, v6}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->renameAppend(Ljava/lang/String;)Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    move-result-object v5

    invoke-direct {v8, v2, v3, v4, v5}, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;-><init>(Ljava/lang/String;ILorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;)V

    goto :goto_1de

    .line 1483
    :cond_208
    const-string v3, ""

    goto :goto_1e4

    :cond_20b
    move-object/from16 v8, p3

    goto :goto_1de

    :cond_20e
    move-object v3, v9

    goto/16 :goto_72
.end method

.method static readFrom(Ljava/io/DataInput;Ljava/lang/String;)Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 1344
    invoke-interface {p0}, Ljava/io/DataInput;->readUnsignedShort()I

    move-result v6

    .line 1345
    new-array v7, v6, [Ljava/lang/String;

    move v1, v0

    .line 1346
    :goto_8
    if-ge v1, v6, :cond_13

    .line 1347
    invoke-interface {p0}, Ljava/io/DataInput;->readUTF()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v7, v1

    .line 1346
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 1350
    :cond_13
    invoke-interface {p0}, Ljava/io/DataInput;->readInt()I

    move-result v8

    .line 1351
    new-array v2, v8, [J

    .line 1352
    new-array v3, v8, [I

    .line 1353
    new-array v4, v8, [I

    .line 1354
    new-array v5, v8, [Ljava/lang/String;

    move v1, v0

    .line 1356
    :goto_20
    if-ge v1, v8, :cond_54

    .line 1357
    invoke-static {p0}, Lorg/joda/time/tz/DateTimeZoneBuilder;->readMillis(Ljava/io/DataInput;)J

    move-result-wide v9

    aput-wide v9, v2, v1

    .line 1358
    invoke-static {p0}, Lorg/joda/time/tz/DateTimeZoneBuilder;->readMillis(Ljava/io/DataInput;)J

    move-result-wide v9

    long-to-int v0, v9

    aput v0, v3, v1

    .line 1359
    invoke-static {p0}, Lorg/joda/time/tz/DateTimeZoneBuilder;->readMillis(Ljava/io/DataInput;)J

    move-result-wide v9

    long-to-int v0, v9

    aput v0, v4, v1

    .line 1362
    const/16 v0, 0x100

    if-ge v6, v0, :cond_46

    .line 1363
    :try_start_3a
    invoke-interface {p0}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    .line 1367
    :goto_3e
    aget-object v0, v7, v0

    aput-object v0, v5, v1

    .line 1356
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_20

    .line 1365
    :cond_46
    invoke-interface {p0}, Ljava/io/DataInput;->readUnsignedShort()I
    :try_end_49
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_3a .. :try_end_49} :catch_4b

    move-result v0

    goto :goto_3e

    .line 1368
    :catch_4b
    move-exception v0

    .line 1369
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid encoding"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1373
    :cond_54
    const/4 v6, 0x0

    .line 1374
    invoke-interface {p0}, Ljava/io/DataInput;->readBoolean()Z

    move-result v0

    if-eqz v0, :cond_5f

    .line 1375
    invoke-static {p0, p1}, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->readFrom(Ljava/io/DataInput;Ljava/lang/String;)Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    move-result-object v6

    .line 1378
    :cond_5f
    new-instance v0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;-><init>(Ljava/lang/String;[J[I[I[Ljava/lang/String;Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1622
    if-ne p0, p1, :cond_5

    .line 1637
    :cond_4
    :goto_4
    return v0

    .line 1625
    :cond_5
    instance-of v2, p1, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;

    if-eqz v2, :cond_56

    .line 1626
    check-cast p1, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;

    .line 1627
    invoke-virtual {p0}, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->getID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->getID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_49

    iget-object v2, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTransitions:[J

    iget-object v3, p1, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTransitions:[J

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([J[J)Z

    move-result v2

    if-eqz v2, :cond_49

    iget-object v2, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iNameKeys:[Ljava/lang/String;

    iget-object v3, p1, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iNameKeys:[Ljava/lang/String;

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_49

    iget-object v2, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iWallOffsets:[I

    iget-object v3, p1, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iWallOffsets:[I

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v2

    if-eqz v2, :cond_49

    iget-object v2, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iStandardOffsets:[I

    iget-object v3, p1, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iStandardOffsets:[I

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v2

    if-eqz v2, :cond_49

    iget-object v2, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTailZone:Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    if-nez v2, :cond_4b

    iget-object v2, p1, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTailZone:Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    if-eqz v2, :cond_4

    :cond_49
    move v0, v1

    goto :goto_4

    :cond_4b
    iget-object v2, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTailZone:Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    iget-object v3, p1, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTailZone:Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    invoke-virtual {v2, v3}, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_49

    goto :goto_4

    :cond_56
    move v0, v1

    .line 1637
    goto :goto_4
.end method

.method public getNameKey(J)Ljava/lang/String;
    .registers 5

    .prologue
    .line 1512
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTransitions:[J

    .line 1513
    invoke-static {v0, p1, p2}, Ljava/util/Arrays;->binarySearch([JJ)I

    move-result v1

    .line 1514
    if-ltz v1, :cond_d

    .line 1515
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iNameKeys:[Ljava/lang/String;

    aget-object v0, v0, v1

    .line 1527
    :goto_c
    return-object v0

    .line 1517
    :cond_d
    xor-int/lit8 v1, v1, -0x1

    .line 1518
    array-length v0, v0

    if-ge v1, v0, :cond_1e

    .line 1519
    if-lez v1, :cond_1b

    .line 1520
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iNameKeys:[Ljava/lang/String;

    add-int/lit8 v1, v1, -0x1

    aget-object v0, v0, v1

    goto :goto_c

    .line 1522
    :cond_1b
    const-string v0, "UTC"

    goto :goto_c

    .line 1524
    :cond_1e
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTailZone:Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    if-nez v0, :cond_29

    .line 1525
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iNameKeys:[Ljava/lang/String;

    add-int/lit8 v1, v1, -0x1

    aget-object v0, v0, v1

    goto :goto_c

    .line 1527
    :cond_29
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTailZone:Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->getNameKey(J)Ljava/lang/String;

    move-result-object v0

    goto :goto_c
.end method

.method public getOffset(J)I
    .registers 5

    .prologue
    .line 1531
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTransitions:[J

    .line 1532
    invoke-static {v0, p1, p2}, Ljava/util/Arrays;->binarySearch([JJ)I

    move-result v1

    .line 1533
    if-ltz v1, :cond_d

    .line 1534
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iWallOffsets:[I

    aget v0, v0, v1

    .line 1546
    :goto_c
    return v0

    .line 1536
    :cond_d
    xor-int/lit8 v1, v1, -0x1

    .line 1537
    array-length v0, v0

    if-ge v1, v0, :cond_1d

    .line 1538
    if-lez v1, :cond_1b

    .line 1539
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iWallOffsets:[I

    add-int/lit8 v1, v1, -0x1

    aget v0, v0, v1

    goto :goto_c

    .line 1541
    :cond_1b
    const/4 v0, 0x0

    goto :goto_c

    .line 1543
    :cond_1d
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTailZone:Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    if-nez v0, :cond_28

    .line 1544
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iWallOffsets:[I

    add-int/lit8 v1, v1, -0x1

    aget v0, v0, v1

    goto :goto_c

    .line 1546
    :cond_28
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTailZone:Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->getOffset(J)I

    move-result v0

    goto :goto_c
.end method

.method public getStandardOffset(J)I
    .registers 5

    .prologue
    .line 1550
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTransitions:[J

    .line 1551
    invoke-static {v0, p1, p2}, Ljava/util/Arrays;->binarySearch([JJ)I

    move-result v1

    .line 1552
    if-ltz v1, :cond_d

    .line 1553
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iStandardOffsets:[I

    aget v0, v0, v1

    .line 1565
    :goto_c
    return v0

    .line 1555
    :cond_d
    xor-int/lit8 v1, v1, -0x1

    .line 1556
    array-length v0, v0

    if-ge v1, v0, :cond_1d

    .line 1557
    if-lez v1, :cond_1b

    .line 1558
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iStandardOffsets:[I

    add-int/lit8 v1, v1, -0x1

    aget v0, v0, v1

    goto :goto_c

    .line 1560
    :cond_1b
    const/4 v0, 0x0

    goto :goto_c

    .line 1562
    :cond_1d
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTailZone:Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    if-nez v0, :cond_28

    .line 1563
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iStandardOffsets:[I

    add-int/lit8 v1, v1, -0x1

    aget v0, v0, v1

    goto :goto_c

    .line 1565
    :cond_28
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTailZone:Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->getStandardOffset(J)I

    move-result v0

    goto :goto_c
.end method

.method public isCachable()Z
    .registers 12

    .prologue
    const/4 v3, 0x0

    const/4 v1, 0x1

    .line 1693
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTailZone:Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    if-eqz v0, :cond_7

    .line 1728
    :cond_6
    :goto_6
    return v1

    .line 1696
    :cond_7
    iget-object v6, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTransitions:[J

    .line 1697
    array-length v0, v6

    if-gt v0, v1, :cond_e

    move v1, v3

    .line 1698
    goto :goto_6

    .line 1703
    :cond_e
    const-wide/16 v4, 0x0

    move v0, v1

    move v2, v3

    .line 1706
    :goto_12
    array-length v7, v6

    if-ge v0, v7, :cond_2c

    .line 1707
    aget-wide v7, v6, v0

    add-int/lit8 v9, v0, -0x1

    aget-wide v9, v6, v9

    sub-long/2addr v7, v9

    .line 1708
    const-wide v9, 0xeb488b400L

    cmp-long v9, v7, v9

    if-gez v9, :cond_29

    .line 1709
    long-to-double v7, v7

    add-double/2addr v4, v7

    .line 1710
    add-int/lit8 v2, v2, 0x1

    .line 1706
    :cond_29
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 1714
    :cond_2c
    if-lez v2, :cond_3c

    .line 1715
    int-to-double v6, v2

    div-double/2addr v4, v6

    .line 1716
    const-wide v6, 0x4194997000000000L    # 8.64E7

    div-double/2addr v4, v6

    .line 1717
    const-wide/high16 v6, 0x4039000000000000L    # 25.0

    cmpl-double v0, v4, v6

    if-gez v0, :cond_6

    :cond_3c
    move v1, v3

    .line 1728
    goto :goto_6
.end method

.method public isFixed()Z
    .registers 2

    .prologue
    .line 1569
    const/4 v0, 0x0

    return v0
.end method

.method public nextTransition(J)J
    .registers 6

    .prologue
    .line 1573
    iget-object v1, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTransitions:[J

    .line 1574
    invoke-static {v1, p1, p2}, Ljava/util/Arrays;->binarySearch([JJ)I

    move-result v0

    .line 1575
    if-ltz v0, :cond_10

    add-int/lit8 v0, v0, 0x1

    .line 1576
    :goto_a
    array-length v2, v1

    if-ge v0, v2, :cond_13

    .line 1577
    aget-wide p1, v1, v0

    .line 1586
    :cond_f
    :goto_f
    return-wide p1

    .line 1575
    :cond_10
    xor-int/lit8 v0, v0, -0x1

    goto :goto_a

    .line 1579
    :cond_13
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTailZone:Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    if-eqz v0, :cond_f

    .line 1582
    array-length v0, v1

    add-int/lit8 v0, v0, -0x1

    aget-wide v0, v1, v0

    .line 1583
    cmp-long v2, p1, v0

    if-gez v2, :cond_21

    move-wide p1, v0

    .line 1586
    :cond_21
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTailZone:Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->nextTransition(J)J

    move-result-wide p1

    goto :goto_f
.end method

.method public previousTransition(J)J
    .registers 12

    .prologue
    const-wide/16 v7, 0x1

    const-wide/high16 v5, -0x8000000000000000L

    .line 1590
    iget-object v2, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTransitions:[J

    .line 1591
    invoke-static {v2, p1, p2}, Ljava/util/Arrays;->binarySearch([JJ)I

    move-result v0

    .line 1592
    if-ltz v0, :cond_12

    .line 1593
    cmp-long v0, p1, v5

    if-lez v0, :cond_11

    .line 1594
    sub-long/2addr p1, v7

    .line 1618
    :cond_11
    :goto_11
    return-wide p1

    .line 1598
    :cond_12
    xor-int/lit8 v3, v0, -0x1

    .line 1599
    array-length v0, v2

    if-ge v3, v0, :cond_24

    .line 1600
    if-lez v3, :cond_11

    .line 1601
    add-int/lit8 v0, v3, -0x1

    aget-wide v0, v2, v0

    .line 1602
    cmp-long v2, v0, v5

    if-lez v2, :cond_11

    .line 1603
    sub-long p1, v0, v7

    goto :goto_11

    .line 1608
    :cond_24
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTailZone:Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    if-eqz v0, :cond_34

    .line 1609
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTailZone:Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->previousTransition(J)J

    move-result-wide v0

    .line 1610
    cmp-long v4, v0, p1

    if-gez v4, :cond_34

    move-wide p1, v0

    .line 1611
    goto :goto_11

    .line 1614
    :cond_34
    add-int/lit8 v0, v3, -0x1

    aget-wide v0, v2, v0

    .line 1615
    cmp-long v2, v0, v5

    if-lez v2, :cond_11

    .line 1616
    sub-long p1, v0, v7

    goto :goto_11
.end method

.method public writeTo(Ljava/io/DataOutput;)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1641
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTransitions:[J

    array-length v3, v0

    .line 1644
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    move v0, v2

    .line 1645
    :goto_a
    if-ge v0, v3, :cond_16

    .line 1646
    iget-object v4, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iNameKeys:[Ljava/lang/String;

    aget-object v4, v4, v0

    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1645
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 1649
    :cond_16
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v4

    .line 1650
    const v0, 0xffff

    if-le v4, v0, :cond_27

    .line 1651
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "String pool is too large"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1653
    :cond_27
    new-array v5, v4, [Ljava/lang/String;

    .line 1654
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move v1, v2

    .line 1655
    :goto_2e
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_40

    .line 1656
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    aput-object v0, v5, v1

    .line 1655
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_2e

    .line 1660
    :cond_40
    invoke-interface {p1, v4}, Ljava/io/DataOutput;->writeShort(I)V

    move v0, v2

    .line 1661
    :goto_44
    if-ge v0, v4, :cond_4e

    .line 1662
    aget-object v1, v5, v0

    invoke-interface {p1, v1}, Ljava/io/DataOutput;->writeUTF(Ljava/lang/String;)V

    .line 1661
    add-int/lit8 v0, v0, 0x1

    goto :goto_44

    .line 1665
    :cond_4e
    invoke-interface {p1, v3}, Ljava/io/DataOutput;->writeInt(I)V

    move v1, v2

    .line 1667
    :goto_52
    if-ge v1, v3, :cond_8c

    .line 1668
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTransitions:[J

    aget-wide v6, v0, v1

    invoke-static {p1, v6, v7}, Lorg/joda/time/tz/DateTimeZoneBuilder;->writeMillis(Ljava/io/DataOutput;J)V

    .line 1669
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iWallOffsets:[I

    aget v0, v0, v1

    int-to-long v6, v0

    invoke-static {p1, v6, v7}, Lorg/joda/time/tz/DateTimeZoneBuilder;->writeMillis(Ljava/io/DataOutput;J)V

    .line 1670
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iStandardOffsets:[I

    aget v0, v0, v1

    int-to-long v6, v0

    invoke-static {p1, v6, v7}, Lorg/joda/time/tz/DateTimeZoneBuilder;->writeMillis(Ljava/io/DataOutput;J)V

    .line 1673
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iNameKeys:[Ljava/lang/String;

    aget-object v6, v0, v1

    move v0, v2

    .line 1674
    :goto_70
    if-ge v0, v4, :cond_81

    .line 1675
    aget-object v7, v5, v0

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_89

    .line 1676
    const/16 v6, 0x100

    if-ge v4, v6, :cond_85

    .line 1677
    invoke-interface {p1, v0}, Ljava/io/DataOutput;->writeByte(I)V

    .line 1667
    :cond_81
    :goto_81
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_52

    .line 1679
    :cond_85
    invoke-interface {p1, v0}, Ljava/io/DataOutput;->writeShort(I)V

    goto :goto_81

    .line 1674
    :cond_89
    add-int/lit8 v0, v0, 0x1

    goto :goto_70

    .line 1686
    :cond_8c
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTailZone:Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    if-eqz v0, :cond_91

    const/4 v2, 0x1

    :cond_91
    invoke-interface {p1, v2}, Ljava/io/DataOutput;->writeBoolean(Z)V

    .line 1687
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTailZone:Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    if-eqz v0, :cond_9d

    .line 1688
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$PrecalculatedZone;->iTailZone:Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    invoke-virtual {v0, p1}, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->writeTo(Ljava/io/DataOutput;)V

    .line 1690
    :cond_9d
    return-void
.end method
