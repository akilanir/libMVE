.class public final Lcom/alibaba/fastjson/parser/JSONScanner;
.super Lcom/alibaba/fastjson/parser/JSONLexerBase;
.source "JSONScanner.java"


# static fields
.field public static final ISO8601_LEN_0:I

.field public static final ISO8601_LEN_1:I

.field public static final ISO8601_LEN_2:I


# instance fields
.field private final len:I

.field private final text:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 168
    const-string v0, "0000-00-00"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    sput v0, Lcom/alibaba/fastjson/parser/JSONScanner;->ISO8601_LEN_0:I

    .line 169
    const-string v0, "0000-00-00T00:00:00"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    sput v0, Lcom/alibaba/fastjson/parser/JSONScanner;->ISO8601_LEN_1:I

    .line 170
    const-string v0, "0000-00-00T00:00:00.000"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    sput v0, Lcom/alibaba/fastjson/parser/JSONScanner;->ISO8601_LEN_2:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    .line 40
    sget v0, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    invoke-direct {p0, p1, v0}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;I)V

    .line 41
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 5
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "features"    # I

    .prologue
    .line 44
    invoke-direct {p0, p2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;-><init>(I)V

    .line 46
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 47
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->len:I

    .line 48
    const/4 v0, -0x1

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 50
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 51
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    const v1, 0xfeff

    if-ne v0, v1, :cond_1d

    .line 52
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 54
    :cond_1d
    return-void
.end method

.method public constructor <init>([CI)V
    .registers 4
    .param p1, "input"    # [C
    .param p2, "inputLength"    # I

    .prologue
    .line 72
    sget v0, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    invoke-direct {p0, p1, p2, v0}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>([CII)V

    .line 73
    return-void
.end method

.method public constructor <init>([CII)V
    .registers 6
    .param p1, "input"    # [C
    .param p2, "inputLength"    # I
    .param p3, "features"    # I

    .prologue
    .line 76
    new-instance v0, Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1, p2}, Ljava/lang/String;-><init>([CII)V

    invoke-direct {p0, v0, p3}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;I)V

    .line 77
    return-void
.end method

.method static charArrayCompare(Ljava/lang/String;I[C)Z
    .registers 8
    .param p0, "src"    # Ljava/lang/String;
    .param p1, "offset"    # I
    .param p2, "dest"    # [C

    .prologue
    const/4 v2, 0x0

    .line 84
    array-length v0, p2

    .line 85
    .local v0, "destLen":I
    add-int v3, v0, p1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-le v3, v4, :cond_b

    .line 95
    :cond_a
    :goto_a
    return v2

    .line 89
    :cond_b
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    if-ge v1, v0, :cond_1b

    .line 90
    aget-char v3, p2, v1

    add-int v4, p1, v1

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v3, v4, :cond_a

    .line 89
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 95
    :cond_1b
    const/4 v2, 0x1

    goto :goto_a
.end method

.method static checkDate(CCCCCCII)Z
    .registers 13
    .param p0, "y0"    # C
    .param p1, "y1"    # C
    .param p2, "y2"    # C
    .param p3, "y3"    # C
    .param p4, "M0"    # C
    .param p5, "M1"    # C
    .param p6, "d0"    # I
    .param p7, "d1"    # I

    .prologue
    const/16 v4, 0x32

    const/16 v1, 0x39

    const/16 v3, 0x31

    const/16 v2, 0x30

    const/4 v0, 0x0

    .line 551
    if-eq p0, v3, :cond_e

    if-eq p0, v4, :cond_e

    .line 592
    :cond_d
    :goto_d
    return v0

    .line 554
    :cond_e
    if-lt p1, v2, :cond_d

    if-gt p1, v1, :cond_d

    .line 557
    if-lt p2, v2, :cond_d

    if-gt p2, v1, :cond_d

    .line 560
    if-lt p3, v2, :cond_d

    if-gt p3, v1, :cond_d

    .line 564
    if-ne p4, v2, :cond_28

    .line 565
    if-lt p5, v3, :cond_d

    if-gt p5, v1, :cond_d

    .line 576
    :cond_20
    if-ne p6, v2, :cond_31

    .line 577
    if-lt p7, v3, :cond_d

    if-gt p7, v1, :cond_d

    .line 592
    :cond_26
    const/4 v0, 0x1

    goto :goto_d

    .line 568
    :cond_28
    if-ne p4, v3, :cond_d

    .line 569
    if-eq p5, v2, :cond_20

    if-eq p5, v3, :cond_20

    if-eq p5, v4, :cond_20

    goto :goto_d

    .line 580
    :cond_31
    if-eq p6, v3, :cond_35

    if-ne p6, v4, :cond_3a

    .line 581
    :cond_35
    if-lt p7, v2, :cond_d

    if-le p7, v1, :cond_26

    goto :goto_d

    .line 584
    :cond_3a
    const/16 v1, 0x33

    if-ne p6, v1, :cond_d

    .line 585
    if-eq p7, v2, :cond_26

    if-eq p7, v3, :cond_26

    goto :goto_d
.end method

.method private checkTime(CCCCCC)Z
    .registers 13
    .param p1, "h0"    # C
    .param p2, "h1"    # C
    .param p3, "m0"    # C
    .param p4, "m1"    # C
    .param p5, "s0"    # C
    .param p6, "s1"    # C

    .prologue
    const/16 v5, 0x36

    const/16 v4, 0x35

    const/16 v3, 0x39

    const/16 v2, 0x30

    const/4 v0, 0x0

    .line 497
    if-ne p1, v2, :cond_10

    .line 498
    if-lt p2, v2, :cond_f

    if-le p2, v3, :cond_18

    .line 537
    :cond_f
    :goto_f
    return v0

    .line 501
    :cond_10
    const/16 v1, 0x31

    if-ne p1, v1, :cond_2a

    .line 502
    if-lt p2, v2, :cond_f

    if-gt p2, v3, :cond_f

    .line 513
    :cond_18
    if-lt p3, v2, :cond_35

    if-gt p3, v4, :cond_35

    .line 514
    if-lt p4, v2, :cond_f

    if-gt p4, v3, :cond_f

    .line 525
    :cond_20
    if-lt p5, v2, :cond_3a

    if-gt p5, v4, :cond_3a

    .line 526
    if-lt p6, v2, :cond_f

    if-gt p6, v3, :cond_f

    .line 537
    :cond_28
    const/4 v0, 0x1

    goto :goto_f

    .line 505
    :cond_2a
    const/16 v1, 0x32

    if-ne p1, v1, :cond_f

    .line 506
    if-lt p2, v2, :cond_f

    const/16 v1, 0x34

    if-le p2, v1, :cond_18

    goto :goto_f

    .line 517
    :cond_35
    if-ne p3, v5, :cond_f

    .line 518
    if-eq p4, v2, :cond_20

    goto :goto_f

    .line 529
    :cond_3a
    if-ne p5, v5, :cond_f

    .line 530
    if-eq p6, v2, :cond_28

    goto :goto_f
.end method

.method private setCalendar(CCCCCCCC)V
    .registers 14
    .param p1, "y0"    # C
    .param p2, "y1"    # C
    .param p3, "y2"    # C
    .param p4, "y3"    # C
    .param p5, "M0"    # C
    .param p6, "M1"    # C
    .param p7, "d0"    # C
    .param p8, "d1"    # C

    .prologue
    .line 541
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->timeZone:Ljava/util/TimeZone;

    iget-object v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->locale:Ljava/util/Locale;

    invoke-static {v3, v4}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v3

    iput-object v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    .line 542
    add-int/lit8 v3, p1, -0x30

    mul-int/lit16 v3, v3, 0x3e8

    add-int/lit8 v4, p2, -0x30

    mul-int/lit8 v4, v4, 0x64

    add-int/2addr v3, v4

    add-int/lit8 v4, p3, -0x30

    mul-int/lit8 v4, v4, 0xa

    add-int/2addr v3, v4

    add-int/lit8 v4, p4, -0x30

    add-int v2, v3, v4

    .line 543
    .local v2, "year":I
    add-int/lit8 v3, p5, -0x30

    mul-int/lit8 v3, v3, 0xa

    add-int/lit8 v4, p6, -0x30

    add-int/2addr v3, v4

    add-int/lit8 v1, v3, -0x1

    .line 544
    .local v1, "month":I
    add-int/lit8 v3, p7, -0x30

    mul-int/lit8 v3, v3, 0xa

    add-int/lit8 v4, p8, -0x30

    add-int v0, v3, v4

    .line 545
    .local v0, "day":I
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    const/4 v4, 0x1

    invoke-virtual {v3, v4, v2}, Ljava/util/Calendar;->set(II)V

    .line 546
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    const/4 v4, 0x2

    invoke-virtual {v3, v4, v1}, Ljava/util/Calendar;->set(II)V

    .line 547
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    const/4 v4, 0x5

    invoke-virtual {v3, v4, v0}, Ljava/util/Calendar;->set(II)V

    .line 548
    return-void
.end method


# virtual methods
.method public final addSymbol(IIILcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;
    .registers 6
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "hash"    # I
    .param p4, "symbolTable"    # Lcom/alibaba/fastjson/parser/SymbolTable;

    .prologue
    .line 107
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    invoke-virtual {p4, v0, p1, p2, p3}, Lcom/alibaba/fastjson/parser/SymbolTable;->addSymbol(Ljava/lang/String;III)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected final arrayCopy(I[CII)V
    .registers 7
    .param p1, "srcPos"    # I
    .param p2, "dest"    # [C
    .param p3, "destPos"    # I
    .param p4, "length"    # I

    .prologue
    .line 1269
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    add-int v1, p1, p4

    invoke-virtual {v0, p1, v1, p2, p3}, Ljava/lang/String;->getChars(II[CI)V

    .line 1270
    return-void
.end method

.method public bytesValue()[B
    .registers 4

    .prologue
    .line 111
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->np:I

    add-int/lit8 v1, v1, 0x1

    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->sp:I

    invoke-static {v0, v1, v2}, Lcom/alibaba/fastjson/util/IOUtils;->decodeBase64(Ljava/lang/String;II)[B

    move-result-object v0

    return-object v0
.end method

.method public final charArrayCompare([C)Z
    .registers 4
    .param p1, "chars"    # [C

    .prologue
    .line 99
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-static {v0, v1, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charArrayCompare(Ljava/lang/String;I[C)Z

    move-result v0

    return v0
.end method

.method public final charAt(I)C
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 57
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->len:I

    if-lt p1, v0, :cond_7

    .line 58
    const/16 v0, 0x1a

    .line 61
    :goto_6
    return v0

    :cond_7
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    goto :goto_6
.end method

.method protected final copyTo(II[C)V
    .registers 7
    .param p1, "offset"    # I
    .param p2, "count"    # I
    .param p3, "dest"    # [C

    .prologue
    .line 80
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    add-int v1, p1, p2

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, p3, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 81
    return-void
.end method

.method public final indexOf(CI)I
    .registers 4
    .param p1, "ch"    # C
    .param p2, "startIndex"    # I

    .prologue
    .line 103
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    invoke-virtual {v0, p1, p2}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    return v0
.end method

.method public info()Ljava/lang/String;
    .registers 5

    .prologue
    const/high16 v3, 0x10000

    .line 1273
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "pos "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", json : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 1275
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v0, v3, :cond_2c

    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 1277
    :goto_23
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1275
    :cond_2c
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    const/4 v2, 0x0

    .line 1277
    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_23
.end method

.method public isEOF()Z
    .registers 3

    .prologue
    .line 597
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->len:I

    if-eq v0, v1, :cond_14

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    const/16 v1, 0x1a

    if-ne v0, v1, :cond_16

    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->len:I

    if-ne v0, v1, :cond_16

    :cond_14
    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public final next()C
    .registers 3

    .prologue
    .line 65
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v0, v1, 0x1

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 66
    .local v0, "index":I
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->len:I

    if-lt v0, v1, :cond_f

    const/16 v1, 0x1a

    .line 68
    :goto_c
    iput-char v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    return v1

    .line 66
    :cond_f
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 68
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    goto :goto_c
.end method

.method public final numberString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 157
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->np:I

    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->sp:I

    add-int/2addr v2, v3

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 159
    .local v0, "chLocal":C
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->sp:I

    .line 160
    .local v1, "sp":I
    const/16 v2, 0x4c

    if-eq v0, v2, :cond_21

    const/16 v2, 0x53

    if-eq v0, v2, :cond_21

    const/16 v2, 0x42

    if-eq v0, v2, :cond_21

    const/16 v2, 0x46

    if-eq v0, v2, :cond_21

    const/16 v2, 0x44

    if-ne v0, v2, :cond_23

    .line 161
    :cond_21
    add-int/lit8 v1, v1, -0x1

    .line 165
    :cond_23
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->np:I

    invoke-virtual {p0, v2, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->subString(II)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public scanFieldBoolean([C)Z
    .registers 13
    .param p1, "fieldName"    # [C

    .prologue
    const/16 v10, 0x65

    const/16 v9, 0x2c

    const/16 v8, 0x10

    const/4 v7, -0x1

    const/4 v4, 0x0

    .line 1078
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 1080
    iget-object v5, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-static {v5, v6, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charArrayCompare(Ljava/lang/String;I[C)Z

    move-result v5

    if-nez v5, :cond_19

    .line 1081
    const/4 v5, -0x2

    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move v3, v4

    .line 1160
    :goto_18
    return v3

    .line 1085
    :cond_19
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    array-length v6, p1

    add-int v1, v5, v6

    .line 1087
    .local v1, "index":I
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "index":I
    .local v2, "index":I
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 1090
    .local v0, "ch":C
    const/16 v5, 0x74

    if-ne v0, v5, :cond_6d

    .line 1091
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "index":I
    .restart local v1    # "index":I
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v5

    const/16 v6, 0x72

    if-eq v5, v6, :cond_36

    .line 1092
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move v3, v4

    .line 1093
    goto :goto_18

    .line 1095
    :cond_36
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "index":I
    .restart local v2    # "index":I
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v5

    const/16 v6, 0x75

    if-eq v5, v6, :cond_44

    .line 1096
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move v3, v4

    .line 1097
    goto :goto_18

    .line 1099
    :cond_44
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "index":I
    .restart local v1    # "index":I
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v5

    if-eq v5, v10, :cond_50

    .line 1100
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move v3, v4

    .line 1101
    goto :goto_18

    .line 1104
    :cond_50
    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 1105
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 1106
    const/4 v3, 0x1

    .line 1133
    .local v3, "value":Z
    :goto_59
    if-ne v0, v9, :cond_b9

    .line 1134
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v4

    iput-char v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 1135
    const/4 v4, 0x3

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 1136
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    goto :goto_18

    .line 1107
    .end local v1    # "index":I
    .end local v3    # "value":Z
    .restart local v2    # "index":I
    :cond_6d
    const/16 v5, 0x66

    if-ne v0, v5, :cond_b4

    .line 1108
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "index":I
    .restart local v1    # "index":I
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v5

    const/16 v6, 0x61

    if-eq v5, v6, :cond_7f

    .line 1109
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move v3, v4

    .line 1110
    goto :goto_18

    .line 1112
    :cond_7f
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "index":I
    .restart local v2    # "index":I
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v5

    const/16 v6, 0x6c

    if-eq v5, v6, :cond_8d

    .line 1113
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move v3, v4

    .line 1114
    goto :goto_18

    .line 1116
    :cond_8d
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "index":I
    .restart local v1    # "index":I
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v5

    const/16 v6, 0x73

    if-eq v5, v6, :cond_9c

    .line 1117
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move v3, v4

    .line 1118
    goto/16 :goto_18

    .line 1120
    :cond_9c
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "index":I
    .restart local v2    # "index":I
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v5

    if-eq v5, v10, :cond_a9

    .line 1121
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move v3, v4

    .line 1122
    goto/16 :goto_18

    .line 1125
    :cond_a9
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 1126
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 1127
    const/4 v3, 0x0

    .restart local v3    # "value":Z
    move v1, v2

    .end local v2    # "index":I
    .restart local v1    # "index":I
    goto :goto_59

    .line 1129
    .end local v1    # "index":I
    .end local v3    # "value":Z
    .restart local v2    # "index":I
    :cond_b4
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move v3, v4

    .line 1130
    goto/16 :goto_18

    .line 1137
    .end local v2    # "index":I
    .restart local v1    # "index":I
    .restart local v3    # "value":Z
    :cond_b9
    const/16 v5, 0x7d

    if-ne v0, v5, :cond_114

    .line 1138
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 1139
    if-ne v0, v9, :cond_dc

    .line 1140
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 1141
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v4

    iput-char v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 1154
    :goto_d7
    const/4 v4, 0x4

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    goto/16 :goto_18

    .line 1142
    :cond_dc
    const/16 v5, 0x5d

    if-ne v0, v5, :cond_f1

    .line 1143
    const/16 v4, 0xf

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 1144
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v4

    iput-char v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    goto :goto_d7

    .line 1145
    :cond_f1
    const/16 v5, 0x7d

    if-ne v0, v5, :cond_106

    .line 1146
    const/16 v4, 0xd

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 1147
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v4

    iput-char v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    goto :goto_d7

    .line 1148
    :cond_106
    const/16 v5, 0x1a

    if-ne v0, v5, :cond_10f

    .line 1149
    const/16 v4, 0x14

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    goto :goto_d7

    .line 1151
    :cond_10f
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move v3, v4

    .line 1152
    goto/16 :goto_18

    .line 1156
    :cond_114
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move v3, v4

    .line 1157
    goto/16 :goto_18
.end method

.method public scanFieldInt([C)I
    .registers 16
    .param p1, "fieldName"    # [C

    .prologue
    const/16 v13, 0x10

    const/16 v12, 0x7d

    const/16 v11, 0x2c

    const/4 v10, -0x1

    const/4 v7, 0x0

    .line 601
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 602
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 603
    .local v5, "startPos":I
    iget-char v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 605
    .local v4, "startChar":C
    iget-object v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    iget v9, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-static {v8, v9, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charArrayCompare(Ljava/lang/String;I[C)Z

    move-result v8

    if-nez v8, :cond_1d

    .line 606
    const/4 v8, -0x2

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move v6, v7

    .line 677
    :cond_1c
    :goto_1c
    return v6

    .line 610
    :cond_1d
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    array-length v9, p1

    add-int v1, v8, v9

    .line 612
    .local v1, "index":I
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "index":I
    .local v2, "index":I
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 614
    .local v0, "ch":C
    const/4 v3, 0x0

    .line 615
    .local v3, "negative":Z
    const/16 v8, 0x2d

    if-ne v0, v8, :cond_e3

    .line 616
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "index":I
    .restart local v1    # "index":I
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 617
    const/4 v3, 0x1

    .line 621
    :goto_34
    const/16 v8, 0x30

    if-lt v0, v8, :cond_81

    const/16 v8, 0x39

    if-gt v0, v8, :cond_81

    .line 622
    add-int/lit8 v6, v0, -0x30

    .line 624
    .local v6, "value":I
    :goto_3e
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "index":I
    .restart local v2    # "index":I
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 625
    const/16 v8, 0x30

    if-lt v0, v8, :cond_54

    const/16 v8, 0x39

    if-gt v0, v8, :cond_54

    .line 626
    mul-int/lit8 v8, v6, 0xa

    add-int/lit8 v9, v0, -0x30

    add-int v6, v8, v9

    move v1, v2

    .end local v2    # "index":I
    .restart local v1    # "index":I
    goto :goto_3e

    .line 627
    .end local v1    # "index":I
    .restart local v2    # "index":I
    :cond_54
    const/16 v8, 0x2e

    if-ne v0, v8, :cond_5c

    .line 628
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move v6, v7

    .line 629
    goto :goto_1c

    .line 635
    :cond_5c
    if-gez v6, :cond_62

    .line 636
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move v6, v7

    .line 637
    goto :goto_1c

    .line 640
    :cond_62
    if-eq v0, v11, :cond_66

    if-ne v0, v12, :cond_6a

    .line 641
    :cond_66
    add-int/lit8 v8, v2, -0x1

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 648
    :cond_6a
    if-ne v0, v11, :cond_85

    .line 649
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v7

    iput-char v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 650
    const/4 v7, 0x3

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 651
    iput v13, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 652
    if-eqz v3, :cond_1c

    neg-int v6, v6

    goto :goto_1c

    .line 644
    .end local v2    # "index":I
    .end local v6    # "value":I
    .restart local v1    # "index":I
    :cond_81
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move v6, v7

    .line 645
    goto :goto_1c

    .line 655
    .end local v1    # "index":I
    .restart local v2    # "index":I
    .restart local v6    # "value":I
    :cond_85
    if-ne v0, v12, :cond_a4

    .line 656
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 657
    if-ne v0, v11, :cond_a9

    .line 658
    iput v13, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 659
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v7

    iput-char v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 674
    :goto_a1
    const/4 v7, 0x4

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 677
    :cond_a4
    if-eqz v3, :cond_1c

    neg-int v6, v6

    goto/16 :goto_1c

    .line 660
    :cond_a9
    const/16 v8, 0x5d

    if-ne v0, v8, :cond_be

    .line 661
    const/16 v7, 0xf

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 662
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v7

    iput-char v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    goto :goto_a1

    .line 663
    :cond_be
    if-ne v0, v12, :cond_d1

    .line 664
    const/16 v7, 0xd

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 665
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v7

    iput-char v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    goto :goto_a1

    .line 666
    :cond_d1
    const/16 v8, 0x1a

    if-ne v0, v8, :cond_da

    .line 667
    const/16 v7, 0x14

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    goto :goto_a1

    .line 669
    :cond_da
    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 670
    iput-char v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 671
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move v6, v7

    .line 672
    goto/16 :goto_1c

    .end local v6    # "value":I
    :cond_e3
    move v1, v2

    .end local v2    # "index":I
    .restart local v1    # "index":I
    goto/16 :goto_34
.end method

.method public scanFieldLong([C)J
    .registers 14
    .param p1, "fieldName"    # [C

    .prologue
    .line 995
    const/4 v8, 0x0

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 996
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 997
    .local v5, "startPos":I
    iget-char v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 999
    .local v4, "startChar":C
    iget-object v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    iget v9, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-static {v8, v9, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charArrayCompare(Ljava/lang/String;I[C)Z

    move-result v8

    if-nez v8, :cond_17

    .line 1000
    const/4 v8, -0x2

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 1001
    const-wide/16 v6, 0x0

    .line 1074
    :cond_16
    :goto_16
    return-wide v6

    .line 1004
    :cond_17
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    array-length v9, p1

    add-int v1, v8, v9

    .line 1006
    .local v1, "index":I
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "index":I
    .local v2, "index":I
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 1008
    .local v0, "ch":C
    const/4 v3, 0x0

    .line 1009
    .local v3, "negative":Z
    const/16 v8, 0x2d

    if-ne v0, v8, :cond_10c

    .line 1010
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "index":I
    .restart local v1    # "index":I
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 1011
    const/4 v3, 0x1

    .line 1015
    :goto_2e
    const/16 v8, 0x30

    if-lt v0, v8, :cond_77

    const/16 v8, 0x39

    if-gt v0, v8, :cond_77

    .line 1016
    add-int/lit8 v8, v0, -0x30

    int-to-long v6, v8

    .line 1018
    .local v6, "value":J
    :goto_39
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "index":I
    .restart local v2    # "index":I
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 1019
    const/16 v8, 0x30

    if-lt v0, v8, :cond_51

    const/16 v8, 0x39

    if-gt v0, v8, :cond_51

    .line 1020
    const-wide/16 v8, 0xa

    mul-long/2addr v8, v6

    add-int/lit8 v10, v0, -0x30

    int-to-long v10, v10

    add-long v6, v8, v10

    move v1, v2

    .end local v2    # "index":I
    .restart local v1    # "index":I
    goto :goto_39

    .line 1021
    .end local v1    # "index":I
    .restart local v2    # "index":I
    :cond_51
    const/16 v8, 0x2e

    if-ne v0, v8, :cond_5b

    .line 1022
    const/4 v8, -0x1

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 1023
    const-wide/16 v6, 0x0

    goto :goto_16

    .line 1025
    :cond_5b
    const/16 v8, 0x2c

    if-eq v0, v8, :cond_63

    const/16 v8, 0x7d

    if-ne v0, v8, :cond_67

    .line 1026
    :cond_63
    add-int/lit8 v8, v2, -0x1

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 1031
    :cond_67
    const-wide/16 v8, 0x0

    cmp-long v8, v6, v8

    if-gez v8, :cond_81

    .line 1032
    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 1033
    iput-char v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 1034
    const/4 v8, -0x1

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 1035
    const-wide/16 v6, 0x0

    goto :goto_16

    .line 1038
    .end local v2    # "index":I
    .end local v6    # "value":J
    .restart local v1    # "index":I
    :cond_77
    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 1039
    iput-char v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 1040
    const/4 v8, -0x1

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 1041
    const-wide/16 v6, 0x0

    goto :goto_16

    .line 1044
    .end local v1    # "index":I
    .restart local v2    # "index":I
    .restart local v6    # "value":J
    :cond_81
    const/16 v8, 0x2c

    if-ne v0, v8, :cond_9d

    .line 1045
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v8

    iput-char v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 1046
    const/4 v8, 0x3

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 1047
    const/16 v8, 0x10

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 1048
    if-eqz v3, :cond_16

    neg-long v6, v6

    goto/16 :goto_16

    .line 1049
    :cond_9d
    const/16 v8, 0x7d

    if-ne v0, v8, :cond_105

    .line 1050
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 1051
    const/16 v8, 0x2c

    if-ne v0, v8, :cond_c7

    .line 1052
    const/16 v8, 0x10

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 1053
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v8

    iput-char v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 1068
    :goto_bf
    const/4 v8, 0x4

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 1074
    if-eqz v3, :cond_16

    neg-long v6, v6

    goto/16 :goto_16

    .line 1054
    :cond_c7
    const/16 v8, 0x5d

    if-ne v0, v8, :cond_dc

    .line 1055
    const/16 v8, 0xf

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 1056
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v8

    iput-char v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    goto :goto_bf

    .line 1057
    :cond_dc
    const/16 v8, 0x7d

    if-ne v0, v8, :cond_f1

    .line 1058
    const/16 v8, 0xd

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 1059
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v8

    iput-char v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    goto :goto_bf

    .line 1060
    :cond_f1
    const/16 v8, 0x1a

    if-ne v0, v8, :cond_fa

    .line 1061
    const/16 v8, 0x14

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    goto :goto_bf

    .line 1063
    :cond_fa
    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 1064
    iput-char v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 1065
    const/4 v8, -0x1

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 1066
    const-wide/16 v6, 0x0

    goto/16 :goto_16

    .line 1070
    :cond_105
    const/4 v8, -0x1

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 1071
    const-wide/16 v6, 0x0

    goto/16 :goto_16

    .end local v6    # "value":J
    :cond_10c
    move v1, v2

    .end local v2    # "index":I
    .restart local v1    # "index":I
    goto/16 :goto_2e
.end method

.method public scanFieldString([C)Ljava/lang/String;
    .registers 18
    .param p1, "fieldName"    # [C

    .prologue
    .line 681
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 682
    move-object/from16 v0, p0

    iget v11, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 683
    .local v11, "startPos":I
    move-object/from16 v0, p0

    iget-char v9, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 685
    .local v9, "startChar":C
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v15, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p1

    invoke-static {v14, v15, v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->charArrayCompare(Ljava/lang/String;I[C)Z

    move-result v14

    if-nez v14, :cond_27

    .line 686
    const/4 v14, -0x2

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 687
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->stringDefaultValue()Ljava/lang/String;

    move-result-object v12

    .line 773
    :goto_26
    return-object v12

    .line 690
    :cond_27
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p1

    array-length v15, v0

    add-int v6, v14, v15

    .line 692
    .local v6, "index":I
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "index":I
    .local v7, "index":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v1

    .line 693
    .local v1, "ch":C
    const/16 v14, 0x22

    if-eq v1, v14, :cond_46

    .line 694
    const/4 v14, -0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 696
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->stringDefaultValue()Ljava/lang/String;

    move-result-object v12

    goto :goto_26

    .line 701
    :cond_46
    move v10, v7

    .line 702
    .local v10, "startIndex":I
    const/16 v14, 0x22

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v10}, Lcom/alibaba/fastjson/parser/JSONScanner;->indexOf(CI)I

    move-result v4

    .line 703
    .local v4, "endIndex":I
    const/4 v14, -0x1

    if-ne v4, v14, :cond_5a

    .line 704
    new-instance v14, Lcom/alibaba/fastjson/JSONException;

    const-string v15, "unclosed str"

    invoke-direct {v14, v15}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 707
    :cond_5a
    sub-int v14, v4, v10

    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v14}, Lcom/alibaba/fastjson/parser/JSONScanner;->subString(II)Ljava/lang/String;

    move-result-object v13

    .line 708
    .local v13, "stringVal":Ljava/lang/String;
    const/16 v14, 0x5c

    invoke-virtual {v13, v14}, Ljava/lang/String;->indexOf(I)I

    move-result v14

    const/4 v15, -0x1

    if-eq v14, v15, :cond_a3

    .line 710
    :goto_6b
    const/4 v8, 0x0

    .line 711
    .local v8, "slashCount":I
    add-int/lit8 v5, v4, -0x1

    .local v5, "i":I
    :goto_6e
    if-ltz v5, :cond_7f

    .line 712
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v14

    const/16 v15, 0x5c

    if-ne v14, v15, :cond_7f

    .line 713
    add-int/lit8 v8, v8, 0x1

    .line 711
    add-int/lit8 v5, v5, -0x1

    goto :goto_6e

    .line 718
    :cond_7f
    rem-int/lit8 v14, v8, 0x2

    if-nez v14, :cond_dd

    .line 724
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p1

    array-length v15, v0

    add-int/2addr v14, v15

    add-int/lit8 v14, v14, 0x1

    sub-int v3, v4, v14

    .line 725
    .local v3, "chars_len":I
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p1

    array-length v15, v0

    add-int/2addr v14, v15

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->sub_chars(II)[C

    move-result-object v2

    .line 727
    .local v2, "chars":[C
    invoke-static {v2, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->readString([CI)Ljava/lang/String;

    move-result-object v13

    .line 730
    .end local v2    # "chars":[C
    .end local v3    # "chars_len":I
    .end local v5    # "i":I
    .end local v8    # "slashCount":I
    :cond_a3
    add-int/lit8 v14, v4, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v1

    .line 732
    const/16 v14, 0x2c

    if-eq v1, v14, :cond_b3

    const/16 v14, 0x7d

    if-ne v1, v14, :cond_e8

    .line 733
    :cond_b3
    add-int/lit8 v14, v4, 0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 734
    move-object/from16 v0, p0

    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 735
    move-object v12, v13

    .line 743
    .local v12, "strVal":Ljava/lang/String;
    const/16 v14, 0x2c

    if-ne v1, v14, :cond_f3

    .line 744
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v14

    move-object/from16 v0, p0

    iput-char v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 745
    const/4 v14, 0x3

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    goto/16 :goto_26

    .line 721
    .end local v12    # "strVal":Ljava/lang/String;
    .restart local v5    # "i":I
    .restart local v8    # "slashCount":I
    :cond_dd
    const/16 v14, 0x22

    add-int/lit8 v15, v4, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Lcom/alibaba/fastjson/parser/JSONScanner;->indexOf(CI)I

    move-result v4

    .line 722
    goto :goto_6b

    .line 737
    .end local v5    # "i":I
    .end local v8    # "slashCount":I
    :cond_e8
    const/4 v14, -0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 739
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->stringDefaultValue()Ljava/lang/String;

    move-result-object v12

    goto/16 :goto_26

    .line 747
    .restart local v12    # "strVal":Ljava/lang/String;
    :cond_f3
    const/16 v14, 0x7d

    if-ne v1, v14, :cond_188

    .line 748
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v1

    .line 749
    const/16 v14, 0x2c

    if-ne v1, v14, :cond_12c

    .line 750
    const/16 v14, 0x10

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 751
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v14

    move-object/from16 v0, p0

    iput-char v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 766
    :goto_125
    const/4 v14, 0x4

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    goto/16 :goto_26

    .line 752
    :cond_12c
    const/16 v14, 0x5d

    if-ne v1, v14, :cond_14b

    .line 753
    const/16 v14, 0xf

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 754
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v14

    move-object/from16 v0, p0

    iput-char v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    goto :goto_125

    .line 755
    :cond_14b
    const/16 v14, 0x7d

    if-ne v1, v14, :cond_16a

    .line 756
    const/16 v14, 0xd

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 757
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v14

    move-object/from16 v0, p0

    iput-char v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    goto :goto_125

    .line 758
    :cond_16a
    const/16 v14, 0x1a

    if-ne v1, v14, :cond_175

    .line 759
    const/16 v14, 0x14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    goto :goto_125

    .line 761
    :cond_175
    move-object/from16 v0, p0

    iput v11, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 762
    move-object/from16 v0, p0

    iput-char v9, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 763
    const/4 v14, -0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 764
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->stringDefaultValue()Ljava/lang/String;

    move-result-object v12

    goto/16 :goto_26

    .line 768
    :cond_188
    const/4 v14, -0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 770
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->stringDefaultValue()Ljava/lang/String;

    move-result-object v12

    goto/16 :goto_26
.end method

.method public scanFieldStringArray([CLjava/lang/Class;)Ljava/util/Collection;
    .registers 19
    .param p1, "fieldName"    # [C
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([C",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 845
    .local p2, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 847
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v15, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p1

    invoke-static {v14, v15, v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->charArrayCompare(Ljava/lang/String;I[C)Z

    move-result v14

    if-nez v14, :cond_1c

    .line 848
    const/4 v14, -0x2

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 849
    const/4 v9, 0x0

    .line 991
    :goto_1b
    return-object v9

    .line 854
    :cond_1c
    const-class v14, Ljava/util/HashSet;

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v14

    if-eqz v14, :cond_61

    .line 855
    new-instance v9, Ljava/util/HashSet;

    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    .line 866
    .local v9, "list":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    :goto_2b
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p1

    array-length v15, v0

    add-int v7, v14, v15

    .line 868
    .local v7, "index":I
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "index":I
    .local v8, "index":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v1

    .line 870
    .local v1, "ch":C
    const/16 v14, 0x5b

    if-ne v1, v14, :cond_159

    .line 871
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "index":I
    .restart local v7    # "index":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v1

    move v8, v7

    .line 874
    .end local v7    # "index":I
    .restart local v8    # "index":I
    :goto_49
    const/16 v14, 0x22

    if-ne v1, v14, :cond_df

    .line 875
    move v12, v8

    .line 876
    .local v12, "startIndex":I
    const/16 v14, 0x22

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->indexOf(CI)I

    move-result v5

    .line 877
    .local v5, "endIndex":I
    const/4 v14, -0x1

    if-ne v5, v14, :cond_83

    .line 878
    new-instance v14, Lcom/alibaba/fastjson/JSONException;

    const-string v15, "unclosed str"

    invoke-direct {v14, v15}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 856
    .end local v1    # "ch":C
    .end local v5    # "endIndex":I
    .end local v8    # "index":I
    .end local v9    # "list":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .end local v12    # "startIndex":I
    :cond_61
    const-class v14, Ljava/util/ArrayList;

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v14

    if-eqz v14, :cond_71

    .line 857
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .restart local v9    # "list":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    goto :goto_2b

    .line 860
    .end local v9    # "list":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    :cond_71
    :try_start_71
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Collection;
    :try_end_77
    .catch Ljava/lang/Exception; {:try_start_71 .. :try_end_77} :catch_78

    .restart local v9    # "list":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    goto :goto_2b

    .line 861
    .end local v9    # "list":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    :catch_78
    move-exception v4

    .line 862
    .local v4, "e":Ljava/lang/Exception;
    new-instance v14, Lcom/alibaba/fastjson/JSONException;

    invoke-virtual {v4}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15, v4}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v14

    .line 881
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v1    # "ch":C
    .restart local v5    # "endIndex":I
    .restart local v8    # "index":I
    .restart local v9    # "list":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .restart local v12    # "startIndex":I
    :cond_83
    sub-int v14, v5, v12

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v14}, Lcom/alibaba/fastjson/parser/JSONScanner;->subString(II)Ljava/lang/String;

    move-result-object v13

    .line 882
    .local v13, "stringVal":Ljava/lang/String;
    const/16 v14, 0x5c

    invoke-virtual {v13, v14}, Ljava/lang/String;->indexOf(I)I

    move-result v14

    const/4 v15, -0x1

    if-eq v14, v15, :cond_b8

    .line 884
    :goto_94
    const/4 v10, 0x0

    .line 885
    .local v10, "slashCount":I
    add-int/lit8 v6, v5, -0x1

    .local v6, "i":I
    :goto_97
    if-ltz v6, :cond_a8

    .line 886
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v14

    const/16 v15, 0x5c

    if-ne v14, v15, :cond_a8

    .line 887
    add-int/lit8 v10, v10, 0x1

    .line 885
    add-int/lit8 v6, v6, -0x1

    goto :goto_97

    .line 892
    :cond_a8
    rem-int/lit8 v14, v10, 0x2

    if-nez v14, :cond_d4

    .line 898
    sub-int v3, v5, v12

    .line 899
    .local v3, "chars_len":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->sub_chars(II)[C

    move-result-object v2

    .line 901
    .local v2, "chars":[C
    invoke-static {v2, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->readString([CI)Ljava/lang/String;

    move-result-object v13

    .line 904
    .end local v2    # "chars":[C
    .end local v3    # "chars_len":I
    .end local v6    # "i":I
    .end local v10    # "slashCount":I
    :cond_b8
    add-int/lit8 v7, v5, 0x1

    .line 905
    .end local v8    # "index":I
    .restart local v7    # "index":I
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "index":I
    .restart local v8    # "index":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v1

    .line 907
    invoke-interface {v9, v13}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 920
    .end local v5    # "endIndex":I
    .end local v12    # "startIndex":I
    .end local v13    # "stringVal":Ljava/lang/String;
    :goto_c5
    const/16 v14, 0x2c

    if-ne v1, v14, :cond_135

    .line 921
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "index":I
    .restart local v7    # "index":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v1

    move v8, v7

    .line 922
    .end local v7    # "index":I
    .restart local v8    # "index":I
    goto/16 :goto_49

    .line 895
    .restart local v5    # "endIndex":I
    .restart local v6    # "i":I
    .restart local v10    # "slashCount":I
    .restart local v12    # "startIndex":I
    .restart local v13    # "stringVal":Ljava/lang/String;
    :cond_d4
    const/16 v14, 0x22

    add-int/lit8 v15, v5, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Lcom/alibaba/fastjson/parser/JSONScanner;->indexOf(CI)I

    move-result v5

    .line 896
    goto :goto_94

    .line 908
    .end local v5    # "endIndex":I
    .end local v6    # "i":I
    .end local v10    # "slashCount":I
    .end local v12    # "startIndex":I
    .end local v13    # "stringVal":Ljava/lang/String;
    :cond_df
    const/16 v14, 0x6e

    if-ne v1, v14, :cond_fe

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    const-string v15, "ull"

    invoke-virtual {v14, v15, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v14

    if-eqz v14, :cond_fe

    .line 909
    add-int/lit8 v7, v8, 0x3

    .line 910
    .end local v8    # "index":I
    .restart local v7    # "index":I
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "index":I
    .restart local v8    # "index":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v1

    .line 911
    const/4 v14, 0x0

    invoke-interface {v9, v14}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_c5

    .line 912
    :cond_fe
    const/16 v14, 0x5d

    if-ne v1, v14, :cond_12d

    invoke-interface {v9}, Ljava/util/Collection;->size()I

    move-result v14

    if-nez v14, :cond_12d

    .line 913
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "index":I
    .restart local v7    # "index":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v1

    .line 945
    :cond_110
    :goto_110
    move-object/from16 v0, p0

    iput v7, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 946
    const/16 v14, 0x2c

    if-ne v1, v14, :cond_17a

    .line 947
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v14

    move-object/from16 v0, p0

    iput-char v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 948
    const/4 v14, 0x3

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    goto/16 :goto_1b

    .line 916
    .end local v7    # "index":I
    .restart local v8    # "index":I
    :cond_12d
    const/4 v14, -0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 917
    const/4 v9, 0x0

    goto/16 :goto_1b

    .line 925
    :cond_135
    const/16 v14, 0x5d

    if-ne v1, v14, :cond_151

    .line 926
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "index":I
    .restart local v7    # "index":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v1

    .line 927
    :goto_141
    invoke-static {v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->isWhitespace(C)Z

    move-result v14

    if-eqz v14, :cond_110

    .line 928
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "index":I
    .restart local v8    # "index":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v1

    move v7, v8

    .end local v8    # "index":I
    .restart local v7    # "index":I
    goto :goto_141

    .line 933
    .end local v7    # "index":I
    .restart local v8    # "index":I
    :cond_151
    const/4 v14, -0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 934
    const/4 v9, 0x0

    goto/16 :goto_1b

    .line 936
    :cond_159
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    const-string v15, "ull"

    invoke-virtual {v14, v15, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v14

    if-eqz v14, :cond_172

    .line 937
    add-int/lit8 v7, v8, 0x3

    .line 938
    .end local v8    # "index":I
    .restart local v7    # "index":I
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "index":I
    .restart local v8    # "index":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v1

    .line 939
    const/4 v9, 0x0

    move v7, v8

    .end local v8    # "index":I
    .restart local v7    # "index":I
    goto :goto_110

    .line 941
    .end local v7    # "index":I
    .restart local v8    # "index":I
    :cond_172
    const/4 v14, -0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 942
    const/4 v9, 0x0

    goto/16 :goto_1b

    .line 950
    .end local v8    # "index":I
    .restart local v7    # "index":I
    :cond_17a
    const/16 v14, 0x7d

    if-ne v1, v14, :cond_21a

    .line 951
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v1

    .line 953
    :cond_188
    const/16 v14, 0x2c

    if-ne v1, v14, :cond_1ad

    .line 954
    const/16 v14, 0x10

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 955
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v14

    move-object/from16 v0, p0

    iput-char v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 985
    :goto_1a6
    const/4 v14, 0x4

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    goto/16 :goto_1b

    .line 957
    :cond_1ad
    const/16 v14, 0x5d

    if-ne v1, v14, :cond_1cc

    .line 958
    const/16 v14, 0xf

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 959
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v14

    move-object/from16 v0, p0

    iput-char v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    goto :goto_1a6

    .line 961
    :cond_1cc
    const/16 v14, 0x7d

    if-ne v1, v14, :cond_1eb

    .line 962
    const/16 v14, 0xd

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 963
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v14

    move-object/from16 v0, p0

    iput-char v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    goto :goto_1a6

    .line 965
    :cond_1eb
    const/16 v14, 0x1a

    if-ne v1, v14, :cond_1fa

    .line 966
    const/16 v14, 0x14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 967
    move-object/from16 v0, p0

    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    goto :goto_1a6

    .line 970
    :cond_1fa
    const/4 v11, 0x0

    .line 971
    .local v11, "space":Z
    :goto_1fb
    invoke-static {v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->isWhitespace(C)Z

    move-result v14

    if-eqz v14, :cond_210

    .line 972
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "index":I
    .restart local v8    # "index":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v1

    .line 973
    move-object/from16 v0, p0

    iput v8, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 974
    const/4 v11, 0x1

    move v7, v8

    .end local v8    # "index":I
    .restart local v7    # "index":I
    goto :goto_1fb

    .line 976
    :cond_210
    if-nez v11, :cond_188

    .line 980
    const/4 v14, -0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 981
    const/4 v9, 0x0

    goto/16 :goto_1b

    .line 987
    .end local v11    # "space":Z
    :cond_21a
    const/4 v14, -0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 988
    const/4 v9, 0x0

    goto/16 :goto_1b
.end method

.method public scanFieldSymbol([CLcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;
    .registers 16
    .param p1, "fieldName"    # [C
    .param p2, "symbolTable"    # Lcom/alibaba/fastjson/parser/SymbolTable;

    .prologue
    const/16 v12, 0x7d

    const/16 v11, 0x2c

    const/16 v10, 0x22

    const/4 v9, -0x1

    const/4 v6, 0x0

    .line 777
    const/4 v7, 0x0

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 779
    iget-object v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-static {v7, v8, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charArrayCompare(Ljava/lang/String;I[C)Z

    move-result v7

    if-nez v7, :cond_1a

    .line 780
    const/4 v7, -0x2

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move-object v5, v6

    .line 840
    :goto_19
    return-object v5

    .line 784
    :cond_1a
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    array-length v8, p1

    add-int v2, v7, v8

    .line 786
    .local v2, "index":I
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "index":I
    .local v3, "index":I
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 787
    .local v0, "ch":C
    if-eq v0, v10, :cond_2b

    .line 788
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move-object v5, v6

    .line 789
    goto :goto_19

    .line 793
    :cond_2b
    move v4, v3

    .line 794
    .local v4, "start":I
    const/4 v1, 0x0

    .local v1, "hash":I
    move v2, v3

    .line 796
    .end local v3    # "index":I
    .restart local v2    # "index":I
    :goto_2e
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "index":I
    .restart local v3    # "index":I
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 797
    if-ne v0, v10, :cond_5c

    .line 798
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 799
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    iput-char v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 801
    iget-object v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    sub-int v8, v3, v4

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {p2, v7, v4, v8, v1}, Lcom/alibaba/fastjson/parser/SymbolTable;->addSymbol(Ljava/lang/String;III)Ljava/lang/String;

    move-result-object v5

    .line 813
    .local v5, "strVal":Ljava/lang/String;
    if-ne v0, v11, :cond_68

    .line 814
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v6

    iput-char v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 815
    const/4 v6, 0x3

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    goto :goto_19

    .line 805
    .end local v5    # "strVal":Ljava/lang/String;
    :cond_5c
    mul-int/lit8 v7, v1, 0x1f

    add-int v1, v7, v0

    .line 807
    const/16 v7, 0x5c

    if-ne v0, v7, :cond_c5

    .line 808
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move-object v5, v6

    .line 809
    goto :goto_19

    .line 817
    .restart local v5    # "strVal":Ljava/lang/String;
    :cond_68
    if-ne v0, v12, :cond_c0

    .line 818
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 819
    if-ne v0, v11, :cond_8a

    .line 820
    const/16 v6, 0x10

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 821
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v6

    iput-char v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 834
    :goto_86
    const/4 v6, 0x4

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    goto :goto_19

    .line 822
    :cond_8a
    const/16 v7, 0x5d

    if-ne v0, v7, :cond_9f

    .line 823
    const/16 v6, 0xf

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 824
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v6

    iput-char v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    goto :goto_86

    .line 825
    :cond_9f
    if-ne v0, v12, :cond_b2

    .line 826
    const/16 v6, 0xd

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 827
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v6

    iput-char v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    goto :goto_86

    .line 828
    :cond_b2
    const/16 v7, 0x1a

    if-ne v0, v7, :cond_bb

    .line 829
    const/16 v6, 0x14

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    goto :goto_86

    .line 831
    :cond_bb
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move-object v5, v6

    .line 832
    goto/16 :goto_19

    .line 836
    :cond_c0
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move-object v5, v6

    .line 837
    goto/16 :goto_19

    .end local v5    # "strVal":Ljava/lang/String;
    :cond_c5
    move v2, v3

    .end local v3    # "index":I
    .restart local v2    # "index":I
    goto/16 :goto_2e
.end method

.method public scanISO8601DateIfMatch()Z
    .registers 2

    .prologue
    .line 173
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch(Z)Z

    move-result v0

    return v0
.end method

.method public scanISO8601DateIfMatch(Z)Z
    .registers 65
    .param p1, "strict"    # Z

    .prologue
    .line 177
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->len:I

    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move/from16 v19, v0

    sub-int v51, v12, v19

    .line 179
    .local v51, "rest":I
    if-nez p1, :cond_112

    const/16 v12, 0xd

    move/from16 v0, v51

    if-le v0, v12, :cond_112

    .line 180
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v32

    .line 181
    .local v32, "c0":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v33

    .line 182
    .local v33, "c1":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v34

    .line 183
    .local v34, "c2":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v35

    .line 184
    .local v35, "c3":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v36

    .line 185
    .local v36, "c4":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x5

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v37

    .line 187
    .local v37, "c5":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int v12, v12, v51

    add-int/lit8 v12, v12, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v38

    .line 188
    .local v38, "c_r0":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int v12, v12, v51

    add-int/lit8 v12, v12, -0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v39

    .line 189
    .local v39, "c_r1":C
    const/16 v12, 0x2f

    move/from16 v0, v32

    if-ne v0, v12, :cond_112

    const/16 v12, 0x44

    move/from16 v0, v33

    if-ne v0, v12, :cond_112

    const/16 v12, 0x61

    move/from16 v0, v34

    if-ne v0, v12, :cond_112

    const/16 v12, 0x74

    move/from16 v0, v35

    if-ne v0, v12, :cond_112

    const/16 v12, 0x65

    move/from16 v0, v36

    if-ne v0, v12, :cond_112

    const/16 v12, 0x28

    move/from16 v0, v37

    if-ne v0, v12, :cond_112

    const/16 v12, 0x2f

    move/from16 v0, v38

    if-ne v0, v12, :cond_112

    const/16 v12, 0x29

    move/from16 v0, v39

    if-ne v0, v12, :cond_112

    .line 191
    const/16 v50, -0x1

    .line 192
    .local v50, "plusIndex":I
    const/16 v43, 0x6

    .local v43, "i":I
    :goto_aa
    move/from16 v0, v43

    move/from16 v1, v51

    if-ge v0, v1, :cond_d3

    .line 193
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int v12, v12, v43

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v31

    .line 194
    .local v31, "c":C
    const/16 v12, 0x2b

    move/from16 v0, v31

    if-ne v0, v12, :cond_c7

    .line 195
    move/from16 v50, v43

    .line 192
    :cond_c4
    add-int/lit8 v43, v43, 0x1

    goto :goto_aa

    .line 196
    :cond_c7
    const/16 v12, 0x30

    move/from16 v0, v31

    if-lt v0, v12, :cond_d3

    const/16 v12, 0x39

    move/from16 v0, v31

    if-le v0, v12, :cond_c4

    .line 200
    .end local v31    # "c":C
    :cond_d3
    const/4 v12, -0x1

    move/from16 v0, v50

    if-ne v0, v12, :cond_da

    .line 201
    const/4 v12, 0x0

    .line 469
    .end local v32    # "c0":C
    .end local v33    # "c1":C
    .end local v34    # "c2":C
    .end local v35    # "c3":C
    .end local v36    # "c4":C
    .end local v37    # "c5":C
    .end local v38    # "c_r0":C
    .end local v39    # "c_r1":C
    .end local v43    # "i":I
    .end local v50    # "plusIndex":I
    :goto_d9
    return v12

    .line 203
    .restart local v32    # "c0":C
    .restart local v33    # "c1":C
    .restart local v34    # "c2":C
    .restart local v35    # "c3":C
    .restart local v36    # "c4":C
    .restart local v37    # "c5":C
    .restart local v38    # "c_r0":C
    .restart local v39    # "c_r1":C
    .restart local v43    # "i":I
    .restart local v50    # "plusIndex":I
    :cond_da
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v49, v12, 0x6

    .line 204
    .local v49, "offset":I
    sub-int v12, v50, v49

    move-object/from16 v0, p0

    move/from16 v1, v49

    invoke-virtual {v0, v1, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->subString(II)Ljava/lang/String;

    move-result-object v48

    .line 205
    .local v48, "numberText":Ljava/lang/String;
    invoke-static/range {v48 .. v48}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v44

    .line 207
    .local v44, "millis":J
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->timeZone:Ljava/util/TimeZone;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->locale:Ljava/util/Locale;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-static {v12, v0}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v12

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    .line 208
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    move-wide/from16 v0, v44

    invoke-virtual {v12, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 210
    const/4 v12, 0x5

    move-object/from16 v0, p0

    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 211
    const/4 v12, 0x1

    goto :goto_d9

    .line 215
    .end local v32    # "c0":C
    .end local v33    # "c1":C
    .end local v34    # "c2":C
    .end local v35    # "c3":C
    .end local v36    # "c4":C
    .end local v37    # "c5":C
    .end local v38    # "c_r0":C
    .end local v39    # "c_r1":C
    .end local v43    # "i":I
    .end local v44    # "millis":J
    .end local v48    # "numberText":Ljava/lang/String;
    .end local v49    # "offset":I
    .end local v50    # "plusIndex":I
    :cond_112
    const/16 v12, 0x8

    move/from16 v0, v51

    if-eq v0, v12, :cond_124

    const/16 v12, 0xe

    move/from16 v0, v51

    if-eq v0, v12, :cond_124

    const/16 v12, 0x11

    move/from16 v0, v51

    if-ne v0, v12, :cond_2bf

    .line 216
    :cond_124
    if-eqz p1, :cond_128

    .line 217
    const/4 v12, 0x0

    goto :goto_d9

    .line 220
    :cond_128
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v4

    .line 221
    .local v4, "y0":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v5

    .line 222
    .local v5, "y1":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v6

    .line 223
    .local v6, "y2":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v7

    .line 224
    .local v7, "y3":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v8

    .line 225
    .local v8, "M0":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x5

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v9

    .line 226
    .local v9, "M1":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x6

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v10

    .line 227
    .local v10, "d0":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x7

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v11

    .line 229
    .local v11, "d1":C
    invoke-static/range {v4 .. v11}, Lcom/alibaba/fastjson/parser/JSONScanner;->checkDate(CCCCCCII)Z

    move-result v12

    if-nez v12, :cond_18f

    .line 230
    const/4 v12, 0x0

    goto/16 :goto_d9

    :cond_18f
    move-object/from16 v12, p0

    move v13, v4

    move v14, v5

    move v15, v6

    move/from16 v16, v7

    move/from16 v17, v8

    move/from16 v18, v9

    move/from16 v19, v10

    move/from16 v20, v11

    .line 233
    invoke-direct/range {v12 .. v20}, Lcom/alibaba/fastjson/parser/JSONScanner;->setCalendar(CCCCCCCC)V

    .line 236
    const/16 v12, 0x8

    move/from16 v0, v51

    if-eq v0, v12, :cond_2b6

    .line 237
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v13

    .line 238
    .local v13, "h0":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x9

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v14

    .line 239
    .local v14, "h1":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0xa

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v15

    .line 240
    .local v15, "m0":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0xb

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v16

    .line 241
    .local v16, "m1":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0xc

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v17

    .line 242
    .local v17, "s0":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0xd

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v18

    .local v18, "s1":C
    move-object/from16 v12, p0

    .line 244
    invoke-direct/range {v12 .. v18}, Lcom/alibaba/fastjson/parser/JSONScanner;->checkTime(CCCCCC)Z

    move-result v12

    if-nez v12, :cond_1fa

    .line 245
    const/4 v12, 0x0

    goto/16 :goto_d9

    .line 248
    :cond_1fa
    const/16 v12, 0x11

    move/from16 v0, v51

    if-ne v0, v12, :cond_2b3

    .line 249
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0xe

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v28

    .line 250
    .local v28, "S0":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0xf

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v29

    .line 251
    .local v29, "S1":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x10

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v30

    .line 252
    .local v30, "S2":C
    const/16 v12, 0x30

    move/from16 v0, v28

    if-lt v0, v12, :cond_230

    const/16 v12, 0x39

    move/from16 v0, v28

    if-le v0, v12, :cond_233

    .line 253
    :cond_230
    const/4 v12, 0x0

    goto/16 :goto_d9

    .line 255
    :cond_233
    const/16 v12, 0x30

    move/from16 v0, v29

    if-lt v0, v12, :cond_23f

    const/16 v12, 0x39

    move/from16 v0, v29

    if-le v0, v12, :cond_242

    .line 256
    :cond_23f
    const/4 v12, 0x0

    goto/16 :goto_d9

    .line 258
    :cond_242
    const/16 v12, 0x30

    move/from16 v0, v30

    if-lt v0, v12, :cond_24e

    const/16 v12, 0x39

    move/from16 v0, v30

    if-le v0, v12, :cond_251

    .line 259
    :cond_24e
    const/4 v12, 0x0

    goto/16 :goto_d9

    .line 262
    :cond_251
    add-int/lit8 v12, v28, -0x30

    mul-int/lit8 v12, v12, 0x64

    add-int/lit8 v19, v29, -0x30

    mul-int/lit8 v19, v19, 0xa

    add-int v12, v12, v19

    add-int/lit8 v19, v30, -0x30

    add-int v44, v12, v19

    .line 267
    .end local v28    # "S0":C
    .end local v29    # "S1":C
    .end local v30    # "S2":C
    .local v44, "millis":I
    :goto_25f
    add-int/lit8 v12, v13, -0x30

    mul-int/lit8 v12, v12, 0xa

    add-int/lit8 v19, v14, -0x30

    add-int v42, v12, v19

    .line 268
    .local v42, "hour":I
    add-int/lit8 v12, v15, -0x30

    mul-int/lit8 v12, v12, 0xa

    add-int/lit8 v19, v16, -0x30

    add-int v47, v12, v19

    .line 269
    .local v47, "minute":I
    add-int/lit8 v12, v17, -0x30

    mul-int/lit8 v12, v12, 0xa

    add-int/lit8 v19, v18, -0x30

    add-int v52, v12, v19

    .line 277
    .end local v13    # "h0":C
    .end local v14    # "h1":C
    .end local v15    # "m0":C
    .end local v16    # "m1":C
    .end local v17    # "s0":C
    .end local v18    # "s1":C
    .local v52, "seconds":I
    :goto_277
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    const/16 v19, 0xb

    move/from16 v0, v19

    move/from16 v1, v42

    invoke-virtual {v12, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 278
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    const/16 v19, 0xc

    move/from16 v0, v19

    move/from16 v1, v47

    invoke-virtual {v12, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 279
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    const/16 v19, 0xd

    move/from16 v0, v19

    move/from16 v1, v52

    invoke-virtual {v12, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 280
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    const/16 v19, 0xe

    move/from16 v0, v19

    move/from16 v1, v44

    invoke-virtual {v12, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 282
    const/4 v12, 0x5

    move-object/from16 v0, p0

    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 283
    const/4 v12, 0x1

    goto/16 :goto_d9

    .line 264
    .end local v42    # "hour":I
    .end local v44    # "millis":I
    .end local v47    # "minute":I
    .end local v52    # "seconds":I
    .restart local v13    # "h0":C
    .restart local v14    # "h1":C
    .restart local v15    # "m0":C
    .restart local v16    # "m1":C
    .restart local v17    # "s0":C
    .restart local v18    # "s1":C
    :cond_2b3
    const/16 v44, 0x0

    .restart local v44    # "millis":I
    goto :goto_25f

    .line 271
    .end local v13    # "h0":C
    .end local v14    # "h1":C
    .end local v15    # "m0":C
    .end local v16    # "m1":C
    .end local v17    # "s0":C
    .end local v18    # "s1":C
    .end local v44    # "millis":I
    :cond_2b6
    const/16 v42, 0x0

    .line 272
    .restart local v42    # "hour":I
    const/16 v47, 0x0

    .line 273
    .restart local v47    # "minute":I
    const/16 v52, 0x0

    .line 274
    .restart local v52    # "seconds":I
    const/16 v44, 0x0

    .restart local v44    # "millis":I
    goto :goto_277

    .line 286
    .end local v4    # "y0":C
    .end local v5    # "y1":C
    .end local v6    # "y2":C
    .end local v7    # "y3":C
    .end local v8    # "M0":C
    .end local v9    # "M1":C
    .end local v10    # "d0":C
    .end local v11    # "d1":C
    .end local v42    # "hour":I
    .end local v44    # "millis":I
    .end local v47    # "minute":I
    .end local v52    # "seconds":I
    :cond_2bf
    sget v12, Lcom/alibaba/fastjson/parser/JSONScanner;->ISO8601_LEN_0:I

    move/from16 v0, v51

    if-ge v0, v12, :cond_2c8

    .line 287
    const/4 v12, 0x0

    goto/16 :goto_d9

    .line 290
    :cond_2c8
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v12

    const/16 v19, 0x2d

    move/from16 v0, v19

    if-eq v12, v0, :cond_2dd

    .line 291
    const/4 v12, 0x0

    goto/16 :goto_d9

    .line 293
    :cond_2dd
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x7

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v12

    const/16 v19, 0x2d

    move/from16 v0, v19

    if-eq v12, v0, :cond_2f2

    .line 294
    const/4 v12, 0x0

    goto/16 :goto_d9

    .line 297
    :cond_2f2
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v4

    .line 298
    .restart local v4    # "y0":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v5

    .line 299
    .restart local v5    # "y1":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v6

    .line 300
    .restart local v6    # "y2":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v7

    .line 301
    .restart local v7    # "y3":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x5

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v8

    .line 302
    .restart local v8    # "M0":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x6

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v9

    .line 303
    .restart local v9    # "M1":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v10

    .line 304
    .restart local v10    # "d0":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x9

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v11

    .line 305
    .restart local v11    # "d1":C
    invoke-static/range {v4 .. v11}, Lcom/alibaba/fastjson/parser/JSONScanner;->checkDate(CCCCCCII)Z

    move-result v12

    if-nez v12, :cond_359

    .line 306
    const/4 v12, 0x0

    goto/16 :goto_d9

    :cond_359
    move-object/from16 v19, p0

    move/from16 v20, v4

    move/from16 v21, v5

    move/from16 v22, v6

    move/from16 v23, v7

    move/from16 v24, v8

    move/from16 v25, v9

    move/from16 v26, v10

    move/from16 v27, v11

    .line 309
    invoke-direct/range {v19 .. v27}, Lcom/alibaba/fastjson/parser/JSONScanner;->setCalendar(CCCCCCCC)V

    .line 311
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0xa

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v53

    .line 312
    .local v53, "t":C
    const/16 v12, 0x54

    move/from16 v0, v53

    if-eq v0, v12, :cond_388

    const/16 v12, 0x20

    move/from16 v0, v53

    if-ne v0, v12, :cond_391

    if-nez p1, :cond_391

    .line 313
    :cond_388
    sget v12, Lcom/alibaba/fastjson/parser/JSONScanner;->ISO8601_LEN_1:I

    move/from16 v0, v51

    if-ge v0, v12, :cond_492

    .line 314
    const/4 v12, 0x0

    goto/16 :goto_d9

    .line 316
    :cond_391
    const/16 v12, 0x22

    move/from16 v0, v53

    if-eq v0, v12, :cond_39d

    const/16 v12, 0x1a

    move/from16 v0, v53

    if-ne v0, v12, :cond_3f5

    .line 317
    :cond_39d
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    const/16 v19, 0xb

    const/16 v20, 0x0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v12, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 318
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    const/16 v19, 0xc

    const/16 v20, 0x0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v12, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 319
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    const/16 v19, 0xd

    const/16 v20, 0x0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v12, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 320
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    const/16 v19, 0xe

    const/16 v20, 0x0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v12, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 322
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0xa

    move-object/from16 v0, p0

    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v12

    move-object/from16 v0, p0

    iput-char v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 324
    const/4 v12, 0x5

    move-object/from16 v0, p0

    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 325
    const/4 v12, 0x1

    goto/16 :goto_d9

    .line 326
    :cond_3f5
    const/16 v12, 0x2b

    move/from16 v0, v53

    if-eq v0, v12, :cond_401

    const/16 v12, 0x2d

    move/from16 v0, v53

    if-ne v0, v12, :cond_48f

    .line 327
    :cond_401
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->len:I

    const/16 v19, 0x10

    move/from16 v0, v19

    if-ne v12, v0, :cond_48c

    .line 328
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0xd

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v12

    const/16 v19, 0x3a

    move/from16 v0, v19

    if-ne v12, v0, :cond_441

    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0xe

    .line 329
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v12

    const/16 v19, 0x30

    move/from16 v0, v19

    if-ne v12, v0, :cond_441

    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0xf

    .line 330
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v12

    const/16 v19, 0x30

    move/from16 v0, v19

    if-eq v12, v0, :cond_444

    .line 331
    :cond_441
    const/4 v12, 0x0

    goto/16 :goto_d9

    .line 334
    :cond_444
    const/16 v20, 0x30

    const/16 v21, 0x30

    const/16 v22, 0x30

    const/16 v23, 0x30

    const/16 v24, 0x30

    const/16 v25, 0x30

    move-object/from16 v19, p0

    invoke-virtual/range {v19 .. v25}, Lcom/alibaba/fastjson/parser/JSONScanner;->setTime(CCCCCC)V

    .line 335
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    const/16 v19, 0xe

    const/16 v20, 0x0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v12, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 336
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0xb

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v12

    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move/from16 v19, v0

    add-int/lit8 v19, v19, 0xc

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v53

    move/from16 v2, v19

    invoke-virtual {v0, v1, v12, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->setTimeZone(CCC)V

    .line 337
    const/4 v12, 0x1

    goto/16 :goto_d9

    .line 339
    :cond_48c
    const/4 v12, 0x0

    goto/16 :goto_d9

    .line 341
    :cond_48f
    const/4 v12, 0x0

    goto/16 :goto_d9

    .line 344
    :cond_492
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0xd

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v12

    const/16 v19, 0x3a

    move/from16 v0, v19

    if-eq v12, v0, :cond_4a7

    .line 345
    const/4 v12, 0x0

    goto/16 :goto_d9

    .line 347
    :cond_4a7
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x10

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v12

    const/16 v19, 0x3a

    move/from16 v0, v19

    if-eq v12, v0, :cond_4bc

    .line 348
    const/4 v12, 0x0

    goto/16 :goto_d9

    .line 351
    :cond_4bc
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0xb

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v13

    .line 352
    .restart local v13    # "h0":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0xc

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v14

    .line 353
    .restart local v14    # "h1":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0xe

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v15

    .line 354
    .restart local v15    # "m0":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0xf

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v16

    .line 355
    .restart local v16    # "m1":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x11

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v17

    .line 356
    .restart local v17    # "s0":C
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x12

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v18

    .restart local v18    # "s1":C
    move-object/from16 v12, p0

    .line 358
    invoke-direct/range {v12 .. v18}, Lcom/alibaba/fastjson/parser/JSONScanner;->checkTime(CCCCCC)Z

    move-result v12

    if-nez v12, :cond_50f

    .line 359
    const/4 v12, 0x0

    goto/16 :goto_d9

    :cond_50f
    move-object/from16 v12, p0

    .line 362
    invoke-virtual/range {v12 .. v18}, Lcom/alibaba/fastjson/parser/JSONScanner;->setTime(CCCCCC)V

    .line 364
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x13

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v40

    .line 365
    .local v40, "dot":C
    const/16 v12, 0x2e

    move/from16 v0, v40

    if-ne v0, v12, :cond_52f

    .line 366
    sget v12, Lcom/alibaba/fastjson/parser/JSONScanner;->ISO8601_LEN_2:I

    move/from16 v0, v51

    if-ge v0, v12, :cond_588

    .line 367
    const/4 v12, 0x0

    goto/16 :goto_d9

    .line 370
    :cond_52f
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    const/16 v19, 0xe

    const/16 v20, 0x0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v12, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 372
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x13

    move-object/from16 v0, p0

    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v12

    move-object/from16 v0, p0

    iput-char v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 374
    const/4 v12, 0x5

    move-object/from16 v0, p0

    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 376
    const/16 v12, 0x5a

    move/from16 v0, v40

    if-ne v0, v12, :cond_585

    .line 378
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    invoke-virtual {v12}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v12

    if-eqz v12, :cond_585

    .line 379
    const/4 v12, 0x0

    invoke-static {v12}, Ljava/util/TimeZone;->getAvailableIDs(I)[Ljava/lang/String;

    move-result-object v61

    .line 380
    .local v61, "timeZoneIDs":[Ljava/lang/String;
    move-object/from16 v0, v61

    array-length v12, v0

    if-lez v12, :cond_585

    .line 381
    const/4 v12, 0x0

    aget-object v12, v61, v12

    invoke-static {v12}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v59

    .line 382
    .local v59, "timeZone":Ljava/util/TimeZone;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    move-object/from16 v0, v59

    invoke-virtual {v12, v0}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 386
    .end local v59    # "timeZone":Ljava/util/TimeZone;
    .end local v61    # "timeZoneIDs":[Ljava/lang/String;
    :cond_585
    const/4 v12, 0x1

    goto/16 :goto_d9

    .line 389
    :cond_588
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x14

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v28

    .line 390
    .restart local v28    # "S0":C
    const/16 v12, 0x30

    move/from16 v0, v28

    if-lt v0, v12, :cond_5a0

    const/16 v12, 0x39

    move/from16 v0, v28

    if-le v0, v12, :cond_5a3

    .line 391
    :cond_5a0
    const/4 v12, 0x0

    goto/16 :goto_d9

    .line 393
    :cond_5a3
    add-int/lit8 v44, v28, -0x30

    .line 394
    .restart local v44    # "millis":I
    const/16 v46, 0x1

    .line 397
    .local v46, "millisLen":I
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x15

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v29

    .line 398
    .restart local v29    # "S1":C
    const/16 v12, 0x30

    move/from16 v0, v29

    if-lt v0, v12, :cond_5c7

    const/16 v12, 0x39

    move/from16 v0, v29

    if-gt v0, v12, :cond_5c7

    .line 399
    mul-int/lit8 v12, v44, 0xa

    add-int/lit8 v19, v29, -0x30

    add-int v44, v12, v19

    .line 400
    const/16 v46, 0x2

    .line 404
    :cond_5c7
    const/4 v12, 0x2

    move/from16 v0, v46

    if-ne v0, v12, :cond_5ec

    .line 405
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x16

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v30

    .line 406
    .restart local v30    # "S2":C
    const/16 v12, 0x30

    move/from16 v0, v30

    if-lt v0, v12, :cond_5ec

    const/16 v12, 0x39

    move/from16 v0, v30

    if-gt v0, v12, :cond_5ec

    .line 407
    mul-int/lit8 v12, v44, 0xa

    add-int/lit8 v19, v30, -0x30

    add-int v44, v12, v19

    .line 408
    const/16 v46, 0x3

    .line 412
    .end local v30    # "S2":C
    :cond_5ec
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    const/16 v19, 0xe

    move/from16 v0, v19

    move/from16 v1, v44

    invoke-virtual {v12, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 414
    const/16 v62, 0x0

    .line 415
    .local v62, "timzeZoneLength":I
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x14

    add-int v12, v12, v46

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v60

    .line 416
    .local v60, "timeZoneFlag":C
    const/16 v12, 0x2b

    move/from16 v0, v60

    if-eq v0, v12, :cond_615

    const/16 v12, 0x2d

    move/from16 v0, v60

    if-ne v0, v12, :cond_6ec

    .line 417
    :cond_615
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x14

    add-int v12, v12, v46

    add-int/lit8 v12, v12, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v54

    .line 418
    .local v54, "t0":C
    const/16 v12, 0x30

    move/from16 v0, v54

    if-lt v0, v12, :cond_631

    const/16 v12, 0x31

    move/from16 v0, v54

    if-le v0, v12, :cond_634

    .line 419
    :cond_631
    const/4 v12, 0x0

    goto/16 :goto_d9

    .line 422
    :cond_634
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x14

    add-int v12, v12, v46

    add-int/lit8 v12, v12, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v55

    .line 423
    .local v55, "t1":C
    const/16 v12, 0x30

    move/from16 v0, v55

    if-lt v0, v12, :cond_650

    const/16 v12, 0x39

    move/from16 v0, v55

    if-le v0, v12, :cond_653

    .line 424
    :cond_650
    const/4 v12, 0x0

    goto/16 :goto_d9

    .line 427
    :cond_653
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x14

    add-int v12, v12, v46

    add-int/lit8 v12, v12, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v56

    .line 428
    .local v56, "t2":C
    const/16 v12, 0x3a

    move/from16 v0, v56

    if-ne v0, v12, :cond_6c7

    .line 429
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x14

    add-int v12, v12, v46

    add-int/lit8 v12, v12, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v57

    .line 430
    .local v57, "t3":C
    const/16 v12, 0x30

    move/from16 v0, v57

    if-eq v0, v12, :cond_682

    .line 431
    const/4 v12, 0x0

    goto/16 :goto_d9

    .line 434
    :cond_682
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x14

    add-int v12, v12, v46

    add-int/lit8 v12, v12, 0x5

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v58

    .line 435
    .local v58, "t4":C
    const/16 v12, 0x30

    move/from16 v0, v58

    if-eq v0, v12, :cond_69b

    .line 436
    const/4 v12, 0x0

    goto/16 :goto_d9

    .line 438
    :cond_69b
    const/16 v62, 0x6

    .line 449
    .end local v57    # "t3":C
    .end local v58    # "t4":C
    :goto_69d
    move-object/from16 v0, p0

    move/from16 v1, v60

    move/from16 v2, v54

    move/from16 v3, v55

    invoke-virtual {v0, v1, v2, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->setTimeZone(CCC)V

    .line 462
    .end local v54    # "t0":C
    .end local v55    # "t1":C
    .end local v56    # "t2":C
    :cond_6a8
    :goto_6a8
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v19, v46, 0x14

    add-int v19, v19, v62

    add-int v12, v12, v19

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v41

    .line 463
    .local v41, "end":C
    const/16 v12, 0x1a

    move/from16 v0, v41

    if-eq v0, v12, :cond_71d

    const/16 v12, 0x22

    move/from16 v0, v41

    if-eq v0, v12, :cond_71d

    .line 464
    const/4 v12, 0x0

    goto/16 :goto_d9

    .line 439
    .end local v41    # "end":C
    .restart local v54    # "t0":C
    .restart local v55    # "t1":C
    .restart local v56    # "t2":C
    :cond_6c7
    const/16 v12, 0x30

    move/from16 v0, v56

    if-ne v0, v12, :cond_6e9

    .line 440
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v12, v12, 0x14

    add-int v12, v12, v46

    add-int/lit8 v12, v12, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v57

    .line 441
    .restart local v57    # "t3":C
    const/16 v12, 0x30

    move/from16 v0, v57

    if-eq v0, v12, :cond_6e6

    .line 442
    const/4 v12, 0x0

    goto/16 :goto_d9

    .line 444
    :cond_6e6
    const/16 v62, 0x5

    .line 445
    goto :goto_69d

    .line 446
    .end local v57    # "t3":C
    :cond_6e9
    const/16 v62, 0x3

    goto :goto_69d

    .line 451
    .end local v54    # "t0":C
    .end local v55    # "t1":C
    .end local v56    # "t2":C
    :cond_6ec
    const/16 v12, 0x5a

    move/from16 v0, v60

    if-ne v0, v12, :cond_6a8

    .line 452
    const/16 v62, 0x1

    .line 453
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    invoke-virtual {v12}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v12

    if-eqz v12, :cond_6a8

    .line 454
    const/4 v12, 0x0

    invoke-static {v12}, Ljava/util/TimeZone;->getAvailableIDs(I)[Ljava/lang/String;

    move-result-object v61

    .line 455
    .restart local v61    # "timeZoneIDs":[Ljava/lang/String;
    move-object/from16 v0, v61

    array-length v12, v0

    if-lez v12, :cond_6a8

    .line 456
    const/4 v12, 0x0

    aget-object v12, v61, v12

    invoke-static {v12}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v59

    .line 457
    .restart local v59    # "timeZone":Ljava/util/TimeZone;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    move-object/from16 v0, v59

    invoke-virtual {v12, v0}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    goto :goto_6a8

    .line 466
    .end local v59    # "timeZone":Ljava/util/TimeZone;
    .end local v61    # "timeZoneIDs":[Ljava/lang/String;
    .restart local v41    # "end":C
    :cond_71d
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    add-int/lit8 v19, v46, 0x14

    add-int v19, v19, v62

    add-int v12, v12, v19

    move-object/from16 v0, p0

    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v12

    move-object/from16 v0, p0

    iput-char v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 468
    const/4 v12, 0x5

    move-object/from16 v0, p0

    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 469
    const/4 v12, 0x1

    goto/16 :goto_d9
.end method

.method public final scanInt(C)I
    .registers 13
    .param p1, "expectNext"    # C

    .prologue
    const/16 v10, 0x39

    const/16 v9, 0x30

    const/4 v8, -0x1

    const/4 v5, 0x0

    .line 1164
    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 1166
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 1167
    .local v2, "offset":I
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .local v3, "offset":I
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 1169
    .local v0, "chLocal":C
    const/16 v6, 0x2d

    if-ne v0, v6, :cond_35

    const/4 v1, 0x1

    .line 1170
    .local v1, "negative":Z
    :goto_15
    if-eqz v1, :cond_77

    .line 1171
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 1175
    :goto_1d
    if-lt v0, v9, :cond_47

    if-gt v0, v10, :cond_47

    .line 1176
    add-int/lit8 v4, v0, -0x30

    .line 1178
    .local v4, "value":I
    :goto_23
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 1179
    if-lt v0, v9, :cond_37

    if-gt v0, v10, :cond_37

    .line 1180
    mul-int/lit8 v6, v4, 0xa

    add-int/lit8 v7, v0, -0x30

    add-int v4, v6, v7

    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_23

    .end local v1    # "negative":Z
    .end local v2    # "offset":I
    .end local v4    # "value":I
    .restart local v3    # "offset":I
    :cond_35
    move v1, v5

    .line 1169
    goto :goto_15

    .line 1181
    .restart local v1    # "negative":Z
    .restart local v4    # "value":I
    :cond_37
    const/16 v6, 0x2e

    if-ne v0, v6, :cond_40

    .line 1182
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    move v4, v5

    .line 1210
    .end local v4    # "value":I
    :goto_3f
    return v4

    .line 1188
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    .restart local v4    # "value":I
    :cond_40
    if-gez v4, :cond_58

    .line 1189
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    move v4, v5

    .line 1190
    goto :goto_3f

    .line 1193
    .end local v4    # "value":I
    :cond_47
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move v4, v5

    .line 1194
    goto :goto_3f

    .line 1205
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    .restart local v4    # "value":I
    :cond_4b
    invoke-static {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->isWhitespace(C)Z

    move-result v5

    if-eqz v5, :cond_70

    .line 1206
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    move v3, v2

    .line 1198
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    :cond_58
    if-ne v0, p1, :cond_4b

    .line 1199
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 1200
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v5

    iput-char v5, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 1201
    const/4 v5, 0x3

    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 1202
    const/16 v5, 0x10

    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 1203
    if-eqz v1, :cond_6e

    neg-int v4, v4

    .end local v4    # "value":I
    :cond_6e
    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_3f

    .line 1209
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    .restart local v4    # "value":I
    :cond_70
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 1210
    if-eqz v1, :cond_75

    neg-int v4, v4

    .end local v4    # "value":I
    :cond_75
    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_3f

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    :cond_77
    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_1d
.end method

.method public scanLong(C)J
    .registers 12
    .param p1, "expectNextChar"    # C

    .prologue
    .line 1216
    const/4 v6, 0x0

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 1218
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 1219
    .local v2, "offset":I
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .local v3, "offset":I
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 1221
    .local v0, "chLocal":C
    const/16 v6, 0x2d

    if-ne v0, v6, :cond_3b

    const/4 v1, 0x1

    .line 1222
    .local v1, "negative":Z
    :goto_10
    if-eqz v1, :cond_85

    .line 1223
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 1227
    :goto_18
    const/16 v6, 0x30

    if-lt v0, v6, :cond_55

    const/16 v6, 0x39

    if-gt v0, v6, :cond_55

    .line 1228
    add-int/lit8 v6, v0, -0x30

    int-to-long v4, v6

    .line 1230
    .local v4, "value":J
    :goto_23
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    .line 1231
    const/16 v6, 0x30

    if-lt v0, v6, :cond_3d

    const/16 v6, 0x39

    if-gt v0, v6, :cond_3d

    .line 1232
    const-wide/16 v6, 0xa

    mul-long/2addr v6, v4

    add-int/lit8 v8, v0, -0x30

    int-to-long v8, v8

    add-long v4, v6, v8

    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_23

    .line 1221
    .end local v1    # "negative":Z
    .end local v2    # "offset":I
    .end local v4    # "value":J
    .restart local v3    # "offset":I
    :cond_3b
    const/4 v1, 0x0

    goto :goto_10

    .line 1233
    .restart local v1    # "negative":Z
    .restart local v4    # "value":J
    :cond_3d
    const/16 v6, 0x2e

    if-ne v0, v6, :cond_48

    .line 1234
    const/4 v6, -0x1

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 1235
    const-wide/16 v4, 0x0

    move v2, v3

    .line 1263
    .end local v3    # "offset":I
    .end local v4    # "value":J
    .restart local v2    # "offset":I
    :goto_47
    return-wide v4

    .line 1240
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    .restart local v4    # "value":J
    :cond_48
    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-gez v6, :cond_68

    .line 1241
    const/4 v6, -0x1

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 1242
    const-wide/16 v4, 0x0

    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_47

    .line 1245
    .end local v4    # "value":J
    :cond_55
    const/4 v6, -0x1

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 1246
    const-wide/16 v4, 0x0

    goto :goto_47

    .line 1257
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    .restart local v4    # "value":J
    :cond_5b
    invoke-static {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->isWhitespace(C)Z

    move-result v6

    if-eqz v6, :cond_80

    .line 1258
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v0

    move v3, v2

    .line 1250
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    :cond_68
    if-ne v0, p1, :cond_5b

    .line 1251
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    .line 1252
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->bp:I

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    move-result v6

    iput-char v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->ch:C

    .line 1253
    const/4 v6, 0x3

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    .line 1254
    const/16 v6, 0x10

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->token:I

    .line 1255
    if-eqz v1, :cond_7e

    neg-long v4, v4

    .end local v4    # "value":J
    :cond_7e
    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_47

    .line 1262
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    .restart local v4    # "value":J
    :cond_80
    const/4 v6, -0x1

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->matchStat:I

    move v2, v3

    .line 1263
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_47

    .end local v2    # "offset":I
    .end local v4    # "value":J
    .restart local v3    # "offset":I
    :cond_85
    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_18
.end method

.method protected setTime(CCCCCC)V
    .registers 12
    .param p1, "h0"    # C
    .param p2, "h1"    # C
    .param p3, "m0"    # C
    .param p4, "m1"    # C
    .param p5, "s0"    # C
    .param p6, "s1"    # C

    .prologue
    .line 473
    add-int/lit8 v3, p1, -0x30

    mul-int/lit8 v3, v3, 0xa

    add-int/lit8 v4, p2, -0x30

    add-int v0, v3, v4

    .line 474
    .local v0, "hour":I
    add-int/lit8 v3, p3, -0x30

    mul-int/lit8 v3, v3, 0xa

    add-int/lit8 v4, p4, -0x30

    add-int v1, v3, v4

    .line 475
    .local v1, "minute":I
    add-int/lit8 v3, p5, -0x30

    mul-int/lit8 v3, v3, 0xa

    add-int/lit8 v4, p6, -0x30

    add-int v2, v3, v4

    .line 476
    .local v2, "seconds":I
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    const/16 v4, 0xb

    invoke-virtual {v3, v4, v0}, Ljava/util/Calendar;->set(II)V

    .line 477
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    const/16 v4, 0xc

    invoke-virtual {v3, v4, v1}, Ljava/util/Calendar;->set(II)V

    .line 478
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    const/16 v4, 0xd

    invoke-virtual {v3, v4, v2}, Ljava/util/Calendar;->set(II)V

    .line 479
    return-void
.end method

.method protected setTimeZone(CCC)V
    .registers 9
    .param p1, "timeZoneFlag"    # C
    .param p2, "t0"    # C
    .param p3, "t1"    # C

    .prologue
    .line 482
    add-int/lit8 v3, p2, -0x30

    mul-int/lit8 v3, v3, 0xa

    add-int/lit8 v4, p3, -0x30

    add-int/2addr v3, v4

    mul-int/lit16 v3, v3, 0xe10

    mul-int/lit16 v2, v3, 0x3e8

    .line 483
    .local v2, "timeZoneOffset":I
    const/16 v3, 0x2d

    if-ne p1, v3, :cond_10

    .line 484
    neg-int v2, v2

    .line 487
    :cond_10
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    invoke-virtual {v3}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v3

    if-eq v3, v2, :cond_2f

    .line 488
    invoke-static {v2}, Ljava/util/TimeZone;->getAvailableIDs(I)[Ljava/lang/String;

    move-result-object v1

    .line 489
    .local v1, "timeZoneIDs":[Ljava/lang/String;
    array-length v3, v1

    if-lez v3, :cond_2f

    .line 490
    const/4 v3, 0x0

    aget-object v3, v1, v3

    invoke-static {v3}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    .line 491
    .local v0, "timeZone":Ljava/util/TimeZone;
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->calendar:Ljava/util/Calendar;

    invoke-virtual {v3, v0}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 494
    .end local v0    # "timeZone":Ljava/util/TimeZone;
    .end local v1    # "timeZoneIDs":[Ljava/lang/String;
    :cond_2f
    return-void
.end method

.method public final stringVal()Ljava/lang/String;
    .registers 5

    .prologue
    .line 122
    iget-boolean v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->hasSpecial:Z

    if-nez v0, :cond_f

    .line 124
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->np:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->sp:I

    invoke-virtual {p0, v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->subString(II)Ljava/lang/String;

    move-result-object v0

    .line 126
    :goto_e
    return-object v0

    :cond_f
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->sbuf:[C

    const/4 v2, 0x0

    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->sp:I

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    goto :goto_e
.end method

.method public final subString(II)Ljava/lang/String;
    .registers 8
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    const/4 v4, 0x0

    .line 131
    sget-boolean v1, Lcom/alibaba/fastjson/util/ASMUtils;->IS_ANDROID:Z

    if-eqz v1, :cond_2a

    .line 132
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->sbuf:[C

    array-length v1, v1

    if-ge p2, v1, :cond_1b

    .line 133
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    add-int v2, p1, p2

    iget-object v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->sbuf:[C

    invoke-virtual {v1, p1, v2, v3, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 134
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->sbuf:[C

    invoke-direct {v1, v2, v4, p2}, Ljava/lang/String;-><init>([CII)V

    .line 141
    :goto_1a
    return-object v1

    .line 136
    :cond_1b
    new-array v0, p2, [C

    .line 137
    .local v0, "chars":[C
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    add-int v2, p1, p2

    invoke-virtual {v1, p1, v2, v0, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 138
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([C)V

    goto :goto_1a

    .line 141
    .end local v0    # "chars":[C
    :cond_2a
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    add-int v2, p1, p2

    invoke-virtual {v1, p1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_1a
.end method

.method public final sub_chars(II)[C
    .registers 8
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    const/4 v4, 0x0

    .line 146
    sget-boolean v1, Lcom/alibaba/fastjson/util/ASMUtils;->IS_ANDROID:Z

    if-eqz v1, :cond_16

    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->sbuf:[C

    array-length v1, v1

    if-ge p2, v1, :cond_16

    .line 147
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    add-int v2, p1, p2

    iget-object v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->sbuf:[C

    invoke-virtual {v1, p1, v2, v3, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 148
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->sbuf:[C

    .line 152
    :goto_15
    return-object v0

    .line 150
    :cond_16
    new-array v0, p2, [C

    .line 151
    .local v0, "chars":[C
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    add-int v2, p1, p2

    invoke-virtual {v1, p1, v2, v0, v4}, Ljava/lang/String;->getChars(II[CI)V

    goto :goto_15
.end method
