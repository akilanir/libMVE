.class Lorg/joda/time/format/DateTimeFormatterBuilder$TwoDigitYear;
.super Ljava/lang/Object;
.source "DateTimeFormatterBuilder.java"

# interfaces
.implements Lorg/joda/time/format/InternalPrinter;
.implements Lorg/joda/time/format/InternalParser;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/joda/time/format/DateTimeFormatterBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "TwoDigitYear"
.end annotation


# instance fields
.field private final iLenientParse:Z

.field private final iPivot:I

.field private final iType:Lorg/joda/time/DateTimeFieldType;


# direct methods
.method constructor <init>(Lorg/joda/time/DateTimeFieldType;IZ)V
    .registers 4

    .prologue
    .line 1491
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1492
    iput-object p1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TwoDigitYear;->iType:Lorg/joda/time/DateTimeFieldType;

    .line 1493
    iput p2, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TwoDigitYear;->iPivot:I

    .line 1494
    iput-boolean p3, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TwoDigitYear;->iLenientParse:Z

    .line 1495
    return-void
.end method

.method private getTwoDigitYear(JLorg/joda/time/Chronology;)I
    .registers 5

    .prologue
    .line 1618
    :try_start_0
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TwoDigitYear;->iType:Lorg/joda/time/DateTimeFieldType;

    invoke-virtual {v0, p3}, Lorg/joda/time/DateTimeFieldType;->getField(Lorg/joda/time/Chronology;)Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v0

    .line 1619
    if-gez v0, :cond_d

    .line 1620
    neg-int v0, v0

    .line 1622
    :cond_d
    rem-int/lit8 v0, v0, 0x64
    :try_end_f
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_f} :catch_10

    .line 1624
    :goto_f
    return v0

    .line 1623
    :catch_10
    move-exception v0

    .line 1624
    const/4 v0, -0x1

    goto :goto_f
.end method

.method private getTwoDigitYear(Lorg/joda/time/ReadablePartial;)I
    .registers 3

    .prologue
    .line 1639
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TwoDigitYear;->iType:Lorg/joda/time/DateTimeFieldType;

    invoke-interface {p1, v0}, Lorg/joda/time/ReadablePartial;->isSupported(Lorg/joda/time/DateTimeFieldType;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 1641
    :try_start_8
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TwoDigitYear;->iType:Lorg/joda/time/DateTimeFieldType;

    invoke-interface {p1, v0}, Lorg/joda/time/ReadablePartial;->get(Lorg/joda/time/DateTimeFieldType;)I

    move-result v0

    .line 1642
    if-gez v0, :cond_11

    .line 1643
    neg-int v0, v0

    .line 1645
    :cond_11
    rem-int/lit8 v0, v0, 0x64
    :try_end_13
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_13} :catch_14

    .line 1648
    :goto_13
    return v0

    .line 1646
    :catch_14
    move-exception v0

    .line 1648
    :cond_15
    const/4 v0, -0x1

    goto :goto_13
.end method


# virtual methods
.method public estimateParsedLength()I
    .registers 2

    .prologue
    .line 1498
    iget-boolean v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TwoDigitYear;->iLenientParse:Z

    if-eqz v0, :cond_6

    const/4 v0, 0x4

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x2

    goto :goto_5
.end method

.method public estimatePrintedLength()I
    .registers 2

    .prologue
    .line 1601
    const/4 v0, 0x2

    return v0
.end method

