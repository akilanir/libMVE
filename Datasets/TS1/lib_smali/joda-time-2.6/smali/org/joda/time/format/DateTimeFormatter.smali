.class public Lorg/joda/time/format/DateTimeFormatter;
.super Ljava/lang/Object;
.source "DateTimeFormatter.java"


# instance fields
.field private final iChrono:Lorg/joda/time/Chronology;

.field private final iDefaultYear:I

.field private final iLocale:Ljava/util/Locale;

.field private final iOffsetParsed:Z

.field private final iParser:Lorg/joda/time/format/InternalParser;

.field private final iPivotYear:Ljava/lang/Integer;

.field private final iPrinter:Lorg/joda/time/format/InternalPrinter;

.field private final iZone:Lorg/joda/time/DateTimeZone;


# direct methods
.method public constructor <init>(Lorg/joda/time/format/DateTimePrinter;Lorg/joda/time/format/DateTimeParser;)V
    .registers 5

    .prologue
    .line 118
    invoke-static {p1}, Lorg/joda/time/format/DateTimePrinterInternalPrinter;->of(Lorg/joda/time/format/DateTimePrinter;)Lorg/joda/time/format/InternalPrinter;

    move-result-object v0

    invoke-static {p2}, Lorg/joda/time/format/DateTimeParserInternalParser;->of(Lorg/joda/time/format/DateTimeParser;)Lorg/joda/time/format/InternalParser;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/joda/time/format/DateTimeFormatter;-><init>(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;)V

    .line 119
    return-void
.end method

.method constructor <init>(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;)V
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 131
    iput-object p1, p0, Lorg/joda/time/format/DateTimeFormatter;->iPrinter:Lorg/joda/time/format/InternalPrinter;

    .line 132
    iput-object p2, p0, Lorg/joda/time/format/DateTimeFormatter;->iParser:Lorg/joda/time/format/InternalParser;

    .line 133
    iput-object v1, p0, Lorg/joda/time/format/DateTimeFormatter;->iLocale:Ljava/util/Locale;

    .line 134
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iOffsetParsed:Z

    .line 135
    iput-object v1, p0, Lorg/joda/time/format/DateTimeFormatter;->iChrono:Lorg/joda/time/Chronology;

    .line 136
    iput-object v1, p0, Lorg/joda/time/format/DateTimeFormatter;->iZone:Lorg/joda/time/DateTimeZone;

    .line 137
    iput-object v1, p0, Lorg/joda/time/format/DateTimeFormatter;->iPivotYear:Ljava/lang/Integer;

    .line 138
    const/16 v0, 0x7d0

    iput v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iDefaultYear:I

    .line 139
    return-void
.end method

.method private constructor <init>(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;Ljava/util/Locale;ZLorg/joda/time/Chronology;Lorg/joda/time/DateTimeZone;Ljava/lang/Integer;I)V
    .registers 9

    .prologue
    .line 149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 150
    iput-object p1, p0, Lorg/joda/time/format/DateTimeFormatter;->iPrinter:Lorg/joda/time/format/InternalPrinter;

    .line 151
    iput-object p2, p0, Lorg/joda/time/format/DateTimeFormatter;->iParser:Lorg/joda/time/format/InternalParser;

    .line 152
    iput-object p3, p0, Lorg/joda/time/format/DateTimeFormatter;->iLocale:Ljava/util/Locale;

    .line 153
    iput-boolean p4, p0, Lorg/joda/time/format/DateTimeFormatter;->iOffsetParsed:Z

    .line 154
    iput-object p5, p0, Lorg/joda/time/format/DateTimeFormatter;->iChrono:Lorg/joda/time/Chronology;

    .line 155
    iput-object p6, p0, Lorg/joda/time/format/DateTimeFormatter;->iZone:Lorg/joda/time/DateTimeZone;

    .line 156
    iput-object p7, p0, Lorg/joda/time/format/DateTimeFormatter;->iPivotYear:Ljava/lang/Integer;

    .line 157
    iput p8, p0, Lorg/joda/time/format/DateTimeFormatter;->iDefaultYear:I

    .line 158
    return-void
.end method

.method private printTo(Ljava/lang/Appendable;JLorg/joda/time/Chronology;)V
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v9, 0x0

    .line 671
    invoke-direct {p0}, Lorg/joda/time/format/DateTimeFormatter;->requirePrinter()Lorg/joda/time/format/InternalPrinter;

    move-result-object v0

    .line 672
    invoke-direct {p0, p4}, Lorg/joda/time/format/DateTimeFormatter;->selectChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v1

    .line 675
    invoke-virtual {v1}, Lorg/joda/time/Chronology;->getZone()Lorg/joda/time/DateTimeZone;

    move-result-object v6

    .line 676
    invoke-virtual {v6, p2, p3}, Lorg/joda/time/DateTimeZone;->getOffset(J)I

    move-result v5

    .line 677
    int-to-long v2, v5

    add-long/2addr v2, p2

    .line 678
    xor-long v7, p2, v2

    cmp-long v4, v7, v9

    if-gez v4, :cond_24

    int-to-long v7, v5

    xor-long/2addr v7, p2

    cmp-long v4, v7, v9

    if-ltz v4, :cond_24

    .line 680
    sget-object v6, Lorg/joda/time/DateTimeZone;->UTC:Lorg/joda/time/DateTimeZone;

    .line 681
    const/4 v5, 0x0

    move-wide v2, p2

    .line 684
    :cond_24
    invoke-virtual {v1}, Lorg/joda/time/Chronology;->withUTC()Lorg/joda/time/Chronology;

    move-result-object v4

    iget-object v7, p0, Lorg/joda/time/format/DateTimeFormatter;->iLocale:Ljava/util/Locale;

    move-object v1, p1

    invoke-interface/range {v0 .. v7}, Lorg/joda/time/format/InternalPrinter;->printTo(Ljava/lang/Appendable;JLorg/joda/time/Chronology;ILorg/joda/time/DateTimeZone;Ljava/util/Locale;)V

    .line 685
    return-void
