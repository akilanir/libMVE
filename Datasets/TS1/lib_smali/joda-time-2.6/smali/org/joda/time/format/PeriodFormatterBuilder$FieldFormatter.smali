.class Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;
.super Ljava/lang/Object;
.source "PeriodFormatterBuilder.java"

# interfaces
.implements Lorg/joda/time/format/PeriodPrinter;
.implements Lorg/joda/time/format/PeriodParser;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/joda/time/format/PeriodFormatterBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "FieldFormatter"
.end annotation


# instance fields
.field private final iFieldFormatters:[Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;

.field private final iFieldType:I

.field private final iMaxParsedDigits:I

.field private final iMinPrintedDigits:I

.field private final iPrefix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

.field private final iPrintZeroSetting:I

.field private final iRejectSignedValues:Z

.field private final iSuffix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;


# direct methods
.method constructor <init>(IIIZI[Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;)V
    .registers 9

    .prologue
    .line 1358
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1359
    iput p1, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iMinPrintedDigits:I

    .line 1360
    iput p2, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iPrintZeroSetting:I

    .line 1361
    iput p3, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iMaxParsedDigits:I

    .line 1362
    iput-boolean p4, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iRejectSignedValues:Z

    .line 1363
    iput p5, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    .line 1364
    iput-object p6, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldFormatters:[Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;

    .line 1365
    iput-object p7, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iPrefix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    .line 1366
    iput-object p8, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iSuffix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    .line 1367
    return-void
.end method

.method constructor <init>(Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;)V
    .registers 5

    .prologue
    .line 1369
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1370
    iget v0, p1, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iMinPrintedDigits:I

    iput v0, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iMinPrintedDigits:I

    .line 1371
    iget v0, p1, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iPrintZeroSetting:I

    iput v0, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iPrintZeroSetting:I

    .line 1372
    iget v0, p1, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iMaxParsedDigits:I

    iput v0, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iMaxParsedDigits:I

    .line 1373
    iget-boolean v0, p1, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iRejectSignedValues:Z

    iput-boolean v0, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iRejectSignedValues:Z

    .line 1374
    iget v0, p1, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    iput v0, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    .line 1375
    iget-object v0, p1, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldFormatters:[Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;

    iput-object v0, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldFormatters:[Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;

    .line 1376
    iget-object v0, p1, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iPrefix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    iput-object v0, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iPrefix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    .line 1377
    iget-object v0, p1, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iSuffix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    if-eqz v0, :cond_2b

    .line 1378
    new-instance v0, Lorg/joda/time/format/PeriodFormatterBuilder$CompositeAffix;

    iget-object v1, p1, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iSuffix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    invoke-direct {v0, v1, p2}, Lorg/joda/time/format/PeriodFormatterBuilder$CompositeAffix;-><init>(Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;)V

    move-object p2, v0

    .line 1380
    :cond_2b
    iput-object p2, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iSuffix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    .line 1381
    return-void
.end method

.method private parseInt(Ljava/lang/String;II)I
    .registers 9

    .prologue
    const/4 v0, 0x0

    .line 1680
    const/16 v1, 0xa

    if-lt p3, v1, :cond_10

    .line 1682
    add-int v0, p2, p3

    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 1703
    :cond_f
    :goto_f
    return v0

    .line 1684
    :cond_10
    if-lez p3, :cond_f

    .line 1687
    add-int/lit8 v4, p2, 0x1

    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1688
    add-int/lit8 v2, p3, -0x1

    .line 1690
    const/16 v3, 0x2d

    if-ne v1, v3, :cond_41

    .line 1691
    add-int/lit8 v2, v2, -0x1

    if-ltz v2, :cond_f

    .line 1694
    const/4 v0, 0x1

    .line 1695
    add-int/lit8 v3, v4, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1699
    :goto_29
    add-int/lit8 v1, v1, -0x30

    move v4, v3

    .line 1700
    :goto_2c
    add-int/lit8 v3, v2, -0x1

    if-lez v2, :cond_43

    .line 1701
    shl-int/lit8 v2, v1, 0x3

    shl-int/lit8 v1, v1, 0x1

    add-int/2addr v1, v2

    add-int/lit8 v2, v4, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    add-int/2addr v1, v4

    add-int/lit8 v1, v1, -0x30

    move v4, v2

    move v2, v3

    goto :goto_2c

    :cond_41
    move v3, v4

    .line 1697
    goto :goto_29

    .line 1703
    :cond_43
    if-eqz v0, :cond_47

    neg-int v0, v1

    goto :goto_f

    :cond_47
    move v0, v1

    goto :goto_f
.end method


# virtual methods
.method public calculatePrintedLength(Lorg/joda/time/ReadablePeriod;Ljava/util/Locale;)I
    .registers 12

    .prologue
    const-wide/16 v7, 0x3e8

    const-wide/16 v5, 0x0

    .line 1414
    invoke-virtual {p0, p1}, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->getFieldValue(Lorg/joda/time/ReadablePeriod;)J

    move-result-wide v1

    .line 1415
    const-wide v3, 0x7fffffffffffffffL

    cmp-long v0, v1, v3

    if-nez v0, :cond_13

    .line 1416
    const/4 v0, 0x0

    .line 1442
    :cond_12
    :goto_12
    return v0

    .line 1419
    :cond_13
    invoke-static {v1, v2}, Lorg/joda/time/format/FormatUtils;->calculateDigitCount(J)I

    move-result v0

    iget v3, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iMinPrintedDigits:I

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1420
    iget v3, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    const/16 v4, 0x8

    if-lt v3, v4, :cond_40

    .line 1423
    cmp-long v3, v1, v5

    if-gez v3, :cond_58

    const/4 v3, 0x5

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1425
    :goto_2c
    add-int/lit8 v0, v0, 0x1

    .line 1426
    iget v3, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    const/16 v4, 0x9

    if-ne v3, v4, :cond_3f

    invoke-static {v1, v2}, Ljava/lang/Math;->abs(J)J

    move-result-wide v3

    rem-long/2addr v3, v7

    cmp-long v3, v3, v5

    if-nez v3, :cond_3f

    .line 1428
    add-int/lit8 v0, v0, -0x4

    .line 1431
    :cond_3f
    div-long/2addr v1, v7

    .line 1433
    :cond_40
    long-to-int v1, v1

    .line 1435
    iget-object v2, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iPrefix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    if-eqz v2, :cond_4c

    .line 1436
    iget-object v2, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iPrefix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    invoke-interface {v2, v1}, Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;->calculatePrintedLength(I)I

    move-result v2

    add-int/2addr v0, v2

    .line 1438
    :cond_4c
    iget-object v2, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iSuffix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    if-eqz v2, :cond_12

    .line 1439
    iget-object v2, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iSuffix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    invoke-interface {v2, v1}, Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;->calculatePrintedLength(I)I

    move-result v1

    add-int/2addr v0, v1

    goto :goto_12

    .line 1423
    :cond_58
    const/4 v3, 0x4

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_2c
.end method

.method public countFieldsToPrint(Lorg/joda/time/ReadablePeriod;ILjava/util/Locale;)I
    .registers 9

    .prologue
    const/4 v0, 0x0

    .line 1404
    if-gtz p2, :cond_4

    .line 1410
    :cond_3
    :goto_3
    return v0

    .line 1407
    :cond_4
    iget v1, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iPrintZeroSetting:I

    const/4 v2, 0x4

    if-eq v1, v2, :cond_16

    invoke-virtual {p0, p1}, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->getFieldValue(Lorg/joda/time/ReadablePeriod;)J

    move-result-wide v1

    const-wide v3, 0x7fffffffffffffffL

    cmp-long v1, v1, v3

    if-eqz v1, :cond_3

    .line 1408
    :cond_16
    const/4 v0, 0x1

    goto :goto_3
.end method

.method public finish([Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;)V
    .registers 8

    .prologue
    .line 1385
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 1386
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 1387
    array-length v3, p1

    const/4 v0, 0x0

    :goto_c
    if-ge v0, v3, :cond_25

    aget-object v4, p1, v0

    .line 1388
    if-eqz v4, :cond_22

    invoke-virtual {p0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_22

    .line 1389
    iget-object v5, v4, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iPrefix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    invoke-interface {v1, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1390
    iget-object v4, v4, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iSuffix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    invoke-interface {v2, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1387
    :cond_22
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 1394
    :cond_25
    iget-object v0, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iPrefix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    if-eqz v0, :cond_2e

    .line 1395
    iget-object v0, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iPrefix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    invoke-interface {v0, v1}, Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;->finish(Ljava/util/Set;)V

    .line 1398
    :cond_2e
    iget-object v0, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iSuffix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    if-eqz v0, :cond_37

    .line 1399
    iget-object v0, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iSuffix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    invoke-interface {v0, v2}, Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;->finish(Ljava/util/Set;)V

    .line 1401
    :cond_37
    return-void
.end method

.method getFieldType()I
    .registers 2

    .prologue
    .line 1860
    iget v0, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    return v0
.end method

.method getFieldValue(Lorg/joda/time/ReadablePeriod;)J
    .registers 13

    .prologue
    const/16 v10, 0x9

    const-wide v0, 0x7fffffffffffffffL

    .line 1711
    iget v2, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iPrintZeroSetting:I

    const/4 v3, 0x4

    if-ne v2, v3, :cond_19

    .line 1712
    const/4 v2, 0x0

    move-object v5, v2

    .line 1716
    :goto_e
    if-eqz v5, :cond_1f

    iget v2, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    invoke-virtual {p0, v5, v2}, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->isSupported(Lorg/joda/time/PeriodType;I)Z

    move-result v2

    if-nez v2, :cond_1f

    .line 1789
    :cond_18
    :goto_18
    :pswitch_18
    return-wide v0

    .line 1714
    :cond_19
    invoke-interface {p1}, Lorg/joda/time/ReadablePeriod;->getPeriodType()Lorg/joda/time/PeriodType;

    move-result-object v2

    move-object v5, v2

    goto :goto_e

    .line 1722
    :cond_1f
    iget v2, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    packed-switch v2, :pswitch_data_e6

    goto :goto_18

    .line 1726
    :pswitch_25
    invoke-static {}, Lorg/joda/time/DurationFieldType;->years()Lorg/joda/time/DurationFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Lorg/joda/time/ReadablePeriod;->get(Lorg/joda/time/DurationFieldType;)I

    move-result v2

    int-to-long v2, v2

    .line 1758
    :goto_2e
    const-wide/16 v6, 0x0

    cmp-long v4, v2, v6

    if-nez v4, :cond_39

    .line 1759
    iget v4, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iPrintZeroSetting:I

    packed-switch v4, :pswitch_data_fe

    :cond_39
    :pswitch_39
    move-wide v0, v2

    .line 1789
    goto :goto_18

    .line 1729
    :pswitch_3b
    invoke-static {}, Lorg/joda/time/DurationFieldType;->months()Lorg/joda/time/DurationFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Lorg/joda/time/ReadablePeriod;->get(Lorg/joda/time/DurationFieldType;)I

    move-result v2

    int-to-long v2, v2

    .line 1730
    goto :goto_2e

    .line 1732
    :pswitch_45
    invoke-static {}, Lorg/joda/time/DurationFieldType;->weeks()Lorg/joda/time/DurationFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Lorg/joda/time/ReadablePeriod;->get(Lorg/joda/time/DurationFieldType;)I

    move-result v2

    int-to-long v2, v2

    .line 1733
    goto :goto_2e

    .line 1735
    :pswitch_4f
    invoke-static {}, Lorg/joda/time/DurationFieldType;->days()Lorg/joda/time/DurationFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Lorg/joda/time/ReadablePeriod;->get(Lorg/joda/time/DurationFieldType;)I

    move-result v2

    int-to-long v2, v2

    .line 1736
    goto :goto_2e

    .line 1738
    :pswitch_59
    invoke-static {}, Lorg/joda/time/DurationFieldType;->hours()Lorg/joda/time/DurationFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Lorg/joda/time/ReadablePeriod;->get(Lorg/joda/time/DurationFieldType;)I

    move-result v2

    int-to-long v2, v2

    .line 1739
    goto :goto_2e

    .line 1741
    :pswitch_63
    invoke-static {}, Lorg/joda/time/DurationFieldType;->minutes()Lorg/joda/time/DurationFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Lorg/joda/time/ReadablePeriod;->get(Lorg/joda/time/DurationFieldType;)I

    move-result v2

    int-to-long v2, v2

    .line 1742
    goto :goto_2e

    .line 1744
    :pswitch_6d
    invoke-static {}, Lorg/joda/time/DurationFieldType;->seconds()Lorg/joda/time/DurationFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Lorg/joda/time/ReadablePeriod;->get(Lorg/joda/time/DurationFieldType;)I

    move-result v2

    int-to-long v2, v2

    .line 1745
    goto :goto_2e

    .line 1747
    :pswitch_77
    invoke-static {}, Lorg/joda/time/DurationFieldType;->millis()Lorg/joda/time/DurationFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Lorg/joda/time/ReadablePeriod;->get(Lorg/joda/time/DurationFieldType;)I

    move-result v2

    int-to-long v2, v2

    .line 1748
    goto :goto_2e

    .line 1751
    :pswitch_81
    invoke-static {}, Lorg/joda/time/DurationFieldType;->seconds()Lorg/joda/time/DurationFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Lorg/joda/time/ReadablePeriod;->get(Lorg/joda/time/DurationFieldType;)I

    move-result v2

    .line 1752
    invoke-static {}, Lorg/joda/time/DurationFieldType;->millis()Lorg/joda/time/DurationFieldType;

    move-result-object v3

    invoke-interface {p1, v3}, Lorg/joda/time/ReadablePeriod;->get(Lorg/joda/time/DurationFieldType;)I

    move-result v3

    .line 1753
    int-to-long v6, v2

    const-wide/16 v8, 0x3e8

    mul-long/2addr v6, v8

    int-to-long v2, v3

    add-long/2addr v2, v6

    goto :goto_2e

    .line 1763
    :pswitch_98
    invoke-virtual {p0, p1}, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->isZero(Lorg/joda/time/ReadablePeriod;)Z

    move-result v4

    if-eqz v4, :cond_18

    iget-object v4, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldFormatters:[Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;

    iget v6, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    aget-object v4, v4, v6

    if-ne v4, p0, :cond_18

    .line 1764
    iget v4, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    add-int/lit8 v4, v4, 0x1

    :goto_aa
    if-gt v4, v10, :cond_39

    .line 1765
    invoke-virtual {p0, v5, v4}, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->isSupported(Lorg/joda/time/PeriodType;I)Z

    move-result v6

    if-eqz v6, :cond_b8

    iget-object v6, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldFormatters:[Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;

    aget-object v6, v6, v4

    if-nez v6, :cond_18

    .line 1764
    :cond_b8
    add-int/lit8 v4, v4, 0x1

    goto :goto_aa

    .line 1774
    :pswitch_bb
    invoke-virtual {p0, p1}, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->isZero(Lorg/joda/time/ReadablePeriod;)Z

    move-result v4

    if-eqz v4, :cond_18

    iget-object v4, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldFormatters:[Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;

    iget v6, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    aget-object v4, v4, v6

    if-ne v4, p0, :cond_18

    .line 1775
    iget v4, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    const/16 v6, 0x8

    invoke-static {v4, v6}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 1776
    add-int/lit8 v4, v4, -0x1

    .line 1777
    :goto_d3
    if-ltz v4, :cond_39

    if-gt v4, v10, :cond_39

    .line 1778
    invoke-virtual {p0, v5, v4}, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->isSupported(Lorg/joda/time/PeriodType;I)Z

    move-result v6

    if-eqz v6, :cond_e3

    iget-object v6, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldFormatters:[Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;

    aget-object v6, v6, v4

    if-nez v6, :cond_18

    .line 1777
    :cond_e3
    add-int/lit8 v4, v4, -0x1

    goto :goto_d3

    .line 1722
    :pswitch_data_e6
    .packed-switch 0x0
        :pswitch_25
        :pswitch_3b
        :pswitch_45
        :pswitch_4f
        :pswitch_59
        :pswitch_63
        :pswitch_6d
        :pswitch_77
        :pswitch_81
        :pswitch_81
    .end packed-switch

    .line 1759
    :pswitch_data_fe
    .packed-switch 0x1
        :pswitch_bb
        :pswitch_98
        :pswitch_39
        :pswitch_39
        :pswitch_18
    .end packed-switch
.end method

.method isSupported(Lorg/joda/time/PeriodType;I)Z
    .registers 5

    .prologue
    const/4 v0, 0x0

    .line 1802
    packed-switch p2, :pswitch_data_64

    .line 1823
    :cond_4
    :goto_4
    return v0

    .line 1806
    :pswitch_5
    invoke-static {}, Lorg/joda/time/DurationFieldType;->years()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/joda/time/PeriodType;->isSupported(Lorg/joda/time/DurationFieldType;)Z

    move-result v0

    goto :goto_4

    .line 1808
    :pswitch_e
    invoke-static {}, Lorg/joda/time/DurationFieldType;->months()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/joda/time/PeriodType;->isSupported(Lorg/joda/time/DurationFieldType;)Z

    move-result v0

    goto :goto_4

    .line 1810
    :pswitch_17
    invoke-static {}, Lorg/joda/time/DurationFieldType;->weeks()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/joda/time/PeriodType;->isSupported(Lorg/joda/time/DurationFieldType;)Z

    move-result v0

    goto :goto_4

    .line 1812
    :pswitch_20
    invoke-static {}, Lorg/joda/time/DurationFieldType;->days()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/joda/time/PeriodType;->isSupported(Lorg/joda/time/DurationFieldType;)Z

    move-result v0

    goto :goto_4

    .line 1814
    :pswitch_29
    invoke-static {}, Lorg/joda/time/DurationFieldType;->hours()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/joda/time/PeriodType;->isSupported(Lorg/joda/time/DurationFieldType;)Z

    move-result v0

    goto :goto_4

    .line 1816
    :pswitch_32
    invoke-static {}, Lorg/joda/time/DurationFieldType;->minutes()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/joda/time/PeriodType;->isSupported(Lorg/joda/time/DurationFieldType;)Z

    move-result v0

    goto :goto_4

    .line 1818
    :pswitch_3b
    invoke-static {}, Lorg/joda/time/DurationFieldType;->seconds()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/joda/time/PeriodType;->isSupported(Lorg/joda/time/DurationFieldType;)Z

    move-result v0

    goto :goto_4

    .line 1820
    :pswitch_44
    invoke-static {}, Lorg/joda/time/DurationFieldType;->millis()Lorg/joda/time/DurationFieldType;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/joda/time/PeriodType;->isSupported(Lorg/joda/time/DurationFieldType;)Z

    move-result v0

    goto :goto_4

    .line 1823
    :pswitch_4d
    invoke-static {}, Lorg/joda/time/DurationFieldType;->seconds()Lorg/joda/time/DurationFieldType;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/joda/time/PeriodType;->isSupported(Lorg/joda/time/DurationFieldType;)Z

    move-result v1

    if-nez v1, :cond_61

    invoke-static {}, Lorg/joda/time/DurationFieldType;->millis()Lorg/joda/time/DurationFieldType;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/joda/time/PeriodType;->isSupported(Lorg/joda/time/DurationFieldType;)Z

    move-result v1

    if-eqz v1, :cond_4

    :cond_61
    const/4 v0, 0x1

    goto :goto_4

    .line 1802
    nop

    :pswitch_data_64
    .packed-switch 0x0
        :pswitch_5
        :pswitch_e
        :pswitch_17
        :pswitch_20
        :pswitch_29
        :pswitch_32
        :pswitch_3b
        :pswitch_44
        :pswitch_4d
        :pswitch_4d
    .end packed-switch
.end method

.method isZero(Lorg/joda/time/ReadablePeriod;)Z
    .registers 6

    .prologue
    const/4 v0, 0x0

    .line 1793
    invoke-interface {p1}, Lorg/joda/time/ReadablePeriod;->size()I

    move-result v2

    move v1, v0

    :goto_6
    if-ge v1, v2, :cond_12

    .line 1794
    invoke-interface {p1, v1}, Lorg/joda/time/ReadablePeriod;->getValue(I)I

    move-result v3

    if-eqz v3, :cond_f

    .line 1798
    :goto_e
    return v0

    .line 1793
    :cond_f
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 1798
    :cond_12
    const/4 v0, 0x1

    goto :goto_e
.end method

.method public parseInto(Lorg/joda/time/ReadWritablePeriod;Ljava/lang/String;ILjava/util/Locale;)I
    .registers 14

    .prologue
    .line 1515
    iget v0, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iPrintZeroSetting:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_11

    const/4 v0, 0x1

    .line 1518
    :goto_6
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-lt p3, v1, :cond_13

    .line 1519
    if-eqz v0, :cond_10

    xor-int/lit8 p3, p3, -0x1

    .line 1670
    :cond_10
    :goto_10
    return p3

    .line 1515
    :cond_11
    const/4 v0, 0x0

    goto :goto_6

    .line 1522
    :cond_13
    iget-object v1, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iPrefix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    if-eqz v1, :cond_20

    .line 1523
    iget-object v1, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iPrefix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    invoke-interface {v1, p2, p3}, Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;->parse(Ljava/lang/String;I)I

    move-result p3

    .line 1524
    if-ltz p3, :cond_83

    .line 1526
    const/4 v0, 0x1

    .line 1539
    :cond_20
    const/4 v1, -0x1

    .line 1540
    iget-object v2, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iSuffix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    if-eqz v2, :cond_150

    if-nez v0, :cond_150

    .line 1543
    iget-object v1, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iSuffix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    invoke-interface {v1, p2, p3}, Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;->scan(Ljava/lang/String;I)I

    move-result v1

    .line 1544
    if-ltz v1, :cond_88

    .line 1546
    const/4 v0, 0x1

    move v6, v1

    .line 1559
    :goto_31
    if-nez v0, :cond_3f

    invoke-interface {p1}, Lorg/joda/time/ReadWritablePeriod;->getPeriodType()Lorg/joda/time/PeriodType;

    move-result-object v0

    iget v1, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->isSupported(Lorg/joda/time/PeriodType;I)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 1566
    :cond_3f
    if-lez v6, :cond_8f

    .line 1567
    iget v0, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iMaxParsedDigits:I

    sub-int v1, v6, p3

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 1573
    :goto_49
    const/4 v1, 0x0

    .line 1574
    const/4 v3, -0x1

    .line 1575
    const/4 v2, 0x0

    move v4, v0

    move v0, v1

    move v1, p3

    .line 1576
    :goto_4f
    if-ge v0, v4, :cond_7e

    .line 1577
    add-int v5, v1, v0

    invoke-virtual {p2, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 1579
    if-nez v0, :cond_b0

    const/16 v7, 0x2d

    if-eq v5, v7, :cond_61

    const/16 v7, 0x2b

    if-ne v5, v7, :cond_b0

    :cond_61
    iget-boolean v7, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iRejectSignedValues:Z

    if-nez v7, :cond_b0

    .line 1580
    const/16 v7, 0x2d

    if-ne v5, v7, :cond_9b

    const/4 v5, 0x1

    .line 1583
    :goto_6a
    add-int/lit8 v7, v0, 0x1

    if-ge v7, v4, :cond_7e

    add-int v7, v1, v0

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {p2, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x30

    if-lt v7, v8, :cond_7e

    const/16 v8, 0x39

    if-le v7, v8, :cond_9d

    .line 1619
    :cond_7e
    if-nez v2, :cond_e2

    .line 1620
    xor-int/lit8 p3, v1, -0x1

    goto :goto_10

    .line 1529
    :cond_83
    if-nez v0, :cond_10

    .line 1533
    xor-int/lit8 p3, p3, -0x1

    goto :goto_10

    .line 1549
    :cond_88
    if-nez v0, :cond_8d

    .line 1553
    xor-int/lit8 p3, v1, -0x1

    goto :goto_10

    :cond_8d
    move p3, v1

    .line 1555
    goto :goto_10

    .line 1569
    :cond_8f
    iget v0, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iMaxParsedDigits:I

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, p3

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_49

    .line 1580
    :cond_9b
    const/4 v5, 0x0

    goto :goto_6a

    .line 1589
    :cond_9d
    if-eqz v5, :cond_ad

    .line 1590
    add-int/lit8 v0, v0, 0x1

    .line 1596
    :goto_a1
    add-int/lit8 v4, v4, 0x1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v1

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    goto :goto_4f

    .line 1593
    :cond_ad
    add-int/lit8 v1, v1, 0x1

    goto :goto_a1

    .line 1600
    :cond_b0
    const/16 v7, 0x30

    if-lt v5, v7, :cond_bc

    const/16 v7, 0x39

    if-gt v5, v7, :cond_bc

    .line 1601
    const/4 v2, 0x1

    .line 1616
    :goto_b9
    add-int/lit8 v0, v0, 0x1

    .line 1617
    goto :goto_4f

    .line 1603
    :cond_bc
    const/16 v7, 0x2e

    if-eq v5, v7, :cond_c4

    const/16 v7, 0x2c

    if-ne v5, v7, :cond_7e

    :cond_c4
    iget v5, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    const/16 v7, 0x8

    if-eq v5, v7, :cond_d0

    iget v5, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    const/16 v7, 0x9

    if-ne v5, v7, :cond_7e

    .line 1605
    :cond_d0
    if-gez v3, :cond_7e

    .line 1609
    add-int v3, v1, v0

    add-int/lit8 v3, v3, 0x1

    .line 1611
    add-int/lit8 v4, v4, 0x1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v1

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    goto :goto_b9

    .line 1623
    :cond_e2
    if-ltz v6, :cond_eb

    add-int v2, v1, v0

    if-eq v2, v6, :cond_eb

    move p3, v1

    .line 1628
    goto/16 :goto_10

    .line 1631
    :cond_eb
    iget v2, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    const/16 v4, 0x8

    if-eq v2, v4, :cond_110

    iget v2, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    const/16 v4, 0x9

    if-eq v2, v4, :cond_110

    .line 1633
    iget v2, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    invoke-direct {p0, p2, v1, v0}, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->parseInt(Ljava/lang/String;II)I

    move-result v3

    invoke-virtual {p0, p1, v2, v3}, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->setFieldValue(Lorg/joda/time/ReadWritablePeriod;II)V

    .line 1664
    :goto_100
    add-int/2addr v0, v1

    .line 1666
    if-ltz v0, :cond_10d

    iget-object v1, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iSuffix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    if-eqz v1, :cond_10d

    .line 1667
    iget-object v1, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iSuffix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    invoke-interface {v1, p2, v0}, Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;->parse(Ljava/lang/String;I)I

    move-result v0

    :cond_10d
    move p3, v0

    .line 1670
    goto/16 :goto_10

    .line 1634
    :cond_110
    if-gez v3, :cond_120

    .line 1635
    const/4 v2, 0x6

    invoke-direct {p0, p2, v1, v0}, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->parseInt(Ljava/lang/String;II)I

    move-result v3

    invoke-virtual {p0, p1, v2, v3}, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->setFieldValue(Lorg/joda/time/ReadWritablePeriod;II)V

    .line 1636
    const/4 v2, 0x7

    const/4 v3, 0x0

    invoke-virtual {p0, p1, v2, v3}, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->setFieldValue(Lorg/joda/time/ReadWritablePeriod;II)V

    goto :goto_100

    .line 1638
    :cond_120
    sub-int v2, v3, v1

    add-int/lit8 v2, v2, -0x1

    invoke-direct {p0, p2, v1, v2}, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->parseInt(Ljava/lang/String;II)I

    move-result v4

    .line 1639
    const/4 v2, 0x6

    invoke-virtual {p0, p1, v2, v4}, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->setFieldValue(Lorg/joda/time/ReadWritablePeriod;II)V

    .line 1641
    add-int v2, v1, v0

    sub-int/2addr v2, v3

    .line 1643
    if-gtz v2, :cond_137

    .line 1644
    const/4 v2, 0x0

    .line 1661
    :cond_132
    :goto_132
    const/4 v3, 0x7

    invoke-virtual {p0, p1, v3, v2}, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->setFieldValue(Lorg/joda/time/ReadWritablePeriod;II)V

    goto :goto_100

    .line 1646
    :cond_137
    const/4 v5, 0x3

    if-lt v2, v5, :cond_143

    .line 1647
    const/4 v2, 0x3

    invoke-direct {p0, p2, v3, v2}, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->parseInt(Ljava/lang/String;II)I

    move-result v2

    .line 1656
    :goto_13f
    if-gez v4, :cond_132

    .line 1657
    neg-int v2, v2

    goto :goto_132

    .line 1649
    :cond_143
    invoke-direct {p0, p2, v3, v2}, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->parseInt(Ljava/lang/String;II)I

    move-result v3

    .line 1650
    const/4 v5, 0x1

    if-ne v2, v5, :cond_14d

    .line 1651
    mul-int/lit8 v2, v3, 0x64

    goto :goto_13f

    .line 1653
    :cond_14d
    mul-int/lit8 v2, v3, 0xa

    goto :goto_13f

    :cond_150
    move v6, v1

    goto/16 :goto_31
.end method

.method public printTo(Ljava/io/Writer;Lorg/joda/time/ReadablePeriod;Ljava/util/Locale;)V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x3e8

    const/16 v5, 0x8

    .line 1481
    invoke-virtual {p0, p2}, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->getFieldValue(Lorg/joda/time/ReadablePeriod;)J

    move-result-wide v1

    .line 1482
    const-wide v3, 0x7fffffffffffffffL

    cmp-long v0, v1, v3

    if-nez v0, :cond_12

    .line 1509
    :cond_11
    :goto_11
    return-void

    .line 1485
    :cond_12
    long-to-int v0, v1

    .line 1486
    iget v3, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    if-lt v3, v5, :cond_1a

    .line 1487
    div-long v3, v1, v6

    long-to-int v0, v3

    .line 1490
    :cond_1a
    iget-object v3, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iPrefix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    if-eqz v3, :cond_23

    .line 1491
    iget-object v3, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iPrefix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    invoke-interface {v3, p1, v0}, Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;->printTo(Ljava/io/Writer;I)V

    .line 1493
    :cond_23
    iget v3, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iMinPrintedDigits:I

    .line 1494
    const/4 v4, 0x1

    if-gt v3, v4, :cond_4e

    .line 1495
    invoke-static {p1, v0}, Lorg/joda/time/format/FormatUtils;->writeUnpaddedInteger(Ljava/io/Writer;I)V

    .line 1499
    :goto_2b
    iget v3, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    if-lt v3, v5, :cond_44

    .line 1500
    invoke-static {v1, v2}, Ljava/lang/Math;->abs(J)J

    move-result-wide v1

    rem-long/2addr v1, v6

    long-to-int v1, v1

    .line 1501
    iget v2, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    if-eq v2, v5, :cond_3b

    if-lez v1, :cond_44

    .line 1502
    :cond_3b
    const/16 v2, 0x2e

    invoke-virtual {p1, v2}, Ljava/io/Writer;->write(I)V

    .line 1503
    const/4 v2, 0x3

    invoke-static {p1, v1, v2}, Lorg/joda/time/format/FormatUtils;->writePaddedInteger(Ljava/io/Writer;II)V

    .line 1506
    :cond_44
    iget-object v1, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iSuffix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    if-eqz v1, :cond_11

    .line 1507
    iget-object v1, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iSuffix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    invoke-interface {v1, p1, v0}, Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;->printTo(Ljava/io/Writer;I)V

    goto :goto_11

    .line 1497
    :cond_4e
    invoke-static {p1, v0, v3}, Lorg/joda/time/format/FormatUtils;->writePaddedInteger(Ljava/io/Writer;II)V

    goto :goto_2b
.end method

.method public printTo(Ljava/lang/StringBuffer;Lorg/joda/time/ReadablePeriod;Ljava/util/Locale;)V
    .registers 13

    .prologue
    const-wide/16 v7, 0x3e8

    const/16 v6, 0x8

    .line 1446
    invoke-virtual {p0, p2}, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->getFieldValue(Lorg/joda/time/ReadablePeriod;)J

    move-result-wide v1

    .line 1447
    const-wide v3, 0x7fffffffffffffffL

    cmp-long v0, v1, v3

    if-nez v0, :cond_12

    .line 1478
    :cond_11
    :goto_11
    return-void

    .line 1450
    :cond_12
    long-to-int v0, v1

    .line 1451
    iget v3, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    if-lt v3, v6, :cond_1a

    .line 1452
    div-long v3, v1, v7

    long-to-int v0, v3

    .line 1455
    :cond_1a
    iget-object v3, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iPrefix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    if-eqz v3, :cond_23

    .line 1456
    iget-object v3, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iPrefix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    invoke-interface {v3, p1, v0}, Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;->printTo(Ljava/lang/StringBuffer;I)V

    .line 1458
    :cond_23
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result v3

    .line 1459
    iget v4, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iMinPrintedDigits:I

    .line 1460
    const/4 v5, 0x1

    if-gt v4, v5, :cond_63

    .line 1461
    invoke-static {p1, v0}, Lorg/joda/time/format/FormatUtils;->appendUnpaddedInteger(Ljava/lang/StringBuffer;I)V

    .line 1465
    :goto_2f
    iget v4, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    if-lt v4, v6, :cond_59

    .line 1466
    invoke-static {v1, v2}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    rem-long/2addr v4, v7

    long-to-int v4, v4

    .line 1467
    iget v5, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iFieldType:I

    if-eq v5, v6, :cond_3f

    if-lez v4, :cond_59

    .line 1468
    :cond_3f
    const-wide/16 v5, 0x0

    cmp-long v5, v1, v5

    if-gez v5, :cond_50

    const-wide/16 v5, -0x3e8

    cmp-long v1, v1, v5

    if-lez v1, :cond_50

    .line 1469
    const/16 v1, 0x2d

    invoke-virtual {p1, v3, v1}, Ljava/lang/StringBuffer;->insert(IC)Ljava/lang/StringBuffer;

    .line 1471
    :cond_50
    const/16 v1, 0x2e

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1472
    const/4 v1, 0x3

    invoke-static {p1, v4, v1}, Lorg/joda/time/format/FormatUtils;->appendPaddedInteger(Ljava/lang/StringBuffer;II)V

    .line 1475
    :cond_59
    iget-object v1, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iSuffix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    if-eqz v1, :cond_11

    .line 1476
    iget-object v1, p0, Lorg/joda/time/format/PeriodFormatterBuilder$FieldFormatter;->iSuffix:Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    invoke-interface {v1, p1, v0}, Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;->printTo(Ljava/lang/StringBuffer;I)V

    goto :goto_11

    .line 1463
    :cond_63
    invoke-static {p1, v0, v4}, Lorg/joda/time/format/FormatUtils;->appendPaddedInteger(Ljava/lang/StringBuffer;II)V

    goto :goto_2f
.end method

.method setFieldValue(Lorg/joda/time/ReadWritablePeriod;II)V
    .registers 4

    .prologue
    .line 1829
    packed-switch p2, :pswitch_data_24

    .line 1857
    :goto_3
    return-void

    .line 1833
    :pswitch_4
    invoke-interface {p1, p3}, Lorg/joda/time/ReadWritablePeriod;->setYears(I)V

    goto :goto_3

    .line 1836
    :pswitch_8
    invoke-interface {p1, p3}, Lorg/joda/time/ReadWritablePeriod;->setMonths(I)V

    goto :goto_3

    .line 1839
    :pswitch_c
    invoke-interface {p1, p3}, Lorg/joda/time/ReadWritablePeriod;->setWeeks(I)V

    goto :goto_3

    .line 1842
    :pswitch_10
    invoke-interface {p1, p3}, Lorg/joda/time/ReadWritablePeriod;->setDays(I)V

    goto :goto_3

    .line 1845
    :pswitch_14
    invoke-interface {p1, p3}, Lorg/joda/time/ReadWritablePeriod;->setHours(I)V

    goto :goto_3

    .line 1848
    :pswitch_18
    invoke-interface {p1, p3}, Lorg/joda/time/ReadWritablePeriod;->setMinutes(I)V

    goto :goto_3

    .line 1851
    :pswitch_1c
    invoke-interface {p1, p3}, Lorg/joda/time/ReadWritablePeriod;->setSeconds(I)V

    goto :goto_3

    .line 1854
    :pswitch_20
    invoke-interface {p1, p3}, Lorg/joda/time/ReadWritablePeriod;->setMillis(I)V

    goto :goto_3

    .line 1829
    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_4
        :pswitch_8
        :pswitch_c
        :pswitch_10
        :pswitch_14
        :pswitch_18
        :pswitch_1c
        :pswitch_20
    .end packed-switch
.end method
