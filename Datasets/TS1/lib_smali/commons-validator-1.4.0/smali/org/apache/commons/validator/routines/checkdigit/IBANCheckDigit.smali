.class public final Lorg/apache/commons/validator/routines/checkdigit/IBANCheckDigit;
.super Ljava/lang/Object;
.source "IBANCheckDigit.java"

# interfaces
.implements Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;
.implements Ljava/io/Serializable;


# static fields
.field public static final IBAN_CHECK_DIGIT:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

.field private static final MAX:J = 0x3b9ac9ffL

.field private static final MODULUS:J = 0x61L

.field private static final serialVersionUID:J = -0x31f6734cd39e8ed1L


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 46
    new-instance v0, Lorg/apache/commons/validator/routines/checkdigit/IBANCheckDigit;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/checkdigit/IBANCheckDigit;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/checkdigit/IBANCheckDigit;->IBAN_CHECK_DIGIT:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    return-void
.end method

.method private calculateModulus(Ljava/lang/String;)I
    .registers 13
    .param p1, "code"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;
        }
    .end annotation

    .prologue
    const-wide/16 v9, 0x61

    const/4 v7, 0x4

    .line 108
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {p1, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 109
    .local v2, "reformattedCode":Ljava/lang/String;
    const-wide/16 v3, 0x0

    .line 110
    .local v3, "total":J
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_20
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v1, v5, :cond_76

    .line 111
    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v0

    .line 112
    .local v0, "charValue":I
    if-ltz v0, :cond_34

    const/16 v5, 0x23

    if-le v0, v5, :cond_5d

    .line 113
    :cond_34
    new-instance v5, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Invalid Character["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "] = \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 116
    :cond_5d
    const/16 v5, 0x9

    if-le v0, v5, :cond_72

    const-wide/16 v5, 0x64

    mul-long/2addr v5, v3

    :goto_64
    int-to-long v7, v0

    add-long v3, v5, v7

    .line 117
    const-wide/32 v5, 0x3b9ac9ff

    cmp-long v5, v3, v5

    if-lez v5, :cond_6f

    .line 118
    rem-long/2addr v3, v9

    .line 110
    :cond_6f
    add-int/lit8 v1, v1, 0x1

    goto :goto_20

    .line 116
    :cond_72
    const-wide/16 v5, 0xa

    mul-long/2addr v5, v3

    goto :goto_64

    .line 121
    .end local v0    # "charValue":I
    :cond_76
    rem-long v5, v3, v9

    long-to-int v5, v5

    return v5
.end method


# virtual methods
.method public calculate(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "code"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;
        }
    .end annotation

    .prologue
    .line 89
    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x5

    if-ge v3, v4, :cond_2a

    .line 90
    :cond_9
    new-instance v4, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Invalid Code length="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    if-nez p1, :cond_25

    const/4 v3, 0x0

    :goto_19
    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v4, v3}, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;-><init>(Ljava/lang/String;)V

    throw v4

    :cond_25
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    goto :goto_19

    .line 93
    :cond_2a
    invoke-direct {p0, p1}, Lorg/apache/commons/validator/routines/checkdigit/IBANCheckDigit;->calculateModulus(Ljava/lang/String;)I

    move-result v2

    .line 94
    .local v2, "modulusResult":I
    rsub-int/lit8 v0, v2, 0x62

    .line 95
    .local v0, "charValue":I
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    .line 96
    .local v1, "checkDigit":Ljava/lang/String;
    const/16 v3, 0x9

    if-le v0, v3, :cond_39

    .end local v1    # "checkDigit":Ljava/lang/String;
    :goto_38
    return-object v1

    .restart local v1    # "checkDigit":Ljava/lang/String;
    :cond_39
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "0"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_38
.end method

.method public isValid(Ljava/lang/String;)Z
    .registers 8
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 66
    if-eqz p1, :cond_b

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x5

    if-ge v4, v5, :cond_c

    .line 73
    :cond_b
    :goto_b
    return v3

    .line 70
    :cond_c
    :try_start_c
    invoke-direct {p0, p1}, Lorg/apache/commons/validator/routines/checkdigit/IBANCheckDigit;->calculateModulus(Ljava/lang/String;)I
    :try_end_f
    .catch Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException; {:try_start_c .. :try_end_f} :catch_16

    move-result v1

    .line 71
    .local v1, "modulusResult":I
    if-ne v1, v2, :cond_14

    :goto_12
    move v3, v2

    goto :goto_b

    :cond_14
    move v2, v3

    goto :goto_12

    .line 72
    .end local v1    # "modulusResult":I
    :catch_16
    move-exception v0

    .line 73
    .local v0, "ex":Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;
    goto :goto_b
.end method
