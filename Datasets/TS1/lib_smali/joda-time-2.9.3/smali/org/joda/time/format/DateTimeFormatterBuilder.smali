.class public Lorg/joda/time/format/DateTimeFormatterBuilder;
.super Ljava/lang/Object;
.source "DateTimeFormatterBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/joda/time/format/DateTimeFormatterBuilder$MatchingParser;,
        Lorg/joda/time/format/DateTimeFormatterBuilder$Composite;,
        Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneId;,
        Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneName;,
        Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;,
        Lorg/joda/time/format/DateTimeFormatterBuilder$Fraction;,
        Lorg/joda/time/format/DateTimeFormatterBuilder$TextField;,
        Lorg/joda/time/format/DateTimeFormatterBuilder$TwoDigitYear;,
        Lorg/joda/time/format/DateTimeFormatterBuilder$FixedNumber;,
        Lorg/joda/time/format/DateTimeFormatterBuilder$PaddedNumber;,
        Lorg/joda/time/format/DateTimeFormatterBuilder$UnpaddedNumber;,
        Lorg/joda/time/format/DateTimeFormatterBuilder$NumberFormatter;,
        Lorg/joda/time/format/DateTimeFormatterBuilder$StringLiteral;,
        Lorg/joda/time/format/DateTimeFormatterBuilder$CharacterLiteral;
    }
.end annotation


# instance fields
.field private iElementPairs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private iFormatter:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder;->iElementPairs:Ljava/util/ArrayList;

    .line 84
    return-void
.end method

.method private append0(Ljava/lang/Object;)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 3

    .prologue
    .line 374
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder;->iFormatter:Ljava/lang/Object;

    .line 376
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder;->iElementPairs:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 377
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder;->iElementPairs:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 378
    return-object p0
.end method

