.class public final Lorg/apache/commons/validator/routines/checkdigit/ISINCheckDigit;
.super Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;
.source "ISINCheckDigit.java"


# static fields
.field public static final ISIN_CHECK_DIGIT:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

.field private static final POSITION_WEIGHT:[I

.field private static final serialVersionUID:J = -0x11329007348fe34fL


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    new-instance v0, Lorg/apache/commons/validator/routines/checkdigit/ISINCheckDigit;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/checkdigit/ISINCheckDigit;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/checkdigit/ISINCheckDigit;->ISIN_CHECK_DIGIT:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    .line 45
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_10

    sput-object v0, Lorg/apache/commons/validator/routines/checkdigit/ISINCheckDigit;->POSITION_WEIGHT:[I

    return-void

    :array_10
    .array-data 4
        0x2
        0x1
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 51
    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;-><init>(I)V

    .line 52
    return-void
.end method


# virtual methods
.method protected calculateModulus(Ljava/lang/String;Z)I
    .registers 9
    .param p1, "code"    # Ljava/lang/String;
    .param p2, "includesCheckDigit"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;
        }
    .end annotation

    .prologue
    .line 64
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    mul-int/lit8 v3, v3, 0x2

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 65
    .local v2, "transformed":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_51

    .line 66
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v0

    .line 67
    .local v0, "charValue":I
    if-ltz v0, :cond_20

    const/16 v3, 0x23

    if-le v0, v3, :cond_4b

    .line 68
    :cond_20
    new-instance v3, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Invalid Character["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    add-int/lit8 v5, v1, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "] = \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 71
    :cond_4b
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 65
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 73
    .end local v0    # "charValue":I
    :cond_51
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-super {p0, v3, p2}, Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;->calculateModulus(Ljava/lang/String;Z)I

    move-result v3

    return v3
.end method

.method protected weightedValue(III)I
    .registers 8
    .param p1, "charValue"    # I
    .param p2, "leftPos"    # I
    .param p3, "rightPos"    # I

    .prologue
    .line 90
    sget-object v2, Lorg/apache/commons/validator/routines/checkdigit/ISINCheckDigit;->POSITION_WEIGHT:[I

    rem-int/lit8 v3, p3, 0x2

    aget v0, v2, v3

    .line 91
    .local v0, "weight":I
    mul-int v1, p1, v0

    .line 92
    .local v1, "weightedValue":I
    invoke-static {v1}, Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;->sumDigits(I)I

    move-result v2

    return v2
.end method
