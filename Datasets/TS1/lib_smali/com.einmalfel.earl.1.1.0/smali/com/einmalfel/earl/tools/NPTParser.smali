.class public Lcom/einmalfel/earl/tools/NPTParser;
.super Ljava/lang/Object;
.source "NPTParser.java"


# static fields
.field private static final EOF:C


# instance fields
.field private current:C

.field private currentIndex:I

.field private final length:I

.field private final text:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/einmalfel/earl/tools/NPTParser;->text:Ljava/lang/String;

    .line 25
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p0, Lcom/einmalfel/earl/tools/NPTParser;->length:I

    .line 26
    const/4 v0, -0x1

    iput v0, p0, Lcom/einmalfel/earl/tools/NPTParser;->currentIndex:I

    .line 27
    invoke-direct {p0}, Lcom/einmalfel/earl/tools/NPTParser;->next()V

    .line 28
    return-void
.end method

.method private assertCurrentIs(C)V
    .registers 5
    .param p1, "c"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 76
    iget-char v0, p0, Lcom/einmalfel/earl/tools/NPTParser;->current:C

    if-eq p1, v0, :cond_e

    .line 77
    new-instance v0, Ljava/text/ParseException;

    const-string v1, "Unexpected character"

    iget v2, p0, Lcom/einmalfel/earl/tools/NPTParser;->currentIndex:I

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 79
    :cond_e
    return-void
.end method

.method private digitValue()I
    .registers 2

    .prologue
    .line 68
    iget-char v0, p0, Lcom/einmalfel/earl/tools/NPTParser;->current:C

    add-int/lit8 v0, v0, -0x30

    return v0
.end method

.method private isDigit()Z
    .registers 3

    .prologue
    .line 72
    iget-char v0, p0, Lcom/einmalfel/earl/tools/NPTParser;->current:C

    const/16 v1, 0x30

    if-lt v0, v1, :cond_e

    iget-char v0, p0, Lcom/einmalfel/earl/tools/NPTParser;->current:C

    const/16 v1, 0x39

    if-gt v0, v1, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private next()V
    .registers 3

    .prologue
    .line 82
    iget v0, p0, Lcom/einmalfel/earl/tools/NPTParser;->currentIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/einmalfel/earl/tools/NPTParser;->currentIndex:I

    .line 83
    iget v0, p0, Lcom/einmalfel/earl/tools/NPTParser;->currentIndex:I

    iget v1, p0, Lcom/einmalfel/earl/tools/NPTParser;->length:I

    if-lt v0, v1, :cond_10

    .line 84
    const/4 v0, 0x0

    iput-char v0, p0, Lcom/einmalfel/earl/tools/NPTParser;->current:C

    .line 88
    :goto_f
    return-void

    .line 86
    :cond_10
    iget-object v0, p0, Lcom/einmalfel/earl/tools/NPTParser;->text:Ljava/lang/String;

    iget v1, p0, Lcom/einmalfel/earl/tools/NPTParser;->currentIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    iput-char v0, p0, Lcom/einmalfel/earl/tools/NPTParser;->current:C

    goto :goto_f
.end method

.method private parseNumber()I
    .registers 3

    .prologue
    .line 60
    const/4 v0, 0x0

    .local v0, "retval":I
    :goto_1
    invoke-direct {p0}, Lcom/einmalfel/earl/tools/NPTParser;->isDigit()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 61
    mul-int/lit8 v0, v0, 0xa

    .line 62
    invoke-direct {p0}, Lcom/einmalfel/earl/tools/NPTParser;->digitValue()I

    move-result v1

    add-int/2addr v0, v1

    .line 60
    invoke-direct {p0}, Lcom/einmalfel/earl/tools/NPTParser;->next()V

    goto :goto_1

    .line 64
    :cond_12
    return v0
.end method


# virtual methods
.method public parse()J
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/einmalfel/earl/tools/NPTParser;->parseNumber()I

    move-result v1

    .line 34
    .local v1, "first":I
    iget-char v10, p0, Lcom/einmalfel/earl/tools/NPTParser;->current:C

    const/16 v11, 0x3a

    if-ne v10, v11, :cond_51

    .line 35
    move v2, v1

    .line 36
    .local v2, "hours":I
    invoke-direct {p0}, Lcom/einmalfel/earl/tools/NPTParser;->next()V

    .line 37
    invoke-direct {p0}, Lcom/einmalfel/earl/tools/NPTParser;->parseNumber()I

    move-result v10

    int-to-long v4, v10

    .line 38
    .local v4, "minutes":J
    const/16 v10, 0x3a

    invoke-direct {p0, v10}, Lcom/einmalfel/earl/tools/NPTParser;->assertCurrentIs(C)V

    .line 39
    invoke-direct {p0}, Lcom/einmalfel/earl/tools/NPTParser;->next()V

    .line 40
    invoke-direct {p0}, Lcom/einmalfel/earl/tools/NPTParser;->parseNumber()I

    move-result v10

    int-to-long v8, v10

    .line 41
    .local v8, "seconds":J
    int-to-long v10, v2

    const-wide/16 v12, 0x3c

    mul-long/2addr v10, v12

    add-long/2addr v10, v4

    const-wide/16 v12, 0x3c

    mul-long/2addr v10, v12

    add-long/2addr v10, v8

    const-wide/16 v12, 0x3e8

    mul-long v6, v10, v12

    .line 45
    .end local v2    # "hours":I
    .end local v4    # "minutes":J
    .end local v8    # "seconds":J
    .local v6, "ms":J
    :goto_2d
    iget-char v10, p0, Lcom/einmalfel/earl/tools/NPTParser;->current:C

    const/16 v11, 0x2e

    if-ne v10, v11, :cond_5a

    .line 46
    invoke-direct {p0}, Lcom/einmalfel/earl/tools/NPTParser;->next()V

    .line 47
    const/16 v0, 0x64

    .line 48
    .local v0, "exp":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_39
    const/4 v10, 0x3

    if-gt v3, v10, :cond_57

    invoke-direct {p0}, Lcom/einmalfel/earl/tools/NPTParser;->isDigit()Z

    move-result v10

    if-eqz v10, :cond_57

    .line 49
    invoke-direct {p0}, Lcom/einmalfel/earl/tools/NPTParser;->digitValue()I

    move-result v10

    mul-int/2addr v10, v0

    int-to-long v10, v10

    add-long/2addr v6, v10

    .line 48
    invoke-direct {p0}, Lcom/einmalfel/earl/tools/NPTParser;->next()V

    add-int/lit8 v3, v3, 0x1

    div-int/lit8 v0, v0, 0xa

    goto :goto_39

    .line 43
    .end local v0    # "exp":I
    .end local v3    # "i":I
    .end local v6    # "ms":J
    :cond_51
    int-to-long v10, v1

    const-wide/16 v12, 0x3e8

    mul-long v6, v10, v12

    .restart local v6    # "ms":J
    goto :goto_2d

    .line 52
    .restart local v0    # "exp":I
    .restart local v3    # "i":I
    :cond_57
    invoke-direct {p0}, Lcom/einmalfel/earl/tools/NPTParser;->parseNumber()I

    .line 54
    .end local v0    # "exp":I
    .end local v3    # "i":I
    :cond_5a
    const/4 v10, 0x0

    invoke-direct {p0, v10}, Lcom/einmalfel/earl/tools/NPTParser;->assertCurrentIs(C)V

    .line 55
    return-wide v6
.end method