.method private append0(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 383
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder;->iFormatter:Ljava/lang/Object;

    .line 384
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder;->iElementPairs:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 385
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder;->iElementPairs:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 386
    return-object p0
.end method

.method static appendUnknownString(Ljava/lang/Appendable;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1189
    :goto_0
    add-int/lit8 p1, p1, -0x1

    if-ltz p1, :cond_b

    .line 1190
    const v0, 0xfffd

    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_0

    .line 1192
    :cond_b
    return-void
.end method

.method private checkParser(Lorg/joda/time/format/DateTimeParser;)V
    .registers 4

    .prologue
    .line 357
    if-nez p1, :cond_a

    .line 358
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No parser supplied"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 360
    :cond_a
    return-void
.end method

.method private checkPrinter(Lorg/joda/time/format/DateTimePrinter;)V
    .registers 4

    .prologue
    .line 368
    if-nez p1, :cond_a

    .line 369
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No printer supplied"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 371
    :cond_a
    return-void
.end method

.method static csCompare(Ljava/lang/CharSequence;ILjava/lang/String;)I
    .registers 9

    .prologue
    .line 2621
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    sub-int v2, v0, p1

    .line 2622
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    .line 2623
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 2624
    const/4 v0, 0x0

    move v1, v0

    :goto_10
    if-ge v1, v4, :cond_24

    .line 2625
    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    add-int v5, p1, v1

    invoke-interface {p0, v5}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    sub-int/2addr v0, v5

    .line 2626
    if-eqz v0, :cond_20

    .line 2630
    :goto_1f
    return v0

    .line 2624
    :cond_20
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_10

    .line 2630
    :cond_24
    sub-int v0, v3, v2

    goto :goto_1f
.end method

.method static csStartsWith(Ljava/lang/CharSequence;ILjava/lang/String;)Z
    .registers 8

    .prologue
    const/4 v0, 0x0

    .line 2634
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    .line 2635
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    sub-int/2addr v1, p1

    if-ge v1, v2, :cond_d

    .line 2643
    :cond_c
    :goto_c
    return v0

    :cond_d
    move v1, v0

    .line 2638
    :goto_e
    if-ge v1, v2, :cond_1f

    .line 2639
    add-int v3, p1, v1

    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v3, v4, :cond_c

    .line 2638
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 2643
    :cond_1f
    const/4 v0, 0x1

    goto :goto_c
.end method

.method static csStartsWithIgnoreCase(Ljava/lang/CharSequence;ILjava/lang/String;)Z
    .registers 8

    .prologue
    const/4 v0, 0x0

    .line 2647
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    .line 2648
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    sub-int/2addr v1, p1

    if-ge v1, v2, :cond_d

    .line 2662
    :cond_c
    :goto_c
    return v0

    :cond_d
    move v1, v0

    .line 2651
    :goto_e
    if-ge v1, v2, :cond_33

    .line 2652
    add-int v3, p1, v1

    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    .line 2653
    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 2654
    if-eq v3, v4, :cond_30

    .line 2655
    invoke-static {v3}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v3

    .line 2656
    invoke-static {v4}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v4

    .line 2657
    if-eq v3, v4, :cond_30

    invoke-static {v3}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v3

    invoke-static {v4}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v4

    if-ne v3, v4, :cond_c

    .line 2651
    :cond_30
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 2662
    :cond_33
    const/4 v0, 0x1

    goto :goto_c
.end method

.method private getFormatter()Ljava/lang/Object;
    .registers 5

    .prologue
    .line 1138
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder;->iFormatter:Ljava/lang/Object;

    .line 1140
    if-nez v0, :cond_2d

    .line 1141
    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder;->iElementPairs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_22

    .line 1142
    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder;->iElementPairs:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 1143
    iget-object v2, p0, Lorg/joda/time/format/DateTimeFormatterBuilder;->iElementPairs:Ljava/util/ArrayList;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 1145
    if-eqz v1, :cond_2e

    .line 1146
    if-eq v1, v2, :cond_21

    if-nez v2, :cond_22

    :cond_21
    move-object v0, v1

    .line 1154
    :cond_22
    :goto_22
    if-nez v0, :cond_2b

    .line 1155
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder$Composite;

    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder;->iElementPairs:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder$Composite;-><init>(Ljava/util/List;)V

    .line 1158
    :cond_2b
    iput-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder;->iFormatter:Ljava/lang/Object;

    .line 1161
    :cond_2d
    return-object v0

    :cond_2e
    move-object v0, v2

    .line 1150
    goto :goto_22
.end method

.method private isFormatter(Ljava/lang/Object;)Z
    .registers 3

    .prologue
    .line 1185
    invoke-direct {p0, p1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->isPrinter(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    invoke-direct {p0, p1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->isParser(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private isParser(Ljava/lang/Object;)Z
    .registers 3

    .prologue
    .line 1175
    instance-of v0, p1, Lorg/joda/time/format/InternalParser;

    if-eqz v0, :cond_11

    .line 1176
    instance-of v0, p1, Lorg/joda/time/format/DateTimeFormatterBuilder$Composite;

    if-eqz v0, :cond_f

    .line 1177
    check-cast p1, Lorg/joda/time/format/DateTimeFormatterBuilder$Composite;

    invoke-virtual {p1}, Lorg/joda/time/format/DateTimeFormatterBuilder$Composite;->isParser()Z

    move-result v0

    .line 1181
    :goto_e
    return v0

    .line 1179
    :cond_f
    const/4 v0, 0x1

    goto :goto_e

    .line 1181
    :cond_11
    const/4 v0, 0x0

    goto :goto_e
.end method

.method private isPrinter(Ljava/lang/Object;)Z
    .registers 3

    .prologue
    .line 1165
    instance-of v0, p1, Lorg/joda/time/format/InternalPrinter;

    if-eqz v0, :cond_11

    .line 1166
    instance-of v0, p1, Lorg/joda/time/format/DateTimeFormatterBuilder$Composite;

    if-eqz v0, :cond_f

    .line 1167
    check-cast p1, Lorg/joda/time/format/DateTimeFormatterBuilder$Composite;

    invoke-virtual {p1}, Lorg/joda/time/format/DateTimeFormatterBuilder$Composite;->isPrinter()Z

    move-result v0

    .line 1171
    :goto_e
    return v0

    .line 1169
    :cond_f
    const/4 v0, 0x1

    goto :goto_e

    .line 1171
    :cond_11
    const/4 v0, 0x0

    goto :goto_e
.end method


# virtual methods
.method public append(Lorg/joda/time/format/DateTimeFormatter;)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 217
    if-nez p1, :cond_a

    .line 218
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No formatter supplied"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 220
    :cond_a
    invoke-virtual {p1}, Lorg/joda/time/format/DateTimeFormatter;->getPrinter0()Lorg/joda/time/format/InternalPrinter;

    move-result-object v0

    invoke-virtual {p1}, Lorg/joda/time/format/DateTimeFormatter;->getParser0()Lorg/joda/time/format/InternalParser;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(Lorg/joda/time/format/DateTimeParser;)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 257
    invoke-direct {p0, p1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->checkParser(Lorg/joda/time/format/DateTimeParser;)V

    .line 258
    const/4 v0, 0x0

    invoke-static {p1}, Lorg/joda/time/format/DateTimeParserInternalParser;->of(Lorg/joda/time/format/DateTimeParser;)Lorg/joda/time/format/InternalParser;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(Lorg/joda/time/format/DateTimePrinter;)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 238
    invoke-direct {p0, p1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->checkPrinter(Lorg/joda/time/format/DateTimePrinter;)V

    .line 239
    invoke-static {p1}, Lorg/joda/time/format/DateTimePrinterInternalPrinter;->of(Lorg/joda/time/format/DateTimePrinter;)Lorg/joda/time/format/InternalPrinter;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(Lorg/joda/time/format/DateTimePrinter;Lorg/joda/time/format/DateTimeParser;)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 5

    .prologue
    .line 276
    invoke-direct {p0, p1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->checkPrinter(Lorg/joda/time/format/DateTimePrinter;)V

    .line 277
    invoke-direct {p0, p2}, Lorg/joda/time/format/DateTimeFormatterBuilder;->checkParser(Lorg/joda/time/format/DateTimeParser;)V

    .line 278
    invoke-static {p1}, Lorg/joda/time/format/DateTimePrinterInternalPrinter;->of(Lorg/joda/time/format/DateTimePrinter;)Lorg/joda/time/format/InternalPrinter;

    move-result-object v0

    invoke-static {p2}, Lorg/joda/time/format/DateTimeParserInternalParser;->of(Lorg/joda/time/format/DateTimeParser;)Lorg/joda/time/format/InternalParser;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(Lorg/joda/time/format/DateTimePrinter;[Lorg/joda/time/format/DateTimeParser;)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 7

    .prologue
    const/4 v0, 0x0

    .line 305
    if-eqz p1, :cond_6

    .line 306
    invoke-direct {p0, p1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->checkPrinter(Lorg/joda/time/format/DateTimePrinter;)V

    .line 308
    :cond_6
    if-nez p2, :cond_10

    .line 309
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No parsers supplied"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 311
    :cond_10
    array-length v1, p2

    .line 312
    const/4 v2, 0x1

    if-ne v1, v2, :cond_2f

    .line 313
    aget-object v1, p2, v0

    if-nez v1, :cond_20

    .line 314
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No parser supplied"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 316
    :cond_20
    invoke-static {p1}, Lorg/joda/time/format/DateTimePrinterInternalPrinter;->of(Lorg/joda/time/format/DateTimePrinter;)Lorg/joda/time/format/InternalPrinter;

    move-result-object v1

    aget-object v0, p2, v0

    invoke-static {v0}, Lorg/joda/time/format/DateTimeParserInternalParser;->of(Lorg/joda/time/format/DateTimeParser;)Lorg/joda/time/format/InternalParser;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    .line 328
    :goto_2e
    return-object v0

    .line 319
    :cond_2f
    new-array v2, v1, [Lorg/joda/time/format/InternalParser;

    .line 321
    :goto_31
    add-int/lit8 v3, v1, -0x1

    if-ge v0, v3, :cond_4a

    .line 322
    aget-object v3, p2, v0

    invoke-static {v3}, Lorg/joda/time/format/DateTimeParserInternalParser;->of(Lorg/joda/time/format/DateTimeParser;)Lorg/joda/time/format/InternalParser;

    move-result-object v3

    aput-object v3, v2, v0

    if-nez v3, :cond_47

    .line 323
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Incomplete parser array"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 321
    :cond_47
    add-int/lit8 v0, v0, 0x1

    goto :goto_31

    .line 326
    :cond_4a
    aget-object v1, p2, v0

    invoke-static {v1}, Lorg/joda/time/format/DateTimeParserInternalParser;->of(Lorg/joda/time/format/DateTimeParser;)Lorg/joda/time/format/InternalParser;

    move-result-object v1

    aput-object v1, v2, v0

    .line 328
    invoke-static {p1}, Lorg/joda/time/format/DateTimePrinterInternalPrinter;->of(Lorg/joda/time/format/DateTimePrinter;)Lorg/joda/time/format/InternalPrinter;

    move-result-object v0

    new-instance v1, Lorg/joda/time/format/DateTimeFormatterBuilder$MatchingParser;

    invoke-direct {v1, v2}, Lorg/joda/time/format/DateTimeFormatterBuilder$MatchingParser;-><init>([Lorg/joda/time/format/InternalParser;)V

    invoke-direct {p0, v0, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    goto :goto_2e
.end method

.method public appendCenturyOfEra(II)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 945
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->centuryOfEra()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendSignedDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendClockhourOfDay(I)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 735
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->clockhourOfDay()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {p0, v0, p1, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendClockhourOfHalfday(I)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 755
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->clockhourOfHalfday()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {p0, v0, p1, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendDayOfMonth(I)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 775
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfMonth()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {p0, v0, p1, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendDayOfWeek(I)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 765
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfWeek()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, p1, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendDayOfWeekShortText()Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 2

    .prologue
    .line 976
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfWeek()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendShortText(Lorg/joda/time/DateTimeFieldType;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendDayOfWeekText()Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 2

    .prologue
    .line 965
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfWeek()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendText(Lorg/joda/time/DateTimeFieldType;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendDayOfYear(I)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 785
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfYear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {p0, v0, p1, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 6

    .prologue
    const/4 v1, 0x0

    .line 434
    if-nez p1, :cond_b

    .line 435
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Field type must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 437
    :cond_b
    if-ge p3, p2, :cond_e

    move p3, p2

    .line 440
    :cond_e
    if-ltz p2, :cond_12

    if-gtz p3, :cond_18

    .line 441
    :cond_12
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 443
    :cond_18
    const/4 v0, 0x1

    if-gt p2, v0, :cond_25

    .line 444
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder$UnpaddedNumber;

    invoke-direct {v0, p1, p3, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder$UnpaddedNumber;-><init>(Lorg/joda/time/DateTimeFieldType;IZ)V

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Ljava/lang/Object;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    .line 446
    :goto_24
    return-object v0

    :cond_25
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder$PaddedNumber;

    invoke-direct {v0, p1, p3, v1, p2}, Lorg/joda/time/format/DateTimeFormatterBuilder$PaddedNumber;-><init>(Lorg/joda/time/DateTimeFieldType;IZI)V

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Ljava/lang/Object;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    goto :goto_24
.end method

.method public appendEraText()Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 2

    .prologue
    .line 1007
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->era()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendText(Lorg/joda/time/DateTimeFieldType;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendFixedDecimal(Lorg/joda/time/DateTimeFieldType;I)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 6

    .prologue
    .line 464
    if-nez p1, :cond_a

    .line 465
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Field type must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 467
    :cond_a
    if-gtz p2, :cond_25

    .line 468
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Illegal number of digits: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 470
    :cond_25
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder$FixedNumber;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder$FixedNumber;-><init>(Lorg/joda/time/DateTimeFieldType;IZ)V

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Ljava/lang/Object;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendFixedSignedDecimal(Lorg/joda/time/DateTimeFieldType;I)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 6

    .prologue
    .line 516
    if-nez p1, :cond_a

    .line 517
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Field type must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 519
    :cond_a
    if-gtz p2, :cond_25

    .line 520
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Illegal number of digits: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 522
    :cond_25
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder$FixedNumber;

    const/4 v1, 0x1

    invoke-direct {v0, p1, p2, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder$FixedNumber;-><init>(Lorg/joda/time/DateTimeFieldType;IZ)V

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Ljava/lang/Object;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendFraction(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 6

    .prologue
    .line 570
    if-nez p1, :cond_a

    .line 571
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Field type must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 573
    :cond_a
    if-ge p3, p2, :cond_d

    move p3, p2

    .line 576
    :cond_d
    if-ltz p2, :cond_11

    if-gtz p3, :cond_17

    .line 577
    :cond_11
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 579
    :cond_17
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder$Fraction;

    invoke-direct {v0, p1, p2, p3}, Lorg/joda/time/format/DateTimeFormatterBuilder$Fraction;-><init>(Lorg/joda/time/DateTimeFieldType;II)V

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Ljava/lang/Object;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendFractionOfDay(II)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 648
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfYear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendFraction(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendFractionOfHour(II)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 631
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->hourOfDay()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendFraction(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendFractionOfMinute(II)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 614
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->minuteOfDay()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendFraction(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendFractionOfSecond(II)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 597
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->secondOfDay()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendFraction(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendHalfdayOfDayText()Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 2

    .prologue
    .line 955
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->halfdayOfDay()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendText(Lorg/joda/time/DateTimeFieldType;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendHourOfDay(I)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 725
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->hourOfDay()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {p0, v0, p1, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendHourOfHalfday(I)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 745
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->hourOfHalfday()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {p0, v0, p1, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 3

    .prologue
    .line 397
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder$CharacterLiteral;

    invoke-direct {v0, p1}, Lorg/joda/time/format/DateTimeFormatterBuilder$CharacterLiteral;-><init>(C)V

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Ljava/lang/Object;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendLiteral(Ljava/lang/String;)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 408
    if-nez p1, :cond_a

    .line 409
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Literal must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 411
    :cond_a
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    packed-switch v0, :pswitch_data_2a

    .line 417
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder$StringLiteral;

    invoke-direct {v0, p1}, Lorg/joda/time/format/DateTimeFormatterBuilder$StringLiteral;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Ljava/lang/Object;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object p0

    :goto_1a
    :pswitch_1a
    return-object p0

    .line 415
    :pswitch_1b
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder$CharacterLiteral;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-direct {v0, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder$CharacterLiteral;-><init>(C)V

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Ljava/lang/Object;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object p0

    goto :goto_1a

    .line 411
    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_1a
        :pswitch_1b
    .end packed-switch
.end method

.method public appendMillisOfDay(I)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 675
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->millisOfDay()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {p0, v0, p1, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendMillisOfSecond(I)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 665
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->millisOfSecond()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {p0, v0, p1, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendMinuteOfDay(I)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 715
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->minuteOfDay()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {p0, v0, p1, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendMinuteOfHour(I)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 705
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->minuteOfHour()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {p0, v0, p1, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendMonthOfYear(I)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 817
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->monthOfYear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {p0, v0, p1, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendMonthOfYearShortText()Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 2

    .prologue
    .line 997
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->monthOfYear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendShortText(Lorg/joda/time/DateTimeFieldType;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendMonthOfYearText()Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 2

    .prologue
    .line 987
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->monthOfYear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendText(Lorg/joda/time/DateTimeFieldType;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendOptional(Lorg/joda/time/format/DateTimeParser;)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 345
    invoke-direct {p0, p1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->checkParser(Lorg/joda/time/format/DateTimeParser;)V

    .line 346
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/joda/time/format/InternalParser;

    const/4 v1, 0x0

    invoke-static {p1}, Lorg/joda/time/format/DateTimeParserInternalParser;->of(Lorg/joda/time/format/DateTimeParser;)Lorg/joda/time/format/InternalParser;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    aput-object v3, v0, v1

    .line 347
    new-instance v1, Lorg/joda/time/format/DateTimeFormatterBuilder$MatchingParser;

    invoke-direct {v1, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder$MatchingParser;-><init>([Lorg/joda/time/format/InternalParser;)V

    invoke-direct {p0, v3, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendPattern(Ljava/lang/String;)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 2

    .prologue
    .line 1132
    invoke-static {p0, p1}, Lorg/joda/time/format/DateTimeFormat;->appendPatternTo(Lorg/joda/time/format/DateTimeFormatterBuilder;Ljava/lang/String;)V

    .line 1133
    return-object p0
.end method

.method public appendSecondOfDay(I)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 695
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->secondOfDay()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {p0, v0, p1, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendSecondOfMinute(I)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 685
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->secondOfMinute()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {p0, v0, p1, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendShortText(Lorg/joda/time/DateTimeFieldType;)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 549
    if-nez p1, :cond_a

    .line 550
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Field type must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 552
    :cond_a
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder$TextField;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder$TextField;-><init>(Lorg/joda/time/DateTimeFieldType;Z)V

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Ljava/lang/Object;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendSignedDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 6

    .prologue
    const/4 v1, 0x1

    .line 486
    if-nez p1, :cond_b

    .line 487
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Field type must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 489
    :cond_b
    if-ge p3, p2, :cond_e

    move p3, p2

    .line 492
    :cond_e
    if-ltz p2, :cond_12

    if-gtz p3, :cond_18

    .line 493
    :cond_12
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 495
    :cond_18
    if-gt p2, v1, :cond_24

    .line 496
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder$UnpaddedNumber;

    invoke-direct {v0, p1, p3, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder$UnpaddedNumber;-><init>(Lorg/joda/time/DateTimeFieldType;IZ)V

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Ljava/lang/Object;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    .line 498
    :goto_23
    return-object v0

    :cond_24
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder$PaddedNumber;

    invoke-direct {v0, p1, p3, v1, p2}, Lorg/joda/time/format/DateTimeFormatterBuilder$PaddedNumber;-><init>(Lorg/joda/time/DateTimeFieldType;IZI)V

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Ljava/lang/Object;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    goto :goto_23
.end method

.method public appendText(Lorg/joda/time/DateTimeFieldType;)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 534
    if-nez p1, :cond_a

    .line 535
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Field type must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 537
    :cond_a
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder$TextField;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder$TextField;-><init>(Lorg/joda/time/DateTimeFieldType;Z)V

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Ljava/lang/Object;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendTimeZoneId()Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 3

    .prologue
    .line 1068
    sget-object v0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneId;->INSTANCE:Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneId;

    sget-object v1, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneId;->INSTANCE:Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneId;

    invoke-direct {p0, v0, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendTimeZoneName()Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 1018
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneName;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v2}, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneName;-><init>(ILjava/util/Map;)V

    invoke-direct {p0, v0, v2}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendTimeZoneName(Ljava/util/Map;)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/joda/time/DateTimeZone;",
            ">;)",
            "Lorg/joda/time/format/DateTimeFormatterBuilder;"
        }
    .end annotation

    .prologue
    .line 1031
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneName;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p1}, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneName;-><init>(ILjava/util/Map;)V

    .line 1032
    invoke-direct {p0, v0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendTimeZoneOffset(Ljava/lang/String;Ljava/lang/String;ZII)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 12

    .prologue
    .line 1118
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v5}, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;-><init>(Ljava/lang/String;Ljava/lang/String;ZII)V

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Ljava/lang/Object;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendTimeZoneOffset(Ljava/lang/String;ZII)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 11

    .prologue
    .line 1091
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;

    move-object v1, p1

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;-><init>(Ljava/lang/String;Ljava/lang/String;ZII)V

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Ljava/lang/Object;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendTimeZoneShortName()Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 1043
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneName;

    const/4 v1, 0x1

    invoke-direct {v0, v1, v2}, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneName;-><init>(ILjava/util/Map;)V

    invoke-direct {p0, v0, v2}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendTimeZoneShortName(Ljava/util/Map;)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/joda/time/DateTimeZone;",
            ">;)",
            "Lorg/joda/time/format/DateTimeFormatterBuilder;"
        }
    .end annotation

    .prologue
    .line 1057
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneName;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p1}, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneName;-><init>(ILjava/util/Map;)V

    .line 1058
    invoke-direct {p0, v0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendTwoDigitWeekyear(I)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 3

    .prologue
    .line 891
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendTwoDigitWeekyear(IZ)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendTwoDigitWeekyear(IZ)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 5

    .prologue
    .line 909
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder$TwoDigitYear;

    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->weekyear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2}, Lorg/joda/time/format/DateTimeFormatterBuilder$TwoDigitYear;-><init>(Lorg/joda/time/DateTimeFieldType;IZ)V

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Ljava/lang/Object;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendTwoDigitYear(I)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 3

    .prologue
    .line 851
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendTwoDigitYear(IZ)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendTwoDigitYear(IZ)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 5

    .prologue
    .line 869
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder$TwoDigitYear;

    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->year()Lorg/joda/time/DateTimeFieldType;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2}, Lorg/joda/time/format/DateTimeFormatterBuilder$TwoDigitYear;-><init>(Lorg/joda/time/DateTimeFieldType;IZ)V

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append0(Ljava/lang/Object;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendWeekOfWeekyear(I)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 795
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->weekOfWeekyear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {p0, v0, p1, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendWeekyear(II)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 807
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->weekyear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendSignedDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendYear(II)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 829
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->year()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendSignedDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendYearOfCentury(II)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 933
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->yearOfCentury()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendYearOfEra(II)Lorg/joda/time/format/DateTimeFormatterBuilder;
    .registers 4

    .prologue
    .line 921
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->yearOfEra()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDecimal(Lorg/joda/time/DateTimeFieldType;II)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move-result-object v0

    return-object v0
.end method

.method public canBuildFormatter()Z
    .registers 2

    .prologue
    .line 168
    invoke-direct {p0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->getFormatter()Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->isFormatter(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public canBuildParser()Z
    .registers 2

    .prologue
    .line 188
    invoke-direct {p0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->getFormatter()Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->isParser(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public canBuildPrinter()Z
    .registers 2

    .prologue
    .line 178
    invoke-direct {p0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->getFormatter()Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->isPrinter(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 197
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder;->iFormatter:Ljava/lang/Object;

    .line 198
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder;->iElementPairs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 199
    return-void
.end method

.method public toFormatter()Lorg/joda/time/format/DateTimeFormatter;
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 103
    invoke-direct {p0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->getFormatter()Ljava/lang/Object;

    move-result-object v1

    .line 105
    invoke-direct {p0, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->isPrinter(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a

    move-object v0, v1

    .line 106
    check-cast v0, Lorg/joda/time/format/InternalPrinter;

    .line 109
    :goto_e
    invoke-direct {p0, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->isParser(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_28

    .line 110
    check-cast v1, Lorg/joda/time/format/InternalParser;

    .line 112
    :goto_16
    if-nez v0, :cond_1a

    if-eqz v1, :cond_20

    .line 113
    :cond_1a
    new-instance v2, Lorg/joda/time/format/DateTimeFormatter;

    invoke-direct {v2, v0, v1}, Lorg/joda/time/format/DateTimeFormatter;-><init>(Lorg/joda/time/format/InternalPrinter;Lorg/joda/time/format/InternalParser;)V

    return-object v2

    .line 115
    :cond_20
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Both printing and parsing not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_28
    move-object v1, v2

    goto :goto_16

    :cond_2a
    move-object v0, v2

    goto :goto_e
.end method

.method public toParser()Lorg/joda/time/format/DateTimeParser;
    .registers 3

    .prologue
    .line 152
    invoke-direct {p0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->getFormatter()Ljava/lang/Object;

    move-result-object v0

    .line 153
    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->isParser(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 154
    check-cast v0, Lorg/joda/time/format/InternalParser;

    .line 155
    invoke-static {v0}, Lorg/joda/time/format/InternalParserDateTimeParser;->of(Lorg/joda/time/format/InternalParser;)Lorg/joda/time/format/DateTimeParser;

    move-result-object v0

    return-object v0

    .line 157
    :cond_11
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Parsing is not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toPrinter()Lorg/joda/time/format/DateTimePrinter;
    .registers 3

    .prologue
    .line 131
    invoke-direct {p0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->getFormatter()Ljava/lang/Object;

    move-result-object v0

    .line 132
    invoke-direct {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->isPrinter(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 133
    check-cast v0, Lorg/joda/time/format/InternalPrinter;

    .line 134
    invoke-static {v0}, Lorg/joda/time/format/InternalPrinterDateTimePrinter;->of(Lorg/joda/time/format/InternalPrinter;)Lorg/joda/time/format/DateTimePrinter;

    move-result-object v0

    return-object v0

    .line 136
    :cond_11
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Printing is not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
