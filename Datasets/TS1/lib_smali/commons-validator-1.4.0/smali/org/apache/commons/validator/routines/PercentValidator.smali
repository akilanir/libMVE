.class public Lorg/apache/commons/validator/routines/PercentValidator;
.super Lorg/apache/commons/validator/routines/BigDecimalValidator;
.source "PercentValidator.java"


# static fields
.field private static final PERCENT_SYMBOL:C = '%'

.field private static final POINT_ZERO_ONE:Ljava/math/BigDecimal;

.field private static final VALIDATOR:Lorg/apache/commons/validator/routines/PercentValidator;

.field private static final serialVersionUID:J = -0x30afc7717b77071cL


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 52
    new-instance v0, Lorg/apache/commons/validator/routines/PercentValidator;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/PercentValidator;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/PercentValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/PercentValidator;

    .line 57
    new-instance v0, Ljava/math/BigDecimal;

    const-string v1, "0.01"

    invoke-direct {v0, v1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/commons/validator/routines/PercentValidator;->POINT_ZERO_ONE:Ljava/math/BigDecimal;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 71
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/apache/commons/validator/routines/PercentValidator;-><init>(Z)V

    .line 72
    return-void
.end method

.method public constructor <init>(Z)V
    .registers 4
    .param p1, "strict"    # Z

    .prologue
    .line 81
    const/4 v0, 0x2

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/commons/validator/routines/BigDecimalValidator;-><init>(ZIZ)V

    .line 82
    return-void
.end method

.method public static getInstance()Lorg/apache/commons/validator/routines/BigDecimalValidator;
    .registers 1

    .prologue
    .line 64
    sget-object v0, Lorg/apache/commons/validator/routines/PercentValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/PercentValidator;

    return-object v0
.end method


# virtual methods
.method protected parse(Ljava/lang/String;Ljava/text/Format;)Ljava/lang/Object;
    .registers 11
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "formatter"    # Ljava/text/Format;

    .prologue
    const/16 v7, 0x25

    .line 100
    invoke-super {p0, p1, p2}, Lorg/apache/commons/validator/routines/BigDecimalValidator;->parse(Ljava/lang/String;Ljava/text/Format;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/math/BigDecimal;

    .line 101
    .local v3, "parsedValue":Ljava/math/BigDecimal;
    if-nez v3, :cond_e

    instance-of v6, p2, Ljava/text/DecimalFormat;

    if-nez v6, :cond_10

    :cond_e
    move-object v4, v3

    .line 124
    .end local v3    # "parsedValue":Ljava/math/BigDecimal;
    .local v4, "parsedValue":Ljava/math/BigDecimal;
    :goto_f
    return-object v4

    .end local v4    # "parsedValue":Ljava/math/BigDecimal;
    .restart local v3    # "parsedValue":Ljava/math/BigDecimal;
    :cond_10
    move-object v1, p2

    .line 106
    check-cast v1, Ljava/text/DecimalFormat;

    .line 107
    .local v1, "decimalFormat":Ljava/text/DecimalFormat;
    invoke-virtual {v1}, Ljava/text/DecimalFormat;->toPattern()Ljava/lang/String;

    move-result-object v5

    .line 108
    .local v5, "pattern":Ljava/lang/String;
    invoke-virtual {v5, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-ltz v6, :cond_52

    .line 109
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    invoke-direct {v0, v6}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 110
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_27
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v2, v6, :cond_3d

    .line 111
    invoke-virtual {v5, v2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-eq v6, v7, :cond_3a

    .line 112
    invoke-virtual {v5, v2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 110
    :cond_3a
    add-int/lit8 v2, v2, 0x1

    goto :goto_27

    .line 115
    :cond_3d
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/text/DecimalFormat;->applyPattern(Ljava/lang/String;)V

    .line 116
    invoke-super {p0, p1, v1}, Lorg/apache/commons/validator/routines/BigDecimalValidator;->parse(Ljava/lang/String;Ljava/text/Format;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "parsedValue":Ljava/math/BigDecimal;
    check-cast v3, Ljava/math/BigDecimal;

    .line 119
    .restart local v3    # "parsedValue":Ljava/math/BigDecimal;
    if-eqz v3, :cond_52

    .line 120
    sget-object v6, Lorg/apache/commons/validator/routines/PercentValidator;->POINT_ZERO_ONE:Ljava/math/BigDecimal;

    invoke-virtual {v3, v6}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v3

    .end local v0    # "buffer":Ljava/lang/StringBuffer;
    .end local v2    # "i":I
    :cond_52
    move-object v4, v3

    .line 124
    .end local v3    # "parsedValue":Ljava/math/BigDecimal;
    .restart local v4    # "parsedValue":Ljava/math/BigDecimal;
    goto :goto_f
.end method
