.class public abstract Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;
.super Ljava/lang/Object;
.source "ModulusCheckDigit.java"

# interfaces
.implements Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x28ecd18b11e234edL


# instance fields
.field private final modulus:I


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "modulus"    # I

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput p1, p0, Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;->modulus:I

    .line 49
    return-void
.end method

.method public static sumDigits(I)I
    .registers 4
    .param p0, "number"    # I

    .prologue
    .line 193
    const/4 v1, 0x0

    .line 194
    .local v1, "total":I
    move v0, p0

    .line 195
    .local v0, "todo":I
    :goto_2
    if-lez v0, :cond_a

    .line 196
    rem-int/lit8 v2, v0, 0xa

    add-int/2addr v1, v2

    .line 197
    div-int/lit8 v0, v0, 0xa

    goto :goto_2

    .line 199
    :cond_a
    return v1
.end method


# virtual methods
.method public calculate(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "code"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;
        }
    .end annotation

    .prologue
    .line 88
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_10

    .line 89
    :cond_8
    new-instance v2, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;

    const-string v3, "Code is missing"

    invoke-direct {v2, v3}, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 91
    :cond_10
    const/4 v2, 0x0

    invoke-virtual {p0, p1, v2}, Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;->calculateModulus(Ljava/lang/String;Z)I

    move-result v1

    .line 92
    .local v1, "modulusResult":I
    iget v2, p0, Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;->modulus:I

    sub-int/2addr v2, v1

    iget v3, p0, Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;->modulus:I

    rem-int v0, v2, v3

    .line 93
    .local v0, "charValue":I
    invoke-virtual {p0, v0}, Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;->toCheckDigit(I)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method protected calculateModulus(Ljava/lang/String;Z)I
    .registers 11
    .param p1, "code"    # Ljava/lang/String;
    .param p2, "includesCheckDigit"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;
        }
    .end annotation

    .prologue
    .line 106
    const/4 v5, 0x0

    .line 107
    .local v5, "total":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v1, v6, :cond_27

    .line 108
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz p2, :cond_25

    const/4 v6, 0x0

    :goto_f
    add-int v3, v7, v6

    .line 109
    .local v3, "lth":I
    add-int/lit8 v2, v1, 0x1

    .line 110
    .local v2, "leftPos":I
    sub-int v4, v3, v1

    .line 111
    .local v4, "rightPos":I
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {p0, v6, v2, v4}, Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;->toInt(CII)I

    move-result v0

    .line 112
    .local v0, "charValue":I
    invoke-virtual {p0, v0, v2, v4}, Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;->weightedValue(III)I

    move-result v6

    add-int/2addr v5, v6

    .line 107
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 108
    .end local v0    # "charValue":I
    .end local v2    # "leftPos":I
    .end local v3    # "lth":I
    .end local v4    # "rightPos":I
    :cond_25
    const/4 v6, 0x1

    goto :goto_f

    .line 114
    :cond_27
    if-nez v5, :cond_31

    .line 115
    new-instance v6, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;

    const-string v7, "Invalid code, sum is zero"

    invoke-direct {v6, v7}, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 117
    :cond_31
    iget v6, p0, Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;->modulus:I

    rem-int v6, v5, v6

    return v6
.end method

.method public getModulus()I
    .registers 2

    .prologue
    .line 57
    iget v0, p0, Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;->modulus:I

    return v0
.end method

.method public isValid(Ljava/lang/String;)Z
    .registers 7
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 68
    if-eqz p1, :cond_a

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_b

    .line 75
    :cond_a
    :goto_a
    return v3

    .line 72
    :cond_b
    const/4 v4, 0x1

    :try_start_c
    invoke-virtual {p0, p1, v4}, Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;->calculateModulus(Ljava/lang/String;Z)I
    :try_end_f
    .catch Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException; {:try_start_c .. :try_end_f} :catch_16

    move-result v1

    .line 73
    .local v1, "modulusResult":I
    if-nez v1, :cond_14

    :goto_12
    move v3, v2

    goto :goto_a

    :cond_14
    move v2, v3

    goto :goto_12

    .line 74
    .end local v1    # "modulusResult":I
    :catch_16
    move-exception v0

    .line 75
    .local v0, "ex":Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;
    goto :goto_a
.end method

.method protected toCheckDigit(I)Ljava/lang/String;
    .registers 5
    .param p1, "charValue"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;
        }
    .end annotation

    .prologue
    .line 178
    if-ltz p1, :cond_b

    const/16 v0, 0x9

    if-gt p1, v0, :cond_b

    .line 179
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 181
    :cond_b
    new-instance v0, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Invalid Check Digit Value ="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected toInt(CII)I
    .registers 7
    .param p1, "character"    # C
    .param p2, "leftPos"    # I
    .param p3, "rightPos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;
        }
    .end annotation

    .prologue
    .line 156
    invoke-static {p1}, Ljava/lang/Character;->isDigit(C)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 157
    invoke-static {p1}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v0

    return v0

    .line 159
    :cond_b
    new-instance v0, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Invalid Character["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "] = \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected abstract weightedValue(III)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;
        }
    .end annotation
.end method