.method public parseInto(Lorg/joda/time/format/DateTimeParserBucket;Ljava/lang/CharSequence;I)I
    .registers 16

    .prologue
    const/4 v2, 0x1

    const/16 v10, 0x39

    const/16 v9, 0x30

    const/4 v8, 0x2

    const/4 v0, 0x0

    .line 1502
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v1

    sub-int/2addr v1, p3

    .line 1504
    iget-boolean v3, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TwoDigitYear;->iLenientParse:Z

    if-nez v3, :cond_19

    .line 1505
    invoke-static {v8, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 1506
    if-ge v1, v8, :cond_9c

    .line 1507
    xor-int/lit8 v1, p3, -0x1

    .line 1597
    :goto_18
    return v1

    :cond_19
    move v3, v0

    move v4, v0

    move v5, v0

    move v6, v1

    .line 1513
    :goto_1d
    if-ge v3, v6, :cond_49

    .line 1514
    add-int v1, p3, v3

    invoke-interface {p2, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    .line 1515
    if-nez v3, :cond_45

    const/16 v7, 0x2d

    if-eq v1, v7, :cond_2f

    const/16 v7, 0x2b

    if-ne v1, v7, :cond_45

    .line 1517
    :cond_2f
    const/16 v4, 0x2d

    if-ne v1, v4, :cond_3b

    move v1, v2

    .line 1518
    :goto_34
    if-eqz v1, :cond_3d

    .line 1519
    add-int/lit8 v3, v3, 0x1

    move v4, v1

    move v5, v2

    goto :goto_1d

    :cond_3b
    move v1, v0

    .line 1517
    goto :goto_34

    .line 1522
    :cond_3d
    add-int/lit8 p3, p3, 0x1

    .line 1523
    add-int/lit8 v4, v6, -0x1

    move v5, v2

    move v6, v4

    move v4, v1

    .line 1525
    goto :goto_1d

    .line 1527
    :cond_45
    if-lt v1, v9, :cond_49

    if-le v1, v10, :cond_4e

    .line 1533
    :cond_49
    if-nez v3, :cond_52

    .line 1534
    xor-int/lit8 v1, p3, -0x1

    goto :goto_18

    .line 1530
    :cond_4e
    add-int/lit8 v1, v3, 0x1

    move v3, v1

    .line 1531
    goto :goto_1d

    .line 1537
    :cond_52
    if-nez v5, :cond_56

    if-eq v3, v8, :cond_9c

    .line 1539
    :cond_56
    const/16 v0, 0x9

    if-lt v3, v0, :cond_6e

    .line 1542
    add-int v1, p3, v3

    invoke-interface {p2, p3, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 1562
    :cond_68
    :goto_68
    iget-object v2, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TwoDigitYear;->iType:Lorg/joda/time/DateTimeFieldType;

    invoke-virtual {p1, v2, v0}, Lorg/joda/time/format/DateTimeParserBucket;->saveField(Lorg/joda/time/DateTimeFieldType;I)V

    goto :goto_18

    .line 1545
    :cond_6e
    if-eqz v4, :cond_ed

    .line 1546
    add-int/lit8 v0, p3, 0x1

    move v1, v0

    .line 1549
    :goto_73
    add-int/lit8 v0, v1, 0x1

    :try_start_75
    invoke-interface {p2, v1}, Ljava/lang/CharSequence;->charAt(I)C
    :try_end_78
    .catch Ljava/lang/StringIndexOutOfBoundsException; {:try_start_75 .. :try_end_78} :catch_94

    move-result v1

    add-int/lit8 v2, v1, -0x30

    .line 1553
    add-int v1, p3, v3

    move v11, v0

    move v0, v2

    move v2, v11

    .line 1554
    :goto_80
    if-ge v2, v1, :cond_98

    .line 1555
    shl-int/lit8 v3, v0, 0x3

    shl-int/lit8 v0, v0, 0x1

    add-int/2addr v3, v0

    add-int/lit8 v0, v2, 0x1

    invoke-interface {p2, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    add-int/2addr v2, v3

    add-int/lit8 v2, v2, -0x30

    move v11, v0

    move v0, v2

    move v2, v11

    goto :goto_80

    .line 1550
    :catch_94
    move-exception v0

    .line 1551
    xor-int/lit8 v1, p3, -0x1

    goto :goto_18

    .line 1557
    :cond_98
    if-eqz v4, :cond_68

    .line 1558
    neg-int v0, v0

    goto :goto_68

    .line 1568
    :cond_9c
    invoke-interface {p2, p3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    .line 1569
    if-lt v1, v9, :cond_a4

    if-le v1, v10, :cond_a8

    .line 1570
    :cond_a4
    xor-int/lit8 v1, p3, -0x1

    goto/16 :goto_18

    .line 1572
    :cond_a8
    add-int/lit8 v1, v1, -0x30

    .line 1573
    add-int/lit8 v2, p3, 0x1

    invoke-interface {p2, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    .line 1574
    if-lt v2, v9, :cond_b4

    if-le v2, v10, :cond_b8

    .line 1575
    :cond_b4
    xor-int/lit8 v1, p3, -0x1

    goto/16 :goto_18

    .line 1577
    :cond_b8
    shl-int/lit8 v3, v1, 0x3

    shl-int/lit8 v1, v1, 0x1

    add-int/2addr v1, v3

    add-int/2addr v1, v2

    add-int/lit8 v2, v1, -0x30

    .line 1579
    iget v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TwoDigitYear;->iPivot:I

    .line 1581
    invoke-virtual {p1}, Lorg/joda/time/format/DateTimeParserBucket;->getPivotYear()Ljava/lang/Integer;

    move-result-object v3

    if-eqz v3, :cond_d0

    .line 1582
    invoke-virtual {p1}, Lorg/joda/time/format/DateTimeParserBucket;->getPivotYear()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 1585
    :cond_d0
    add-int/lit8 v3, v1, -0x32

    .line 1588
    if-ltz v3, :cond_e6

    .line 1589
    rem-int/lit8 v1, v3, 0x64

    .line 1594
    :goto_d6
    if-ge v2, v1, :cond_da

    const/16 v0, 0x64

    :cond_da
    add-int/2addr v0, v3

    sub-int/2addr v0, v1

    add-int/2addr v0, v2

    .line 1596
    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TwoDigitYear;->iType:Lorg/joda/time/DateTimeFieldType;

    invoke-virtual {p1, v1, v0}, Lorg/joda/time/format/DateTimeParserBucket;->saveField(Lorg/joda/time/DateTimeFieldType;I)V

    .line 1597
    add-int/lit8 v1, p3, 0x2

    goto/16 :goto_18

    .line 1591
    :cond_e6
    add-int/lit8 v1, v3, 0x1

    rem-int/lit8 v1, v1, 0x64

    add-int/lit8 v1, v1, 0x63

    goto :goto_d6

    :cond_ed
    move v1, p3

    goto :goto_73
.end method

.method public printTo(Ljava/lang/Appendable;JLorg/joda/time/Chronology;ILorg/joda/time/DateTimeZone;Ljava/util/Locale;)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const v1, 0xfffd

    .line 1607
    invoke-direct {p0, p2, p3, p4}, Lorg/joda/time/format/DateTimeFormatterBuilder$TwoDigitYear;->getTwoDigitYear(JLorg/joda/time/Chronology;)I

    move-result v0

    .line 1608
    if-gez v0, :cond_10

    .line 1609
    invoke-interface {p1, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 1610
    invoke-interface {p1, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 1614
    :goto_f
    return-void

    .line 1612
    :cond_10
    const/4 v1, 0x2

    invoke-static {p1, v0, v1}, Lorg/joda/time/format/FormatUtils;->appendPaddedInteger(Ljava/lang/Appendable;II)V

    goto :goto_f
.end method

.method public printTo(Ljava/lang/Appendable;Lorg/joda/time/ReadablePartial;Ljava/util/Locale;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const v1, 0xfffd

    .line 1629
    invoke-direct {p0, p2}, Lorg/joda/time/format/DateTimeFormatterBuilder$TwoDigitYear;->getTwoDigitYear(Lorg/joda/time/ReadablePartial;)I

    move-result v0

    .line 1630
    if-gez v0, :cond_10

    .line 1631
    invoke-interface {p1, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 1632
    invoke-interface {p1, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 1636
    :goto_f
    return-void

    .line 1634
    :cond_10
    const/4 v1, 0x2

    invoke-static {p1, v0, v1}, Lorg/joda/time/format/FormatUtils;->appendPaddedInteger(Ljava/lang/Appendable;II)V

    goto :goto_f
.end method
