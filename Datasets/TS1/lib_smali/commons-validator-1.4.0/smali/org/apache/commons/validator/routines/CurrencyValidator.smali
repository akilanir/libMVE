.class public Lorg/apache/commons/validator/routines/CurrencyValidator;
.super Lorg/apache/commons/validator/routines/BigDecimalValidator;
.source "CurrencyValidator.java"


# static fields
.field private static final CURRENCY_SYMBOL:C = '\u00a4'

.field private static final VALIDATOR:Lorg/apache/commons/validator/routines/CurrencyValidator;

.field private static final serialVersionUID:J = -0x3a4f3a0527798b32L


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 49
    new-instance v0, Lorg/apache/commons/validator/routines/CurrencyValidator;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/CurrencyValidator;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/CurrencyValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/CurrencyValidator;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x1

    .line 66
    invoke-direct {p0, v0, v0}, Lorg/apache/commons/validator/routines/CurrencyValidator;-><init>(ZZ)V

    .line 67
    return-void
.end method

.method public constructor <init>(ZZ)V
    .registers 4
    .param p1, "strict"    # Z
    .param p2, "allowFractions"    # Z

    .prologue
    .line 78
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/validator/routines/BigDecimalValidator;-><init>(ZIZ)V

    .line 79
    return-void
.end method

.method public static getInstance()Lorg/apache/commons/validator/routines/BigDecimalValidator;
    .registers 1

    .prologue
    .line 59
    sget-object v0, Lorg/apache/commons/validator/routines/CurrencyValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/CurrencyValidator;

    return-object v0
.end method


# virtual methods
.method protected parse(Ljava/lang/String;Ljava/text/Format;)Ljava/lang/Object;
    .registers 11
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "formatter"    # Ljava/text/Format;

    .prologue
    const/16 v7, 0xa4

    .line 97
    invoke-super {p0, p1, p2}, Lorg/apache/commons/validator/routines/BigDecimalValidator;->parse(Ljava/lang/String;Ljava/text/Format;)Ljava/lang/Object;

    move-result-object v3

    .line 98
    .local v3, "parsedValue":Ljava/lang/Object;
    if-nez v3, :cond_c

    instance-of v6, p2, Ljava/text/DecimalFormat;

    if-nez v6, :cond_e

    :cond_c
    move-object v4, v3

    .line 115
    .end local v3    # "parsedValue":Ljava/lang/Object;
    .local v4, "parsedValue":Ljava/lang/Object;
    :goto_d
    return-object v4

    .end local v4    # "parsedValue":Ljava/lang/Object;
    .restart local v3    # "parsedValue":Ljava/lang/Object;
    :cond_e
    move-object v1, p2

    .line 103
    check-cast v1, Ljava/text/DecimalFormat;

    .line 104
    .local v1, "decimalFormat":Ljava/text/DecimalFormat;
    invoke-virtual {v1}, Ljava/text/DecimalFormat;->toPattern()Ljava/lang/String;

    move-result-object v5

    .line 105
    .local v5, "pattern":Ljava/lang/String;
    invoke-virtual {v5, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-ltz v6, :cond_46

    .line 106
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    invoke-direct {v0, v6}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 107
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_25
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v2, v6, :cond_3b

    .line 108
    invoke-virtual {v5, v2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-eq v6, v7, :cond_38

    .line 109
    invoke-virtual {v5, v2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 107
    :cond_38
    add-int/lit8 v2, v2, 0x1

    goto :goto_25

    .line 112
    :cond_3b
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/text/DecimalFormat;->applyPattern(Ljava/lang/String;)V

    .line 113
    invoke-super {p0, p1, v1}, Lorg/apache/commons/validator/routines/BigDecimalValidator;->parse(Ljava/lang/String;Ljava/text/Format;)Ljava/lang/Object;

    move-result-object v3

    .end local v0    # "buffer":Ljava/lang/StringBuffer;
    .end local v2    # "i":I
    :cond_46
    move-object v4, v3

    .line 115
    .end local v3    # "parsedValue":Ljava/lang/Object;
    .restart local v4    # "parsedValue":Ljava/lang/Object;
    goto :goto_d
.end method