.end method

.method private requireParser()Lorg/joda/time/format/InternalParser;
    .registers 3

    .prologue
    .line 953
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iParser:Lorg/joda/time/format/InternalParser;

    .line 954
    if-nez v0, :cond_c

    .line 955
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Parsing not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 957
    :cond_c
    return-object v0
.end method

.method private requirePrinter()Lorg/joda/time/format/InternalPrinter;
    .registers 3

    .prologue
    .line 693
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iPrinter:Lorg/joda/time/format/InternalPrinter;

    .line 694
    if-nez v0, :cond_c

    .line 695
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Printing not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 697
    :cond_c
    return-object v0
.end method

.method private selectChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;
    .registers 4

    .prologue
    .line 968
    invoke-static {p1}, Lorg/joda/time/DateTimeUtils;->getChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v0

    .line 969
    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatter;->iChrono:Lorg/joda/time/Chronology;

    if-eqz v1, :cond_a

    .line 970
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iChrono:Lorg/joda/time/Chronology;

    .line 972
    :cond_a
    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatter;->iZone:Lorg/joda/time/DateTimeZone;

    if-eqz v1, :cond_14

    .line 973
    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatter;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v0, v1}, Lorg/joda/time/Chronology;->withZone(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/Chronology;

    move-result-object v0

    .line 975
    :cond_14
    return-object v0
.end method


# virtual methods
.method public getChronolgy()Lorg/joda/time/Chronology;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 315
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iChrono:Lorg/joda/time/Chronology;

    return-object v0
.end method

.method public getChronology()Lorg/joda/time/Chronology;
    .registers 2

    .prologue
    .line 304
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iChrono:Lorg/joda/time/Chronology;

    return-object v0
.end method

.method public getDefaultYear()I
    .registers 2

    .prologue
    .line 483
    iget v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iDefaultYear:I

    return v0
.end method

.method public getLocale()Ljava/util/Locale;
    .registers 2

    .prologue
    .line 237
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iLocale:Ljava/util/Locale;

    return-object v0
.end method

.method public getParser()Lorg/joda/time/format/DateTimeParser;
    .registers 2

    .prologue
    .line 203
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iParser:Lorg/joda/time/format/InternalParser;

    invoke-static {v0}, Lorg/joda/time/format/InternalParserDateTimeParser;->of(Lorg/joda/time/format/InternalParser;)Lorg/joda/time/format/DateTimeParser;

    move-result-object v0

    return-object v0
.end method

.method getParser0()Lorg/joda/time/format/InternalParser;
    .registers 2

    .prologue
    .line 207
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iParser:Lorg/joda/time/format/InternalParser;

    return-object v0
.end method

.method public getPivotYear()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 449
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iPivotYear:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPrinter()Lorg/joda/time/format/DateTimePrinter;
    .registers 2

    .prologue
    .line 176
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iPrinter:Lorg/joda/time/format/InternalPrinter;

    invoke-static {v0}, Lorg/joda/time/format/InternalPrinterDateTimePrinter;->of(Lorg/joda/time/format/InternalPrinter;)Lorg/joda/time/format/DateTimePrinter;

    move-result-object v0

    return-object v0
.end method

.method getPrinter0()Lorg/joda/time/format/InternalPrinter;
    .registers 2

    .prologue
    .line 185
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iPrinter:Lorg/joda/time/format/InternalPrinter;

    return-object v0
.end method

.method public getZone()Lorg/joda/time/DateTimeZone;
    .registers 2

    .prologue
    .line 368
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iZone:Lorg/joda/time/DateTimeZone;

    return-object v0
.end method

.method public isOffsetParsed()Z
    .registers 2

    .prologue
    .line 270
    iget-boolean v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iOffsetParsed:Z

    return v0
.end method

.method public isParser()Z
    .registers 2

    .prologue
    .line 194
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iParser:Lorg/joda/time/format/InternalParser;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isPrinter()Z
    .registers 2

    .prologue
    .line 167
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iPrinter:Lorg/joda/time/format/InternalPrinter;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public parseDateTime(Ljava/lang/String;)Lorg/joda/time/DateTime;
    .registers 10

    .prologue
    .line 875
    invoke-direct {p0}, Lorg/joda/time/format/DateTimeFormatter;->requireParser()Lorg/joda/time/format/InternalParser;

    move-result-object v7

    .line 877
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatter;->selectChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v3

    .line 878
    new-instance v0, Lorg/joda/time/format/DateTimeParserBucket;

    const-wide/16 v1, 0x0

    iget-object v4, p0, Lorg/joda/time/format/DateTimeFormatter;->iLocale:Ljava/util/Locale;

    iget-object v5, p0, Lorg/joda/time/format/DateTimeFormatter;->iPivotYear:Ljava/lang/Integer;

    iget v6, p0, Lorg/joda/time/format/DateTimeFormatter;->iDefaultYear:I

    invoke-direct/range {v0 .. v6}, Lorg/joda/time/format/DateTimeParserBucket;-><init>(JLorg/joda/time/Chronology;Ljava/util/Locale;Ljava/lang/Integer;I)V

    .line 879
    const/4 v1, 0x0

    invoke-interface {v7, v0, p1, v1}, Lorg/joda/time/format/InternalParser;->parseInto(Lorg/joda/time/format/DateTimeParserBucket;Ljava/lang/CharSequence;I)I

    move-result v1

    .line 880
    if-ltz v1, :cond_61

    .line 881
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v1, v2, :cond_6d

    .line 882
    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Lorg/joda/time/format/DateTimeParserBucket;->computeMillis(ZLjava/lang/String;)J

    move-result-wide v1

    .line 883
    iget-boolean v4, p0, Lorg/joda/time/format/DateTimeFormatter;->iOffsetParsed:Z

    if-eqz v4, :cond_52

    invoke-virtual {v0}, Lorg/joda/time/format/DateTimeParserBucket;->getOffsetInteger()Ljava/lang/Integer;

    move-result-object v4

    if-eqz v4, :cond_52

    .line 884
    invoke-virtual {v0}, Lorg/joda/time/format/DateTimeParserBucket;->getOffsetInteger()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 885
    invoke-static {v0}, Lorg/joda/time/DateTimeZone;->forOffsetMillis(I)Lorg/joda/time/DateTimeZone;

    move-result-object v0

    .line 886
    invoke-virtual {v3, v0}, Lorg/joda/time/Chronology;->withZone(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/Chronology;

    move-result-object v3

    .line 890
    :cond_42
    :goto_42
    new-instance v0, Lorg/joda/time/DateTime;

    invoke-direct {v0, v1, v2, v3}, Lorg/joda/time/DateTime;-><init>(JLorg/joda/time/Chronology;)V

    .line 891
    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatter;->iZone:Lorg/joda/time/DateTimeZone;

    if-eqz v1, :cond_51

    .line 892
    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatter;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v0, v1}, Lorg/joda/time/DateTime;->withZone(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/DateTime;

    move-result-object v0

    .line 894
    :cond_51
    return-object v0

    .line 887
    :cond_52
    invoke-virtual {v0}, Lorg/joda/time/format/DateTimeParserBucket;->getZone()Lorg/joda/time/DateTimeZone;

    move-result-object v4

    if-eqz v4, :cond_42

    .line 888
    invoke-virtual {v0}, Lorg/joda/time/format/DateTimeParserBucket;->getZone()Lorg/joda/time/DateTimeZone;

    move-result-object v0

    invoke-virtual {v3, v0}, Lorg/joda/time/Chronology;->withZone(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/Chronology;

    move-result-object v3

    goto :goto_42

    .line 897
    :cond_61
    xor-int/lit8 v0, v1, -0x1

    .line 899
    :goto_63
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {p1, v0}, Lorg/joda/time/format/FormatUtils;->createErrorMessage(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_6d
    move v0, v1

    goto :goto_63
.end method

.method public parseInto(Lorg/joda/time/ReadWritableInstant;Ljava/lang/String;I)I
    .registers 12

    .prologue
    .line 735
    invoke-direct {p0}, Lorg/joda/time/format/DateTimeFormatter;->requireParser()Lorg/joda/time/format/InternalParser;

    move-result-object v7

    .line 736
    if-nez p1, :cond_e

    .line 737
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Instant must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 740
    :cond_e
    invoke-interface {p1}, Lorg/joda/time/ReadWritableInstant;->getMillis()J

    move-result-wide v0

    .line 741
    invoke-interface {p1}, Lorg/joda/time/ReadWritableInstant;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v3

    .line 742
    invoke-static {v3}, Lorg/joda/time/DateTimeUtils;->getChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v2

    invoke-virtual {v2}, Lorg/joda/time/Chronology;->year()Lorg/joda/time/DateTimeField;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v6

    .line 743
    invoke-virtual {v3}, Lorg/joda/time/Chronology;->getZone()Lorg/joda/time/DateTimeZone;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Lorg/joda/time/DateTimeZone;->getOffset(J)I

    move-result v2

    int-to-long v4, v2

    add-long v1, v0, v4

    .line 744
    invoke-direct {p0, v3}, Lorg/joda/time/format/DateTimeFormatter;->selectChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v3

    .line 746
    new-instance v0, Lorg/joda/time/format/DateTimeParserBucket;

    iget-object v4, p0, Lorg/joda/time/format/DateTimeFormatter;->iLocale:Ljava/util/Locale;

    iget-object v5, p0, Lorg/joda/time/format/DateTimeFormatter;->iPivotYear:Ljava/lang/Integer;

    invoke-direct/range {v0 .. v6}, Lorg/joda/time/format/DateTimeParserBucket;-><init>(JLorg/joda/time/Chronology;Ljava/util/Locale;Ljava/lang/Integer;I)V

    .line 748
    invoke-interface {v7, v0, p2, p3}, Lorg/joda/time/format/InternalParser;->parseInto(Lorg/joda/time/format/DateTimeParserBucket;Ljava/lang/CharSequence;I)I

    move-result v1

    .line 749
    const/4 v2, 0x0

    invoke-virtual {v0, v2, p2}, Lorg/joda/time/format/DateTimeParserBucket;->computeMillis(ZLjava/lang/String;)J

    move-result-wide v4

    invoke-interface {p1, v4, v5}, Lorg/joda/time/ReadWritableInstant;->setMillis(J)V

    .line 750
    iget-boolean v2, p0, Lorg/joda/time/format/DateTimeFormatter;->iOffsetParsed:Z

    if-eqz v2, :cond_6d

    invoke-virtual {v0}, Lorg/joda/time/format/DateTimeParserBucket;->getOffsetInteger()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_6d

    .line 751
    invoke-virtual {v0}, Lorg/joda/time/format/DateTimeParserBucket;->getOffsetInteger()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 752
    invoke-static {v0}, Lorg/joda/time/DateTimeZone;->forOffsetMillis(I)Lorg/joda/time/DateTimeZone;

    move-result-object v0

    .line 753
    invoke-virtual {v3, v0}, Lorg/joda/time/Chronology;->withZone(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/Chronology;

    move-result-object v3

    .line 757
    :cond_60
    :goto_60
    invoke-interface {p1, v3}, Lorg/joda/time/ReadWritableInstant;->setChronology(Lorg/joda/time/Chronology;)V

    .line 758
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iZone:Lorg/joda/time/DateTimeZone;

    if-eqz v0, :cond_6c

    .line 759
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-interface {p1, v0}, Lorg/joda/time/ReadWritableInstant;->setZone(Lorg/joda/time/DateTimeZone;)V

    .line 761
    :cond_6c
    return v1

    .line 754
    :cond_6d
    invoke-virtual {v0}, Lorg/joda/time/format/DateTimeParserBucket;->getZone()Lorg/joda/time/DateTimeZone;

    move-result-object v2

    if-eqz v2, :cond_60

    .line 755
    invoke-virtual {v0}, Lorg/joda/time/format/DateTimeParserBucket;->getZone()Lorg/joda/time/DateTimeZone;

    move-result-object v0

    invoke-virtual {v3, v0}, Lorg/joda/time/Chronology;->withZone(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/Chronology;

    move-result-object v3

    goto :goto_60
.end method

.method public parseLocalDate(Ljava/lang/String;)Lorg/joda/time/LocalDate;
    .registers 3

    .prologue
    .line 798
    invoke-virtual {p0, p1}, Lorg/joda/time/format/DateTimeFormatter;->parseLocalDateTime(Ljava/lang/String;)Lorg/joda/time/LocalDateTime;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/LocalDateTime;->toLocalDate()Lorg/joda/time/LocalDate;

    move-result-object v0

    return-object v0
.end method

.method public parseLocalDateTime(Ljava/lang/String;)Lorg/joda/time/LocalDateTime;
    .registers 10

    .prologue
    .line 834
    invoke-direct {p0}, Lorg/joda/time/format/DateTimeFormatter;->requireParser()Lorg/joda/time/format/InternalParser;

    move-result-object v7

    .line 836
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatter;->selectChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/Chronology;->withUTC()Lorg/joda/time/Chronology;

    move-result-object v3

    .line 837
    new-instance v0, Lorg/joda/time/format/DateTimeParserBucket;

    const-wide/16 v1, 0x0

    iget-object v4, p0, Lorg/joda/time/format/DateTimeFormatter;->iLocale:Ljava/util/Locale;

    iget-object v5, p0, Lorg/joda/time/format/DateTimeFormatter;->iPivotYear:Ljava/lang/Integer;

    iget v6, p0, Lorg/joda/time/format/DateTimeFormatter;->iDefaultYear:I

    invoke-direct/range {v0 .. v6}, Lorg/joda/time/format/DateTimeParserBucket;-><init>(JLorg/joda/time/Chronology;Ljava/util/Locale;Ljava/lang/Integer;I)V

    .line 838
    const/4 v1, 0x0

    invoke-interface {v7, v0, p1, v1}, Lorg/joda/time/format/InternalParser;->parseInto(Lorg/joda/time/format/DateTimeParserBucket;Ljava/lang/CharSequence;I)I

    move-result v1

    .line 839
    if-ltz v1, :cond_57

    .line 840
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v1, v2, :cond_63

    .line 841
    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Lorg/joda/time/format/DateTimeParserBucket;->computeMillis(ZLjava/lang/String;)J

    move-result-wide v1

    .line 842
    invoke-virtual {v0}, Lorg/joda/time/format/DateTimeParserBucket;->getOffsetInteger()Ljava/lang/Integer;

    move-result-object v4

    if-eqz v4, :cond_48

    .line 843
    invoke-virtual {v0}, Lorg/joda/time/format/DateTimeParserBucket;->getOffsetInteger()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 844
    invoke-static {v0}, Lorg/joda/time/DateTimeZone;->forOffsetMillis(I)Lorg/joda/time/DateTimeZone;

    move-result-object v0

    .line 845
    invoke-virtual {v3, v0}, Lorg/joda/time/Chronology;->withZone(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/Chronology;

    move-result-object v3

    .line 849
    :cond_42
    :goto_42
    new-instance v0, Lorg/joda/time/LocalDateTime;

    invoke-direct {v0, v1, v2, v3}, Lorg/joda/time/LocalDateTime;-><init>(JLorg/joda/time/Chronology;)V

    return-object v0

    .line 846
    :cond_48
    invoke-virtual {v0}, Lorg/joda/time/format/DateTimeParserBucket;->getZone()Lorg/joda/time/DateTimeZone;

    move-result-object v4

    if-eqz v4, :cond_42

    .line 847
    invoke-virtual {v0}, Lorg/joda/time/format/DateTimeParserBucket;->getZone()Lorg/joda/time/DateTimeZone;

    move-result-object v0

    invoke-virtual {v3, v0}, Lorg/joda/time/Chronology;->withZone(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/Chronology;

    move-result-object v3

    goto :goto_42

    .line 852
    :cond_57
    xor-int/lit8 v0, v1, -0x1

    .line 854
    :goto_59
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {p1, v0}, Lorg/joda/time/format/FormatUtils;->createErrorMessage(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_63
    move v0, v1

    goto :goto_59
.end method

.method public parseLocalTime(Ljava/lang/String;)Lorg/joda/time/LocalTime;
    .registers 3

    .prologue
    .line 816
    invoke-virtual {p0, p1}, Lorg/joda/time/format/DateTimeFormatter;->parseLocalDateTime(Ljava/lang/String;)Lorg/joda/time/LocalDateTime;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/LocalDateTime;->toLocalTime()Lorg/joda/time/LocalTime;

    move-result-object v0

    return-object v0
.end method

.method public parseMillis(Ljava/lang/String;)J
    .registers 10

    .prologue
    .line 777
    invoke-direct {p0}, Lorg/joda/time/format/DateTimeFormatter;->requireParser()Lorg/joda/time/format/InternalParser;

    move-result-object v7

    .line 778
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iChrono:Lorg/joda/time/Chronology;

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatter;->selectChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v3

    .line 779
    new-instance v0, Lorg/joda/time/format/DateTimeParserBucket;

    const-wide/16 v1, 0x0

    iget-object v4, p0, Lorg/joda/time/format/DateTimeFormatter;->iLocale:Ljava/util/Locale;

    iget-object v5, p0, Lorg/joda/time/format/DateTimeFormatter;->iPivotYear:Ljava/lang/Integer;

    iget v6, p0, Lorg/joda/time/format/DateTimeFormatter;->iDefaultYear:I

    invoke-direct/range {v0 .. v6}, Lorg/joda/time/format/DateTimeParserBucket;-><init>(JLorg/joda/time/Chronology;Ljava/util/Locale;Ljava/lang/Integer;I)V

    .line 780
    invoke-virtual {v0, v7, p1}, Lorg/joda/time/format/DateTimeParserBucket;->doParseMillis(Lorg/joda/time/format/InternalParser;Ljava/lang/CharSequence;)J

    move-result-wide v0

    return-wide v0
.end method

.method public parseMutableDateTime(Ljava/lang/String;)Lorg/joda/time/MutableDateTime;
    .registers 10

    .prologue
    .line 920
    invoke-direct {p0}, Lorg/joda/time/format/DateTimeFormatter;->requireParser()Lorg/joda/time/format/InternalParser;

    move-result-object v7

    .line 922
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatter;->selectChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v3

    .line 923
    new-instance v0, Lorg/joda/time/format/DateTimeParserBucket;

    const-wide/16 v1, 0x0

    iget-object v4, p0, Lorg/joda/time/format/DateTimeFormatter;->iLocale:Ljava/util/Locale;

    iget-object v5, p0, Lorg/joda/time/format/DateTimeFormatter;->iPivotYear:Ljava/lang/Integer;

    iget v6, p0, Lorg/joda/time/format/DateTimeFormatter;->iDefaultYear:I

    invoke-direct/range {v0 .. v6}, Lorg/joda/time/format/DateTimeParserBucket;-><init>(JLorg/joda/time/Chronology;Ljava/util/Locale;Ljava/lang/Integer;I)V

    .line 924
    const/4 v1, 0x0

    invoke-interface {v7, v0, p1, v1}, Lorg/joda/time/format/InternalParser;->parseInto(Lorg/joda/time/format/DateTimeParserBucket;Ljava/lang/CharSequence;I)I

    move-result v1

    .line 925
    if-ltz v1, :cond_60

    .line 926
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v1, v2, :cond_6c

    .line 927
    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Lorg/joda/time/format/DateTimeParserBucket;->computeMillis(ZLjava/lang/String;)J

    move-result-wide v1

    .line 928
    iget-boolean v4, p0, Lorg/joda/time/format/DateTimeFormatter;->iOffsetParsed:Z

    if-eqz v4, :cond_51

    invoke-virtual {v0}, Lorg/joda/time/format/DateTimeParserBucket;->getOffsetInteger()Ljava/lang/Integer;

    move-result-object v4

    if-eqz v4, :cond_51

    .line 929
    invoke-virtual {v0}, Lorg/joda/time/format/DateTimeParserBucket;->getOffsetInteger()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 930
    invoke-static {v0}, Lorg/joda/time/DateTimeZone;->forOffsetMillis(I)Lorg/joda/time/DateTimeZone;

    move-result-object v0

    .line 931
    invoke-virtual {v3, v0}, Lorg/joda/time/Chronology;->withZone(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/Chronology;

    move-result-object v3

    .line 935
    :cond_42
    :goto_42
    new-instance v0, Lorg/joda/time/MutableDateTime;

    invoke-direct {v0, v1, v2, v3}, Lorg/joda/time/MutableDateTime;-><init>(JLorg/joda/time/Chronology;)V

    .line 936
    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatter;->iZone:Lorg/joda/time/DateTimeZone;

    if-eqz v1, :cond_50

    .line 937
    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatter;->iZone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v0, v1}, Lorg/joda/time/MutableDateTime;->setZone(Lorg/joda/time/DateTimeZone;)V

    .line 939
    :cond_50
    return-object v0

    .line 932
    :cond_51
    invoke-virtual {v0}, Lorg/joda/time/format/DateTimeParserBucket;->getZone()Lorg/joda/time/DateTimeZone;

    move-result-object v4

    if-eqz v4, :cond_42

    .line 933
    invoke-virtual {v0}, Lorg/joda/time/format/DateTimeParserBucket;->getZone()Lorg/joda/time/DateTimeZone;

    move-result-object v0

    invoke-virtual {v3, v0}, Lorg/joda/time/Chronology;->withZone(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/Chronology;

    move-result-object v3

    goto :goto_42

    .line 942
    :cond_60
    xor-int/lit8 v0, v1, -0x1

    .line 944
    :goto_62
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {p1, v0}, Lorg/joda/time/format/FormatUtils;->createErrorMessage(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_6c
    move v0, v1

    goto :goto_62
.end method

.method public print(J)Ljava/lang/String;
    .registers 5

    .prologue
    .line 642
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lorg/joda/time/format/DateTimeFormatter;->requirePrinter()Lorg/joda/time/format/InternalPrinter;

    move-result-object v1

    invoke-interface {v1}, Lorg/joda/time/format/InternalPrinter;->estimatePrintedLength()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 644
    :try_start_d
    invoke-virtual {p0, v0, p1, p2}, Lorg/joda/time/format/DateTimeFormatter;->printTo(Ljava/lang/Appendable;J)V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_10} :catch_15

    .line 648
    :goto_10
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 645
    :catch_15
    move-exception v1

    goto :goto_10
.end method

.method public print(Lorg/joda/time/ReadableInstant;)Ljava/lang/String;
    .registers 4

    .prologue
    .line 623
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lorg/joda/time/format/DateTimeFormatter;->requirePrinter()Lorg/joda/time/format/InternalPrinter;

    move-result-object v1

    invoke-interface {v1}, Lorg/joda/time/format/InternalPrinter;->estimatePrintedLength()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 625
    :try_start_d
    invoke-virtual {p0, v0, p1}, Lorg/joda/time/format/DateTimeFormatter;->printTo(Ljava/lang/Appendable;Lorg/joda/time/ReadableInstant;)V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_10} :catch_15

    .line 629
    :goto_10
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 626
    :catch_15
    move-exception v1

    goto :goto_10
.end method

.method public print(Lorg/joda/time/ReadablePartial;)Ljava/lang/String;
    .registers 4

    .prologue
    .line 661
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lorg/joda/time/format/DateTimeFormatter;->requirePrinter()Lorg/joda/time/format/InternalPrinter;

    move-result-object v1

    invoke-interface {v1}, Lorg/joda/time/format/InternalPrinter;->estimatePrintedLength()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 663
    :try_start_d
    invoke-virtual {p0, v0, p1}, Lorg/joda/time/format/DateTimeFormatter;->printTo(Ljava/lang/Appendable;Lorg/joda/time/ReadablePartial;)V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_10} :catch_15

    .line 667
    :goto_10
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 664
    :catch_15
    move-exception v1

    goto :goto_10
.end method

.method public printTo(Ljava/io/Writer;J)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 548
    invoke-virtual {p0, p1, p2, p3}, Lorg/joda/time/format/DateTimeFormatter;->printTo(Ljava/lang/Appendable;J)V

    .line 549
    return-void
.end method

.method public printTo(Ljava/io/Writer;Lorg/joda/time/ReadableInstant;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 508
    invoke-virtual {p0, p1, p2}, Lorg/joda/time/format/DateTimeFormatter;->printTo(Ljava/lang/Appendable;Lorg/joda/time/ReadableInstant;)V

    .line 509
    return-void
.end method

.method public printTo(Ljava/io/Writer;Lorg/joda/time/ReadablePartial;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 591
    invoke-virtual {p0, p1, p2}, Lorg/joda/time/format/DateTimeFormatter;->printTo(Ljava/lang/Appendable;Lorg/joda/time/ReadablePartial;)V

    .line 592
    return-void
.end method

.method public printTo(Ljava/lang/Appendable;J)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 560
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/joda/time/format/DateTimeFormatter;->printTo(Ljava/lang/Appendable;JLorg/joda/time/Chronology;)V

    .line 561
    return-void
.end method

.method public printTo(Ljava/lang/Appendable;Lorg/joda/time/ReadableInstant;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 519
    invoke-static {p2}, Lorg/joda/time/DateTimeUtils;->getInstantMillis(Lorg/joda/time/ReadableInstant;)J

    move-result-wide v0

    .line 520
    invoke-static {p2}, Lorg/joda/time/DateTimeUtils;->getInstantChronology(Lorg/joda/time/ReadableInstant;)Lorg/joda/time/Chronology;

    move-result-object v2

    .line 521
    invoke-direct {p0, p1, v0, v1, v2}, Lorg/joda/time/format/DateTimeFormatter;->printTo(Ljava/lang/Appendable;JLorg/joda/time/Chronology;)V

    .line 522
    return-void
.end method

.method public printTo(Ljava/lang/Appendable;Lorg/joda/time/ReadablePartial;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 605
    invoke-direct {p0}, Lorg/joda/time/format/DateTimeFormatter;->requirePrinter()Lorg/joda/time/format/InternalPrinter;

    move-result-object v0

    .line 606
    if-nez p2, :cond_e

    .line 607
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The partial must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 609
    :cond_e
    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatter;->iLocale:Ljava/util/Locale;

    invoke-interface {v0, p1, p2, v1}, Lorg/joda/time/format/InternalPrinter;->printTo(Ljava/lang/Appendable;Lorg/joda/time/ReadablePartial;Ljava/util/Locale;)V

    .line 610
    return-void
.end method

.method public printTo(Ljava/lang/StringBuffer;J)V
    .registers 5

    .prologue
    .line 534
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lorg/joda/time/format/DateTimeFormatter;->printTo(Ljava/lang/Appendable;J)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 538
    :goto_3
    return-void

    .line 535
    :catch_4
    move-exception v0

    goto :goto_3
.end method

.method public printTo(Ljava/lang/StringBuffer;Lorg/joda/time/ReadableInstant;)V
    .registers 4

    .prologue
    .line 495
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lorg/joda/time/format/DateTimeFormatter;->printTo(Ljava/lang/Appendable;Lorg/joda/time/ReadableInstant;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 499
    :goto_3
    return-void

    .line 496
    :catch_4
    move-exception v0

    goto :goto_3
.end method

.method public printTo(Ljava/lang/StringBuffer;Lorg/joda/time/ReadablePartial;)V
    .registers 4

    .prologue
    .line 575
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lorg/joda/time/format/DateTimeFormatter;->printTo(Ljava/lang/Appendable;Lorg/joda/time/ReadablePartial;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 579
    :goto_3
    return-void

    .line 576
    :catch_4
    move-exception v0

    goto :goto_3
.end method

.method public withChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/format/DateTimeFormatter;
    .registers 11

    .prologue
    .line 291
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iChrono:Lorg/joda/time/Chronology;

    if-ne v0, p1, :cond_5

    .line 294
    :goto_4
    return-object p0

    :cond_5
    new-instance v0, Lorg/joda/time/format/DateTimeFormatter;

    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatter;->iPrinter:Lorg/joda/time/format/InternalPrinter;

    iget-object v2, p0, Lorg/joda/time/format/DateTimeFormatter;->iParser:Lorg/joda/time/format/InternalParser;

    iget-object v3, p0, Lorg/joda/time/format/DateTimeFormatter;->iLocale:Ljava/util/Locale;

    iget-boolean v4, p0, Lorg/joda/time/format/DateTimeFormatter;->iOffsetParsed:Z

    iget-object v6, p0, Lorg/joda/time/format/DateTimeFormatter;->iZone:Lorg/joda/time/DateTimeZone;

    iget-object v7, p0, Lorg/joda/time/format/DateTimeFormatter;->iPivotYear:Ljava/lang/Integer;

    iget v8, p0, Lorg/joda/time/format/DateTimeFormatter;->iDefaultYear:I

    move-object v5, p1

    invoke-direct/range {v0 .. v8}, Lorg/joda/time/format/DateTimeFormatter;-><init>(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;Ljava/util/Locale;ZLorg/joda/time/Chronology;Lorg/joda/time/DateTimeZone;Ljava/lang/Integer;I)V

    move-object p0, v0

    goto :goto_4
.end method

.method public withDefaultYear(I)Lorg/joda/time/format/DateTimeFormatter;
    .registers 11

    .prologue
    .line 472
    new-instance v0, Lorg/joda/time/format/DateTimeFormatter;

    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatter;->iPrinter:Lorg/joda/time/format/InternalPrinter;

    iget-object v2, p0, Lorg/joda/time/format/DateTimeFormatter;->iParser:Lorg/joda/time/format/InternalParser;

    iget-object v3, p0, Lorg/joda/time/format/DateTimeFormatter;->iLocale:Ljava/util/Locale;

    iget-boolean v4, p0, Lorg/joda/time/format/DateTimeFormatter;->iOffsetParsed:Z

    iget-object v5, p0, Lorg/joda/time/format/DateTimeFormatter;->iChrono:Lorg/joda/time/Chronology;

    iget-object v6, p0, Lorg/joda/time/format/DateTimeFormatter;->iZone:Lorg/joda/time/DateTimeZone;

    iget-object v7, p0, Lorg/joda/time/format/DateTimeFormatter;->iPivotYear:Ljava/lang/Integer;

    move v8, p1

    invoke-direct/range {v0 .. v8}, Lorg/joda/time/format/DateTimeFormatter;-><init>(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;Ljava/util/Locale;ZLorg/joda/time/Chronology;Lorg/joda/time/DateTimeZone;Ljava/lang/Integer;I)V

    return-object v0
.end method

.method public withLocale(Ljava/util/Locale;)Lorg/joda/time/format/DateTimeFormatter;
    .registers 11

    .prologue
    .line 223
    invoke-virtual {p0}, Lorg/joda/time/format/DateTimeFormatter;->getLocale()Ljava/util/Locale;

    move-result-object v0

    if-eq p1, v0, :cond_12

    if-eqz p1, :cond_14

    invoke-virtual {p0}, Lorg/joda/time/format/DateTimeFormatter;->getLocale()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_12
    move-object v0, p0

    .line 226
    :goto_13
    return-object v0

    :cond_14
    new-instance v0, Lorg/joda/time/format/DateTimeFormatter;

    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatter;->iPrinter:Lorg/joda/time/format/InternalPrinter;

    iget-object v2, p0, Lorg/joda/time/format/DateTimeFormatter;->iParser:Lorg/joda/time/format/InternalParser;

    iget-boolean v4, p0, Lorg/joda/time/format/DateTimeFormatter;->iOffsetParsed:Z

    iget-object v5, p0, Lorg/joda/time/format/DateTimeFormatter;->iChrono:Lorg/joda/time/Chronology;

    iget-object v6, p0, Lorg/joda/time/format/DateTimeFormatter;->iZone:Lorg/joda/time/DateTimeZone;

    iget-object v7, p0, Lorg/joda/time/format/DateTimeFormatter;->iPivotYear:Ljava/lang/Integer;

    iget v8, p0, Lorg/joda/time/format/DateTimeFormatter;->iDefaultYear:I

    move-object v3, p1

    invoke-direct/range {v0 .. v8}, Lorg/joda/time/format/DateTimeFormatter;-><init>(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;Ljava/util/Locale;ZLorg/joda/time/Chronology;Lorg/joda/time/DateTimeZone;Ljava/lang/Integer;I)V

    goto :goto_13
.end method

.method public withOffsetParsed()Lorg/joda/time/format/DateTimeFormatter;
    .registers 10

    .prologue
    const/4 v4, 0x1

    .line 256
    iget-boolean v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iOffsetParsed:Z

    if-ne v0, v4, :cond_6

    .line 259
    :goto_5
    return-object p0

    :cond_6
    new-instance v0, Lorg/joda/time/format/DateTimeFormatter;

    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatter;->iPrinter:Lorg/joda/time/format/InternalPrinter;

    iget-object v2, p0, Lorg/joda/time/format/DateTimeFormatter;->iParser:Lorg/joda/time/format/InternalParser;

    iget-object v3, p0, Lorg/joda/time/format/DateTimeFormatter;->iLocale:Ljava/util/Locale;

    iget-object v5, p0, Lorg/joda/time/format/DateTimeFormatter;->iChrono:Lorg/joda/time/Chronology;

    const/4 v6, 0x0

    iget-object v7, p0, Lorg/joda/time/format/DateTimeFormatter;->iPivotYear:Ljava/lang/Integer;

    iget v8, p0, Lorg/joda/time/format/DateTimeFormatter;->iDefaultYear:I

    invoke-direct/range {v0 .. v8}, Lorg/joda/time/format/DateTimeFormatter;-><init>(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;Ljava/util/Locale;ZLorg/joda/time/Chronology;Lorg/joda/time/DateTimeZone;Ljava/lang/Integer;I)V

    move-object p0, v0

    goto :goto_5
.end method

.method public withPivotYear(I)Lorg/joda/time/format/DateTimeFormatter;
    .registers 3

    .prologue
    .line 439
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/joda/time/format/DateTimeFormatter;->withPivotYear(Ljava/lang/Integer;)Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public withPivotYear(Ljava/lang/Integer;)Lorg/joda/time/format/DateTimeFormatter;
    .registers 11

    .prologue
    .line 402
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iPivotYear:Ljava/lang/Integer;

    if-eq v0, p1, :cond_10

    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iPivotYear:Ljava/lang/Integer;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iPivotYear:Ljava/lang/Integer;

    invoke-virtual {v0, p1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    :cond_10
    move-object v0, p0

    .line 405
    :goto_11
    return-object v0

    :cond_12
    new-instance v0, Lorg/joda/time/format/DateTimeFormatter;

    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatter;->iPrinter:Lorg/joda/time/format/InternalPrinter;

    iget-object v2, p0, Lorg/joda/time/format/DateTimeFormatter;->iParser:Lorg/joda/time/format/InternalParser;

    iget-object v3, p0, Lorg/joda/time/format/DateTimeFormatter;->iLocale:Ljava/util/Locale;

    iget-boolean v4, p0, Lorg/joda/time/format/DateTimeFormatter;->iOffsetParsed:Z

    iget-object v5, p0, Lorg/joda/time/format/DateTimeFormatter;->iChrono:Lorg/joda/time/Chronology;

    iget-object v6, p0, Lorg/joda/time/format/DateTimeFormatter;->iZone:Lorg/joda/time/DateTimeZone;

    iget v8, p0, Lorg/joda/time/format/DateTimeFormatter;->iDefaultYear:I

    move-object v7, p1

    invoke-direct/range {v0 .. v8}, Lorg/joda/time/format/DateTimeFormatter;-><init>(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;Ljava/util/Locale;ZLorg/joda/time/Chronology;Lorg/joda/time/DateTimeZone;Ljava/lang/Integer;I)V

    goto :goto_11
.end method

.method public withZone(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/format/DateTimeFormatter;
    .registers 11

    .prologue
    .line 355
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatter;->iZone:Lorg/joda/time/DateTimeZone;

    if-ne v0, p1, :cond_5

    .line 358
    :goto_4
    return-object p0

    :cond_5
    new-instance v0, Lorg/joda/time/format/DateTimeFormatter;

    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatter;->iPrinter:Lorg/joda/time/format/InternalPrinter;

    iget-object v2, p0, Lorg/joda/time/format/DateTimeFormatter;->iParser:Lorg/joda/time/format/InternalParser;

    iget-object v3, p0, Lorg/joda/time/format/DateTimeFormatter;->iLocale:Ljava/util/Locale;

    const/4 v4, 0x0

    iget-object v5, p0, Lorg/joda/time/format/DateTimeFormatter;->iChrono:Lorg/joda/time/Chronology;

    iget-object v7, p0, Lorg/joda/time/format/DateTimeFormatter;->iPivotYear:Ljava/lang/Integer;

    iget v8, p0, Lorg/joda/time/format/DateTimeFormatter;->iDefaultYear:I

    move-object v6, p1

    invoke-direct/range {v0 .. v8}, Lorg/joda/time/format/DateTimeFormatter;-><init>(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;Ljava/util/Locale;ZLorg/joda/time/Chronology;Lorg/joda/time/DateTimeZone;Ljava/lang/Integer;I)V

    move-object p0, v0

    goto :goto_4
.end method

.method public withZoneUTC()Lorg/joda/time/format/DateTimeFormatter;
    .registers 2

    .prologue
    .line 335
    sget-object v0, Lorg/joda/time/DateTimeZone;->UTC:Lorg/joda/time/DateTimeZone;

    invoke-virtual {p0, v0}, Lorg/joda/time/format/DateTimeFormatter;->withZone(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method
